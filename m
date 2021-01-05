Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EFA2EA409
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 04:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C55589CDE;
	Tue,  5 Jan 2021 03:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8375189CD9;
 Tue,  5 Jan 2021 03:47:54 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id m12so69495169lfo.7;
 Mon, 04 Jan 2021 19:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=h3dbOszFbt6OQaWtwfejouXLhmx5RSkLak0dmAl0EsE=;
 b=X2HIPa+2nYHaUq4baszZeg/1lPwfRlrkiazbu8bWAZ/4KVDEZZ8UJLHkCiHzu5BoPv
 +d1r6dGtLI/e5iSeLti/uFDhKLFXF3tY06Jdc3OuTB+60jcWy7nbxvR/X/sbuy5Z2y0a
 zy9Qm2wdvLKFzbzpL5PwnIXh21X/23EVG7mYWxKtxfix082rS5faNNu/pQ57no+v4JD+
 BaQRjUTLWwn1bDT7po749l/CDI6APyFbpmhm4QydCPb2EdRw7tEUospHsYRRgYR6FHym
 oOmjm0bgU9pTqMTv2DoYi3myavoG+000acurgbb4dfthX9S8jl7kSgIjjgmMtRlfqb7V
 Jf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=h3dbOszFbt6OQaWtwfejouXLhmx5RSkLak0dmAl0EsE=;
 b=pl9xiQKOuIXk7Jr4skx443LMCa1gO28aHpOMCY/U+OD1N4SXVGjRNaVEh/KnpRklxQ
 ULEGXc5w3XdKlk1JScQe2xO7j21KUKxHvTYv+BywHuyJwsPGwvWjhAuudZ6ozwQe2oax
 byuljt8gKi5sHeW3jog4q3lePEvGSgPWTs4UzU8z7BVVnJo7sQU6+mu9/rVjdwj5wiw6
 mUOG/isko2O5I4YxNF7cTcfaUM0eAHODVe1K888fhJH2S0TkQ3cL8+aMxPN1sgux2W3T
 5KFAMFtRu8XIFGyHiQo0UVJVGp0YsGcot1opATvZjUqeCEf5scZsCv6mOaAiGeP0NL2X
 57vA==
X-Gm-Message-State: AOAM5316qr55gV4EqoAIlclLLizIvRZFDGfO+kj4hlMha5FwWUlX3VPj
 FmMin5EpFRxS+L4+6q7oC09WR4G8rpC2iWHeN6I=
X-Google-Smtp-Source: ABdhPJycvDA2y0kJZnyrX/YoD11eP5GdGX7X4MHU9HChkkRYsRnd6ay+qNKHQmx0en+WU3/yCpN8x9PBPa2srmvjcdU=
X-Received: by 2002:a19:6b0d:: with SMTP id d13mr32595793lfa.63.1609818472823; 
 Mon, 04 Jan 2021 19:47:52 -0800 (PST)
MIME-Version: 1.0
References: <20210103035445.23696-1-tiny.windzz@gmail.com>
In-Reply-To: <20210103035445.23696-1-tiny.windzz@gmail.com>
From: Chanwoo Choi <cwchoi00@gmail.com>
Date: Tue, 5 Jan 2021 12:47:16 +0900
Message-ID: <CAGTfZH0sLh=8XhBVOzUr9qO2w_=jp-OuWoh5vgNpnmXq6EzYHA@mail.gmail.com>
Subject: Re: [PATCH 26/31] PM / devfreq: tegra30: convert to use devm_pm_opp_*
 API
