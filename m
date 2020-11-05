Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE4B2A7540
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 03:09:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD57E6E975;
	Thu,  5 Nov 2020 02:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C346E96C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 02:09:50 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20201105020949epoutp01bbe513fa71ad547abe18763b0d3efdb6~Eep6l4SS23170631706epoutp013
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 02:09:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20201105020949epoutp01bbe513fa71ad547abe18763b0d3efdb6~Eep6l4SS23170631706epoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604542189;
 bh=T3oE1cmazcIh1kO4VFHnnWSaONknVEsxNFutI9V3apo=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=fdWwmtmWm1DxB9C3sjWvVQEZ3WBTr+wFfP1p5Egnt4Effmvlrj/Ue17h9T8aRsVBd
 K00PPGfhp+hsgh6zhrhmPUuJe7RPM5iv9bja4SanqycdZi00eol5UkLG5cS5zgy014
 2iHlbH/NdotcRbSga+QJuY9oSeROwtS2Ns7QPpl4=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201105020947epcas1p1b0f40a1264dd4cb09e7d62486832cf96~Eep5eSrg60054100541epcas1p1p;
 Thu,  5 Nov 2020 02:09:47 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.155]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4CRRmK4R9mzMqYkn; Thu,  5 Nov
 2020 02:09:37 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 7C.1C.63458.BDE53AF5; Thu,  5 Nov 2020 11:09:31 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201105020930epcas1p2d5b4c667c0298f37e86f38e336f0b4d2~Eepo7soT41552615526epcas1p2U;
 Thu,  5 Nov 2020 02:09:30 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201105020930epsmtrp16226568834a0db01a0934955b8272677~Eepo6m7GL0214302143epsmtrp1h;
 Thu,  5 Nov 2020 02:09:30 +0000 (GMT)
X-AuditID: b6c32a36-6dfff7000000f7e2-ce-5fa35edbc019
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 66.EF.08745.9DE53AF5; Thu,  5 Nov 2020 11:09:29 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201105020929epsmtip284e8300b67ee85f58b81124bbd5ae49c~EepogMQJ80971709717epsmtip2Z;
 Thu,  5 Nov 2020 02:09:29 +0000 (GMT)
Subject: Re: [PATCH v7 46/47] PM / devfreq: tegra30: Separate configurations
 per-SoC generation
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi
 Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter
 De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mikko
 Perttunen <cyndis@kapsi.fi>, Viresh Kumar <vireshk@kernel.org>, Peter Geis
 <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Krzysztof
 Kozlowski <krzk@kernel.org>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <4a3682c2-d3cf-151f-4541-6b08d19f8179@samsung.com>
