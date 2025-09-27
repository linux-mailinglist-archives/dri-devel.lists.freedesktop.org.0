Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3747BA5751
	for <lists+dri-devel@lfdr.de>; Sat, 27 Sep 2025 03:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A9B10EB03;
	Sat, 27 Sep 2025 01:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOTli0M4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B22210EB00
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 01:05:21 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEXATI032377
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 01:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ep6o8PRzDpDpN9BCPf153wSzeohtk9bx6s3tbhjl8dM=; b=UOTli0M4CsntoZrE
 7T1c1P0BhQ3Qki+HUpNz4BE2hfj8yF1BkmCLcVTjSWAXEHqhLuSRx3HwWjkhMrDh
 BtPqcZ8FF+/LyCWZdF1VUiaZnVfZ6zojoQD8ewIkLrTAOu5rMjNFvChKjxM0XN5h
 N6g36shxoOSY3S4x4TtW7e/OSp9M1EDkD84rkuRhY1PDPSMCkrymnxt8pUnS+F3H
 31QMFsC9TnCD7cQexdfzx9Jjh4m4E/nyPb8UvuJqpKERZgGbD19aMh1M7GKv4gtv
 CzDyQ1n0bRCxaz32uZYXYv/yVxdY1Q8Khfuu1AXGqFm6i/xee8Z6+u5E649uR32m
 0l08lg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tchf7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 01:05:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4cfa9501871so91757851cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 18:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758935109; x=1759539909;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ep6o8PRzDpDpN9BCPf153wSzeohtk9bx6s3tbhjl8dM=;
 b=soErO68JOn/Mqm7bKjeff5Lr6CaLEGdNWJSzGMuDxOIrxvzRGE2CNv5vhbW0adZIAy
 0xxkWwug6+ULHr78BCdMbpjlQLi6yRAO931BC/F6rsX2lI2rsNzzoQ5fuVx2YoNYOOgL
 et1QUeDkj9/A+3L6+8BEhSgnorD+zhEUfutn2HcBKBEouSVsiBnZJJlctuOTqJ450kfJ
 xqY9eI8/Pjd1kr3Lm4uArdSyob92cTKWc9Q4UJg1Azg5FFCXvJnvPAjMousVctq6zhwE
 CvjPgREoYvE9iK9r8VqJ+6KLJFK+QmEoWBIW1v6tz0E3ncjIp1OdN1GUSNcNuGbtiXRN
 E9ng==
X-Gm-Message-State: AOJu0YxopWSkU71QxGf49xhofJ26dHjJBQKBbwCvIz22YGP0eWiL3JOB
 5QPmW07cRF8t3iWyZnbcbfsC28+FTmA5dSZ6smC3U2gcSqEwhVnTj0gM5s/5V7I1/4qDFMyN31D
 ebX4ccqPcBY0JG4s6weJCiUvaAjnV8lcjA6WO9HlNpkm/lK3WhRQjaxsE78xIFFMr5xWnoiSo5f
 bFssc=
X-Gm-Gg: ASbGncvH2MaxtFdT4zkBsZL40YrwRc93LBiYaAteVq3PlD4ZU7aG/vRI4NoIKb3oua1
 /dox4Ve/8KUzhaThQ/0UUY75FG7g7pwn3VrEgOqnK9vBHsekoybFeOUKZsfx8ZvrU3Jrw5Abt2X
 DqHVtpxrN0eY2PP/trrSK1R3uKm9LrY7eeKzBfqBXkk2aRzH4+i2eoA/L8ifR2q89HZB3dPpjwI
 pxUzdgFPHNV+L72bqtjIQPmuUEh/VtHLZvjN6vSt7hZ5ltqYcINSNOt94R8h2SVyPEn2VhT4lfJ
 wpCoYrfddcRNR4Udzi4+bk7O+o2le32SLzzAe6mt2VhZBlG/6dxdLXoHxahh/x03eEWLH4i2etH
 1rh/9vIkbBVmhvowYgdZto4/P3U0Yx6ujYiZk5/Zy9TMFVz0pi3d5
X-Received: by 2002:a05:622a:4d4a:b0:4d1:6bc9:8794 with SMTP id
 d75a77b69052e-4dacc7b3838mr95542741cf.23.1758935108414; 
 Fri, 26 Sep 2025 18:05:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4GFghpOB7X5hfVz4Kb96HCFDTN4uTdC0uUTICAAv034gi7/1wnQGm5inpTe2Y4vlchBVykw==
