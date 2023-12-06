Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0D9806A48
	for <lists+dri-devel@lfdr.de>; Wed,  6 Dec 2023 10:04:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8000E10E08C;
	Wed,  6 Dec 2023 09:04:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6522E10E08C
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Dec 2023 09:04:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E6E88CE1167;
 Wed,  6 Dec 2023 09:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAECAC433C7;
 Wed,  6 Dec 2023 09:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701853480;
 bh=6N+bx9M0YK2PpHkkWF1vUefR/WZZUjAsgKbHAD3ClzY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aKr7gOefxe4ytIgTtMwts6hC2x8LG38vbkMYhAsJzwC4N3c19vGD2FOWKkZhRv117
 /9XctvhVnZtgU85yd6Sxihc7XlV78rPUxtFUeo5Sqc93OHsmDHIB5oSggwxAQrQTBL
 kNdQvYpAqAhM+d1j/WRu6IeO4t53H6GW025XvyDvk3LDBFPHV2N/2WYUfC1sFGzmIO
 meFr6im/Pko58awQ/lyprRF6PkqI1Kq8k8FVq/Yt4ybzSsHWCsb+Vp71fXQdrMhaR9
 CseqJYWT0qHVSVMItA1W/H+FKZUCJucpGjQ89kzfuyxd+he7C+jYy6fWDw1MMYDuwL
 2g1o0feNuVemQ==
Date: Wed, 6 Dec 2023 10:04:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Subject: Re: [v3 5/6] drm/vs: Add hdmi driver
Message-ID: <esetsiqgqpk35zue4c6aq7l6zn4kezhxkqqa7ompaz2vhdy3lr@4d5awfqgs2ss>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-6-keith.zhao@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lz6qckxqush7mxso"
Content-Disposition: inline
In-Reply-To: <20231204123315.28456-6-keith.zhao@starfivetech.com>
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
Cc: devicetree@vger.kernel.org, aou@eecs.berkeley.edu, suijingfeng@loongson.cn,
 krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 xingyu.wu@starfivetech.com, jack.zhu@starfivetech.com, palmer@dabbelt.com,
 tzimmermann@suse.de, william.qiu@starfivetech.com,
 shengyang.chen@starfivetech.com, linux-riscv@lists.infradead.org,
 changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--lz6qckxqush7mxso
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 08:33:14PM +0800, Keith Zhao wrote:
> add hdmi driver as encoder and connect
>=20
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  drivers/gpu/drm/verisilicon/Kconfig         |   8 +
>  drivers/gpu/drm/verisilicon/Makefile        |   1 +
>  drivers/gpu/drm/verisilicon/starfive_hdmi.c | 849 ++++++++++++++++++++
>  drivers/gpu/drm/verisilicon/starfive_hdmi.h | 304 +++++++
>  drivers/gpu/drm/verisilicon/vs_drv.c        |   3 +
>  drivers/gpu/drm/verisilicon/vs_drv.h        |   4 +
>  6 files changed, 1169 insertions(+)
>  create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.c
>  create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.h
>=20
> diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisi=
licon/Kconfig
> index e10fa97635aa..122c786e3948 100644
> --- a/drivers/gpu/drm/verisilicon/Kconfig
> +++ b/drivers/gpu/drm/verisilicon/Kconfig
> @@ -11,3 +11,11 @@ config DRM_VERISILICON
>  	  This driver provides VeriSilicon kernel mode
>  	  setting and buffer management. It does not
>  	  provide 2D or 3D acceleration.
> +
> +config DRM_VERISILICON_STARFIVE_HDMI
> +	bool "Starfive HDMI extensions"
> +	depends on DRM_VERISILICON
> +	help
> +	   This selects support for StarFive soc specific extensions
> +	   for the Innosilicon HDMI driver. If you want to enable
> +	   HDMI on JH7110 based soc, you should select this option.

I'm confused, is it a starfive or verisilicon IP?

