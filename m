Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F77215301
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE1E6E1B2;
	Mon,  6 Jul 2020 07:19:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173506E0FE
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 10:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593773088; bh=nrh0KH3J1yRnIENV/8zoqi7FGv+zeQdvh0IitngxK0Y=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=bOsFxfpm7+YVeVF6lMZ7ESyBG9Mwl6LGVE+CCno+DbO2ejqDClY6BUiSyoPu0TRYk
 Xa8+qSCWumhmlSTrd90JG6QCyWwxVOeP0KYLZVFFnmjy/fM6mfauaQF3X0jXFZQG+H
 FZw9vAu834beeDCk2qCS7l0BIkK+VRwyUrOKCbHM=
Date: Fri, 3 Jul 2020 12:44:48 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v7 02/13] dt-bindings: panel: Convert rocktech,
 jh057n00900 to yaml
Message-ID: <20200703104448.iwhxk77d2hyrr3x5@core.my.home>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703051155.GA1685118@ravnborg.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
 Purism Kernel Team <kernel@puri.sm>, dri-devel@lists.freedesktop.org,
 Samuel Holland <samuel@sholland.org>, David Airlie <airlied@linux.ie>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, Bhushan Shah <bshah@kde.org>,
 linux-kernel@vger.kernel.org, Martijn Braam <martijn@brixit.nl>,
 Luca Weiss <luca@z3ntu.xyz>, Rob Herring <robh+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>,
 devicetree@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Sam,

On Fri, Jul 03, 2020 at 07:11:55AM +0200, Sam Ravnborg wrote:
> Hi Ondrej.
> 
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > > 
> > > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: panel@0: '#address-cells', '#size-cells', 'port@0' do not match any of the regexes: 'pinctrl-[0-9]+'
> > > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: panel@0: 'vcc-supply' is a required property
> > > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: panel@0: 'iovcc-supply' is a required property
> > > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/bridge/nwl-dsi.example.dt.yaml: panel@0: 'reset-gpios' is a required property
> > 
> > Paths look bogus ^^^^
> > 
> > It should be .../rocktech,jh057n00900.yaml: ...
> 
> The example in nwl-dsi.yaml contains:
> 	compatible = "rocktech,jh057n00900";
> 
> So the example is checked against your updated binding.
> And the binding check fails because the example is no longer valid.

Ah, now I understand.

> This needs to be fixed as we do not wat to introduce new errors.
> Either the example or the binding needs the fix.

I think we can unrequire the supplies, but reset is needed really.

The panel only has one port, so there should be no address/size-cells
in the example, and port@0 should be just port to match existing binding.
If it had  multiple ports, port@0 would have to be inside ports { } node
anyway, according to the existing binding. Then add reset-gpios to
the example...

And that should fix it.

I'll prepare the patch shortly.

regards,
	o.

> 	Sam
> 
> 
> > 
> > regards,
> > 	o.
> > 
> > > 
> > > See https://patchwork.ozlabs.org/patch/1320690
> > > 
> > > If you already ran 'make dt_binding_check' and didn't see the above
> > > error(s), then make sure dt-schema is up to date:
> > > 
> > > pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> > > 
> > > Please check and re-submit.
> > > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
