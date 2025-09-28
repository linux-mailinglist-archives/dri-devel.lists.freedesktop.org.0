Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FCABA6B22
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 10:25:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0D510E249;
	Sun, 28 Sep 2025 08:25:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="buCADdXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D2410E328
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:19 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58RNiaG8022427
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NW6O36yvGMaCMJruxLgmHiMoRnZgXb8542oDwX0AOxE=; b=buCADdXklBonbx88
 yQXEnIVHCKmKKGaKlUd2DEna9Y8RP367YFy0zH5bX4/6GvXxeYZuDCOZ9cQvyZTG
 UPbG6PNp5jQB4ujsyn+/N+H04591MRydIEPB31U+6DGjQM0v31voqfaNdNW2qvpP
 ofWJZ79wt4+O46Zhbp8Gb/D/k38j5ECCMEProZH+zpFbVee99t3ephpV2+QfaWRH
 MUZ5IQfW0rP3W8KoYStNEqFK0G+/Usk9lfMk7zxGbR3THjLjJyAFrVaSEQeeb0fV
 NuCHxn0IWJLfaljOMJvo2jDq8ZYcUSwnyJXS3MeogmTYECHk1TpGaJXEZBVrne8S
 jppKtA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a5tcrg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:19 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4dfc05dec2fso27250971cf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 01:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759047918; x=1759652718;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NW6O36yvGMaCMJruxLgmHiMoRnZgXb8542oDwX0AOxE=;
 b=DmUXBPEiZamCnIodZd0xsz2mHge4/Hzj72Lq8PWgHNrkE4i+qFr5s4KFSreyokoPVq
 +x6tJ6U08LybEFn52pIAaafDuyMkREEO00XVvoyexXzIv1Hw7+awhLDviNScRF75g92W
 ZI/N5G8aZGmzVyaHgnTSEdHd+CjAxDjtOXnu5nHWXhobqVpo2uxyX18/OhJZ+AfuT81d
 r1mbHeM+/4k2kQmWMK2qud2FcPCWIZu7K36EPeIFr1vvXldgx6bs4a9PTMAR3KZZUOCj
 7f6wnjFmsYOWd9Gx3zdOV/0cLLwt0IaTKXJuOdF/emxSANEUexjmcGS9m8F2I74/K5Bg
 UzQA==
X-Gm-Message-State: AOJu0YxANnI8p6jLf2Ugf38TszpHtnI3tdwIRTNiJNnSOiN1eWxR4jTo
 cpsi53n60GYL9IZTcm8Ybpgf/VfjHi6g09YqBvJ/xXAgGMfeLHDoTrcXRxs4Dp4ECQw6bdrc/py
 yMFYTXMtULFqEWYyJe4LmPRxw8JDB4BlA8w2Ljws4b23/LpA1J888dVQLYghXu0gNI4X9Lps=
X-Gm-Gg: ASbGncu8e9jBHhe+C4FE/4DWDMiqaK4iZC4Wd4cMmWbf4IUK5b1BMtjhM5CZZ47/eHY
 4bYaY4kMLIxoF/MWArgJBWwZ8zTnfg26VcFiPo/GYa0JBkZH/U2xaRP/27aAX+dDl3mB//Dr+Ud
 sCGjISGN9dben+Z/9oi6tGeYL3oSxsmyOH2hPYHrt7xSseFP16B+vXgPLwiJWFABV8ZCA+pzeC6
 iAcCQoWzzuHe2ye/OA8w6BZz5fjKPeq+dSfgQO+fbNVYUbsM15u0EOt6GUfaitQnnpXIBfXV5w3
 Ijlan/lwlnUm0ovnvn7Z+5CNvEZsouNRCZ9XGjVAum/sOv61PNSHHvvlDPbgatOuBnez4ia3nEr
 pkQC7eSc5sucDvF8MO4gAxPGtczEifXbrGVDuQYci7irgG84rostD
X-Received: by 2002:a05:622a:28b:b0:4dd:2d5a:4c81 with SMTP id
 d75a77b69052e-4dd2d5a5227mr115444611cf.80.1759047918235; 
 Sun, 28 Sep 2025 01:25:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF27D25nggKmxCQPuY2QEZ5kb5OMkUcGWSWenXBk1jMFSmot08OrVTyFKGy9g6C2KuS41KORQ==
