Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5A2A773B3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 07:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130B410E4DB;
	Tue,  1 Apr 2025 05:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9rW0mtN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A0710E4DB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 05:11:58 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VG8GZi031698
 for <dri-devel@lists.freedesktop.org>; Tue, 1 Apr 2025 05:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 y1r0Q6x0yLTab8MbDQMGfrMrTbeTQKCtYurLTk8HHuI=; b=N9rW0mtN6ikW3b1q
 YdPeg/3NeHnBAkCvm/wBzoW8esFhiXJLQSSbCoOPwNqOtbCkAJlfL9g6/TwGN1/x
 thZMT6Ly5Mma/2VJd18PdK1MGibF+XDSmVOGYbj/rPrVOWSM3mmxas0/GGomnb76
 5yHHFn/IL9mzM6qo/5qqh47oqIfQngdQGDW2ltzDlzqbwfbMpx0QODAJpMkecQLu
 pxIo117sxMOgdnIFLJvofBTR7vYyll6mzaIr8Nxy8Fb7ChjA9KBD5fuL8Ugs344+
 yVVgXh/MIOHb0zeiiXccDEMkLEkA2JpzhZsoUpI8PC9TgCVVFM7Y/2e/x5qbnrSD
 GADweQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45qxa7sj00-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Apr 2025 05:11:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5d9d8890fso1121354185a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 22:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743484313; x=1744089113;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y1r0Q6x0yLTab8MbDQMGfrMrTbeTQKCtYurLTk8HHuI=;
 b=dKq78LvQZLD4GidY1c9YAbwW+doRnSP/rkP4VrCu1DA5OGYmAl4TfiZXpcrpCer6t/
 r9T4rUwb+WPPasvjz+2Ds/v8NjsEptSc0p4/Bp2rOLvBgCJ+FW7cFXH+F2nc9QzcNveF
 /KH7t186GSTD6q9ZDnC5ZwArbPc2nPFeRBWL738+GHWHS1RV4u3k5FoGbfILUbUcWnQK
 ojPJmTEtRMGOfD081v1ZlbSRXICmTSZzveVGIUmTCPQqQiea3b41SifYBjKWAe2QZTGx
 klI5CIXS1NstsK4sD+SITkQc/AlFZwNhlSBFC6c1hPMv5MBnJ0ENA++DuKpuCNxWYolO
 sKOg==
X-Gm-Message-State: AOJu0Yy2Q/5Q6CnRylo5tBZNlX9tqOTJk0fIh4ml03tVIIymXt0n/GVG
 4BQm7gAJFi9jSWt/zBW6XjiL3XlY5S+L5CuUyvn/hjR3ftnYwE432Dob5eudaUg14ByXe42wEyu
 fn1x+4dfnoiBknubOaHjLNufIWonf00jv67cIGR3VpOH4HbGCMXmzoDbXLevwlKBlBXo=
X-Gm-Gg: ASbGncvIVABMvXwITJXm4El+qbg2XlUvUVZVioKZvpvnlCo7iwRRzapn/nD7Vj9BLzV
 KMoCVQzVxI04UiH0krjuyhmDrO/pT3UdodAY7EB163sAKSOGVLKrzeuPipP6oE3XWyCXV00G7/Q
 uQtXOnUlZuPyH+oZzSzmFQRQ/hSME71q/TNQeWtNolX6lXp/10evvjLPGWlWbTYPovuV+uDvv5W
 E6ycqdiUyxS42t1LwjpslvCQbwVh7GKWloSdN9F9o0Yq314jSmRnuy8nupplmeQTZ/qovoYCu1h
 QIRMWEWmWrzrm+aYb65H40AFe9FxWWyVeACJAnsetOkVgov/CX1h4Xct6Xp+DySd0gf8DRQ5W+N
 nH21ohvublXmc9w+KW3NlIzJNe0xU
X-Received: by 2002:a05:620a:44d4:b0:7b7:142d:53a8 with SMTP id
 af79cd13be357-7c62b47efbemr1553549885a.19.1743484313156; 
 Mon, 31 Mar 2025 22:11:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3lexU6EBfcncm54A9Kd24CaLpiEaLaaFnAPz5TDD1Kke4bgebndJIyZ/RegXQxIUw0y9c8Q==
