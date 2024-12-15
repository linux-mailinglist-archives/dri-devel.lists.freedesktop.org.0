Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4A39F26BF
	for <lists+dri-devel@lfdr.de>; Sun, 15 Dec 2024 23:44:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA7A710E504;
	Sun, 15 Dec 2024 22:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oYz9/Hc6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF8AA10E4FC
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 22:44:43 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-3003d7ca01cso35804981fa.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Dec 2024 14:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734302682; x=1734907482; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p3ya0uf+X/5LflLMl2LmIKqbo+eF2aO1biOR6h0Hx3w=;
 b=oYz9/Hc6RcSYTN+8LlEklwRp+UgcmN9YE/MpekRZgI4witDc5HVIrqs8l3GXYYWLYz
 XsyAOwRin45KfLRiiICnDCj/X36MwmYq9ky4JKVbw27BgZ4qDO1dll1L+LSfM0x1Pnwo
 GI4OeSlqj7C2lrkdB1KmlcbYEV0y7Q5eV2bYCgnlTqAH5o9p1i84FaBMqSRgXgCiNxiR
 HRah/7u3t1eDAs7C8ibK4Ehj51G1diiMrXKusWW0l6rUVjEvD4dHtAR32m7/021JFK0v
 wLm8Kks+4GDdNgjTEHU6pc1gaGGANpqxKuUnfqO1ud4c8s3k14LKJp3c3NKmo4s0r6sp
 Rfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734302682; x=1734907482;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p3ya0uf+X/5LflLMl2LmIKqbo+eF2aO1biOR6h0Hx3w=;
 b=M9N0ob2ozjMXCpJu5PV6O/QcGT21dJY24rM1keoeLQGTTlydK5pgGGe/OdVKjyBGL/
 gha95yjVh4h5dati84h2u6A35nCNzHGMRz/rWKelgB1mNfpsuUe2pkk3uRqn27StVoR3
 0s8aQp71LzrKSMmZV47LPFyQu/7ex5iTJNMXGQes38GAfAvYxuHlSnr89j95s+HQY75p
 RdiCHiUHnw262vGjCimpLwLDdLtcgASNUo5wgdlVLHoYl6/ZqBOhEz+d9khBcDkhpNLi
 0Da+HaOLS++AgHomyRxzZKKlb0Mp1NPhBqfEqEBLL1Ki6wsRjXoFyK0fsiL1ycz6nHnL
 Utpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkyXG1qQPGe5hvJ4Y84R2DOilwfkelaW0SGgOzFlmADUmftENTp5Hy8TbWPsyFVSOdsCViAumvcks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyl6mTvjKL6FJIDoGheIg/Q9cNdEZ0nDldo1t2k3AzWOCPgsnGH
 dSPuYCY5rvfkO5WmcAjJx6Sno2W71q8DpBnwVwqwMhMujOOjWQFV627IRdUNRO4=
X-Gm-Gg: ASbGncu3+Iz5dI414YviTskR+XX+u5tpChWkhMk+M9teUAW9fZDKQAvYiJf/jGj9x2t
 ExpbD6nzmE+PIeLov5gHqQ+wdGtfrIJ494sbWSZXrFsJaxICuiIGE7VqsisaF8y5qnvxiLqUmGg
 t6DdZq/vyiK6PJuXNVLZPiwIm6yH4YGLhHJkfZcpl56zQzCVQ6pX3HPBP2rSLde4gNF6/Yv5dZe
 MhbJuknw3NJlAqbEbu7hDC1Gn5FQmqxB3dff1v1MeWvGJbbz93CDgnlQH0PrVlO
X-Google-Smtp-Source: AGHT+IGK7YkMz6cXViIekovAJnhksAaRJ1ieDUkwJ0uvNYgg+BRdckvLCV7J4GnRgdoovXpmRt/yjg==
X-Received: by 2002:a05:651c:501:b0:2ff:a928:a23e with SMTP id
 38308e7fff4ca-302544ab0dbmr38659811fa.25.1734302681997; 
 Sun, 15 Dec 2024 14:44:41 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441a41d1sm7201701fa.100.2024.12.15.14.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 14:44:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 00:44:17 +0200
