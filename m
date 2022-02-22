Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1214BF39D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:28:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FFD10F4DA;
	Tue, 22 Feb 2022 08:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA5510F4D9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 08:27:57 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0E2585802A4;
 Tue, 22 Feb 2022 03:27:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 22 Feb 2022 03:27:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=wj2CtXvedn5Cz5cElnAg5EOYYOZQZRVKuffm5M
 YNxm0=; b=HwzMLJYOM4e7T1A+XfzrCeFSRX+w0+84h6AChq9Fyp4S+Uv9CbAorM
 Qyp/EOsixJ9N6cDiwWzKJDvOMyFle5cKetDbA0M4V543mVLp5I8q97dA6NW4j8m2
 Ss9+x0BqV2jWaksCxBcJcy2rx9MbMV3j/hNtIp5p4GVcF1YqUkuj4fF57yX2as93
 vAePxp6QzoXlzge+6M8NdQbjCw8JVRFuRF4riuXjK6umJdiD8lONxZr60/rWQSej
 G/r+gewdphUN8YHc9Xkez11B9QQj4REUKWp5B6yA0gqEPqXkJGHRkge4bekCwBhX
 QG66X67urh/MBf9OUyKnpX7XlZSEVqjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wj2CtXvedn5Cz5cEl
 nAg5EOYYOZQZRVKuffm5MYNxm0=; b=kC+np2I+v2d3LRMNONPmJIk2EjfLuEOeK
 i01Zh19sJawyQeh23fjnpcwtgXqxbJKbm2366gc4PwwPYz8UnvrPvaLzQBzPYwvt
 5UAxJFJT+D6P3nS/dcm/ZoedVho+IgvVCf3/lr5Z2jesk99ObDZfdgd9wsaH6rbf
 oWOsdyMyb9l9cvaPHdbM3ZDtV5QTn4/zsJlIqnsNwzN/KH2t4qYBB/7tIseBlM+0
 H8ZDCQZlh4Ptmb343efWwxdB8aSCApCIYKS+L7LO9l5MNSp+XDW799ZzbNrmTjvO
 blPKrnJHDS2p/V09GThsmcSbVix1cGYvMhv7lpKkCj4WpMFo2NFBw==
X-ME-Sender: <xms:h54UYhHTEDCXaSl0lhJYroczqxyOWpTMpPubpBR51nmcA8kk8CuSOQ>
 <xme:h54UYmVAbS73hd_MxQAFuDMJiTHVm1Ip-N7r7gm5tuKp98WFg7D1GCYX87FdOfC2Y
 EB8eXzfUoTtFMsA29k>
X-ME-Received: <xmr:h54UYjKB29ayFO3pqK4NarOusUL-SpWDwjmIgLwxW7PMwjulW8tXZIuHc2v4nbYXm6jdsbpQvSSJJQpgjrrpl3oDCAR2OkCXTTGUWGk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeejgdduudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:h54UYnFahGxlc2mjOHlmK3HcCzrhbPHkXYr7KebgwRlh1Q7UWUp4Mw>
 <xmx:h54UYnXMC7hm0pnKwfZ3t9HZlpARhWT47L5jlRnClcKsnh4_KL67Rg>
 <xmx:h54UYiPIeWlcU76M3LxFw-XhL7NfxfbPPngImHvfxsgOPirVF9BvrA>
 <xmx:ip4UYlnk5MFcnpPTk89XqlJCg1ZQOF-EuUPgMlWkJpuWCtWvbkI4UQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 03:27:50 -0500 (EST)
Date: Tue, 22 Feb 2022 09:27:47 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sui Jingfeng <15330273260@189.cn>
Subject: Re: [PATCH v10 3/4] drm/lsdc: add drm driver for loongson display
 controller
Message-ID: <20220222082747.66otrkc4zwvhem7w@houat>
References: <20220220145554.117854-1-15330273260@189.cn>
 <20220220145554.117854-4-15330273260@189.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xo7mis7ioaunnpmu"
Content-Disposition: inline
In-Reply-To: <20220220145554.117854-4-15330273260@189.cn>
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xo7mis7ioaunnpmu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Sun, Feb 20, 2022 at 10:55:53PM +0800, Sui Jingfeng wrote:
> +/* lsdc_get_display_timings_from_dtb - Get display timings from the device tree
> + *
> + * @np: point to the device node contain the display timings
> + * @pptim: point to where the pointer of struct display_timings is store to
> + */
> +static void lsdc_get_display_timings_from_dtb(struct device_node *np,
> +					      struct display_timings **pptim)
> +{
> +	struct display_timings *timings;
> +
> +	if (!np)
> +		return;
> +
> +	timings = of_get_display_timings(np);
> +	if (timings)
> +		*pptim = timings;
> +}

This is not documented in your binding.

> +static int lsdc_get_connector_type(struct drm_device *ddev,
> +				   struct device_node *output,
> +				   unsigned int index)
> +{
> +	const char *name;
> +	int ret;
> +
> +	ret = of_property_read_string(output, "connector", &name);
> +	if (ret < 0)
> +		return DRM_MODE_CONNECTOR_Unknown;
> +
> +	if (strncmp(name, "vga-connector", 13) == 0) {
> +		ret = DRM_MODE_CONNECTOR_VGA;
> +		drm_info(ddev, "connector%d is VGA\n", index);
> +	} else if (strncmp(name, "dvi-connector", 13) == 0) {
> +		bool analog, digital;
> +
> +		analog = of_property_read_bool(output, "analog");
> +		digital = of_property_read_bool(output, "digital");
> +
> +		if (analog && !digital)
> +			ret = DRM_MODE_CONNECTOR_DVIA;
> +		else if (analog && digital)
> +			ret = DRM_MODE_CONNECTOR_DVII;
> +		else
> +			ret = DRM_MODE_CONNECTOR_DVID;
> +
> +		drm_info(ddev, "connector%d is DVI\n", index);
> +	} else if (strncmp(name, "virtual-connector", 17) == 0) {
> +		ret = DRM_MODE_CONNECTOR_VIRTUAL;
> +		drm_info(ddev, "connector%d is virtual\n", index);
> +	} else if (strncmp(name, "dpi-connector", 13) == 0) {
> +		ret = DRM_MODE_CONNECTOR_DPI;
> +		drm_info(ddev, "connector%d is DPI\n", index);
> +	} else if (strncmp(name, "hdmi-connector", 14) == 0) {
> +		int res;
> +		const char *hdmi_type;
> +
> +		ret = DRM_MODE_CONNECTOR_HDMIA;
> +
> +		res = of_property_read_string(output, "type", &hdmi_type);
> +		if (res == 0 && !strcmp(hdmi_type, "b"))
> +			ret = DRM_MODE_CONNECTOR_HDMIB;
> +
> +		drm_info(ddev, "connector%d is HDMI, type is %s\n", index, hdmi_type);
> +	} else {
> +		ret = DRM_MODE_CONNECTOR_Unknown;
> +		drm_info(ddev, "The type of connector%d is unknown\n", index);
> +	}
> +
> +	return ret;
> +}

Your ports and that you're using the connectors bindings either.

