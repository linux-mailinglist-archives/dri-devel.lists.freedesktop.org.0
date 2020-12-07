Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D072D08C2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 02:18:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF2F889FAD;
	Mon,  7 Dec 2020 01:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2F589FAD
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 01:18:23 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201207011821epoutp04ccc566cd5fee7e44c35e7772094ab9db~OSmH10Rxk2477924779epoutp048
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 01:18:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201207011821epoutp04ccc566cd5fee7e44c35e7772094ab9db~OSmH10Rxk2477924779epoutp048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1607303901;
 bh=7TfmjyBFgY4gjttvRWrYSs8USIfhnAid8/rgKdYtyDg=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=YE3Ivck3wshTTTeYXVSiXoomipJDZm/R/hGge/VqzcA8c7//bVv3jwi7fB8+qcedM
 V4cNcy+fbNhLG5fpMNpjHEazW/G1YMgmf4tkzWNdhLIb1KjgU2lw0RE9O8VResCSII
 QgXK4a8zYAVBT5v0GmQuXIM8bMXF9UEbvp/HruJo=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20201207011821epcas1p1dccd83976be412bbf79f5c64ac2a0eb6~OSmHU-Yf-3249132491epcas1p1W;
 Mon,  7 Dec 2020 01:18:21 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.157]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4Cq56L04wdzMqYkl; Mon,  7 Dec
 2020 01:18:18 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 F6.DE.09577.9D28DCF5; Mon,  7 Dec 2020 10:18:17 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201207011817epcas1p294a176e9b21c1536b54c26b38ca8ba30~OSmD-HOBz2471324713epcas1p2F;
 Mon,  7 Dec 2020 01:18:17 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201207011817epsmtrp28c08e29263a94ebbe6cec7968e5ee1a0~OSmD_DjLb0055400554epsmtrp2f;
 Mon,  7 Dec 2020 01:18:17 +0000 (GMT)
X-AuditID: b6c32a39-bfdff70000002569-5a-5fcd82d9a43c
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 AE.02.13470.9D28DCF5; Mon,  7 Dec 2020 10:18:17 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201207011817epsmtip27d4c4edb43284ecee29be7d2bdafb10b~OSmDmdWiE0365303653epsmtip2Q;
 Mon,  7 Dec 2020 01:18:17 +0000 (GMT)
