Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D565E26BEA0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 09:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014D16E9D5;
	Wed, 16 Sep 2020 07:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8319E6E9D5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 07:59:12 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id w2so1811762wmi.1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 00:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f9vR3Ti7HGJjlVupS35gCwKRPU2ouBmpdxOZm0a6pHg=;
 b=JwLxRV0V+C8Fu+GDwqLtJjWRK90N0LOZUeeW04E96sqhTLeT7EzLKLvClFGHJ9H/P1
 gy/G8u8F/0McjqX9mIX8lRWvFdAYmdoilWBdVTggsrcsBSeCgc2eklkXrOXFl37jZ9fM
 xYMtXiUfE8xFQd0dJ75mvAuUfhhlRW2uo05fQwS3cUGZoEiQL6Mvjyde4VX9cMz6a+gW
 UPAuTpjmF5S0jbIZjgFlRNt0+sRfEPnbY7S6C5DoKUB12Ue3XkNyXWz9PgaoxzzD/Fkd
 MAXH1z0l+TkCNSLw7z7LSjhvQ5cMfKX9fv1bv8WJ9xe/qJVByhNwR8kmwzkxvnusCc9K
 e2Ag==
X-Gm-Message-State: AOAM531z59NCtkf02SmhC4vP7jiBHUh86bch5o2i7TDCDEkeXf3faHBg
 bj52cVbrdEIZEyOlmRU3G58=
X-Google-Smtp-Source: ABdhPJxvAiLHTzMl+wXAqNoAvB4Yv/BV83AUKMAclJ4hQWRQUQ98jocoP+WC+dpkBraRRwrLGVhbrg==
X-Received: by 2002:a1c:7c1a:: with SMTP id x26mr3467656wmc.112.1600243151114; 
 Wed, 16 Sep 2020 00:59:11 -0700 (PDT)
Received: from kozik-lap ([194.230.155.124])
 by smtp.googlemail.com with ESMTPSA id a81sm4022587wmf.32.2020.09.16.00.59.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Sep 2020 00:59:09 -0700 (PDT)
Date: Wed, 16 Sep 2020 09:59:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFT 09/10] arm64: dts: exynos: Correct port of USB-C connector
 node on Exynos5433 TM2
Message-ID: <20200916075907.GA10270@kozik-lap>
References: <20200829142501.31478-1-krzk@kernel.org>
 <CGME20200829142602eucas1p1ce457a8fddc6b1fba4bf8c08992fa0b3@eucas1p1.samsung.com>
 <20200829142501.31478-9-krzk@kernel.org>
 <4eb7d0d9-29e2-9162-4521-10e4422f9c71@samsung.com>
 <021495a9-7a00-eb91-ddfa-885cc2fb5462@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <021495a9-7a00-eb91-ddfa-885cc2fb5462@samsung.com>
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
 linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, David Airlie <airlied@linux.ie>,
 Mark Brown <broonie@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Sangbeom Kim <sbkim73@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Kukjin Kim <kgene@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Sylwester Nawrocki <snawrocki@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 02, 2020 at 01:23:50PM +0200, Andrzej Hajda wrote:
> 
> On 31.08.2020 14:50, Marek Szyprowski wrote:
> > Hi Krzysztof,
> >
> > On 29.08.2020 16:25, Krzysztof Kozlowski wrote:
> >> The USB-C connector bindings require port@0.  Such port was already
> >> described in DTS but outside of the connector itself.  Put it into
> >> proper place to fix dtbs_check warnings like:
> >>
> >>     arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: musb_connector: ports: 'port@0' is a required property
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > I'm not sure if topic should be about USB-C, I will call it simply USB
> > connector node. TM2(e) uses Samsung's 11-pin micro USB 2.0 connector,
> > which has nothing in common with USB Type-C.
> >
> > Anyway, this patch breaks DWC3 (tested in Device mode) driver operation,
> > so something has to be somehow adjusted or fixed. Added CC Andrzej
> > Hajda, who actually worked on this.
> >
> >> ---
> >>
> >> Not tested on HQ. Please kindly review and test.
> >>
> >> Best regards,
> >> Krzysztof
> >> ---
> >>    .../boot/dts/exynos/exynos5433-tm2-common.dtsi    | 15 +++++++--------
> >>    1 file changed, 7 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> >> index 6246cce2a15e..bab6c1addd5f 100644
> >> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> >> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> >> @@ -871,6 +871,13 @@
> >>    					#address-cells = <1>;
> >>    					#size-cells = <0>;
> >>    
> >> +					port@0 {
> >> +						reg = <0>;
> >> +						muic_to_usb: endpoint {
> >> +							remote-endpoint = <&usb_to_muic>;
> >> +						};
> >> +					};
> >> +
> 
> 
> According to not-yet-yaml documentation of dt-bindings (patch 05/10):
> > -Required nodes:
> > -- any data bus to the connector should be modeled using the OF graph bindings
> > -  specified in bindings/graph.txt, unless the bus is between parent node and
> > -  the connector.
> 
> This is 'unless' case - muic is parent of the connector, so the port 0 is not necessary.
> 
> 
> >>    					port@3 {
> >>    						reg = <3>;
> >>    						musb_con_to_mhl: endpoint {
> >> @@ -879,14 +886,6 @@
> >>    					};
> >>    				};
> >>    			};
> >> -
> >> -			ports {
> >> -				port {
> >> -					muic_to_usb: endpoint {
> >> -						remote-endpoint = <&usb_to_muic>;
> >> -					};
> >> -				};
> 
> 
> And this port belongs to MUIC - it describes connection between USB-HOST 
> and MUIC, it has nothing to do with the connector, and is necessary.

Thanks for checking this. It's really appreciated!

I'll work on v2 later to address the schema warning, hopefully without
breaking things...

Best regards,
Krzysztof

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
