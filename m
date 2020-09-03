Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4994D25C739
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 18:42:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E156EA0E;
	Thu,  3 Sep 2020 16:42:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849736EA0E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:42:49 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id q6so3259618ild.12
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 09:42:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3N9AevB6RmnRGPj8FDy4IK+19+ZllXrOBzHdsEB5tpA=;
 b=Tfts3K7pCsSuMV0wQjgcqVEZ6vEf4rBRP00RsoVpR5ppM3qIsk2B53ruQccjtBkMZ4
 a/PDXdJOnumKZAl8nOaTj6ULz8wIekBkGXwRGMjJGlsIcQnmsw+U9xQAVzM+aoTJIrVP
 I+4eV2dCenwZ37GKItus0LuBO1PRp3+mFgiDIw8nBt/XUtnAEkyMzIzfjh4EfZu0b0Qn
 nsJch6hLfzaL15tAV/k2X6QaqpfjBWPDBOzaIJgThSg8/LEE773HexxtA7m1lsWhHNBw
 rUpTnmKd1R7R2xJ2WB/H4V0GWHZuZcnJWH4qCmuw3KIqF77tbZIqAFQsp7VFHTt0iKo6
 2HNw==
X-Gm-Message-State: AOAM532JkAC8MWCqmmdm8KuU5MH37qHdAywbRuH71wG3Na0Gou+bgTW/
 MOXdYplKvYRxvwbC1YbJgg==
X-Google-Smtp-Source: ABdhPJxRAYyjUZiXDXO4KvACDThXQaoxGDmQVYPWjjr53PXDSj6UE7VQ2ryTEL5P37If/VKc8+Se/A==
X-Received: by 2002:a92:6606:: with SMTP id a6mr3867837ilc.128.1599151368926; 
 Thu, 03 Sep 2020 09:42:48 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id w26sm1755180ili.34.2020.09.03.09.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 09:42:48 -0700 (PDT)
Received: (nullmailer pid 2924734 invoked by uid 1000);
 Thu, 03 Sep 2020 16:42:46 -0000
Date: Thu, 3 Sep 2020 10:42:46 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 03/10] dt-bindings: timer: exynos4210-mct: Use
 unevaluatedProperties
Message-ID: <20200903164246.GA2924432@bogus>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-3-krzk@kernel.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sangbeom Kim <sbkim73@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 29, 2020 at 04:24:54PM +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. clocks) so use
> unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: timer@101c0000:
>     'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/timer/samsung,exynos4210-mct.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK. See https://lore.kernel.org/r/CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
