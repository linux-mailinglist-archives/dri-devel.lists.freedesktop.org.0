Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927495B0E07
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C13410E871;
	Wed,  7 Sep 2022 20:21:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D46EC10E870
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 20:21:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A963B888;
 Wed,  7 Sep 2022 22:21:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1662582107;
 bh=8c/fUY8QUs/lP/8j33sMEezdSJqoI4bgymZKuGViIfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mSn8zCXMrSlGu5BeDpv0dMHuHjy2fAf1yWpnb+MoxXnQLMOqUGVVp3uglyokbplRm
 y2nJ00FuQkYQJgjWm3ELuPg2gBgfEqxIqk4cEofCGF0ervMY300yI0Z7AJ9t1KTJAF
 OAaCaWF3sZsyg0NEG9XMNtVwNnT/4TYzye1Xe2Vg=
Date: Wed, 7 Sep 2022 23:21:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: Add byteswap order to chrontel ch7033
Message-ID: <Yxj9TLAbthqowJkM@pendragon.ideasonboard.com>
References: <20220902153906.31000-1-macroalpha82@gmail.com>
 <20220902153906.31000-2-macroalpha82@gmail.com>
 <YxKdE7ZQ97NsuqZk@pendragon.ideasonboard.com>
 <CAG3jFyu5_ZOn48=y=5u=NyALefczQUxiwVJnJW=irvE5sK4tKw@mail.gmail.com>
 <SN6PR06MB5342DE0461F8573CE1E6DC54A5419@SN6PR06MB5342.namprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SN6PR06MB5342DE0461F8573CE1E6DC54A5419@SN6PR06MB5342.namprd06.prod.outlook.com>
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
Cc: jernej.skrabec@gmail.com, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, dri-devel@lists.freedesktop.org,
 Chris Morgan <macroalpha82@gmail.com>, lkundrak@v3.sk, andrzej.hajda@intel.com,
 robh+dt@kernel.org, Robert Foss <robert.foss@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chris,

On Wed, Sep 07, 2022 at 08:29:06AM -0500, Chris Morgan wrote:
> On Mon, Sep 05, 2022 at 05:20:57PM +0200, Robert Foss wrote:
> > On Sat, 3 Sept 2022 at 02:17, Laurent Pinchart wrote:
> > > On Fri, Sep 02, 2022 at 10:39:05AM -0500, Chris Morgan wrote:
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > >
> > > > Update dt-binding documentation to add support for setting byteswap of
> > > > chrontel ch7033.
> > > >
> > > > New property name of chrontel,byteswap added to set the byteswap order.
> > > > This property is optional.
> > > >
> > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > > > ---
> > > >  .../bindings/display/bridge/chrontel,ch7033.yaml    | 13 +++++++++++++
> > > >  1 file changed, 13 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> > > > index bb6289c7d375..984b90893583 100644
> > > > --- a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> > > > @@ -14,6 +14,19 @@ properties:
> > > >    compatible:
> > > >      const: chrontel,ch7033
> > > >
> > > > +  chrontel,byteswap:
> > > > +    $ref: /schemas/types.yaml#/definitions/uint8
> > > > +    enum:
> > > > +      - 0  # BYTE_SWAP_RGB
> > > > +      - 1  # BYTE_SWAP_RBG
> > > > +      - 2  # BYTE_SWAP_GRB
> > > > +      - 3  # BYTE_SWAP_GBR
> > > > +      - 4  # BYTE_SWAP_BRG
> > > > +      - 5  # BYTE_SWAP_BGR
> > > > +    description: |
> > > > +      Set the byteswap value of the bridge. This is optional and if not
> > > > +      set value of BYTE_SWAP_BGR is used.
> > >
> > > I don't think this belongs to the device tree. The source of data
> > > connected to the CH7033 input could use different formats. This
> > > shouldn't be hardcoded, but queried at runtime, using the input and
> > > output media bus formats infrastructure that the DRM bridge framework
> > > includes.
> > 
> > Chris, will you have a look at submitting a fix for this during the coming days?
> > 
> > If not, we can revert this series and apply a fixed version later.
> 
> I'm not sure I understand (or know) what needs to be fixed. Presumably
> using something like EDID we can predict what color format we need to
> use for the connection between the bridge and the HDMI device, but
> wouldn't the color format between the SoC and bridge need to be
> constant?

Not necessarily. Some display engines can output different formats. You
should be able to get the selected format at the bridge input from the
drm_bridge_state. Could you please give that a try ?

> If there's something I'm missing please let me know, I'm relatively
> unfamiliar with the display subsystems as a whole. I'll be happy
> to make the change once I'm clear what I need to change.
> 
> Thank you for your help.
> 
> > > > +
> > > >    reg:
> > > >      maxItems: 1
> > > >      description: I2C address of the device

-- 
Regards,

Laurent Pinchart
