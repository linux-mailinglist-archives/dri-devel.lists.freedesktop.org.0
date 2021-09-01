Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E473FE309
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 21:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4567899DB;
	Wed,  1 Sep 2021 19:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A94899DB
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 19:29:21 +0000 (UTC)
Received: from g550jk.localnet (ip-213-127-63-121.ip.prioritytelecom.net
 [213.127.63.121])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id 4280ACA11B;
 Wed,  1 Sep 2021 19:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1630524559; bh=0H/X2fUD2T06MoUgfBCJPfMjregzSG/7Yg0C8emnr9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=eKxmw25/GlXk8ZgdZq1qnrFluDvsDRg+0AGxqUiqp9JyElSo/UnkDtjzPRM/1N//w
 pjkMeEpP/jPg9VJpMMEVa9zkZQyBOSbEBfiFWsOosYObhELen29s7ek5vN2xaCRU6H
 PPOhDZCJtPg4xC0KuZ/5t6wAV8T/wI9fTYboOJT4=
From: Luca Weiss <luca@z3ntu.xyz>
To: Rob Herring <robh@kernel.org>
Cc: linux-fbdev@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: add missing simple-framebuffer
 formats
Date: Wed, 01 Sep 2021 21:29:18 +0200
Message-ID: <1648705.hQpMTjSAMY@g550jk>
In-Reply-To: <YS6fZ4nFgic1DYhR@robh.at.kernel.org>
References: <20210828110206.142899-1-luca@z3ntu.xyz>
 <YS6fZ4nFgic1DYhR@robh.at.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Dienstag, 31. August 2021 23:30:15 CEST Rob Herring wrote:
> On Sat, Aug 28, 2021 at 01:02:05PM +0200, Luca Weiss wrote:
> > Document all formats currently present in include/linux/platform_data/
> > simplefb.h
> > 
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > 
> >  .../bindings/display/simple-framebuffer.yaml         | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> > b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml index
> > c2499a7906f5..c1acd2859ae8 100644
> > --- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> > +++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
> > 
> > @@ -83,13 +83,25 @@ properties:
> >    format:
> >      description: >
> >      
> >        Format of the framebuffer:
> > +        * `a1r5g5b5` - 16-bit pixels, d[15]=a, d[14:10]=r, d[9:5]=g,
> > d[4:0]=b +        * `a2r10g10b10` - 32-bit pixels, d[31:30]=a,
> > d[29:20]=r, d[19:10]=g, d[9:0]=b
> Not a new problem, but are these 32-bit big or little endian words? That
> should be figured out before we add more.

As I'm neither involved in the driver nor really have any knowledge on pixel 
formats, maybe the maintainers of the binding can help out here?
(Bartlomiej Zolnierkiewicz & Hans de Goede, both are CC'ed)

I can probably dig through the sources and guess but documentation should be 
written without guessing :)

Regards
Luca




