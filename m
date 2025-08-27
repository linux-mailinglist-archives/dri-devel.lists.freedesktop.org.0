Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE828B37A84
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 08:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05ABF10E706;
	Wed, 27 Aug 2025 06:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gZ5W3wfb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFC3910E716
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 06:38:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8536A418A2;
 Wed, 27 Aug 2025 06:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64274C4CEEB;
 Wed, 27 Aug 2025 06:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756276695;
 bh=ypbSldKKIg0u2TzSiWKfGcOi9083+yJHil2HF5x1BAI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gZ5W3wfbNPKjXAR7FX8pd1xkVXDvLqgLQyWM2ndzAlBMZMaS6M3NB8bZpvIaAZlnI
 OH76UwiWwQbjkw+zv8qvKTSDCk56WBv4w/LSIM1Es5dqyxYEk1x5EUm+aXlpYU20Hk
 EI8T5G/SPxyGblUdzkQq4S1yafge4kPH8/RmIE4EExkL4mI15AT579pHGgXtRJXxAf
 MHLRQGmYoNzR0bQLcZ0cLRa5HzIRVQaBt9Be0WCFgFJiYKEL+Efp4XBCNvjf9r9VIC
 wYn6VJMG3+D7SZrMI17Y2QBq1ifG+V678WHQM/1HGnspuQakb1naBrV1YsPuQGzGs4
 mMj1KwAeAaiHA==
Message-ID: <ef3822a5-d3f8-41dc-984c-8c63d60eaec5@kernel.org>
Date: Wed, 27 Aug 2025 08:38:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: samsung: scaler: add scaler driver code
To: Kisung Lee <kiisung.lee@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org
References: <20250827044720.3751272-1-kiisung.lee@samsung.com>
 <CGME20250827045905epcas2p46c8bc31d9c32168f77d1e10808e92b77@epcas2p4.samsung.com>
 <20250827044720.3751272-3-kiisung.lee@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250827044720.3751272-3-kiisung.lee@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 27/08/2025 06:47, Kisung Lee wrote:
> +
> +static int sc_probe(struct platform_device *pdev)
> +{
> +	struct sc_dev *sc;
> +	struct resource *res;
> +	int ret = 0;
> +	size_t ivar;
> +	u32 hwver = 0;
> +	int irq_num;
> +
> +	sc = devm_kzalloc(&pdev->dev, sizeof(struct sc_dev), GFP_KERNEL);


Oh yeah, 10 year old coding style. Very dissapointing :(

> +	if (!sc)
> +		goto err_dev;
> +
> +	sc->dev = &pdev->dev;
> +	spin_lock_init(&sc->ctxlist_lock);
> +	INIT_LIST_HEAD(&sc->ctx_list_high_prio);
> +	INIT_LIST_HEAD(&sc->ctx_list_low_prio);
> +	spin_lock_init(&sc->slock);
> +	mutex_init(&sc->lock);
> +	init_waitqueue_head(&sc->wait);
> +
> +	sc->fence_context = dma_fence_context_alloc(1);
> +	spin_lock_init(&sc->fence_lock);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	pr_err("Resource start: 0x%pa, end: 0x%pa, size: 0x%lx, flags: 0x%lx\n",

No, drop.

> +	       &res->start, &res->end,
> +	       (unsigned long)resource_size(res),
> +	       (unsigned long)res->flags);
> +	sc->regs = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(sc->regs)) {
> +		pr_err("devm_ioremap_resource failed: %pe\n", sc->regs);
> +		goto err_io_resource;
> +	}
> +	dma_set_mask(&pdev->dev, DMA_BIT_MASK(32));
> +
> +	atomic_set(&sc->wdt.cnt, 0);
> +	timer_setup(&sc->wdt.timer, sc_watchdog, 0);
> +
> +	if (pdev->dev.of_node) {
> +		sc->dev_id = of_alias_get_id(pdev->dev.of_node, "scaler");

NAK, check my DT talk.

> +		if (sc->dev_id < 0) {
> +			dev_err(&pdev->dev,
> +				"Failed to read scaler node id(%d)!\n", sc->dev_id);
> +			ret = -EINVAL;
> +			goto err_node_id;
> +		}
> +	} else {
> +		sc->dev_id = pdev->id;
> +	}
> +
> +	platform_set_drvdata(pdev, sc);
> +
> +	pm_runtime_enable(&pdev->dev);
> +
> +	ret = sc_populate_dt(sc);
> +	if (ret)
> +		goto err_dt;
> +
> +	ret = sc_register_m2m_device(sc, sc->dev_id);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to register m2m device\n");
> +		goto err_m2m;
> +	}
> +
> +#if defined(CONFIG_PM_DEVFREQ) && defined(NEVER_DEFINED)

