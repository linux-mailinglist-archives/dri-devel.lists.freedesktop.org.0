Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176A9A9C449
	for <lists+dri-devel@lfdr.de>; Fri, 25 Apr 2025 11:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5D910E920;
	Fri, 25 Apr 2025 09:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i/vqPwgp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DAF510E91F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:07 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TA6h007400
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ViRsjns1v8Jro2gFleFt5r8weaEEOv6Mpy9ydokco3c=; b=i/vqPwgpSUlhVzrp
 bL0NIDzAcykLSIAA0KhJpA7nIZlBF1U0mj864gs+xAomimCbDsyBYG4038Vv7WfL
 YK5sg5hW5qd2HxIluNNtHS3fAhch8SyMmssCszQNVyZY/iqP/lwEuoWwaOfXW7TG
 8WFtVYGilE9ACORLbiQRFtsQaFCwPdecB5W/KJzquQT0BahzZeA7wFlfZusYdgac
 LKOzxz1CcdFM+Iw8135ASNxEDD9LmHaD5HZwrYisBd8qOzf/mUq8JvtJik37+se2
 elLs2wqVOo7Y2HgzW8nWIMHdcVWAao7YErPYBBod/6DZNzEkKTeaYYMS1dj7RH3E
 BldwpA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0ret0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 09:52:06 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5f3b8b1a1so337951885a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Apr 2025 02:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745574726; x=1746179526;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ViRsjns1v8Jro2gFleFt5r8weaEEOv6Mpy9ydokco3c=;
 b=ASKU0XlwrpC8ytBoLIcxT4C46Lf7gJt08+3rPkkNxDgEJWOXlNLolQ+uyY8Gn7GFqf
 9lPsHDA9sTUxt0cLXHzcX0X418VP6Hfa8wx+khYqnXkxa6M/T6pfZTqSspkad3U/Rupf
 E2kH0umqsT4Hb01l3wudZFujw78+1+oM1wJdw7QI37bKdluKJ0laN8lYE7GFCHylv/WU
 uz1+tGoKHCerdzpTzICusaOuy2XZ6AlhRP4jS+iNAnqXiR8jMI5cIcMqkzA+w0z3NTlV
 o+OUMMoNJB75Sx90L+/dUXxo8CJNjcWIkCd+8ntLNGv0gw7CYKfOB9gNvkSaLZXnPGo0
 8GWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjnvMfWNhlS/2uh5EQ/q118ehyMF6RSPNzl1PowN+rbqPpjG0vehtIO73wjMbcWBPAoedN4wpFIz8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOr76Tbfj3qO4sLndpy3W4ueXvBN/KAJG/8F1MucxOrKu4bRp9
 wZHj8yChag4obPey7jJsPqB2aVt+Jb6fbo8AEYgwRaRTZcsR+SzsFI/Lls3/nuGRnXYX+lHqvdI
 If9cZu9ECzDvo0DGo/JE/jheUIu7itYbt4isCh02RaedTNv2UboUvERLDBrudOaBEMDU=
X-Gm-Gg: ASbGnctblPHaxGBkGv9RalTf53f2eYimKdW23EYHwjc/bHaoSB2XCE9A4TuFhu8I+LS
 zqsmbH8Tykjxg1iFfXYmugBUuoGLlBZCRAm203fb7H9xnxwwpC14TlPXl04am/03sz7Ve1eMQwE
 6IwiJaha3wPwHoPcKoLPqgjQrsAE2WMcIQni3HhiOsaDhqD+uigkYN5mafQ9hRwpaEGKxiqdlaX
 Z7S/ZUTCJTJgzQk2bd2QGr1THsVminRYUiSHDGceJKUvorF33kRCIT4MYV0u4zUho0IOhKnbqol
 gUKCeSNTAmN+VDW87VDgLgKwSroSuXu602Yp9V5tSKc2Fj1bodCwX6M8nIx7C7zr6nvpPU8jMi9
 7Dv1yAET+hTXBWR49TxC3FhcJ
X-Received: by 2002:a05:620a:2916:b0:7c7:a629:8ae5 with SMTP id
 af79cd13be357-7c9607b24e8mr256006185a.56.1745574725877; 
 Fri, 25 Apr 2025 02:52:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECepdx3M8voxwdgIotc4jExjaEsT/aNU+/NJvxWGcXVKGq8zZgS2csyHQXp7J1OZcAB7cxMg==
X-Received: by 2002:a05:620a:2916:b0:7c7:a629:8ae5 with SMTP id
 af79cd13be357-7c9607b24e8mr256004185a.56.1745574725551; 
 Fri, 25 Apr 2025 02:52:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7ccb7c99sm539164e87.218.2025.04.25.02.52.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 02:52:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 12:51:55 +0300
