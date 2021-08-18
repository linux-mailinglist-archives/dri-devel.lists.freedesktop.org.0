Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8303F0536
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 15:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B94899F3;
	Wed, 18 Aug 2021 13:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC56899F3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 13:49:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C59EE610C7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 13:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629294539;
 bh=3d/r0rH82Ey9YBWihKynZopMtUG/4vN1LMoq18TvMS8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rc38DWNtBDV7VojjFSXi7IbmxYaNytSXR1l7Hcww7UqG5JLo9+6MDUAtjECWeMT/+
 2hmo+hAxbGAhdOFbf3el4S29ogtpDC5uNFNQJq/mQ2/1IdZRPtRp343lRdhE681OD6
 5DJZMn+HsUOMKm3UIptiKfa6491obP5sWMiQHrurxqakgM1Q0uaUZsmv5557wpsSnG
 7Kg1bqBUeKIqjglfd+xbqWy8yip0b+k3GSjRO23khuBWvorOq99wLWkskgP/FvUJfH
 Emw+C1RVaLfm3xD3j0I/Sgoc8FWF8yqYcHQ8/0Izd6Sbspp71OkmlNh1dqqDlU4h6+
 4jUniSTbLVHRw==
Received: by mail-ed1-f51.google.com with SMTP id by4so3328305edb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 06:48:59 -0700 (PDT)
X-Gm-Message-State: AOAM531Lg76EBVRFWZj//9CBwipfah8958ZtraMTBmKZCY7tEivE3rIR
 6/tzoPWlR87TGR/m4K8nUguO9lc3SrElBpjxVA==
X-Google-Smtp-Source: ABdhPJyNyNVlAVmZYQ+7HoUkF0ChQiGO8tNXo0yVR4wbbxUAJsucTNHTT2Zlf9jpt5RmNIv1toalySAap6px4WTmfvs=
X-Received: by 2002:a05:6402:1215:: with SMTP id
 c21mr10340421edw.137.1629294538363; 
 Wed, 18 Aug 2021 06:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210721140424.725744-1-maxime@cerno.tech>
 <20210721140424.725744-11-maxime@cerno.tech>
 <20210722022947.GA3168293@robh.at.kernel.org>
 <20210818124304.2jxsf44bcbprcvbk@gilmour>
In-Reply-To: <20210818124304.2jxsf44bcbprcvbk@gilmour>
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Aug 2021 08:48:46 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJjnGhXpfvPWU0HM8YHk5PyDup7ors3ewa17vc0bnVCmQ@mail.gmail.com>
Message-ID: <CAL_JsqJjnGhXpfvPWU0HM8YHk5PyDup7ors3ewa17vc0bnVCmQ@mail.gmail.com>
Subject: Re: [PATCH 10/54] dt-bindings: display: panel-lvds: Document panel
 compatibles
To: Maxime Ripard <maxime@cerno.tech>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-sunxi@googlegroups.com, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Aug 18, 2021 at 7:43 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Rob, Sam,
>
> On Wed, Jul 21, 2021 at 08:29:47PM -0600, Rob Herring wrote:
> > On Wed, Jul 21, 2021 at 04:03:40PM +0200, Maxime Ripard wrote:
> > > The binding mentions that all the drivers using that driver must use a
> > > vendor-specific compatible but never enforces it, nor documents the
> > > vendor-specific compatibles.
> > >
> > > Let's make we document all of them, and that the binding will create an
> > > error if we add one that isn't.
> > >
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  .../bindings/display/panel/lvds.yaml           | 18 ++++++++++++------
> > >  1 file changed, 12 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > > index 49460c9dceea..d1513111eb48 100644
> > > --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > > +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > > @@ -31,12 +31,18 @@ allOf:
> > >
> > >  properties:
> > >    compatible:
> > > -    contains:
> > > -      const: panel-lvds
> > > -    description:
> > > -      Shall contain "panel-lvds" in addition to a mandatory panel-specific
> > > -      compatible string defined in individual panel bindings. The "panel-lvds"
> > > -      value shall never be used on its own.
> > > +    items:
> > > +      - enum:
> > > +          - advantech,idk-1110wr
> >
> > At least this one is documented elsewhere.
>
> Indeed, I missed it.
>
> > You can add 'minItems: 2' if you want to just enforce having 2 compatibles. Or do:
> >
> > items:
> >   - {}
> >   - const: panel-lvds
> >
> > Which also enforces the order.
>
> It's not just about the order since a missing compatible will also raise
> a warning.
>
> Some of those panels have a binding of their own, but some probably
> won't (and I can't find anything specific about the one I'm most
> interested in: tbs,a711-panel)
>
> Can we have something like:
>
> compatible:
>   oneOf:
>     - items:
>       - enum:
>         - tbs,a711-panel
>       - const: panel-lvds
>
>     - items:
>       - {}
>       - const: panel-lvds
>
> That would work for both cases I guess?

No, both conditions will be true. If you use 'anyOf', then we're never
really checking the specific compatible.

I think the problem here is trying to mix a common binding (aka an
incomplete collection of properties) and a specific binding. The
former is characterized with 'additionalProperties: true' as we have
here. You need to create a 'panel-simple-lvds.yaml' schema file that
references this one, defines all the 'simple' compatibles, and sets
'unevaluatedProperties: false'.

Rob
