Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9260D2AE628
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 03:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DC2898C0;
	Wed, 11 Nov 2020 02:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43731898C0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 02:09:31 +0000 (UTC)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20201111020928epoutp04368ce1163b1d0837592238af177ae64d~GUhVR3Yqs2129921299epoutp049
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 02:09:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20201111020928epoutp04368ce1163b1d0837592238af177ae64d~GUhVR3Yqs2129921299epoutp049
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1605060568;
 bh=Csn/cqRn3+rUu2rUtsuFOoivp5DIY/z59son7POnhhU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=L4nqxU0uET+adSFrWhIKoKPfYfyMADqoGDI4iy+CODNBEUQJj0sP93qFiLinTnCXq
 KIyd6Jfwws5aCECaG6EGKdRz6s3AoFDmAIhdeOd3Isi57niwM3zumjV43kFXGcYD/l
 FC8bxjAigKdSDHhID8clpA0Jctr6YD+NA5fyVSsw=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201111020927epcas1p21b51ddd7de205b331c96a2859fc12671~GUhUguu9F1119211192epcas1p2K;
 Wed, 11 Nov 2020 02:09:27 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.154]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4CW7TJ3lq6zMqYkk; Wed, 11 Nov
 2020 02:09:24 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
 43.94.09577.4D74BAF5; Wed, 11 Nov 2020 11:09:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
 20201111020923epcas1p49951ed258308caa8719e38af71c6b61b~GUhQiErJ72680926809epcas1p4l;
 Wed, 11 Nov 2020 02:09:23 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201111020923epsmtrp22a6b63747203ec5b96faeda8dfe8bb4d~GUhQhKC5Z0448104481epsmtrp24;
 Wed, 11 Nov 2020 02:09:23 +0000 (GMT)
X-AuditID: b6c32a39-c13ff70000002569-5e-5fab47d4cee1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 AA.EC.13470.3D74BAF5; Wed, 11 Nov 2020 11:09:23 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201111020923epsmtip21142f987743c58bcf90b0ca44379b8de~GUhQJ2q8q3219032190epsmtip2m;
 Wed, 11 Nov 2020 02:09:23 +0000 (GMT)
