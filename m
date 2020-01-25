Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D51149726
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2020 19:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7796E8DF;
	Sat, 25 Jan 2020 18:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6523B6E8DF
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2020 18:26:47 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 60F828055C;
 Sat, 25 Jan 2020 19:26:44 +0100 (CET)
Date: Sat, 25 Jan 2020 19:26:43 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: display: add panel-timing.yaml
Message-ID: <20200125182642.GA31645@ravnborg.org>
References: <20200120200641.15047-1-sam@ravnborg.org>
 <20200120200641.15047-2-sam@ravnborg.org>
 <20200121072930.6qk2ylrb3p4qjfqz@gilmour.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200121072930.6qk2ylrb3p4qjfqz@gilmour.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=C9uTFCPKrCGP_rPuPcAA:9 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime.

Thanks for your comments!
> 
> > +      - allOf:
> > +        - $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        - minItems: 3
> > +          maxItems: 3
> > +          items:
> > +            description: min, typ, max number of pixels
> 
> When minItems and maxitems are equal, you can just set one, the other
> one will be filled by the DT schemas tools.

I tried to drop minItems: 3
But it just did not work - I could not make it
accept <xx> and <xx xx xx>.

And the schema should, and does, reject <xx xx> and <xx xx xx xx>

I do not know why - I just did a trial-and-error on this.

> > +  hsync-active:
> > +    description: |
> > +      Horizontal sync pulse.
> > +      If omitted then it is not used by the hardware
> > +    oneOf:
> > +      - const: 0
> > +        description: active low
> > +      - const: 1
> > +        description: active high
> 
> You probably should use an enum here (and in other similar
> places). oneOf / anyOf / allOF errors are pretty cryptic, while it
> will it's really better with an enum.

Yep - enum: [0, 1] is much nicer.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
