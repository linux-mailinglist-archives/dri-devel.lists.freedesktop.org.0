Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9054B1A743C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 09:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2E589861;
	Tue, 14 Apr 2020 07:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E3689C53
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 12:43:30 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d77so9181955wmd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Apr 2020 05:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BTUVXI9DctOVk+L9CKrvHrPM1tgKqkK29Fg2+XZ+kwU=;
 b=RE4ia3j7Jv9x2M1TlMR9t51ULvrcP4esShTZoSwtkkqsa0yRXrEqDlz9lmN5kuw9vP
 gD1yjeKlvh+qPmztI9GFI6t7Mb/myD98R3sSkT6bp5RHqnO8XnfwnjEuMsQiTcTPUe/2
 Y5uIYleorL3mz8qfyr1ZYDKav/rMDn3+aFeNKYE27jXHgTnpYfshKt8g5GVYQ/Q1pQ5S
 eIcW7rvWt/wZig9SnRDYgIwVbyvYLX5VURdt8pggHvUZIfIr/p5mUf5FNYLaZDr5VY2c
 m1FUKWzkyYsgY5To7cSiM1Z+sLn9AgJcGsx3fayR7g9dwzmRf6NWVm6MTEtjk9JNRxh1
 yH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BTUVXI9DctOVk+L9CKrvHrPM1tgKqkK29Fg2+XZ+kwU=;
 b=s6w5tWk5hb4fBtqhz8PTc0UPBOG6tndadyyvA+olQq+muHdWQVTXGaOJAvzjXTVQT2
 LQ0Uea0BsnCoqxIKbOXy6zFFO+IbEX2T23q7501lMC9ons5Twv8vz2/VkV9NevLc0x6x
 jZDxy6I/oqVUmi8d7uKzm8z8usU2/hIJPHh9w1abOWdQE9ZQVfvxbxpEfpyQl8n8Ksse
 O25kN65bmZslHR7v4Xp3taumCBYzCRhpbjqYNlmqZxw0wZjbbTmr/02S52BJouMXln57
 Hhqy8fY7SP7R2fobwZBPNLajqKGAkXP3Ycf7RsPJlN3X0UboBim6V5s3BzKNBHOM0jCp
 LkHw==
X-Gm-Message-State: AGi0PubmhHD2Pio6oGGNa6AK586HOJ0MG0bS4vLqDqaMzMu43AH8T+Kj
 M5Lc3cVtRazjY+NL95euY5dJyQ==
X-Google-Smtp-Source: APiQypJWlY8Vhb0j9yg4ncMpWfaLBXMsHAHGpuiGaLjbHnBswD5RHtimtxdXhPBkWpbWIybn972WAw==
X-Received: by 2002:a1c:ed18:: with SMTP id l24mr18236614wmh.122.1586781809093; 
 Mon, 13 Apr 2020 05:43:29 -0700 (PDT)
Received: from [192.168.0.136] ([87.120.218.65])
 by smtp.googlemail.com with ESMTPSA id h10sm16582206wrq.33.2020.04.13.05.43.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 Apr 2020 05:43:28 -0700 (PDT)
Subject: Re: [PATCH v2 11/22] memory: tegra: Register as interconnect provider
To: Dmitry Osipenko <digetx@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
 <20200330010904.27643-12-digetx@gmail.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <70f724d6-5cb2-0ebe-ffc1-5dbb77d9dc74@linaro.org>
Date: Mon, 13 Apr 2020 15:43:26 +0300
MIME-Version: 1.0
In-Reply-To: <20200330010904.27643-12-digetx@gmail.com>
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

Thank you for the patchset!

On 3/30/20 04:08, Dmitry Osipenko wrote:
> Now memory controller is a memory interconnection provider. This allows us
> to use interconnect API in order to change memory configuration.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/mc.c | 118 ++++++++++++++++++++++++++++++++++++++
>  drivers/memory/tegra/mc.h |   8 +++
>  include/soc/tegra/mc.h    |   3 +
>  3 files changed, 129 insertions(+)
> 
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index ec8403557ed4..bcf0478c5f5a 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -591,6 +591,117 @@ static __maybe_unused irqreturn_t tegra20_mc_irq(int irq, void *data)
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
> +	mc->provider.data = data;
> +	mc->provider.xlate = of_icc_xlate_onecell;
> +	mc->provider.aggregate = tegra_mc_icc_aggregate;
> +
> +	err = icc_provider_add(&mc->provider);
> +	if (err)
> +		return err;
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
> +
> +del_provider:
> +	icc_provider_del(&mc->provider);
> +
> +	return err;
> +}
> +
>  static int tegra_mc_probe(struct platform_device *pdev)
>  {
>  	struct resource *res;
> @@ -699,6 +810,13 @@ static int tegra_mc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	if (IS_ENABLED(CONFIG_INTERCONNECT)) {

The interconnect framework can be also a module and the then the build will fail.

> +		err = tegra_mc_interconnect_setup(mc);

Maybe register the interconnect provider as a platform sub-device instead?

Thanks,
Georgi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
