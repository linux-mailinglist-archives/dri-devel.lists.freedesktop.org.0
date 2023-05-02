Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9E96F4B4B
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 22:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D05210E081;
	Tue,  2 May 2023 20:24:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-16.smtpout.orange.fr
 [80.12.242.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D75310E081
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 20:24:16 +0000 (UTC)
Received: from [192.168.1.18] ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id twXgppIyTDWLHtwXgpzUGe; Tue, 02 May 2023 22:24:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1683059053;
 bh=PMrwAhXdyGkz9ytuGeyKVuEYfwV4KQf3cPRbS20fhZU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=MSxDoOzDIu/DiFTeig656t6lYDc/5KleISt5cSLrSnmdxSpe5lubkW36EctN9mU76
 Iq2tRyJ3Y+QATWBHdIUf1fXn61S0We2PvD86m0W7tCTHOZ5SYyZlb7YapCbVQ9CWT2
 dLGxi+FID4GpeRUO6V/7Hz7j16fTKyOeypOOc52E1rD/e+cUIP6IZxeSkiI/91Z6o2
 2mfdT38mOIukQ6vGkb0XGT/fmgu2vXZpRJgZv1b6rKvSkLjL55EJ5PFEJ6X9tQ+UGg
 4TILE30vzjSjVaj8aZ4kQ/Dbb71TypClXpVoxJWQGoV6FH0Nc1Buzo3gv9P3eRhQW0
 b5tE4r1jDlVJA==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 02 May 2023 22:24:13 +0200
X-ME-IP: 86.243.2.178
Message-ID: <b1ee9be3-60db-31ea-97dd-916dc80f237c@wanadoo.fr>
Date: Tue, 2 May 2023 22:24:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 net-next 3/6] net: bcmasp: Add support for ASP2.0
 Ethernet controller
Content-Language: fr
To: Justin Chen <justinpopo6@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com
References: <1682535272-32249-1-git-send-email-justinpopo6@gmail.com>
 <1682535272-32249-4-git-send-email-justinpopo6@gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <1682535272-32249-4-git-send-email-justinpopo6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, opendmb@gmail.com,
 christian.koenig@amd.com, richardcochran@gmail.com, linux@armlinux.org.uk,
 justin.chen@broadcom.com, edumazet@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kuba@kernel.org, pabeni@redhat.com,
 sumit.semwal@linaro.org, davem@davemloft.net, hkallweit1@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 26/04/2023 à 20:54, Justin Chen a écrit :
> Add support for the Broadcom ASP 2.0 Ethernet controller which is first
> introduced with 72165. This controller features two distinct Ethernet
> ports that can be independently operated.
> 
> This patch supports:
> 
> - Wake-on-LAN using magic packets
> - basic ethtool operations (link, counters, message level)
> - MAC destination address filtering (promiscuous, ALL_MULTI, etc.)
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Justin Chen <justinpopo6@gmail.com>
> ---

[...]

> +void bcmasp_disable_all_filters(struct bcmasp_intf *intf)
> +{
> +	struct bcmasp_priv *priv = intf->parent;
> +	unsigned int i;

Hi,

Nit: Some loop index are unsigned int, but most are int.
This could be done consistantly.

> +
> +	/* Disable all filters held by this port */
> +	for (i = ASP_RX_FILT_MDA_RES_COUNT(intf); i < NUM_MDA_FILTERS; i++) {
> +		if (priv->mda_filters[i].en &&
> +		    priv->mda_filters[i].port == intf->port)
> +			bcmasp_en_mda_filter(intf, 0, i);
> +	}
> +}

[...]

> +static int bcmasp_probe(struct platform_device *pdev)
> +{
> +	struct device_node *ports_node, *intf_node;
> +	const struct bcmasp_plat_data *pdata;
> +	struct device *dev = &pdev->dev;
> +	int ret, i, count = 0, port;
> +	struct bcmasp_priv *priv;
> +	struct bcmasp_intf *intf;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->irq = platform_get_irq(pdev, 0);
> +	if (priv->irq <= 0) {
> +		dev_err(dev, "invalid interrupt\n");
> +		return -EINVAL;
> +	}
> +
> +	priv->clk = devm_clk_get_optional_enabled(dev, "sw_asp");
> +	if (IS_ERR(priv->clk)) {
> +		dev_err(dev, "failed to request clock\n");
> +		return PTR_ERR(priv->clk);
> +	}
> +
> +	/* Base from parent node */
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base)) {
> +		dev_err(dev, "failed to iomap\n");
> +		return PTR_ERR(priv->base);
> +	}
> +
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
> +	if (ret)
> +		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));

I don't think that this fallback is needed.
See [1].

More over, using dev_err_probe() would slighly simplify the probe 
function. (saves a few LoC, logs the error code in a human reading format)

[1]: 
https://lore.kernel.org/lkml/86bf852e-4220-52d4-259d-3455bc24def1@wanadoo.fr/T/#m022abc0051ede3ba1feeb06cefd59e2a8a5c7864

> +	if (ret) {
> +		dev_err(&pdev->dev, "unable to set DMA mask: %d\n", ret);
> +		return ret;
> +	}
> +

[...]

> +static int __maybe_unused bcmasp_suspend(struct device *d)
> +{
> +	struct bcmasp_priv *priv = dev_get_drvdata(d);
> +	struct bcmasp_intf *intf;
> +	unsigned int i;

Same

> +	int ret = 0;

no need to initialize, but it is mostmy a matter of taste.

> +
> +	for (i = 0; i < priv->intf_count; i++) {
> +		intf = priv->intfs[i];
> +		if (!intf)
> +			continue;
> +
> +		ret = bcmasp_interface_suspend(intf);
> +		if (ret)
> +			break;
> +	}
> +
> +	ret = clk_prepare_enable(priv->clk);
> +	if (ret)
> +		return ret;
> +
> +	/* Whether Wake-on-LAN is enabled or not, we can always disable
> +	 * the shared TX clock
> +	 */
> +	bcmasp_core_clock_set(priv, 0, ASP_CTRL_CLOCK_CTRL_ASP_TX_DISABLE);
> +
> +	bcmasp_core_clock_select(priv, true);
> +
> +	clk_disable_unprepare(priv->clk);
> +
> +	return ret;
> +}
> +
> +static int __maybe_unused bcmasp_resume(struct device *d)
> +{
> +	struct bcmasp_priv *priv = dev_get_drvdata(d);
> +	struct bcmasp_intf *intf;
> +	unsigned int i;

same

> +	int ret = 0;

no need to initialize, but it is mostmy a matter of taste.

Just my 2c,
CJ


