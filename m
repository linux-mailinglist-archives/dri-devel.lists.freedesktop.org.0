Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF9F2E07F5
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84756E840;
	Tue, 22 Dec 2020 09:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24746E830
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 09:01:41 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id g15so3068580pgu.9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 01:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3q7nnCnJmd4O4D32PC0P8xH1+bdbk1CdNF9NmfMW4t0=;
 b=Sw8hWqsmWEV28OZ97FyOgXyFgk5shKHWAxZzHcRzRhaM/6+T4brrF3/aXanmbfPjRw
 /A9CHWFxY/26ovZDBEoLzvrVEQgYuX/8xBOFFAOh2S++/KtpIaGJfhKZuA8vaiEUG6N5
 RDqNcxOViH+za8EEfeOTF4OJ0FgNLYkqGyciyEF6yFonDS/ytj6QebompmK2qd5iwMxT
 f60gJWZOOaEE42z2GFxRM7tJMnnNTqxHJqeFzNzO5GVHLT7/VnICWMEMwFNfUuNd7lT8
 CMqaiMF7EhSgACQ9J+vlj6sz3hYK3bX6+CzSrtrtNmrSTvIrdM+em0PwSBTuQL1T2brh
 GG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3q7nnCnJmd4O4D32PC0P8xH1+bdbk1CdNF9NmfMW4t0=;
 b=C39oxXB+Qi2bJH3gnlSyYdQqobyfop4s1xFJRPILM6T7/ccQxZOwmxUdDRB49srNFY
 4vux+uxObfrK/yAmFqI6T5F6WHynl+FQ1o4NeVVnIK1iWiNBPdkg0PGpcGKFWabNZo3E
 WKDF5c2h6IZWf6NyByBB/g0yQAZoyntz9aGNg5xWarDgB4AWHdgiLwcSCXu8kIqTPPop
 Pq6aEAncVny/nhi/BFhfqodoFhqKdeZu1fZyx12o2Fr29Cd6zdHx3WbBH2m0xLso+xc9
 FlU8axjgX5YY42Gev7iOUTP7fvEu8jVAFMGOX0+QWGCX6chqwxBFewIAl177LZ6X7Rl3
 nMWw==
X-Gm-Message-State: AOAM531dG8hmv9ztrQrkWjeIJ14p/61EDzG025FOlBxB9GC9ShdFyfUl
 kQIoMdYxHd6ft4W+DYD3IPoPJA==
X-Google-Smtp-Source: ABdhPJzpaUuhCwigtZPkt7tXXBF91xrRM3nJ/y/UBldoNdmIzxgqD3l3BVqGdS+DNg3W0X8ggHASsA==
X-Received: by 2002:a62:864e:0:b029:1ab:e82c:d724 with SMTP id
 x75-20020a62864e0000b02901abe82cd724mr15830943pfd.9.1608627701598; 
 Tue, 22 Dec 2020 01:01:41 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id o14sm14548124pgr.44.2020.12.22.01.01.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Dec 2020 01:01:40 -0800 (PST)
Date: Tue, 22 Dec 2020 14:31:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 15/48] opp: Support set_opp() customization without
 requiring to use regulators
Message-ID: <20201222090139.vopgc2ju72kr4ujy@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-16-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-16-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Mailman-Approved-At: Tue, 22 Dec 2020 09:21:48 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17-12-20, 21:06, Dmitry Osipenko wrote:
> Support set_opp() customization without requiring to use regulators. This
> is needed by drivers which want to use dev_pm_opp_set_rate() for changing
> rates of a multiple clocks and don't need to touch regulator.
> 
> One example is NVIDIA Tegra30/114 SoCs which have two sibling 3D hardware
> units which should be use to the same clock rate, meanwhile voltage
> scaling is done using a power domain. In this case OPP table doesn't have
> a regulator, causing a NULL dereference in _set_opp_custom().
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/opp/core.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 3d02fe33630b..625dae7a5ecb 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -828,17 +828,25 @@ static int _set_opp_custom(const struct opp_table *opp_table,
>  			   struct dev_pm_opp_supply *old_supply,
>  			   struct dev_pm_opp_supply *new_supply)
>  {
> -	struct dev_pm_set_opp_data *data;
> +	struct dev_pm_set_opp_data *data, tmp_data;
> +	unsigned int regulator_count;
>  	int size;
>  
> -	data = opp_table->set_opp_data;
> +	if (opp_table->set_opp_data) {
> +		data = opp_table->set_opp_data;
> +		regulator_count = opp_table->regulator_count;
> +	} else {
> +		data = &tmp_data;
> +		regulator_count = 0;
> +	}
> +
>  	data->regulators = opp_table->regulators;
> -	data->regulator_count = opp_table->regulator_count;
> +	data->regulator_count = regulator_count;
>  	data->clk = opp_table->clk;
>  	data->dev = dev;
>  
>  	data->old_opp.rate = old_freq;
> -	size = sizeof(*old_supply) * opp_table->regulator_count;
> +	size = sizeof(*old_supply) * regulator_count;
>  	if (!old_supply)
>  		memset(data->old_opp.supplies, 0, size);
>  	else

I don't see you making use of this in this patchset. How did you get this to
crash ?

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
