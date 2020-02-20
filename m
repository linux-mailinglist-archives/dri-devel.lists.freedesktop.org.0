Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC69E167BC5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730606F3FE;
	Fri, 21 Feb 2020 11:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D706EE21
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 17:57:32 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1A6C8A41;
 Thu, 20 Feb 2020 12:57:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 20 Feb 2020 12:57:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=wXvR2MOzGGKMeex/rwCGSt8o0uR
 MlmGZ+1htdhsNHVY=; b=FSixFcAeLhxoF0aMmTSsOSCcuHNvzK2b/uENeMaYkai
 aTwkNC+U9KiGSozW1N7u1MImfDF6vueb+FnJ9v0i+FOXWRyqIa3beGiQQuUTb5wF
 j+mA3nGrpNBKvhDr2dx1W9AKH36zVV82ZIS5NRwgNNWf7P+uokKWB3rJTiX+0TIS
 2OUslNvZYKRu7LJdn0y3IF/CXxv/CeTYOs94VGGXXdy8MhUeDyf/Q/NsmdDc58Ra
 c2s6msJhE9Z8z3pMMTv3W3LPwah7WpC5QzLSARoSJ3QKG/B1IOqtq2vI87Wm8ec5
 EFk4tkrMDWAl/ixyqkZLI2bVBMEYo0NYqHdkOryenbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wXvR2M
 OzGGKMeex/rwCGSt8o0uRMlmGZ+1htdhsNHVY=; b=0nGLSUnVDW/VMUcgt2BawK
 xswGcY8U5iAG/QBsP+afDXx1XYg70g3XSGK7BoF6AIrw2lOxqWdcdFCZ1ar0XEkh
 9wH9zc7dVS62gKop1r9mjSLec0fjW4GeZZHpP2rI8i4E91uNmfJXa8+JwuG3l5Fx
 IKzgsF4vJyD1mhrQyXC7RxHaol54YcRScX/ROfj3tLUmGTCYLRVFJPjxoSGfj7P+
 nojvaxrIKnGY1/2b3pBOmitWda4qe20DSiAdLub8j682h671/Z5S07upvZ1A4hZa
 8bFggf+Cz+iqWPBa6GQJlLLOnrocr88SiSlqt9fpgqR25TEubCBYxfJsNqWjxmug
 ==
X-ME-Sender: <xms:ishOXlXOEgfsMi6848XIHWWUltCnrx29K_fKr55njtnzc8K9kDWZew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedvgddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ishOXkWdoSgqt2HIcRZQnZ60R1ygMg4IAL1JueheI8jXmC-kte1mRw>
 <xmx:ishOXl_rN6h0hRN7zhFeYfvZnNtLPqJYIaaiAj7397by2QmGoWZ7kg>
 <xmx:ishOXkaGvA8c7M7IFtuoZ1uOLcPRgUXf1jKan9xr9FXPtZcfPPIYkQ>
 <xmx:jMhOXtESZmyQrq5gR0B_rWD0mb4JMGwh_lYgGqt-zMV3XO9XnvNuTg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id F27E63060BD1;
 Thu, 20 Feb 2020 12:57:29 -0500 (EST)
Date: Thu, 20 Feb 2020 18:57:28 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 2/4] dt-bindings: panel: lvds: Add properties for clock
 and data polarities
Message-ID: <20200220175728.6wuipezjp23coevq@gilmour.lan>
References: <cover.b12a054012ce067fa2094894147f953ab816d8d0.1581682983.git-series.maxime@cerno.tech>
 <620a740cec4186177ce346b092d4ba451e1420dc.1581682983.git-series.maxime@cerno.tech>
 <20200214161156.GA18287@ravnborg.org>
MIME-Version: 1.0
In-Reply-To: <20200214161156.GA18287@ravnborg.org>
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:24 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0213797906=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0213797906==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jmue7eu7rmn5vtgj"
Content-Disposition: inline


--jmue7eu7rmn5vtgj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 14, 2020 at 05:11:56PM +0100, Sam Ravnborg wrote:
> Hi Maxime.
>
> On Fri, Feb 14, 2020 at 01:24:39PM +0100, Maxime Ripard wrote:
> > Some LVDS encoders can support multiple polarities on the data and
> > clock lanes, and similarly some panels require a given polarity on
> > their inputs. Add a property on the panel to configure the encoder
> > properly.
> >
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>
> Not a fan of this binding...
> In display-timing.txt we have a specification/description of
> the panel-timing node.
>
> The panel-timing node already include information such as:
> - hsync-active:
> - vsync-active:
> - de-active:
> - pixelclk-active:
> - syncclk-active:
>
> But clock-active-low and data-active-low refer to the bus
> more than an individual timing.
> So maybe OK not to have it in a panel-timing node.
> But then it would IMO be better to include
> this in the display-timing node - so we make
> this available and standard for all users of the
> display-timing node.
>
> I will dig up my patchset to make proper bindings for panel-timing and
> display-timing this weeked and resend them.
> Then we can discuss if this goes on top or this is specific for the
> lvds binding.

That makes sense, I'll wait for them to be merged then :)

>
> > ---
> >  Documentation/devicetree/bindings/display/panel/lvds.yaml | 10 ++++++++-
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > index d0083301acbe..4a1111a1ab38 100644
> > --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > @@ -90,6 +90,16 @@ properties:
> >        CTL2: Data Enable
> >        CTL3: 0
> >
> > +  clock-active-low:
> > +    type: boolean
> > +    description: >
>
> Should this be "|" and not ">"?
> Did this pass dt_binding_check?

Yes. > means that this is a multi-line string that will drop the \n
between each line, while | will keep it

For a string like this, I believe it makes more sense to let whatever
is using to handle the wrapping, but I don't really have a strong
opinion :)

>
> > +      If set, reverse the clock polarity on the clock lane.
> This text could be a bit more specific. If this is set then
> what?
> And it seems strange that a clock is active low.
> For a clock we often talk about raising or falling edge.
>
> > +
> > +  data-active-low:
> > +    type: boolean
> > +    description: >
> Same comment with ">"
>
> > +      If set, reverse the bit polarity on all data lanes.
> Same comment about a more explicit description.

I'll try to come up with something better. Thanks!
Maxime

--jmue7eu7rmn5vtgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXk7IiAAKCRDj7w1vZxhR
xcZiAQDFmtyS5WHek/hmzjWFFwIPRkMeuRUG6dZvUn8HIDH6uQD9EvR2HxBQfUVQ
a2jdAtufNDa8xmkO5CE+KyDuJBeH6wA=
=puow
-----END PGP SIGNATURE-----

--jmue7eu7rmn5vtgj--

--===============0213797906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0213797906==--
