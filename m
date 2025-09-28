Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E928BBA6B33
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 10:25:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96FA10E393;
	Sun, 28 Sep 2025 08:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cxLU/nZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6318110E328
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:25 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S0tHf0005434
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 z7oVTmK4jTegfS2LDYKFs2TDqZVMBs8llu7PGEMrxt8=; b=cxLU/nZVz5UWUibq
 ZG6VxhOTPNQsP2gAAYed3eAS3hPx2zdPmA6z+TP6CLhhgfpJcHe+qqgkbqAF/nF3
 GwyISE9aK7iqgyqPUeY5UTYNjsJlJF8BexHyQuGXwza/gNhtEwA4ub+t5dXwbb2K
 gWvAQhohtLv8z3vJ3XP2x+rk6DpUgEXK/b+XEVrzMycX/9iaahbZ8o2D69HB4vpK
 Y07PU4GSBFOXfMNkp+0W6zS5GkL3afys9aF//BG7eZp15nT/oTluCwaKbtBkqH63
 JPrAg2rMw+NcKCx8GgF+B5Xru08K/QkuwMVwfiL/h/wnt/8QE8FgFgh3afcSxOVL
 /FPurQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e78ftfm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 08:25:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4d8b8c3591fso104286371cf.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 01:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759047923; x=1759652723;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z7oVTmK4jTegfS2LDYKFs2TDqZVMBs8llu7PGEMrxt8=;
 b=jdEuYRxz6DAaS9l1w2LOJYxbu/o2f1T+SfRD+CQIn42nVX8ZOsEC3pURYOy4pT2DnA
 I75GOWq9o+fNVZPJwnOInmZiQ3IkCxTBYDRh6hJwe/TMOcXN1v+xFq4ZtCHwjtD3IzTq
 ZoYii2oPinBV1WYbzp6R5V3bRt59ZB0W6tjcuya6AKniPNHTIerqKFB/5l/+6ZdJhvRJ
 SOl/qY+/lTMCE4DykHpAvsVFIeAoB5efIFvjbRMp6CcI0A3JW8HCQH41xNNHXwxp1ieR
 HUhBHlx9PX7tcZ/f6AEBmVIWDFHjDlUIizngVI6M5YoW1ZmozFRK9jb9NhoN83pYSpLG
 1Ddg==
X-Gm-Message-State: AOJu0YzdGirsevZQSvV/VJ4U3o0Ii8p38GWs2P478/AiG3r/p6SrARd/
 k9L1+1TH0IrZRB6zDGnLP0EwwBXsxmCrSs2ryryVsw07A/9Hx4KY0596ZbRg8Ws1v6foOZavSzE
 cwESdmGuuV0uehn7KedMFYUG4uqohO2qMorKhnzQzBtG/wH6wQe+TflYiuYc41dSCbaX+KtLBGR
 Uw/Tz8Rg==
X-Gm-Gg: ASbGnctYELyaPBNb9yrz2TqATy+j+qLRjvubtL5Mc8qghilI4tnt+6bR0pITe/kGpj8
 2JLVelb+y835eevtIsVhOymi7I6bT1Fv9z1MH+WglPZLO0mWZJtf6IazU0eJub836GMNtPiOXGC
 F1ZbWEnfQunSZEqjmta91iK7yCdY3/zjbYCsV0O29Tjw/7gs0f8EOquYfevb3OJZJpDVUTSvyyY
 p7mREi8sf7DfU3t6iDbw9VN/Zpv/JRlG1SSWkdBgT7SomtZgl//pSrGLERNTuyDG5OfrX34wHQA
 w3an7aFp/Lu1tbyhHgQIqdNvkf0J4b33eoDTM30nNxSgdrj9oJFvp8/Pack+ywyU0Vhn9Tc4xzy
 Iu8sSowBTQYF89ATmOZws6Y/I9dx14MWzYx24jpnwpLk+j7h9X4JE
X-Received: by 2002:a05:622a:1451:b0:4dd:e207:fe2 with SMTP id
 d75a77b69052e-4dde2165a57mr93280841cf.41.1759047923226; 
 Sun, 28 Sep 2025 01:25:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEESn7rJMVdvgKDwuqV4pofk8SCks7ZTpp/nKrxlhNer6Wcz1kuf5zkj5btieQDBdmwJ29uJQ==
X-Received: by 2002:a05:622a:1451:b0:4dd:e207:fe2 with SMTP id
 d75a77b69052e-4dde2165a57mr93280551cf.41.1759047922745; 
 Sun, 28 Sep 2025 01:25:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Sep 2025 01:25:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:54 +0300
