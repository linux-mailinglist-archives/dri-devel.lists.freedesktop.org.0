Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748E59995AC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 01:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E308610E9FD;
	Thu, 10 Oct 2024 23:20:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="HFYSs3IV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic308-18.consmr.mail.ir2.yahoo.com
 (sonic308-18.consmr.mail.ir2.yahoo.com [77.238.178.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC28C10E9A8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 18:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1728585121; bh=IVfo7djHn4E/gSfrgafllB8vhzaZmFnMX4/kh+1ZHS4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=HFYSs3IVPBjlgiKQuEWpL1ExXDx2kjAqJoXshmWzPDVLgPykrCIGJS4006FCUvKx4qvh/4AqzMnZgEKhWAT6p9MwWmGRG5HO/VFrNdOSG9rVXwG7FAtljM5oqDmT3Sq52IeAdxzFA/9bBV/0ED0oxVsV6o4oVtHsPmaZwPyxMTeGYvK6D1hnCoAedQigwscCcQooaX4Gtsr9gBxIjWkBThAUJyvkjtNL/2RMNV4oR5yQN239elxLJvjt8fON9bOMUvd8FiKHik03FM5YCrZUgvsjwsDyx/b7JuRYt7OJY/QfbbmeBbzLDR0C8ct+Amot7qbW0KzxHvM9jfWBAhG+yA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1728585121; bh=U8bEf+GgCv7XRNrQffp/gi0nJLdxhtxeICLoLWgXxS2=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=LBcxMvtvRr6AawxeK2PIXUZGQu/qJ5/Bgs9JYOa82mzZkvf1ZJEyX0q8JWc44m6F26KLIKhCyEWVPJ4i6zMfCOmZX62MA6MMTMq4pBGoRlRqCDd0IURfoyHZt1xJQTw3EbXhHgh07EOwNYp3sBxKzO97qT4Cg+A/XW9QHKKpPdLLyo7a1az4HZGF0tau11FzKKLuQX4YPmglQRtXq3yP6lXsd2KsuPZa9hyuruDGKUIEp56S3r8AWQMCg9mDLEFc/e8iGEtW0cyeHIpUyGIyIRd9O18OpMUl/+IbnVOVj6uslTumTGew9+kUGKUUN3bwu8lHM75s616mkgIRjR2qpw==
X-YMail-OSG: 7fq7bQIVM1kYuCzJK3MU9or9tkfjWMRXocQVEGDF87ZBxVtO0RJtIZplkT4yovU
 jzYeq7Ioq.lSOmmQ.2f4uBsPmBFNVRRLiqNWJxTRs_B3j23A.CDJQomDIULVF_2qvxAQSLMvLgOc
 6c2qRJStjTy8WDAwYJEQ6AxeUoTQefLYKVqPr4wZEzqP5ERhrjrGNOXKWSGmtP1gF7fAn4J3cAXh
 pTB1vQP0EZmrTUPLb7M4hpmptM7GRLY9GNZZsadANxr_KKen2_E2mTJi7atllYuAiEQBAgp3gQnE
 k_d863n5vk5CmsuqecWGmbEzpE35.HklPIarIyoDgYUw3fWmIpJiFRL_dviyQtHm704PPCX1DnbJ
 XNuA7gBPMcG9PBHMVbfrqqpOLiaCWxn8LsFftVcUPINxh2Ui3xFOmZ5mbGTHEJ7QtKoSdYYrk70.
 a7_uuRO2YLu7TmmsxAXHEzRwdWoAdBHyHWr5HdeykheegahRmR8Tc9QlAttEp3c_b3l8PyoxNxFs
 Vi6YvGv5Jl4Vz9upCtC25IYR2SiqfX_mBxZSYkkRkWQ.W_pzsIWPnalu16fPmt9WRyjIiuUbvmPF
 AgGpahqGfW358dF4C20gSb4WFtnvb5VE4xHmXEuDnCUl6NnakxNFOJzLaL2iZWrod7ZeSwV13itp
 gAccMDIFizbYMOOIzGoqVvXhHPRwELWi6K0eLWWHpmHSVXkZBFpqj3VcNvnp2mw0tRFoDc6S.orq
 uLOKKwZo_Ei0pJgSnOW.e6l4GeYrL7BHHxkyue5kjvAO64V4CKuxQVzgciPgcgtajyTnNktuzqQs
 GtSBR_fjxfsGAEUOWYAz_SYoZAtE00gzof81gfxaAf5vaqGb.PW6fNvqJRObEUDmENjvCBt8pl1p
 J9B8Cq0rs_pLlxHZ3XcrIK93XXRH8cThQotKxKixM87eV2cAoV6.5.SXryyALCshmNdkFsEFLdPX
 mzwSqYdzpMie.56fbfumaPD8dZ3D0eBwnlaZaiaYTOQlH.dUKiGiqqpXyYD8yzuTOQzw0h7fkiZW
 F8cg7Lz1F_k.hyvqxfg26U_vIEgJZtD0qSxr_DxKsEw.evwxF.1n.jyR9uQsb7W5SEw8h9M5TtDB
 gOAIPJm7nhu.ce50bOgBJOMyhRKII6XhC3lrV59vqPutnwD.PMUIQPGLcO1aTxdn18Go7Rqs5wrE
 zMBHIKpTrvouWZmgB67.O6DG1Ovnt2Ne.xN8q391y7NyDhMt0inuLFHKwM8lF6_8aSurKB91V2Et
 n55ZRG71Yc1IDavcAVuTD.iBu5Cv2pWUocpU9eS35Eunk455vD_mzEPvIbNRLw7lTrDSv9RlBAof
 Zbn37PtC7qZTKJRCSUM9yAgCyG5U0tXS_Ztp2ms3144517yW8CtAWHJInzLYr63n4IrEQNebvSFf
 TDBkMSp0QyCNYQ3v2FGKVi0JZfgcHRzc8BivMhS7QtNm2H_KHXx9BnlC0JuzUVuwWfPluLnhefX2
 ZWUQs0_gcrOLfOgw_.7odMONLaEz0P4KtrnCglaIgyUQpDxQAPEqAlwNSFQuRRS.tNZwFyI.455q
 2vobW.a0XzYgqYxNH1Yj8JHR1nn0ZNum8ssnLf06OxUokPiLrSMAdfhRQ3txdf8.eU1EpfV7fFgU
 YTiHqWvR0GSJrb5FmtOncckjGd9rA_T4kVZnx4iUsT.P9BBd9fAOnH2fKl_35POJjPzQxnTqTpai
 guPilNze70Uu1yQfipZucp7j.Wo_NFco4EuSGl0rgHHAJeqq7mPMc5awZVOtzLHuwYuMx9dHqu8P
 VeMrMzeeuhVD0ftgnSXI01nvp1W4_5Dzp2UtbIQbu0RcoPH6kMXdntx9tG2T803q7ZnuTG2Sucrb
 jmHD2tiBcekdmnC.rt9CTnscLCpzRU7otJ8EHXh5BKF94l7WHwMYQGI9.48j4enRBk8LZd7yJPoQ
 BbeIpLmMrmVY6g2YhA9UgHs2yREIVt0hz2NR_BxaUHBC.jSTyU9SQMxbrrwfaUqntNNhhkohRAMD
 ggYZsvFTjcIrhR5GCbm9xMuM.OBxg93cMRNwAa6kjkRW8AzLhpL9A1zBEGlBCp83P6ClRA3RyTKM
 FDM7euuqyJaANYVoa4WswDjtWMhlFfp8gWM6v2l01eu6Q3KXhHx.P0QwLLQPtb4_70S6kqAgX7ks
 3nGnxfn9j17LRxU8Xv1Z9e7UjCJvEcL.kCZ.MWUeQ48pEwk2sSbzFqruaSlEIvUzJKeWpUGzZdhf
 l9BNdHM6LOR1F8xh_1IhLXj16a2mNHw4NtFo5crHc9gHEl8n0lmNPCEUFPUMtZC_zF27TdnTM_cZ
 ltucKazhJyfjSfEdDj1eOQHra7LSDKjJeVyIsJOQri8iLXP6XjViCDymy1w--
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: 7a3f520f-1a87-4daa-a1f8-fdf9c98d8612
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ir2.yahoo.com with HTTP; Thu, 10 Oct 2024 18:32:01 +0000
Received: by hermes--production-ir2-6664f499fc-97g4x (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 7a7b462d09211a1a6528a42ebeb90f61; 
 Thu, 10 Oct 2024 18:32:00 +0000 (UTC)
From: Jakob Hauser <jahau@rocketmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Jakob Hauser <jahau@rocketmail.com>
Subject: [PATCH 4/4] drm/panel: samsung-s6e88a0-ams427ap24: Add flip option
Date: Thu, 10 Oct 2024 20:31:51 +0200
Message-Id: <70ea852342001779956905ed9002a977d1d95293.1728582727.git.jahau@rocketmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1728582727.git.jahau@rocketmail.com>
References: <cover.1728582727.git.jahau@rocketmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 10 Oct 2024 23:20:22 +0000
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

The way of implementing a flip option follows the existing
panel-samsung-s6e8aa0.c [1][2][3].

The value to flip the screen is taken from a downstream kernel file of
a similar but older panel [4]. The mipi clock [5] for the new panel
samsung-s6e88a0-ams427ap24 matches 461 MHz and a hardware read-out of the
0xcb values corresponds to revision R01 of that older panel [6]. Although
for samsung-s6e88a0-ams427ap24 that's in non-flipped state while in this
older driver it seems to be the other way around. Further up there is a
hint [7] basically saying for revision R01 to change the first word of the
0xcb command from 0x06 to 0x0e, which is actually setting BIT(3) of that
word. This causes a horizontal flip.

[1] https://github.com/torvalds/linux/blob/v6.11/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c#L103
[2] https://github.com/torvalds/linux/blob/v6.11/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c#L207-L211
[3] https://github.com/torvalds/linux/blob/v6.11/drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c#L954-L974
[4] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c
[5] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L2027-L2028
[6] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L137-L151
[7] https://github.com/LineageOS/android_kernel_samsung_msm8930-common/blob/lineage-15.1/drivers/video/msm/mipi_samsung_oled_video_qhd_pt-8930.c#L66-L74

Signed-off-by: Jakob Hauser <jahau@rocketmail.com>
---
 .../drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
index 657120d7dd33..4d5c494e03ae 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
@@ -32,6 +32,7 @@ struct s6e88a0_ams427ap24 {
 	struct mipi_dsi_device *dsi;
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset_gpio;
+	bool flip_horizontal;
 	bool prepared;
 };
 
@@ -539,6 +540,10 @@ static int s6e88a0_ams427ap24_on(struct s6e88a0_ams427ap24 *ctx)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc, 0x4c);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x03, 0x0d);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0xa5, 0xa5);
+
+	if (ctx->flip_horizontal)
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcb, 0x0e);
+
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5);
 
@@ -673,6 +678,15 @@ static int s6e88a0_ams427ap24_register_backlight(struct s6e88a0_ams427ap24 *ctx)
 	return ret;
 }
 
+static void s6e88a0_ams427ap24_parse_dt(struct s6e88a0_ams427ap24 *ctx)
+{
+	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct device *dev = &dsi->dev;
+	struct device_node *np = dev->of_node;
+
+	ctx->flip_horizontal = of_property_read_bool(np, "flip-horizontal");
+}
+
 static int s6e88a0_ams427ap24_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
@@ -707,6 +721,8 @@ static int s6e88a0_ams427ap24_probe(struct mipi_dsi_device *dsi)
 		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
+	s6e88a0_ams427ap24_parse_dt(ctx);
+
 	ret = s6e88a0_ams427ap24_register_backlight(ctx);
 	if (ret < 0)
 		return ret;
-- 
2.39.5

