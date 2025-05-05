Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B119AA8A22
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 02:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8D110E1AF;
	Mon,  5 May 2025 00:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hVlzso7i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A2510E1B2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 00:15:10 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MSS9q011474
 for <dri-devel@lists.freedesktop.org>; Mon, 5 May 2025 00:15:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Xg9l60XwzB5oTcWL0mTb9MXi9hdCzTMTTy3uoJ/DZ98=; b=hVlzso7i5rb7vweQ
 KOezQ5jYaOYfZ3eTYxwpgIzqgw10MAl/iwBqC3IUbCCvhr/psy9hKyaHctRkDG0a
 cxQQMdEo4bMohinBh3D96W4aKJPoSbHcUpv512VPg1loFFnZDNVDYbn+7XgkOOQl
 t+RrUyYUvqLxGG0XviUOZ7RbkNnRgXkgrdn11gj0jhW0pivV7DlINUWem72Td5Ih
 wXE+rTVqpC0GvkMAeBUtMLtVKODkOI/o/Sv42leNAKLt9omQZkV7jAndOB+iTg2t
 Z45SLSoIVr7t4cTS6ZHRx5RkOLSm/Iuc49+JsQ+MrSQecKLyerOE9NnR4qb9TS//
 04ovsQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfjj49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 00:15:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5bb68b386so573539585a.3
 for <dri-devel@lists.freedesktop.org>; Sun, 04 May 2025 17:15:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404109; x=1747008909;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xg9l60XwzB5oTcWL0mTb9MXi9hdCzTMTTy3uoJ/DZ98=;
 b=O9KW3e3gwvLmrdlkLggGsxYcO0NEMFOLA0EBW3ZZ76Z0I/6abJYU3adWj9sa+KM4Xh
 gzfcrqIwQgJ0a4q/cKy9gfrwWAzsufaA+NpZ/178SR55pCnWXxoBaO5Rel/zAdA/Zzkd
 HqqqJnaclzUQTlp2uHMtdAq5lYO9WATe/N1TTNG85U7rtZjr/g+ytW//Tvpi0Cz3xp5O
 P9W8H40SuWSAmhr0EaWGCr8MYfBTlNdkg8QFUgerwX635LSG+mH/bU8T4yp5tqlmDhMg
 WfQ1RktVxX+cikCeF5tFrXfEJwjWBDJAGQ52OhO4+EYkh2oRR+a3gePeOZQyO4wtLe6/
 4p0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxXNaW/jRJajiF9T+Txt0riT93j8a6n/Vnx/3JW57jtLgUilwNmoYJPHW5ZWiepTtehgpAzuICAmE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf3sWiCxGSjhqg664AJpqiKDquCWTgOPIqfMDZQ+bMqXMNR6sm
 fb6nykfuIUYalAy/JMEzSYb7sphxQAxPJ2tQTiR0XiuTY/adeVNW6yrKRjW5zSygTyWvfuGT/yw
 41j0EybH2cBC8ioBfWXX160er1jeY14F/0M28eqskaE2eWTQOEc2jct4AeQ3peTLp6OM=
X-Gm-Gg: ASbGncv1nLiMpBTgZKk+ta6s5n1IiUmIHVXYrLQz3YSoc2s+A3onxjZhs9EsvKIDD6Q
 jOGJ4eVRf2x/6Dgtq9NEI/dMSaxm49zzwZej6Hr8tA8iTwfqe0ahVZNvgQCSR8qiT2ixIfDPYjn
 P/AZ7efPt5I1dw7ogsj6wv5ksq5TrO3n5jE57HFn4pyU/GGEVnayW9S3Anagj06HSFPe321l9lb
 8698DTjnL67mUvInwDnYHkoln6JFAx9b2YtDheLxpGza9xTE8DlWFwjyCOfFuQ5m9ciNliDs3kh
 Q0uvQBGwmNCprgSRqKsjfMcUsaEe+akmgDDmtLzBDUd2u1aomA7hnBqVJs12Tc7IMZUMj7/CNhg
 gdHz5GWGimeTOVnE54frUGM/m
X-Received: by 2002:a05:620a:d86:b0:7c5:4c49:769c with SMTP id
 af79cd13be357-7cae3a59f28mr912968385a.6.1746404108960; 
 Sun, 04 May 2025 17:15:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSchSqqIllw/dp4wXGA/G9vNYNJ3/7RegF1McjKHRI33aoVuXIEV0ZuKbcFKyOwgpSuikqTw==
