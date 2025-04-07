Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A45A7E373
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 17:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C0810E4E4;
	Mon,  7 Apr 2025 15:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtYKFlaJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F72F10E4E2
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 15:11:12 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dqs5001336
 for <dri-devel@lists.freedesktop.org>; Mon, 7 Apr 2025 15:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 xflavmtVh4q8rGYItZ9o3me1DVh4JFCOvPJG7ZB1LlE=; b=JtYKFlaJCYl92nms
 E2iKJnx7+leySBG6WUwB3yN2lvYn/uKlXmRag3byOgYkST73BVxZHRCaVYffiwwW
 /6BLqdbcT68LHAv8mVF5DSJ8eTtjSuDQcYGEu0+UKrcHyHdYxXfylcH4L1W4rIte
 cinW5jlLYIjsv/kqgDMKZP1xK+jaC++1hdHWZ4mKCnpKui+s/08vfm5vaeNLkGFs
 tiyGb5EEkogEZrc+f10D/Is/V6yS/2HqQiMSpAUzbHoKVlmE5TvTKKvjPmrgk6CM
 BpeAh12P1AQ0cQ4dS/6ADCSkjLGGUbTK5AB0zLcTpzucQWm2ggxIbW9pp3VjBrv4
 XgGN7g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkcjua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 15:11:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5f7210995so809256185a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 08:11:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744038670; x=1744643470;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xflavmtVh4q8rGYItZ9o3me1DVh4JFCOvPJG7ZB1LlE=;
 b=q5WcVni0NGSzekN1qn5WhBZFGlHkvIKCrhUXXzcWiUDJKtcJQsQFo/ytuMrI6HAhEY
 8GuTUlFdnG8Rbmoi4+wUe4losEk9CdLsizAqYbEwKPsqvLxWUkuw1t7BtJJtTDGIVS86
 YEIeObZZd8Ms6lgbzW7AcRN9TRjuYe0qAPX4XivbgCGWImsE5OxeOpOITvI9B3fREIQ6
 pNYGIBC1/gnWsj07ROzfg4hFZfntdfOxf6Z2lbQt1XGn+m/ayjRF9VN+2qAUFDQFAHcL
 FrkkGtNwjPJ+29bWwI8SGy6Q7aEsOoakyORJW90RbmSxxPWsK6OiEEAji9n6VslaiRjj
 i1qg==
X-Gm-Message-State: AOJu0Yw+M8ljeJsTi0Hxj1YwomK63xwRmLYsnSo3qvV8QZneWPxleMo6
 oAfbZ+7MWPj2VDzoVbQKx1lnRU6Hrtw1Uax6/LmfK32ghGe/07CJYJcBh4QGc9WBleBV/kljN0V
 ZP5vc4cmszlQAnZPUF53ngJetCUbZfyV/Lsp80uYzmQ8vNdYT4ySPbLQvl4YtmnoFUik=
X-Gm-Gg: ASbGncvkUggmRxv4NqS/fYPvkJ1as8iliKNR8Ya/36oA+R+PzNbganzBjGvPj2UuCzN
 c1W3P7UQJA1Yd3Dzy0h/dSYhx0w1CfY/qYqs0sWxqGVUfDd6PBT4dbQGcBy9zyjs/2LvB/xnAWP
 ntMxnPwLoRRmPDHZ+uOfQwxFEPl5jVaw/mlxiaMIOo4HNmJH9LYq+YboQICjllTuPN4ZArlda+P
 a53RryTlYPrnOdcCgnj5O3+V08L6Oz0u4nUrUmog5+wKGoHmkfGv8Cvw2Ho8vRYAZrxfp333Mvh
 9X8F/KEFvGdSCYfJCxpkcCzNLsMXqfsDWXMSeQ07CtSM8EH4FJgO3zCdgs6cp2uNVDlZXm3kG2L
 N7sAPay+Cn/xJuy+8VDFytDuX2JsH
X-Received: by 2002:a05:620a:4489:b0:7c0:b350:820 with SMTP id
 af79cd13be357-7c76c96d72emr2137862885a.5.1744038670455; 
 Mon, 07 Apr 2025 08:11:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWwUJ4yecmQ9EvwHXO3wW07fXUXE+gbgkrQ7ZnvxLVeLA7hqG9gL2UbfaTh9CyoYRsZpabsw==
X-Received: by 2002:a05:620a:4489:b0:7c0:b350:820 with SMTP id
 af79cd13be357-7c76c96d72emr2137858685a.5.1744038670068; 
 Mon, 07 Apr 2025 08:11:10 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54c1e635becsm1312572e87.127.2025.04.07.08.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 08:11:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 07 Apr 2025 18:11:02 +0300
Subject: [PATCH v5 05/11] drm/display: move CEC_CORE selection to
 DRM_DISPLAY_HELPER
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-drm-hdmi-connector-cec-v5-5-04809b10d206@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1475;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ONC/5Y479NWKSaB1acKzuC/TwEyDJ/U0yuK43qNfKZQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn8+sEXuFsQN2Yuy1KNOOXDo3ZnP4YKJIznS5Zz
 +/jhPH8bjuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/PrBAAKCRCLPIo+Aiko
 1TMICACkvHMmUsBQjhiKIRjsBOO//olRxyT3ErBNt+XzQN0Yu7ADZ0AdqWGNt+AqpDwlWF3kRJZ
 raQOHgIEuC6QLVaa0ebAFvN+diJd3bP047ElJMnEFBm5sUyDhwT0FMQvee3qH6BqI3w6/MTD5Vh
 nd58wz4nrYtE4jmC3P48NsFtfoPVtVPi147YqCUGaMVjsPpIsY3NrA0Fthpt/jLy7fGFYVWkOud
 +EGwLhDzr2enw9ZYOmR4tL0XtHn+G3sh4/hCWe+Myi2GEQfM3RVotp0L4ajecRWA+dDCZmjtDQE
 /w5EzydMxHtwDSb7tsDS4sLGJMLO3JihZrgxu36uhI+jXC93
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: g7vqPPLyrAulaC3rvP85PO-NfUD2BCcE
X-Proofpoint-ORIG-GUID: g7vqPPLyrAulaC3rvP85PO-NfUD2BCcE
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f3eb0f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7OZCfA99JoLngDASymAA:9
 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
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

THe Kconfig symbol DRM_DISPLAY_DP_AUX_CEC is a boolean which simply
toggles whether DP_AUX_CEC support should be built into the
drm_display_helper (which can be eithera module or built-in into the
kernel). If DRM_DISPLAY_DP_AUX_CEC is selected, then CEC_CORE is
selected to be built-in into the kernel even if DRM_DISPLAY_HELPER is
selected to be built as a module. Move CEC_CORE selection to the latter
symbol in order to allow it to be built as a module.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index 8d22b7627d41f7bc015decf24ae02a05bc00f055..3666e791d6d6eba58f095d7fb691de1fd0b95ed3 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -8,6 +8,7 @@ config DRM_DISPLAY_DP_AUX_BUS
 config DRM_DISPLAY_HELPER
 	tristate
 	depends on DRM
+	select CEC_CORE if DRM_DISPLAY_DP_AUX_CEC
 	help
 	  DRM helpers for display adapters.
 
@@ -23,7 +24,6 @@ config DRM_BRIDGE_CONNECTOR
 config DRM_DISPLAY_DP_AUX_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
 	select DRM_DISPLAY_DP_HELPER
-	select CEC_CORE
 	help
 	  Choose this option if you want to enable HDMI CEC support for
 	  DisplayPort/USB-C to HDMI adapters.

-- 
2.39.5