You must be joking?

> +	if (!of_property_read_u32(pdev->dev.of_node, "mscl,int_qos_minlock",

NAK

> +				  (u32 *)&sc->qosreq_int_level)) {
> +		if (sc->qosreq_int_level > 0) {
> +			exynos_pm_qos_add_request(&sc->qosreq_int,
> +						  PM_QOS_DEVICE_THROUGHPUT, 0);
> +			dev_info(&pdev->dev, "INT Min.Lock Freq. = %u\n",
> +				 sc->qosreq_int_level);
> +		}
> +	}
> +#endif
> +	if (of_property_read_u32(pdev->dev.of_node, "mscl,cfw",

Cannot express more: NAK. You cannot add such undocumented ABI.

> +				 (u32 *)&sc->cfw))
> +		sc->cfw = 0;
> +
> +	ret = sc_get_hwversion(sc);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "%s: failed to get hw version (err %d)\n",
> +			__func__, ret);
> +		goto err_m2m;
> +	} else {
> +		hwver = ret;
> +	}
> +
> +	for (ivar = 0; ivar < ARRAY_SIZE(sc_variant); ivar++) {
> +		if (sc->version >= sc_variant[ivar].version) {
> +			sc->variant = &sc_variant[ivar];
> +			break;
> +		}
> +	}
> +
> +	if (sc->version >= SCALER_VERSION(7, 0, 1)) {
> +		sc->sysreg_offset = SCALER_SYSREG_OFFSET(res->start);
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +		if (res) {
> +			sc->sysreg = devm_ioremap_resource(&pdev->dev, res);
> +			if (IS_ERR(sc->sysreg)) {
> +				dev_info(&pdev->dev, "SCALER LLC SYSREG is not setted.\n");
> +			} else {
> +				writel(SCALER_LLC_NO_HINT, sc->sysreg + sc->sysreg_offset);
> +				dev_info(&pdev->dev, "SCALER LLC SYSREG is setted with NO_HINT.\n");
> +			}
> +		}
> +	}
> +
> +	sc_hwset_soft_reset(sc);
> +
> +	if (!IS_ERR(sc->aclk))
> +		clk_disable_unprepare(sc->aclk);
> +	if (!IS_ERR(sc->pclk))
> +		clk_disable_unprepare(sc->pclk);
> +	pm_runtime_put(&pdev->dev);
> +
> +	irq_num = platform_get_irq(pdev, 0);
> +	if (irq_num < 0) {
> +		dev_err(&pdev->dev, "failed to get IRQ resource\n");

you just upstream 10 year old code, right?

Please carefully check the slides of my Monday's talk from OSSE25 about
static analyzers. Look at slides about upstreaming 10 year old vendor
code (that's a very bad idea).


> +		ret = -ENOENT;

Wrong error code.

> +		goto err_get_irq_res;
> +	}
> +
> +	ret = devm_request_irq(&pdev->dev, irq_num, sc_irq_handler, 0,
> +			       pdev->name, sc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to install irq\n");
> +		goto err_request_irq;
> +	}
> +
> +	dev_info(&pdev->dev,
> +		 "Driver probed successfully(version: %08x(%x))\n",
> +		 hwver, sc->version);

NAK, don't add such code. Ever.

> +
> +	return 0;
> +
> +err_request_irq:
> +err_get_irq_res:
> +err_m2m:
> +err_dt:
> +err_node_id:
> +err_io_resource:
> +	if (sc)
> +		devm_kfree(&pdev->dev, sc);
> +err_dev:
> +	dev_err(&pdev->dev,
> +		"Driver probed failed!\n");


No, drop. Useless.

> +
> +	return ret;
> +}
> +




...