X-Received: by 2002:a05:620a:44d4:b0:7b7:142d:53a8 with SMTP id
 af79cd13be357-7c62b47efbemr1553547285a.19.1743484312792; 
 Mon, 31 Mar 2025 22:11:52 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54b095a21b0sm1251697e87.243.2025.03.31.22.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Mar 2025 22:11:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 01 Apr 2025 08:11:33 +0300
Subject: [PATCH 1/7] drm/bridge: analogix_dp: drop extra calls to
 analogix_dp_prepare_panel()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-panel-return-void-v1-1-93e1be33dc8d@oss.qualcomm.com>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
In-Reply-To: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2268;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yoW5522ZzqPZUOVagrebp1jFhYqOlDKf+OwXbxdaN/M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn63WQNdABavZ64pNwjFHAQter1xgT/pdXOsfS1
 AVXUKi4MQ+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ+t1kAAKCRCLPIo+Aiko
 1WovB/4zgZXMr4h83m6nu7k4IPGcuN0P1q3uOAHuxOS3tXLL/Nv6+l7wOGFOE6uQbEjBOiun+Kl
 0FbDiTku/4J17/2Y0QAac2UU59sYQyaC5l1A68yAvFAP4IgGxzJa6fXtxJUad1ioIlybRVWdvF3
 XprgVePJOdYWN/k7oUErLXI87SO2fh6t27aKoCzNLBRViAJbBr9T57KNEG6kgdxF4qZio6EW2Y/
 a5sX7zFCVWGIg7pR1KcMVL3bs/TMfjpQwuq8ZCgPtKbz5ecqY+TS7paVfxxKfviPnpvJLX+AeJm
 g0B2qFPKg3dbztEnUbvgg0qLjSDgGWlmtIfrAtdHtl8cEI6k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Bk39MxgSQCfLXbGlQGhUZHouMQ7KB2og
X-Proofpoint-GUID: Bk39MxgSQCfLXbGlQGhUZHouMQ7KB2og
X-Authority-Analysis: v=2.4 cv=J9Oq7BnS c=1 sm=1 tr=0 ts=67eb759a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=Aj65s_fBnqv-yqA8UToA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504010033
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

The analogix_dp_prepare_panel() returns immediately if there is no
attached panel. Drop several calls to this function which are performed
when dp->plat_data->panel is NULL.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 042154e2d8ccd74ac2dc27fe527e810a50e08a09..ab1cfc340aa95bbf13fe021bd33227b565a5458d 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1005,17 +1005,11 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
 	const struct drm_edid *drm_edid;
-	int ret, num_modes = 0;
+	int num_modes = 0;
 
 	if (dp->plat_data->panel) {
 		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
 	} else {
-		ret = analogix_dp_prepare_panel(dp, true, false);
-		if (ret) {
-			DRM_ERROR("Failed to prepare panel (%d)\n", ret);
-			return 0;
-		}
-
 		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
 
 		drm_edid_connector_update(&dp->connector, drm_edid);
@@ -1024,10 +1018,6 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
 			num_modes += drm_edid_connector_add_modes(&dp->connector);
 			drm_edid_free(drm_edid);
 		}
-
-		ret = analogix_dp_prepare_panel(dp, false, false);
-		if (ret)
-			DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
 	}
 
 	if (dp->plat_data->get_modes)
@@ -1087,19 +1077,9 @@ analogix_dp_detect(struct drm_connector *connector, bool force)
 	if (dp->plat_data->panel)
 		return connector_status_connected;
 
-	ret = analogix_dp_prepare_panel(dp, true, false);
-	if (ret) {
-		DRM_ERROR("Failed to prepare panel (%d)\n", ret);
-		return connector_status_disconnected;
-	}
-
 	if (!analogix_dp_detect_hpd(dp))
 		status = connector_status_connected;
 
-	ret = analogix_dp_prepare_panel(dp, false, false);
-	if (ret)
-		DRM_ERROR("Failed to unprepare panel (%d)\n", ret);
-
 	return status;
 }
 

-- 
2.39.5

