Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F349AD131D
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jun 2025 17:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6309110E048;
	Sun,  8 Jun 2025 15:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PN/V09y1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5D410E05F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jun 2025 15:52:14 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558EOI99028985
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Jun 2025 15:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=boZFxi7Ddh45D8urWAKV+2
 Jls0MVjnq7y9F6R2rPKr0=; b=PN/V09y1o/FgirIo0GDW6xn2JkwvQzTCZYzjO/
 nfwa/vquMsOySdPWIPeBAVCjX170BkviL/+/pknsv8/EHPIh3ia99120r2TThIC1
 Blb53L2q7O7RWO+dT8m6tC7enrbilKVKbi0tDClhuBV+/DZ/GUggh7fecmaSJmQi
 r9EhkmBIN/GbkstopOp3P18m2GMK5Gle86op7vGoQngeoBVbh0qMNmI3vsOnoUe5
 AV07/wiSaIiwbE+Nr76K/dvf6MrqZ5C+moisvsJS+Fk/qcOtCvdHhne2nL6PbpHv
 pMyZ3V9KHLFUhKkJ7SCfw0Az4bBJPX1zHZayIsEXgzwuzFVg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxkddk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 15:52:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c9305d29abso675725585a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Jun 2025 08:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749397927; x=1750002727;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=boZFxi7Ddh45D8urWAKV+2Jls0MVjnq7y9F6R2rPKr0=;
 b=K9VbeJrGO0ZxK0jSg5hd5aYTnP2m+0LchnrCwwvwtau2kC7xyEU8dR+liZfViBAxC0
 /EzUchRV2MmiVpYMoDLCVI6DTgEi5m9ACgGf6/IQnjOa5wMc47cGdk8L5PZqOjt9NFCi
 OZbB7voMXMbG9HqUZE7Ubzngs1QY+5kNzYupeIh7LmK+CRBCmRyc9aWZw9a8PLB+sKvh
 yYRht0yHw0hPR7Xzt0zXXbXePlc2WpsinXntgaY+/q4Mm9i6gDd/iUj8uNZhaQUX/kp8
 JqOgnacDFYlUT0LIwXmNjuJ5icY0G6ILIfcXrLrCgVRvsWeOkTdDpbtg75JUETWWMeHQ
 Gjhg==
X-Gm-Message-State: AOJu0YziLhqW0V2js0StHI/7WIsiyVaW2kWJOqmoElaK8i8gE/nTnQg+
 Q/fjpAkgO+FOhcjFkzlAQA2rsaVlfG6MfzdITzlLyEcHd6P6I/3oMpGyiOWkH/pzTMnCJsyxpYv
 XWEkMXxm1eIDG39U5eK8jC3yEPN2v/dJaW5pIXJAPk5TrdFCJbMvuNe/NZ4f2PtWtD1qHOBE=
X-Gm-Gg: ASbGncsrFsZibElh96HwXZupdWGElg2t2y716U4a67aQc884D1vKEdJUsMxyMalkF3/
 aDWFe7/M+fDqZzzQtxvTuyAL+77P0f36xvUYQwbtcrKA39C3uEFlkmodHMnPlhbB2wcDH0s/8B9
 ZIqMgHid1rQA1OQaZc0NcCCWRXnVOsSdnpUpVruS5ef7zY3S0VTxz8kZc4BgbgtHkFF2U2nWVlS
 0LURqnnLoiwP59ilc9vJOd6yZuysCBAiaW2Iv4TgrqXia/0iTimABzVmdAkIGyLwI5R3nkIpLZG
 5NFFrV24w1tSNPkX6RsXL6dAm9v3+GTPSUZKV8Chta6LbuiO4YH+IXEmPg2AGl+4X0P04u3rC/T
 N0SO9udBHDW2sUF0UFJHMPibM4dPFsNoukkg=
X-Received: by 2002:a05:620a:4413:b0:7ca:f2cf:eb8b with SMTP id
 af79cd13be357-7d229889682mr1366809485a.34.1749397926870; 
 Sun, 08 Jun 2025 08:52:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEP9sj/pKViK1P2M5QiclQ+hkJ6yBVJVUeBZ72zOARopK77awg/D4ihbcFbUOzv33Cm3bqtPA==
X-Received: by 2002:a05:620a:4413:b0:7ca:f2cf:eb8b with SMTP id
 af79cd13be357-7d229889682mr1366808185a.34.1749397926564; 
 Sun, 08 Jun 2025 08:52:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5536772a80csm801827e87.162.2025.06.08.08.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 08:52:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 08 Jun 2025 18:52:04 +0300
