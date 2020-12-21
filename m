Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 183C62E02A4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 23:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48F5F6E030;
	Mon, 21 Dec 2020 22:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com
 [209.85.161.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425696E030
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 22:54:13 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id x203so2564957ooa.9
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 14:54:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Jw1ndUTD1aoOuURqqx/C6H+0xyb493YdyXMpTfuGNvM=;
 b=dLASydpEPvG6b7Vssk7UAwTbrfcvB2T3YdrjyQVSx3daJ912XwoLWobL6FCbNzsfVA
 zQGSdZG2qjmmnE8CsE9DT/9EaiPPAEIIvtEBSTh2ePXL4PHXAPtGrOZ5W1geNJQkrFkJ
 k7XZyy9Sed2/pIoa+dYCXOcZjjdOJSZgGcEMUx/fRx+YFEDIBBT0WdDC4IcO4/wDSKon
 mFlLiPZcwFmAINC6/HZ8uhwFzmFTQalxr54uFAJ6BmJUmWyA5KPoHPpiUQxkF6c20Fx+
 GERBz/B0kg+Uq0e/btICl4bRvnJUovM0nvw8Tk+nE8a5Q3pd2qlfZczye871T+55eM3M
 kE0Q==
X-Gm-Message-State: AOAM531FgV27xQ/03qhHJKPdnFH9TVXfm1xkvdQ6/gkDoXQa5OrGQJFV
 J4zlBxW+hG8UhYPmDc+a8OAl1YiwOQ==
X-Google-Smtp-Source: ABdhPJyh7WIlcaY2pi0KoO1t1QH32umrXAGjAjGGPz8NFDz5TkVO7QEgKYygMTJiLlGyoihZfsxu1g==
X-Received: by 2002:a4a:a7c5:: with SMTP id n5mr12984272oom.9.1608591252632;
 Mon, 21 Dec 2020 14:54:12 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id z14sm4101967otk.70.2020.12.21.14.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 14:54:11 -0800 (PST)
Received: (nullmailer pid 724741 invoked by uid 1000);
 Mon, 21 Dec 2020 22:54:05 -0000
Date: Mon, 21 Dec 2020 15:54:05 -0700
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 02/48] dt-bindings: memory: tegra30: emc: Replace core
 regulator with power domain
Message-ID: <20201221225405.GA723611@robh.at.kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-3-digetx@gmail.com>
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
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 09:05:52PM +0300, Dmitry Osipenko wrote:
> Power domain fits much better than a voltage regulator in regards to
> a proper hardware description and from a software perspective as well.
> Hence replace the core regulator with the power domain. Note that this
> doesn't affect any existing DTBs because we haven't started to use the
> regulator yet, and thus, it's okay to change it.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra30-emc.yaml     | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
> index 0a2e2c0d0fdd..7b4af9169b0b 100644
> --- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
> +++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra30-emc.yaml
> @@ -39,9 +39,9 @@ properties:
>      description:
>        Phandle of the Memory Controller node.
>  
> -  core-supply:
> +  power-domains:
>      description:
> -      Phandle of voltage regulator of the SoC "core" power domain.
> +      Phandle to the SoC "core" power domain.

power-domains needs to define how many (maxItems).

>  
>    operating-points-v2:
>      description:
> @@ -241,7 +241,7 @@ examples:
>  
>          nvidia,memory-controller = <&mc>;
>          operating-points-v2 = <&dvfs_opp_table>;
> -        core-supply = <&vdd_core>;
> +        power-domains = <&domain>;
>  
>          #interconnect-cells = <0>;
>  
> -- 
> 2.29.2
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
