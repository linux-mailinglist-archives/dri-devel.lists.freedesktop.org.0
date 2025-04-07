Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA38DA7E377
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 17:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3280410E4E9;
	Mon,  7 Apr 2025 15:11:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m/6QJy9q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E1210E4E7
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 15:11:17 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dntQ009956
 for <dri-devel@lists.freedesktop.org>; Mon, 7 Apr 2025 15:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SD5Xx7vOEUM/GyGeh/4SwnrwP+CNzq7Qjzti6nJGdWg=; b=m/6QJy9qiIX94tCy
 chZPqrUcLTSgIPyP9rj4v20xQKxxAFcP/8wfVjqhAJzXzusJIxHOeAXEvj8S4gQP
 G3y1dO/FigF3JkxJ+/YeOeP6izkD7L4KCcAnFcKkAwaTTxMKPBBwJnv7pjtH51xu
 RUps2wY1ut/UbHvugVl+nCQ0nZHM6LwqV2S0KxNtDT7dHqHNcnFoVjc6m3oBp63P
 B2JNtVS6QUHOaSjzYXzFDLgeoyiC8tUrcO9K1+ivgPQbOFCMfH51h2nB1wcCtz6C
 8FFXndyau1Q+2GRCVibM4i1YsDiej4SGkXvlmeUsP2LxLSa6LC9IIMZcfIVGos+u
 q7IvnQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm4jr5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 15:11:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5d608e703so803469585a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 08:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744038675; x=1744643475;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SD5Xx7vOEUM/GyGeh/4SwnrwP+CNzq7Qjzti6nJGdWg=;
 b=Ebn2VXTauKsQsmsOm08S7CjlnYhe/QKLhHx2dllIqw60HpzVb9GBDakpoha74eyDCX
 38K/JPR3rdTLpI7xGDB7OD0Tdcrk3kvX15zmpWnG6nNpbpT0IVkXM8HQcfCQ9jbqlbE0
 w4D/+jOfbvBwvIE5QebdRgQR+M9TTxLXppbAKSCvRzpLB55AVsv83nM94j801A2aZr73
 q7Noplusqtr3ePQf0VcHCeHu9Ju0WOkPLfTTrAEfwFhAkrRwt9+W+T16E8YMzrkuyuLq
 WLHqTrne6o9oSSfq7hKRgd4j/MOCz7T4m1Ab81kfjgcr3aW2QViE8ezaHlIavNr6+wyk
 lnew==
X-Gm-Message-State: AOJu0Yy0f2YgqOOKhvAsSxuDmfR2hjiaxbJBo2JnmN/ezzaPR4YvSUGx
 j/g1ixsY4M89hXjE/VnA7oT3ghvo8Yri3gS5nZAI1NI75lXtexRGkOtM3k4RTQdLEa6xkRr3G+1
 JcsHFysBJBmimRG/jjOVaLAp5PqWMc4fN06FBFcI8BeanvvTNCPQT3ON5fDnOlSQStC0=
X-Gm-Gg: ASbGncvOxbC3Iw/S4EYBbpq1WLbYVgKuACc6de5YXbHJMP0UQ93R96nEqal0HBlT0Dm
 stDYRlQ2RP/JZ2fwup/mskSG12HdLdP5n9EuGEtdZKpV5ezzHSY9axQzU1I7gAipE3Iv/miFE+4
 7NXl5OrzDfiGAPxtXF+FxqTpXP0l+GRy1JH004Jx7z83qlXdh2nwTMlcoonsk2Fv9Bm0doeY3fd
 ldaCs6J7AcKLuU2cRbtnG9d96/llHYp1HkESaJhEsVimRSxQOpy6C/iU294JypEmnZQpyL73huT
 hUqt95fkv8b9iQoovn9NIENkRHhkr0ViJUvSHfEXtLK/8Cl/1ZF4ONH7HFfMMn9tuBN4AqeNWGL
 qAYtt+9no4AeD7gOmapIwkmOBTbSk
X-Received: by 2002:a05:620a:46a1:b0:7c5:55be:7bf8 with SMTP id
 af79cd13be357-7c774dd6ae6mr1889859685a.38.1744038675365; 
 Mon, 07 Apr 2025 08:11:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7VhmZeiPqWQSFERVB9I6M4nMOVsDerXUI75MhUVSnlkhzTCnVuqwhozj7Eenae1YuM6/Pgw==
X-Received: by 2002:a05:620a:46a1:b0:7c5:55be:7bf8 with SMTP id
 af79cd13be357-7c774dd6ae6mr1889854785a.38.1744038675026; 
 Mon, 07 Apr 2025 08:11:15 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e635becsm1312572e87.127.2025.04.07.08.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 08:11:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 18:11:04 +0300
Subject: [PATCH v5 07/11] drm/display: hdmi-state-helper: handle CEC
 physical address
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-hdmi-connector-cec-v5-7-04809b10d206@oss.qualcomm.com>
References: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
In-Reply-To: <20250407-drm-hdmi-connector-cec-v5-0-04809b10d206@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn8+sExhDhW6OQi6i/U6Ig8nmUGUTQb0EUoQJDh
 Znh+wSYs2CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/PrBAAKCRCLPIo+Aiko
 1ZHkB/9qYGTNRAzZMq+scTKGh9veyvBnT8RzcuRdK3pnwONnhtgz68KF2uGcxdLTtixRjs/5eXn
 BR9LgdgdQqm+bxHAvbZ4RKuWF6BvyY2juw4hHXv8pMjbwMBLHUxp3NYXA4+sUwZxkh30KyzMcOr
 /AfKBESf4zMF5vu8rzQXXRDmOTt18cg3jjZisl/Wv0KV9C+gs3lJDjvE8q1C/+aolT8JBljpMlc
 v6DmPmNLljFvHLjdfJbj7KJddoQ8j/Ky3daADjrMea5LAJdzMn+/DuOrACp2qdAmZQIREQ/q/qe
 LBEw5q21x/fISaBYyLvKUpCsc54CxcAdWhO1hA4hVzjB+XA6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: Fw2pizp1vyJSF7ZugPhm3sa11_QaQDQn
X-Proofpoint-ORIG-GUID: Fw2pizp1vyJSF7ZugPhm3sa11_QaQDQn
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f3eb14 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=xYQKfNBhK_rbaXl_Bc8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070106
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