Subject: Re: [PATCH v8 04/26] memory: tegra20-emc: Add devfreq support
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
Message-ID: <964ec213-5d1a-c0aa-28d8-2e16330e36d1@samsung.com>
Date: Wed, 11 Nov 2020 11:23:13 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201111011456.7875-5-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0xTVxTHc/va15ZY9ywyL2yZ8JQY2PhRsHAxQMwQ1wWzQAzEzCzlQd+A
 AG3X1xJlyyYOGFARUAzSASMzZlpGgApCGZWsEBU3hEFhCFQcP1ZiFCY/nGxA1vIw47/POfd7
 7jnf+0OAiR24lyBDqaU1SiqLxN24t3v8ggNsHzTIg1fyvdDC0hwPNbyYAci2uoijKosJR/mG
 77loYKCZj9rmfuSg/vPP+Gi4swZHy6W9ABWvGHD024NYNJF3A0eXGq8A1P9nHCqw9PLR5mgL
 F6111nHRrSd38aPussWxAr7MbLDzZUMP1zGZyViMyyZHu3DZlP4eR1b69QIuu9hqBLJl0zvx
 wo8zI9NpSkFrvGllqkqRoUyLIuNOymPk0rBgSYAkAoWT3koqm44ij52IDziekeU0RXrnUFk6
 ZyqeYhgyKDpSo9Jpae90FaONImm1IksdoQ5kqGxGp0wLTFVlH5EEB4dIncLkzPTHdjOmLg84
 YzD9wT0HOg+WAKEAEodh2cY4KAFuAjHRAeDVuRWcDZYAnB+b4LHBSwCvl9ZyX5f8bBrZLrEA
 WNo8uh0sAjjdVcFzqdyJ49Bo6tla2Es84sIfbmw6NxYIMCIXmtbjXBqc8Ifd82O4i98gfODI
 qxngYhERDbsK+7byXMIXdjZZOC72IJJg3+38bc0e2Fc9uzWRkJBCY4V+izFiHxyf/Y7D8n7Y
 /rwGc80AiTIhbF5dxlkLx2BjXSvGsjt8eq+Vz7IXXF6wbGs+hzf7enG2uAjA1u5BHrsQCruv
 X+awZvxgU2cQm/aB5n9rAdt4N1xYvcBzSSAhgkWFYlZyAA4/sXNY9oTXvinGywFp2GHHsMOC
 YYcFw//N6gHXCN6k1Ux2Gs1I1NKd120CWy/eP6IDVD3/K9AKOAJgBVCAkXtFnEKjXCxSUGdz
 aY1KrtFl0YwVSJ0HXIF5eaSqnF9GqZVLpCGhoaHosCRMKpGQ+0Tr7xbJxUQapaUzaVpNa17X
 cQRCr3Oc0IRYXsPjuhz7RMJifU2KZtK8a0L3KtnXZlDd36zc1YO9d7fl5BGzvqz/WU6taDAy
 UezwFLaht6Y7QizVmSnjvtFNuYmOl9oZvcjjqq3kQdvB2BQPpmR+89En9NDNmITYS5W1G/+8
 mFN85juz9tOXs7cehssqku4g+m3wUd6Jts2aC/Urwr9j9vjpWpYcv5aerc44HxNVdrTdbl1t
 h1LyvudUkltqpuP3oE+n9NqU6OkYNSW8Zi/wCbdYU6p/0XmecQyfHi14/8OWlrG1040j5lzP
 U9/qw/dfPFSeaCorqLcMJK8/TcvT3JHsTjr0xVd5k1iX3FY5dKDK1lp/JezU4AbJZdIpiT+m
 Yaj/AJhtIYJ6BAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsWy7bCSvO5l99XxBjevylu8+/SU1WL1x8eM
 Fle+vmezmL53E5tFy6xFLBbnz29gt9j6dA2TxdmmN+wWl3fNYbP43HuE0aLzyyw2i4unXC1u
 N65gs5i0diqjxdln3hate4+wW/y7tpHF4ueueSwWmx8cY3MQ9nh/o5XdY+esu+wel879YfbY
 tKqTzePOtT1sHve7jzN59Da/Y/Po27KK0ePzJrkAzigum5TUnMyy1CJ9uwSujHt3dzIXTNCt
 mLXpIUsD4y6VLkZODgkBE4mDm64ydjFycQgJ7GaUaF6+mx0iISkx7eJR5i5GDiBbWOLw4WKI
 mrdANS/XMIPUCAu4SazadBisWUTgLovEpB+32EASzAJVEgvXLgazhQQ2M0q8u6wEYrMJaEns
 f3EDLM4voChx9cdjRhCbV8BOYk/bSbA4i4CqxK71e5lAbFGBMImdSx4zQdQISpyc+YQFxOYU
 MJVYNbGbBWKXusSfeZeYIWxxiVtP5jNB2PIS29/OYZ7AKDwLSfssJC2zkLTMQtKygJFlFaNk
 akFxbnpusWGBYV5quV5xYm5xaV66XnJ+7iZGcKxrae5g3L7qg94hRiYOxkOMEhzMSiK8TG2r
 4oV4UxIrq1KL8uOLSnNSiw8xSnOwKInz3ihcGCckkJ5YkpqdmlqQWgSTZeLglGpgKrvIc7v9
 ThGXVV+D1f3tC6IObTGKeKdYHZ95YSbzMgHNXRrduU9fX+W0fvlfuJFba6JlR53R4kkXorvT
 Jx3RMTQqcGC7Md1Twl9iKuvi2VM8z7C8nnFF8N5Sx2s7zh74Ichi+E7KWMT+5rOoJ1f/xbhf
 euC45uXuUjbNu/x7Os8ur1E+wmeyQitTmrvszcoV4Y9sOkRLCm9u7pzcJpU77V+SmfDvT5e/
 an8IDP13mt/GMDe2rXWdiEJ54J6yl4Z5HBcYuG7uyhfSZkqPUWqb/KI4YaXDzlrn7vNHClme
 Ln95Yu89R880e+Xa+Z9ebed+tXm1jvCjje7l4Q9Cd8c+v9H8PJvzUBjjM6P/zrUuSizFGYmG
 WsxFxYkAzjPG9WQDAAA=
