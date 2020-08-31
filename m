Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AFD257526
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 10:19:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C57289CAA;
	Mon, 31 Aug 2020 08:19:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6266F89CAA
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 08:19:11 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id o18so7291438eje.7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Aug 2020 01:19:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Cqrk1bBlfTS3BPtOTE3s4vilkxanbVUMadQ6BMq95XQ=;
 b=FIQtb0at5UoCVaKtIxTx8Fp6CryVXQlPN0e+mgm1fG7EfNvhlX+wCpzt0+zm49+HeK
 4DKXYea+oWUUlBg/ryAlYS7EszG7tiUtAfgIegR4JW3xz4zfLBO3j0LQoifKC4eI0yXY
 zpHSnndRCKXoEqMamkg2XKe6dT8pa0AGTYne/KNVr4JJNd7DiE3otI3ONNfeX1MyxQN2
 vQYYCuCfH1H0KkiCAh6ChxhshKoEWKsO8ZN1HnifeowQ/GASnBhtTDePjmHRqdNo8NVj
 c2c1sRGWUA8LwvUmGd/yG5qwLF2AZ997XACqi70+WecPZI0GyJEJPJcrblds273ryrXC
 yiIg==
X-Gm-Message-State: AOAM532grlro5W1FioaUm44sPZMCR78tcQsA8b/CKLsQL18HxegaqSt2
 gR37+nDaYhRtKgJt2jPSQIw=
X-Google-Smtp-Source: ABdhPJwZmYA5QBVdQf3hNtCbKsFlHcp5sGv8ZbmLIZ97Vr6lwstZRZcAMaFR7D7zA37ZpKOOmXJ5ug==
X-Received: by 2002:a17:906:180b:: with SMTP id
 v11mr47877eje.427.1598861949932; 
 Mon, 31 Aug 2020 01:19:09 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
 by smtp.googlemail.com with ESMTPSA id d2sm7482261ejm.19.2020.08.31.01.19.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 31 Aug 2020 01:19:09 -0700 (PDT)
Date: Mon, 31 Aug 2020 10:19:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [RFT 3/4] ARM: dts: exynos: Move CMU assigned ISP clocks to
 buses in Exynos3250
Message-ID: <20200831081906.GA11513@kozik-lap>
References: <20200829172532.29358-1-krzk@kernel.org>
 <CGME20200829172553eucas1p1b62ad1cac6e0eea1dbb4669f09949419@eucas1p1.samsung.com>
 <20200829172532.29358-3-krzk@kernel.org>
 <6ed67a82-0f29-7384-203d-dcb2e58c5a8d@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6ed67a82-0f29-7384-203d-dcb2e58c5a8d@samsung.com>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sylwester Nawrocki <snawrocki@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 31, 2020 at 10:11:02AM +0200, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> On 29.08.2020 19:25, Krzysztof Kozlowski wrote:
> > Commit 52005dece527 ("ARM: dts: Add assigned clock parents to CMU node
> > for exynos3250") added assigned clocks under Clock Management Unit to
> > fix hangs when accessing ISP registers.
> >
> > This is not the place for it as CMU does not have a required "clocks"
> > property:
> >
> >    arch/arm/boot/dts/exynos3250-artik5-eval.dt.yaml: clock-controller@10030000: 'clocks' is a dependency of 'assigned-clocks'
> >
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> >
> > ---
> >
> > Not tested and I wonder whether actually correct. For example, what will
> > happen if devfreq (exynos-bus) is not built in?
> >
> > Could someone verify it?
> 
> Sorry, but this patch is not correct. Those clocks has noting with 
> bus-freq. The assigned clocks property should stay where it is. Maybe 
> one need to fix the schemas for dts verification. Those clocks has to be 
> set (and so generic clock framework does) according to the assigned 
> clocks properties once the clock controller is instantiated.
> 
> The only alternative would be to add exynos-subcmu variant to properly 
> link CMU with the ISP power domain, but assuming that there is no Exynos 
> 3250 ISP driver in mainline (and probably never will be), it is safe to 
> keep those clocks sourced from 24MHz crystal.

Thanks for the clarification.  Another solution to silence the warning
could be to add a "clocks" property for FIN_PLL, although the driver
actually does not take it.

This is the only remaining dtschema check warning on Exynos3250 so it
would be nice to at least silence it. My goal is to have all them
schema-correct, or as close as possible (for Exynos4 the camera node is
a trouble).

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
