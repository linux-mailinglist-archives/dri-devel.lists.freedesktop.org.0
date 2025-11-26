Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4EBC8987A
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 12:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36A110E0A0;
	Wed, 26 Nov 2025 11:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PpmwHC3m";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1kTzTAR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DE710E0A0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 11:31:28 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AQAvbLh3706613
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 11:31:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=VyowLPceAkmOl9z2WIW4UO
 5fTAlBUcjruVqVIBMzzC4=; b=PpmwHC3mRA5RYC3JiT/rqayHYIL6bOPA6oG9Uq
 pFq0zEgk/VryooO40uonIsl6H46C2ueeEtVA1SxkL1BprNAWzL9bvaNq3BdxDvPg
 rLynDbWunPqkuag5Yw0RYGiQk/Ga2krzl5S6b8f+LgDJO7AusW9o4lLzlgh6zjoa
 ZoUhtfpZX8qZt24gmetAYaPNO2GAdjBwRac0wuVZ/Q66Ph7Jsp2HOHnnonjYSYA1
 81qjN0RlD8Ju/kueCN90LTXS1zzBlAIgvO2UCOvDrhZQw/OwuUPbehTzmNOqja/0
 QGfssQiYCfMOCZqMkTgvgep5+7zmo116G5xhzY14lKlElPEQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4andufu8eg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 11:31:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-340d3b1baafso9991214a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 03:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764156686; x=1764761486;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VyowLPceAkmOl9z2WIW4UO5fTAlBUcjruVqVIBMzzC4=;
 b=X1kTzTARzp5iuB40lsoDIF57EquT8+5tivbnIHx1Rl9alLsoXs0ErKKR58brZOI6Hr
 m/wIwspss5kLGMktnImTgS2f6C4DWrs4aK83UKvxvlNXRubJ+JnHhB38LgKrenBV9+9P
 hb47FTvUgeiN6yFtlSLIJP8jbxoSwUGRTgP/ZxVe5FGVFEfX7RkTMgE5e7FeYfHuzmtW
 wzqt18vx50hJhc9AI9NzKmzk0r2Ho9D/E/Nd1JjQ2VUOoLVMN1PibRG8rrQswnxH0pI+
 A1Z34CpaT1NgpZQSPvYb8zHqXy5obpslMMXLEMwbU39aWofqnED+nnOEKL9HIj2tt13a
 q/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764156686; x=1764761486;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VyowLPceAkmOl9z2WIW4UO5fTAlBUcjruVqVIBMzzC4=;
 b=VyrqwlzCFm7alnSMVUyzRfYnnFk22Kssne7hi9LRnYZohoEMEjGDdwF7T9rUdui+kp
 pOC5J2UoUNPixXb4pVjribFZHKniQIFVZQ8eJ4DsmTOyHH797Sr7xdmAEl21WPq3EybI
 UoKd5+3iI7WkEmNROjyq230c1y5JAzRtp1vK91i/Qhp/OS1DeB0lkyfYwYLr8BjfRzPc
 jHpuRF29HY/tjJeLNRgnMF5AFXw3HXcnYHH2U1w61mb6m8isMfJzw4DGRATWNu5cz0Wz
 qyiKfkRaNSi7dbmw6q1+ykxFkxqDGBRfqHL29y0Vp6XLmaxeiuveEoma/2bPD+hZB94m
 N3kQ==
X-Gm-Message-State: AOJu0YwOkZZTyPQp9igMdHtpI3yDbHkqxPOEe8thvG9Pjwd2l60vjCtS
 L+PZ+O3ch/K23Gdzu1Io0LT9IKsUPliBslLQP88I22UyLBdy3XJNupn3LIxs/R0iBLxTmlEonwQ
 K+wmEF763/D7Ag9glgZ1+Q9qbjwid5mRRMQbVoNJyFPBWNr7T0p4e9r+yIFielFBFot4kfg==
