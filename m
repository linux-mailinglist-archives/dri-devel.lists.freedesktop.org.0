Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B97925C73F
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 18:43:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5419D6EA0C;
	Thu,  3 Sep 2020 16:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5D66EA0C
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:43:22 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id z25so3587147iol.10
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 09:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Vm4YZ0rV7T1k22Okll5l0Zfn2qIEM+/b9DI6foS5uOU=;
 b=itz+0WfpC9SXXLcqZ81dE3M8TIWsRPbaYaIJ1z+pextTeBsASQ420xA5oiFSBgV4Z5
 EOwr/cd1399hGerqNOGDIHmmGL7oke/dB84hCZRVWUSCKfu0umg3rEK2Ms0AgZnsYkD0
 lkzyYp7cXHz9amOknwYm6jwShDPUMqJqJs08bpsHwnVqVITqv9oJjHItB/iPRk5nAUlh
 31K+1+c9ksf8gO//sQcUC7hGHO4GvEIfo3UUpODqhNY7kXNNNbe86SH1Vuj8FUYUBgu6
 YtakbqxD98xDvj4UL5nc7bETqrEU3x4+mHlJV3oCzLZDAkibFc0EsPpWYs3AcCwClMXb
 B47Q==
X-Gm-Message-State: AOAM533RgWIuAbcsu2DKsi3nEmXJ1L8WlF8uC3/ezyTiAEykALCQHFmd
 TdQl2Nly9HJ9LX82+rv9GQ==
X-Google-Smtp-Source: ABdhPJxdGWvSm91m5o4p27kxDEJ3BksNrLtWiBafKboKccHq8iHXL8Nu/05NN9zEgfjXFSxDiBv6CA==
X-Received: by 2002:a02:834a:: with SMTP id w10mr4193188jag.63.1599151401695; 
 Thu, 03 Sep 2020 09:43:21 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id w12sm1483444ioa.8.2020.09.03.09.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 09:43:21 -0700 (PDT)
Received: (nullmailer pid 2925553 invoked by uid 1000);
 Thu, 03 Sep 2020 16:43:19 -0000
Date: Thu, 3 Sep 2020 10:43:19 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 06/10] dt-bindings: sound: samsung-i2s: Use
 unevaluatedProperties
Message-ID: <20200903164319.GA2925151@bogus>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-6-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-6-krzk@kernel.org>
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

On Sat, Aug 29, 2020 at 04:24:57PM +0200, Krzysztof Kozlowski wrote:
> Additional properties actually might appear (e.g. power-domains) so use
> unevaluatedProperties to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: i2s@11440000:
>     Additional properties are not allowed ('power-domains', '#address-cells', 'interrupts', '#size-cells' were unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/sound/samsung-i2s.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK. See https://lore.kernel.org/r/CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
