Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4221A7441
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4CA6E45C;
	Tue, 14 Apr 2020 07:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A338F89CAA
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 12:44:29 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id o81so3624246wmo.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 05:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SyAoCky+LpQV+8kyCzw4R1m9WdNTQKY8khlOcJkxk24=;
 b=NedGkSaTlgNzjG4eF9EQSGsA52uybp7FXFKpNaUSZLzsPue3f/S0Fa6FPHa88Lf3oU
 ITzO3wWe6wqQ5+P83C4QDBIx/6AiElMPC1ITZTGBvGI+i7EuGEVhd8SsIV8hsSiyfE81
 E2ZnrSJ/9JMrXcUBnv/yMR8nECtkUcOuhmqs40KXtVeFiYCTKD/PxXu8m1uh5njJlsku
 LziyPC4hf8TQRFywxX9yi2Q65h4LLCUjOpDf8kAdd2b7HcuUUJQ3m5ApythIGI2dCT2J
 ixYwuaXAoQ0K5CQP3iHaxb/FEXxnFKM7h6Tb64vhImE3Dvg6tohXtTT1VMLoDHG0RBVk
 gsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SyAoCky+LpQV+8kyCzw4R1m9WdNTQKY8khlOcJkxk24=;
 b=Y3IfrKZfkO3PHItNP9oVwV4DAmEyOTNjyKKk6tQ1CBn7RGtw2X7V0oPREGEMbhyh2B
 U+UZ2o8R4nyUkjp7vCNYYeCeY90sWBS0Q46su+OTK4OWcje4U71d4qWl8pojRGrl7T10
 PYFjT6tBBf5S9nhzWpiZ3ByPHu8dHyg0qRB2E2ML5526NyMcTOzEnuHSEaYr/9mkpXMt
 AV69A0sNI5QkL5npnISVmHCaYEGToYPFnnKCCIYDuhKQbivjtr6VJtJLnf/9UeGUXsXL
 KUa7mgbxTJBiv5yglln+JsG0s/FqG46EqRVY8VKbYYoW9D/anEhUjpGR+HjzLxbTArrK
 oiOw==
X-Gm-Message-State: AGi0PuasMm+tyRTXgvSV7IYbIaUh073HdSbYVoXNYtV4dEACJ0IYDsyQ
 qHsI7A8HBQLnk5YOz0dHKsaJdw==
X-Google-Smtp-Source: APiQypLzK9gJ8i4aeA2jYafZ3cBueTCznG3RB7Max2k+vH6mgdUaAoCwL3PVcssH/FcnGn6rQu+Ygg==
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr18912081wmc.67.1586781868200; 
 Mon, 13 Apr 2020 05:44:28 -0700 (PDT)
Received: from [192.168.0.136] ([87.120.218.65])
 by smtp.googlemail.com with ESMTPSA id w6sm10690816wrm.86.2020.04.13.05.44.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Apr 2020 05:44:27 -0700 (PDT)
Subject: Re: [PATCH v2 17/22] memory: tegra30-emc: Register as interconnect
 provider
