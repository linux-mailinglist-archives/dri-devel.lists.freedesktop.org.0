Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3597DB0A707
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 17:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F8F10E9E5;
	Fri, 18 Jul 2025 15:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrDSLmWS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38DA10E9E5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 15:21:42 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IEtGuq022439
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 15:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=; b=VrDSLmWS/fBuwTcb
 05J7LPH6Cz+belbs7qtt/Lx0NORZ1V/C/d6EAFXc1vIrQRBz0uFlwCeytXmlnP9x
 nxPjxBa/heOJFz4DAnvUC1JNx2OX7A9qoDlcg1RO1fnmfc/dFmBmSCfbN71NI/Gc
 Qc4LEolwTW/yIXHvha4V5MQO8v1TIDvYVq7qmN+1FLSWyj7aYAzfSEMfCsBBYePx
 reP3dV3zMwrn0cXXa2JI1W6JCcZcNQehVsf7HxqExk31n3MQLq0fkkqas/efJ1so
 IAZQ3O8LftQAJaHeYqbocS1/nW+ceBO579IkjZ/F+yezBxXdff5lbC8pNdETnyFr
 7gqXQA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wqsyc2p9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 15:21:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ab758aaaf3so78571181cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 08:21:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752852100; x=1753456900;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=;
 b=oe8s8sXo/dA4lFX8WcN6nHC7xuHkwuDZ7dY4Xd57s7LfPciifDi8p4ZN8M3LXkJjlV
 Y/1aVWAyKAM4ZFSxYW5LOBOKQowdxz5lTWgPNLjJw0NadNiIf0QmxpUNZ+BQa2tMjCpe
 vKsQQRFAzongAvHgVpracyWGe9IFO4euZkwBHprDRGMW96PT1k5SI/iXCFXB5+g0QUVI
 c2L3Q18CXrzLaXpxUzoVZ3JKNJmgGHbZz5ZNvIL9NfiXzOqnnKOSMYLY/oUT4Wp/0Q86
 TU8Nv+y7jYK8Hism7f0PVWCIwiMUaEZI6/jPC+F5y6cHTxLX63zUJ9iyV7wJpbm2fGFt
 7CvA==
X-Gm-Message-State: AOJu0YzvLeiyvQS4plhxXIO88R8JH2zASE/rE7RQ06p5/gKYdUABbKOc
 oEO7XON9hf+TeFjciLf9kTAga2oxPk3Btg+MtPZuyQrP+Dxogr9R5oHeBQw7TcxwfUPj6ciGnyx
 D0V01k29D+8ETfY92WBZqWqAg443v4LvU/s3YNBYzIjAPpPjPfejkcAnfIiEY5YypG7F+karK5e
 rMm+E=
X-Gm-Gg: ASbGncvO46YpD4+PeEy/QYm65TUN7PybNiUkMxMItObBocSnhBs4JUh+FqSyGovoZfU
 wzKO2633JsYR3xfONK696h42ZLvjKBR9pvXp+WxCffPahkBVvD0W3M5Yz5AvFVBBWs/yZTaeeB/
 LYBn09qv8EdDL9r95Sy253KTDQ4zXxFIRsMRkNgx9VNGsyiHjqJqmmhf2+kE9ZEXDaJIlc4y7cg
 SZJxB+P3PFDFQCxO7Qqe1/NmLXGRxz0SABz/i+F0672y55Xg0x6ClVdOAM/w6pDTceIPLX23kdK
 so35YXM7L6MWitu0y6g6Xwd+UpzZpAJGVwWQiQSVcdMygmhd/poRLWVh+TX79nliZQOUQDkvhIN
 eCKQVsconJzGD++ef+Dz3CZFQ5ZsXzk9sDOVWKNTGTReBtzqqcopE
X-Received: by 2002:a05:622a:90d:b0:4a6:f51e:a00 with SMTP id
 d75a77b69052e-4abb2d6e7bemr40813681cf.30.1752852100231; 
 Fri, 18 Jul 2025 08:21:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXlyUsMs9U0U+O1wbUBh1xpkP1sDmfvcZCUKPqD7lL2WBQwooK09f3VjD66V4Apt17hOmKBw==
X-Received: by 2002:a05:6122:2982:b0:531:2afc:463e with SMTP id
 71dfb90a1353d-5376473b9c8mr1645131e0c.5.1752852073027; 
 Fri, 18 Jul 2025 08:21:13 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a91f09a9sm2515041fa.94.2025.07.18.08.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 08:21:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 18:21:08 +0300
