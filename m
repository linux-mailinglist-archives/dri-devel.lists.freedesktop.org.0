Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08571211CE1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:26:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AE06EA3C;
	Thu,  2 Jul 2020 07:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BECE6E976
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 17:12:26 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z2so2627956wrp.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 10:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TRT2eGY8Zk/CLkX+7ZsdwVBPTCAQcwVx/IkeDBQOzgI=;
 b=bCDrYnK3vveQkkUILpaZmRCO2PcFzRg5W/A5ohrU+isHgm/4xHLrkjtULuqa3cHMoA
 3UJ3E4PmLHA4KaQ8UK2UqTpbngLq3Rq6p98V1i8JCWi3m7Eh4rrHPy4uRST4Nw/wq5to
 98ex9A4ChixgpRJsv9WSW2EGCJ3FOBLabYq3fFM5bgPy19TCzF1eqxHeOGWhc/hMQM8l
 4UDx6ChIsT3gav16Olva68FypMJOmDEpwIZKdvq3h8GTXg5lUKrmpD3cU1B2bWsrXOG5
 fkONXPsZlAQkImm4fjfnn6nEOhwj7ZR+7D8SwaHE8WGQHSmEDI0kyur0DPa6gltnPoDy
 /Z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TRT2eGY8Zk/CLkX+7ZsdwVBPTCAQcwVx/IkeDBQOzgI=;
 b=fg/Ij3GPmVM7HN6mlUIG7yLgxdS2rzJctoFV1qK8FNjKEUra03ERmusxKfycEIU6NY
 5EKAEt4enppKDrBW8aaT42IZtsj8fdJ5hqVYhcF6bGVaQa5xLK8dsv1RM/8AR6bthE75
 gOoTdNE8uKrdr18RlekvfwXQUqSPDuP2dbjNOs5EDEfacyVMbjY2W671dutEBNLIuLQZ
 D/3NpnLzz0n3ioh2i9mdNjzeblM1/iY0URavWt/w0KAFfwD7kaDTLmlmmRyNXoTNVg/k
 6oCZGu8H1Hg95hBEKTRtv2UWEGOrisDBvtY5qyUWfaHa9TZrWrI4FSoIsrEpYlFxFEls
 aekA==
X-Gm-Message-State: AOAM531W8IZx9vej7Fmh89OpAfW0dTX4NC4338rTAdJKL39L1IXucuk+
 RNxL7oV5Xy+de+J9+pD+p/oHeA==
X-Google-Smtp-Source: ABdhPJynTjslcgmNNSt9bgIBELifCxpvlOLFaN8KibbjzFceYJ3fNw15fpl7lIVDMN2d+A5E2jeIfA==
X-Received: by 2002:a5d:4986:: with SMTP id r6mr26610285wrq.424.1593623544836; 
 Wed, 01 Jul 2020 10:12:24 -0700 (PDT)
Received: from [10.44.66.8] ([212.45.67.2])
 by smtp.googlemail.com with ESMTPSA id w17sm8768090wra.42.2020.07.01.10.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 10:12:24 -0700 (PDT)
Subject: Re: [PATCH v4 28/37] memory: tegra: Register as interconnect provider
To: Dmitry Osipenko <digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
 <20200609131404.17523-29-digetx@gmail.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <aec831a6-a7ad-6bcc-4e15-c44582f7568e@linaro.org>
Date: Wed, 1 Jul 2020 20:12:22 +0300
MIME-Version: 1.0
In-Reply-To: <20200609131404.17523-29-digetx@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-tegra@vger.kernel.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Thank you for updating the patches!