X-Received: by 2002:a05:620a:d86:b0:7c5:4c49:769c with SMTP id
 af79cd13be357-7cae3a59f28mr912961585a.6.1746404108357; 
 Sun, 04 May 2025 17:15:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:48 +0300
Subject: [PATCH v5 04/13] drm/msm/hdmi: simplify extp clock handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-4-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6078;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LnFkmu2jUxjoORgRsclE+weSQh+e+mvrliRGfmUM560=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL71Ad5wzmGBcA8VFE7DMRBOvRLx8dxrUs4z
 ufIjtAOA5aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC+wAKCRCLPIo+Aiko
 1dB3B/wO2n/Jj+8+fzMeoCUmZO35ugj4pPICfzq+pGY21TBlDhk6XwBQ+bSYWUjkqExpqq5P6TT
 dE+HyOW7coWIirnhFz1W81mJ9PA+jtr34B72UqGTJ1upQveyTw0dM8ZBsCighxmvP4tmz4RWFGS
 YowEdaVv3uOgWAmC0+PxhDaCc/ZXPnKdsW+QnSBd5sbSuGhLJmBeYxDQwzbqlFQ+gbizHdcEtpW
 mp0dE1JsvV4rTuzx5quTpd7comXMTQ5mvYwSR9mk/HyB6+QIC0BAv+SftitCfBTPu5MCnXlu4n+
 Xf3mZJA84P7lqM9EW+Bv8O1n00KilJndpoz7nuk3hvseEvZ0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: _QI-La3Q_7VMgZX6fGtf6xx6_27iuM-e
X-Proofpoint-GUID: _QI-La3Q_7VMgZX6fGtf6xx6_27iuM-e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX/VD6YJUV4x1e
 U0NqTgWAINlPB4uwpAvtF2ib/Vg+SJ3oq2ddLn6VHltGEF704CcHlgwRMQvT3Q1sRc3O0sTZIDn
 QDsQtc2cH5oJzHQqtQhdQ0OK3+Vl7V4+2UYA4khvBqY6nsLgXmn9aKIw1N5O4fLoDzi4qgx6UC+
 SYo3g4MvKxT71cvuTyp6hACirZxGEgp4JyU5RlkVhjqD2JhGdbsVgOHCCHzdM3lXBtt2tab8wep
 PpB26CHz66mgXn05a8L8EuQZ4kR06CLHbdsXwsJvYW/q0L4JC0iSF1LF80l7S833LWEpnJSy43H
 XZvIJrS+2tPSeE24G6J+H/PogRLgN+jvKFtuiloMj/a2vf+Dt56vZJVxhtPdV/FwDa3vKafmuir
 BggQQLq0JQjPfocEdwNax4xz0qK/CWU83P7kM4Z/UmeZ2ctvsTyLgE6DbAxpKYpjR4D7HJHf
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=6818030e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=-xysCvM_RUkaYHfiAagA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

With the extp being the only "power" clock left, remove the surrounding
loops and handle the extp clock directly.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 24 ++++--------------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  6 +-----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 33 +++++++++++++--------------------
 3 files changed, 18 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index ebf9d8162c6e5759a3780c74354b6c159598750f..104f9cefa14834d04fb957eb48777e605d1e29a5 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -233,13 +233,11 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char * const pwr_clk_names_8x74[] = {"extp"};
 static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
 };
@@ -369,24 +367,10 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 		hdmi->hpd_clks[i] = clk;
 	}
 
