Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AA13C15BC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 17:13:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F646E8D9;
	Thu,  8 Jul 2021 15:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAECA6E8D9
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 15:13:12 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id n14so16667432lfu.8
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jul 2021 08:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2MMJ3zjZJFIbkKd/TzuHfSkaeMKJORSkk9qfj614AYA=;
 b=glLqpVJtvi2kolhiEgKpStODvfleeFpHVkjPwXQoA7YiBJCAUaJar0oZyKFoqL3W80
 l5lxGVSGO5SnR2qNp6lRJPI606S2Zyhn6QPrUFEBbPzl/WP2TZjGGrjfCE3z0C1bCwTT
 zhlYaIfQ9dh4UCcPpO/LA6s9T9332Y6yVUF/Nqd+kg+wwlRkErZwjHenNQoOH2Tbjkgz
 mhNXp/yfBqoRGyW4PDL1K0+KV+h+wAT7WGoj0zR4UnIyYv0SNyI3bLmxFw2kVW29FJpy
 ruB2ysgAyyybj1R6Es1KvvjtPv98jBOXrJHjR1LuVMgqNm26pnj4TwaYwGi6UrbeYGs+
 Y7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2MMJ3zjZJFIbkKd/TzuHfSkaeMKJORSkk9qfj614AYA=;
 b=gp0L1UXaNS+5THwUdh1B+bCcWKoEjFM7Bnf3LL+0AH/hJ7paYiwOzjxqT5AnsriXVe
 7fABoY+t9sIWXy12mdeoXtjTGDcT/uv0La/XNlnP4Zoa1oDjtE9nbEzdZ9BvJTSClQxM
 d86NWp6ZtyImZ+2HiKV5lntMgmy/6C1WsxfVSUy+CqI9dvYUExN2yMxus/xlGVGP+pPf
 /3wBoZe0V3WEEphMEXMGRbqBVk3VV2TVLDR/3MCkLjuueUoIUFxa+SxeRv2QYIMWB+RH
 tLDM1jMZHV09up4uflS1x6ybXdguND+3BA6djG00AyopXNIRrHpyB9udU4laqA2Vblje
 1sEQ==
X-Gm-Message-State: AOAM533epVr0sEeUoPjw1OQpGddT2rjt43DR53+YuAhO/RIrw1K1Cv0T
 mAhbZDvl/Y1bKLtGP8UqDWU=
X-Google-Smtp-Source: ABdhPJy+MLDUPvqWL5jqIRphVK212skB9D6h/+IuoXWEHMvjEcBSwD7kbvjywhCjf8JdKBl4E/Ifnw==
X-Received: by 2002:ac2:51cd:: with SMTP id u13mr19887023lfm.435.1625757191191; 
 Thu, 08 Jul 2021 08:13:11 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru.
 [94.29.37.113])
 by smtp.googlemail.com with ESMTPSA id i2sm221286lfe.38.2021.07.08.08.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 08:13:10 -0700 (PDT)
Subject: Re: [PATCH] drm/tegra: gr2d: Explicitly control module reset
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210708143736.2018135-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d9112247-ce69-9281-75e6-6cb3296d19a7@gmail.com>
Date: Thu, 8 Jul 2021 18:13:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708143736.2018135-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

08.07.2021 17:37, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> As of commit 4782c0a5dd88 ("clk: tegra: Don't deassert reset on enabling
> clocks"), module resets are no longer automatically deasserted when the
> module clock is enabled. To make sure that the gr2d module continues to
> work, we need to explicitly control the module reset.
> 
> Fixes: 4782c0a5dd88 ("clk: tegra: Don't deassert reset on enabling clocks")
> Signed-off-by: Thierry Reding <treding@nvidia.com>

On which board do see this problem?

TRM says that 2d should be in reset by default, but somehow it's not a
problem on devices that use fastboot.. why would it touch the 2d reset?

> ---
>  drivers/gpu/drm/tegra/gr2d.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tegra/gr2d.c b/drivers/gpu/drm/tegra/gr2d.c
> index de288cba3905..ba3722f1b865 100644
> --- a/drivers/gpu/drm/tegra/gr2d.c
> +++ b/drivers/gpu/drm/tegra/gr2d.c
> @@ -4,9 +4,11 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/iommu.h>
>  #include <linux/module.h>
>  #include <linux/of_device.h>
> +#include <linux/reset.h>
>  
>  #include "drm.h"
>  #include "gem.h"
> @@ -19,6 +21,7 @@ struct gr2d_soc {
>  struct gr2d {
>  	struct tegra_drm_client client;
>  	struct host1x_channel *channel;
> +	struct reset_control *rst;

Unused variable?

>  	struct clk *clk;
>  
>  	const struct gr2d_soc *soc;
> @@ -208,6 +211,12 @@ static int gr2d_probe(struct platform_device *pdev)
>  	if (!syncpts)
>  		return -ENOMEM;
>  
> +	gr2d->rst = devm_reset_control_get(dev, NULL);
> +	if (IS_ERR(gr2d->rst)) {
> +		dev_err(dev, "cannot get reset\n");
> +		return PTR_ERR(gr2d->rst);
> +	}
> +
>  	gr2d->clk = devm_clk_get(dev, NULL);
>  	if (IS_ERR(gr2d->clk)) {
>  		dev_err(dev, "cannot get clock\n");
> @@ -220,6 +229,14 @@ static int gr2d_probe(struct platform_device *pdev)
>  		return err;
>  	}
>  
> +	usleep_range(2000, 4000);
> +
> +	err = reset_control_deassert(gr2d->rst);
> +	if (err < 0) {
> +		dev_err(dev, "failed to deassert reset: %d\n", err);
> +		goto disable_clk;
> +	}
> +
>  	INIT_LIST_HEAD(&gr2d->client.base.list);
>  	gr2d->client.base.ops = &gr2d_client_ops;
>  	gr2d->client.base.dev = dev;
> @@ -234,8 +251,7 @@ static int gr2d_probe(struct platform_device *pdev)
>  	err = host1x_client_register(&gr2d->client.base);
>  	if (err < 0) {
>  		dev_err(dev, "failed to register host1x client: %d\n", err);
> -		clk_disable_unprepare(gr2d->clk);
> -		return err;
> +		goto assert_rst;
>  	}
>  
>  	/* initialize address register map */
> @@ -245,6 +261,13 @@ static int gr2d_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, gr2d);
>  
>  	return 0;
> +
> +assert_rst:
> +	(void)reset_control_assert(gr2d->rst);

(void)?
