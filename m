Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIVdM5WZhGmh3gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 14:22:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E4EF32CA
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 14:22:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F21110E1D1;
	Thu,  5 Feb 2026 13:22:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sRt/BFMm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957B810E2BD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 13:22:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3450544406;
 Thu,  5 Feb 2026 13:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8500AC4CEF7;
 Thu,  5 Feb 2026 13:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770297744;
 bh=TkfBnRNycUzOt57ZGltou8dZywkW6jXvCL0D1cY1hQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sRt/BFMmWrKitSaNmQpRkeFL+wUlu0tz2R5EEbdfnxqfPxqObnM5CjORh/y3Pl1Yc
 XgGI2FT5G8myHoMBFHQD2+SAPR4kEIABNiZaShlcIMcoXEgs8cyqfpNtzqrtK4sqfx
 G4nadJP8LWubRDvacLfmFQYuTs/x1XJozZp5bRUEBzkb057RAo71EEtHU7uw99WOuX
 VsdOlCtEBHgmUJfA7WKYre9QEwKqsJYhwI6mZxJ9QUnoqea6GRd9F17ATu+XpjuqdL
 WlbtKvApqLx2dy5Ic3yIs4UxZrfrkOy6bdIQEPHEIWmNLnYgK14FxXLK2fMvlAw83n
 K1z9AeIgYA7kg==
Date: Thu, 5 Feb 2026 14:22:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joey Lu <a0987203069@gmail.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
 yclu4@nuvoton.com, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/nuvoton: add MA35D1 display controller driver
Message-ID: <20260205-classic-innocent-angelfish-5c3cd2@quoll>
References: <20260129040532.382693-1-a0987203069@gmail.com>
 <20260129040532.382693-4-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260129040532.382693-4-a0987203069@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:a0987203069@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,nuvoton.com,lists.infradead.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 28E4EF32CA
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 12:05:32PM +0800, Joey Lu wrote:
> Add DRM driver support for the Display Control Unit (DCU)
> found in Nuvoton MA35D1 SoCs.
> 
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> ---
>  drivers/gpu/drm/Kconfig                  |   1 +
>  drivers/gpu/drm/Makefile                 |   1 +
>  drivers/gpu/drm/nuvoton/Kconfig          |  21 +
>  drivers/gpu/drm/nuvoton/Makefile         |   7 +
>  drivers/gpu/drm/nuvoton/ma35_crtc.c      | 372 ++++++++++++++
>  drivers/gpu/drm/nuvoton/ma35_crtc.h      |  67 +++
>  drivers/gpu/drm/nuvoton/ma35_drm.c       | 371 ++++++++++++++
>  drivers/gpu/drm/nuvoton/ma35_drm.h       |  48 ++
>  drivers/gpu/drm/nuvoton/ma35_interface.c | 193 ++++++++
>  drivers/gpu/drm/nuvoton/ma35_interface.h |  30 ++
>  drivers/gpu/drm/nuvoton/ma35_plane.c     | 603 +++++++++++++++++++++++
>  drivers/gpu/drm/nuvoton/ma35_plane.h     | 115 +++++
>  drivers/gpu/drm/nuvoton/ma35_regs.h      |  88 ++++

No maintainers? Why would we want to take unmaintained code?

