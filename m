Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AAC2DEE54
	for <lists+dri-devel@lfdr.de>; Sat, 19 Dec 2020 12:02:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4189C89ED6;
	Sat, 19 Dec 2020 11:02:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B34A89ED6
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 11:02:20 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id b9so6940788ejy.0
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Dec 2020 03:02:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uV8NM4ewui2V4x6VSIOE6oo6nIoQPudLTeEHvVfs8JQ=;
 b=N0T50w2wGCPF09GXrb9B0KuKlkajcLfLYw1GPr9PYB1a4VQGXKDuRn+aGes+TPdt+E
 QfGcK8C7OCFRhBCPGRQCCyV5cktxAdtGmi3njBi+PzQtIm8iPfQVoe7ofM+PBKZCTWPf
 bjjg87l8j46c85+mM6iPnzs7I56s5y/YSOjj/s9NhBHNwmsD2i6SopOPqnaFKfib0/ws
 4k/nVT0BwrmS2Ta7RusdmPjO+bWEkmaImIcnfk5PIv2dBW67zqj8Eyv/B7ZXCaWiIj+O
 StRsj6T8Bzg8Ggq/t5NvMUF5XzCKtXhikp9fFYQ3Yw2aO1UzAqphmpLBMCW2yqmXTpG3
 5Rvw==
X-Gm-Message-State: AOAM533uLMhnHqoqK+9A+upjERcfEGumbLBOwGq0u5fAhGhcWQLzv/L5
 oSxXv2vL2sUhzF0TeTlIUMw=
X-Google-Smtp-Source: ABdhPJzxz67/afVC/FecrdBWnQo3YhrStnV8UwyX/FnI8M7nQ7PMaAAZLXFCUP8jKCtTVxGcSTk9gg==
X-Received: by 2002:a17:907:1004:: with SMTP id
 ox4mr7872260ejb.240.1608375739292; 
 Sat, 19 Dec 2020 03:02:19 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id i26sm6569740eja.23.2020.12.19.03.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Dec 2020 03:02:18 -0800 (PST)
Date: Sat, 19 Dec 2020 12:02:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 41/48] memory: tegra20-emc: Use
 devm_tegra_core_dev_init_opp_table()
Message-ID: <20201219110216.GB5323@kozik-lap>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-42-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-42-digetx@gmail.com>
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
 Viresh Kumar <vireshk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 17, 2020 at 09:06:31PM +0300, Dmitry Osipenko wrote:
> Use common devm_tegra_core_dev_init_opp_table() helper for the OPP table
> initialization.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/memory/tegra/tegra20-emc.c | 57 +++---------------------------
>  1 file changed, 4 insertions(+), 53 deletions(-)

If there was no more Tegra MC work planned, this could easily go via
Tegra SoC tree. However I expect still work of your interconnect
patches, so maybe it's better to stick these in same tree.

In such case I would need a stable tag with the
devm_tegra_core_dev_init_opp_table() helper for memory controller tree.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