Subject: [PATCH] drm/bridge: aux-hpd-bridge: fix assignment of the of_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250608-fix-aud-hpd-bridge-v1-1-4641a6f8e381@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKOxRWgC/x2MSQqAMAwAv1JyNlCXun1FPNQ22lxUWhRB+neDx
 4GZeSFRZEowqhci3Zz42AXKQoELdt8I2QtDpSujW93jyg/ay2M4PS6RvRhDR86Yuild40DCM5J
 Y/3Sac/4AHXAJ4GQAAAA=
X-Change-ID: 20250608-fix-aud-hpd-bridge-97ec55341c4c
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZoAA3vuK/kol5O673dlsy5ItLmK0L4GXKNFdqazixd8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoRbGlXnyYaa+wLYGYQBFyyj7+KhDRSOQ32gbL5
 8GpmF0+75GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaEWxpQAKCRCLPIo+Aiko
 1baGB/0f3R9LVi0bPxXCWU4QLHL44VbMsPlfobciX7JknfLTghj3MojTN2qx3ag2X5awDTFx3Yp
 Gd38oHY2Tc3gd4mcgFbYB/0y4LOfk0p5QZ4R5rlFoU1mUIeT7ZArTrQ3S/9Sab94RX4l9Npxf6l
 GNFGVwV7aH5vOLqJ3N/bR88ToXAk3GQ/Xk2RYb6SdZYzpVujPY90nX916nX3ZcfCbHnoT735usd
 25Yr6NxmxYSxHIHP7GwkOWyDziXGB0H1+DJDTSnOiHt8/xWGQ65Do+A6VzuNDs4FTiQLOvxRF8a
 V7fI1cHuIz8N9ze0X+PQpoSMuDvpUAwYrKwZ/QqnyQIEjJH1
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: W0P8e1bDrDg-SHU-COb4sRt4RshvUuCs
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=6845b1a7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=QisQagpBsXa4eD-aF94A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: W0P8e1bDrDg-SHU-COb4sRt4RshvUuCs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyNyBTYWx0ZWRfX+pXAlevm9nhL
 hjDgd5MtRqdBdJoxnYa3f6FWcMEmuH9hrf7wdoIiVrr92QzJhRVDFBucQmBdRFFnOcGGw32JgOB
 QdryVVZ4mzVhikXKrIN0ldc1nCFhdRYm26kjwEx1ILvke1sqO1mOMGtU9mWV15AkRFHr89wMQAY
 UtiM0N98nan6m/G5fFG57eJfNciLgN8Kqp8+coxR92vjj3xgl67hqYbh33pm6ZO0E+6XfHnmwc/
 LKLz+/9fZvjdHfTBNjYkki1kcu6g/LFCB1NW/idAVESjASjq9rKfueyZSCvf63PqxyBpW/sOO4X
 j0ELcy9E5kP7R88crrYkXnwIrZM8n395En4qLYWNNuguxyboVtWA9yTP5Nb0NvtW93Q9f1oEgdg
 mTjAVM7jpVIN2z05+GC8I0u9daTdhguisjWC/nMDfQsgTUduvGlvMnm3Qifae8bL1f+SieNK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080127
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

Perform fix similar to the one in the commit 85e444a68126 ("drm/bridge:
Fix assignment of the of_node of the parent to aux bridge").

The assignment of the of_node to the aux HPD bridge needs to mark the
of_node as reused, otherwise driver core will attempt to bind resources
like pinctrl, which is going to fail as corresponding pins are already
marked as used by the parent device.
Fix that by using the device_set_of_node_from_dev() helper instead of
assigning it directly.

Fixes: e560518a6c2e ("drm/bridge: implement generic DP HPD bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index b3f588b71a7d7ad5c2ee7b07c39079bc5ba34cee..af6f79793407f400b57f945fc958d613155417ea 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -64,10 +64,11 @@ struct auxiliary_device *devm_drm_dp_hpd_bridge_alloc(struct device *parent, str
 	adev->id = ret;
 	adev->name = "dp_hpd_bridge";
 	adev->dev.parent = parent;
-	adev->dev.of_node = of_node_get(parent->of_node);
 	adev->dev.release = drm_aux_hpd_bridge_release;
 	adev->dev.platform_data = of_node_get(np);
 
+	device_set_of_node_from_dev(&adev->dev, parent);
+
 	ret = auxiliary_device_init(adev);
 	if (ret) {
 		of_node_put(adev->dev.platform_data);

---
base-commit: 4f27f06ec12190c7c62c722e99ab6243dea81a94
change-id: 20250608-fix-aud-hpd-bridge-97ec55341c4c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

