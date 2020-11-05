Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF692A754B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 03:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A436E978;
	Thu,  5 Nov 2020 02:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BED6E978
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 02:16:43 +0000 (UTC)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20201105021641epoutp016922a8643c97ff6585e7f5d5423d45fe~Eev6WUirs0589605896epoutp01I
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 02:16:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20201105021641epoutp016922a8643c97ff6585e7f5d5423d45fe~Eev6WUirs0589605896epoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604542601;
 bh=jNvW1QYRp55tS9iML16rKRdyc1jSws940X+qvg5l9sU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=imiHgJQcSbLBhwreovbY4886e3vZr5lWRc94I3QHEd03V6ZFKGnat3Oc1jrEO1PlT
 6L9lPkyW8UZv0zRLMJJmxbRqjx3PqKAMlAj9lFqvuidLykNzFFXs8pr8qQGt26ObbC
 MBTHpOzLGjIa3WXSoVN43ihoGtODw3NsthLVKSFE=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20201105021640epcas1p48c5712936d8c8b5338d6357ddce4e8b6~Eev56-kB90090400904epcas1p4W;
 Thu,  5 Nov 2020 02:16:40 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.154]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4CRRwP742nzMqYm0; Thu,  5 Nov
 2020 02:16:37 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 00.AF.09582.48063AF5; Thu,  5 Nov 2020 11:16:36 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20201105021636epcas1p4ac5ca3b02c51ef248a64c1c659484362~Eev142zY03066930669epcas1p4B;
 Thu,  5 Nov 2020 02:16:36 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201105021636epsmtrp158daa64df16c9d5766645cf7677d3e0a~Eev135Wog0600806008epsmtrp1M;
 Thu,  5 Nov 2020 02:16:36 +0000 (GMT)
X-AuditID: b6c32a37-899ff7000000256e-ed-5fa36084dc06
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 C6.90.08745.48063AF5; Thu,  5 Nov 2020 11:16:36 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201105021635epsmtip2f5833d1c0346068df99822f88e5ea2f6~Eev1gCREa1768217682epsmtip2K;
 Thu,  5 Nov 2020 02:16:35 +0000 (GMT)