Date: Thu, 5 Nov 2020 11:23:25 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201104164923.21238-47-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTVxzOaW9vb0nYruXhGckcXLYlMnkULB4IoBNHSkQk6shC2OoNvaGE
 vtJbFvYUkVdRcGO6ueoARcdrDAR0wEAmIg8zQcZAXgU2ikFnqcBYfDBc6cWM/77f7/d95zvf
 eRB88UPcg0jRGBi9hlZRuBN29cZWf9/xD8rkAd23nND84qwAlXT2CVD1wgxAvy/bcPRNWz2O
 skwXMNTfXydEV2Z/4KHbmQ+FaLDlHI6WCjoBMv5twtHArXfQ+NEKHBXVnAbo9r29KLutU4hW
 hy9j6ElLMYYaprvwXa4y20i2UNZsMgtlv/Wt8GX1VUZcNjHcisumjnfzZAXH5nFZYWMVkC3V
 b4kTJaSGKRlaweg9GU2SVpGiSQ6n9h6UR8qlwQESX0kI2kF5amg1E07tiYnzjUpR2ZNRnh/S
 qjR7K45mWco/IkyvTTMwnkotawinGJ1CpQvR+bG0mk3TJPsladWhkoCAQKmdeDhVac7/ka8b
 8ku/nqvPABffyAciApLb4c2M03g+cCLEZBOAf5UXCbhiEUDrxFMhVywBmJ25ynshqRlZ4XOD
 FgBzsgowrrABWHBxCl9juZA0LC8vdgxcyVEMllesOgZ88gyAE63eaxgnfWD73Iij/zLpBYce
 z4A17ExGwOnMagfGyNdhcd+v2Bp2I+Nh79Wsdc4m2PutxdEXkTtgpqlhff3NcMxSwuPwa/An
 6znHViF5VgR7upYxLsMe2Dn3QMBhF/igu1HIYQ94/2TOOv4EVvZ24pw4D8DG9jvrgiDYfukr
 uwNhd9gKa1v8ubYXbH72HeCMX4LzyycEaxRIOsO8HDFH8YaD0+b1Y3wFluUa8S8AZdoQx7Qh
 gmlDBNP/ZqUAqwLujI5VJzOsRBe48brrgePZ+wQ3gSLrI78OwCNAB4AEn3J1vhN7QS52VtAf
 fczotXJ9mophO4DUfsBf8j3ckrT2f6MxyCXSwKCgILRdEiyVSKjNzitv5cnFZDJtYFIZRsfo
 X+h4hMgjg+cFdurMC1XMtFqyr0V0yPg8dnRbpNqffBa+e2pEvX8x8ftDh2Mqqu/NgilvnmGp
 tP+SdPL93V8LdkZobxbylL8cJyKt/w4eCGmNDsu8EbHw6rh7fOUJtxkDc906EbxcWOs6dHD/
 n1NRRaeG4+J/jo0eqzkjiH7zctfAc9sm7/uK0tGyUI15W3OPrd76+XJzYAHIeeIUQ6Xxgsqv
 ndyVTlQ2WT4jpOzjowMhg2xCVGp63ZW6Y259n/5RYjz/KASGp7x3iux91+J3rddCHVmaPjCn
 yG840vNP7nlPy4jaJ7kosW1UXps4JnankzwY05ZRl6fVoXcn5+9GYPFvKxNCU/FJCmOVtMSH
 r2fp/wAuvkA+fwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ra0hTYRjHeXeOZ0fDOk6jdwpZy5rNmqlFLzkkiuhIGEVYIaQtPWmoc2xa
 GQRm1tCo7Ko76cySDC/bnGWWrkztYug03XJZXmIqjrRVFhas2zYCv/3e5///Pc+Hl8R4g3gg
 eUSWzShk0gwB4YM3dQiC175NvJ20TjuA0KevE16ootPkhWq/2AAyf3cQqMRoIFABewtHvb16
 Lro/UcdBPfnTXDTwqIxAs+c7ASr8xhLo9att6N2puwS6XH8NoJ7JHeiMsZOLfr9pwNHPRxoc
 NY49JzYH0A7rGS79kB3m0v0mJ0YbagoJ+v2bVoIePfeCQ58//YmgL9yrAfSsYeku7wQfSQqT
 ceQoowiPOeiTNlykxeQW8fGnKkUeqFpZBLxJSK2H9VYnVgR8SB7VDOCvx384noAPr79+9i8g
 /7E/7OhQejozAM5etOOujj8lhdXVGtwVBFDDOLz8Y4hwPTCqFECnvoHrUZoALNdd9XIpBCWC
 T6ashIsXUcuh5YcNuNiXioFj+bVuxqkQqDF1u08spvbCh1U2jqfjB7vU4+65N7UR5rON7j0Y
 JYROTT/m4SVwaLyC4+Fg+GCmDCsG/uw8nZ2nsPMUdp5yE+A1gM/IlZmpmcoIeaSMOSZWSjOV
 ObJUcXJWpgG4/14kagatNZ/F7YBDgnYASUwQ4Nu381YSzzdFmnuCUWQlKXIyGGU7CCJxwRLf
 72xlIo9KlWYz6QwjZxT/Uw7pHZjHCY1eZ1zdlj4XFj0X6zcoMseoc0NqxydNDp0zr0z4Nm+b
 WmW19U9Z9A2yyW4NHJnD1Ptv+GmrBg8bl6eHj4R218VOxjWX9i19aT0anHh2bdQKSdBpdXdO
 cnpJkyTw5s4Jx5qKky1ZE1fM24XFWzbs49Vt7Wo/oJcX6joq7Jsc5mfv9lA2taGvIMyybBhX
 xy9jdUMzu8P8p1Wjwa3TljsL0srb+FHC5kiJffPCro+xRqJXU3apUqCrPqc1m0h5yJNXRQkr
 VHBV5futQfkj30pTcsT6a9b7B1uq++Nzh6JDVZLiO4ewtl92rVDkiOTz2fIM1BBXkBpY8lXw
 wT4lwJVp0ggRplBK/wL2veH7agMAAA==
