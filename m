Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72342A1EF4
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 16:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5393C6EABB;
	Sun,  1 Nov 2020 15:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8866EABB
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 15:21:08 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id v6so14056817lfa.13
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 07:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=l6U4mt6cc8zKvtqYWHbpdSGyNh0QIQjh4ts+r6rCbow=;
 b=swubwzwTJ0eqhKQylBBcma68w9odt91uJEL8OdrPtFiczaF1HZMN1mXTvwXqxDfMH/
 jFNVWeaLbly6SGLhLrFf0VQi/8F5s7QBTYl51TmgZ/ywlcN1s67NI/r3ZyukolEA1FOt
 SMFMDITwfWjEYUV0xBDAtHxofKww+x+UB/XKCgbzpX9cKqeYN2fqJD2ybVde+A+i4nB5
 GqDsjVYvmajkxNRDL3aLY8TcJQXdbh3Vk7mGJWwv1MqDZajGpNDMNA1T6Epkc731gGS8
 cOd7s7ZAZR2Hsy922EtJRGaGXgXlfVnUJfuCnx69/gGdiojzzfTEi1INmaIEL1MVs57d
 Xkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=l6U4mt6cc8zKvtqYWHbpdSGyNh0QIQjh4ts+r6rCbow=;
 b=G3IylEncNTCZGnXpgSLUl+Q90V0r53lmE6frqeoJNCcM48uu83HLHzfrCjL8vb+T/d
 fiPk+4IDTWiV8DkAasKyOFAkE6w4J/joC+Kwm5T2vHGgGuwxbittOI4clmhDZDiiEmN2
 EjOOIuzUNXK5XP1QBNhkeLQ8xQkPn00rxC+DpeOjvXyNjXWanOH8/4LcT1EcYkWcZFgP
 MMcidzKwZeKG0AdMd4tDq6m33aV2VregBU/suT9UiXik9BMsS42vF38Ggl/uhqgzUbOI
 /jTvUEEhS8mHGfVghNG2ciuYys1x+mc/M5OMQ8b1C2i3Ge1S/+rdXurHavHZIqB6rY7A
 WO2w==
X-Gm-Message-State: AOAM532VQF1a9RHdheeXWM9ZzJvcnddR/Hc3xW0TauKOVQEZNFyAeJVh
 2DdH6gEHqI5ILD1eoSx/xM54CIsIMPU7wVA/Mf8=
X-Google-Smtp-Source: ABdhPJxwKfMJARsDfklKWP3iB+ZdWWniDfE16SotNmjrmd+tNlXHWJHkFN0iL0I6Ui0m13r1uidpKP609wekiwDqAcA=
X-Received: by 2002:a19:40ca:: with SMTP id n193mr3870771lfa.96.1604244067107; 
 Sun, 01 Nov 2020 07:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-53-digetx@gmail.com>
In-Reply-To: <20201025221735.3062-53-digetx@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Mon, 2 Nov 2020 00:20:30 +0900
Message-ID: <CAGTfZH2RZ2OKUPsHcLafpEa6JMPPApfg5BmWR0ViJyGc9KuGOQ@mail.gmail.com>
Subject: Re: [PATCH v6 52/52] PM / devfreq: tegra30: Separate configurations
 per-SoC generation
To: Dmitry Osipenko <digetx@gmail.com>
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
Reply-To: cwchoi00@gmail.com
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

I added the review about 'ARRAY_SIZE(tegra124_device_configs)'.
Except for this, it looks good to me.