X-Received: by 2002:a05:622a:28b:b0:4dd:2d5a:4c81 with SMTP id
 d75a77b69052e-4dd2d5a5227mr115444191cf.80.1759047917658; 
 Sun, 28 Sep 2025 01:25:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Sep 2025 01:25:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:52 +0300
Subject: [PATCH v2 7/9] drm/rockchip: rk3066_hdmi: handle unsupported
 InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-7-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
In-Reply-To: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3035;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W9b6XDfq52rGNwLc4zsgRSvpebnOTLw260yRhrb4Lug=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDU6HTPvF+Y88cTCEIA/XqAYSXsI17MJ/Kuo
 GBYAduGAauJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1cq6CACwsfecD4+Y57wsVqifG4KmJ1uLXo3XecBdE9p/0GhGRaWV3arhyRyfKp0tlB35c8MzljK
 fDtPzmsDvrhP2urxzq1TpspnVu9IXcEypIW0sF87iXw+iFME67+Gyn9a9OkTsH2PnQMOFRkixVX
 mH/gIAf3P2S40lcubBSetxPYyllypeNFWjqzzKMd0KvjErmpePUInZnPTLBd8/Xh4pW3QuIhgrU
 Sm7Z56KIe4dVsOT6HH+7Kq4tyjrHZUh3tKF7qaQ9i4K1hx3kgg/RMruPZmNz9kpUP1zJyzFKYCZ
 ++CnvNdxchJd5yd4WAK1Hb1e0RR5mdzcMjyyN22Bu74kcYoN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68d8f0ef cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=LTYPIh7T-TEeLale1FMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: rvmO9_ztQc2p_L5qZXTBei9Cj9GnrkwC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfXzpXKBu9MWWek
 PKY8i56txJRb592S396HS8pjwHZyck37GQuNSvRiPLri5T/T0GEwgX24mDH+hikEAF5kR4Yamyi
 k2vwcCxrb/vCkX3zt7NAbw4vQOEEmb7ncYW9tawI0RLLZRGFYFJR4EJUSyre+j4rL/HaerUjQfZ
 CKwvpSuZxdDrK1LWJznt+uQLji+X/VDd2waakujcw9RFWIxnR1ojAzs25vq34j1UEDO0jL+yJHI
 qPN9vJldb3p9R/hKNjXceX8TSeEUeq8JR9Hnu5336abkk7F1C09l7VfN0Pe4Vb4+S7xeiGySZNz
 +itt9AhoawouQNkGaZeD/n1ueZdpxxgHQTZcJrCErmA+IOVrfqiqL5mU8hxm7DDpQLx3ESdFK5w
 NotnzK0+2mxIzGttlAU4DCGpFULuVA==
X-Proofpoint-ORIG-GUID: rvmO9_ztQc2p_L5qZXTBei9Cj9GnrkwC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
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

Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 39 +++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index ae4a5ac2299a93a49f87df7604752f6b651c839c..33f52a83ca4597193de8c012b4cc598e82c3f09b 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -162,12 +162,11 @@ static int rk3066_hdmi_bridge_clear_infoframe(struct drm_bridge *bridge,
 {
 	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	hdmi_writeb(hdmi, HDMI_CP_BUF_INDEX, HDMI_INFOFRAME_AVI);
+	// XXX: this doesn't seem to actually disable the infoframe.
 
 	return 0;
 }
@@ -180,10 +179,8 @@ rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	struct rk3066_hdmi *hdmi = bridge_to_rk3066_hdmi(bridge);
 	ssize_t i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(bridge->dev, "Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	rk3066_hdmi_bridge_clear_infoframe(bridge, type);
 
@@ -193,6 +190,31 @@ rk3066_hdmi_bridge_write_infoframe(struct drm_bridge *bridge,
 	return 0;
 }
 
+static int
+rk3066_hdmi_bridge_atomic_check(struct drm_bridge *bridge,
+				struct drm_bridge_state *bridge_state,
+				struct drm_crtc_state *crtc_state,
+				struct drm_connector_state *conn_state)
+{
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static int rk3066_hdmi_config_video_timing(struct rk3066_hdmi *hdmi,
 					   struct drm_display_mode *mode)
 {
@@ -485,6 +507,7 @@ rk3066_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs rk3066_hdmi_bridge_funcs = {
+	.atomic_check = rk3066_hdmi_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.47.3