Subject: [PATCH v4 12/16] drm/msm/dp: move/inline audio related functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fd-dp-audio-fixup-v4-12-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14086;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=C41fEIxEnJGxNs6qFd5ivcvADUIm3RmmztLjq82DXUY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX1u69g9Med2PCepsoM04XgpHewj0L41hwE0LN
 JfPeO+oHe2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ19bugAKCRCLPIo+Aiko
 1VvHCACNqypDT5X7U4q4IAHPUxP1jFbQ40DhuKh6qvcx5a9dGPuSs/SJfATi5CaKWNEehmEB5+m
 Sp1i80/XdzpiX556yWrO9tVxQjoHNP+7GMbL96RbwyvXxEx4SSTztHneb9Y4F/k+aPrvWLrcPY3
 Tu6juiFgXdUY9isXL6Zsy0M1ta2OuO1gLiSHMaZsJSXL8X4oDJ1kFVagLvymKX58N52VsrlAuVc
 B9uBuRnpvn2WZtuHtYDaxNajnmF6VAaRzOpELA/nrrb038o0vcISNNy3Iy/APwoDA8H8NFfqCyb
 bG/1+1IG5cESMtqjhx58WYL5iB73QY0ma+Qs8/TuNZgSstbb
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Move audio-related functions to dp_audio.c, following up the cleanup
done by the rest of the submodules. Inline functions with simple
register access patterns.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 112 +++++++++++++++++++++---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 166 ------------------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h |  16 ----
 3 files changed, 98 insertions(+), 196 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index a4b792624ccc444f8912eb967d722cb94f6d4087..6a6b4032548cf3298e7fa75795401ec0925d48d4 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -31,67 +31,129 @@ struct msm_dp_audio_private {
 
 static void msm_dp_audio_stream_sdp(struct msm_dp_audio_private *audio)
 {
+	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x02,
 		.HB2 = 0x00,
 		.HB3 = audio->channels - 1,
 	};
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_catalog_write_audio_stream(audio->catalog, &sdp_hdr);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
 }
 
 static void msm_dp_audio_timestamp_sdp(struct msm_dp_audio_private *audio)
 {
+	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x01,
 		.HB2 = 0x17,
 		.HB3 = 0x0 | (0x11 << 2),
 	};
+	u32 header[2];
 
-	msm_dp_catalog_write_audio_timestamp(audio->catalog, &sdp_hdr);
+	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
+
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
 }
 
 static void msm_dp_audio_infoframe_sdp(struct msm_dp_audio_private *audio)
 {
+	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x84,
 		.HB2 = 0x1b,
 		.HB3 = 0x0 | (0x11 << 2),
 	};
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_catalog_write_audio_infoframe(audio->catalog, &sdp_hdr);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
 }
 
 static void msm_dp_audio_copy_management_sdp(struct msm_dp_audio_private *audio)
 {
+	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x05,
 		.HB2 = 0x0f,
 		.HB3 = 0x00,
 	};
+	u32 header[2];
+
+	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
 
