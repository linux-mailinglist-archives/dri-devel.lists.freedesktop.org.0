Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CDDABA7A8
	for <lists+dri-devel@lfdr.de>; Sat, 17 May 2025 03:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3ECD10E2C9;
	Sat, 17 May 2025 01:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bxfy041P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A0010E2C9
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:54 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54H0KRmG025910
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SD5Xx7vOEUM/GyGeh/4SwnrwP+CNzq7Qjzti6nJGdWg=; b=bxfy041P5CpxGH9X
 Bv4LastnoPZGJTjFgJ+g3LyEp0mZApbuWOqfkIHrfsEYcxL9wtWbM8za5NxoNZg4
 tLYfxjz3MURGrHBcfKnpkrTLZF9ZobLD0oVyCN4mAr6xjabkVgH0FkdmwpjvNazl
 W6OlsVTtmmOJCeEh1e2BNce4g0Wd/NF2yNb57ISWj6XlZI3Ls94NIHeNMYRnY4gv
 vQl5UmNdfrrbzsmJSVcIzKTge16CfzGzImxPFAIhxOD6IVTdvWHtxY6KcJ/aQB5M
 eNdyDtGnbSwTqXPfPAw6QQGRldPa9HQJAOpiQLmfinVYQfog8QAXGegIkPa8i5ll
 vMjh5w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pftq040k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 17 May 2025 01:59:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5bb68b386so779572685a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 18:59:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747447193; x=1748051993;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SD5Xx7vOEUM/GyGeh/4SwnrwP+CNzq7Qjzti6nJGdWg=;
 b=vkGa9H8k9YjKH7B43L81IL0iDBBsnGb6AL58GH7y8col3EoC1mClE3aru1dYTOql4r
 lwgUp3bFlomW2vt+/E3g4WmkMNz3Ifu7uv0QmI9+V+zVo5onzBOki8cawDl76yYjDNja
 4yqmSL0wI6rejfnT+WF52C5uU+eO6q2YOzAxIf4hrQeqsQ0gnuYlTauCwIKqTXzw7FJT
 +azCThl2Chj8Tlpuk0JXpOF4ylyogQkWZZJq2EPBv0wca3LdRERyyrEGq1OONKi9Xk5K
 c3Rj7vc/eLf2u4F+ZrZeOwWPcjGDwpIrGbmfITXLx1Amn1Kv5fSy27qca6cWT6Hl9EEC
 +Gyg==
X-Gm-Message-State: AOJu0YxsLq2UqGfoqaU/cCfaPVBOZ4GyvVwccNNhjSiDgfHp/zuQW6mr
 +UyGustAa/l9+9EJ1h9VGAFd+sw7R3ZJOWgPYfkrhOXsOjpjZw/aMCLaIZfKYRLV6jz/ZYmNRYD
 HUN7Nu9HpRjMR6GmNS9ovkviYhDY3ke4Lsw8cQn/H8xOqNq+mTHnNERSGGSvqdOyXCy0hStk=
X-Gm-Gg: ASbGncvjt5qI6V2wa4Nc2BeSYwGrcAludcCmm8xp0URPw2uki2JUXYMTUORjYPAvjaq
 zS+vccZL/0LX25GKleihLcbgDF3sOUwJwIzSrTKR2u/vnqsPeU0uqY111FQuV26DLQCmBHYzLYf
 rINhO+sTKvsGKd7JL/aphVdvjg1qpN+MCod3I9Ik7ozq5I/KIlEolvPPI49hrMPfhRFXTOFxJ99
 RCt//RyOeYrKxeAoGjMCUyVal+oLsph2+B6va7U1M9YWRSrrMPQKIS4gaEUaN9fhP7jIHuOc6Ih
 PFAdYAktf49w6hQhE1C8uLKwAXOsaIpbfbM6oRhqGyBQmAVTwXq/evws2y4ShTNDWMsXMaixuXG
 tQe1VwTUn6bhgBUwFk98rNmZC
X-Received: by 2002:a05:620a:2989:b0:7c5:ad99:9e38 with SMTP id
 af79cd13be357-7cd47fb1ef8mr613005085a.43.1747447193277; 
 Fri, 16 May 2025 18:59:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVRxbvmsaezHoPorAioz8tk37MPhQLozBhorB8+3KjD71P7UkiRrOmavX9pc6TUp2GZjXSrQ==