On 6/9/20 16:13, Dmitry Osipenko wrote:
> Now memory controller is a memory interconnection provider. This allows us
> to use interconnect API in order to change memory configuration.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig |   1 +
>  drivers/memory/tegra/mc.c    | 114 +++++++++++++++++++++++++++++++++++
>  drivers/memory/tegra/mc.h    |   8 +++
>  include/soc/tegra/mc.h       |   3 +
>  4 files changed, 126 insertions(+)
> 
> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
> index 5bf75b316a2f..7055fdef2c32 100644
> --- a/drivers/memory/tegra/Kconfig
> +++ b/drivers/memory/tegra/Kconfig
> @@ -3,6 +3,7 @@ config TEGRA_MC
>  	bool "NVIDIA Tegra Memory Controller support"
>  	default y
>  	depends on ARCH_TEGRA
> +	select INTERCONNECT
>  	help
>  	  This driver supports the Memory Controller (MC) hardware found on
>  	  NVIDIA Tegra SoCs.
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index 772aa021b5f6..7ef7ac9e103e 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -594,6 +594,118 @@ static __maybe_unused irqreturn_t tegra20_mc_irq(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static int tegra_mc_icc_set(struct icc_node *src, struct icc_node *dst)
> +{
> +	return 0;
> +}
> +
> +static int tegra_mc_icc_aggregate(struct icc_node *node,
> +				  u32 tag, u32 avg_bw, u32 peak_bw,
> +				  u32 *agg_avg, u32 *agg_peak)
> +{
> +	*agg_avg = min((u64)avg_bw + (*agg_avg), (u64)U32_MAX);
> +	*agg_peak = max(*agg_peak, peak_bw);
> +
> +	return 0;
> +}
> +
> +/*
> + * Memory Controller (MC) has few Memory Clients that are issuing memory
> + * bandwidth allocation requests to the MC interconnect provider. The MC
> + * provider aggregates the requests and then sends the aggregated request
> + * up to the External Memory Controller (EMC) interconnect provider which
> + * re-configures hardware interface to External Memory (EMEM) in accordance
> + * to the required bandwidth. Each MC interconnect node represents an
> + * individual Memory Client.
> + *
> + * Memory interconnect topology:
> + *
> + *               +----+
> + * +--------+    |    |
> + * | TEXSRD +--->+    |
> + * +--------+    |    |
> + *               |    |    +-----+    +------+
> + *    ...        | MC +--->+ EMC +--->+ EMEM |
> + *               |    |    +-----+    +------+
> + * +--------+    |    |
> + * | DISP.. +--->+    |
> + * +--------+    |    |
> + *               +----+
> + */
> +static int tegra_mc_interconnect_setup(struct tegra_mc *mc)
> +{
> +	struct icc_onecell_data *data;
> +	struct icc_node *node;
> +	unsigned int num_nodes;
> +	unsigned int i;
> +	int err;
> +
> +	/* older device-trees don't have interconnect properties */
> +	if (!of_find_property(mc->dev->of_node, "#interconnect-cells", NULL))
> +		return 0;
> +
> +	num_nodes = mc->soc->num_clients;
> +
> +	data = devm_kzalloc(mc->dev, struct_size(data, nodes, num_nodes),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	mc->provider.dev = mc->dev;
> +	mc->provider.set = tegra_mc_icc_set;

Hmm, maybe the core should not require a set() implementation and we can
just make it optional instead. Then the dummy function would not be needed.

> +	mc->provider.data = data;
> +	mc->provider.xlate = of_icc_xlate_onecell;
> +	mc->provider.aggregate = tegra_mc_icc_aggregate;
> +
> +	err = icc_provider_add(&mc->provider);
> +	if (err)
> +		goto err_msg;

Nit: I am planning to re-organize some of the existing drivers to call
icc_provider_add() after the topology is populated. Could you please move
this after the nodes are created and linked.

> +
> +	/* create Memory Controller node */
> +	node = icc_node_create(TEGRA_ICC_MC);
> +	err = PTR_ERR_OR_ZERO(node);
> +	if (err)
> +		goto del_provider;
> +
> +	node->name = "Memory Controller";
> +	icc_node_add(node, &mc->provider);
> +
> +	/* link Memory Controller to External Memory Controller */
> +	err = icc_link_create(node, TEGRA_ICC_EMC);
> +	if (err)
> +		goto remove_nodes;
> +
> +	for (i = 0; i < num_nodes; i++) {
> +		/* create MC client node */
> +		node = icc_node_create(mc->soc->clients[i].id);
> +		err = PTR_ERR_OR_ZERO(node);
> +		if (err)
> +			goto remove_nodes;
> +
> +		node->name = mc->soc->clients[i].name;
> +		icc_node_add(node, &mc->provider);
> +
> +		/* link Memory Client to Memory Controller */
> +		err = icc_link_create(node, TEGRA_ICC_MC);
> +		if (err)
> +			goto remove_nodes;
> +
> +		data->nodes[i] = node;
> +	}
> +	data->num_nodes = num_nodes;
> +
> +	return 0;
> +
> +remove_nodes:
> +	icc_nodes_remove(&mc->provider);
> +del_provider:
> +	icc_provider_del(&mc->provider);
> +err_msg:
> +	dev_err(mc->dev, "failed to initialize ICC: %d\n", err);
> +
> +	return err;
> +}
> +
>  static int tegra_mc_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
> @@ -702,6 +814,8 @@ static int tegra_mc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	tegra_mc_interconnect_setup(mc);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
> index afa3ba45c9e6..abeb6a2cc36a 100644
> --- a/drivers/memory/tegra/mc.h
> +++ b/drivers/memory/tegra/mc.h
> @@ -115,4 +115,12 @@ extern const struct tegra_mc_soc tegra132_mc_soc;
>  extern const struct tegra_mc_soc tegra210_mc_soc;
>  #endif
>  
> +/*
> + * These IDs are for internal use of Tegra's ICC, the values are chosen
> + * such that they don't conflict with the device-tree ICC node IDs.
> + */
> +#define TEGRA_ICC_EMC		1000
> +#define TEGRA_ICC_EMEM		2000
> +#define TEGRA_ICC_MC		3000
> +
>  #endif /* MEMORY_TEGRA_MC_H */
> diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
> index 1238e35653d1..71de023f9f47 100644
> --- a/include/soc/tegra/mc.h
> +++ b/include/soc/tegra/mc.h
> @@ -7,6 +7,7 @@
>  #define __SOC_TEGRA_MC_H__
>  
>  #include <linux/err.h>
> +#include <linux/interconnect-provider.h>
>  #include <linux/reset-controller.h>
>  #include <linux/types.h>
>  
> @@ -178,6 +179,8 @@ struct tegra_mc {
>  
>  	struct reset_controller_dev reset;
>  
> +	struct icc_provider provider;
> +
>  	spinlock_t lock;
>  };

The rest looks good to me!

Thanks,
Georgi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
