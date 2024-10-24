Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E559ADA5C
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 05:18:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501DC10E895;
	Thu, 24 Oct 2024 03:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="K6RXJMx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic308-19.consmr.mail.ir2.yahoo.com
 (sonic308-19.consmr.mail.ir2.yahoo.com [77.238.178.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B342E10E895
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 03:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1729739925; bh=79TTgeSRgbvLQ5EeGH6nXTjmRqDQiiJWsR2p+Y4a46w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=K6RXJMx4efk/kfdoPT8t66YMv+lWnVIfgXMPywQKMs5+Stl4QxdR2a8Oiylw8P7es5RgjPTv39+eq3gJ/Vd7s5SuJDduxWYxRdyELA0bthc7ENXmCsqssEVQGcexwPqF4+J607rJ5VPcL1YHrGAjh0mCZPD7cJONHq8pBGTgLozxstMAyJxwGnqX+LwfwZ6sp7ddd5lCeMDm/jCZtJ1CUw/epgPEDFAxz02qMv7bh/tqfXfGuxYnBVQCNzSIQEyMUj3FNgqtxno/Fz6jEfdwAbzcpBfhLaU4QSLUGfMMjdmYFY0z/7YDNIS+UmZqdZHCQHtsuCrR1RRV0wbsNFQaGg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1729739925; bh=RLs8KMmf9kbIEkQAxyfmM9AM+/GXCG/ao9aYbe8owHL=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=lOtAAbkyHhm4S0NLfGpCns/ZqTXolSTdJSajVUc1ZUh9B2bajx1kq3p/+9exAlQOQNN5CRhl45p2xeJE8mFvPsAKHVxJaKEPy85bfa+KKGApM8BRlPEn76F90ldK6IBGeXB+UX86t/GpS8W4J5totwquOVmjoHwexKFqhicYL/hUjXbEDnldM2RUzirKyq3f2E2uDGdQAYtvhGBV9hESQpzRWvB9Q8Syrr/pffJ3nrbPv0lHGANNN3I1EFofvp4qdxfEeRZgCAWm9xttimSeD37B3ozAl9QjLVnTKJ+uh6iLX9YfccSC0gFdWNFSJMHjw8Nb3p+9k0BWZdOWs0CWtw==
X-YMail-OSG: I3w5KVsVM1l7Gg5jEccNc1L_RYXR3druZjKvug9S.34znC6ysMfqa3nLT9.dcQl
 t9l.GXVlgNWupxesQVywQO0nB7fOHji6phD.3WuyZR2E719ZYG061GYylhZThOeZ.z8RzPzq0E.k
 L4O5bnhVlUkjH92tJEj1rx0Izugv6HHA5w38I1k_9LMV.PF2FQGPuImkUWrM1WMgFifk5XMoIFKa
 IBM4WbgnB_oykhDtN1vRwL5cGhEyrs24MbvFxDuTfSfOCGhRmHW_MpuyFP8MqcXKJ4LXPj7LLpXg
 nBbGnqIpy4UXwzFcwzr4SfSHmrUtOGu63xK0TunKId35aRJgs6A54FJWVGQrMUvyTLvpfDkX7_15
 Fz.QKijFLJJKGqCqcnfQxi4hQ7nduO8gRo33UUwrLod4KjrPDUcypxFRAJBkPQ0rnk00XSioNTuM
 zZ6uWIy_0_bWubja69IIxM3W8GfNtsd1vWfxE..I3Uf_FlZtH_wCDQgEfSagv_uq82IKmV6e4FwH
 .DWz7LUtZQusyjqSSSl_Z22MGbQaZXQIXCJr9SzzNBNu4hbS5w5_XpIqIPMv8VVqjLhZsJITTN49
 zHfTJkkNcKhH2sONyjPj4frNn.F_xESF0fEhhwiXVMGhArWUZOyw3Jvq4AqDrZJOx3A1SuHLR0iH
 UKXPNLejBW2vdNOlLOuaDJQEhbF8e3dvmRZQI9pXiGjK1lNPDlVjU8lI2_6o6_VuHJlJ003kGgen
 FClvCRyFakP1i_FR2XiKpxRbtBdsK.goDRHB6BZS1VSJJRpmKftcUWHNArDfjQn2ROonlhMiFvCM
 2VcIdYSDoSuGgiRGzYB6LhHJyfrIU0hiBkoWEe0TWW_KLV7RCNqb4sGK8Ztw1eEuQ5YTj1f6DkUV
 kOBdurGQ6LgQ4jnbZJnhffmjhBuBQnRVVcfBXW1akTtJan3zfAVDiNQqyTKELtiOOY0xk6_F4_na
 QFw.SmmtLnDZdEJOFP32eE9SYub9LgSG6dkhPEMFiytsaSgs5XRyVgJiMlqL5ey7fJO98Xc02kNQ
 dNYhQX8YcrQaN0iX0.Airuq6MEtvoioUHwfygCJvFy4rWHWofNmQysH9_3xuHl6B6_FxLEpLLY7X
 JR0OnZRlOJkPRRKdIn1xpYxLh.vsKxezu1dh35ErkvefroQee9q81cGpy.kjkeJIot8DWoabf2Tr
 EDc5LmZ0yWZYRLAHS6mGYozywPICqiHTBxMP9zXb8b5qxC1SSrMW2jx10_mOi1763saiv4aCdoQZ
 qe9nNpHHX5icXNo1emkrBbMcTrg69qldkXumVr7yxaB__ItqhXpjNEKD0t4.Md2qPrMkQOhgT8NA
 ept1AG4TBI1D0faS4DLW2rsMBAGeroBrZ7wgSkT6NIVEPtspV_IOExS6xndCpV02KfaBXKap3upr
 ixe4rRwM.tv.QSZ_7a67ecJcJkPoNb0r._p7Yy02JnJRJ2t24WoBYhuUhxawX77N2NKu72MMIOw7
 yPZFwgy3gmsOz_ZsFTB5cYmygiYeLFayI3zcWS_CuU21YiGw5riOYKwoMYiY98wPe1fkMWqHzRtX
 rjuOyOdFYFdsGGobN5Zmo70d85zBbbXy.qBRf8s3UNUsg0sZGaZ4sJWwo3tawWcEJxwZ3msICtIg
 HmLw7SO6J2nzZkrtCyefFQnNHuiyope0a41UIq0cyY6EA_puOogT_lY3r.rXnqoy0XpiLHhiNS_V
 rKk7rAQZSmzs5DNoSZQToIsygq3QVdi6m5v9nf9_RcEN5AIL2IqYh4CxQgl3xyGuGgQf.3Fp4FVG
 xXizUSnPxZQ53xFyiU8zCW4yNegf.dK6vrAKHE4JIQXzIWfxhv2.vwnvLCteXeVKitUsacD1_ClZ
 MP_SJm1vQgQow6XqAyMKfZJR71yYaUl5enVAXk_nJg.8.NZwB3MRGTBn5mCmqUzlBPm9nJ5jd9ex
 spdjeiKQX4zv0lqhZJfy74HrZZ_g6cNviSt1QAzN5tBBW2Pcc_lvYd4uwCQCNuFub7HECp.H_qZu
 IxoK8gm1sBHY9hqV7Cx0NDikkBYvK97RSQKN.yGYPdmPdMFUGpSkhoRfNIUdcXI5Z.Ob7l56O1Mq
 ml3vEotSo5PBxOoMO8eMu6Y_L8wNi23rbg1is5Upt1w6vQ3paHuNBXcOGdHzYhwJuMo4SHURqIWc
 OPgIfrHO6EmLYBNMHc4E0NHf3Bv6dPfEPuY_RnkjJdFSwSCWoNeR1k2UmrmyvCU.IIq1AeFHk1ef
 rUk04uGYaN0xndfae7wBPZ7KjY03TKRG6Tra3oU3pN2KgQAKPPW82dYXoZzNhnG.n3NxBDjJyDMO
 zOpuS3oQCZNAcpyLYQfl3vnBSqALxyUQZt2tYUdwdIAcml5Tdq1r5goqV
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: 6091e1f1-14e7-46b7-8aa9-d3601b762ce4
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ir2.yahoo.com with HTTP; Thu, 24 Oct 2024 03:18:45 +0000
Received: by hermes--production-ir2-c694d79d9-2zgj2 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 26d1652bc1703d2ade3e89c3cd33808b; 
 Thu, 24 Oct 2024 03:18:42 +0000 (UTC)
From: Jakob Hauser <jahau@rocketmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Jakob Hauser <jahau@rocketmail.com>
Subject: [PATCH v3 5/5] drm/panel: samsung-s6e88a0-ams427ap24: Add flip option
Date: Thu, 24 Oct 2024 05:18:27 +0200
Message-Id: <886ce1a2443dfb58496f47734d1ceffd3325fb4b.1729738189.git.jahau@rocketmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1729738189.git.jahau@rocketmail.com>
References: <cover.1729738189.git.jahau@rocketmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
 - Dissolved function s6e88a0_ams427ap24_parse_dt() and placed
   the parsing in the probe function. Changed the parsing from
   of_property_read_bool() to device_property_read_bool().
---
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
index 9e211be432d7..cbd51351a325 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
@@ -32,6 +32,7 @@ struct s6e88a0_ams427ap24 {
 	struct mipi_dsi_device *dsi;
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset_gpio;
+	bool flip_horizontal;
 };
 
 static const struct regulator_bulk_data s6e88a0_ams427ap24_supplies[] = {
@@ -538,6 +539,10 @@ static int s6e88a0_ams427ap24_on(struct s6e88a0_ams427ap24 *ctx)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcc, 0x4c);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x03, 0x0d);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0xa5, 0xa5);
+
+	if (ctx->flip_horizontal)
+		mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcb, 0x0e);
+
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfc, 0xa5, 0xa5);
 
@@ -698,6 +703,8 @@ static int s6e88a0_ams427ap24_probe(struct mipi_dsi_device *dsi)
 		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
+	ctx->flip_horizontal = device_property_read_bool(dev, "flip-horizontal");
+
 	ret = s6e88a0_ams427ap24_register_backlight(ctx);
 	if (ret < 0)
 		return ret;
-- 
2.39.5