Subject: Re: [PATCH v11 10/10] PM / devfreq: tegra30: Separate
 configurations per-SoC generation
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
Message-ID: <1c4f7c6f-7fff-60c1-a7b1-a099a88df1c6@samsung.com>
Date: Mon, 7 Dec 2020 10:33:06 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201203192439.16177-11-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xTVxz29F5uW0L1rgIea6J4mYggjwLVgxNiAsNGjSMjOrOHtZS7llHa
 2gtmk2WhIhvlYeaDoaXIZGNUBlM6HsLkEew04EorDkQHDqYypqNokcUHmlGuy/jv+33n953v
 950HDxP+RYh46ZosWq+RqynCG2++tC4i7OYhuyzSaYtCLvc9L1Rp6/NC3z+6A9CvM1MEKmu3
 EuiwqQpHDsd5Lmq6V8dB9kN/c9H1NjOBpktsABkfmwh0rfdN9JvBQqBj9aUA2ce3o/x2Gxe9
 HGzA0dO20zj6cfQyscVXOjWUz5W2mka40v6+WUxqrTUS0uHBi4T096IrHGlJnouQHmmsBdJp
 68pk/rsZm1W0PI3WB9AahTYtXaOMo7anyBJkkg2R4jBxLNpIBWjkmXQclbgjOSwpXT2XjAo4
 IFdnz1HJcoahIuI367XZWXSASstkxVG0Lk2ti9WFM/JMJlujDFdoMzeJIyOjJHON+zJUR/Ie
 Y7rb4R/biobwXFC/phDweZCMgf2OCaIQePOE5AUAK17UvCrcAD5zm7zY4h8Aneeu4YWANy/J
 Ox3N8u0A3sirB2wxBaDbfAx4mpaSqfC4VeHhfcmbOKyxvCQ8fhh5EsDhi4EeTJAhsHNiaJ5f
 Qq6GA0/uzGsFZDx87trroXHydThwtJfjwX7kbtjTfBh4sIB8Dfacujs/D5/cCE0PROzuy+Ct
 u5UcFq+CLZNmzDMCJCv5sL//W8BGToS33J0cFi+F9680clksgtOudoLFOfBsj41gxQUANnY6
 vdiFaNhZfZzjMcbIdfBcWwRLr4atzysAa7wYumaKvdizEsCCz4VsSyC8PjryynY5/OYLI/El
 oEwL0pgWRDAtiGD63+xrgNcCf1rHZCppRqyTLLxrK5h/8yGxF0DZ5MPwbsDhgW4AeRjlKwgS
 2WVCQZr8k4O0XivTZ6tpphtI5s73KCbyU2jnPo0mSyaWREVHR6MY8QaJWEwtE8yGFsiEpFKe
 RWfQtI7W/6fj8PiiXM75IPL+rM94XdWnBW9/tyhouLxa+WFwYfGl0VRnfJXD0NzyojqpXjk+
 ae5R0uO5w++5GJVPiGUkIqEiZttg0Ngv/pI3rhoNm/6sCmzZlVAS9kC/4v13muxtVxuGSqmu
 gt5t+Qbujb71avuBjsyuCdBiKefldlWfka1NLU16FpeSetmmtZQczJF81XvSMbb/9hKfGmGZ
 UYRjZ3dt7Qhds9hZ1JyD7S3a7f5gEdEUbLRG9s5ErRyzrJ/dF/FZX6JhT+UPK07Fmbf+0XNi
 v87vqXX5o2I1rO/Q+O/8KeVheY1OUVdMD7y1dtWJYmNo18zPPsozii390r6Pnhip4D0NVdVm
 71YKZ1RycQimZ+T/AhF2dn98BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRmVeSWpSXmKPExsWy7bCSvO7NprPxBlfWClm8+/SU1WL+kXOs
 Fqs/Pma0uPL1PZvF9L2b2CxaZi1isTh/fgO7xdana5gszja9Ybe4vGsOm8Xn3iOMFp1fZrFZ
 XDzlanG7cQWbxaS1Uxktzj7ztmjde4Td4t+1jSwWP3fNY7HY/OAYm4OIx/sbreweO2fdZfe4
 dO4Ps8emVZ1sHneu7WHzuN99nMmjt/kdm0ffllWMHp83yQVwRnHZpKTmZJalFunbJXBl9DV/
 YS64p1dxpPsGSwPjWtUuRg4OCQETieZ5xl2MXBxCArsZJR58u8HaxcgJFJeUmHbxKDNEjbDE
 4cPFIGEhgbeMEs3HPEFsYYEkiX2/l7CA9IoI3GWRmPTjFhuIwywwg1Hiz4aN7BBTtwF1TG5n
 B2lhE9CS2P/iBhuIzS+gKHH1x2NGkA28AnYSv9/FgYRZBFQkrk48xQRiiwqESexc8hjM5hUQ
 lDg58wkLSDmngLnErNdSIGFmAXWJP/MuMUPY4hK3nsxngrDlJba/ncM8gVF4FpLuWUhaZiFp
 mYWkZQEjyypGydSC4tz03GLDAsO81HK94sTc4tK8dL3k/NxNjOCI19Lcwbh91Qe9Q4xMHIyH
 GCU4mJVEeNWkzsYL8aYkVlalFuXHF5XmpBYfYpTmYFES573QdTJeSCA9sSQ1OzW1ILUIJsvE
 wSnVwNQY/m+hj5TPjYQT9Yq6LL0uZza9unr6huIyy0M+d/bO5NwSnZ92I1t/yzJnxtbTR1w9
 e74sYyuI/h+vYmzO7+Ya8SfrtVbUeuuUzX/FKqcpzO5/lr+rrvO/e4pCmkLrksOqBYdlPeVd
 cq/M1nnJPO97TmTPpN1hZ5IELG/ecfmeHjdv+rRZ+8UZGRbzPRH4H1l8d80NQeOjQXkz5zz8
 yW2X6Bmo8PrzoWf6HVnlDH/W8ZTFXZJMOhbi9YdPJr5ILeDv9Rqp4OhH92cUb7ead/fXa64C
 iwsPzmw0T7oknV+4J+0i/+eim4ffMFxQ/BT8lqMqJ+9V/mdB1R0ml6p23Yz/+8XuSO7Rp3vT
 Vt/NVlBiKc5INNRiLipOBAArhXXnZwMAAA==
X-CMS-MailID: 20201207011817epcas1p294a176e9b21c1536b54c26b38ca8ba30
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201203192730epcas1p1005aa9bcd60748dd9ecc0374349aac8b
References: <20201203192439.16177-1-digetx@gmail.com>
 <CGME20201203192730epcas1p1005aa9bcd60748dd9ecc0374349aac8b@epcas1p1.samsung.com>
 <20201203192439.16177-11-digetx@gmail.com>
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

On 12/4/20 4:24 AM, Dmitry Osipenko wrote:
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
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 68 ++++++++++++++++++++++++-------
>  1 file changed, 54 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 145ef91ae092..117cad7968ab 100644
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
> @@ -779,6 +802,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	if (!tegra)
>  		return -ENOMEM;
>  
> +	tegra->soc = of_device_get_match_data(&pdev->dev);
> +
>  	tegra->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(tegra->regs))
>  		return PTR_ERR(tegra->regs);
> @@ -852,9 +877,9 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
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
> @@ -916,9 +941,24 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
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

Applied it. Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