-	msm_dp_catalog_write_audio_copy_mgmt(audio->catalog, &sdp_hdr);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
 }
 
 static void msm_dp_audio_isrc_sdp(struct msm_dp_audio_private *audio)
 {
+	struct msm_dp_catalog *catalog = audio->catalog;
 	struct dp_sdp_header sdp_hdr = {
 		.HB0 = 0x00,
 		.HB1 = 0x06,
 		.HB2 = 0x0f,
 		.HB3 = 0x00,
 	};
+	u32 header[2];
+	u32 reg;
+
+	/* XXX: is it necessary to preserve this field? */
+	reg = msm_dp_read_link(catalog, MMSS_DP_AUDIO_ISRC_1);
+	sdp_hdr.HB3 = FIELD_GET(HEADER_3_MASK, reg);
+
+	msm_dp_utils_pack_sdp_header(&sdp_hdr, header);
+
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
+	msm_dp_write_link(catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
+}
 
-	msm_dp_catalog_write_audio_isrc(audio->catalog, &sdp_hdr);
+static void msm_dp_audio_config_sdp(struct msm_dp_audio_private *audio)
+{
+	struct msm_dp_catalog *msm_dp_catalog = audio->catalog;
+	u32 sdp_cfg, sdp_cfg2;
+
+	sdp_cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
+	/* AUDIO_TIMESTAMP_SDP_EN */
+	sdp_cfg |= BIT(1);
+	/* AUDIO_STREAM_SDP_EN */
+	sdp_cfg |= BIT(2);
+	/* AUDIO_COPY_MANAGEMENT_SDP_EN */
+	sdp_cfg |= BIT(5);
+	/* AUDIO_ISRC_SDP_EN  */
+	sdp_cfg |= BIT(6);
+	/* AUDIO_INFOFRAME_SDP_EN  */
+	sdp_cfg |= BIT(20);
+
+	drm_dbg_dp(audio->drm_dev, "sdp_cfg = 0x%x\n", sdp_cfg);
+
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, sdp_cfg);
+
+	sdp_cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
+	/* IFRM_REGSRC -> Do not use reg values */
+	sdp_cfg2 &= ~BIT(0);
+	/* AUDIO_STREAM_HB3_REGSRC-> Do not use reg values */
+	sdp_cfg2 &= ~BIT(1);
+
+	drm_dbg_dp(audio->drm_dev, "sdp_cfg2 = 0x%x\n", sdp_cfg2);
+
+	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
 }
 
 static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
 {
-	msm_dp_catalog_audio_config_sdp(audio->catalog);
+	msm_dp_audio_config_sdp(audio);
 
 	msm_dp_audio_stream_sdp(audio);
 	msm_dp_audio_timestamp_sdp(audio);
@@ -102,8 +164,7 @@ static void msm_dp_audio_setup_sdp(struct msm_dp_audio_private *audio)
 
 static void msm_dp_audio_setup_acr(struct msm_dp_audio_private *audio)
 {
-	u32 select = 0;
-	struct msm_dp_catalog *catalog = audio->catalog;
+	u32 select, acr_ctrl;
 
 	switch (audio->msm_dp_audio.bw_code) {
 	case DP_LINK_BW_1_62:
@@ -124,13 +185,17 @@ static void msm_dp_audio_setup_acr(struct msm_dp_audio_private *audio)
 		break;
 	}
 
-	msm_dp_catalog_audio_config_acr(catalog, select);
+	acr_ctrl = select << 4 | BIT(31) | BIT(8) | BIT(14);
+
+	drm_dbg_dp(audio->drm_dev, "select: %#x, acr_ctrl: %#x\n",
+		   select, acr_ctrl);
+
+	msm_dp_write_link(audio->catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
 }
 
 static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
-	u32 safe_to_exit_level = 0;
+	u32 safe_to_exit_level, mainlink_levels;
 
 	switch (audio->msm_dp_audio.lane_count) {
 	case 1:
@@ -150,14 +215,33 @@ static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
 		break;
 	}
 
-	msm_dp_catalog_audio_sfe_level(catalog, safe_to_exit_level);
+	mainlink_levels = msm_dp_read_link(audio->catalog, REG_DP_MAINLINK_LEVELS);
+	mainlink_levels &= 0xFE0;
+	mainlink_levels |= safe_to_exit_level;
+
+	drm_dbg_dp(audio->drm_dev,
+		   "mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
+		   mainlink_levels, safe_to_exit_level);
+
+	msm_dp_write_link(audio->catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
 }
 
 static void msm_dp_audio_enable(struct msm_dp_audio_private *audio, bool enable)
 {
-	struct msm_dp_catalog *catalog = audio->catalog;
+	u32 audio_ctrl;
+
+	audio_ctrl = msm_dp_read_link(audio->catalog, MMSS_DP_AUDIO_CFG);
+
+	if (enable)
+		audio_ctrl |= BIT(0);
+	else
+		audio_ctrl &= ~BIT(0);
+
+	drm_dbg_dp(audio->drm_dev, "dp_audio_cfg = 0x%x\n", audio_ctrl);
 
-	msm_dp_catalog_audio_enable(catalog, enable);
+	msm_dp_write_link(audio->catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
+	/* make sure audio engine is disabled */
+	wmb();
 }
 
 static struct msm_dp_audio_private *msm_dp_audio_get_data(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index b323fb3341280963012b605483d4f3c7190fd7d5..9f1ce4f8cc43b767151af102b5127b48e1ec84c8 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -303,169 +303,3 @@ struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev)
 
 	return &catalog->msm_dp_catalog;
 }
-
-void msm_dp_catalog_write_audio_stream(struct msm_dp_catalog *msm_dp_catalog,
-				       struct dp_sdp_header *sdp_hdr)
-{
-	u32 header[2];
-
-	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_STREAM_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_STREAM_1, header[1]);
-}
-
-void msm_dp_catalog_write_audio_timestamp(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr)
-{
-	u32 header[2];
-
-	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_TIMESTAMP_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_TIMESTAMP_1, header[1]);
-}
-
-void msm_dp_catalog_write_audio_infoframe(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr)
-{
-	u32 header[2];
-
-	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_INFOFRAME_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_INFOFRAME_1, header[1]);
-}
-
-void msm_dp_catalog_write_audio_copy_mgmt(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr)
-{
-	u32 header[2];
-
-	msm_dp_utils_pack_sdp_header(sdp_hdr, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_COPYMANAGEMENT_1, header[1]);
-}
-
-void msm_dp_catalog_write_audio_isrc(struct msm_dp_catalog *msm_dp_catalog,
-				     struct dp_sdp_header *sdp_hdr)
-{
-	struct dp_sdp_header tmp = *sdp_hdr;
-	u32 header[2];
-	u32 reg;
-
-	/* XXX: is it necessary to preserve this field? */
-	reg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_AUDIO_ISRC_1);
-	tmp.HB3 = FIELD_GET(HEADER_3_MASK, reg);
-
-	msm_dp_utils_pack_sdp_header(&tmp, header);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_ISRC_0, header[0]);
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_ISRC_1, header[1]);
-}
-
-void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *msm_dp_catalog, u32 select)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 acr_ctrl;
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	acr_ctrl = select << 4 | BIT(31) | BIT(8) | BIT(14);
-
-	drm_dbg_dp(catalog->drm_dev, "select: %#x, acr_ctrl: %#x\n",
-					select, acr_ctrl);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
-}
-
-void msm_dp_catalog_audio_enable(struct msm_dp_catalog *msm_dp_catalog, bool enable)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 audio_ctrl;
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	audio_ctrl = msm_dp_read_link(msm_dp_catalog, MMSS_DP_AUDIO_CFG);
-
-	if (enable)
-		audio_ctrl |= BIT(0);
-	else
-		audio_ctrl &= ~BIT(0);
-
-	drm_dbg_dp(catalog->drm_dev, "dp_audio_cfg = 0x%x\n", audio_ctrl);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_AUDIO_CFG, audio_ctrl);
-	/* make sure audio engine is disabled */
-	wmb();
-}
-
-void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *msm_dp_catalog)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 sdp_cfg = 0;
-	u32 sdp_cfg2 = 0;
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	sdp_cfg = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG);
-	/* AUDIO_TIMESTAMP_SDP_EN */
-	sdp_cfg |= BIT(1);
-	/* AUDIO_STREAM_SDP_EN */
-	sdp_cfg |= BIT(2);
-	/* AUDIO_COPY_MANAGEMENT_SDP_EN */
-	sdp_cfg |= BIT(5);
-	/* AUDIO_ISRC_SDP_EN  */
-	sdp_cfg |= BIT(6);
-	/* AUDIO_INFOFRAME_SDP_EN  */
-	sdp_cfg |= BIT(20);
-
-	drm_dbg_dp(catalog->drm_dev, "sdp_cfg = 0x%x\n", sdp_cfg);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG, sdp_cfg);
-
-	sdp_cfg2 = msm_dp_read_link(msm_dp_catalog, MMSS_DP_SDP_CFG2);
-	/* IFRM_REGSRC -> Do not use reg values */
-	sdp_cfg2 &= ~BIT(0);
-	/* AUDIO_STREAM_HB3_REGSRC-> Do not use reg values */
-	sdp_cfg2 &= ~BIT(1);
-
-	drm_dbg_dp(catalog->drm_dev, "sdp_cfg2 = 0x%x\n", sdp_cfg2);
-
-	msm_dp_write_link(msm_dp_catalog, MMSS_DP_SDP_CFG2, sdp_cfg2);
-}
-
-void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *msm_dp_catalog, u32 safe_to_exit_level)
-{
-	struct msm_dp_catalog_private *catalog;
-	u32 mainlink_levels;
-
-	if (!msm_dp_catalog)
-		return;
-
-	catalog = container_of(msm_dp_catalog,
-		struct msm_dp_catalog_private, msm_dp_catalog);
-
-	mainlink_levels = msm_dp_read_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS);
-	mainlink_levels &= 0xFE0;
-	mainlink_levels |= safe_to_exit_level;
-
-	drm_dbg_dp(catalog->drm_dev,
-			"mainlink_level = 0x%x, safe_to_exit_level = 0x%x\n",
-			 mainlink_levels, safe_to_exit_level);
-
-	msm_dp_write_link(msm_dp_catalog, REG_DP_MAINLINK_LEVELS, mainlink_levels);
-}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index f652745ae3fd5fe322b7a59b78446ec5b71c044d..a6d662f5a0d95cdb8f40a9d03be1e7627907b176 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -130,20 +130,4 @@ u32 msm_dp_catalog_ctrl_read_psr_interrupt_status(struct msm_dp_catalog *msm_dp_
 
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
-/* DP Audio APIs */
-void msm_dp_catalog_write_audio_stream(struct msm_dp_catalog *msm_dp_catalog,
-				       struct dp_sdp_header *sdp_hdr);
-void msm_dp_catalog_write_audio_timestamp(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr);
-void msm_dp_catalog_write_audio_infoframe(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr);
-void msm_dp_catalog_write_audio_copy_mgmt(struct msm_dp_catalog *msm_dp_catalog,
-					  struct dp_sdp_header *sdp_hdr);
-void msm_dp_catalog_write_audio_isrc(struct msm_dp_catalog *msm_dp_catalog,
-				     struct dp_sdp_header *sdp_hdr);
-void msm_dp_catalog_audio_config_acr(struct msm_dp_catalog *catalog, u32 select);
-void msm_dp_catalog_audio_enable(struct msm_dp_catalog *catalog, bool enable);
-void msm_dp_catalog_audio_config_sdp(struct msm_dp_catalog *catalog);
-void msm_dp_catalog_audio_sfe_level(struct msm_dp_catalog *catalog, u32 safe_to_exit_level);
-
 #endif /* _DP_CATALOG_H_ */

-- 
2.39.5

