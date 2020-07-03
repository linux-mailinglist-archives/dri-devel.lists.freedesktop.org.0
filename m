Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C66CD21336C
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 07:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B9A6E8C2;
	Fri,  3 Jul 2020 05:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15ECD6E8C2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 05:12:05 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7FE7C80615;
 Fri,  3 Jul 2020 07:11:57 +0200 (CEST)
Date: Fri, 3 Jul 2020 07:11:55 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Rob Herring <robh@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 linux-kernel@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, Bhushan Shah <bshah@kde.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-sunxi@googlegroups.com, Luca Weiss <luca@z3ntu.xyz>,
 Martijn Braam <martijn@brixit.nl>, Icenowy Zheng <icenowy@aosc.io>,
 Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v7 02/13] dt-bindings: panel: Convert rocktech,
 jh057n00900 to yaml
Message-ID: <20200703051155.GA1685118@ravnborg.org>
References: <20200701162928.1638874-1-megous@megous.com>
 <20200701162928.1638874-3-megous@megous.com>
 <20200702205143.GA1670522@bogus>
 <20200702210354.562wkzpdmyrlwojx@core.my.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702210354.562wkzpdmyrlwojx@core.my.home>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=voM4FWlXAAAA:8 a=YG64nluAAAAA:20
 a=b3wYd58VKnsUGY093mYA:9 a=CjuIK1q_8ugA:10 a=IC2XNlieTeVoXbcui8wp:22
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ondrej.

> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: panel@0: '#address-cells', '#size-cells', 'port@0' do not match any of the regexes: 'pinctrl-[0-9]+'
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: panel@0: 'vcc-supply' is a required property
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: panel@0: 'iovcc-supply' is a required property
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: panel@0: 'reset-gpios' is a required property
> 
> Paths look bogus ^^^^
> 
> It should be .../rocktech,jh057n00900.yaml: ...

The example in nwl-dsi.yaml contains:
	compatible = "rocktech,jh057n00900";

So the example is checked against your updated binding.
And the binding check fails because the example is no longer valid.

This needs to be fixed as we do not wat to introduce new errors.
Either the example or the binding needs the fix.

	Sam


> 
> regards,
> 	o.
> 
> > 
> > See https://patchwork.ozlabs.org/patch/1320690
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure dt-schema is up to date:
> > 
> > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> > 
> > Please check and re-submit.
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