> +struct lsdc_connector *lsdc_connector_init(struct lsdc_device *ldev, unsigned int index)
> +{
> +	struct drm_device *ddev = &ldev->drm;
> +	struct device_node *np = ddev->dev->of_node;
> +	struct device_node *output = NULL;
> +	unsigned int connector_type = DRM_MODE_CONNECTOR_Unknown;
> +	struct device_node *disp_tims_np;
> +	struct lsdc_connector *lconn;
> +	struct drm_connector *connector;
> +	int ret;
> +
> +	lconn = devm_kzalloc(ddev->dev, sizeof(*lconn), GFP_KERNEL);
> +	if (!lconn)
> +		return ERR_PTR(-ENOMEM);
> +
> +	lconn->index = index;
> +	lconn->has_disp_tim = false;
> +	lconn->ddc = NULL;
> +
> +	output = of_parse_phandle(np, "output-ports", index);
> +	if (!output) {
> +		drm_warn(ddev, "no output-ports property, please update dtb\n");
> +		/*
> +		 * Providing a blindly support even though no output-ports
> +		 * property is provided in the dtb.
> +		 */
> +		goto DT_SKIPED;
> +	}

output-ports is not documented either.

> +	if (!of_device_is_available(output)) {
> +		of_node_put(output);
> +		drm_info(ddev, "connector%d is not available\n", index);
> +		return NULL;
> +	}
> +
> +	disp_tims_np = of_get_child_by_name(output, "display-timings");
> +	if (disp_tims_np) {
> +		lsdc_get_display_timings_from_dtb(output, &lconn->disp_tim);
> +		lconn->has_disp_tim = true;
> +		of_node_put(disp_tims_np);
> +		drm_info(ddev, "Found display timings provided by connector%d\n", index);
> +	}
> +
> +	connector_type = lsdc_get_connector_type(ddev, output, index);
> +
> +	if (output) {
> +		of_node_put(output);
> +		output = NULL;
> +	}
> +
> +DT_SKIPED:
> +
> +	/* Only create the i2c channel if display timing is not provided */
> +	if (!lconn->has_disp_tim) {
> +		const struct lsdc_chip_desc * const desc = ldev->desc;
> +
> +		if (desc->have_builtin_i2c)
> +			lconn->ddc = lsdc_create_i2c_chan(ddev, index);
> +		else
> +			lconn->ddc = lsdc_get_i2c_adapter(ddev, index);

This looks weird: the connector bindings have a property to store the
i2c controller connected to the DDC lines, so you should use that
instead.

> +		if (IS_ERR(lconn->ddc)) {
> +			lconn->ddc = NULL;
> +
> +			drm_err(ddev, "Get i2c adapter failed: %ld\n",
> +				PTR_ERR(lconn->ddc));
> +		} else if (lconn->ddc)
> +			drm_info(ddev, "i2c%d for connector%d created\n",
> +				 i2c_adapter_id(lconn->ddc), index);
> +	}
> +
> +	connector = &lconn->base;
> +	connector->polled = DRM_CONNECTOR_POLL_CONNECT | DRM_CONNECTOR_POLL_DISCONNECT;
> +
> +	ret = drm_connector_init_with_ddc(ddev,
> +					  connector,
> +					  &lsdc_connector_funcs,
> +					  connector_type,
> +					  lconn->ddc);
> +	if (ret) {
> +		drm_err(ddev, "init connector%d failed\n", index);
> +		goto ERR_CONNECTOR_INIT;
> +	}
> +
> +	drm_connector_helper_add(connector, &lsdc_connector_helpers);
> +
> +	return lconn;
> +
> +ERR_CONNECTOR_INIT:
> +	if (!IS_ERR_OR_NULL(lconn->ddc))
> +		lsdc_destroy_i2c(ddev, lconn->ddc);
> +
> +	return ERR_PTR(ret);
> +}
> diff --git a/drivers/gpu/drm/lsdc/lsdc_connector.h b/drivers/gpu/drm/lsdc/lsdc_connector.h
> new file mode 100644
> index 000000000000..fff64398b984
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_connector.h
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * KMS driver for Loongson display controller
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#ifndef __LSDC_CONNECTOR_H__
> +#define __LSDC_CONNECTOR_H__
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_connector.h>
> +
> +struct lsdc_connector {
> +	struct drm_connector base;
> +
> +	struct i2c_adapter *ddc;
> +
> +	/* Read display timmings from dtb support */
> +	struct display_timings *disp_tim;
> +	bool has_disp_tim;
> +
> +	int index;
> +};
> +
> +#define to_lsdc_connector(x)        \
> +		container_of(x, struct lsdc_connector, base)
> +
> +struct lsdc_connector *lsdc_connector_init(struct lsdc_device *ldev,
> +					   unsigned int index);
> +
> +#endif
> diff --git a/drivers/gpu/drm/lsdc/lsdc_crtc.c b/drivers/gpu/drm/lsdc/lsdc_crtc.c
> new file mode 100644
> index 000000000000..8e07c2e4b606
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_crtc.c
> @@ -0,0 +1,338 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KMS driver for Loongson display controller
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +#include <drm/drm_vblank.h>
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_helper.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_regs.h"
> +#include "lsdc_pll.h"
> +
> +static int lsdc_crtc_enable_vblank(struct drm_crtc *crtc)
> +{
> +	struct lsdc_device *ldev = to_lsdc(crtc->dev);
> +	unsigned int index = drm_crtc_index(crtc);
> +	struct drm_crtc_state *state = crtc->state;
> +	u32 val;
> +
> +	if (state->enable) {
> +		val = lsdc_reg_read32(ldev, LSDC_INT_REG);
> +
> +		if (index == 0)
> +			val |= INT_CRTC0_VS_EN;
> +		else if (index == 1)
> +			val |= INT_CRTC1_VS_EN;
> +
> +		lsdc_reg_write32(ldev, LSDC_INT_REG, val);
> +	}
> +
> +	return 0;
> +}
> +
> +static void lsdc_crtc_disable_vblank(struct drm_crtc *crtc)
> +{
> +	struct lsdc_device *ldev = to_lsdc(crtc->dev);
> +	unsigned int index = drm_crtc_index(crtc);
> +	u32 val;
> +
> +	val = lsdc_reg_read32(ldev, LSDC_INT_REG);
> +
> +	if (index == 0)
> +		val &= ~INT_CRTC0_VS_EN;
> +	else if (index == 1)
> +		val &= ~INT_CRTC1_VS_EN;
> +
> +	lsdc_reg_write32(ldev, LSDC_INT_REG, val);
> +}
> +
> +static void lsdc_crtc_reset(struct drm_crtc *crtc)
> +{
> +	struct drm_device *ddev = crtc->dev;
> +	struct lsdc_device *ldev = to_lsdc(ddev);
> +	unsigned int index = drm_crtc_index(crtc);
> +	struct lsdc_crtc_state *priv_crtc_state;
> +	u32 val;
> +
> +	/* The crtc get soft reset if bit 20 of CRTC*_CFG_REG
> +	 * is write with falling edge.
> +	 *
> +	 * Doing this to switch from soft reset state to working state
> +	 */
> +	if (index == 0) {
> +		val = CFG_RESET_BIT | CFG_OUTPUT_EN_BIT | LSDC_PF_XRGB8888;
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
> +	} else if (index == 1) {
> +		val = CFG_RESET_BIT | CFG_OUTPUT_EN_BIT | LSDC_PF_XRGB8888;
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
> +	}
> +
> +	if (crtc->state) {
> +		priv_crtc_state = to_lsdc_crtc_state(crtc->state);
> +		__drm_atomic_helper_crtc_destroy_state(&priv_crtc_state->base);
> +		kfree(priv_crtc_state);
> +	}
> +
> +	priv_crtc_state = kzalloc(sizeof(*priv_crtc_state), GFP_KERNEL);
> +	if (!priv_crtc_state)
> +		return;
> +
> +	__drm_atomic_helper_crtc_reset(crtc, &priv_crtc_state->base);
> +
> +	drm_dbg(ddev, "crtc%u reset\n", index);
> +}
> +
> +static void lsdc_crtc_atomic_destroy_state(struct drm_crtc *crtc, struct drm_crtc_state *state)
> +{
> +	struct lsdc_crtc_state *priv_crtc_state = to_lsdc_crtc_state(state);
> +
> +	__drm_atomic_helper_crtc_destroy_state(&priv_crtc_state->base);
> +
> +	kfree(priv_crtc_state);
> +}
> +
> +static struct drm_crtc_state *lsdc_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
> +{
> +	struct lsdc_crtc_state *new_priv_state;
> +	struct lsdc_crtc_state *old_priv_state;
> +	struct drm_device *ddev = crtc->dev;
> +
> +	if (drm_WARN_ON(ddev, !crtc->state))
> +		return NULL;
> +
> +	new_priv_state = kmalloc(sizeof(*new_priv_state), GFP_KERNEL);
> +	if (!new_priv_state)
> +		return NULL;
> +
> +	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_priv_state->base);
> +
> +	old_priv_state = to_lsdc_crtc_state(crtc->state);
> +
> +	memcpy(&new_priv_state->pparams, &old_priv_state->pparams, sizeof(new_priv_state->pparams));
> +
> +	return &new_priv_state->base;
> +}
> +
> +static const struct drm_crtc_funcs lsdc_crtc_funcs = {
> +	.reset = lsdc_crtc_reset,
> +	.destroy = drm_crtc_cleanup,
> +	.set_config = drm_atomic_helper_set_config,
> +	.page_flip = drm_atomic_helper_page_flip,
> +	.atomic_duplicate_state = lsdc_crtc_atomic_duplicate_state,
> +	.atomic_destroy_state = lsdc_crtc_atomic_destroy_state,
> +	.enable_vblank = lsdc_crtc_enable_vblank,
> +	.disable_vblank = lsdc_crtc_disable_vblank,
> +};
> +
> +static enum drm_mode_status
> +lsdc_crtc_helper_mode_valid(struct drm_crtc *crtc,
> +			    const struct drm_display_mode *mode)
> +{
> +	struct drm_device *ddev = crtc->dev;
> +	struct lsdc_device *ldev = to_lsdc(ddev);
> +	const struct lsdc_chip_desc *desc = ldev->desc;
> +
> +	if (mode->hdisplay > desc->max_width)
> +		return MODE_BAD_HVALUE;
> +	if (mode->vdisplay > desc->max_height)
> +		return MODE_BAD_VVALUE;
> +
> +	if (mode->clock > desc->max_pixel_clk) {
> +		drm_dbg_kms(ddev, "mode %dx%d, pixel clock=%d is too high\n",
> +			    mode->hdisplay, mode->vdisplay, mode->clock);
> +		return MODE_CLOCK_HIGH;
> +	}
> +
> +	/* The CRTC hardware dma take 256 bytes once a time,
> +	 * it is a limitation of the CRTC.
> +	 * TODO: check RGB565 support
> +	 */
> +	if ((mode->hdisplay * 4) % desc->stride_alignment) {
> +		drm_dbg_kms(ddev, "stride is not %u bytes aligned\n", desc->stride_alignment);
> +		return MODE_BAD;
> +	}
> +
> +	return MODE_OK;
> +}
> +
> +static int lsdc_crtc_helper_atomic_check(struct drm_crtc *crtc,
> +					 struct drm_atomic_state *state)
> +{
> +	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +
> +	if (!crtc_state->enable)
> +		return 0; /* no mode checks if CRTC is being disabled */
> +
> +	return 0;
> +}

You can just remove that function if  you're returning 0 in both cases.