> diff --git a/drivers/gpu/drm/verisilicon/Makefile b/drivers/gpu/drm/veris=
ilicon/Makefile
> index bf6f2b7ee480..71fadafcee13 100644
> --- a/drivers/gpu/drm/verisilicon/Makefile
> +++ b/drivers/gpu/drm/verisilicon/Makefile
> @@ -6,4 +6,5 @@ vs_drm-objs :=3D vs_dc_hw.o \
>  		vs_drv.o \
>  		vs_modeset.o \
>  		vs_plane.o
> +vs_drm-$(CONFIG_DRM_VERISILICON_STARFIVE_HDMI) +=3D starfive_hdmi.o
>  obj-$(CONFIG_DRM_VERISILICON) +=3D vs_drm.o
> diff --git a/drivers/gpu/drm/verisilicon/starfive_hdmi.c b/drivers/gpu/dr=
m/verisilicon/starfive_hdmi.c
> new file mode 100644
> index 000000000000..aa621db0dee0
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/starfive_hdmi.c
> @@ -0,0 +1,849 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/component.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/hdmi.h>
> +#include <linux/i2c.h>
> +#include <linux/irq.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/reset.h>
> +
> +#include <drm/bridge/dw_hdmi.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_edid.h>
> +#include <drm/drm_managed.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_probe_helper.h>
> +#include <drm/drm_simple_kms_helper.h>
> +
> +#include "starfive_hdmi.h"
> +#include "vs_drv.h"
> +#include "vs_crtc.h"
> +
> +static const char * const hdmi_clocks[] =3D {
> +	"sysclk",
> +	"mclk",
> +	"bclk"
> +};
> +
> +static struct starfive_hdmi_encoder *encoder_to_hdmi(struct drm_encoder =
*encoder)
> +{
> +	return container_of(encoder, struct starfive_hdmi_encoder, encoder);
> +}
> +
> +static struct starfive_hdmi *connector_to_hdmi(struct drm_connector *con=
nector)
> +{
> +	return container_of(connector, struct starfive_hdmi, connector);
> +}
> +
> +static const struct post_pll_config post_pll_cfg_table[] =3D {
> +	{25200000,	1, 80, 13, 3, 1},
> +	{27000000,	1, 40, 11, 3, 1},
> +	{33750000,	1, 40, 11, 3, 1},
> +	{49000000,	1, 20, 1, 3, 3},
> +	{241700000, 1, 20, 1, 3, 3},
> +	{297000000, 4, 20, 0, 0, 3},
> +	{594000000, 4, 20, 0, 0, 0},

If you don't support modes > 340MHz, then there's no point in listing 594MH=
z here

> +	{ /* sentinel */ }
> +};
> +
> +inline u8 hdmi_readb(struct starfive_hdmi *hdmi, u16 offset)
> +{
> +	return readl_relaxed(hdmi->regs + (offset) * 0x04);
> +}
> +
> +inline void hdmi_writeb(struct starfive_hdmi *hdmi, u16 offset, u32 val)
> +{
> +	writel_relaxed(val, hdmi->regs + (offset) * 0x04);
> +}
> +
> +inline void hdmi_writew(struct starfive_hdmi *hdmi, u16 offset, u32 val)
> +{
> +	writew_relaxed(val & 0xFF, hdmi->regs + (offset) * 0x04);
> +	writew_relaxed((val >> 8) & 0xFF, hdmi->regs + (offset + 1) * 0x04);
> +}
> +
> +inline void hdmi_modb(struct starfive_hdmi *hdmi, u16 offset,
> +			     u32 msk, u32 val)
> +{
> +	u8 temp =3D hdmi_readb(hdmi, offset) & ~msk;
> +
> +	temp |=3D val & msk;
> +	hdmi_writeb(hdmi, offset, temp);
> +}
> +
> +static int starfive_hdmi_enable_clk_deassert_rst(struct device *dev, str=
uct starfive_hdmi *hdmi)
> +{
> +	int ret;
> +
> +	ret =3D clk_bulk_prepare_enable(hdmi->nclks, hdmi->clk_hdmi);
> +	if (ret) {
> +		dev_err(dev, "failed to enable clocks\n");
> +		return ret;
> +	}
> +
> +	ret =3D reset_control_deassert(hdmi->tx_rst);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to deassert tx_rst\n");
> +		return ret;
> +	}
> +	return 0;
> +}
> +
> +static void starfive_hdmi_disable_clk_assert_rst(struct device *dev, str=
uct starfive_hdmi *hdmi)
> +{
> +	int ret;
> +
> +	ret =3D reset_control_assert(hdmi->tx_rst);
> +	if (ret < 0)
> +		dev_err(dev, "failed to assert tx_rst\n");
> +
> +	clk_bulk_disable_unprepare(hdmi->nclks, hdmi->clk_hdmi);
> +}
> +
> +#ifdef CONFIG_PM_SLEEP
> +static int hdmi_system_pm_suspend(struct device *dev)
> +{
> +	return pm_runtime_force_suspend(dev);
> +}
> +
> +static int hdmi_system_pm_resume(struct device *dev)
> +{
> +	return pm_runtime_force_resume(dev);
> +}
> +#endif
> +
> +#ifdef CONFIG_PM
> +static int hdmi_runtime_suspend(struct device *dev)
> +{
> +	struct starfive_hdmi *hdmi =3D dev_get_drvdata(dev);
> +
> +	starfive_hdmi_disable_clk_assert_rst(dev, hdmi);
> +
> +	return 0;
> +}
> +
> +static int hdmi_runtime_resume(struct device *dev)
> +{
> +	struct starfive_hdmi *hdmi =3D dev_get_drvdata(dev);
> +
> +	return starfive_hdmi_enable_clk_deassert_rst(dev, hdmi);
> +}
> +#endif
> +
> +static void starfive_hdmi_tx_phy_power_down(struct starfive_hdmi *hdmi)
> +{
> +	hdmi_modb(hdmi, HDMI_SYS_CTRL, m_POWER, v_PWR_OFF);
> +}
> +
> +static void starfive_hdmi_tx_phy_power_on(struct starfive_hdmi *hdmi)
> +{
> +	hdmi_modb(hdmi, HDMI_SYS_CTRL, m_POWER, v_PWR_ON);
> +}
> +
> +static void starfive_hdmi_config_pll(struct starfive_hdmi *hdmi)
> +{
> +	u32 val;
> +	u8 reg_1ad_value =3D hdmi->post_cfg->post_div_en ?
> +		 hdmi->post_cfg->postdiv : 0x00;
> +	u8 reg_1aa_value =3D hdmi->post_cfg->post_div_en ?
> +		 0x0e : 0x02;
> +
> +	hdmi_writeb(hdmi, STARFIVE_PRE_PLL_CONTROL, STARFIVE_PRE_PLL_POWER_DOWN=
);
> +	hdmi_writeb(hdmi, STARFIVE_POST_PLL_DIV_1,
> +		    STARFIVE_POST_PLL_POST_DIV_ENABLE |
> +		    STARFIVE_POST_PLL_REFCLK_SEL_TMDS |
> +		    STARFIVE_POST_PLL_POWER_DOWN);
> +	hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_1, STARFIVE_PRE_PLL_PRE_DIV(hdmi=
->pre_cfg.prediv));
> +
> +	val =3D STARFIVE_SPREAD_SPECTRUM_MOD_DISABLE | STARFIVE_SPREAD_SPECTRUM=
_MOD_DOWN;
> +	if (!hdmi->pre_cfg.fracdiv)
> +		val |=3D STARFIVE_PRE_PLL_FRAC_DIV_DISABLE;
> +	hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_2,
> +		    STARFIVE_PRE_PLL_FB_DIV_11_8(hdmi->pre_cfg.fbdiv) | val);
> +	hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_3,
> +		    STARFIVE_PRE_PLL_FB_DIV_7_0(hdmi->pre_cfg.fbdiv));
> +	hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_4,
> +		    STARFIVE_PRE_PLL_TMDSCLK_DIV_C(hdmi->pre_cfg.tmds_div_c) |
> +		    STARFIVE_PRE_PLL_TMDSCLK_DIV_A(hdmi->pre_cfg.tmds_div_a) |
> +		    STARFIVE_PRE_PLL_TMDSCLK_DIV_B(hdmi->pre_cfg.tmds_div_b));
> +
> +	if (hdmi->pre_cfg.fracdiv) {
> +		hdmi_writeb(hdmi, STARFIVE_PRE_PLL_FRAC_DIV_L,
> +			    STARFIVE_PRE_PLL_FRAC_DIV_7_0(hdmi->pre_cfg.fracdiv));
> +		hdmi_writeb(hdmi, STARFIVE_PRE_PLL_FRAC_DIV_M,
> +			    STARFIVE_PRE_PLL_FRAC_DIV_15_8(hdmi->pre_cfg.fracdiv));
> +		hdmi_writeb(hdmi, STARFIVE_PRE_PLL_FRAC_DIV_H,
> +			    STARFIVE_PRE_PLL_FRAC_DIV_23_16(hdmi->pre_cfg.fracdiv));
> +	}
> +
> +	hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_5,
> +		    STARFIVE_PRE_PLL_PCLK_DIV_A(hdmi->pre_cfg.pclk_div_a) |
> +		    STARFIVE_PRE_PLL_PCLK_DIV_B(hdmi->pre_cfg.pclk_div_b));
> +	hdmi_writeb(hdmi, STARFIVE_PRE_PLL_DIV_6,
> +		    STARFIVE_PRE_PLL_PCLK_DIV_C(hdmi->pre_cfg.pclk_div_c) |
> +		    STARFIVE_PRE_PLL_PCLK_DIV_D(hdmi->pre_cfg.pclk_div_d));
> +
> +	/*pre-pll power down*/
> +	hdmi_modb(hdmi, STARFIVE_PRE_PLL_CONTROL, STARFIVE_PRE_PLL_POWER_DOWN, =
0);
> +
> +	hdmi_modb(hdmi, STARFIVE_POST_PLL_DIV_2, STARFIVE_POST_PLL_Pre_DIV_MASK,
> +		  STARFIVE_POST_PLL_PRE_DIV(hdmi->post_cfg->prediv));
> +	hdmi_writeb(hdmi, STARFIVE_POST_PLL_DIV_3, hdmi->post_cfg->fbdiv & 0xff=
);
> +	hdmi_writeb(hdmi, STARFIVE_POST_PLL_DIV_4, reg_1ad_value);
> +	hdmi_writeb(hdmi, STARFIVE_POST_PLL_DIV_1, reg_1aa_value);
> +}
> +
> +static void starfive_hdmi_tmds_driver_on(struct starfive_hdmi *hdmi)
> +{
> +	hdmi_modb(hdmi, STARFIVE_TMDS_CONTROL,
> +		  STARFIVE_TMDS_DRIVER_ENABLE, STARFIVE_TMDS_DRIVER_ENABLE);
> +}
> +
> +static void starfive_hdmi_sync_tmds(struct starfive_hdmi *hdmi)
> +{
> +	/*first send 0 to this bit, then send 1 and keep 1 into this bit*/
> +	hdmi_writeb(hdmi, HDMI_SYNC, 0x0);
> +	hdmi_writeb(hdmi, HDMI_SYNC, 0x1);
> +}
> +
> +static void starfive_hdmi_i2c_init(struct starfive_hdmi *hdmi)
> +{
> +	int ddc_bus_freq;
> +
> +	ddc_bus_freq =3D (clk_get_rate(hdmi->clk_hdmi[CLK_SYS].clk) >> 2) / HDM=
I_SCL_RATE;
> +
> +	hdmi_writeb(hdmi, DDC_BUS_FREQ_L, ddc_bus_freq & 0xFF);
> +	hdmi_writeb(hdmi, DDC_BUS_FREQ_H, (ddc_bus_freq >> 8) & 0xFF);
> +
> +	/* Clear the EDID interrupt flag and mute the interrupt */
> +	hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, 0);
> +	hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_EDID_READY);
> +}
> +
> +static void starfive_hdmi_phy_get_pre_pll_cfg(struct starfive_hdmi *hdmi)
> +{
> +	if (hdmi->tmds_rate > 30000000) {
> +		hdmi->pre_cfg.pixclock =3D hdmi->tmds_rate;
> +		hdmi->pre_cfg.tmdsclock =3D hdmi->tmds_rate;
> +		hdmi->pre_cfg.prediv =3D 1;
> +		hdmi->pre_cfg.fbdiv =3D hdmi->tmds_rate / 3000000;
> +		hdmi->pre_cfg.tmds_div_a =3D 0;
> +		hdmi->pre_cfg.tmds_div_b =3D 1;
> +		hdmi->pre_cfg.tmds_div_c =3D 1;
> +		hdmi->pre_cfg.pclk_div_a =3D 1;
> +		hdmi->pre_cfg.pclk_div_b =3D 0;
> +		hdmi->pre_cfg.pclk_div_c =3D 2;
> +		hdmi->pre_cfg.pclk_div_d =3D 2;
> +		hdmi->pre_cfg.vco_div_5_en =3D hdmi->tmds_rate % 3000000 ? 1 : 0;
> +
> +		if (hdmi->pre_cfg.vco_div_5_en) {
> +			hdmi->pre_cfg.fracdiv =3D (hdmi->tmds_rate % 3000000) *
> +						 0xffffff / 1000000;
> +		}
> +	} else {
> +		hdmi->pre_cfg.pixclock =3D hdmi->tmds_rate;
> +		hdmi->pre_cfg.tmdsclock =3D hdmi->tmds_rate;
> +		hdmi->pre_cfg.prediv =3D 1;
> +		hdmi->pre_cfg.fbdiv =3D hdmi->tmds_rate / 1000000;
> +		hdmi->pre_cfg.tmds_div_a =3D 2;
> +		hdmi->pre_cfg.tmds_div_b =3D 1;
> +		hdmi->pre_cfg.tmds_div_c =3D 1;
> +		hdmi->pre_cfg.pclk_div_a =3D 3;
> +		hdmi->pre_cfg.pclk_div_b =3D 0;
> +		hdmi->pre_cfg.pclk_div_c =3D 3;
> +		hdmi->pre_cfg.pclk_div_d =3D 4;
> +		hdmi->pre_cfg.vco_div_5_en =3D hdmi->tmds_rate % 1000000 ? 1 : 0;
> +
> +		if (hdmi->pre_cfg.vco_div_5_en) {
> +			hdmi->pre_cfg.fracdiv =3D (hdmi->tmds_rate % 1000000) *
> +						 0xffffff / 1000000;
> +		}
> +	}
> +}
> +
> +static int starfive_hdmi_phy_clk_set_rate(struct starfive_hdmi *hdmi)
> +{
> +	hdmi->post_cfg =3D post_pll_cfg_table;
> +
> +	starfive_hdmi_phy_get_pre_pll_cfg(hdmi);
> +
> +	for (; hdmi->post_cfg->tmdsclock !=3D 0; hdmi->post_cfg++)
> +		if (hdmi->tmds_rate <=3D hdmi->post_cfg->tmdsclock)
> +			break;

What happens if you don't find a mode?

> +	starfive_hdmi_config_pll(hdmi);
> +
> +	return 0;
> +}
> +
> +static int starfive_hdmi_config_video_timing(struct starfive_hdmi *hdmi,
> +					     struct drm_display_mode *mode)
> +{
> +	int value;
> +	/* Set detail external video timing */
> +	value =3D mode->htotal;
> +	hdmi_writew(hdmi, HDMI_VIDEO_EXT_HTOTAL_L, value);
> +
> +	value =3D mode->htotal - mode->hdisplay;
> +	hdmi_writew(hdmi, HDMI_VIDEO_EXT_HBLANK_L, value);
> +
> +	value =3D mode->htotal - mode->hsync_start;
> +	hdmi_writew(hdmi, HDMI_VIDEO_EXT_HDELAY_L, value);
> +
> +	value =3D mode->hsync_end - mode->hsync_start;
> +	hdmi_writew(hdmi, HDMI_VIDEO_EXT_HDURATION_L, value);
> +
> +	value =3D mode->vtotal;
> +	hdmi_writew(hdmi, HDMI_VIDEO_EXT_VTOTAL_L, value);
> +
> +	value =3D mode->vtotal - mode->vdisplay;
> +	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VBLANK, value & 0xFF);
> +
> +	value =3D mode->vtotal - mode->vsync_start;
> +	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VDELAY, value & 0xFF);
> +
> +	value =3D mode->vsync_end - mode->vsync_start;
> +	hdmi_writeb(hdmi, HDMI_VIDEO_EXT_VDURATION, value & 0xFF);
> +
> +	/* Set detail external video timing polarity and interlace mode */
> +	value =3D v_EXTERANL_VIDEO(1);
> +	value |=3D mode->flags & DRM_MODE_FLAG_PHSYNC ?
> +		v_HSYNC_POLARITY(1) : v_HSYNC_POLARITY(0);
> +	value |=3D mode->flags & DRM_MODE_FLAG_PVSYNC ?
> +		v_VSYNC_POLARITY(1) : v_VSYNC_POLARITY(0);
> +	value |=3D mode->flags & DRM_MODE_FLAG_INTERLACE ?
> +		v_INETLACE(1) : v_INETLACE(0);
> +
> +	hdmi_writeb(hdmi, HDMI_VIDEO_TIMING_CTL, value);
> +	return 0;
> +}
> +
> +static int starfive_hdmi_setup(struct starfive_hdmi *hdmi,
> +			       struct drm_display_mode *mode)
> +{
> +	int ret;
> +	u32 val;
> +
> +	hdmi_modb(hdmi, STARFIVE_BIAS_CONTROL, STARFIVE_BIAS_ENABLE, STARFIVE_B=
IAS_ENABLE);
> +	hdmi_writeb(hdmi, STARFIVE_RX_CONTROL, STARFIVE_RX_ENABLE);
> +
> +	hdmi->tmds_rate =3D mode->clock * 1000;
> +	starfive_hdmi_phy_clk_set_rate(hdmi);

The calculation is more complicated than that, see
https://lore.kernel.org/dri-devel/20231128-kms-hdmi-connector-state-v4-13-c=
7602158306e@kernel.org/

> +	ret =3D readx_poll_timeout(readl_relaxed,
> +				 hdmi->regs + (STARFIVE_PRE_PLL_LOCK_STATUS) * 0x04,
> +				 val, val & 0x1, 1000, 100000);
> +	if (ret < 0) {
> +		dev_err(hdmi->dev, "failed to wait pre-pll lock\n");
> +		return ret;
> +	}
> +
> +	ret =3D readx_poll_timeout(readl_relaxed,
> +				 hdmi->regs + (STARFIVE_POST_PLL_LOCK_STATUS) * 0x04,
> +				 val, val & 0x1, 1000, 100000);
> +	if (ret < 0) {
> +		dev_err(hdmi->dev, "failed to wait post-pll lock\n");
> +		return ret;
> +	}
> +
> +	/*turn on LDO*/
> +	hdmi_writeb(hdmi, STARFIVE_LDO_CONTROL, STARFIVE_LDO_ENABLE);
> +	/*turn on serializer*/
> +	hdmi_writeb(hdmi, STARFIVE_SERIALIER_CONTROL, STARFIVE_SERIALIER_ENABLE=
);
> +
> +	starfive_hdmi_tx_phy_power_down(hdmi);
> +	starfive_hdmi_config_video_timing(hdmi, mode);
> +	starfive_hdmi_tx_phy_power_on(hdmi);
> +
> +	starfive_hdmi_tmds_driver_on(hdmi);
> +	starfive_hdmi_sync_tmds(hdmi);
> +
> +	return 0;
> +}
> +
> +static void starfive_hdmi_encoder_enable(struct drm_encoder *encoder)
> +{
> +	struct starfive_hdmi_encoder *hdmi_encoder =3D encoder_to_hdmi(encoder);
> +	struct drm_display_mode *mode =3D &encoder->crtc->state->adjusted_mode;
> +	int ret, idx;
> +	struct drm_device *drm =3D hdmi_encoder->hdmi->connector.dev;
> +
> +	if (drm && !drm_dev_enter(drm, &idx))
> +		return;
> +
> +	ret =3D pm_runtime_get_sync(hdmi_encoder->hdmi->dev);
> +	if (ret < 0)
> +		return;
> +	starfive_hdmi_setup(hdmi_encoder->hdmi, mode);
> +
> +	if (drm)
> +		drm_dev_exit(idx);
> +}