> +static struct sc_csc_tab sc_y2r = {
> +	/* REC.601 Narrow */
> +	{ 0x0254, 0x0000, 0x0331, 0x0254, 0xFF37, 0xFE60, 0x0254, 0x0409, 0x0000 },
> +	/* REC.601 Wide */
> +	{ 0x0200, 0x0000, 0x02BE, 0x0200, 0xFF54, 0xFE9B, 0x0200, 0x0377, 0x0000 },
> +	/* REC.709 Narrow */
> +	{ 0x0254, 0x0000, 0x0396, 0x0254, 0xFF93, 0xFEEF, 0x0254, 0x043A, 0x0000 },
> +	/* REC.709 Wide */
> +	{ 0x0200, 0x0000, 0x0314, 0x0200, 0xFFA2, 0xFF16, 0x0200, 0x03A1, 0x0000 },
> +	/* BT.2020 Narrow */
> +	{ 0x0254, 0x0000, 0x035B, 0x0254, 0xFFA0, 0xFEB3, 0x0254, 0x0449, 0x0000 },
> +	/* BT.2020 Wide */
> +	{ 0x0200, 0x0000, 0x02E2, 0x0200, 0xFFAE, 0xFEE2, 0x0200, 0x03AE, 0x0000 },
> +};
> +
> +static struct sc_csc_tab sc_r2y = {
> +	/* REC.601 Narrow */
> +	{ 0x0083, 0x0102, 0x0032, 0xFFB4, 0xFF6B, 0x00E1, 0x00E1, 0xFF44, 0xFFDB },
> +	/* REC.601 Wide  */
> +	{ 0x0099, 0x012D, 0x003A, 0xFFA8, 0xFF53, 0x0106, 0x0106, 0xFF25, 0xFFD5 },
> +	/* REC.709 Narrow */
> +	{ 0x005D, 0x013A, 0x0020, 0xFFCC, 0xFF53, 0x00E1, 0x00E1, 0xFF34, 0xFFEB },
> +	/* REC.709 Wide */
> +	{ 0x006D, 0x016E, 0x0025, 0xFFC4, 0xFF36, 0x0106, 0x0106, 0xFF12, 0xFFE8 },
> +	/* BT.2020 Narrow */
> +	{ 0x0074, 0x012A, 0x001A, 0xFFC1, 0xFF5E, 0x00E1, 0x00E1, 0xFF31, 0xFFEE },
> +	/* BT.2020 Wide */
> +	{ 0x0087, 0x015B, 0x001E, 0xFFB7, 0xFF43, 0x0106, 0x0106, 0xFF0F, 0xFFEB },
> +};
> +
> +static struct sc_csc_tab *sc_csc_list[] = {
> +	[0] = &sc_no_csc,
> +	[1] = &sc_y2r,
> +	[2] = &sc_r2y,
> +};
> +
> +static struct sc_bl_op_val sc_bl_op_tbl[] = {


Why absolutely nothing here is const?

> +	/* Sc,	 Sa,	Dc,	Da */
> +	{ZERO,	 ZERO,	ZERO,	ZERO},		/* CLEAR */
> +	{ ONE,	 ONE,	ZERO,	ZERO},		/* SRC */
> +	{ZERO,	 ZERO,	ONE,	ONE},		/* DST */
> +	{ ONE,	 ONE,	INV_SA,	INV_SA},	/* SRC_OVER */
> +	{INV_DA, ONE,	ONE,	INV_SA},	/* DST_OVER */
> +	{DST_A,	 DST_A,	ZERO,	ZERO},		/* SRC_IN */
> +	{ZERO,	 ZERO,	SRC_A,	SRC_A},		/* DST_IN */
> +	{INV_DA, INV_DA, ZERO,	ZERO},		/* SRC_OUT */
> +	{ZERO,	 ZERO,	INV_SA,	INV_SA},	/* DST_OUT */
> +	{DST_A,	 ZERO,	INV_SA,	ONE},		/* SRC_ATOP */
> +	{INV_DA, ONE,	SRC_A,	ZERO},		/* DST_ATOP */
> +	{INV_DA, ONE,	INV_SA,	ONE},		/* XOR: need to WA */
> +	{INV_DA, ONE,	INV_SA,	INV_SA},	/* DARKEN */
> +	{INV_DA, ONE,	INV_SA,	INV_SA},	/* LIGHTEN */
> +	{INV_DA, ONE,	INV_SA,	INV_SA},	/* MULTIPLY */
> +	{ONE,	 ONE,	INV_SC,	INV_SA},	/* SCREEN */
> +	{ONE,	 ONE,	ONE,	ONE},		/* ADD */
> +};
> +