X-Received: by 2002:a05:622a:4d4a:b0:4d1:6bc9:8794 with SMTP id
 d75a77b69052e-4dacc7b3838mr95542331cf.23.1758935107900; 
 Fri, 26 Sep 2025 18:05:07 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-583139f99c1sm2156143e87.35.2025.09.26.18.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 18:05:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 27 Sep 2025 04:04:37 +0300
Subject: [PATCH 8/9] drm/rockchip: inno-hdmi: handle unsupported InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-limit-infoframes-2-v1-8-697511bd050b@oss.qualcomm.com>
References: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
In-Reply-To: <20250927-limit-infoframes-2-v1-0-697511bd050b@oss.qualcomm.com>
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
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3126;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Lc2tTQYfaN7zqRa7FcjPg44+fL+8LeTUVnX4T4zpQNQ=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8Z1C0V9TUOdBzd53hj9kTaa8f96WMDi9NcP7Le/9/e9w
 poYpaLdyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJbHvMwTBN/K/sz53FzjMm
 MaXGnrPvubO9r9f2X2Tc6j3Fmps9nohc3VX4Zf6GuQmaUWWzpZ3lTKZs+n3FK7zAeVJm3wMOY/1
 rPBwCa3oSOJXPxC8+dHRdnPrRWmm3iKTQUtnMPAUT1ZBZaxhZP8R9V2F+wbjaZq30LqHTyoL7M5
 NOyNas8f/mJhH9aAWvf/Img/NfVvt7MrnL7L6yOLfZ8tsKV4uiyVNiWU+eWS/NsEGiPv3Einxex
 doLLRL3Np4qkPCtved913RyeuiNj3a+U63nyChLF0rlTHQ8sF4x/eyBnEQ2tZV9tVcOXT1uwa4X
 MaXv7hO5IFG17R5X1zVqWsnuZ/+mwBJ7wSN9ldbKg+31AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Zbcj7YBhjhegJ9VGfGcsRhaikdX2eqGm
X-Proofpoint-GUID: Zbcj7YBhjhegJ9VGfGcsRhaikdX2eqGm
X-Authority-Analysis: v=2.4 cv=Jvz8bc4C c=1 sm=1 tr=0 ts=68d73850 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Uj443JZPoyhSIAxeSSAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX0aThp+8V+qr6
 YXAV9kd3WMpQx5/UUUPKh1gA9XAKHJ681MQm3SUhvnQYDrsOp9GnUL284bgC4vYCnZEXhwh+kaE
 lSoW6lj0i68jOZLCPpzFkr8h7Lwz9ao5iZZEgCeLiWgayVLKkv9rF8hq+7UmZDAvAtriXqDva79
 5UpCCouvx+BRqpSYfwzS/psfbRXNyXwohZHq7cwnhjXF4hxN+TSLRjkoRjYV+mjhDhJ6/5XCjtg
 hHbncwcWsP5EU7LwOfo7eivfluVNushfxJuJ2Hu3CbArlWCLKQsM1Arok3TC9vY4CeW0P7DQQjZ
 VAL5CW3Ze6rPeQvO4NkGVDl9agCclzG6JIgFIdr15VZ7z9iN5+c5Af5Q/oMYIcQRmKwQSREiPwD
 xrZQlwAfNkdnlihS70eiHf95ljsTLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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
 drivers/gpu/drm/rockchip/inno_hdmi.c | 46 +++++++++++++++++++++++++++---------
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index f24827dc1421cf5e0c1be63a80da23d645cf3f24..dc2d68b9c87f7ae7b06ecbeaebc82b9689c1abfd 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -641,11 +641,8 @@ static int inno_hdmi_disable_frame(struct drm_connector *connector,
 {
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, INFOFRAME_AVI);
 
@@ -659,11 +656,8 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 	ssize_t i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	inno_hdmi_disable_frame(connector, type);
 
@@ -673,6 +667,36 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	return 0;
 }
 
+static int inno_hdmi_connector_atomic_check(struct drm_connector *connector,
+					    struct drm_atomic_state *state)
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
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs inno_hdmi_hdmi_connector_funcs = {
 	.clear_infoframe	= inno_hdmi_disable_frame,
 	.write_infoframe	= inno_hdmi_upload_frame,
@@ -1029,7 +1053,7 @@ static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
 };
 
 static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
-	.atomic_check = drm_atomic_helper_connector_hdmi_check,
+	.atomic_check = inno_hdmi_connector_atomic_check,
 	.get_modes = inno_hdmi_connector_get_modes,
 	.mode_valid = inno_hdmi_connector_mode_valid,
 };

-- 
2.47.3