X-CMS-MailID: 20201105020930epcas1p2d5b4c667c0298f37e86f38e336f0b4d2
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201104165119epcas1p49fcab2953eeb5cdd3f4857c804b78a2c
References: <20201104164923.21238-1-digetx@gmail.com>
 <CGME20201104165119epcas1p49fcab2953eeb5cdd3f4857c804b78a2c@epcas1p4.samsung.com>
 <20201104164923.21238-47-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 11/5/20 1:49 AM, Dmitry Osipenko wrote:
> Previously we were using count-weight of the T124 for T30 in order to
> get EMC clock rate that was reasonable for T30. In fact the count-weight
> should be x2 times smaller on T30, but then devfreq was producing a bit
> too low EMC clock rate for ISO memory clients, like display controller
> for example.
> 
> Now both Tegra ACTMON and Tegra DRM display drivers support interconnect
> framework and display driver tells to ICC what a minimum memory bandwidth
> is needed, preventing FIFO underflows. Thus, now we can use a proper
> count-weight value for Tegra30 and MC_ALL device config needs a bit more
> aggressive boosting.
> 
> Add a separate ACTMON driver configuration that is specific to Tegra30.
> 
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 68 ++++++++++++++++++++++++-------
>  1 file changed, 54 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 4db027ca17e1..aaa22077815c 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -57,13 +57,6 @@
>  #define ACTMON_BELOW_WMARK_WINDOW				3
>  #define ACTMON_BOOST_FREQ_STEP					16000
>  
> -/*
> - * Activity counter is incremented every 256 memory transactions, and each
> - * transaction takes 4 EMC clocks for Tegra124; So the COUNT_WEIGHT is
> - * 4 * 256 = 1024.
> - */
> -#define ACTMON_COUNT_WEIGHT					0x400
> -
>  /*
>   * ACTMON_AVERAGE_WINDOW_LOG2: default value for @DEV_CTRL_K_VAL, which
>   * translates to 2 ^ (K_VAL + 1). ex: 2 ^ (6 + 1) = 128
> @@ -111,7 +104,7 @@ enum tegra_actmon_device {
>  	MCCPU,
>  };
>  
> -static const struct tegra_devfreq_device_config actmon_device_configs[] = {
> +static const struct tegra_devfreq_device_config tegra124_device_configs[] = {
>  	{
>  		/* MCALL: All memory accesses (including from the CPUs) */
>  		.offset = 0x1c0,
> @@ -133,6 +126,28 @@ static const struct tegra_devfreq_device_config actmon_device_configs[] = {
>  	},
>  };
>  
> +static const struct tegra_devfreq_device_config tegra30_device_configs[] = {
> +	{
> +		/* MCALL: All memory accesses (including from the CPUs) */
> +		.offset = 0x1c0,
> +		.irq_mask = 1 << 26,
> +		.boost_up_coeff = 200,
> +		.boost_down_coeff = 50,
> +		.boost_up_threshold = 20,
> +		.boost_down_threshold = 10,
> +	},
> +	{
> +		/* MCCPU: memory accesses from the CPUs */
> +		.offset = 0x200,
> +		.irq_mask = 1 << 25,
> +		.boost_up_coeff = 800,
> +		.boost_down_coeff = 40,
> +		.boost_up_threshold = 27,
> +		.boost_down_threshold = 10,
> +		.avg_dependency_threshold = 16000, /* 16MHz in kHz units */
> +	},
> +};
> +
>  /**
>   * struct tegra_devfreq_device - state specific to an ACTMON device
>   *
> @@ -155,6 +170,12 @@ struct tegra_devfreq_device {
>  	unsigned long target_freq;
>  };
>  
> +struct tegra_devfreq_soc_data {
> +	const struct tegra_devfreq_device_config *configs;
> +	/* Weight value for count measurements */
> +	unsigned int count_weight;
> +};
> +
>  struct tegra_devfreq {
>  	struct devfreq		*devfreq;
>  	struct opp_table	*opp_table;
> @@ -171,11 +192,13 @@ struct tegra_devfreq {
>  	struct delayed_work	cpufreq_update_work;
>  	struct notifier_block	cpu_rate_change_nb;
>  
> -	struct tegra_devfreq_device devices[ARRAY_SIZE(actmon_device_configs)];
> +	struct tegra_devfreq_device devices[2];
>  
>  	unsigned int		irq;
>  
>  	bool			started;
> +
> +	const struct tegra_devfreq_soc_data *soc;
>  };
>  
>  struct tegra_actmon_emc_ratio {
> @@ -488,7 +511,7 @@ static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
>  	tegra_devfreq_update_avg_wmark(tegra, dev);
>  	tegra_devfreq_update_wmark(tegra, dev);
>  
> -	device_writel(dev, ACTMON_COUNT_WEIGHT, ACTMON_DEV_COUNT_WEIGHT);
> +	device_writel(dev, tegra->soc->count_weight, ACTMON_DEV_COUNT_WEIGHT);
>  	device_writel(dev, ACTMON_INTR_STATUS_CLEAR, ACTMON_DEV_INTR_STATUS);
>  
>  	val |= ACTMON_DEV_CTRL_ENB_PERIODIC;
> @@ -787,6 +810,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	if (!tegra)
>  		return -ENOMEM;
>  
> +	tegra->soc = of_device_get_match_data(&pdev->dev);
> +
>  	tegra->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(tegra->regs))
>  		return PTR_ERR(tegra->regs);
> @@ -866,9 +891,9 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  
>  	tegra->max_freq = rate / KHZ;
>  
> -	for (i = 0; i < ARRAY_SIZE(actmon_device_configs); i++) {
> +	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++) {
>  		dev = tegra->devices + i;
> -		dev->config = actmon_device_configs + i;
> +		dev->config = tegra->soc->configs + i;
>  		dev->regs = tegra->regs + dev->config->offset;
>  	}
>  
> @@ -933,9 +958,24 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct tegra_devfreq_soc_data tegra124_soc = {
> +	.configs = tegra124_device_configs,
> +
> +	/*
> +	 * Activity counter is incremented every 256 memory transactions,
> +	 * and each transaction takes 4 EMC clocks.
> +	 */
> +	.count_weight = 4 * 256,
> +};
> +
> +static const struct tegra_devfreq_soc_data tegra30_soc = {
> +	.configs = tegra30_device_configs,
> +	.count_weight = 2 * 256,
> +};
> +
>  static const struct of_device_id tegra_devfreq_of_match[] = {
> -	{ .compatible = "nvidia,tegra30-actmon" },
> -	{ .compatible = "nvidia,tegra124-actmon" },
> +	{ .compatible = "nvidia,tegra30-actmon",  .data = &tegra30_soc, },
> +	{ .compatible = "nvidia,tegra124-actmon", .data = &tegra124_soc, },
>  	{ },
>  };
>  
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