X-Gm-Gg: ASbGncubm/yP6eD9IiQ4lgF4m6UapvGhirvsEgZ3pwuvwWKxIkLdC/0TpVlzBYI7E6O
 BuWZH5Dia5ZzY1itlSHlP7NxaTLbPBt0ttXQSkwKfaGpiDDWXHeJvhCDFxSJxEA2AaU72UqbOX0
 1Uf3VRk2+nLX9QbM7XdzrRN/YzuyiTguqwNSneLbTN22JZV7egau0So/fudRIrROZ0rBkt5y4XB
 ihl31ByDAL89AzdkvVh85dj+OVx0kJEVMkFDE7+sIS5Qx9kXvm/Y4lC+T+eyYRqOK1Bn5zAzC9o
 pcID0YxUadiQn+quZHtgYsgfg6/Mt6X/h/O1KPCwn/PcKp/WscvkfJL+8qF5nfhJBy4y1u7WlL2
 m1BZYZQSalgGWqRq0cQzfS01in1j8H8FoFbU=
X-Received: by 2002:a17:90b:4b8c:b0:340:c4dc:4b70 with SMTP id
 98e67ed59e1d1-34733e4ce95mr19705585a91.6.1764156686179; 
 Wed, 26 Nov 2025 03:31:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+Sf4Emak+170hYfrricrc6PmnmzWlbffLYOfWLmO3/5Ckawz966hS0RIlHi45mma75Xch8g==
X-Received: by 2002:a17:90b:4b8c:b0:340:c4dc:4b70 with SMTP id
 98e67ed59e1d1-34733e4ce95mr19705551a91.6.1764156685657; 
 Wed, 26 Nov 2025 03:31:25 -0800 (PST)
Received: from hu-nlaad-hyd.qualcomm.com ([202.46.22.19])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3476a59444csm2368562a91.8.2025.11.26.03.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 03:31:25 -0800 (PST)
From: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 17:01:18 +0530
Subject: [PATCH v2] drm/bridge: lt9611uxc: extend mode valid checks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-lt9611uxc-modes-v2-1-34bf9b351921@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAXlJmkC/2XMQQ6CMBCF4auQWTuEGaSIK+9hXNQySBNKsQVCQ
 ri7jQs3bl7yLd6/Q5RgJcI12yHIaqP1YwKfMjC9Hl+Ctk0GLrgiYoXD3CiiZTPofCsRO1NzeS6
 VrgqB9JqCdHb7Fu+P5C54h3MfRP86Rc3VX2clJFSayiddqOG6vfkY8/eiB+Ody9PAcXwAwpqgl
 K8AAAA=
X-Change-ID: 20251126-lt9611uxc-modes-fc723436a50e
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
 Nilesh Laad <nilesh.laad@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764156681; l=2557;
 i=nilesh.laad@oss.qualcomm.com; s=20250718; h=from:subject:message-id;
 bh=bun+WIKswpzQbeNQnc7QI0dltmTY2RAc6HqNsm0a4y0=;
 b=IpyQdfNccwm8lGijrFdK4kNiGEaDtPLjs230Lckp7vUaY5HV/zDeEBrMNsl8Zwv0Ac669aym3
 1pZ2fSjw0dNDg1GQw1ugdFM14vGL8PdFw8F8oXUtA97voVK+rBp9Anx
X-Developer-Key: i=nilesh.laad@oss.qualcomm.com; a=ed25519;
 pk=MjLHvGipC16awutyYh0FnLpT1nPxL/Cs1dCevHMrrD4=
X-Authority-Analysis: v=2.4 cv=C53kCAP+ c=1 sm=1 tr=0 ts=6926e50f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XkeAo-KRTqvWKc-2E_EA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDA5NCBTYWx0ZWRfX8BfWk8NG1amE
 fscVNisWuAfHBuA3sNO73eUKMZ2gj9i6saYMT7lVsRkGeHgqq55/0GATval2QkiPINYDhoQjTcf
 ElkvwcdFmd0kA0UMjFRU58lyZxIHl4FBcO4enqSAvymdiuM5mQmQ6WS1inT3xFz1GzXzAIRDHPi
 TWtyDy1NyLGeH4K9ghIbEKR4QAScf2cBx+Lv5VTPAwIRIy9DzWii6Vn6QGc7ZFfIyugh5PvsB4/
 iIfpiJoEefLdnuWTR5r0bS3HTprHD3MEPX3seeeNvNwrSMPKVXZUhIdkeQepBP+4xWhlvJ97ClN
 2IWJkSAVxSlA1hrNVCVh5fQQBsbWz/Dw93fh/4jmwGPUMXVNFIiZ1i3gC8MxulxUKUumuCR92oT
 EZ+UO63qGkztTEvTPFxYd4uvGYI5xg==