X-Received: by 2002:a05:620a:2989:b0:7c5:ad99:9e38 with SMTP id
 af79cd13be357-7cd47fb1ef8mr613001985a.43.1747447192929; 
 Fri, 16 May 2025 18:59:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e70180f7sm672167e87.128.2025.05.16.18.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 18:59:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 17 May 2025 04:59:42 +0300
Subject: [PATCH v6 06/10] drm/display: hdmi-state-helper: handle CEC
 physical address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-drm-hdmi-connector-cec-v6-6-35651db6f19b@oss.qualcomm.com>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
In-Reply-To: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1880;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rpC4/Fp1Jm1yKyuARzvQoHZlvtt/ApP11arkSl2v3Xg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoJ+2LcN5UYS0GlUCtFMbbK+13kvgJBdUYbxpPt
 moiU+EvNBSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCftiwAKCRCLPIo+Aiko
 1eP9B/9yrrAqJmrcCxNQRqpNPsrz7qJpKM0CLmPCcvrDhUdEMgf1owKQ23/2bM2xOdQlTKWgCu0
 DGotpO5h9SLvA2Jvbcx5PxKZrEYR2owiXVu/DxmUbJdCFqF7fXpYpd8btVv0EEihZ8wJfn5vX/+
 OQFBEf/Sz5/u80ap/fS0XG4Zzr5CWqwd20zrVVlJaIvXqTZlmmn1gwZctElF2NsGZvA7Ht9zWF0
 G862X9APgAaCZO70M+uMK5lqF5BwvHQbLQkeWCSMWW7qU1l23H+bGBS5+sINWslB6FRBC7tYYM4
 Lgdm3e0tI3bBR4wis4j20M5LIv+oxtYggmhRCklX/Nwk8tag
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE3MDAxNyBTYWx0ZWRfX8Xag18TRsJI7
 L5eJMlDYOXVrtjJNCmkg9NpYU2fFdGpjp5iFT3osKSFnIMbTAyxYRU3wmJDqxsDJWypZ5AoXulR
 II+f5++KUVCGRY2xsjTyqqoz6/FheqAMyGpOPk2FC8T0RDC+2SMArqoEPAiP/k5i6ektGqq966o
 X67t6m6mrGwb6MHlDeBKy6vC793MLX0ecoi05ALAzk6P/5kVdiO6KK1hXbKc3XX7bVMwPkRYlUj
 8mS0Wuln8qWTSXDpIPiaYjOJOkZsZOSJzWkLnL+BLLP0dett3/W9AcAUDTXSjNYcBJtcoNTysJC
 jniLvYHR8YQd0Zbn67+Z0ZwUKZvO/1VN3WGDQbdZ+l+MOJXP4QItbrOAq5i/HQBnSNh+OhYCthf
 aWTpR9LntUXTFpk6mJogp+yYPYyC51QiWlsEhfzHiXy/13GPeMF0zb/UpYxPnABJKBQQ6lIb
X-Proofpoint-GUID: T8mHE3HjuKzENmOEHlphjfWJCkzM_lca
X-Proofpoint-ORIG-GUID: T8mHE3HjuKzENmOEHlphjfWJCkzM_lca
X-Authority-Analysis: v=2.4 cv=Ft4F/3rq c=1 sm=1 tr=0 ts=6827ed9a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=xYQKfNBhK_rbaXl_Bc8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-17_01,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505170017
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Call HDMI CEC helpers in order to update physical address of the
adapter.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index d9d9948b29e9d5ef9bc9cc9108b3ace4aca2e3ae..bae7aa624f7db61cc7d5ff7a86a413938963543f 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -6,6 +6,7 @@
 #include <drm/drm_print.h>
 
 #include <drm/display/drm_hdmi_audio_helper.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
@@ -1081,9 +1082,10 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	const struct drm_edid *drm_edid;
 
 	if (status == connector_status_disconnected) {
-		// TODO: also handle CEC and scramber, HDMI sink disconnected.
+		// TODO: also handle scramber, HDMI sink disconnected.
 		drm_connector_hdmi_audio_plugged_notify(connector, false);
 		drm_edid_connector_update(connector, NULL);
+		drm_connector_cec_phys_addr_invalidate(connector);
 		return;
 	}
 
@@ -1097,8 +1099,9 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
 	drm_edid_free(drm_edid);
 
 	if (status == connector_status_connected) {
-		// TODO: also handle CEC and scramber, HDMI sink is now connected.
+		// TODO: also handle scramber, HDMI sink is now connected.
 		drm_connector_hdmi_audio_plugged_notify(connector, true);
+		drm_connector_cec_phys_addr_set(connector);
 	}
 }
 

-- 
2.39.5

