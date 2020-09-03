Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF4825C731
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 18:42:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B846EA09;
	Thu,  3 Sep 2020 16:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41CA6EA09
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:42:25 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id e14so3301178ile.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 09:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6Sphnv+kZz9m5G/Scys4rI5dlFuqK5i9UXTX5h29xxM=;
 b=gVjdjf+4mon27YfrXmWflc7+XHmV0jCD7lEdwrxyLz57Cw1VqAE1FMV/Txjr4oMIdX
 I/t2PtOUO76AGtV4SqlSORnb09rteIk0rSfopU9WQVRVebLBoKyC1kNXusS4oEPm1YrL
 J0N7v1O3qLVvfeH1LMasxbPP67tFp1zZkE9btOtwpu4w0No4ERGxaI9+MuCe6SSl+ZgA
 xw9lApsARfSCPyFt9aQgN7GoyjFzmluzBWgKv/a3WOgBtRZK76S/yqDjqSU2IutOZx4E
 o6g/iHXrifX904JxgNAc7UNhFjSqDP1tpslvZoZfkm7T30XBGyRl4RLMwMNm3+jHGeEv
 m5MQ==
X-Gm-Message-State: AOAM532xdy2brtS9eR0VbaniKKmSUDbo+yQPCubyTeBpFP6xz9uSdgs+
 t3NbeqRA/WKLJ/P/wePS7g==
X-Google-Smtp-Source: ABdhPJyf5z2NqnEUDQWThMqUbFgeD+F0Z4y8wVXxVNOYbxoIN6ARDFco2WA47g884qz86E7kb3prsQ==
X-Received: by 2002:a92:bf0a:: with SMTP id z10mr4215186ilh.39.1599151345148; 
 Thu, 03 Sep 2020 09:42:25 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
 by smtp.gmail.com with ESMTPSA id p78sm1578646iod.0.2020.09.03.09.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 09:42:24 -0700 (PDT)
Received: (nullmailer pid 2924166 invoked by uid 1000);
 Thu, 03 Sep 2020 16:42:23 -0000
Date: Thu, 3 Sep 2020 10:42:23 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 02/10] dt-bindings: gpu: arm,mali-midgard: Use
 unevaluatedProperties
Message-ID: <20200903164223.GA2923881@bogus>
References: <20200829142501.31478-1-krzk@kernel.org>
 <20200829142501.31478-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200829142501.31478-2-krzk@kernel.org>
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

On Sat, Aug 29, 2020 at 04:24:53PM +0200, Krzysztof Kozlowski wrote:
> Additional properties or nodes actually might appear (e.g. operating
> points table) so use unevaluatedProperties to fix dtbs_check warnings
> like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: gpu@14ac0000:
>     'opp_table' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

NAK. See https://lore.kernel.org/r/CAL_JsqKPXJxsHPS34_TCf9bwgKxZNSV4mvQR-WKRnknQVtGGxQ@mail.gmail.com/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