On Mon, Oct 26, 2020 at 7:21 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
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
> This patch adds a separate ACTMON driver configuration that is specific
> to Tegra30.
>
> Tested-by: Peter Geis <pgwipeout@gmail.com>
> Tested-by: Nicolas Chauvet <kwizart@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 68 ++++++++++++++++++++++++-------
>  1 file changed, 54 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 1b0b91a71886..95aba89eae88 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -57,13 +57,6 @@
>  #define ACTMON_BELOW_WMARK_WINDOW                              3
>  #define ACTMON_BOOST_FREQ_STEP                                 16000
>
> -/*
> - * Activity counter is incremented every 256 memory transactions, and each
> - * transaction takes 4 EMC clocks for Tegra124; So the COUNT_WEIGHT is
> - * 4 * 256 = 1024.
> - */
> -#define ACTMON_COUNT_WEIGHT                                    0x400
> -
>  /*
>   * ACTMON_AVERAGE_WINDOW_LOG2: default value for @DEV_CTRL_K_VAL, which
>   * translates to 2 ^ (K_VAL + 1). ex: 2 ^ (6 + 1) = 128
> @@ -111,7 +104,7 @@ enum tegra_actmon_device {
>         MCCPU,
>  };
>
> -static const struct tegra_devfreq_device_config actmon_device_configs[] = {
> +static const struct tegra_devfreq_device_config tegra124_device_configs[] = {
>         {
>                 /* MCALL: All memory accesses (including from the CPUs) */
>                 .offset = 0x1c0,
> @@ -133,6 +126,28 @@ static const struct tegra_devfreq_device_config actmon_device_configs[] = {
>         },
>  };
>
> +static const struct tegra_devfreq_device_config tegra30_device_configs[] = {
> +       {
> +               /* MCALL: All memory accesses (including from the CPUs) */
> +               .offset = 0x1c0,
> +               .irq_mask = 1 << 26,
> +               .boost_up_coeff = 200,
> +               .boost_down_coeff = 50,
> +               .boost_up_threshold = 20,
> +               .boost_down_threshold = 10,
> +       },
> +       {
> +               /* MCCPU: memory accesses from the CPUs */
> +               .offset = 0x200,
> +               .irq_mask = 1 << 25,
> +               .boost_up_coeff = 800,
> +               .boost_down_coeff = 40,
> +               .boost_up_threshold = 27,
> +               .boost_down_threshold = 10,
> +               .avg_dependency_threshold = 16000, /* 16MHz in kHz units */
> +       },
> +};
> +
>  /**
>   * struct tegra_devfreq_device - state specific to an ACTMON device
>   *
> @@ -155,6 +170,12 @@ struct tegra_devfreq_device {
>         unsigned long target_freq;
>  };
>
> +struct tegra_devfreq_soc_data {
> +       const struct tegra_devfreq_device_config *configs;
> +       /* Weight value for count measurements */
> +       unsigned int count_weight;
> +};
> +
>  struct tegra_devfreq {
>         struct devfreq          *devfreq;
>         struct opp_table        *opp_table;
> @@ -171,11 +192,13 @@ struct tegra_devfreq {
>         struct delayed_work     cpufreq_update_work;
>         struct notifier_block   cpu_rate_change_nb;
>
> -       struct tegra_devfreq_device devices[ARRAY_SIZE(actmon_device_configs)];
> +       struct tegra_devfreq_device devices[ARRAY_SIZE(tegra124_device_configs)];

When there is one tegra_devfreq_device_config[] array, this style is not wrong.
But, after adding the specific config array for each device,
you better specify the correct array size for each case.

Even if there is no runtime error on tegra30 soc, it is not proper to use
ARRAY_SIZE(tegra124_device_configs). You can allocate the array
of tegra_devfreq_device[] or use fixed the array size (2).

>
>         unsigned int            irq;
>
>         bool                    started;
> +
> +       const struct tegra_devfreq_soc_data *soc;
>  };
>
>  struct tegra_actmon_emc_ratio {
> @@ -488,7 +511,7 @@ static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
>         tegra_devfreq_update_avg_wmark(tegra, dev);
>         tegra_devfreq_update_wmark(tegra, dev);
>
> -       device_writel(dev, ACTMON_COUNT_WEIGHT, ACTMON_DEV_COUNT_WEIGHT);
> +       device_writel(dev, tegra->soc->count_weight, ACTMON_DEV_COUNT_WEIGHT);
>         device_writel(dev, ACTMON_INTR_STATUS_CLEAR, ACTMON_DEV_INTR_STATUS);
>
>         val |= ACTMON_DEV_CTRL_ENB_PERIODIC;
> @@ -781,6 +804,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>         if (!tegra)
>                 return -ENOMEM;
>
> +       tegra->soc = of_device_get_match_data(&pdev->dev);
> +
>         tegra->regs = devm_platform_ioremap_resource(pdev, 0);
>         if (IS_ERR(tegra->regs))
>                 return PTR_ERR(tegra->regs);
> @@ -858,9 +883,9 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>
>         tegra->max_freq = rate / KHZ;
>
> -       for (i = 0; i < ARRAY_SIZE(actmon_device_configs); i++) {
> +       for (i = 0; i < ARRAY_SIZE(tegra124_device_configs); i++) {

ditto. Use ARRARY_SIZE(soc->configs) instead of
ARRAY_SIZE(tegra124_device_configs).

>                 dev = tegra->devices + i;
> -               dev->config = actmon_device_configs + i;
> +               dev->config = tegra->soc->configs + i;
>                 dev->regs = tegra->regs + dev->config->offset;
>         }
>
> @@ -925,9 +950,24 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static const struct tegra_devfreq_soc_data tegra124_soc = {
> +       .configs = tegra124_device_configs,
> +
> +       /*
> +        * Activity counter is incremented every 256 memory transactions,
> +        * and each transaction takes 4 EMC clocks.
> +        */
> +       .count_weight = 4 * 256,
> +};
> +
> +static const struct tegra_devfreq_soc_data tegra30_soc = {
> +       .configs = tegra30_device_configs,
> +       .count_weight = 2 * 256,
> +};
> +
>  static const struct of_device_id tegra_devfreq_of_match[] = {
> -       { .compatible = "nvidia,tegra30-actmon" },
> -       { .compatible = "nvidia,tegra124-actmon" },
> +       { .compatible = "nvidia,tegra30-actmon",  .data = &tegra30_soc, },
> +       { .compatible = "nvidia,tegra124-actmon", .data = &tegra124_soc, },
>         { },
>  };
>
> --
> 2.27.0
>


-- 
Best Regards,
Chanwoo Choi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
