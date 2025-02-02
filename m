Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24844A2574A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 11:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AE910E2C1;
	Mon,  3 Feb 2025 10:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ya.ru header.i=@ya.ru header.b="CSQea95y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 396 seconds by postgrey-1.36 at gabe;
 Sun, 02 Feb 2025 20:41:44 UTC
Received: from forward204d.mail.yandex.net (forward204d.mail.yandex.net
 [178.154.239.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 044FC10E02A
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 20:41:44 +0000 (UTC)
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net
 [IPv6:2a02:6b8:c41:1300:1:45:d181:d101])
 by forward204d.mail.yandex.net (Yandex) with ESMTPS id 00D0563297
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2025 23:35:09 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-90.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-90.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:288:0:640:d35:0])
 by forward101d.mail.yandex.net (Yandex) with ESMTPS id 477E460906;
 Sun,  2 Feb 2025 23:35:05 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-90.myt.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id wYpXeKDOhGk0-IOqKZa5Q; 
 Sun, 02 Feb 2025 23:35:03 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
 t=1738528503; bh=5rKcZJY29bNaWdT+17+7U8GuqPLJU4SRzpugbbuKOc4=;
 h=Message-ID:Subject:References:To:From:In-Reply-To:Cc:Date;
 b=CSQea95ybmKLeA1PZavBV28WAG6bh595O+y5TydwxmO5vuEEwbc9asjkzAomJiRR9
 Zwp4bZRK8g7J7CNrmC9uy17dbNQnmUu15CA2Hl8k++brc0cx4j5cENITKBEMggFXXa
 RKEKqWypjMgsS+z6U6GvoH1j477XHSs85BN6NbaU=
Authentication-Results: mail-nwsmtp-smtp-production-main-90.myt.yp-c.yandex.net;
 dkim=pass header.i=@ya.ru
Date: Sun, 2 Feb 2025 23:34:58 +0300
From: Pavel Golikov <paullo612@ya.ru>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>,
 Daniel Semkowicz <dse@thaumatec.com>, Dmitry Yashin <dmt.yashin@gmail.com>,
 Pavel Golikov <paullo612@ya.ru>
Subject: Re: [PATCH v4 1/3] drm/bridge/synopsys: Add MIPI DSI2 host
 controller bridge
Message-ID: <20250202203458.GA52719@pgolikov-home-desktop>
References: <20241209231021.2180582-1-heiko@sntech.de>
 <20241209231021.2180582-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209231021.2180582-2-heiko@sntech.de>
X-Mailman-Approved-At: Mon, 03 Feb 2025 10:50:22 +0000
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

Hi,

On Tue, Dec 10, 2024 at 12:10:19AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Add a Synopsys Designware MIPI DSI host DRM bridge driver for their
> DSI2 host controller, based on the Rockchip version from the driver
> rockchip/dw-mipi-dsi2.c in their vendor-kernel with phy & bridge APIs.
> 
> While the driver is heavily modelled after the previous IP, the register
> set of this DSI2 controller is completely different and there are also
> additional properties like the variable-width phy interface.
> 
> Tested-by: Daniel Semkowicz <dse@thaumatec.com>
> Tested-by: Dmitry Yashin <dmt.yashin@gmail.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
[..]
> +static void dw_mipi_dsi2_set_data_stream_mode(struct dw_mipi_dsi2 *dsi2)
> +{
> +	u32 mode;
> +	int ret;
> +
> +	regmap_write(dsi2->regmap, DSI2_MODE_CTRL, DATA_STREAM_MODE);
> +	ret = regmap_read_poll_timeout(dsi2->regmap, DSI2_MODE_STATUS,
> +				       mode, mode & DATA_STREAM_MODE,
> +				       1000, MODE_STATUS_TIMEOUT_US);
> +	if (ret < 0)
> +		dev_err(dsi2->dev, "failed to enter data stream mode\n");
> +}
> +
> +static void dw_mipi_dsi2_set_cmd_mode(struct dw_mipi_dsi2 *dsi2)
> +{
> +	u32 mode;
> +	int ret;
> +
> +	regmap_write(dsi2->regmap, DSI2_MODE_CTRL, COMMAND_MODE);
> +	ret = regmap_read_poll_timeout(dsi2->regmap, DSI2_MODE_STATUS,
> +				       mode, mode & COMMAND_MODE,
> +				       1000, MODE_STATUS_TIMEOUT_US);
> +	if (ret < 0)
> +		dev_err(dsi2->dev, "failed to enter data stream mode\n");

We've failed to enter command mode, not stream mode. Wrong error message caused
by copy and paste?

> +}
> +
> +static void dw_mipi_dsi2_host_softrst(struct dw_mipi_dsi2 *dsi2)
> +{

Looks like it is necessary to also do apb reset here, like vendor kernel does.
Without apb reset, panel sometimes does not properly come up after DPMS switch.

Tested with

modetest -M rockchip -w 83:DPMS:3

I'm not sure whether it is Debian specific, but setting connector's DPMS property
to OFF causes immediate panel reset. Something is restoring its value to ON
immediately.

> +	regmap_write(dsi2->regmap, DSI2_SOFT_RESET, 0x0);
> +	usleep_range(50, 100);
> +	regmap_write(dsi2->regmap, DSI2_SOFT_RESET,
> +		   SYS_RSTN | PHY_RSTN | IPI_RSTN);
> +}