X-CMS-MailID: 20201111020923epcas1p49951ed258308caa8719e38af71c6b61b
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201111011522epcas1p2b4933f8332c20de155483f8436736a4c
References: <20201111011456.7875-1-digetx@gmail.com>
 <CGME20201111011522epcas1p2b4933f8332c20de155483f8436736a4c@epcas1p2.samsung.com>
 <20201111011456.7875-5-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On 11/11/20 10:14 AM, Dmitry Osipenko wrote:
> Add devfreq support to the Tegra20 EMC driver. Memory utilization
> statistics will be periodically polled from the memory controller and
> appropriate minimum clock rate will be selected by the devfreq governor.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/Kconfig       |  3 +-
>  drivers/memory/tegra/tegra20-emc.c | 90 ++++++++++++++++++++++++++++++
>  2 files changed, 92 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
> index ac3dfe155505..8cc1ec5be443 100644
> --- a/drivers/memory/tegra/Kconfig
> +++ b/drivers/memory/tegra/Kconfig
> @@ -12,7 +12,8 @@ config TEGRA20_EMC
>  	tristate "NVIDIA Tegra20 External Memory Controller driver"
>  	default y
>  	depends on TEGRA_MC && ARCH_TEGRA_2x_SOC
> -	select PM_OPP
> +	select DEVFREQ_GOV_SIMPLE_ONDEMAND
> +	select PM_DEVFREQ
>  	help
>  	  This driver is for the External Memory Controller (EMC) found on
>  	  Tegra20 chips. The EMC controls the external DRAM on the board.
> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
> index d01b556a6d06..b9cd965980e2 100644
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
> @@ -193,6 +199,8 @@ struct tegra_emc {
>  
>  	/* protect shared rate-change code path */
>  	struct mutex rate_lock;
> +
> +	struct devfreq_simple_ondemand_data ondemand_data;
>  };
>  
>  static irqreturn_t tegra_emc_isr(int irq, void *data)
> @@ -1003,6 +1011,87 @@ static int tegra_emc_init_clk(struct tegra_emc *emc)
>  	return 0;
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
> +	 *  busy_time: number of clocks EMC request was accepted
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
> +	.polling_ms = 30,
> +	.target = tegra_emc_devfreq_target,
> +	.get_dev_status = tegra_emc_devfreq_get_dev_status,
> +};
> +
> +static int tegra_emc_devfreq_init(struct tegra_emc *emc)
> +{
> +	struct devfreq *devfreq;
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
> +	devfreq = devm_devfreq_add_device(emc->dev, &tegra_emc_devfreq_profile,
> +					  DEVFREQ_GOV_SIMPLE_ONDEMAND,
> +					  &emc->ondemand_data);
> +	if (IS_ERR(devfreq)) {
> +		dev_err(emc->dev, "failed to initialize devfreq: %pe", devfreq);
> +		return PTR_ERR(devfreq);
> +	}
> +
> +	return 0;
> +}
> +
>  static int tegra_emc_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np;
> @@ -1058,6 +1147,7 @@ static int tegra_emc_probe(struct platform_device *pdev)
>  	tegra_emc_rate_requests_init(emc);
>  	tegra_emc_debugfs_init(emc);
>  	tegra_emc_interconnect_init(emc);
> +	tegra_emc_devfreq_init(emc);
>  
>  	/*
>  	 * Don't allow the kernel module to be unloaded. Unloading adds some
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
