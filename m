Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC8829A794
	for <lists+dri-devel@lfdr.de>; Tue, 27 Oct 2020 10:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710AF6EB40;
	Tue, 27 Oct 2020 09:18:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389546EB40
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 09:18:10 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id w23so670659edl.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 02:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HAb5s57kc6FoxJJ5M7USdfq0o0bKGmCp0q9T2Pfs8tQ=;
 b=KshPKnyMRnxU9zcLHZ1k6e8XHPdfj3CfyU3IuXoHDDkSN1BhbE3HUC6Ogs+Z/qi0Op
 elEoBiTyei2+1QQPp0FfDnw4Lx2rGSH1A7SXRbc2wiBm8iREvidODFoTS8SrNCPg/7J3
 kSu7SXzxxvZfheHDotafif+cQmld0//ydIsnlp9wzowcP8GEEsOFZIr/V53uQooGg3C/
 7uOHscHR5iqxGAJ6tjuC5b1DjAzCG5xCNpZh4pkZQXDA7wURDZD0itE9PoLCOdz5tckl
 Ns1o2l4ekUyhXHarvhb3Qz855Nu+aY/ZCCul4RBEg0Q9z0d5yFAyGYHVA9Z8BgGxUPuj
 T3ZQ==
X-Gm-Message-State: AOAM531iJJt8PE1LBVf9LLttZAs6IPxdATuTcjt5z5BCtp2B/XYO13ej
 GcMn2IvqyoLxfIi5lVgwu5A=
X-Google-Smtp-Source: ABdhPJzOLthwFj6nDtDIvhLVvFPoESLoUtoRlDAuM65L24KRPnOdjwxWM9Zp5eXDz2i7noU2UuMTag==
X-Received: by 2002:a05:6402:135a:: with SMTP id
 y26mr1207604edw.114.1603790288831; 
 Tue, 27 Oct 2020 02:18:08 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id v18sm658320ejj.10.2020.10.27.02.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 02:18:07 -0700 (PDT)
Date: Tue, 27 Oct 2020 10:18:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 25/52] ARM: tegra: Add DVFS properties to Tegra20 EMC
 device-tree node
Message-ID: <20201027091805.GC10762@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-26-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-26-digetx@gmail.com>
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
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 01:17:08AM +0300, Dmitry Osipenko wrote:
> Add EMC OPP DVFS/DFS tables and emc-stats subdev that will be used for
> dynamic memory bandwidth scaling, while EMC itself will perform voltage
> scaling. Update board device-trees with optional EMC core supply and
> remove unsupported OPPs.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../boot/dts/tegra20-acer-a500-picasso.dts    |  12 ++
>  arch/arm/boot/dts/tegra20-colibri.dtsi        |   8 +
>  arch/arm/boot/dts/tegra20-paz00.dts           |  10 +
>  .../arm/boot/dts/tegra20-peripherals-opp.dtsi | 181 ++++++++++++++++++
>  arch/arm/boot/dts/tegra20.dtsi                |  12 +-
>  5 files changed, 222 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
> 
> diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
> index a0b829738e8f..f5c1591c8ea8 100644
> --- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
> +++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
> @@ -1058,9 +1058,21 @@ map0 {
>  		};
>  	};
>  
> +	emc_opp_table0 {

All node names with hyphens -. Not underscores.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