Subject: [PATCH v4 5/7] drm/msm/mdp4: move move_valid callback to lcdc_encoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fd-mdp4-lvds-v4-5-6b212160b44c@oss.qualcomm.com>
References: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
In-Reply-To: <20250425-fd-mdp4-lvds-v4-0-6b212160b44c@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4386;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6zDfbr+Ff50cCHiOONUZ29i4X43jN3/ObgolYfFGR7I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC1s5Y0P8ukyZ1hYkilVgrYffYkcTvLpslNl2w
 sJplHwF+wWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAtbOQAKCRCLPIo+Aiko
 1TaXB/0VGI/G1ISEDOkZaFT9pqBVkHDfekywPNWp5O2H7Z4FvVhu+yHLnRliZHkqzPgLLvuHOnW
 51ZW3cJpWWXK1v688XqY6G7cLyH08XzUAy/8fiEeknzCOzhyeoie+VkN2QQ72nr8vVJjUCgy2Qy
 E5HgCku6uLjfA2r7J6gc0tV5Q6PIGTIRO++sSF7yYagJtC6o/mKWAS5ajyk9MPSEQhm4GKhH89K
 R9Z253sD2HKp/IA5NZkE2gciW5iiTMnqMhB9b+nJzwJfCEvz9mh1u4z/lqsxwB89WbEKKZXI7L/
 HmrAJYr82dKvzyuSCNuqq7tl28rWs2v6wJkffxGi+CxV2Uce
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: aDb4ANMOizQG-8WM78CtY9WNJNtwPp-D
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680b5b46 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=e5J9yQtEsebikEsHgo4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aDb4ANMOizQG-8WM78CtY9WNJNtwPp-D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA3MSBTYWx0ZWRfX1SpvjH6BMS/7
 PTzKMHe7dU/IIgI4js+kzAdB8icCkPeJ+aDMzWfj7Yxk4DiJcFAclG9Daqh3i49wgnpl22d2ET0
 crrd5S9Gmfazd4fyCcrnI9VJ3OP4JmEDEPZp5azUwmXfiuvFiDNxqlFmsVAfwBtoIXrayNR7nUC
 sGS22dpWl3hkwnX3a1cnUi1i7bIGUCzr3P7Q7rQV3QYfvMm40o1zdpT46zuvHZ6QCHoVgCSXSyg
 QirXTRCO7YmP5K+LDgD8J2LtVmQlkuLelrvDq13LOoL7oY4EEh/7eIiYEn7wxTwp2ikf5CmBc34
 9NAUo9+vN/TDbRSOKp/DYL9i/UBWUXeyVaTC3kb/4cV0ASPjdm9ZG/O2X542ewt0DEtHVsySGDg
 P3rSO58j5//d+c6LF8IqPbZ43AxFDKGVGUk4kABf8jozLfuIrW+HwVXFa5rj6FYM92ovbIpk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250071
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

We can check the LCDC clock directly from the LCDC encoder driver, so
remove it from the LVDS connector.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |  1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  | 27 ++++++++++++++++------
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 21 -----------------
 3 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 3d7ffd874e0d234f450f6170e623f87572456757..66f5009fdf8aebcc543b5539d1c2d03075171001 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -191,7 +191,6 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev);
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index 8694e5d7d3f012070c72214df063a6488b2ef707..7f4e8005bc4ae0bc82ec5b87a1fea0530301b427 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -348,19 +348,32 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 	mdp4_lcdc_encoder->enabled = true;
 }
 
+static enum drm_mode_status
+mdp4_lcdc_encoder_mode_valid(struct drm_encoder *encoder,
+		const struct drm_display_mode *mode)
+{
+	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
+			to_mdp4_lcdc_encoder(encoder);
+	long actual, requested;
+
+	requested = 1000 * mode->clock;
+	actual = clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, requested);
+
+	DBG("requested=%ld, actual=%ld", requested, actual);
+
+	if (actual != requested)
+		return MODE_CLOCK_RANGE;
+
+	return MODE_OK;
+}
+
 static const struct drm_encoder_helper_funcs mdp4_lcdc_encoder_helper_funcs = {
 	.mode_set = mdp4_lcdc_encoder_mode_set,
 	.disable = mdp4_lcdc_encoder_disable,
 	.enable = mdp4_lcdc_encoder_enable,
+	.mode_valid = mdp4_lcdc_encoder_mode_valid,
 };
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate)
-{
-	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
-			to_mdp4_lcdc_encoder(encoder);
-	return clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, rate);
-}
-
 /* initialize encoder */
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node)
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index 52e728181b523cc3380d7718b5956e7e2dbd4cad..4755eb13ef79f313d2be088145c8cd2e615226fe 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -56,26 +56,6 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static enum drm_mode_status
-mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
-			       const struct drm_display_mode *mode)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-	struct drm_encoder *encoder = mdp4_lvds_connector->encoder;
-	long actual, requested;
-
-	requested = 1000 * mode->clock;
-	actual = mdp4_lcdc_round_pixclk(encoder, requested);
-
-	DBG("requested=%ld, actual=%ld", requested, actual);
-
-	if (actual != requested)
-		return MODE_CLOCK_RANGE;
-
-	return MODE_OK;
-}
-
 static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 	.detect = mdp4_lvds_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -87,7 +67,6 @@ static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 
 static const struct drm_connector_helper_funcs mdp4_lvds_connector_helper_funcs = {
 	.get_modes = mdp4_lvds_connector_get_modes,
-	.mode_valid = mdp4_lvds_connector_mode_valid,
 };
 
 /* initialize connector */

-- 
2.39.5