> +
> +static void lsdc_update_pixclk(struct drm_crtc *crtc, unsigned int pixclk)
> +{
> +	struct lsdc_display_pipe *dispipe = container_of(crtc, struct lsdc_display_pipe, crtc);
> +	struct lsdc_pll *pixpll = &dispipe->pixpll;
> +	const struct lsdc_pixpll_funcs *clkfun = pixpll->funcs;
> +	struct lsdc_crtc_state *priv_state = to_lsdc_crtc_state(crtc->state);
> +
> +	clkfun->update(pixpll, &priv_state->pparams);

It looks like pparams isn't set anywhere in atomic_check though, where
is it supposed to come from?

> +}
> +
> +static void lsdc_crtc_helper_mode_set_nofb(struct drm_crtc *crtc)
> +{
> +	struct drm_device *ddev = crtc->dev;
> +	struct lsdc_device *ldev = to_lsdc(ddev);
> +	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
> +	unsigned int pixclock = mode->clock;
> +	unsigned int index = drm_crtc_index(crtc);
> +	u32 h_sync, v_sync, h_val, v_val;
> +
> +	/* 26:16 total pixels, 10:0 visiable pixels, in horizontal */
> +	h_val = (mode->crtc_htotal << 16) | mode->crtc_hdisplay;
> +	/* 26:16 total pixels, 10:0 visiable pixels, in vertical */
> +	v_val = (mode->crtc_vtotal << 16) | mode->crtc_vdisplay;
> +	/* 26:16 hsync end, 10:0 hsync start, bit 30 is hsync enable */
> +	h_sync = (mode->crtc_hsync_end << 16) | mode->crtc_hsync_start | EN_HSYNC_BIT;
> +	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> +		h_sync |= INV_HSYNC_BIT;
> +
> +	/* 26:16 vsync end, 10:0 vsync start, bit 30 is vsync enable */
> +	v_sync = (mode->crtc_vsync_end << 16) | mode->crtc_vsync_start | EN_VSYNC_BIT;
> +	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> +		v_sync |= INV_VSYNC_BIT;
> +
> +	if (index == 0) {
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_FB_ORIGIN_REG, 0);
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_HDISPLAY_REG, h_val);
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_VDISPLAY_REG, v_val);
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_HSYNC_REG, h_sync);
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_VSYNC_REG, v_sync);
> +	} else if (index == 1) {
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_FB_ORIGIN_REG, 0);
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_HDISPLAY_REG, h_val);
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_VDISPLAY_REG, v_val);
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_HSYNC_REG, h_sync);
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_VSYNC_REG, v_sync);
> +	}
> +
> +	drm_dbg(ddev, "%s modeset: %ux%u\n", crtc->name, mode->hdisplay, mode->vdisplay);
> +
> +	lsdc_update_pixclk(crtc, pixclock);

So it's the mode clock? But then, the argument to lsdc_update_pixclk is
entirely ignored, so it's probably not what you'd want either.

> +}
> +
> +static void lsdc_enable_display(struct lsdc_device *ldev, unsigned int index)
> +{
> +	u32 val;
> +
> +	if (index == 0) {
> +		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
> +		val |= CFG_OUTPUT_EN_BIT;
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
> +	} else if (index == 1) {
> +		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
> +		val |= CFG_OUTPUT_EN_BIT;
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
> +	}
> +}
> +
> +static void lsdc_disable_display(struct lsdc_device *ldev, unsigned int index)
> +{
> +	u32 val;
> +
> +	if (index == 0) {
> +		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
> +		val &= ~CFG_OUTPUT_EN_BIT;
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
> +	} else if (index == 1) {
> +		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
> +		val &= ~CFG_OUTPUT_EN_BIT;
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
> +	}
> +}
> +
> +static void lsdc_crtc_helper_atomic_enable(struct drm_crtc *crtc,
> +					   struct drm_atomic_state *state)
> +{
> +	struct drm_device *ddev = crtc->dev;
> +	struct lsdc_device *ldev = to_lsdc(ddev);
> +
> +	drm_crtc_vblank_on(crtc);
> +
> +	lsdc_enable_display(ldev, drm_crtc_index(crtc));
> +
> +	drm_dbg(ddev, "%s: enabled\n", crtc->name);
> +}
> +
> +static void lsdc_crtc_helper_atomic_disable(struct drm_crtc *crtc,
> +					    struct drm_atomic_state *state)
> +{
> +	struct drm_device *ddev = crtc->dev;
> +	struct lsdc_device *ldev = to_lsdc(ddev);
> +
> +	drm_crtc_vblank_off(crtc);
> +
> +	lsdc_disable_display(ldev, drm_crtc_index(crtc));
> +
> +	drm_dbg(ddev, "%s: disabled\n", crtc->name);
> +}
> +
> +static void lsdc_crtc_atomic_flush(struct drm_crtc *crtc,
> +				   struct drm_atomic_state *state)
> +{
> +	struct drm_pending_vblank_event *event = crtc->state->event;
> +
> +	if (event) {
> +		crtc->state->event = NULL;
> +
> +		spin_lock_irq(&crtc->dev->event_lock);
> +		if (drm_crtc_vblank_get(crtc) == 0)
> +			drm_crtc_arm_vblank_event(crtc, event);
> +		else
> +			drm_crtc_send_vblank_event(crtc, event);
> +		spin_unlock_irq(&crtc->dev->event_lock);
> +	}
> +}
> +
> +static const struct drm_crtc_helper_funcs lsdc_crtc_helper_funcs = {
> +	.mode_valid = lsdc_crtc_helper_mode_valid,
> +	.mode_set_nofb = lsdc_crtc_helper_mode_set_nofb,
> +	.atomic_enable = lsdc_crtc_helper_atomic_enable,
> +	.atomic_disable = lsdc_crtc_helper_atomic_disable,
> +	.atomic_check = lsdc_crtc_helper_atomic_check,
> +	.atomic_flush = lsdc_crtc_atomic_flush,
> +};
> +
> +/**
> + * lsdc_crtc_init
> + *
> + * @ddev: point to the drm_device structure
> + * @index: hardware crtc index
> + *
> + * Init CRTC
> + */
> +int lsdc_crtc_init(struct drm_device *ddev,
> +		   struct drm_crtc *crtc,
> +		   unsigned int index,
> +		   struct drm_plane *primary,
> +		   struct drm_plane *cursor)
> +{
> +	int ret;
> +
> +	drm_crtc_helper_add(crtc, &lsdc_crtc_helper_funcs);
> +
> +	ret = drm_mode_crtc_set_gamma_size(crtc, 256);
> +	if (ret)
> +		drm_warn(ddev, "set the gamma table size failed\n");
> +
> +	return drm_crtc_init_with_planes(ddev,
> +					 crtc,
> +					 primary,
> +					 cursor,
> +					 &lsdc_crtc_funcs,
> +					 "crtc%d",
> +					 index);
> +}
> diff --git a/drivers/gpu/drm/lsdc/lsdc_drv.c b/drivers/gpu/drm/lsdc/lsdc_drv.c
> new file mode 100644
> index 000000000000..8d6735a0c72e
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_drv.c
> @@ -0,0 +1,672 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * KMS driver for Loongson display controller
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/of_reserved_mem.h>
> +
> +#include <drm/drm_aperture.h>
> +#include <drm/drm_of.h>
> +#include <drm/drm_vblank.h>
> +#include <drm/drm_debugfs.h>
> +#include <drm/drm_fb_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_vram_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_probe_helper.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_irq.h"
> +#include "lsdc_regs.h"
> +#include "lsdc_connector.h"
> +#include "lsdc_pll.h"
> +
> +#define DRIVER_AUTHOR		"Sui Jingfeng <suijingfeng@loongson.cn>"
> +#define DRIVER_NAME		"lsdc"
> +#define DRIVER_DESC		"drm driver for loongson's display controller"
> +#define DRIVER_DATE		"20200701"
> +#define DRIVER_MAJOR		1
> +#define DRIVER_MINOR		0
> +#define DRIVER_PATCHLEVEL	0
> +
> +static int lsdc_use_vram_helper = -1;
> +MODULE_PARM_DESC(use_vram_helper, "Using vram helper based driver(0 = disabled)");
> +module_param_named(use_vram_helper, lsdc_use_vram_helper, int, 0644);

Sigh... We've been over this a couple of times already.

