Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C6025AF2E
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 17:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCE4897D7;
	Wed,  2 Sep 2020 15:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB6C892FE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Sep 2020 15:35:52 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id a15so4620944ejf.11
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Sep 2020 08:35:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GCEsTdInS4YkDl/rs9szjQgucjoUvpkSLEs7mz1t++4=;
 b=Uw8E8dLuOfrXEWlE3IWf26TKai9CgFgKPPRjsZHXK2iJWVF5Oon4xzlIpUPjMX4NFL
 NdHjYj8nEfaq/QpAFLAnfb6gPam/xeIKmW2nG6co/raUUfioG57chIXdToDB0rKsEI1m
 0Vxk9ddfw5wT+ZRCm9stjgRNpnom0o4ze+7puWNiEjXF5KND3OyZ/XlcQwV4RNJbL+e6
 sUeoml7qSaHniYIFLVVWkTPzDDgrDdIr2BVZKKJVPPjLezCPmYwjChS4j48Bsku6PA4Y
 EFHBL0w2VBIXc8OUN4+eH//wwsAQ5NpI97oiRYTmx7Rfj2dBE+Wdv8R4oTYckAjMMAip
 NHMQ==
X-Gm-Message-State: AOAM533hFa0UlDPIsxivzGIXue+f5gaUPquZjxklz0RApCepZC/R+e5f
 l93zG47av6UTzdd2T6CVNtc=
X-Google-Smtp-Source: ABdhPJzw7TROsNYzuEprNdGNAqhujN6cK49CW6dMCBTEBU/ojNemUw092ImCl/ElfWwyB7tC0pTXIA==
X-Received: by 2002:a17:906:e24f:: with SMTP id
 gq15mr557382ejb.395.1599060951087; 
 Wed, 02 Sep 2020 08:35:51 -0700 (PDT)
Received: from kozik-lap ([194.230.155.106])
 by smtp.googlemail.com with ESMTPSA id lg22sm4841727ejb.48.2020.09.02.08.35.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 02 Sep 2020 08:35:50 -0700 (PDT)
Date: Wed, 2 Sep 2020 17:35:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Kukjin Kim <kgene@kernel.org>, Hoegeun Kwon <hoegeun.kwon@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: exynos: Remove snps,dwc2 compatible in
 Exynos3250
Message-ID: <20200902153547.GA21503@kozik-lap>
References: <20200829172532.29358-1-krzk@kernel.org>
 <20200829172532.29358-4-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200829172532.29358-4-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Aug 29, 2020 at 07:25:32PM +0200, Krzysztof Kozlowski wrote:
> The binding for DesignWare HS OTG USB 2.0 in Samsung SoCs take only one
> compatible.  This fixes dtbs_check warnings like:
> 
>   arch/arm/boot/dts/exynos3250-artik5-eval.dt.yaml: hsotg@12480000:
>     compatible: ['samsung,s3c6400-hsotg', 'snps,dwc2'] is not valid under any of the given schemas (Possible causes of the failure):
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 2 +-

Applied.

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