Subject: Re: [PATCH v7 36/47] memory: tegra20-emc: Add devfreq support
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
Message-ID: <95e289fc-210c-1f8d-1b24-36e33ce96deb@samsung.com>
Date: Thu, 5 Nov 2020 11:30:32 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201104164923.21238-37-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLJsWRmVeSWpSXmKPExsWy7bCmrm5LwuJ4g+WT1S3efXrKajH/yDlW
 i9UfHzNaXPn6ns1i+t5NbBYtsxaxWJw/v4HdYuvTNUwWZ5vesFtc3jWHzeJz7xFGi84vs9gs
 Lp5ytbjduILNYtLaqYwWZ595W7TuPcJu8e/aRhaLn7vmsVhsfnCMzUHE4/2NVnaPnbPusntc
 OveH2WPTqk42jzvX9rB53O8+zuTR2/yOzaNvyypGj8+b5AI4o7JtMlITU1KLFFLzkvNTMvPS
 bZW8g+Od403NDAx1DS0tzJUU8hJzU22VXHwCdN0yc4A+U1IoS8wpBQoFJBYXK+nb2RTll5ak
 KmTkF5fYKqUWpOQUWBboFSfmFpfmpesl5+daGRoYGJkCFSZkZ0z6to+p4IdexcIzSxgbGD+r
 djFyckgImEg8at/B2MXIxSEksINR4tGWs6wQzidGiffbzrNAOJ+BnF8tTDAt+xofQ1XtYpTY
 uHwJM4TznlFi1ckWRpAqYQE3iU0n5zGBJEQEbrJILF/xjw0kwSwwg1Hizh5lEJtNQEti/4sb
 YHF+AUWJqz8egzXzCthJTHt9GizOIqAi0TL7AJgtKhAmcXJbC1SNoMTJmU9YQGxOAXOJe7PP
 M0PMF5e49WQ+E4QtL7H97Ryw6yQEZnNKnPt/GeoHF4m9D3ZD2cISr45vYYewpSRe9rdB2dUS
 K08eYYNo7mCU2LL/AitEwlhi/9LJQM0cQBs0Jdbv0ocIK0rs/D2XEWIxn8S7rz2sICUSArwS
 HW1CECXKEpcf3IVaKymxuL2TbQKj0iwk78xC8sIsJC/MQli2gJFlFaNYakFxbnpqsWGBMXJ8
 b2IEp3st8x2M095+0DvEyMTBeIhRgoNZSYT3gt+ieCHelMTKqtSi/Pii0pzU4kOMpsAAnsgs
 JZqcD8w4eSXxhqZGxsbGFiaGZqaGhkrivH+0O+KFBNITS1KzU1MLUotg+pg4OKUamK77/zew
 vvZte1iL8mPGx5HvbRh0zprbT3f45V56oy563tFNy+8xOv6fOV0usERfpuNCXw+zTPuG3rQb
 HCx/TU68/uCRavWZbafez4sfZaoci088m/o+cMFxpw2dsr/VGq/O7JtzzjczbUb/n6v6hesy
 Pii9UTg+s0ms4azCvcQzB8UKrx2e2isre+jh9H3dG/ZuEGCZ+JDfi6dKYGF+wzz7pgmuL9J6
 2i9bVzbmB3+xnTk5Vuzkr8X9nVysf89E7g/ouVoqaCEivNUpWefabtloxWPHtgi53d66/8eO
 jfV7ZdTVbZYEnOY52dKo+MNhyYSZB+el19dybvR6maDT/Klb8eqccwr5y63Ez1p93qrEUpyR
 aKjFXFScCADQiVqvgAQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsWy7bCSvG5LwuJ4g0+dvBbvPj1ltZh/5Byr
 xeqPjxktrnx9z2Yxfe8mNouWWYtYLM6f38BusfXpGiaLs01v2C0u75rDZvG59wijReeXWWwW
 F0+5WtxuXMFmMWntVEaLs8+8LVr3HmG3+HdtI4vFz13zWCw2PzjG5iDi8f5GK7vHzll32T0u
 nfvD7LFpVSebx51re9g87ncfZ/LobX7H5tG3ZRWjx+dNcgGcUVw2Kak5mWWpRfp2CVwZk77t
 Yyr4oVex8MwSxgbGz6pdjJwcEgImEvsaH7N2MXJxCAnsYJS4+7iJDSIhKTHt4lHmLkYOIFtY
 4vDhYoiat4wSB/tnM4HUCAu4SWw6OY8JJCEicJdFYtKPW2wgDrPADEaJPxs2skO0bGOU6Po8
 H2wsm4CWxP4XN8BsfgFFias/HjOC2LwCdhLTXp8Gi7MIqEi0zD4AZosKhEnsXPKYCaJGUOLk
 zCcsIDangLnEvdnnmUFsZgF1iT/zLkHZ4hK3nsxngrDlJba/ncM8gVF4FpL2WUhaZiFpmYWk
 ZQEjyypGydSC4tz03GLDAqO81HK94sTc4tK8dL3k/NxNjODI19Lawbhn1Qe9Q4xMHIyHGCU4
 mJVEeC/4LYoX4k1JrKxKLcqPLyrNSS0+xCjNwaIkzvt11sI4IYH0xJLU7NTUgtQimCwTB6dU
 A1Pb09c/+28tN5oyUdM8QpLd//W0idcnL22c/OL7iXBn9w/Km4PPyS5Kubx1sXSz1dzrCtnH
 rlrwH755M/u0gkC6mouKrkvW5c2nBFMStFhSM9YdSmDjTdR+lsB1wvquTOGG77ce31sR/sBI
 5/3E3RnFL0u9N/i9+e26y9R3AbvDvCWuQeXfBGsCU27I+ipflQt+JfNOwrif75TyBLlnXXyl
 5Tr/f8vcipfzknaKVjjZ4nO+LajoX8gCr3dOz7xm8vjompy5vWimfVFKuubTSceVJ2cHn05d
 VNDOJp+0acWvHk7tdZt5rk/4uv/EsmdPne676V+dP9NK4Z+b+nq3kCLdBsYpT3WjjL4sP3xY
 9Y8SS3FGoqEWc1FxIgCnJdkEawMAAA==