> +static void ma35_mode_fini(struct ma35_drm *priv)
> +{
> +	struct drm_device *drm_dev = &priv->drm_dev;
> +
> +	drm_kms_helper_poll_fini(drm_dev);
> +}
> +
> +static int ma35_clocks_prepare(struct ma35_drm *priv)
> +{
> +	struct drm_device *drm_dev = &priv->drm_dev;
> +	struct device *dev = drm_dev->dev;
> +	int ret;
> +
> +	priv->dcuclk = devm_clk_get(dev, "dcu_gate");
> +	if (IS_ERR(priv->dcuclk)) {
> +		dev_err(dev, "Failed to get display core clock\n");

Don't spam logs on defers. Syntax is in entire probe path: return
dev_err_probe

> +		return PTR_ERR(priv->dcuclk);
> +	}
> +
> +	ret = clk_prepare_enable(priv->dcuclk);

Why this cannot be devm_clk_get_enabled?

> +	if (ret) {
> +		dev_err(dev, "Failed to enable display core clock\n");
> +		return ret;
> +	}
> +
> +	priv->dcupclk = devm_clk_get(dev, "dcup_div");
> +	if (IS_ERR(priv->dcupclk)) {
> +		dev_err(dev, "Failed to get display pixel clock\n");
> +		return PTR_ERR(priv->dcupclk);
> +	}
> +
> +	ret = clk_prepare_enable(priv->dcupclk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable display pixel clock\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ma35_clocks_unprepare(struct ma35_drm *priv)
> +{
> +	struct clk **clocks[] = {
> +		&priv->dcuclk,
> +		&priv->dcupclk,
> +	};
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(clocks); i++) {
> +		if (!*clocks[i])
> +			continue;
> +
> +		clk_disable_unprepare(*clocks[i]);
> +		*clocks[i] = NULL;

Huh, pretty complicated and pointless code. This should be devm and bulk
API...

> +	}
> +
> +	return 0;
> +}
> +
> +static int ma35_drm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct ma35_drm *priv;
> +	struct drm_device *drm_dev;
> +	void __iomem *base;
> +	struct regmap *regmap = NULL;
> +	int irq;
> +	int ret;
> +
> +	ret = of_reserved_mem_device_init(dev);
> +	if (ret && ret != -ENODEV) {
> +		dev_err(dev, "Failed to get optional reserved memory: %d\n", ret);
> +		return ret;
> +	}
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base)) {
> +		dev_err(dev, "Failed to map I/O base\n");

Why aren't you using dev_err_probe?

> +		ret = PTR_ERR(base);
> +		goto error_reserved_mem;
> +	}
> +	regmap = devm_regmap_init_mmio(dev, base, &ma35_drm_regmap_config);
> +	if (IS_ERR(regmap)) {
> +		dev_err(dev, "Failed to create regmap for I/O\n");
> +		ret = PTR_ERR(regmap);
> +		goto error_reserved_mem;
> +	}
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		ret = -ENODEV;
> +		goto error_reserved_mem;
> +	}
> +
> +	priv = devm_drm_dev_alloc(dev, &ma35_drm_driver,
> +				     struct ma35_drm, drm_dev);
> +	if (IS_ERR(priv)) {
> +		ret = PTR_ERR(priv);
> +		goto error_reserved_mem;
> +	}
> +
> +	platform_set_drvdata(pdev, priv);
> +	drm_dev = &priv->drm_dev;
> +	priv->regmap = regmap;
> +	INIT_LIST_HEAD(&priv->layers_list);
> +
> +	ret = ma35_clocks_prepare(priv);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to prepare clocks\n");

Why do you print error twice? Once in the function, second time here?

> +		goto error_reserved_mem;
> +	}
> +
> +	ret = devm_request_irq(dev, irq, ma35_drm_irq_handler, 0,
> +			       dev_name(dev), priv);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to request IRQ\n");
> +		goto error_clocks;
> +	}
> +
> +	/* modeset */
> +	ret = ma35_mode_init(priv);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to initialize KMS\n");
> +		goto error_clocks;
> +	}
> +
> +	/* plane */
> +	ret = ma35_plane_init(priv);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to initialize layers\n");
> +		goto error_clocks;
> +	}
> +
> +	/* crtc */
> +	ret = ma35_crtc_init(priv);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to initialize CRTC\n");
> +		goto error_clocks;
> +	}
> +
> +	/* interface */
> +	ret = ma35_interface_init(priv);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			drm_err(drm_dev, "Failed to initialize interface\n");
> +
> +		goto error_clocks;
> +	}
> +
> +	drm_mode_config_reset(drm_dev);
> +
> +	ret = drm_dev_register(drm_dev, 0);
> +	if (ret) {
> +		drm_err(drm_dev, "Failed to register DRM device\n");
> +		goto error_mode;
> +	}
> +
> +	drm_client_setup(drm_dev, NULL);

Best regards,
Krzysztof