To: Yangtao Li <tiny.windzz@gmail.com>
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
Cc: Nishanth Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 gustavoars@kernel.org, jirislaby@kernel.org, David Airlie <airlied@linux.ie>,
 linux-mmc@vger.kernel.org, stanimir.varbanov@linaro.org, tanmay@codeaurora.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, natechancellor@gmail.com,
 Thierry Reding <thierry.reding@gmail.com>, tongtiangen@huawei.com,
 Guenter Roeck <groeck@chromium.org>, marijn.suijten@somainline.org,
 Dmitry Osipenko <digetx@gmail.com>, steven.price@arm.com,
 Matthias Kaehlcke <mka@chromium.org>, chandanu@codeaurora.org,
 emil.velikov@collabora.com,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, jonathan@marek.ca,
 harigovi@codeaurora.org, adrian.hunter@intel.com,
 Viresh Kumar <vireshk@kernel.org>, Linux PM list <linux-pm@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 alyssa.rosenzweig@collabora.com, linux-serial@vger.kernel.org,
 airlied@redhat.com, smasetty@codeaurora.org, dl-linux-imx <linux-imx@nxp.com>,
 freedreno@lists.freedesktop.org, kernel@pengutronix.de, tzimmermann@suse.de,
 linux-arm-msm@vger.kernel.org, s.hauer@pengutronix.de,
 linux-spi@vger.kernel.org, linux-media@vger.kernel.org,
 abhinavk@codeaurora.org, akhilpo@codeaurora.org, khsieh@codeaurora.org,
 lima@lists.freedesktop.org, Mark Brown <broonie@kernel.org>,
 rikard.falkeborn@gmail.com, kalyan_t@codeaurora.org,
 linux-tegra@vger.kernel.org, varar@codeaurora.org, mchehab@kernel.org,
 sean@poorly.run, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, akashast@codeaurora.org,
 rnayak@codeaurora.org, parashar@codeaurora.org, tomeu.vizoso@collabora.com,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, agross@kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>, miaoqinglang@huawei.com,
 hoegsberg@google.com, yuq825@gmail.com, ddavenport@chromium.org,
 masneyb@onstation.org, Shawn Guo <shawnguo@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>, Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sun, Jan 3, 2021 at 12:57 PM Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> Use devm_pm_opp_* API to simplify code, and remove opp_table
> from tegra_devfreq.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 117cad7968ab..4984cb91e9ea 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -178,7 +178,6 @@ struct tegra_devfreq_soc_data {
>
>  struct tegra_devfreq {
>         struct devfreq          *devfreq;
> -       struct opp_table        *opp_table;
>
>         struct reset_control    *reset;
>         struct clk              *clock;
> @@ -794,6 +793,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>         struct tegra_devfreq_device *dev;
>         struct tegra_devfreq *tegra;
>         struct devfreq *devfreq;
> +       struct opp_tabl *opp_table;

opp_tabl -> opp_table. It will make the build error. Please do build
test at least.

>         unsigned int i;
>         long rate;
>         int err;
> @@ -841,25 +841,25 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>                 return err;
>         }
>
> -       tegra->opp_table = dev_pm_opp_set_supported_hw(&pdev->dev,
> -                                                      &hw_version, 1);
> -       err = PTR_ERR_OR_ZERO(tegra->opp_table);
> +       opp_table = devm_pm_opp_set_supported_hw(&pdev->dev,
> +                                                &hw_version, 1);
> +       err = PTR_ERR_OR_ZERO(opp_table);
>         if (err) {
>                 dev_err(&pdev->dev, "Failed to set supported HW: %d\n", err);
>                 return err;
>         }
>
> -       err = dev_pm_opp_of_add_table(&pdev->dev);
> +       err = devm_pm_opp_of_add_table(&pdev->dev);
>         if (err) {
>                 dev_err(&pdev->dev, "Failed to add OPP table: %d\n", err);
> -               goto put_hw;
> +               return err;
>         }
>
>         err = clk_prepare_enable(tegra->clock);
>         if (err) {
>                 dev_err(&pdev->dev,
>                         "Failed to prepare and enable ACTMON clock\n");
> -               goto remove_table;
> +               return err;
>         }
>
>         err = reset_control_reset(tegra->reset);
> @@ -917,10 +917,6 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>         reset_control_reset(tegra->reset);
>  disable_clk:
>         clk_disable_unprepare(tegra->clock);
> -remove_table:
> -       dev_pm_opp_of_remove_table(&pdev->dev);
> -put_hw:
> -       dev_pm_opp_put_supported_hw(tegra->opp_table);

You might remove the 'devm_pm_opp_remove_all_dynamic(&pdev->dev)
under ' remove_opp' goto statement.kkkk


(snip)
-- 
Best Regards,
Chanwoo Choi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