Subject: [PATCH v2 9/9] drm/sun4i: hdmi: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-9-6f8f5fd04214@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3167;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SNmzbnw2SRpSDuHUMU89vGrNBx2CzM0VUWkNV9VkozY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDUVHPts4iT9DO40TpNVuDbiJgKbp9tiaTF5
 1h5ic+PbuaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1X1PB/94ehTdKMPnfDOQqb5MoKaN8Ah7FgUWp1xokcVcE+txfW6tC2jaIjwYYAAMg3MJu5MKqOd
 4PWONxLpvDmWFuvW0awSN19CswKo4/ryi42gY9MMgRQVUs1fvs0lmIjNQQmMh/GtJGpWRmGFZ1Z
 pFUgZysdcpoJqNHMmpRuPnDgdLsPdkrHk1iSNAdtKMHFHrPWMg4EQBxyTtppsBsV+NDtUojhffi
 xOI8LZwI15c1n9YOqXYsq8iXY8BHtBBCR74y/paTdp5/44jEoUPkdBhMZsbD2jB5l/oT7LqHFXS
 sXRyBWKd0da84pm5V/dCUkLlQgTe+nmOwJ0AI1Mec36mivUm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=DZAaa/tW c=1 sm=1 tr=0 ts=68d8f0f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Uj443JZPoyhSIAxeSSAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyMiBTYWx0ZWRfXxVSq1XHR5thx
 C7hod+RtFuc5tj24JfyXj53sLqpsj/IUwj6joq3965SeH+gqJHugxxzTNKIzLA2is5k0RegJ1UP
 EPGIoEA6e0t5VnlqiW56O8ayaUvqdMsLYzUTEhKSZLqWp9hgfppXE96NiZ0fbC0ru3wHfz+7Lnb
 fryfjXIxG9SpVqXYMz+MSLPU0DVbvrUTikfqWbTtWHSqnl06llqfEVdYHoBbBy0zCbFElhpDh18
 UaOswhbLyObQF/fc/Qo6jPJr19erk7S5AIWLoNDteQE1Fl65LaTvd0AbnUzL260jm/jY7L5Yu5B
 bo9hc201PKNI/HtgftjtqdLl5DJ9Dv3hZ+MKBq2rJRaXIIIXiEZRWNCN6BUqVU6SpS+j0gVsggJ
 7V20fZRg0PfkRruEBOY1SycnpSyEAw==
X-Proofpoint-GUID: BwZ-cqM3k3txEb0UWUvc39Upi7_Xd3H-
X-Proofpoint-ORIG-GUID: BwZ-cqM3k3txEb0UWUvc39Upi7_Xd3H-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270022
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

Make write_hdmi_infoframe() and clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 51 ++++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index ab0938ba61f7d75dd0bec473807a04a20e1cffbd..6d41207548386c0ae14ba0a9b7553fe0d3bd001c 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -47,11 +47,8 @@ static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 	struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
 	int i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	for (i = 0; i < len; i++)
 		writeb(buffer[i], hdmi->base + SUN4I_HDMI_AVI_INFOFRAME_REG(i));
@@ -60,6 +57,47 @@ static int sun4i_hdmi_write_infoframe(struct drm_connector *connector,
 
 }
 
+static int sun4i_hdmi_clear_infoframe(struct drm_connector *connector,
+				      enum hdmi_infoframe_type type)
+{
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
+
+	// XXX: is there a way to actually disable the infoframe?
+
+	return 0;
+}
+
+static int sun4i_hdmi_atomic_check(struct drm_connector *connector,
+				   struct drm_atomic_state *state)
+{
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	int ret;
+
+	ret = drm_atomic_helper_connector_hdmi_check(connector, state);
+	if (ret)
+		return ret;
+
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static void sun4i_hdmi_disable(struct drm_encoder *encoder,
 			       struct drm_atomic_state *state)
 {
@@ -237,10 +275,11 @@ static struct i2c_adapter *sun4i_hdmi_get_ddc(struct device *dev)
 static const struct drm_connector_hdmi_funcs sun4i_hdmi_hdmi_connector_funcs = {
 	.tmds_char_rate_valid	= sun4i_hdmi_connector_clock_valid,
 	.write_infoframe	= sun4i_hdmi_write_infoframe,
+	.clear_infoframe	= sun4i_hdmi_clear_infoframe,
 };
 
 static const struct drm_connector_helper_funcs sun4i_hdmi_connector_helper_funcs = {
-	.atomic_check	= drm_atomic_helper_connector_hdmi_check,
+	.atomic_check	= sun4i_hdmi_atomic_check,
 	.mode_valid	= drm_hdmi_connector_mode_valid,
 	.get_modes	= sun4i_hdmi_get_modes,
 };

-- 
2.47.3