-	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
-				      config->pwr_clk_cnt,
-				      sizeof(hdmi->pwr_clks[0]),
-				      GFP_KERNEL);
-	if (!hdmi->pwr_clks)
-		return -ENOMEM;
-
-	for (i = 0; i < config->pwr_clk_cnt; i++) {
-		struct clk *clk;
-
-		clk = msm_clk_get(pdev, config->pwr_clk_names[i]);
-		if (IS_ERR(clk))
-			return dev_err_probe(dev, PTR_ERR(clk),
-					     "failed to get pwr clk: %s\n",
-					     config->pwr_clk_names[i]);
-
-		hdmi->pwr_clks[i] = clk;
-	}
+	hdmi->extp_clk = devm_clk_get_optional(&pdev->dev, "extp");
+	if (IS_ERR(hdmi->extp_clk))
+		return dev_err_probe(dev, PTR_ERR(hdmi->extp_clk),
+				     "failed to get extp clock\n");
 
 	hdmi->hpd_gpiod = devm_gpiod_get_optional(&pdev->dev, "hpd", GPIOD_IN);
 	/* This will catch e.g. -EPROBE_DEFER */
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 381f957b34305494cb4da0b7dccb73b6ac3a1377..3314bb8a09d6bea7e34ad9050970bf43c64d1558 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -50,7 +50,7 @@ struct hdmi {
 	struct regulator_bulk_data *hpd_regs;
 	struct regulator_bulk_data *pwr_regs;
 	struct clk **hpd_clks;
-	struct clk **pwr_clks;
+	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
 
@@ -95,10 +95,6 @@ struct hdmi_platform_config {
 	const char * const *hpd_clk_names;
 	const long unsigned *hpd_freq;
 	int hpd_clk_cnt;
-
-	/* clks that need to be on for screen pwr (ie pixel clk): */
-	const char * const *pwr_clk_names;
-	int pwr_clk_cnt;
 };
 
 struct hdmi_bridge {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 9f1191e4c02081c99caa75e1c9c99051f7cd14d1..e7997e4a741c3b27c9086651efe6b79dbba6bf88 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -19,7 +19,7 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
-	int i, ret;
+	int ret;
 
 	pm_runtime_get_sync(&hdmi->pdev->dev);
 
@@ -27,21 +27,15 @@ static void msm_hdmi_power_on(struct drm_bridge *bridge)
 	if (ret)
 		DRM_DEV_ERROR(dev->dev, "failed to enable pwr regulator: %d\n", ret);
 
-	if (config->pwr_clk_cnt > 0) {
+	if (hdmi->extp_clk) {
 		DBG("pixclock: %lu", hdmi->pixclock);
-		ret = clk_set_rate(hdmi->pwr_clks[0], hdmi->pixclock);
-		if (ret) {
-			DRM_DEV_ERROR(dev->dev, "failed to set pixel clk: %s (%d)\n",
-					config->pwr_clk_names[0], ret);
-		}
-	}
+		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
+		if (ret)
+			DRM_DEV_ERROR(dev->dev, "failed to set extp clk rate: %d\n", ret);
 
-	for (i = 0; i < config->pwr_clk_cnt; i++) {
-		ret = clk_prepare_enable(hdmi->pwr_clks[i]);
-		if (ret) {
-			DRM_DEV_ERROR(dev->dev, "failed to enable pwr clk: %s (%d)\n",
-					config->pwr_clk_names[i], ret);
-		}
+		ret = clk_prepare_enable(hdmi->extp_clk);
+		if (ret)
+			DRM_DEV_ERROR(dev->dev, "failed to enable extp clk: %d\n", ret);
 	}
 }
 
@@ -51,15 +45,15 @@ static void power_off(struct drm_bridge *bridge)
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	const struct hdmi_platform_config *config = hdmi->config;
-	int i, ret;
+	int ret;
 
 	/* TODO do we need to wait for final vblank somewhere before
 	 * cutting the clocks?
 	 */
 	mdelay(16 + 4);
 
-	for (i = 0; i < config->pwr_clk_cnt; i++)
-		clk_disable_unprepare(hdmi->pwr_clks[i]);
+	if (hdmi->extp_clk)
+		clk_disable_unprepare(hdmi->extp_clk);
 
 	ret = regulator_bulk_disable(config->pwr_reg_cnt, hdmi->pwr_regs);
 	if (ret)
@@ -438,7 +432,6 @@ static enum drm_mode_status msm_hdmi_bridge_tmds_char_rate_valid(const struct dr
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	const struct hdmi_platform_config *config = hdmi->config;
 	struct msm_drm_private *priv = bridge->dev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	long actual;
@@ -451,8 +444,8 @@ static enum drm_mode_status msm_hdmi_bridge_tmds_char_rate_valid(const struct dr
 		actual = kms->funcs->round_pixclk(kms,
 						  tmds_rate,
 						  hdmi_bridge->hdmi->encoder);
-	else if (config->pwr_clk_cnt > 0)
-		actual = clk_round_rate(hdmi->pwr_clks[0], tmds_rate);
+	else if (hdmi->extp_clk)
+		actual = clk_round_rate(hdmi->extp_clk, tmds_rate);
 	else
 		actual = tmds_rate;
 

-- 
2.39.5

