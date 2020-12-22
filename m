Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A17B22E0804
	for <lists+dri-devel@lfdr.de>; Tue, 22 Dec 2020 10:22:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDC66E862;
	Tue, 22 Dec 2020 09:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D99B6E141
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Dec 2020 06:40:33 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id n7so7775867pgg.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 22:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=58if8R3c+oDYrkVVIdvCMuB/HRUSZCNfm9pXzo2Jxis=;
 b=xrayxzNVWoBOOUTllKsBsgUMpNC6xjZxfZRPwCLEzoXU/sg5+VOejq6aNdvm2F+h2l
 oH0+TkshTv1ugzupTG92EKZ/M+hvjdg0PJI86pwt4TR1v8JqJdT8Pz61vnx9sJ5e5IhD
 0EmBrUKXKuIbpIgXqOaGOBgmjNnR7tKFoe67MoGdHqq/3HpwUSPXpkKjhoVhd8YJ7Eol
 V682sF5RTwD5LSJkgu7VcNMjDxbWuqm/SMYLAkqsFi0U43LQmIqScaYNgn8+0Pf4UE6X
 FlNsocE3fBXkr36MtWwlASa3aY1opWbBf4DS7Gh+PnwPpww69IKJ7asp4rk18Z4vqVBQ
 ibyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=58if8R3c+oDYrkVVIdvCMuB/HRUSZCNfm9pXzo2Jxis=;
 b=b+RontaW5LZNMT7zx4fCyhu3mXV7H+fgyrToIxYEO6pISI0fonjsB7X1lZCY0H5xAr
 xReHy5whSKfAcetWqHxYnqciGpWn5iwkpPa1qibNEcMffTNjvxdWVHxCREb9ADAsulSV
 GG2EPCZCA3eLgdQp7WIuffawtXiYsFHyglUw1ybyjBhYKnLg940pemjMEuhaK4aTYE2L
 NIEFyaiWphxrbTGFtUbS81pP9/NXqqIkme+Hbwp52hyIVN52n+dlzySYvjBosxAAG5pN
 X2pH9A3r1aovsoDimTHsDJKErFAuN4E4664gTGfyrGk6hBvfaK6lVMgsfAP945YRUoMD
 BHMQ==
X-Gm-Message-State: AOAM533ivNx69jltiZAmE6rJdXxB4pcdX6D60eHAlEF0dKM+sKT9ybII
 p4FKh8WzwPP9o9L8BaOWDAWcRQ==
X-Google-Smtp-Source: ABdhPJy/vJr+NNSCt7f3w3qkCyZMIzMDucjtinh/w3AD+sfsU1ChxDwkeoH4189p2G8BBp09nYpz6Q==
X-Received: by 2002:a63:1f10:: with SMTP id f16mr14879515pgf.111.1608619232743; 
 Mon, 21 Dec 2020 22:40:32 -0800 (PST)
Received: from localhost ([122.172.20.109])
 by smtp.gmail.com with ESMTPSA id 197sm19176671pgg.43.2020.12.21.22.40.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Dec 2020 22:40:31 -0800 (PST)
Date: Tue, 22 Dec 2020 12:10:29 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 28/48] soc/tegra: Introduce core power domain driver
Message-ID: <20201222064029.duuzcsj53rt7xzvt@vireshk-i7>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-29-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-29-digetx@gmail.com>
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
> +++ b/drivers/soc/tegra/core-power-domain.c
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * NVIDIA Tegra SoC Core Power Domain Driver
> + */
> +
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
> +#include <linux/slab.h>
> +
> +#include <soc/tegra/common.h>
> +
> +static struct lock_class_key tegra_core_domain_lock_class;
> +static bool tegra_core_domain_state_synced;
> +
> +static int tegra_genpd_set_performance_state(struct generic_pm_domain *genpd,
> +					     unsigned int level)
> +{
> +	struct dev_pm_opp *opp;
> +	int err;
> +
> +	opp = dev_pm_opp_find_level_ceil(&genpd->dev, &level);

We don't need ceil or floor versions for level, but rather _exact() version. Or
maybe just call it dev_pm_opp_find_level().

> +	if (IS_ERR(opp)) {
> +		dev_err(&genpd->dev, "failed to find OPP for level %u: %pe\n",
> +			level, opp);
> +		return PTR_ERR(opp);
> +	}
> +
> +	err = dev_pm_opp_set_voltage(&genpd->dev, opp);

IIUC, you implemented this callback because you want to use the voltage triplet
present in the OPP table ?

And so you are setting the regulator ("power") later in this patch ?

I am not in favor of implementing this routine, as it just adds a wrapper above
the regulator API. What you should be doing rather is get the regulator by
yourself here (instead of depending on the OPP core). And then you can do
dev_pm_opp_get_voltage() here and set the voltage yourself. You may want to
implement a version supporting triplet here though for the same.

And you won't require the sync version of the API as well then.

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