You're not sending any infoframes?

> +static void starfive_hdmi_encoder_disable(struct drm_encoder *encoder)
> +{
> +	struct starfive_hdmi_encoder *hdmi_encoder =3D encoder_to_hdmi(encoder);
> +
> +	pm_runtime_put(hdmi_encoder->hdmi->dev);
> +}
> +
> +static int
> +starfive_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
> +				   struct drm_crtc_state *crtc_state,
> +				   struct drm_connector_state *conn_state)
> +{
> +	bool valid =3D false;
> +	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
> +	struct vs_crtc_state *vs_crtc_state =3D to_vs_crtc_state(crtc_state);
> +
> +	vs_crtc_state->encoder_type =3D encoder->encoder_type;
> +	vs_crtc_state->output_fmt =3D MEDIA_BUS_FMT_RGB888_1X24;
> +
> +	int pclk =3D mode->clock * 1000;

That's a compiler warning.

> +	if (pclk <=3D PIXCLOCK_4K_30FPS)
> +		valid =3D true;

if (pclk > PIXCLOCK_4K_30FPS)
	return -EINVAL;

?

> +
> +	return (valid) ? 0 : -EINVAL;
> +}
> +
> +static const struct drm_encoder_helper_funcs starfive_hdmi_encoder_helpe=
r_funcs =3D {
> +	.enable     =3D starfive_hdmi_encoder_enable,
> +	.disable    =3D starfive_hdmi_encoder_disable,
> +	.atomic_check =3D starfive_hdmi_encoder_atomic_check,
> +};
> +
> +static enum drm_connector_status
> +starfive_hdmi_connector_detect(struct drm_connector *connector, bool for=
ce)
> +{
> +	struct starfive_hdmi *hdmi =3D connector_to_hdmi(connector);
> +	struct drm_device *drm =3D hdmi->connector.dev;
> +	int ret;
> +	int idx;
> +
> +	if (drm && !drm_dev_enter(drm, &idx))
> +		return connector_status_disconnected;
> +
> +	ret =3D pm_runtime_get_sync(hdmi->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D (hdmi_readb(hdmi, HDMI_STATUS) & m_HOTPLUG) ?
> +		connector_status_connected : connector_status_disconnected;
> +	pm_runtime_put(hdmi->dev);
> +
> +	if (drm)
> +		drm_dev_exit(idx);
> +
> +	return ret;
> +}
> +
> +static int starfive_hdmi_connector_get_modes(struct drm_connector *conne=
ctor)
> +{
> +	struct starfive_hdmi *hdmi =3D connector_to_hdmi(connector);
> +	int ret =3D 0;
> +
> +	if (!hdmi->ddc)
> +		return 0;
> +	ret =3D pm_runtime_get_sync(hdmi->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D drm_connector_helper_get_modes_from_ddc(connector);
> +	pm_runtime_put(hdmi->dev);
> +
> +	return ret;
> +}
> +
> +static enum drm_mode_status
> +starfive_hdmi_connector_mode_valid(struct drm_connector *connector,
> +				   struct drm_display_mode *mode)
> +{
> +	int pclk =3D mode->clock * 1000;
> +	bool valid =3D false;
> +
> +	if (pclk <=3D PIXCLOCK_4K_30FPS)
> +		valid =3D true;
> +
> +	return (valid) ? MODE_OK : MODE_BAD;
> +}
> +
> +static int
> +starfive_hdmi_probe_single_connector_modes(struct drm_connector *connect=
or,
> +					   u32 maxX, u32 maxY)
> +{
> +	return drm_helper_probe_single_connector_modes(connector, 3840, 2160);
> +}
> +
> +static const struct drm_connector_funcs starfive_hdmi_connector_funcs =
=3D {
> +	.fill_modes =3D starfive_hdmi_probe_single_connector_modes,
> +	.detect =3D starfive_hdmi_connector_detect,
> +	.reset =3D drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
> +};
> +
> +static struct drm_connector_helper_funcs starfive_hdmi_connector_helper_=
funcs =3D {
> +	.get_modes =3D starfive_hdmi_connector_get_modes,
> +	.mode_valid =3D starfive_hdmi_connector_mode_valid,
> +};
> +
> +static int starfive_hdmi_register(struct drm_device *drm,
> +				  struct starfive_hdmi_encoder *hdmi_encoder)
> +{
> +	struct drm_encoder *encoder =3D &hdmi_encoder->encoder;
> +	struct device *dev =3D hdmi_encoder->hdmi->dev;
> +
> +	encoder->possible_crtcs =3D drm_of_find_possible_crtcs(drm, dev->of_nod=
e);
> +
> +	/*
> +	 * If we failed to find the CRTC(s) which this encoder is
> +	 * supposed to be connected to, it's because the CRTC has
> +	 * not been registered yet.  Defer probing, and hope that
> +	 * the required CRTC is added later.
> +	 */
> +	if (encoder->possible_crtcs =3D=3D 0)
> +		return -EPROBE_DEFER;
> +
> +	drm_encoder_helper_add(encoder, &starfive_hdmi_encoder_helper_funcs);
> +
> +	hdmi_encoder->hdmi->connector.polled =3D DRM_CONNECTOR_POLL_HPD;
> +
> +	drm_connector_helper_add(&hdmi_encoder->hdmi->connector,
> +				 &starfive_hdmi_connector_helper_funcs);
> +	drmm_connector_init(drm, &hdmi_encoder->hdmi->connector,
> +			    &starfive_hdmi_connector_funcs,
> +			    DRM_MODE_CONNECTOR_HDMIA,
> +			    hdmi_encoder->hdmi->ddc);
> +
> +	drm_connector_attach_encoder(&hdmi_encoder->hdmi->connector, encoder);
> +
> +	return 0;
> +}
> +
> +static irqreturn_t starfive_hdmi_i2c_irq(struct starfive_hdmi *hdmi)
> +{
> +	struct starfive_hdmi_i2c *i2c =3D hdmi->i2c;
> +	u8 stat;
> +
> +	stat =3D hdmi_readb(hdmi, HDMI_INTERRUPT_STATUS1);
> +	if (!(stat & m_INT_EDID_READY))
> +		return IRQ_NONE;
> +
> +	/* Clear HDMI EDID interrupt flag */
> +	hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_EDID_READY);
> +
> +	complete(&i2c->cmp);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static irqreturn_t starfive_hdmi_hardirq(int irq, void *dev_id)
> +{
> +	struct starfive_hdmi *hdmi =3D dev_id;
> +	irqreturn_t ret =3D IRQ_NONE;
> +	u8 interrupt;
> +
> +	if (hdmi->i2c)
> +		ret =3D starfive_hdmi_i2c_irq(hdmi);
> +
> +	interrupt =3D hdmi_readb(hdmi, HDMI_STATUS);
> +	if (interrupt & m_INT_HOTPLUG) {
> +		hdmi_modb(hdmi, HDMI_STATUS, m_INT_HOTPLUG, m_INT_HOTPLUG);
> +		ret =3D IRQ_WAKE_THREAD;
> +	}
> +
> +	return ret;
> +}
> +
> +static irqreturn_t starfive_hdmi_irq(int irq, void *dev_id)
> +{
> +	struct starfive_hdmi *hdmi =3D dev_id;
> +
> +	drm_connector_helper_hpd_irq_event(&hdmi->connector);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int starfive_hdmi_i2c_read(struct starfive_hdmi *hdmi, struct i2c=
_msg *msgs)
> +{
> +	int length =3D msgs->len;
> +	u8 *buf =3D msgs->buf;
> +	int ret;
> +
> +	ret =3D wait_for_completion_timeout(&hdmi->i2c->cmp, HZ / 10);
> +	if (!ret)
> +		return -EAGAIN;
> +
> +	while (length--)
> +		*buf++ =3D hdmi_readb(hdmi, HDMI_EDID_FIFO_ADDR);
> +
> +	return 0;
> +}
> +
> +static int starfive_hdmi_i2c_write(struct starfive_hdmi *hdmi, struct i2=
c_msg *msgs)
> +{
> +	/*
> +	 * The DDC module only support read EDID message, so
> +	 * we assume that each word write to this i2c adapter
> +	 * should be the offset of EDID word address.
> +	 */
> +	if (msgs->len !=3D 1 ||
> +	    (msgs->addr !=3D DDC_ADDR && msgs->addr !=3D DDC_SEGMENT_ADDR))
> +		return -EINVAL;
> +
> +	reinit_completion(&hdmi->i2c->cmp);
> +
> +	if (msgs->addr =3D=3D DDC_SEGMENT_ADDR)
> +		hdmi->i2c->segment_addr =3D msgs->buf[0];
> +	if (msgs->addr =3D=3D DDC_ADDR)
> +		hdmi->i2c->ddc_addr =3D msgs->buf[0];
> +
> +	/* Set edid fifo first addr */
> +	hdmi_writeb(hdmi, HDMI_EDID_FIFO_OFFSET, 0x00);
> +
> +	/* Set edid word address 0x00/0x80 */
> +	hdmi_writeb(hdmi, HDMI_EDID_WORD_ADDR, hdmi->i2c->ddc_addr);
> +
> +	/* Set edid segment pointer */
> +	hdmi_writeb(hdmi, HDMI_EDID_SEGMENT_POINTER, hdmi->i2c->segment_addr);
> +
> +	return 0;
> +}
> +
> +static int starfive_hdmi_i2c_xfer(struct i2c_adapter *adap,
> +				  struct i2c_msg *msgs, int num)
> +{
> +	struct starfive_hdmi *hdmi =3D i2c_get_adapdata(adap);
> +	struct starfive_hdmi_i2c *i2c =3D hdmi->i2c;
> +	int i, ret =3D 0;
> +
> +	mutex_lock(&i2c->lock);
> +
> +	/* Clear the EDID interrupt flag and unmute the interrupt */
> +	hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, m_INT_EDID_READY);
> +	hdmi_writeb(hdmi, HDMI_INTERRUPT_STATUS1, m_INT_EDID_READY);
> +
> +	for (i =3D 0; i < num; i++) {
> +		DRM_DEV_DEBUG(hdmi->dev,
> +			      "xfer: num: %d/%d, len: %d, flags: %#x\n",
> +			      i + 1, num, msgs[i].len, msgs[i].flags);
> +
> +		if (msgs[i].flags & I2C_M_RD)
> +			ret =3D starfive_hdmi_i2c_read(hdmi, &msgs[i]);
> +		else
> +			ret =3D starfive_hdmi_i2c_write(hdmi, &msgs[i]);
> +
> +		if (ret < 0)
> +			break;
> +	}
> +
> +	if (!ret)
> +		ret =3D num;
> +
> +	/* Mute HDMI EDID interrupt */
> +	hdmi_writeb(hdmi, HDMI_INTERRUPT_MASK1, 0);
> +
> +	mutex_unlock(&i2c->lock);
> +
> +	return ret;
> +}
> +
> +static u32 starfive_hdmi_i2c_func(struct i2c_adapter *adapter)
> +{
> +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
> +}
> +
> +static const struct i2c_algorithm starfive_hdmi_algorithm =3D {
> +	.master_xfer	=3D starfive_hdmi_i2c_xfer,
> +	.functionality	=3D starfive_hdmi_i2c_func,
> +};
> +
> +static struct i2c_adapter *starfive_hdmi_i2c_adapter(struct starfive_hdm=
i *hdmi)
> +{
> +	struct i2c_adapter *adap;
> +	struct starfive_hdmi_i2c *i2c;
> +	int ret;
> +
> +	i2c =3D devm_kzalloc(hdmi->dev, sizeof(*i2c), GFP_KERNEL);
> +		if (!i2c)
> +			return ERR_PTR(-ENOMEM);
> +
> +	mutex_init(&i2c->lock);
> +	init_completion(&i2c->cmp);
> +
> +	adap =3D &i2c->adap;
> +	adap->class =3D I2C_CLASS_DDC;
> +	adap->owner =3D THIS_MODULE;
> +	adap->dev.parent =3D hdmi->dev;
> +	adap->algo =3D &starfive_hdmi_algorithm;
> +	strscpy(adap->name, "Starfive HDMI", sizeof(adap->name));
> +	i2c_set_adapdata(adap, hdmi);
> +
> +	ret =3D devm_i2c_add_adapter(hdmi->dev, adap);
> +	if (ret) {
> +		dev_warn(hdmi->dev, "cannot add %s I2C adapter\n", adap->name);
> +		devm_kfree(hdmi->dev, i2c);
> +		return ERR_PTR(ret);
> +	}
> +
> +	hdmi->i2c =3D i2c;
> +
> +	DRM_DEV_INFO(hdmi->dev, "registered %s I2C bus driver success\n", adap-=
>name);
> +
> +	return adap;
> +}
> +
> +static int starfive_hdmi_get_clk_rst(struct device *dev, struct starfive=
_hdmi *hdmi)
> +{
> +	int ret;
> +
> +	hdmi->nclks =3D ARRAY_SIZE(hdmi->clk_hdmi);
> +	for (int i =3D 0; i < hdmi->nclks; ++i)
> +		hdmi->clk_hdmi[i].id =3D hdmi_clocks[i];
> +
> +	ret =3D devm_clk_bulk_get(dev, hdmi->nclks, hdmi->clk_hdmi);
> +	if (ret) {
> +		dev_err(dev, "Failed to get clk controls\n");
> +		return ret;
> +	}
> +
> +	hdmi->tx_rst =3D devm_reset_control_get_by_index(dev, 0);
> +	if (IS_ERR(hdmi->tx_rst)) {
> +		dev_err(dev, "failed to get tx_rst reset\n");
> +		return PTR_ERR(hdmi->tx_rst);
> +	}
> +
> +	return 0;
> +}
> +
> +static int starfive_hdmi_bind(struct device *dev, struct device *master,
> +			      void *data)
> +{
> +	struct drm_device *drm =3D dev_get_drvdata(master);
> +	struct starfive_hdmi_encoder *hdmi_encoder;
> +	int ret;
> +
> +	hdmi_encoder =3D drmm_simple_encoder_alloc(drm, struct starfive_hdmi_en=
coder,
> +						 encoder, DRM_MODE_ENCODER_TMDS);
> +	if (IS_ERR(hdmi_encoder))
> +		return PTR_ERR(hdmi_encoder);
> +
> +	hdmi_encoder->hdmi =3D dev_get_drvdata(dev);
> +	hdmi_encoder->hdmi->drm_dev =3D drm;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;
> +
> +	starfive_hdmi_i2c_init(hdmi_encoder->hdmi);
> +
> +	ret =3D starfive_hdmi_register(drm, hdmi_encoder);
> +	if (ret)
> +		goto err_put_adapter;
> +
> +	/* Unmute hotplug interrupt */
> +	hdmi_modb(hdmi_encoder->hdmi, HDMI_STATUS, m_MASK_INT_HOTPLUG, v_MASK_I=
NT_HOTPLUG(1));
> +
> +	ret =3D devm_request_threaded_irq(dev, hdmi_encoder->hdmi->irq, starfiv=
e_hdmi_hardirq,
> +					starfive_hdmi_irq, IRQF_SHARED,
> +					dev_name(dev), hdmi_encoder->hdmi);
> +	if (ret < 0)
> +		goto err_put_adapter;
> +
> +	pm_runtime_put_sync(dev);
> +
> +	return 0;
> +
> +err_put_adapter:
> +	i2c_put_adapter(hdmi_encoder->hdmi->ddc);
> +	return ret;
> +}
> +
> +static const struct component_ops starfive_hdmi_ops =3D {
> +	.bind	=3D starfive_hdmi_bind,
> +};
> +
> +static int starfive_hdmi_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +	struct starfive_hdmi *hdmi;
> +	struct resource *iores;
> +
> +	hdmi =3D devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
> +	if (!hdmi)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(&pdev->dev, hdmi);
> +	hdmi->dev =3D &pdev->dev;
> +
> +	iores =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	hdmi->regs =3D devm_ioremap_resource(hdmi->dev, iores);
> +	if (IS_ERR(hdmi->regs))
> +		return PTR_ERR(hdmi->regs);
> +
> +	ret =3D starfive_hdmi_get_clk_rst(hdmi->dev, hdmi);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D devm_pm_runtime_enable(hdmi->dev);
> +	if (ret)
> +		return ret;
> +
> +	hdmi->irq =3D platform_get_irq(pdev, 0);
> +	if (hdmi->irq < 0) {
> +		ret =3D hdmi->irq;
> +		return ret;
> +	}
> +
> +	hdmi->ddc =3D starfive_hdmi_i2c_adapter(hdmi);
> +	if (IS_ERR(hdmi->ddc)) {
> +		ret =3D PTR_ERR(hdmi->ddc);
> +		hdmi->ddc =3D NULL;
> +		return ret;
> +	}
> +
> +	return component_add(&pdev->dev, &starfive_hdmi_ops);
> +}
> +
> +static int starfive_hdmi_remove(struct platform_device *pdev)
> +{
> +	component_del(&pdev->dev, &starfive_hdmi_ops);
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops hdmi_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(hdmi_runtime_suspend, hdmi_runtime_resume, NULL)
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(hdmi_system_pm_suspend, hdmi_system_pm_res=
ume)
> +};
> +
> +static const struct of_device_id starfive_hdmi_dt_ids[] =3D {
> +	{ .compatible =3D "starfive,jh7110-inno-hdmi",},

So it's inno hdmi, just like Rockchip then?

This should be a common driver.
Maxime

--lz6qckxqush7mxso
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZXA5JQAKCRDj7w1vZxhR
xYMpAP9HwWdtiN8TL9/kAGZWtcA+Eii19Pfjii23UVHOfE+22gD/WZUb0WFTF3RB
k/GamQfL8yfD04pJhCSsBsHJaA1BPAM=
=CAd1
-----END PGP SIGNATURE-----

--lz6qckxqush7mxso--