...

> +	yfilter = sc_get_scale_filter(yratio);
> +	cfilter = sc_get_scale_filter(cratio);
> +	bit_adj = !sc->variant->pixfmt_10bit;
> +
> +	/* reset value of the coefficient registers are the 8:8 table */
> +	for (phase = 0; phase < 9; phase++) {
> +		__raw_writel(sc_coef_adj(bit_adj, sc_coef_4t[yfilter][phase][1]),
> +			     sc->regs + SCALER_YVCOEF + phase * 8);
> +		__raw_writel(sc_coef_adj(bit_adj, sc_coef_4t[yfilter][phase][0]),
> +			     sc->regs + SCALER_YVCOEF + phase * 8 + 4);
> +	}
> +
> +	for (phase = 0; phase < 9; phase++) {
> +		__raw_writel(sc_coef_adj(bit_adj, sc_coef_4t[cfilter][phase][1]),
> +			     sc->regs + SCALER_CVCOEF + phase * 8);
> +		__raw_writel(sc_coef_adj(bit_adj, sc_coef_4t[cfilter][phase][0]),
> +			     sc->regs + SCALER_CVCOEF + phase * 8 + 4);
> +	}
> +}
> +
> +void sc_get_span(struct sc_frame *frame, u32 *yspan, u32 *cspan)
> +{
> +	if (IS_ERR_OR_NULL(frame) || IS_ERR_OR_NULL(yspan) || IS_ERR_OR_NULL(cspan)) {

Sorrry, but what? How each of these can be ERR or NULL? How is it possible?

Please provide exact cases leading to this.

> +		pr_err("[%s] frame(%p) or yspan(%p) or cspan(%p) is wrong\n",
> +		       __func__, frame, yspan, cspan);
> +		return;
> +	}
> +
> +	*yspan = frame->width;
> +
> +	if (frame->sc_fmt->num_comp == 2) {
> +		*cspan = frame->width << frame->sc_fmt->cspan;
> +	} else if (frame->sc_fmt->num_comp == 3) {
> +		if (sc_fmt_is_ayv12(frame->sc_fmt->pixelformat)) {
> +			*cspan = ALIGN(frame->width >> 1, 16);
> +		} else if (sc_fmt_is_yuv420(frame->sc_fmt->pixelformat)) { /* YUV420 */
> +			if (frame->cspanalign) {
> +				*cspan = ALIGN(frame->width >> 1,
> +					       8 << (frame->cspanalign - 1));
> +			} else {
> +				*cspan = frame->width >> 1;
> +			}
> +		} else if (frame->sc_fmt->cspan) { /* YUV444 */
> +			*cspan = frame->width;
> +		} else {
> +			*cspan = frame->width >> 1;
> +		}
> +	} else if (frame->sc_fmt->num_comp == 1) {
> +		if (sc_fmt_is_rgb888(frame->sc_fmt->pixelformat))
> +			if (frame->yspanalign)
> +				*yspan = ALIGN(frame->width,
> +					       8 << (frame->yspanalign - 1));
> +		*cspan = 0;
> +	} else {
> +		*cspan = 0;
> +	}
> +}
> +
> +void sc_hwset_src_imgsize(struct sc_dev *sc, struct sc_frame *frame)
> +{
> +	u32 yspan = 0, cspan = 0;
> +
> +	if (IS_ERR_OR_NULL(sc) || IS_ERR_OR_NULL(frame)) {

How can be ERR or NULL? This looks buggy, like you don't know flow of
own code.

> +		pr_err("[%s] sc(%p) or frame(%p) is wrong\n", __func__, sc, frame);

dev_err


This is terrible driver, poorly coded, using 10 year old coding style,
repeating many known antipatterns and mistakes. It is very dissapointing
to see Samsung sending such poor code.

Really poor code.

Best regards,
Krzysztof