> +static const struct lsdc_chip_desc dc_in_ls2k1000 = {
> +	.chip = LSDC_CHIP_2K1000,
> +	.num_of_crtc = LSDC_NUM_CRTC,
> +	/* ls2k1000 user manual say the max pixel clock can be about 200MHz */
> +	.max_pixel_clk = 200000,
> +	.max_width = 2560,
> +	.max_height = 2048,
> +	.num_of_hw_cursor = 1,
> +	.hw_cursor_w = 32,
> +	.hw_cursor_h = 32,
> +	.stride_alignment = 256,
> +	.have_builtin_i2c = false,
> +	.has_vram = false,
> +};
> +
> +static const struct lsdc_chip_desc dc_in_ls2k0500 = {
> +	.chip = LSDC_CHIP_2K0500,
> +	.num_of_crtc = LSDC_NUM_CRTC,
> +	.max_pixel_clk = 200000,
> +	.max_width = 2048,
> +	.max_height = 2048,
> +	.num_of_hw_cursor = 1,
> +	.hw_cursor_w = 32,
> +	.hw_cursor_h = 32,
> +	.stride_alignment = 256,
> +	.have_builtin_i2c = false,
> +	.has_vram = false,
> +};
> +
> +static const struct lsdc_chip_desc dc_in_ls7a1000 = {
> +	.chip = LSDC_CHIP_7A1000,
> +	.num_of_crtc = LSDC_NUM_CRTC,
> +	.max_pixel_clk = 200000,
> +	.max_width = 2048,
> +	.max_height = 2048,
> +	.num_of_hw_cursor = 1,
> +	.hw_cursor_w = 32,
> +	.hw_cursor_h = 32,
> +	.stride_alignment = 256,
> +	.have_builtin_i2c = true,
> +	.has_vram = true,
> +};
> +
> +static enum drm_mode_status
> +lsdc_device_mode_valid(struct drm_device *ddev, const struct drm_display_mode *mode)
> +{
> +	struct lsdc_device *ldev = to_lsdc(ddev);
> +
> +	if (ldev->use_vram_helper)
> +		return drm_vram_helper_mode_valid(ddev, mode);
> +
> +	return MODE_OK;
> +}
> +
> +static const struct drm_mode_config_funcs lsdc_mode_config_funcs = {
> +	.fb_create = drm_gem_fb_create,
> +	.output_poll_changed = drm_fb_helper_output_poll_changed,
> +	.atomic_check = drm_atomic_helper_check,
> +	.atomic_commit = drm_atomic_helper_commit,
> +	.mode_valid = lsdc_device_mode_valid,
> +};
> +
> +#ifdef CONFIG_DEBUG_FS
> +static int lsdc_show_clock(struct seq_file *m, void *arg)
> +{
> +	struct drm_info_node *node = (struct drm_info_node *)m->private;
> +	struct drm_device *ddev = node->minor->dev;
> +	struct drm_crtc *crtc;
> +
> +	drm_for_each_crtc(crtc, ddev) {
> +		struct lsdc_display_pipe *pipe;
> +		struct lsdc_pll *pixpll;
> +		const struct lsdc_pixpll_funcs *funcs;
> +		struct lsdc_pll_core_values params;
> +		unsigned int out_khz;
> +		struct drm_display_mode *adj;
> +
> +		pipe = container_of(crtc, struct lsdc_display_pipe, crtc);
> +		if (!pipe->available)
> +			continue;
> +
> +		adj = &crtc->state->adjusted_mode;
> +
> +		pixpll = &pipe->pixpll;
> +		funcs = pixpll->funcs;
> +		out_khz = funcs->get_clock_rate(pixpll, &params);
> +
> +		seq_printf(m, "Display pipe %u: %dx%d\n",
> +			   pipe->index, adj->hdisplay, adj->vdisplay);
> +
> +		seq_printf(m, "Frequency actually output: %u kHz\n", out_khz);
> +		seq_printf(m, "Pixel clock required: %d kHz\n", adj->clock);
> +		seq_printf(m, "diff: %d kHz\n", adj->clock);
> +
> +		seq_printf(m, "div_ref=%u, loopc=%u, div_out=%u\n",
> +			   params.div_ref, params.loopc, params.div_out);
> +
> +		seq_printf(m, "hsync_start=%d, hsync_end=%d, htotal=%d\n",
> +			   adj->hsync_start, adj->hsync_end, adj->htotal);
> +		seq_printf(m, "vsync_start=%d, vsync_end=%d, vtotal=%d\n\n",
> +			   adj->vsync_start, adj->vsync_end, adj->vtotal);
> +	}
> +
> +	return 0;
> +}
> +
> +static int lsdc_show_mm(struct seq_file *m, void *arg)
> +{
> +	struct drm_info_node *node = (struct drm_info_node *)m->private;
> +	struct drm_device *ddev = node->minor->dev;
> +	struct drm_printer p = drm_seq_file_printer(m);
> +
> +	drm_mm_print(&ddev->vma_offset_manager->vm_addr_space_mm, &p);
> +
> +	return 0;
> +}
> +
> +static struct drm_info_list lsdc_debugfs_list[] = {
> +	{ "clocks", lsdc_show_clock, 0 },
> +	{ "mm",     lsdc_show_mm,   0, NULL },
> +};
> +
> +static void lsdc_debugfs_init(struct drm_minor *minor)
> +{
> +	drm_debugfs_create_files(lsdc_debugfs_list,
> +				 ARRAY_SIZE(lsdc_debugfs_list),
> +				 minor->debugfs_root,
> +				 minor);
> +}
> +#endif
> +
> +static struct drm_gem_object *
> +lsdc_drm_gem_create_object(struct drm_device *ddev, size_t size)
> +{
> +	struct drm_gem_cma_object *obj = kzalloc(sizeof(*obj), GFP_KERNEL);
> +
> +	if (!obj)
> +		return ERR_PTR(-ENOMEM);
> +
> +	obj->map_noncoherent = true;
> +
> +	return &obj->base;
> +}
> +
> +static int lsdc_gem_cma_dumb_create(struct drm_file *file,
> +				    struct drm_device *ddev,
> +				    struct drm_mode_create_dumb *args)
> +{
> +	struct lsdc_device *ldev = to_lsdc(ddev);
> +	const struct lsdc_chip_desc *desc = ldev->desc;
> +	unsigned int bytes_per_pixel = (args->bpp + 7) / 8;
> +	unsigned int pitch = bytes_per_pixel * args->width;
> +
> +	/*
> +	 * The dc in ls7a1000/ls2k1000/ls2k0500 require the stride be a
> +	 * multiple of 256 bytes which is for sake of optimize dma data
> +	 * transfer.
> +	 */
> +	args->pitch = roundup(pitch, desc->stride_alignment);
> +
> +	return drm_gem_cma_dumb_create_internal(file, ddev, args);
> +}
> +
> +DEFINE_DRM_GEM_CMA_FOPS(lsdc_drv_fops);
> +
> +static const struct drm_driver lsdc_drm_driver_cma_stub = {
> +	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> +	.lastclose = drm_fb_helper_lastclose,
> +	.fops = &lsdc_drv_fops,
> +	.gem_create_object = lsdc_drm_gem_create_object,
> +
> +	.name = DRIVER_NAME,
> +	.desc = DRIVER_DESC,
> +	.date = DRIVER_DATE,
> +	.major = DRIVER_MAJOR,
> +	.minor = DRIVER_MINOR,
> +	.patchlevel = DRIVER_PATCHLEVEL,
> +
> +	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(lsdc_gem_cma_dumb_create),
> +
> +#ifdef CONFIG_DEBUG_FS
> +	.debugfs_init = lsdc_debugfs_init,
> +#endif
> +};
> +
> +DEFINE_DRM_GEM_FOPS(lsdc_gem_fops);
> +
> +static const struct drm_driver lsdc_vram_driver_stub = {
> +	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
> +	.fops = &lsdc_gem_fops,
> +
> +	.name = DRIVER_NAME,
> +	.desc = DRIVER_DESC,
> +	.date = DRIVER_DATE,
> +	.major = DRIVER_MAJOR,
> +	.minor = DRIVER_MINOR,
> +	.patchlevel = DRIVER_PATCHLEVEL,
> +
> +	DRM_GEM_VRAM_DRIVER,
> +};
> +
> +static int lsdc_modeset_init(struct lsdc_device *ldev, const uint32_t num_crtc)
> +{
> +	struct drm_device *ddev = &ldev->drm;
> +	unsigned int i;
> +	int ret;
> +
> +	/* first, find all available connector, and take a record */
> +	for (i = 0; i < num_crtc; i++) {
> +		struct lsdc_display_pipe *const dispipe = &ldev->disp_pipe[i];
> +		struct lsdc_connector *lconn = lsdc_connector_init(ldev, i);
> +		/* Fail if the connector could not be initialized */
> +		if (IS_ERR(lconn))
> +			return PTR_ERR(lconn);
> +
> +		if (!lconn) {
> +			dispipe->lconn = NULL;
> +			dispipe->available = false;
> +			continue;
> +		}
> +
> +		dispipe->available = true;
> +		dispipe->lconn = lconn;
> +		ldev->num_output++;
> +	}
> +
> +	drm_info(ddev, "number of outputs: %u\n", ldev->num_output);
> +
> +	for (i = 0; i < num_crtc; i++) {
> +		struct lsdc_display_pipe * const dispipe = &ldev->disp_pipe[i];
> +		struct drm_plane * const primary = &dispipe->primary;
> +		struct drm_plane * const cursor = &dispipe->cursor;
> +		struct drm_encoder * const encoder = &dispipe->encoder;
> +		struct drm_crtc * const crtc = &dispipe->crtc;
> +		struct lsdc_pll * const pixpll = &dispipe->pixpll;
> +
> +		dispipe->index = i;
> +
> +		ret = lsdc_pixpll_init(pixpll, ddev, i);
> +		if (ret)
> +			return ret;
> +
> +		ret = lsdc_plane_init(ldev, primary, DRM_PLANE_TYPE_PRIMARY, i);
> +		if (ret)
> +			return ret;
> +
> +		ret = lsdc_plane_init(ldev, cursor, DRM_PLANE_TYPE_CURSOR, i);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * Initial all of the CRTC available, in this way the crtc
> +		 * index is equal to the hardware crtc index. That is:
> +		 * display pipe 0 = crtc0 + dvo0 + encoder0
> +		 * display pipe 1 = crtc1 + dvo1 + encoder1
> +		 */
> +		ret = lsdc_crtc_init(ddev, crtc, i, primary, cursor);
> +		if (ret)
> +			return ret;
> +
> +		if (dispipe->available) {
> +			ret = lsdc_encoder_init(encoder,
> +						&dispipe->lconn->base,
> +						ddev,
> +						i,
> +						ldev->num_output);
> +			if (ret)
> +				return ret;
> +		}
> +
> +		drm_info(ddev, "display pipe %u initialized\n", i);
> +	}
> +
> +	return 0;
> +}
> +
> +static int lsdc_mode_config_init(struct lsdc_device *ldev)
> +{
> +	const struct lsdc_chip_desc * const descp = ldev->desc;
> +	struct drm_device *ddev = &ldev->drm;
> +	int ret;
> +
> +	spin_lock_init(&ldev->reglock);
> +
> +	drm_mode_config_init(ddev);
> +
> +	ddev->mode_config.funcs = &lsdc_mode_config_funcs;
> +	ddev->mode_config.min_width = 1;
> +	ddev->mode_config.min_height = 1;
> +	ddev->mode_config.preferred_depth = 24;
> +	ddev->mode_config.prefer_shadow = ldev->use_vram_helper;
> +
> +	ddev->mode_config.max_width = 4096;
> +	ddev->mode_config.max_height = 4096;
> +
> +	ddev->mode_config.cursor_width = descp->hw_cursor_h;
> +	ddev->mode_config.cursor_height = descp->hw_cursor_h;
> +
> +	if (ldev->vram_base)
> +		ddev->mode_config.fb_base = ldev->vram_base;
> +
> +	ret = lsdc_modeset_init(ldev, descp->num_of_crtc);
> +	if (ret)
> +		goto out_mode_config;
> +
> +	drm_mode_config_reset(ddev);
> +
> +	return 0;
> +
> +out_mode_config:
> +	drm_mode_config_cleanup(ddev);
> +
> +	return ret;
> +}
> +
> +static void lsdc_mode_config_fini(struct drm_device *ddev)
> +{
> +	struct lsdc_device *ldev = to_lsdc(ddev);
> +
> +	drm_kms_helper_poll_fini(ddev);
> +
> +	drm_dev_unregister(ddev);
> +
> +	devm_free_irq(ddev->dev, ldev->irq, ddev);
> +
> +	drm_atomic_helper_shutdown(ddev);
> +
> +	drm_mode_config_cleanup(ddev);
> +}
> +
> +/*
> + * lsdc_determine_chip - a function to tell different chips apart.
> + */
> +static const struct lsdc_chip_desc *
> +lsdc_determine_chip(struct pci_dev *pdev, int *has)
> +{
> +	static const struct lsdc_match {
> +		char name[128];
> +		const void *data;
> +	} compat[] = {
> +		{ .name = "loongson,ls7a1000-dc", .data = &dc_in_ls7a1000 },
> +		{ .name = "loongson,ls2k1000-dc", .data = &dc_in_ls2k1000 },
> +		{ .name = "loongson,ls2k0500-dc", .data = &dc_in_ls2k0500 },
> +		{ .name = "loongson,loongson64c-4core-ls7a", .data = &dc_in_ls7a1000 },
> +		{ .name = "loongson,loongson64g-4core-ls7a", .data = &dc_in_ls7a1000 },
> +		{ .name = "loongson,loongson64-2core-2k1000", .data = &dc_in_ls2k1000 },
> +		{ .name = "loongson,loongson2k1000", .data = &dc_in_ls2k1000 },
> +		{ /* sentinel */ },
> +	};
> +
> +	struct device_node *np;
> +	unsigned int i;
> +
> +	/* Deduce DC variant information from the DC device node */
> +	for (i = 0; i < ARRAY_SIZE(compat); ++i) {
> +		np = of_find_compatible_node(NULL, NULL, compat[i].name);
> +		if (!np)
> +			continue;
> +
> +		of_node_put(np);
> +
> +		return compat[i].data;
> +	}
> +
> +	return NULL;
> +}
> +
> +static int lsdc_drm_suspend(struct device *dev)
> +{
> +	struct drm_device *ddev = dev_get_drvdata(dev);
> +
> +	return drm_mode_config_helper_suspend(ddev);
> +}
> +
> +static int lsdc_drm_resume(struct device *dev)
> +{
> +	struct drm_device *ddev = dev_get_drvdata(dev);
> +
> +	return drm_mode_config_helper_resume(ddev);
> +}
> +
> +static int lsdc_pm_freeze(struct device *dev)
> +{
> +	return lsdc_drm_suspend(dev);
> +}
> +
> +static int lsdc_pm_thaw(struct device *dev)
> +{
> +	return lsdc_drm_resume(dev);
> +}
> +
> +static int lsdc_pm_suspend(struct device *dev)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	int error;
> +
> +	error = lsdc_pm_freeze(dev);
> +	if (error)
> +		return error;
> +
> +	pci_save_state(pdev);
> +	/* Shut down the device */
> +	pci_disable_device(pdev);
> +	pci_set_power_state(pdev, PCI_D3hot);
> +
> +	return 0;
> +}
> +
> +static int lsdc_pm_resume(struct device *dev)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +
> +	if (pcim_enable_device(pdev))
> +		return -EIO;
> +
> +	pci_set_power_state(pdev, PCI_D0);
> +
> +	pci_restore_state(pdev);
> +
> +	return lsdc_pm_thaw(dev);
> +}
> +
> +static const struct dev_pm_ops lsdc_pm_ops = {
> +	.suspend = lsdc_pm_suspend,
> +	.resume = lsdc_pm_resume,
> +	.freeze = lsdc_pm_freeze,
> +	.thaw = lsdc_pm_thaw,
> +	.poweroff = lsdc_pm_freeze,
> +	.restore = lsdc_pm_resume,
> +};
> +
> +static int lsdc_remove_conflicting_framebuffers(const struct drm_driver *drv)
> +{
> +	/* lsdc is a pci device, but it don't have a dedicate vram bar because
> +	 * of historic reason. The display controller is ported from Loongson
> +	 * 2H series SoC which date back to 2012.
> +	 * And simplefb node may have been located anywhere in memory.
> +	 */
> +	return drm_aperture_remove_conflicting_framebuffers(0, ~0, false, drv);
> +}
> +
> +static int lsdc_vram_init(struct lsdc_device *ldev)
> +{
> +	struct drm_device *ddev = &ldev->drm;
> +	struct pci_dev *gpu;
> +	resource_size_t base, size;
> +	int ret;
> +
> +	/* BAR 2 of LS7A1000's GPU contain VRAM, It's GC1000 */
> +	gpu = pci_get_device(PCI_VENDOR_ID_LOONGSON, 0x7a15, NULL);
> +	base = pci_resource_start(gpu, 2);
> +	size =  pci_resource_len(gpu, 2);
> +
> +	drm_info(ddev, "vram start: 0x%llx, size: %uMB\n", (u64)base, (u32)(size >> 20));
> +
> +	if (!request_mem_region(base, size, "lsdc_vram")) {
> +		drm_err(ddev, "can't reserve VRAM memory region\n");
> +		return -ENXIO;
> +	}
> +
> +	ret = drmm_vram_helper_init(ddev, base, size);
> +	if (ret) {
> +		drm_err(ddev, "can't init vram helper\n");
> +		return ret;
> +	}
> +
> +	ldev->vram_base = base;
> +	ldev->vram_size = size;
> +
> +	return 0;
> +}
> +
> +static int lsdc_pci_probe(struct pci_dev *pdev, const struct pci_device_id * const ent)
> +{
> +	const struct drm_driver *driver = &lsdc_drm_driver_cma_stub;
> +	int has_dedicated_vram = 0;
> +	struct lsdc_device *ldev;
> +	struct drm_device *ddev;
> +	const struct lsdc_chip_desc *descp;
> +	int ret;
> +
> +	descp = lsdc_determine_chip(pdev, &has_dedicated_vram);
> +	if (!descp) {
> +		dev_err(&pdev->dev, "unknown dc ip core, abort\n");
> +		return -ENOENT;
> +	}
> +
> +	lsdc_remove_conflicting_framebuffers(driver);
> +
> +	ret = pcim_enable_device(pdev);
> +	if (ret)
> +		return ret;
> +
> +	pci_set_master(pdev);
> +
> +	/* Get the optional framebuffer memory resource */
> +	ret = of_reserved_mem_device_init(&pdev->dev);
> +	if (ret && (ret != -ENODEV))
> +		return ret;
> +
> +	if (lsdc_use_vram_helper > 0) {
> +		driver = &lsdc_vram_driver_stub;
> +	} else if ((lsdc_use_vram_helper < 0) && descp->has_vram) {
> +		lsdc_use_vram_helper = 1;
> +		driver = &lsdc_vram_driver_stub;
> +	} else {
> +		driver = &lsdc_drm_driver_cma_stub;
> +	}
> +
> +	ldev = devm_drm_dev_alloc(&pdev->dev, driver, struct lsdc_device, drm);
> +	if (IS_ERR(ldev))
> +		return PTR_ERR(ldev);
> +
> +	ldev->use_vram_helper = lsdc_use_vram_helper;
> +	ldev->desc = descp;
> +
> +	/* BAR 0 contains registers */
> +	ldev->reg_base = devm_ioremap_resource(&pdev->dev, &pdev->resource[0]);
> +	if (IS_ERR(ldev->reg_base))
> +		return PTR_ERR(ldev->reg_base);
> +
> +	if (descp->has_vram && ldev->use_vram_helper)
> +		lsdc_vram_init(ldev);
> +
> +	ddev = &ldev->drm;
> +	pci_set_drvdata(pdev, ddev);
> +
> +	ret = lsdc_mode_config_init(ldev);
> +	if (ret)
> +		goto err_out;
> +
> +	ldev->irq = pdev->irq;
> +
> +	drm_info(&ldev->drm, "irq = %d\n", ldev->irq);
> +
> +	ret = devm_request_threaded_irq(&pdev->dev, pdev->irq,
> +					lsdc_irq_handler_cb,
> +					lsdc_irq_thread_cb,
> +					IRQF_ONESHOT,
> +					dev_name(&pdev->dev),
> +					ddev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to register lsdc interrupt\n");
> +		goto err_out;
> +	}
> +
> +	ret = drm_vblank_init(ddev, ldev->desc->num_of_crtc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Fatal error during vblank init: %d\n", ret);
> +		goto err_out;
> +	}
> +
> +	drm_kms_helper_poll_init(ddev);
> +
> +	ret = drm_dev_register(ddev, 0);
> +	if (ret)
> +		goto err_out;
> +
> +	drm_fbdev_generic_setup(ddev, 32);
> +
> +	return 0;
> +
> +err_out:
> +	drm_dev_put(ddev);
> +
> +	return ret;
> +}
> +
> +static void lsdc_pci_remove(struct pci_dev *pdev)
> +{
> +	struct drm_device *ddev = pci_get_drvdata(pdev);
> +
> +	lsdc_mode_config_fini(ddev);
> +
> +	drm_dev_put(ddev);
> +
> +	pci_clear_master(pdev);
> +
> +	pci_release_regions(pdev);
> +}
> +
> +static const struct pci_device_id lsdc_pciid_list[] = {
> +	{PCI_VENDOR_ID_LOONGSON, 0x7a06, PCI_ANY_ID, PCI_ANY_ID, 0, 0, 0},
> +	{0, 0, 0, 0, 0, 0, 0}
> +};
> +
> +static struct pci_driver lsdc_pci_driver = {
> +	.name = DRIVER_NAME,
> +	.id_table = lsdc_pciid_list,
> +	.probe = lsdc_pci_probe,
> +	.remove = lsdc_pci_remove,
> +	.driver.pm = &lsdc_pm_ops,
> +};
> +
> +static int __init lsdc_drm_init(void)
> +{
> +	struct pci_dev *pdev = NULL;
> +
> +	if (drm_firmware_drivers_only())
> +		return -EINVAL;
> +
> +	while ((pdev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, pdev))) {
> +		/*
> +		 * Multiple video card workaround
> +		 *
> +		 * This integrated video card will always be selected as
> +		 * default boot device by vgaarb subsystem.
> +		 */
> +		if (pdev->vendor != PCI_VENDOR_ID_LOONGSON) {
> +			pr_info("Discrete graphic card detected, abort\n");
> +			return 0;
> +		}
> +	}
> +
> +	return pci_register_driver(&lsdc_pci_driver);
> +}
> +module_init(lsdc_drm_init);
> +
> +static void __exit lsdc_drm_exit(void)
> +{
> +	pci_unregister_driver(&lsdc_pci_driver);
> +}
> +module_exit(lsdc_drm_exit);
> +
> +MODULE_DEVICE_TABLE(pci, lsdc_pciid_list);
> +MODULE_AUTHOR(DRIVER_AUTHOR);
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/gpu/drm/lsdc/lsdc_drv.h b/drivers/gpu/drm/lsdc/lsdc_drv.h
> new file mode 100644
> index 000000000000..6382283c5e7e
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_drv.h
> @@ -0,0 +1,205 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * KMS driver for Loongson display controller
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#ifndef __LSDC_DRV_H__
> +#define __LSDC_DRV_H__
> +
> +#include <drm/drm_print.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_crtc.h>
> +#include <drm/drm_plane.h>
> +#include <drm/drm_encoder.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_atomic.h>
> +
> +#include "lsdc_regs.h"
> +#include "lsdc_pll.h"
> +
> +#define LSDC_NUM_CRTC           2
> +
> +/* There is only a 1:1 mapping of encoders and connectors for lsdc,
> + * Each CRTC have two FB address registers.
> + *
> + * The display controller in LS2K1000/LS2K0500.
> + *       ___________________                                     _________
> + *      |            -------|                                   |         |
> + *      |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
> + *      |  _   _     -------|        ^              ^           |_________|
> + *      | | | | |           |        |              |
> + *      | |_| |_|           |     +------+          |
> + *      |                   <---->| i2c0 |<---------+
> + *      |          LSDC     |     +------+
> + *      |  _   _            |     +------+
> + *      | | | | |           <---->| i2c1 |----------+
> + *      | |_| |_|           |     +------+          |            _________
> + *      |            -------|        |              |           |         |
> + *      |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
> + *      |            -------|                                   |_________|
> + *      |___________________|
> + *
> + *
> + * The display controller in LS7A1000.
> + *       ___________________                                     _________
> + *      |            -------|                                   |         |
> + *      |  CRTC0 --> | DVO0 ----> Encoder0 ---> Connector0 ---> | Monitor |
> + *      |  _   _     -------|        ^             ^            |_________|
> + *      | | | | |    -------|        |             |
> + *      | |_| |_|    | i2c0 <--------+-------------+
> + *      |            -------|
> + *      |  _   _     -------|
> + *      | | | | |    | i2c1 <--------+-------------+
> + *      | |_| |_|    -------|        |             |             _________
> + *      |            -------|        |             |            |         |
> + *      |  CRTC1 --> | DVO1 ----> Encoder1 ---> Connector1 ---> |  Panel  |
> + *      |            -------|                                   |_________|
> + *      |___________________|
> + */
> +
> +enum loongson_dc_family {
> +	LSDC_CHIP_UNKNOWN = 0,
> +	LSDC_CHIP_2K1000 = 1,  /* 2-Core Mips64r2 SoC, 64-bit */
> +	LSDC_CHIP_7A1000 = 2,  /* North bridge of LS3A3000/LS3A4000/LS3A5000 */
> +	LSDC_CHIP_2K0500 = 3,  /* Reduced version of LS2K1000, single core */
> +	LSDC_CHIP_LAST,
> +};
> +
> +enum lsdc_pixel_format {
> +	LSDC_PF_NONE = 0,
> +	LSDC_PF_ARGB4444 = 1,  /* ARGB A:4 bits R/G/B: 4 bits each [16 bits] */
> +	LSDC_PF_ARGB1555 = 2,  /* ARGB A:1 bit RGB:15 bits [16 bits] */
> +	LSDC_PF_RGB565 = 3,    /* RGB [16 bits] */
> +	LSDC_PF_XRGB8888 = 4,  /* XRGB [32 bits] */
> +};
> +
> +struct lsdc_chip_desc {
> +	enum loongson_dc_family chip;
> +	u32 num_of_crtc;
> +	u32 max_pixel_clk;
> +	u32 max_width;
> +	u32 max_height;
> +	u32 num_of_hw_cursor;
> +	u32 hw_cursor_w;
> +	u32 hw_cursor_h;
> +	u32 stride_alignment;
> +	bool have_builtin_i2c;
> +	bool has_vram;
> +};
> +
> +/*
> + * struct lsdc_display_pipe - Abstraction of hardware display pipeline.
> + * @crtc: CRTC control structure
> + * @plane: Plane control structure
> + * @encoder: Encoder control structure
> + * @pixpll: Pll control structure
> + * @connector: point to connector control structure this display pipe bind
> + * @index: the index corresponding to the hardware display pipe
> + * @available: is this display pipe is available on the motherboard, The
> + *  downstream mother board manufacturer may use only one of them.
> + *  For example, LEMOTE LX-6901 board just has only one VGA output.
> + *
> + * Display pipeline with plane, crtc, encoder, PLL collapsed into one entity.
> + */
> +struct lsdc_display_pipe {
> +	struct drm_crtc crtc;
> +	struct drm_plane primary;
> +	struct drm_plane cursor;
> +	struct drm_encoder encoder;
> +	struct lsdc_pll pixpll;
> +	struct lsdc_connector *lconn;
> +
> +	int index;
> +	bool available;
> +};
> +
> +struct lsdc_crtc_state {
> +	struct drm_crtc_state base;
> +	struct lsdc_pll_core_values pparams;
> +};
> +
> +struct lsdc_device {
> +	struct drm_device drm;
> +
> +	/* LS7A1000 has a dediacted video RAM, typically 64 MB or more */
> +	void __iomem *reg_base;
> +	void __iomem *vram;
> +	resource_size_t vram_base;
> +	resource_size_t vram_size;
> +
> +	struct lsdc_display_pipe disp_pipe[LSDC_NUM_CRTC];
> +
> +	/*
> +	 * @num_output: count the number of active display pipe.
> +	 */
> +	unsigned int num_output;
> +
> +	/* @desc: device dependent data and feature descriptions */
> +	const struct lsdc_chip_desc *desc;
> +
> +	/* @reglock: protects concurrent register access */
> +	spinlock_t reglock;
> +
> +	/*
> +	 * @use_vram_helper: using vram helper base solution instead of
> +	 * CMA helper based solution. The DC scanout from the VRAM is
> +	 * proved to be more reliable, but graphic application is may
> +	 * become slow when using this driver mode.
> +	 */
> +	bool use_vram_helper;
> +
> +	int irq;
> +	u32 irq_status;
> +};
> +
> +#define to_lsdc(x) container_of(x, struct lsdc_device, drm)
> +
> +static inline struct lsdc_crtc_state *
> +to_lsdc_crtc_state(struct drm_crtc_state *base)
> +{
> +	return container_of(base, struct lsdc_crtc_state, base);
> +}
> +
> +static inline u32 lsdc_reg_read32(struct lsdc_device * const ldev, u32 offset)
> +{
> +	u32 val;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ldev->reglock, flags);
> +	val = readl(ldev->reg_base + offset);
> +	spin_unlock_irqrestore(&ldev->reglock, flags);
> +
> +	return val;
> +}
> +
> +static inline void
> +lsdc_reg_write32(struct lsdc_device * const ldev, u32 offset, u32 val)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ldev->reglock, flags);
> +	writel(val, ldev->reg_base + offset);
> +	spin_unlock_irqrestore(&ldev->reglock, flags);
> +}

