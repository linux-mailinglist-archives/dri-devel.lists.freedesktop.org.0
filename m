Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F61825795A
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 14:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5CB6E248;
	Mon, 31 Aug 2020 12:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65FF6E248
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 12:34:41 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id bo3so8224334ejb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 05:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gZ0CJ8Hc1sn63t+kbr2ePS/jsX1/ElRjSGgnzflGJ5c=;
 b=dcUVdBGoZxlXabl0u3QIvMzjbBmSoa/5duamHUjrg0F2Ap4Zj2JJVXnGQa+NM6Li4o
 USVJJbZOEFpNWqLQg/F1AMLBx4FFGHEvFeoHw7rz5xYyppqzmQWg+TOHpexF5uEn3Jeo
 Puuyo/bBLtYUNlPHaIa4Uw/8MQOAIPIPUidgfV/UpiRshF0RW0tw4o9ds5z5WMUf1gZT
 0dQ6Dgh4cSBzn0MFeNPZS9k6vFcP1kXyp9qSqYOje16+CLI1uex8WoNX2V8Sss1dFQst
 oXQVYuFRXPQR9K++XOxhQzgwGBUdyisF/t2MN5nZ+z+sNwfkX5vw5FatW3lePS165FVF
 /fFQ==
X-Gm-Message-State: AOAM5314epmti+Qc8tj2Dejlf2IrXAyvh9OwFPn6Ih2v1hWO8DSnJGjm
 PWKgLI5oI1KXQ6lHp1Mg8I0=
X-Google-Smtp-Source: ABdhPJwHQ+kbuB17V3EV8bJwx6CZ9YUlL7K7t8FmVxpql1tXRrhoh31zM7AD8jShfHwOzEmNhb7SKA==
X-Received: by 2002:a17:906:edc4:: with SMTP id
 sb4mr956998ejb.144.1598877280585; 
 Mon, 31 Aug 2020 05:34:40 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id y14sm1576652eje.10.2020.08.31.05.34.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 31 Aug 2020 05:34:39 -0700 (PDT)
Date: Mon, 31 Aug 2020 14:34:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 04/10] dt-bindings: mfd: syscon: Document Samsung Exynos
 compatibles
Message-ID: <20200831123436.GA27700@kozik-lap>
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142536eucas1p12c539f1cd45195adef96f8b752778fcf@eucas1p1.samsung.com>
 <20200829142501.31478-4-krzk@kernel.org>
 <8b0a42a3-e014-c2ed-7403-021f9a476fc8@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b0a42a3-e014-c2ed-7403-021f9a476fc8@samsung.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-samsung-soc@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 31, 2020 at 02:30:52PM +0200, Sylwester Nawrocki wrote:
> On 29.08.2020 16:24, Krzysztof Kozlowski wrote:
> > Samsung Exynos SoCs use syscon for system registers so document its
> > compatibles.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> > index 049ec2ffc7f9..0f21943dea28 100644
> > --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> > @@ -40,6 +40,10 @@ properties:
> >                - allwinner,sun50i-a64-system-controller
> >                - microchip,sparx5-cpu-syscon
> >                - mstar,msc313-pmsleep
> > +              - samsung,exynos3-sysreg
> > +              - samsung,exynos4-sysreg
> > +              - samsung,exynos5-sysreg
> > +              - samsung,exynos5433-sysreg
> 
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> Do you also have a patch updating Documentation/devicetree/
> bindings/arm/samsung/sysreg.yaml with new compatibles?

Good point. This file should be probably dropped as everything is
documented in syscon.

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