...

> +static void dw_mipi_dsi2_phy_ratio_cfg(struct dw_mipi_dsi2 *dsi2)
> +{
> +	struct drm_display_mode *mode = &dsi2->mode;
> +	u64 sys_clk = clk_get_rate(dsi2->sys_clk);
> +	u64 pixel_clk, ipi_clk, phy_hsclk;
> +	u64 tmp;
> +
> +	/*
> +	 * in DPHY mode, the phy_hstx_clk is exactly 1/16 the Lane high-speed
> +	 * data rate; In CPHY mode, the phy_hstx_clk is exactly 1/7 the trio
> +	 * high speed symbol rate.
> +	 */
> +	phy_hsclk = DIV_ROUND_CLOSEST_ULL(dsi2->lane_mbps * USEC_PER_SEC, 16);
> +
> +	/* IPI_RATIO_MAN_CFG = PHY_HSTX_CLK / IPI_CLK */
> +	pixel_clk = mode->crtc_clock * MSEC_PER_SEC;
> +	ipi_clk = pixel_clk / 4;
> +
> +	tmp = DIV_ROUND_CLOSEST_ULL(phy_hsclk << 16, ipi_clk);
> +	regmap_write(dsi2->regmap, DSI2_PHY_IPI_RATIO_MAN_CFG,
> +		   PHY_IPI_RATIO(tmp));
> +
> +	/*
> +	 * SYS_RATIO_MAN_CFG = MIPI_DCPHY_HSCLK_Freq / MIPI_DCPHY_HSCLK_Freq
> +	 */

According to TRM

SYS_RATIO_MAN_CFG = MIPI_DCPHY_HSCLK_Freq / SYS_CLK_Freq

So, this comment is simply wrong. Looks like a typo. Also, earlier comment does
not mention _Freq part in frequency names. Maybe it would be better to make it
consistent?

> +	tmp = DIV_ROUND_CLOSEST_ULL(phy_hsclk << 16, sys_clk);
> +	regmap_write(dsi2->regmap, DSI2_PHY_SYS_RATIO_MAN_CFG,
> +		   PHY_SYS_RATIO(tmp));
> +}
> +
> +static void dw_mipi_dsi2_lp2hs_or_hs2lp_cfg(struct dw_mipi_dsi2 *dsi2)
> +{
> +	const struct dw_mipi_dsi2_phy_ops *phy_ops = dsi2->plat_data->phy_ops;
> +	struct dw_mipi_dsi2_phy_timing timing;
> +	int ret;
> +
> +	ret = phy_ops->get_timing(dsi2->plat_data->priv_data,
> +				  dsi2->lane_mbps, &timing);
> +	if (ret)
> +		dev_err(dsi2->dev, "Retrieving phy timings failed\n");
> +
> +	regmap_write(dsi2->regmap, DSI2_PHY_LP2HS_MAN_CFG, PHY_LP2HS_TIME(timing.data_lp2hs));
> +	regmap_write(dsi2->regmap, DSI2_PHY_HS2LP_MAN_CFG, PHY_HS2LP_TIME(timing.data_hs2lp));

I also had to set DSI2_PHY_MAX_RD_T_MAN_CFG to 10000 as it is done in
dw-mipi-dsi (v1) driver to make my panel work properly in LPM mode.

> +}

...

> +static const struct regmap_config dw_mipi_dsi2_regmap_config = {
> +	.name = "dsi2-host",
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.fast_io = true,

Maybe it would be good to also set max_register here to make proper regmap
available through debugfs? Or max_register_is_0 otherwise? Without this, only
first register is available for dumping.

Not quite relevant here, as this bridge is not currently used alone, but
relevant for Rockchip specific glue driver.

> +};