X-CMS-MailID: 20201105021636epcas1p4ac5ca3b02c51ef248a64c1c659484362
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201104165200epcas1p1c8f692fa2d5a01c01e4f8aca55462fb2
References: <20201104164923.21238-1-digetx@gmail.com>
 <CGME20201104165200epcas1p1c8f692fa2d5a01c01e4f8aca55462fb2@epcas1p1.samsung.com>
 <20201104164923.21238-37-digetx@gmail.com>
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

On 11/5/20 1:49 AM, Dmitry Osipenko wrote:
> Add devfreq support to the Tegra20 EMC driver. Memory utilization
> statistics will be periodically polled from the memory controller and
> appropriate minimum clock rate will be selected by the devfreq governor.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig       |  2 +
>  drivers/memory/tegra/tegra20-emc.c | 92 ++++++++++++++++++++++++++++++
>  2 files changed, 94 insertions(+)
> 
> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
> index ac3dfe155505..76e9a3b10839 100644
> --- a/drivers/memory/tegra/Kconfig
> +++ b/drivers/memory/tegra/Kconfig
> @@ -12,6 +12,8 @@ config TEGRA20_EMC
>  	tristate "NVIDIA Tegra20 External Memory Controller driver"
>  	default y
>  	depends on TEGRA_MC && ARCH_TEGRA_2x_SOC
> +	select DEVFREQ_GOV_SIMPLE_ONDEMAND
> +	select PM_DEVFREQ
>  	select PM_OPP

nitpick. If you select PM_DEVFREQ, don't need to select 'PM_OPP'
bacause PM_DEVFREQ use OPP as mandatory with 'select PM_OPP' in Kconfig.