Subject: [PATCH 1/2] drm/bridge: add connector argument to .hpd_notify callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-lt9611uxc-hdmi-v1-1-0aa8dd26a57a@oss.qualcomm.com>
References: <20250718-lt9611uxc-hdmi-v1-0-0aa8dd26a57a@oss.qualcomm.com>
In-Reply-To: <20250718-lt9611uxc-hdmi-v1-0-0aa8dd26a57a@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4403;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DqScOxpZEjas1EiNHxjLEq5FN9iLRQvzJiWpGwrXHf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoemZmjN+Omvftf4kFa7jkLpiochHZs/3UCyjEQ
 KJocwTiOuOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpmZgAKCRCLPIo+Aiko
 1WMYCACXfUOHlzufAnv7BolBNMuOWQAeu8OseKQIIQ3KxLuNSMdFlg+PMVybvtBqqW6SAy/QCIM
 lCj8zp7+vQG7lcPnFFiHw3Lfou9u2k/+h5nFwZov6t0LG/8WCRGN2SVHr2eh3mMZPLlRB5NVPRL
 TnrsG/OQab8Jy2JDPyOaCFZu8+GjdYU5lDOJQ82IdRVZ0kGD3wKHiANCYz9UUJouAvEkp8igRyN
 b5GhFmELHKA9+Jlqw3HruviFWFQCo0IefgOAeq64gHFK0MJYaIAKduKw6tSd6U4xHoW+95qydOK
 MiOzZn+V5ZV3n3MBx3uYUNVRbpcaek2Y83IJJGVa2xJpB5+9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDExOSBTYWx0ZWRfX33jDjcwgdyW0
 8z0SXK6FjKV2wiSq+k/+/j+WqhkF9M/3Gyxp0cRgg+Sj34aRG951OrOtEO1W1OUBvE1DUe5cWAF
 9x5vosXIVZMjqoVvKvS1iWKuy4/uHemKHAIZHq8z6rO5Uw63u66jQsRtpgDTKlLgDbwqM/GqA/I
 xueQEb4BdJipaubxq9Lu6vEc+qNTgRMoLkIQ3tW4Qsxnwpu4qv20ZPSUXL2Igkkqt116G+2Rc3W
 kT1BMwQDlx7EaHK1v/iSIAx6Qo+Q1vEZin6gXydxXdJ3jh4WjWCX+Qr/j0Mf26BUvpUEDY1xoCQ
 R35Q9bYJorCb1zvLkEdW0BaLMmnpNRp1xtbGkzBw4BqSJXYRnGbnSDnZS0pf9TOfBKuj9vbrHNd
 lLf2WXNBH/0Y75lpsS0ck+w0+HzT7DY82ixSXlgU6Uw7cPJn744Bfux+/KJBlRMjnKAzX70B
X-Proofpoint-GUID: plIQOFa9Zubo17bnN51OuAKwHk9Pft_B
X-Proofpoint-ORIG-GUID: plIQOFa9Zubo17bnN51OuAKwHk9Pft_B
X-Authority-Analysis: v=2.4 cv=McZsu4/f c=1 sm=1 tr=0 ts=687a6686 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=H7fCCF_eaumybVcuHoAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180119
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

Drivers might need to update DRM connector in the
drm_bridge_funcs.hpd_notify callback (e.g. it might be necessary to
update EDID before setting ELD). Add corresponding argument to the
callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 1 +
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 1 +
 include/drm/drm_bridge.h                       | 1 +
 6 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 5eb7e9bfe36116c9618cd3773f1c01e7ebb573be..f2fd277d694b8c959f913517ff5861b777d8a9dd 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -141,7 +141,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, status);
+			bridge->funcs->hpd_notify(bridge, connector, status);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 8205ee56a691ee7d166b16cfce6932d0308fe6c4..a665c9036878c1e879b7bd88df1d523658fe8849 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,6 +323,7 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 }
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
+					  struct drm_connector *connector,
 					  enum drm_connector_status status)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..0676b3423abcb31ac3ea6e6269473764786133ed 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1774,7 +1774,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 }
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
-			  enum drm_connector_status status)
+			      struct drm_connector *connector,
+			      enum drm_connector_status status)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index d8c9b905f8bfb5abe47c1cb26d17bc605e3e1ba6..9eb3431dd93adf096f45b6d981967734bc8a2b0c 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -40,6 +40,7 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
-			  enum drm_connector_status status);
+			      struct drm_connector *connector,
+			      enum drm_connector_status status);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 3cd612af24498b057c33eaecb3d43c8df76cd23e..29b2dfb90b5fa3b137d05725d65a1cccb9cd1345 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -428,6 +428,7 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 }
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
+				    struct drm_connector *connector,
 				    enum drm_connector_status status)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 8ed80cad77ec4b40d0aa6159e802a2839d5b8792..1e73d72c55426ec21905070a13b44aa36b02e023 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -730,6 +730,7 @@ struct drm_bridge_funcs {
 	 * controllers for HDMI bridges.
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
+			   struct drm_connector *connector,
 			   enum drm_connector_status status);
 
 	/**

-- 
2.39.5

