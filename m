Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA0E2AEA9E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451506E02E;
	Wed, 11 Nov 2020 07:56:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C6F989DCF
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 05:45:45 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id b23so148713pju.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 21:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tW5eWnXuvaPQysY5F4/p1CXf/0e354oeDmt853ri8UM=;
 b=zmIQDeCZG18/faKuhY2+fauFnbQcPnSt0T+wqaMFQqvNh/3/uCWxU4BuI2cXcAvWSd
 RT23iTKj17Iz2042g8c9dBnJT1zAI8zCbL0Aw9BlF80AxWBzM+nEeDdmnVyWg17erRVJ
 +aqyrrYdjAyehM9Dr+Q6clgUThw5muES7qGOWXgh4r6jarPOiTwG+nr46pUhYnj+rLdb
 5Gwyms0eYwNcCAo81zqW/dEzFDAW4YGYahifmWHtrbDQNdwL4PA3oKhGBYNLcwGL8LqS
 HMIO7p3QrZqg+0QaeqeFdCYOa2gjKeVTfn/hxEypz3z5CQLPQt4JZqNAddHEg1p1b4qj
 tj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tW5eWnXuvaPQysY5F4/p1CXf/0e354oeDmt853ri8UM=;
 b=DL2XORTLhPXoaGnBVi5ume1f1sQN4/E4yueACmPtv/w9Xz7bxn+v+eHoryehqIhsV5
 HCfd2UiEFTKZYdcFSC7hJcYUI6K1cBfff0sGAwxMmh2wm4ifRvSF1Ot2h6wVfwA5sR+r
 VrluswuRs2UVg8YVT3MIIV5nkcBXXwKCU6MJkwWydToyH+oIaEbOA58k7XFtL8Q+QKmO
 gjZZgR86QHkotUni8anmUzDpm9AagsjZQUqNlIrAfe8acduM1I4Q+goQ3Uai1/uEm4zb
 AwzVTCiHj8tU+dJFp/VzfihTjooJHZj6SlMKzI/UdYGxNG9+X0zH/Vp+DreK/VHMvVxf
 CZrA==
X-Gm-Message-State: AOAM530N0QVukLsThdx7m83jygg2Kc3SJ+jqU+1CzqleXWLKKa+3Ezvt
 ubZalWtAjQ/U8G5LWtnGTJazLg==
X-Google-Smtp-Source: ABdhPJxF017zDNxi4Sg5i6CUySBJ3dWebfaqChhQgw7Vs4mjLWzxeY8V8yJwaLr/0MiubQoEaQHmxw==
X-Received: by 2002:a17:902:9f85:b029:d6:e802:75b0 with SMTP id
 g5-20020a1709029f85b02900d6e80275b0mr20483312plq.29.1605073544732; 
 Tue, 10 Nov 2020 21:45:44 -0800 (PST)
Received: from localhost ([122.172.12.172])
 by smtp.gmail.com with ESMTPSA id q22sm869299pgi.33.2020.11.10.21.45.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 Nov 2020 21:45:43 -0800 (PST)
Date: Wed, 11 Nov 2020 11:15:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 02/26] memory: tegra20-emc: Use dev_pm_opp_set_clkname()
Message-ID: <20201111054541.hstqrlvtpwxxbv4m@vireshk-i7>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111011456.7875-3-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11-11-20, 04:14, Dmitry Osipenko wrote:
> The dev_pm_opp_get_opp_table() shouldn't be used by drivers, use
> dev_pm_opp_set_clkname() instead.
> 
> Suggested-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
> index 5e10aa97809f..bb3f315c9587 100644
> --- a/drivers/memory/tegra/tegra20-emc.c
> +++ b/drivers/memory/tegra/tegra20-emc.c
> @@ -902,7 +902,7 @@ static int tegra_emc_interconnect_init(struct tegra_emc *emc)
>  
>  static int tegra_emc_opp_table_init(struct tegra_emc *emc)
>  {
> -	struct opp_table *opp_table;
> +	struct opp_table *reg_opp_table = NULL, *clk_opp_table;
>  	const char *rname = "core";
>  	int err;
>  
> @@ -917,19 +917,24 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
>  	}
>  
>  	/* voltage scaling is optional */
> -	if (device_property_present(emc->dev, "core-supply"))
> -		opp_table = dev_pm_opp_set_regulators(emc->dev, &rname, 1);
> -	else
> -		opp_table = dev_pm_opp_get_opp_table(emc->dev);
> +	if (device_property_present(emc->dev, "core-supply")) {
> +		reg_opp_table = dev_pm_opp_set_regulators(emc->dev, &rname, 1);
> +		if (IS_ERR(reg_opp_table))
> +			return dev_err_probe(emc->dev, PTR_ERR(reg_opp_table),
> +					     "failed to set OPP regulator\n");
> +	}
>  
> -	if (IS_ERR(opp_table))
> -		return dev_err_probe(emc->dev, PTR_ERR(opp_table),
> -				     "failed to prepare OPP table\n");
> +	clk_opp_table = dev_pm_opp_set_clkname(emc->dev, NULL);
> +	err = PTR_ERR_OR_ZERO(clk_opp_table);

Don't check for NULL here.

> +	if (err) {
> +		dev_err(emc->dev, "failed to set OPP clk: %d\n", err);
> +		goto put_reg_table;
> +	}
>  
>  	err = dev_pm_opp_of_add_table(emc->dev);
>  	if (err) {
>  		dev_err(emc->dev, "failed to add OPP table: %d\n", err);
> -		goto put_table;
> +		goto put_clk_table;
>  	}
>  
>  	dev_info(emc->dev, "current clock rate %lu MHz\n",
> @@ -946,8 +951,11 @@ static int tegra_emc_opp_table_init(struct tegra_emc *emc)
>  
>  remove_table:
>  	dev_pm_opp_of_remove_table(emc->dev);
> -put_table:
> -	dev_pm_opp_put_regulators(opp_table);
> +put_clk_table:
> +	dev_pm_opp_put_clkname(clk_opp_table);
> +put_reg_table:
> +	if (reg_opp_table)

This won't be required after my other patchset and yeah it is a
classic chicken and egg problem we have here :)

Maybe you can fix them separately in 5.11 after everything is applied.

> +		dev_pm_opp_put_regulators(reg_opp_table);
>  
>  	return err;
>  }
> -- 
> 2.29.2

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
