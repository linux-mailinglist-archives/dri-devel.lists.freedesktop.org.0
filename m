Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D615C9AB886
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 23:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0028610E6E0;
	Tue, 22 Oct 2024 21:33:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="EA/FAPsO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic306-21.consmr.mail.ir2.yahoo.com
 (sonic306-21.consmr.mail.ir2.yahoo.com [77.238.176.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEAA10E6E2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 21:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1729632831; bh=vFxp6V7ftU2GOHcy5DZ1sostkzSaRPaYmJbs4yP+a9A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=EA/FAPsO0aan5AjfdOWPC31ENdXkBcPbrZACOIh5dWkcklaW4I3jIen1JCWZ/CU/2Xva6Rj0tE71rSrnk8Shjd6KPo/f4eWgWWTR/dqSfAXBydoXapDiJgo0qhn/AcU0c3mG5MsMO5xmw7pEiKnYZCrLJT0ikMG+uzo+bF1h/WdU3xyyxecfYEn6tlLSjtse+6LNlJ1lxtywtT4d1Wl1JVX44Lmp+62yl/uWwvkk7FABDrEF8FgFfAMxGTYi8wgmPWdg8ZbXCkxxbfbp4BQv4TfxJX25B4/G31wnIStlaKmIu2DcZGg9KLh1wGnDxXepi3FmBXrYrbFKW7jWmpl3yQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1729632831; bh=DVn88XQnedDzryNbLhOzQ+aYEMiTRSq3wmUpbOakOZm=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=QhHB2G9pwzNwwZyFZ5ksDuNUpE+hzMiZYBptKX/Tqa3J1OGzXFTAij/1lcp8SEkGBibOaq5acSYmeojLs/dCfqXxZUAKwtyBJXyg6N4NS692Ln3Hj0zsGoJj8fcqfzZP7A/7EsTmaN3r27ewAAkmnD1zYO+ynaUNzPL/j5lFTL9hxG4EIdkf5DAxhgmxudh45U+ieRSnKmbQNlP5lsUQUbsOnqjwccj4jidYqXheY/24wHC+juIos790uG2tAgRZWtDUmvPoIzKLStqtqXeh/ap+DSt/2nj/ca/j6j/IWUtH92a4jn4Cyk09EFNCAnD9obghHsZOBTFbnFbn7e8FnA==
X-YMail-OSG: 8pe5oZ0VM1nIayulXc.WxoS8hNfG8a5yeNkaMZqkeSv1QKc8lnqo0PL8ik4tr9b
 R00Ds5cp2pQJ3_.IuCJh0eEuOfc8QDZ1DJu_ZxoVqaTISELkTiObhNPk2zRp3vbCih3SEKtnCeOC
 JDRokLy0csDePD1hGrANHw3IFLjyjxY3J4JrRCiwKu..zn1yezgAxtLMDIiD_FZdZY4TTWzJBnqp
 dS411XdAU5X4quvj2tosr7whkHfY2TR4JuW6LzAa45KhRRqp7CZ7vngbftbtDPAunYju9.MjTvCL
 AgkPVOaWvr3BiuI0OHZQvAmDNhwW.Dy.GTgBhzFCnswRjMkkb6UfzZMG0r79v1BB2cpVm8xQGHPZ
 K9uyXw2rN_qKhcakbdl6dkNjRpWXo.FAr.WQeMuSy.SJScFwVVeXazIxIyjWaXPS91elnDP2JTxf
 kFRnB8fW_ZtmcJ5Q_LHN0h2DKRmIvcDnlRu0PjN1mFLMZeEtY5qclI9zT93W7.eDlsTbn1qHVzmr
 OlIQ4IMgjDexRBjFHu2E1MWz8WERe4sSjK4U9CLpo5SisjkBDjnye0pRGRbyxZuHkuVmHHh1AovD
 yIZ_2d4TdNNSjiLxHt3MzuLkEN49ykVqfMqZvWdKbZsdw_WylsrLRVH1wpzK7B_yyPhBfCEwhQJW
 xn9BSLE8U9ZRqn78weHNbBgnmprCY4HOqZrlXw71RL1qinrjRJ0mgDNxs56WPB2BDDYEcJk3ySx4
 xaFLeDvKm1IdNl8UoTy1.Wx1FZfKpcAT9dl29n1MLqzmOoSTy3JS7AzyOoCnPa9Lc7jqPMqYT4hd
 J28Yf.YSM5YeQeM0fBjGSDSgiSU6dAzGSz36wYiqQSceyQd4HCGKbAT0YosrD7v0fEgfvacwmMoZ
 mifDBsI83tnBioflkf6GOp_RRuc3asoDKpZI5FxxOOFBDhKYaH2L4Y_96XRp_Znd9hcynnkmETNf
 Radpn0KKzGBO8nSGuiThDPxbSy_.cqF70pCO7pq7vgk9.qjYaMIozkJNILk2IeUU89U27CeHXt44
 u1i_zEqselvVrVJ5oLEtaJBZ17jqU9ic8tuua4IQg_lpw3t29iFhekd7n1FshAYrL0Kym9RatB.F
 YdjVoFoHBj6zD3lD5Y3jwS7dE1Y1W9N2.dkjh8lx_jVN_2UunVSzEJp0HGP97xMOfQa_I5gIDIpi
 gKaFDEG7BQO.HSkGe6JbWfL_CHCiPf0U2WtKpyiQyP.w_PDSc2TrNUxX_ZqbvPh5u00bf8HEKHcN
 bkmC6umeHEaXUhfllGgwRzlxXzvpFk0FGOB1bkpfVg51HMJBVmvpsr6bttGn8aixMd3QU3_OitS2
 tPMgGrzC0dWg1GJF9e7SNNS1oFUZbI8ypPWi6e4mzZbTX.DcH5gmQI66sW2jmAEW0hJy4Fh.vrgk
 _AWZRldnxbWItCXiRDUpYtLsTCJt0kQIN2kweUgOnzP1kE6ou6EymE1HRTn4Vj3b5faWEcB2HJ1v
 Bssew5BnSNd3Xus1vjzLNSQFjoWJz8QPqCczysrCW9qVXuHbNdsWNJ8CLhWDfXhlnKL8wB74UOs3
 exZAf8U9YM1Qptam0WD3RKbi.jEqo9qfZxpccDrT7_B9rvGwsYSVe6FABAaFDloIbzQ9OBoWipCo
 2V31TRs0J8yVNPrdYw5_Q57dPqPwWbcy0dnFEiXA2t0kxl5EewFp_udiXZ0Au4t.1LXToXSwkj4o
 YRwm_7MRYe19JpZZ0uf37GXKyu6HUQPf87XIucRlsKhkqjUvFah8jTCOkyV35L9HK3nQ1dr7m5Wk
 MYygUhFmF__oeXpJ4mgTJPhr7qvFVeKUbAn0gfxW49tetIkrTGj8iXe_zkOymAQzcEK4oWRce3PV
 1a2OF5ppEN_aUfwBLtMx02ie.tHSAOu_DYDT.LpzeWfHCL.NJmj6LeqJe2fit0HdARKuEZByhn2O
 tC7UamdJzQhN0PlutSe8ln2SfJ.NWnYSbkkMQU5TU.e48Uncb7J_KM8W.EesvBtPkNPkTjqdW8JF
 VmbqY77Bq0pJjWQ2GNxl2aRrxO84TMuFoyYEw9zPWpfYSGA4nUAPrKwp2.rmZzV971uomhACOn9i
 SjrUbirSY9ryDbmguD4.WYH4wNL5kLGHPsCOF7SYFiaYpd6n_DZIJW5IN9Xo5v4xnD6Dd9eYjaE5
 5i_tlx_pGzN18EIvewWslysQkwkI1aBu.IlNvfGXSzBAzmGtmRKPJ822IcbTBmtAgX.GC4AjmqWc
 idvB4eeqmNtBhjQSPaGnVbuYTOaHLrDML6.FIy2Qzk0htBk8FXzbcnvogDMPhlEf3ZgF5rJ1Y4.1
 M9aM.NX6FZVg17L9dcuIB8jxew6tpXpkhgLg6ttMlqFNyL.QK9V2foA--
X-Sonic-MF: <jahau@rocketmail.com>
X-Sonic-ID: 395ddffb-acb6-449b-9b75-1ae2036c4cac
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic306.consmr.mail.ir2.yahoo.com with HTTP; Tue, 22 Oct 2024 21:33:51 +0000
Received: by hermes--production-ir2-c694d79d9-qjs6q (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 00a5d0a4af66107c7c1614b6d685cac8; 
 Tue, 22 Oct 2024 21:33:48 +0000 (UTC)
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
Subject: [PATCH v2 5/5] drm/panel: samsung-s6e88a0-ams427ap24: Add flip option
Date: Tue, 22 Oct 2024 23:33:39 +0200
Message-Id: <57a8498440695218d095cb037a5dc818d6fe7355.1729630039.git.jahau@rocketmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1729630039.git.jahau@rocketmail.com>
References: <cover.1729630039.git.jahau@rocketmail.com>
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
---
 .../drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
index 6e02b881434d..8372d0d307c8 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c
@@ -32,6 +32,7 @@ struct s6e88a0_ams427ap24 {
 	struct mipi_dsi_device *dsi;
 	struct regulator_bulk_data *supplies;
 	struct gpio_desc *reset_gpio;
+	bool flip_horizontal;
 };
 
 const struct regulator_bulk_data s6e88a0_ams427ap24_supplies[] = {
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
 
@@ -672,6 +677,15 @@ static int s6e88a0_ams427ap24_register_backlight(struct s6e88a0_ams427ap24 *ctx)
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
@@ -706,6 +720,8 @@ static int s6e88a0_ams427ap24_probe(struct mipi_dsi_device *dsi)
 		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
+	s6e88a0_ams427ap24_parse_dt(ctx);
+
 	ret = s6e88a0_ams427ap24_register_backlight(ctx);
 	if (ret < 0)
 		return ret;
-- 
2.39.5

