Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD5B1AC027
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 13:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30AF6E3EF;
	Thu, 16 Apr 2020 11:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 883F36E3EF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 11:50:38 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 68EBC20022;
 Thu, 16 Apr 2020 13:50:35 +0200 (CEST)
Date: Thu, 16 Apr 2020 13:50:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 02/36] dt-bindings: display: look for dsi* nodes in
 dsi-controller
Message-ID: <20200416115033.GA5785@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
 <20200408195109.32692-3-sam@ravnborg.org>
 <CACRpkdYVY7eqrWctUm2GzzZ=1y9Cznya8HUYTDco2bA8Z9Hq1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdYVY7eqrWctUm2GzzZ=1y9Cznya8HUYTDco2bA8Z9Hq1Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=6jNYHG2WMrghLeowZv4A:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22 a=AjGcO6oz07-iQ99wixmX:22
 a=cvBusfyB2V15izCimMoJ:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus.

On Thu, Apr 16, 2020 at 01:26:32PM +0200, Linus Walleij wrote:
> On Wed, Apr 8, 2020 at 9:51 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> 
> > Rob wrote:
> >
> >     Uhhh, it's looking for dsi-controller(@.*)? which is not the common
> >     case found in dts files. We should fix that to dsi(@.*)?.
> >
> > See: https://lore.kernel.org/dri-devel/20200319032222.GK29911@bogus/
> >
> > Fix it.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Rob Herring <robh@kernel.org>
> 
> I think I was instructed to use dsi-controller@ at some point but I
> suppose it was a misunderstanding.
> Acked-by: Linus Walleij <linus.walleij@linaro.org>

I have already applied this and most other patches.
I tried to post a follow-up on the first mail to tell so,
but it was flagged as spam.

So this and your other feddback from today did not hit mainline - sorry.
But thanks anyway!

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
