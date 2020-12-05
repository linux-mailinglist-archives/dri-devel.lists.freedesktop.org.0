Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4662CFE9B
	for <lists+dri-devel@lfdr.de>; Sat,  5 Dec 2020 20:55:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0436E446;
	Sat,  5 Dec 2020 19:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C42636E446
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Dec 2020 19:55:28 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 7BB35804C8;
 Sat,  5 Dec 2020 20:55:26 +0100 (CET)
Date: Sat, 5 Dec 2020 20:55:25 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/4] dt-bindings: display: Add ABT Y030XX067A panel
 bindings
Message-ID: <20201205195525.GI332836@ravnborg.org>
References: <20201101093150.8071-1-paul@crapouillou.net>
 <20201101093150.8071-3-paul@crapouillou.net>
 <20201101122900.GB1269759@ravnborg.org>
 <9CZ5JQ.CWYPSJ8EDOW4@crapouillou.net>
 <CAL_JsqLSGMFibm8tVKqNe1SFBzXTU2=M2jZmpfrHeGUqS3foRg@mail.gmail.com>
 <1XJMKQ.YER47WG3D7R41@crapouillou.net>
 <CAL_JsqJDQMzHjtYa6ZCOxXW_U5nWrS+DhBj-w2myn-SkGB+KCA@mail.gmail.com>
 <MXPMKQ.PSU8COVVM0IV2@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MXPMKQ.PSU8COVVM0IV2@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Itgwjo3g c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=aP72JqY-3imoCIW2L10A:9
 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christophe Branchereau <cbranchereau@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul

> > >  >>  >>  +
> > >  >>  >>  +maintainers:
> > >  >>  >>  +  - Paul Cercueil <paul@crapouillou.net>
> > >  >>  >>  +
> > >  >>  >>  +allOf:
> > >  >>  >>  +  - $ref: panel-common.yaml#
> > >  >>  >>  +
> > >  >>  >>  +properties:
> > >  >>  >>  +  compatible:
> > >  >>  >>  +    const: abt,y030xx067a
> > >  >>  >>  +
> > >  >>  >>  +  backlight: true
> > >  >>  >>  +  port: true
> > >  >>  >>  +  power-supply: true
> > >  >>  >>  +  reg: true
> > >  >>  >>  +  reset-gpios: true
> > >  >>  >
> > >  >>  > The binding is missing:
> > >  >>  > required:
> > >  >>  >   - compatible
> > >  >>  >   - reg
> > >  >>  >   - power-supply
> > >  >>  >   - reset-gpios
> > >  >>  >   - ...
> > >  >>  >
> > >  >>  > additionalProperties: false
> > >  >>  >
> > >  >>  > So r-b only with these added.
> > >  >>
> > >  >>  Stupid mistake, sorry about that.
> > >  >>
> > >  >>  I'll V2.
> > >  >
> > >  > I don't have any V2 in my inbox, but looks like it is in
> > > linux-next
> > >  > now:
> > > 
> > >  Yes, Sam told me on IRC I could fix it while applying and avoid the
> > > V2.
> > > 
> > >  > /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.example.dt.yaml:
> > >  > panel@0: 'spi-max-frequency' does not match any of the regexes:
> > >  > 'pinctrl-[0-9]+'
> > >  >  From schema:
> > >  > /builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml
> > > 
> > >  "make dt_binding_check
> > > DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml"
> > >  doesn't complain here :(
> > 
> > Even if you do 'touch
> > Documentation/devicetree/bindings/display/panel/abt,y030xx067a.yaml'
> > or do a clean build?
> > 
> > I can't think of any kernel or dt-schema changes which would explain
> > the difference. This is purely related to 'additionalProperties:
> > false'.
> 
> Ok, I see it now.
> Should I use 'unevaluatedProperties: false' instead?

Yes, the issue here is that you add a number of spi properties to the
binding. And you cannot or at least shall not, list them all in this
binding.
So when evaluating the binding the spi-max-frequency should be allowed,
and when a full DT file is checked the tools will catch it there is a
binding that is not known - as you tell it with "unevaluatedProperties:
false" that all prperties must be known.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