...


I've managed to successfully enable my DSI panel [0]. It has Lincoln Technology
Solutions ZV070WUV-L50 board [1], which, in turn, is based on Focal Tech FT7250
display controller.

This panel works flawlessly with rk3568 (but at most at ~55 Hz refresh rate,
because rk3568 does not support modes higher than 1920x1080@60, so, I had to
lower refresh rate to make it work). But has some troubles with rk3588. It
works fine with vendor kernel with LPM disabled and "auto-calculation-mode"
device tree property set. As far as I can understand, auto calculation mode is
not going to be supported by mainline, and disabling LPM is not an option to
me.

So, to make it work with this series I had to increase PHY_SYS_RATIO twice.

Maybe Andy could shade the light on what automatic mode calculation algorithm
does? Why in automatic mode PHY_SYS_RATIO value is twice larger than value
computed by formula in DSI controller application note?

Panel configuration:

static const struct drm_display_mode default_mode_lincoln = {
	.hdisplay    = 1200,
	.hsync_start = 1200 + 20,
	.hsync_end   = 1200 + 20 + 8,
	.htotal      = 1200 + 20 + 8 + 22,
	.vdisplay    = 1920,
	.vsync_start = 1920 + 178,
	.vsync_end   = 1920 + 178 + 8,
	.vtotal      = 1920 + 178 + 8 + 32,
	.clock       = 148500,
	.width_mm    = 94,
	.height_mm   = 151,
};

dsi->lanes = 4;
dsi->format = MIPI_DSI_FMT_RGB888;
dsi->mode_flags = MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_VIDEO |
	MIPI_DSI_MODE_NO_EOT_PACKET | MIPI_DSI_MODE_VIDEO_BURST;

Regmap diff between manual mode and automatic mode:

diff --git a/root/regs_manual b/root/regs_auto
index 117cb5b..5dce301 100644
--- a/root/regs_manual
+++ b/root/regs_auto
@@ -7,9 +7,9 @@
 018: 00000000
 01c: 00000003
 020: 00000303
-024: 00000001
+024: 00000000
 028: 00000000
-02c: 0161082c
+02c: 04b70728
 030: 00000000
 034: 00000000
 038: 00000000
@@ -65,20 +65,20 @@
 100: 00000130
 104: 00000900
 108: 001f0000
-10c: 000cb0b5
-110: 00000000
-114: 000ae64f
-118: 00000000
+10c: 00000000
+110: 0013be38
+114: 00000000
+118: 00114671
 11c: 00000000
-120: 00000000
+120: 000003d3
 124: 00000000
-128: 00000000
+128: 00952167
 12c: 00000000
-130: 00000000
-134: 0001aaab
-138: 00000000
-13c: 00002d21
-140: 00000000
+130: 00658920
+134: 00000000
+138: 0001aaad
+13c: 00000000
+140: 00005a41
 144: 00000000
 148: 00000000
 14c: 00000000
@@ -129,7 +129,7 @@
 200: 00000002
 204: 00000000
 208: ffff0000
-20c: 00100072
+20c: 00000072
 210: 00000000
 214: 00000000
 218: 00000000
@@ -191,20 +191,20 @@
 2f8: 00000000
 2fc: 00000000
 300: 00000050
-304: 00035555
-308: 00000000
-30c: 00092aab
-310: 00000000
-314: 01f40000
-318: 00000000
-31c: 0208d555
-320: 00000000
-324: 00000008
-328: 00000000
-32c: 00000020
-330: 00000000
-334: 00000780
-338: 00000000
-33c: 000000b2
-340: 00000000
+304: 00000000
+308: 0003555a
+30c: 00000000
+310: 00092ab7
+314: 00000000
+318: 01f402bc
+31c: 00000000
+320: 0208d82e
+324: 00000000
+328: 00000008
+32c: 00000000
+330: 00000020
+334: 00000000
+338: 00000780
+33c: 00000000
+340: 000000b2
 344: 000004b0

The only irrelevant difference here is LPM mode enable bit.

Calculated hsclk is 61875000, sys clk is 351000000, MIPI lane speed is
990 mbps. VOP pixel clock is 37125000 if it is relevant in any way.

Thanks, Pavel

[0] https://www.hello-lighting.com/product/7-0-ips-1200x1920/
[1] http://www.microtech-lcd.cn/upfile/202109/2021092649634025.jpg