To: Dmitry Osipenko <digetx@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-18-digetx@gmail.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <d8e39d8b-b3f3-4a30-cb5a-67fcbe18a957@linaro.org>
Date: Mon, 13 Apr 2020 15:44:26 +0300
MIME-Version: 1.0
In-Reply-To: <20200330010904.27643-18-digetx@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:06:18 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 3/30/20 04:08, Dmitry Osipenko wrote:
> Now external memory controller is a memory interconnection provider.
> This allows us to use interconnect API to change memory configuration.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra30-emc.c | 115 +++++++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
> 
> diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
> index 69698665d431..5a4106173a75 100644
> --- a/drivers/memory/tegra/tegra30-emc.c
> +++ b/drivers/memory/tegra/tegra30-emc.c
> @@ -14,6 +14,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/err.h>
> +#include <linux/interconnect-provider.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> @@ -327,6 +328,7 @@ struct tegra_emc {
>  	struct device *dev;
>  	struct tegra_mc *mc;
>  	struct notifier_block clk_nb;
> +	struct icc_provider provider;
>  	struct clk *clk;
>  	void __iomem *regs;
>  	unsigned int irq;
> @@ -1264,6 +1266,112 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
>  			    emc, &tegra_emc_debug_max_rate_fops);
>  }
>  
> +static inline struct tegra_emc *
> +to_tegra_emc_provider(struct icc_provider *provider)
> +{
> +	return container_of(provider, struct tegra_emc, provider);
> +}
> +
> +static struct icc_node *
> +emc_of_icc_xlate_onecell(struct of_phandle_args *spec, void *data)
> +{
> +	struct icc_provider *provider = data;
> +	struct icc_node *node;
> +
> +	/* External Memory is the only possible ICC route */
> +	list_for_each_entry(node, &provider->nodes, node_list) {
> +		if (node->id == TEGRA_ICC_EMEM)
> +			return node;
> +	}
> +
> +	return ERR_PTR(-EINVAL);
> +}
> +
> +static int emc_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
> +	struct tegra_emc *emc = to_tegra_emc_provider(dst->provider);
> +	unsigned long long rate = icc_units_to_bps(dst->avg_bw);
> +	unsigned int dram_data_bus_width_bytes = 4;
> +	unsigned int ddr = 2;
> +	int err;
> +
> +	do_div(rate, ddr * dram_data_bus_width_bytes);
> +	rate = min_t(u64, rate, U32_MAX);
> +
> +	err = clk_set_min_rate(emc->clk, rate);
> +	if (err)
> +		return err;
> +
> +	err = clk_set_rate(emc->clk, rate);
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static int emc_icc_aggregate(struct icc_node *node,
> +			     u32 tag, u32 avg_bw, u32 peak_bw,
> +			     u32 *agg_avg, u32 *agg_peak)
> +{
> +	*agg_avg = min((u64)avg_bw + (*agg_avg), (u64)U32_MAX);
> +	*agg_peak = max(*agg_peak, peak_bw);
> +
> +	return 0;
> +}
> +
> +static int tegra_emc_interconnect_init(struct tegra_emc *emc)
> +{
> +	struct icc_node *node;
> +	int err;
> +
> +	/* older device-trees don't have interconnect properties */
> +	if (!of_find_property(emc->dev->of_node, "#interconnect-cells", NULL))
> +		return 0;
> +
> +	emc->provider.dev = emc->dev;
> +	emc->provider.set = emc_icc_set;
> +	emc->provider.data = &emc->provider;
> +	emc->provider.xlate = emc_of_icc_xlate_onecell;
> +	emc->provider.aggregate = emc_icc_aggregate;
> +
> +	err = icc_provider_add(&emc->provider);
> +	if (err)
> +		return err;
> +
> +	/* create External Memory Controller node */
> +	node = icc_node_create(TEGRA_ICC_EMC);
> +	err = PTR_ERR_OR_ZERO(node);
> +	if (err)
> +		goto del_provider;
> +
> +	node->name = "External Memory Controller";
> +	icc_node_add(node, &emc->provider);
> +
> +	/* link External Memory Controller to External Memory (DRAM) */
> +	err = icc_link_create(node, TEGRA_ICC_EMEM);
> +	if (err)
> +		goto remove_nodes;
> +
> +	/* create External Memory node */
> +	node = icc_node_create(TEGRA_ICC_EMEM);
> +	err = PTR_ERR_OR_ZERO(node);
> +	if (err)
> +		goto remove_nodes;
> +
> +	node->name = "External Memory (DRAM)";
> +	icc_node_add(node, &emc->provider);
> +
> +	return 0;
> +
> +remove_nodes:
> +	icc_nodes_remove(&emc->provider);
> +
> +del_provider:
> +	icc_provider_del(&emc->provider);
> +
> +	return err;
> +}

All the above seems like a duplicate of what we already have in the previous
patch for tegra20-emc. Can we have a single driver for both? Maybe extract the
above as a separate interconnect provider driver.

> +
>  static int tegra_emc_probe(struct platform_device *pdev)
>  {
>  	struct platform_device *mc;
> @@ -1344,6 +1452,13 @@ static int tegra_emc_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, emc);
>  	tegra_emc_debugfs_init(emc);
>  
> +	if (IS_ENABLED(CONFIG_INTERCONNECT)) {
> +		err = tegra_emc_interconnect_init(emc);

How about registering a platform device that will use the same driver to handle
the interconnect functionality for both tegra20 and tegra30?

Thanks,
Georgi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