I'm not sure what you try to protect against, but only protecting a
single read or a single write won't really help.

Assuming you have two concurrent, typical, read-modify-write, you'll
have given back the lock during the modification, so you end up with
exactly the same issue than without the lock.

> +int lsdc_crtc_init(struct drm_device *ddev,
> +		   struct drm_crtc *crtc,
> +		   unsigned int index,
> +		   struct drm_plane *primary,
> +		   struct drm_plane *cursor);
> +
> +int lsdc_plane_init(struct lsdc_device *ldev, struct drm_plane *plane,
> +		    enum drm_plane_type type, unsigned int index);
> +
> +int lsdc_encoder_init(struct drm_encoder * const encoder,
> +		      struct drm_connector *connector,
> +		      struct drm_device *ddev,
> +		      unsigned int index,
> +		      unsigned int total);
> +
> +#endif
> diff --git a/drivers/gpu/drm/lsdc/lsdc_encoder.c b/drivers/gpu/drm/lsdc/lsdc_encoder.c
> new file mode 100644
> index 000000000000..8130d4baee78
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_encoder.c
> @@ -0,0 +1,51 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KMS driver for Loongson display controller
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#include "lsdc_drv.h"
> +
> +static const struct drm_encoder_funcs lsdc_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
> +int lsdc_encoder_init(struct drm_encoder * const encoder,
> +		      struct drm_connector *connector,
> +		      struct drm_device *ddev,
> +		      unsigned int index,
> +		      unsigned int total)
> +{
> +	int ret;
> +	int type;
> +
> +	encoder->possible_crtcs = BIT(index);
> +
> +	if (total == 2)
> +		encoder->possible_clones = BIT(1) | BIT(0);
> +	else if (total < 2)
> +		encoder->possible_clones = 0;
> +
> +	if (connector->connector_type == DRM_MODE_CONNECTOR_VGA)
> +		type = DRM_MODE_ENCODER_DAC;
> +	else if ((connector->connector_type == DRM_MODE_CONNECTOR_HDMIA) ||
> +		 (connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) ||
> +		 (connector->connector_type == DRM_MODE_CONNECTOR_DVID))
> +		type = DRM_MODE_ENCODER_TMDS;
> +	else if (connector->connector_type == DRM_MODE_CONNECTOR_DPI)
> +		type = DRM_MODE_ENCODER_DPI;
> +	else if (connector->connector_type == DRM_MODE_CONNECTOR_VIRTUAL)
> +		type = DRM_MODE_ENCODER_VIRTUAL;
> +	else
> +		type = DRM_MODE_ENCODER_NONE;
> +
> +	ret = drm_encoder_init(ddev, encoder, &lsdc_encoder_funcs, type, "encoder%d", index);
> +	if (ret)
> +		return ret;
> +
> +	return drm_connector_attach_encoder(connector, encoder);
> +}
> diff --git a/drivers/gpu/drm/lsdc/lsdc_i2c.c b/drivers/gpu/drm/lsdc/lsdc_i2c.c
> new file mode 100644
> index 000000000000..35e30bf3829a
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_i2c.c
> @@ -0,0 +1,195 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KMS driver for Loongson display controller
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#include <linux/string.h>
> +#include <linux/i2c.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_regs.h"
> +#include "lsdc_i2c.h"
> +
> +/*
> + * ls7a_gpio_i2c_set - set the state of a gpio pin indicated by mask
> + * @mask: gpio pin mask
> + */
> +static void ls7a_gpio_i2c_set(struct lsdc_i2c * const i2c, int mask, int state)
> +{
> +	struct lsdc_device *ldev = to_lsdc(i2c->ddev);
> +	u8 val;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ldev->reglock, flags);
> +
> +	if (state) {
> +		val = readb(i2c->dir_reg);
> +		val |= mask;
> +		writeb(val, i2c->dir_reg);
> +	} else {
> +		val = readb(i2c->dir_reg);
> +		val &= ~mask;
> +		writeb(val, i2c->dir_reg);
> +
> +		val = readb(i2c->dat_reg);
> +		if (state)
> +			val |= mask;
> +		else
> +			val &= ~mask;
> +		writeb(val, i2c->dat_reg);
> +	}
> +
> +	spin_unlock_irqrestore(&ldev->reglock, flags);
> +}
> +
> +/*
> + * ls7a_gpio_i2c_get - read value back from gpio pin
> + * @mask: gpio pin mask
> + */
> +static int ls7a_gpio_i2c_get(struct lsdc_i2c * const i2c, int mask)
> +{
> +	struct lsdc_device *ldev = to_lsdc(i2c->ddev);
> +	u8 val;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&ldev->reglock, flags);
> +
> +	/* first set this pin as input */
> +	val = readb(i2c->dir_reg);
> +	val |= mask;
> +	writeb(val, i2c->dir_reg);
> +
> +	/* then get level state from this pin */
> +	val = readb(i2c->dat_reg);
> +
> +	spin_unlock_irqrestore(&ldev->reglock, flags);
> +
> +	return (val & mask) ? 1 : 0;
> +}
> +
> +/* set the state on the i2c->sda pin */
> +static void ls7a_i2c_set_sda(void *i2c, int state)
> +{
> +	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
> +
> +	return ls7a_gpio_i2c_set(li2c, li2c->sda, state);
> +}
> +
> +/* set the state on the i2c->scl pin */
> +static void ls7a_i2c_set_scl(void *i2c, int state)
> +{
> +	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
> +
> +	return ls7a_gpio_i2c_set(li2c, li2c->scl, state);
> +}
> +
> +/* read the value from the i2c->sda pin */
> +static int ls7a_i2c_get_sda(void *i2c)
> +{
> +	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
> +
> +	return ls7a_gpio_i2c_get(li2c, li2c->sda);
> +}
> +
> +/* read the value from the i2c->scl pin */
> +static int ls7a_i2c_get_scl(void *i2c)
> +{
> +	struct lsdc_i2c * const li2c = (struct lsdc_i2c *)i2c;
> +
> +	return ls7a_gpio_i2c_get(li2c, li2c->scl);
> +}
> +
> +/*
> + * Get i2c id from connector id
> + *
> + * TODO: get it from dtb
> + */
> +static int lsdc_get_i2c_id(struct drm_device *ddev, unsigned int index)
> +{
> +	return index;
> +}
> +
> +/*
> + * mainly for dc in ls7a1000 which have builtin gpio emulated i2c
> + *
> + * @index : output channel index, 0 for DVO0, 1 for DVO1
> + */
> +struct i2c_adapter *lsdc_create_i2c_chan(struct drm_device *ddev,
> +					 unsigned int index)
> +{
> +	struct lsdc_device *ldev = to_lsdc(ddev);
> +	struct i2c_adapter *adapter;
> +	struct lsdc_i2c *li2c;
> +	int ret;
> +
> +	li2c = devm_kzalloc(ddev->dev, sizeof(*li2c), GFP_KERNEL);
> +	if (!li2c)
> +		return ERR_PTR(-ENOMEM);
> +
> +	li2c->ddev = ddev;
> +
> +	if (index == 0) {
> +		li2c->sda = 0x01;
> +		li2c->scl = 0x02;
> +	} else if (index == 1) {
> +		li2c->sda = 0x04;
> +		li2c->scl = 0x08;
> +	}
> +
> +	li2c->dir_reg = ldev->reg_base + LS7A_DC_GPIO_DIR_REG;
> +	li2c->dat_reg = ldev->reg_base + LS7A_DC_GPIO_DAT_REG;
> +
> +	li2c->bit.setsda = ls7a_i2c_set_sda;
> +	li2c->bit.setscl = ls7a_i2c_set_scl;
> +	li2c->bit.getsda = ls7a_i2c_get_sda;
> +	li2c->bit.getscl = ls7a_i2c_get_scl;
> +	li2c->bit.udelay = 5;
> +	li2c->bit.timeout = usecs_to_jiffies(2200);
> +	li2c->bit.data = li2c;
> +
> +	adapter = &li2c->adapter;
> +
> +	adapter->algo_data = &li2c->bit;
> +	adapter->owner = THIS_MODULE;
> +	adapter->class = I2C_CLASS_DDC;
> +	adapter->dev.parent = ddev->dev;
> +	adapter->nr = -1;
> +
> +	snprintf(adapter->name, sizeof(adapter->name), "%s-%d", "lsdc_gpio_i2c", index);
> +
> +	i2c_set_adapdata(adapter, li2c);
> +
> +	ret = i2c_bit_add_numbered_bus(adapter);
> +	if (ret) {
> +		devm_kfree(ddev->dev, li2c);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return adapter;
> +}
> +
> +/*
> + * lsdc_get_i2c_adapter - get a i2c adapter from i2c susystem.
> + *
> + * @index : output channel index, 0 for DVO0, 1 for DVO1
> + */
> +struct i2c_adapter *lsdc_get_i2c_adapter(struct drm_device *ddev,
> +					 unsigned int index)
> +{
> +	unsigned int i2c_id;
> +
> +	/* find mapping between i2c id and connector id */
> +	i2c_id = lsdc_get_i2c_id(ddev, index);
> +
> +	return i2c_get_adapter(i2c_id);
> +}
> +
> +void lsdc_destroy_i2c(struct drm_device *ddev, struct i2c_adapter *adapter)
> +{
> +	i2c_put_adapter(adapter);
> +}
> diff --git a/drivers/gpu/drm/lsdc/lsdc_i2c.h b/drivers/gpu/drm/lsdc/lsdc_i2c.h
> new file mode 100644
> index 000000000000..69d0b8f571d3
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_i2c.h
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * KMS driver for Loongson display controller
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#ifndef __LSDC_I2C__
> +#define __LSDC_I2C__
> +
> +#include <linux/i2c.h>
> +#include <linux/i2c-algo-bit.h>
> +
> +struct lsdc_i2c {
> +	struct drm_device *ddev;
> +	struct i2c_adapter adapter;
> +	struct i2c_algo_bit_data bit;
> +	/* pin bit mask */
> +	u8 sda;
> +	u8 scl;
> +
> +	void __iomem *dir_reg;
> +	void __iomem *dat_reg;
> +};
> +
> +void lsdc_destroy_i2c(struct drm_device *ddev, struct i2c_adapter *i2c);
> +
> +struct i2c_adapter *lsdc_create_i2c_chan(struct drm_device *ddev,
> +					 unsigned int con_id);
> +
> +struct i2c_adapter *lsdc_get_i2c_adapter(struct drm_device *ddev,
> +					 unsigned int con_id);
> +
> +#endif
> diff --git a/drivers/gpu/drm/lsdc/lsdc_irq.c b/drivers/gpu/drm/lsdc/lsdc_irq.c
> new file mode 100644
> index 000000000000..1588b7bd444f
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_irq.c
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KMS driver for Loongson display controller
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#include <drm/drm_vblank.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_regs.h"
> +#include "lsdc_irq.h"
> +
> +/* Function to be called in a threaded interrupt context. */
> +irqreturn_t lsdc_irq_thread_cb(int irq, void *arg)
> +{
> +	struct drm_device *ddev = arg;
> +	struct lsdc_device *ldev = to_lsdc(ddev);
> +	struct drm_crtc *crtc;
> +
> +	/* trigger the vblank event */
> +	if (ldev->irq_status & INT_CRTC0_VS) {
> +		crtc = drm_crtc_from_index(ddev, 0);
> +		drm_crtc_handle_vblank(crtc);
> +	}
> +
> +	if (ldev->irq_status & INT_CRTC1_VS) {
> +		crtc = drm_crtc_from_index(ddev, 1);
> +		drm_crtc_handle_vblank(crtc);
> +	}
> +
> +	lsdc_reg_write32(ldev, LSDC_INT_REG, INT_CRTC0_VS_EN | INT_CRTC1_VS_EN);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +/* Function to be called when the IRQ occurs */
> +irqreturn_t lsdc_irq_handler_cb(int irq, void *arg)
> +{
> +	struct drm_device *ddev = arg;
> +	struct lsdc_device *ldev = to_lsdc(ddev);
> +
> +	/* Read & Clear the interrupt status */
> +	ldev->irq_status = lsdc_reg_read32(ldev, LSDC_INT_REG);
> +	if ((ldev->irq_status & INT_STATUS_MASK) == 0) {
> +		drm_warn(ddev, "no interrupt occurs\n");
> +		return IRQ_NONE;
> +	}
> +
> +	/* clear all interrupt */
> +	lsdc_reg_write32(ldev, LSDC_INT_REG, ldev->irq_status);
> +
> +	return IRQ_WAKE_THREAD;
> +}
> diff --git a/drivers/gpu/drm/lsdc/lsdc_irq.h b/drivers/gpu/drm/lsdc/lsdc_irq.h
> new file mode 100644
> index 000000000000..3a9eab02823c
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_irq.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * KMS driver for Loongson display controller
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#ifndef __LSDC_IRQ_H__
> +#define __LSDC_IRQ_H__
> +
> +irqreturn_t lsdc_irq_thread_cb(int irq, void *arg);
> +irqreturn_t lsdc_irq_handler_cb(int irq, void *arg);
> +
> +#endif
> diff --git a/drivers/gpu/drm/lsdc/lsdc_plane.c b/drivers/gpu/drm/lsdc/lsdc_plane.c
> new file mode 100644
> index 000000000000..e44910364934
> --- /dev/null
> +++ b/drivers/gpu/drm/lsdc/lsdc_plane.c
> @@ -0,0 +1,517 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KMS driver for Loongson display controller
> + */
> +
> +/*
> + * Authors:
> + *      Sui Jingfeng <suijingfeng@loongson.cn>
> + */
> +
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_vblank.h>
> +#include <drm/drm_format_helper.h>
> +#include <drm/drm_plane_helper.h>
> +#include <drm/drm_fb_cma_helper.h>
> +#include <drm/drm_gem_cma_helper.h>
> +#include <drm/drm_gem_vram_helper.h>
> +#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_gem_atomic_helper.h>
> +#include <drm/drm_damage_helper.h>
> +
> +#include "lsdc_drv.h"
> +#include "lsdc_regs.h"
> +#include "lsdc_pll.h"
> +
> +static const u32 lsdc_primary_formats[] = {
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +};
> +
> +static const u32 lsdc_cursor_formats[] = {
> +	DRM_FORMAT_ARGB8888,
> +};
> +
> +static const u64 lsdc_fb_format_modifiers[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	DRM_FORMAT_MOD_INVALID
> +};
> +
> +static void lsdc_update_fb_format(struct lsdc_device *ldev,
> +				  struct drm_crtc *crtc,
> +				  const struct drm_format_info *fmt_info)
> +{
> +	unsigned int index = drm_crtc_index(crtc);
> +	u32 val = 0;
> +	u32 fmt;
> +
> +	switch (fmt_info->format) {
> +	case DRM_FORMAT_RGB565:
> +		fmt = LSDC_PF_RGB565;
> +		break;
> +	case DRM_FORMAT_XRGB8888:
> +		fmt = LSDC_PF_XRGB8888;
> +		break;
> +	case DRM_FORMAT_ARGB8888:
> +		fmt = LSDC_PF_XRGB8888;
> +		break;
> +	default:
> +		fmt = LSDC_PF_XRGB8888;
> +		break;
> +	}
> +
> +	if (index == 0) {
> +		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
> +		val = (val & ~CFG_PIX_FMT_MASK) | fmt;
> +		lsdc_reg_write32(ldev, LSDC_CRTC0_CFG_REG, val);
> +	} else if (index == 1) {
> +		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
> +		val = (val & ~CFG_PIX_FMT_MASK) | fmt;
> +		lsdc_reg_write32(ldev, LSDC_CRTC1_CFG_REG, val);
> +	}
> +}
> +
> +static void lsdc_update_fb_start_addr(struct lsdc_device *ldev,
> +				      struct drm_crtc *crtc,
> +				      u64 paddr)
> +{
> +	unsigned int index = drm_crtc_index(crtc);
> +	u32 addr_reg;
> +	u32 cfg_reg;
> +	u32 val;
> +
> +	/*
> +	 * Find which framebuffer address register should update.
> +	 * if FB_ADDR0_REG is in using, we write the addr to FB_ADDR1_REG,
> +	 * if FB_ADDR1_REG is in using, we write the addr to FB_ADDR0_REG
> +	 */
> +	if (index == 0) {
> +		/* CRTC0 */
> +		val = lsdc_reg_read32(ldev, LSDC_CRTC0_CFG_REG);
> +
> +		cfg_reg = LSDC_CRTC0_CFG_REG;
> +
> +		if (val & CFG_FB_IDX_BIT) {
> +			addr_reg = LSDC_CRTC0_FB_ADDR0_REG;
> +			drm_dbg(&ldev->drm, "CRTC0 FB0 will be use\n");
> +		} else {
> +			addr_reg = LSDC_CRTC0_FB_ADDR1_REG;
> +			drm_dbg(&ldev->drm, "CRTC0 FB1 will be use\n");
> +		}
> +	} else if (index == 1) {
> +		/* CRTC1 */
> +		val = lsdc_reg_read32(ldev, LSDC_CRTC1_CFG_REG);
> +
> +		cfg_reg = LSDC_CRTC1_CFG_REG;
> +
> +		if (val & CFG_FB_IDX_BIT) {
> +			addr_reg = LSDC_CRTC1_FB_ADDR0_REG;
> +			drm_dbg(&ldev->drm, "CRTC1 FB0 will be use\n");
> +		} else {
> +			addr_reg = LSDC_CRTC1_FB_ADDR1_REG;
> +			drm_dbg(&ldev->drm, "CRTC1 FB1 will be use\n");
> +		}
> +	}
> +
> +	lsdc_reg_write32(ldev, addr_reg, paddr);
> +
> +	/*
> +	 * Then, we triger the fb switch, the switch of the framebuffer
> +	 * to be scanout will complete at the next vblank.
> +	 */
> +	lsdc_reg_write32(ldev, cfg_reg, val | CFG_PAGE_FLIP_BIT);
> +
> +	drm_dbg(&ldev->drm, "crtc%u scantout from 0x%llx\n", index, paddr);
> +}
> +
> +static unsigned int lsdc_get_fb_offset(struct drm_framebuffer *fb,
> +				       struct drm_plane_state *state,
> +				       unsigned int plane)
> +{
> +	unsigned int offset = fb->offsets[plane];
> +
> +	offset += fb->format->cpp[plane] * (state->src_x >> 16);
> +	offset += fb->pitches[plane] * (state->src_y >> 16);
> +
> +	return offset;
> +}
> +
> +static s64 lsdc_get_vram_bo_offset(struct drm_framebuffer *fb)
> +{
> +	struct drm_gem_vram_object *gbo;
> +	s64 gpu_addr;
> +
> +	gbo = drm_gem_vram_of_gem(fb->obj[0]);
> +	gpu_addr = drm_gem_vram_offset(gbo);
> +
> +	return gpu_addr;
> +}
> +
> +static int lsdc_pixpll_atomic_check(struct drm_crtc *crtc,
> +				    struct drm_crtc_state *state)
> +{
> +	struct lsdc_display_pipe *dispipe = container_of(crtc, struct lsdc_display_pipe, crtc);
> +	struct lsdc_pll *pixpll = &dispipe->pixpll;
> +	const struct lsdc_pixpll_funcs *pfuncs = pixpll->funcs;
> +	struct lsdc_crtc_state *priv_state = to_lsdc_crtc_state(state);
> +	bool ret = pfuncs->compute(pixpll, state->mode.clock, &priv_state->pparams);
> +
> +	if (ret)
> +		return 0;
> +
> +	drm_warn(crtc->dev, "failed find PLL parameters for %u\n", state->mode.clock);
> +
> +	return -EINVAL;
> +}

This should be in your CRTC atomic_check hook, not called by your plane
code.

> +static int lsdc_primary_plane_atomic_check(struct drm_plane *plane,
> +					   struct drm_atomic_state *state)
> +{
> +	struct drm_plane_state *old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +	struct drm_framebuffer *new_fb = new_plane_state->fb;
> +	struct drm_framebuffer *old_fb = old_plane_state->fb;
> +	struct drm_crtc *crtc = new_plane_state->crtc;
> +	u32 new_format = new_fb->format->format;
> +	struct drm_crtc_state *new_crtc_state;
> +	int ret;
> +
> +	if (!crtc)
> +		return 0;
> +
> +	new_crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
> +	if (WARN_ON(!new_crtc_state))
> +		return -EINVAL;
> +
> +	/*
> +	 * Require full modeset if enabling or disabling a plane,
> +	 * or changing its position, size, depth or format.
> +	 */
> +	if ((!new_fb || !old_fb ||
> +	     old_plane_state->crtc_x != new_plane_state->crtc_x ||
> +	     old_plane_state->crtc_y != new_plane_state->crtc_y ||
> +	     old_plane_state->crtc_w != new_plane_state->crtc_w ||
> +	     old_plane_state->crtc_h != new_plane_state->crtc_h ||
> +	     old_fb->format->format != new_format))
> +		new_crtc_state->mode_changed = true;

This is covered by the framework already.

Maxime

--xo7mis7ioaunnpmu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhSegwAKCRDj7w1vZxhR
xVM5AP0bcVfkASIp96ve7s5a5ZDFsEiu4egNxtcEkRwEApBOtAD8C2nzcH3MEoqa
9A0EV3PsaFmhE/5ASPBHAxO3XEsETAA=
=N+S6
-----END PGP SIGNATURE-----

--xo7mis7ioaunnpmu--
