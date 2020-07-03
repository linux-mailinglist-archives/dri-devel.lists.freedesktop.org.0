Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6A5215313
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5896E2BD;
	Mon,  6 Jul 2020 07:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354B66EB5A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 11:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593774803; bh=PK9XQwVLZikvPIqIQvVj+rgD6Y+uR8PxJm+ULrZzNEY=;
 h=Date:From:To:Subject:References:X-My-GPG-KeyId:From;
 b=S7oWV+ePVh3bfJXlbi+307IscRv04ljcgUCHfqikI/1D//XWGqaz4mN46BGZAazVj
 5bdCe0vCNFUu1n/lHJ7onleN+X9HghCqqMprndSR8s+JCw/aKbIpo8LQ8SKVK0q3vR
 b1gDz1xB4J3mN4HoEExzY3QakP/cqkk5MQuGnFsE=
Date: Fri, 3 Jul 2020 13:13:23 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
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
Message-ID: <20200703111323.zcmv3cuo7toa4d3g@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>,
 linux-kernel@vger.kernel.org, Purism Kernel Team <kernel@puri.sm>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, Bhushan Shah <bshah@kde.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-sunxi@googlegroups.com, Luca Weiss <luca@z3ntu.xyz>,
 Martijn Braam <martijn@brixit.nl>, Icenowy Zheng <icenowy@aosc.io>,
 Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
References: <20200701162928.1638874-1-megous@megous.com>
 <20200701162928.1638874-3-megous@megous.com>
 <20200702205143.GA1670522@bogus>
 <20200702210354.562wkzpdmyrlwojx@core.my.home>
 <20200703051155.GA1685118@ravnborg.org>
 <20200703104448.iwhxk77d2hyrr3x5@core.my.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703104448.iwhxk77d2hyrr3x5@core.my.home>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:18 +0000
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

On Fri, Jul 03, 2020 at 12:44:48PM +0200, megous hlavni wrote:
> Hello Sam,
> 
> On Fri, Jul 03, 2020 at 07:11:55AM +0200, Sam Ravnborg wrote:
> > Hi Ondrej.
> > 
> > > > My bot found errors running 'make dt_binding_check' on your patch:
> > > > 
> > > > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: panel@0: '#address-cells', '#size-cells', 'port@0' do not match any of the regexes: 'pinctrl-[0-9]+'
> > > > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: panel@0: 'vcc-supply' is a required property
> > > > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: panel@0: 'iovcc-supply' is a required property
> > > > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: panel@0: 'reset-gpios' is a required property
> > > 
> > > Paths look bogus ^^^^
> > > 
> > > It should be .../rocktech,jh057n00900.yaml: ...
> > 
> > The example in nwl-dsi.yaml contains:
> > 	compatible = "rocktech,jh057n00900";
> > 
> > So the example is checked against your updated binding.
> > And the binding check fails because the example is no longer valid.
> 
> Ah, now I understand.
> 
> > This needs to be fixed as we do not wat to introduce new errors.
> > Either the example or the binding needs the fix.
> 
> I think we can unrequire the supplies, but reset is needed really.

Hmm, that's probably wrong kind of thinking. Panel has the supplies, and
obviously requires them, so the dts must describe them somehow, even if
they are the fixed supplies. So I'll not unrequire them.

> The panel only has one port, so there should be no address/size-cells
> in the example, and port@0 should be just port to match existing binding.
> If it had  multiple ports, port@0 would have to be inside ports { } node
> anyway, according to the existing binding. Then add reset-gpios to
> the example...
> 
> And that should fix it.
> 
> I'll prepare the patch shortly.
> 
> regards,
> 	o.
> 
> > 	Sam
> > 
> > 
> > > 
> > > regards,
> > > 	o.
> > > 
> > > > 
> > > > See https://patchwork.ozlabs.org/patch/1320690
> > > > 
> > > > If you already ran 'make dt_binding_check' and didn't see the above
> > > > error(s), then make sure dt-schema is up to date:
> > > > 
> > > > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> > > > 
> > > > Please check and re-submit.
> > > > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