>  	help
>  	  This driver is for the External Memory Controller (EMC) found on
> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
> index 5e10aa97809f..9946b957bb01 100644
> --- a/drivers/memory/tegra/tegra20-emc.c
> +++ b/drivers/memory/tegra/tegra20-emc.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/clk/tegra.h>
>  #include <linux/debugfs.h>
> +#include <linux/devfreq.h>
>  #include <linux/err.h>
>  #include <linux/interconnect-provider.h>
>  #include <linux/interrupt.h>
> @@ -102,6 +103,10 @@
>  
>  #define EMC_FBIO_CFG5_DRAM_WIDTH_X16		BIT(4)
>  
> +#define EMC_PWR_GATHER_CLEAR			(1 << 8)
> +#define EMC_PWR_GATHER_DISABLE			(2 << 8)
> +#define EMC_PWR_GATHER_ENABLE			(3 << 8)
> +
>  static const u16 emc_timing_registers[] = {
>  	EMC_RC,
>  	EMC_RFC,
> @@ -157,6 +162,7 @@ struct emc_timing {
>  };
>  
>  enum emc_rate_request_type {
> +	EMC_RATE_DEVFREQ,
>  	EMC_RATE_DEBUG,
>  	EMC_RATE_ICC,
>  	EMC_RATE_TYPE_MAX,
> @@ -193,6 +199,9 @@ struct tegra_emc {
>  
>  	/* protect shared rate-change code path */
>  	struct mutex rate_lock;
> +
> +	struct devfreq_simple_ondemand_data ondemand_data;
> +	struct devfreq *devfreq;
>  };
>  
>  static irqreturn_t tegra_emc_isr(int irq, void *data)
> @@ -952,6 +961,88 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
>  	return err;
>  }
>  
> +static int tegra_emc_devfreq_target(struct device *dev, unsigned long *freq,
> +				    u32 flags)
> +{
> +	struct tegra_emc *emc = dev_get_drvdata(dev);
> +	struct dev_pm_opp *opp;
> +	unsigned long rate;
> +
> +	opp = devfreq_recommended_opp(dev, freq, flags);
> +	if (IS_ERR(opp)) {
> +		dev_err(dev, "failed to find opp for %lu Hz\n", *freq);
> +		return PTR_ERR(opp);
> +	}
> +
> +	rate = dev_pm_opp_get_freq(opp);
> +	dev_pm_opp_put(opp);
> +
> +	return emc_set_min_rate(emc, rate, EMC_RATE_DEVFREQ);
> +}
> +
> +static int tegra_emc_devfreq_get_dev_status(struct device *dev,
> +					    struct devfreq_dev_status *stat)
> +{
> +	struct tegra_emc *emc = dev_get_drvdata(dev);
> +
> +	/* freeze counters */
> +	writel_relaxed(EMC_PWR_GATHER_DISABLE, emc->regs + EMC_STAT_CONTROL);
> +
> +	/*
> +	 * busy_time:  number of clocks EMC request was accepted
> +	 * total_time: number of clocks PWR_GATHER control was set to ENABLE
> +	 */
> +	stat->busy_time = readl_relaxed(emc->regs + EMC_STAT_PWR_COUNT);
> +	stat->total_time = readl_relaxed(emc->regs + EMC_STAT_PWR_CLOCKS);
> +	stat->current_frequency = clk_get_rate(emc->clk);
> +
> +	/* clear counters and restart */
> +	writel_relaxed(EMC_PWR_GATHER_CLEAR, emc->regs + EMC_STAT_CONTROL);
> +	writel_relaxed(EMC_PWR_GATHER_ENABLE, emc->regs + EMC_STAT_CONTROL);
> +
> +	return 0;
> +}
> +
> +static struct devfreq_dev_profile tegra_emc_devfreq_profile = {
> +	.polling_ms	= 30,
> +	.target		= tegra_emc_devfreq_target,
> +	.get_dev_status	= tegra_emc_devfreq_get_dev_status,
> +};
> +
> +static int tegra_emc_devfreq_init(struct tegra_emc *emc)
> +{
> +	int err;
> +
> +	/*
> +	 * PWR_COUNT is 1/2 of PWR_CLOCKS at max, and thus, the up-threshold
> +	 * should be less than 50.  Secondly, multiple active memory clients
> +	 * may cause over 20% of lost clock cycles due to stalls caused by
> +	 * competing memory accesses.  This means that threshold should be
> +	 * set to a less than 30 in order to have a properly working governor.
> +	 */
> +	emc->ondemand_data.upthreshold = 20;
> +
> +	/*
> +	 * Reset statistic gathers state, select global bandwidth for the
> +	 * statistics collection mode and set clocks counter saturation
> +	 * limit to maximum.
> +	 */
> +	writel_relaxed(0x00000000, emc->regs + EMC_STAT_CONTROL);
> +	writel_relaxed(0x00000000, emc->regs + EMC_STAT_LLMC_CONTROL);
> +	writel_relaxed(0xffffffff, emc->regs + EMC_STAT_PWR_CLOCK_LIMIT);
> +
> +	emc->devfreq = devfreq_add_device(emc->dev, &tegra_emc_devfreq_profile,
> +					  DEVFREQ_GOV_SIMPLE_ONDEMAND,
> +					  &emc->ondemand_data);

Do you want to use 'devfreq_add_device' instead of
'devm_devfreq_add_device()'? If you have to use 'devfreq_add_device'
due to some reason, you need to call 'devfreq_remove_device' on exit.

> +	if (IS_ERR(emc->devfreq)) {
> +		err = PTR_ERR(emc->devfreq);
> +		dev_err(emc->dev, "failed to initialize devfreq: %d", err);
> +		return err;
> +	}
> +
> +	return 0;
> +}
> +
>  static int tegra_emc_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np;
> @@ -1019,6 +1110,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
>  	tegra_emc_rate_requests_init(emc);
>  	tegra_emc_debugfs_init(emc);
>  	tegra_emc_interconnect_init(emc);
> +	tegra_emc_devfreq_init(emc);
>  
>  	/*
>  	 * Don't allow the kernel module to be unloaded. Unloading adds some
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