X-Proofpoint-ORIG-GUID: jvRPCNcPo8aHZJA-01LHkCj1et8PHx_c
X-Proofpoint-GUID: jvRPCNcPo8aHZJA-01LHkCj1et8PHx_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260094
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

Currently valid mode checks are only for hdisplay and vdisplay,
add htotal and vtotal to filter only specific modes.

Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 36 +++++++++++++++++-------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index 38fb8776c0f4..cfe389b4c25c 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -89,7 +89,9 @@ static const struct regmap_config lt9611uxc_regmap_config = {
 
 struct lt9611uxc_mode {
 	u16 hdisplay;
+	u16 htotal;
 	u16 vdisplay;
+	u16 vtotal;
 	u8 vrefresh;
 };
 
@@ -98,22 +100,22 @@ struct lt9611uxc_mode {
  * Enumerate them here to check whether the mode is supported.
  */
 static struct lt9611uxc_mode lt9611uxc_modes[] = {
-	{ 1920, 1080, 60 },
-	{ 1920, 1080, 30 },
-	{ 1920, 1080, 25 },
-	{ 1366, 768, 60 },
-	{ 1360, 768, 60 },
-	{ 1280, 1024, 60 },
-	{ 1280, 800, 60 },
-	{ 1280, 720, 60 },
-	{ 1280, 720, 50 },
-	{ 1280, 720, 30 },
-	{ 1152, 864, 60 },
-	{ 1024, 768, 60 },
-	{ 800, 600, 60 },
-	{ 720, 576, 50 },
-	{ 720, 480, 60 },
-	{ 640, 480, 60 },
+	{ 1920, 2200, 1080, 1125, 60 },
+	{ 1920, 2200, 1080, 1125, 30 },
+	{ 1920, 2640, 1080, 1125, 25 },
+	{ 1366, 1792, 768, 798, 60 },
+	{ 1360, 1792, 768, 795, 60 },
+	{ 1280, 1688, 1024, 1066, 60 },
+	{ 1280, 1680, 800, 831, 60 },
+	{ 1280, 1650, 720, 750, 60 },
+	{ 1280, 1980, 720, 750, 50 },
+	{ 1280, 3300, 720, 750, 30 },
+	{ 1152, 1600, 864, 900, 60 },
+	{ 1024, 1344, 768, 806, 60 },
+	{ 800, 1056, 600, 628, 60 },
+	{ 720, 864, 576, 625, 50 },
+	{ 720, 858, 480, 525, 60 },
+	{ 640, 800, 480, 525, 60 },
 };
 
 static struct lt9611uxc *bridge_to_lt9611uxc(struct drm_bridge *bridge)
@@ -237,7 +239,9 @@ static struct lt9611uxc_mode *lt9611uxc_find_mode(const struct drm_display_mode
 
 	for (i = 0; i < ARRAY_SIZE(lt9611uxc_modes); i++) {
 		if (lt9611uxc_modes[i].hdisplay == mode->hdisplay &&
+		    lt9611uxc_modes[i].htotal == mode->htotal &&
 		    lt9611uxc_modes[i].vdisplay == mode->vdisplay &&
+		    lt9611uxc_modes[i].vtotal == mode->vtotal &&
 		    lt9611uxc_modes[i].vrefresh == drm_mode_vrefresh(mode)) {
 			return &lt9611uxc_modes[i];
 		}

---
base-commit: e20c6260474c45f66c636a50d5b8801759ffe09e
change-id: 20251126-lt9611uxc-modes-fc723436a50e

Best regards,
--  
Nilesh Laad <nilesh.laad@oss.qualcomm.com>

