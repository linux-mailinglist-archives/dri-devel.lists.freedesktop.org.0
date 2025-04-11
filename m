Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC37A86158
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 17:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E47E10EBF1;
	Fri, 11 Apr 2025 15:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YoUEpqai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A42A10EBF1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:09:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BF05s4019674
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=qCx474zg+gRG9r0QQhmy48
 y4oCjrPMkNnKl2QPq/ypQ=; b=YoUEpqaiVUscDy05vNnl/aVzS7yqwkhAyY+Kyr
 ev+xSZSAFpAlbRYa7+lySu/vLHCkvAcbs+6x8D7azKjhheES8YW+1vMB8TLupnAQ
 u+BmZf1Subsw4encFjskDpF+xY0w+iuH+ifuAbuzSzV5zfjEj/stboc7xcbSUBwh
 uFDUwdacv2u+DEmHpSMb3KaYhUXAxkDhUMppV3L8VPS/VwUfWpk/scdrk5tR03Ma
 3d6+ZTyjUKqeoGRlzv91MuDmqHyrDupK4whm4/TPRQuvC4vCECnuy/n/jiA/xwSf
 UHy2NxId0BmgEVGC5MjnmS6k+G5piuf31NzIBThkGGnWOE6A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrtx5t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 15:09:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c572339444so287167385a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 08:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744384192; x=1744988992;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qCx474zg+gRG9r0QQhmy48y4oCjrPMkNnKl2QPq/ypQ=;
 b=hZdUTaA4K4jx/vvVe+SSGzZo5tth7TsHO3Bc6l+6ajk4MPAIfdS8a801/BLPdn+JKb
 Cd/mTwswfUDzTrftATr0sLbFlm/RMiXn8wysJ0whiKmGi3rlAZrzsVVVfYvWIPUW4XN6
 PhoGpu31QfaHppQN9CYbK9UBFRjoBYOPQV5T8QIAcrnAmmE4vE090vn2JNS6q2xKDmkG
 LEFpma/XULFVpMDoqqJttJXMMYgGIVS9bBVVW5ymOkRG/zP17XGe3g3SUQ6sNPOo+eBZ
 452eHPodv9AVAh/edVAOAQafYL4p8VEbJL5lUF8haixrrlSagm5kGPyix6jMlWcLnS/Z
 L94Q==
X-Gm-Message-State: AOJu0YxP1zNW0Skt9aSNAOsKkcPKHyRVeRiLuCW3krSETXE2wki0sWJb
 GSe9XaEa7h5hBvzpR0lZyUIkw9+WMHqObvtUulfgAZ9GhMJ/w3lr798OMUmLnWYrYGpngGkTLIz
 Ijtig9Wn+LkCyU4jsTyn/QuP2gngayljG/1WhKVYY8xl52tAQ/kWPjWR8h83uYT+Y8Mg=
X-Gm-Gg: ASbGncsUi85L7c+dycNfITzE9MfKvaUJ6IYvxZJis6hkuFlv3BvbcZZMOmlJtV/TvLP
 ZTZdHBJTUf+VYQH62EoQVMouSyBgyRp/TV5PblLhhMgRttuW1hmq/iPoY0BFAehsWRZSaFP7QkL
 IoivAKi4pquBfE1k9zYsjzT17yY6OYTtiMSEPde0yeJxiJaFIZ7jaPOmrOfZmJO9grPs0V8bcLA
 NAY1nTAkBYimgKC1OlzIy5perdOKVJpKF4FXnBJ16THbejH5iBgkjeHDm3gNNJb9JlmpShb4bBK
 s46Scuic1hWSzXGFqKN/YjdbcOLQLWXyrPBIHVYz08EHc3EOYKc+iUXHUCdjHG7D7b/v3HeT9aS
 fVdTXyT+FkzGhRlESMsKEnIUm
X-Received: by 2002:a05:620a:172b:b0:7c5:79c6:645d with SMTP id
 af79cd13be357-7c7af0be2b0mr461744185a.11.1744384191881; 
 Fri, 11 Apr 2025 08:09:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuuSqQiZ2wA9yFVtwoe+Beqyb/amFT8pvES/rx5a6aUv6g++Zs3c65GUZuFUfPy2KUBMvWBQ==
X-Received: by 2002:a05:620a:172b:b0:7c5:79c6:645d with SMTP id
 af79cd13be357-7c7af0be2b0mr461740185a.11.1744384191556; 
 Fri, 11 Apr 2025 08:09:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f4649d668sm8500671fa.1.2025.04.11.08.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 08:09:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 18:09:40 +0300
Subject: [PATCH] drm/bridge: select DRM_KMS_HELPER for AUX_BRIDGE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-aux-select-kms-v1-1-c4276f905a56@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALMw+WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0ND3cTSCt3i1JzU5BLd7NxiXQMLMzNDiyRLoxSzVCWgpoKi1LTMCrC
 B0bG1tQB4NeKtYAAAAA==
X-Change-ID: 20250411-aux-select-kms-086618b92d6e
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1086;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MxiJCcho0/Rr64MZ6DIED2AkTMAEhF6oxTq+w6kONKw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn+TC+zljhucnUZhCHWmFzeF5ZLcZz7p4wojJlz
 Bg3R6x+rdeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/kwvgAKCRCLPIo+Aiko
 1aORCACE4R7SDi7c+RvBx+ZjEja8TKtuorDMUrvQn3n2VB6F7rbnyBAnAvLhIS0OhtvqMgqAGQs
 j/6DQcFhc8HakhtAfV81iID0yC7blr+ugU4OgnoqtdEYgK9qpoO8UP9RTKAZxBXp81/q+Y5JsLq
 xpNfLnB9/UUPpwf9Qo5D2x1PorNwsxyj8Bdz8a5ervdbhWxbIzJMzYE0bnADdXtOaKqnUXJtOwr
 xFbBWDdPTD6DNgUFpH2oXlR5Q8Zao2O0c66ruIEso0Fnb8tiXbUVmR6nJ6enWXXay0UtAVYd6uu
 Npx57xEz5cFQZ/qTxnt14n+EbJUWukUc3diS/YWXjNZ6HP+b
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: dKKJbxM-aSMZNE4PVNU8mMnjdJ21Y-le
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f930c0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=rdcceDu8vI1PwB8RAZkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: dKKJbxM-aSMZNE4PVNU8mMnjdJ21Y-le
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=909 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110095
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

The aux bridge uses devm_drm_of_get_bridge() from the panel bridge (and
correctly selects DRM_PANEL_BRIDGE). However panel bridge is not a
separate module, it is compiled into the drm_kms_helper.o. Select
DRM_KMS_HELPER too to express this dependency.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 09a1be234f7173bdf88e385507bbe5e5c6d583a6..b9e0ca85226a603a24f90c6879d1499f824060cb 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -16,6 +16,7 @@ config DRM_AUX_BRIDGE
 	tristate
 	depends on DRM_BRIDGE && OF
 	select AUXILIARY_BUS
+	select DRM_KMS_HELPER
 	select DRM_PANEL_BRIDGE
 	help
 	  Simple transparent bridge that is used by several non-DRM drivers to

---
base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
change-id: 20250411-aux-select-kms-086618b92d6e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

