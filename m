Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3F82E02A1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 23:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF936E030;
	Mon, 21 Dec 2020 22:53:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AB86E030
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 22:53:22 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id n127so2559496ooa.13
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 14:53:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PmiFErZsck8Eax6YSpPObi4oYX8shYbW2tl21KlUI5M=;
 b=M6TjuQUA6IFz19hBbu4jJ9VSnj9AyqLXIBfVOaQdSqp8jSVmSFyODdIfJb/DwVoDAm
 IK12y2SMap0McKbeibqP071vzKZ5Or7PM4EfiDEbl1vXNwZ2x2+jKeojncLq+eXRo2yh
 xHyQkXRgQsNt/JKqHTkOUq1IIu7iCoeQNfffMxiWXT3zvsosVdjFwvGm8yD0iYnrDH0z
 B7eSt1/ZA1lKNDngi+i2i0BrOFSjP8Qh92rysXOroT0rgGW0rJC/p6fdYQ7bmLL3QEb7
 IaLch5YQxmcE09riTD7MZLFzrTuSe9pjiaBHZu6NNWuv6BDzvdh/NWImIZOFF2VNmi2a
 CNYg==
X-Gm-Message-State: AOAM532WGyCvJb8yoyyzKmFlGj2DwKLcFEvEdarREOpJbq3OpXCDrDDm
 cEZVzHAbILKuKVd7NfzXaw==
X-Google-Smtp-Source: ABdhPJwHk2mKXmiM9Be1g1hPiKx149bS8x31wABVYLXX21+EEEz/R18GHHbZiggzsaUq+ghMjOAzAg==
X-Received: by 2002:a05:6820:503:: with SMTP id
 m3mr13176716ooj.83.1608591201539; 
 Mon, 21 Dec 2020 14:53:21 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id e25sm1849939oof.1.2020.12.21.14.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 14:53:20 -0800 (PST)
Received: (nullmailer pid 723454 invoked by uid 1000);
 Mon, 21 Dec 2020 22:53:16 -0000
Date: Mon, 21 Dec 2020 15:53:16 -0700
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 01/48] dt-bindings: memory: tegra20: emc: Replace core
 regulator with power domain
Message-ID: <20201221225316.GA723398@robh.at.kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217180638.22748-2-digetx@gmail.com>
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

On Thu, 17 Dec 2020 21:05:51 +0300, Dmitry Osipenko wrote:
> Power domain fits much better than a voltage regulator in regards to
> a proper hardware description and from a software perspective as well.
> Hence replace the core regulator with the power domain. Note that this
> doesn't affect any existing DTBs because we haven't started to use the
> regulator yet, and thus, it's okay to change it.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-emc.txt        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
