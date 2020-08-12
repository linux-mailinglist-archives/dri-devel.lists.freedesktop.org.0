Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E60242620
	for <lists+dri-devel@lfdr.de>; Wed, 12 Aug 2020 09:35:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C8B6E063;
	Wed, 12 Aug 2020 07:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D59136E063
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 07:34:57 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 63B1920025;
 Wed, 12 Aug 2020 09:34:55 +0200 (CEST)
Date: Wed, 12 Aug 2020 09:34:54 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2 v1] dt-bindings: backlight: Add Kinetic KTD253 bindings
Message-ID: <20200812073454.GA584918@ravnborg.org>
References: <20200720203506.3883129-1-linus.walleij@linaro.org>
 <20200721083228.GA283099@ravnborg.org>
 <CACRpkdbuihAwvsx4QmV6PnVM5aDFMiaR9h-8aBF8EzXRGZ1XNA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdbuihAwvsx4QmV6PnVM5aDFMiaR9h-8aBF8EzXRGZ1XNA@mail.gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=KXZ1VkjrvZVwxbFKkKMA:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Lee Jones <lee.jones@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus.

On Wed, Aug 12, 2020 at 08:48:42AM +0200, Linus Walleij wrote:
> On Tue, Jul 21, 2020 at 10:32 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> 
> > > +description: |
> > > +  The Kinetic Technologies KTD253 is a white LED backlight that is
> > > +  controlled by a single GPIO line. If you just turn on the backlight
> > > +  it goes to maximum backlight then you can set the level of backlight
> > > +  using pulses on the enable wire.
> >
> > No $ref for common.yaml?
> 
> Since this is a backlight, and we do not have common bindings for,
> backlight I first looked into using the LED bindings in
> ../common.yaml, but that has several problems, it cannot really
> be used for backlight. Backlight doesn't have "triggers",
> patterns, flash properties, the function is also pretty much
> evident.
> 
> So I will look into creating a new common for backlight.
Hmm, I think I looked at leds/ when I wrote that comment about
common.yaml.

Please consider Rob's comment in commit: 44e1655a444fe7a1bd81994d34c6bbb5245b9e60
("dt-bindings: backlight: Convert common backlight bindings to DT
schema")

Rob did not see the need for a common binding - but that may change as
we add more backlight bindings.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
