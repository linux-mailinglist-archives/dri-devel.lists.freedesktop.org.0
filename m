Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A5145909B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 15:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E84289E59;
	Mon, 22 Nov 2021 14:53:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF6E89E50
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:53:50 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id BFFDB5C0221;
 Mon, 22 Nov 2021 09:53:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 22 Nov 2021 09:53:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=m
 vUrGpuD+JbSX9Ep04tSMhLcVf+WU9pfKE8IAeg6MKQ=; b=luveJAbTxz6poeVdg
 Qs/OzwsCwT/7VahsK7wR9TuAL2cRsb6xRM1gIG1u7EJK+RmU2XWEs0oatLDsSARq
 pf+My71lFPHGfQq8XfjcPqQEy0gxvuooPbXSfhyQtZlBXB5T8iD25MLQHsIiWzvd
 vnGKCBsf2ewurKWxKGxUyRMJWX0c6JzvIeIhq+lAGNWAaeGEP1+x7oJm8hOM7zfu
 jQJNf0k895nfM3wBQAg6/H85hTHe5biHi4QlhjpF2zz0gORuBCSta6zfdLoW/BwR
 5d5RCkZrwpYUp6S5wIcV62MLC9YEnCy40pjJPAYW6ydy6OYFBC2V+53Jl5jdW00K
 zy+HA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=mvUrGpuD+JbSX9Ep04tSMhLcVf+WU9pfKE8IAeg6M
 KQ=; b=g1JOPgcV+XpOKoo7+WvZsgTZgHeeFj14CPcU05M0uupjT9V14INgcd01j
 29AfAFAy3gQ9sVBAfEQgdXw/5uh+G802nVIs7kYcTlD446ByF8RELst4GAkjnDuL
 Y3Nf+vyX8PUm9thep2jezO1ZtYMISsCvLuQ+v4t5N5xnCOZJCFNgrkcos56mKXQY
 2smsQCeNYenlrML0L8MGoikZlLUa1HtF9h0mYtuqTiSV2Q8tyumLGQ6lkHFcKqyC
 5e3vcKUnup9WmF8QVMUYS/VCoJrvhqFxlWnmk31nTaDr1BSFHulAug4uJInNx1tL
 U4UioA+6c5DPKlsPy2Y43G2fHmZqg==
X-ME-Sender: <xms:-66bYVmtZEETkmw9fW-dHEeY5UAMv4xmWq-r6jkOnnswg5RjAaP8Cw>
 <xme:-66bYQ3hnY99qDXazpt2q_zPJ3VP8tbykhb0GguGsCC1_Am8fXXcnS61Th5P2gHT7
 noENcN1HpMHj3k6piU>
X-ME-Received: <xmr:-66bYbrYxrPf83jtCJaFOf0bgFOwZULCVJLRywSCs6mGDy1uBq5WleVoXiE-D9bo5EvQRF5-yxAurlHVjI9rz-E6Ns7qdIRjnZ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfegvdelgfeuveevueekvedtjefguddvveffhedukeejjeejgfejfedtvdei
 tdegnecuffhomhgrihhnpeguvghvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdr
 thgvtghh
X-ME-Proxy: <xmx:-66bYVnPvI7i9YoWGnsfl5aVRWigpvfO7TtOnjjMe97iIrpVxIWHHw>
 <xmx:-66bYT0D_viI41YWh53foMMi-L1Pf_rxXUV-ngBiSqWlwIeCvsbzGw>
 <xmx:-66bYUvLMp6ZvXCVFZT19XAKYOApm0K64nraDoHpIZMNu4w3VIqTPw>
 <xmx:-66bYYnIJX--m9k2kpWNwTtszsh_sbZKj1QlqJe8TJ7eyqCRd0fFHg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 09:53:46 -0500 (EST)
Date: Mon, 22 Nov 2021 15:53:44 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: Turn lvds.yaml into a generic
 schema
Message-ID: <20211122145344.47lnihd7hfbo45ne@gilmour>
References: <20211116143503.385807-1-maxime@cerno.tech>
 <YZgpSWVXjKr9secH@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YZgpSWVXjKr9secH@pendragon.ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Nov 20, 2021 at 12:46:33AM +0200, Laurent Pinchart wrote:
> On Tue, Nov 16, 2021 at 03:35:02PM +0100, Maxime Ripard wrote:
> > The lvds.yaml file so far was both defining the generic LVDS properties
> > (such as data-mapping) that could be used for any LVDS sink, but also
> > the panel-lvds binding.
> >=20
> > That last binding was to describe LVDS panels simple enough, and had a
> > number of other bindings using it as a base to specialise it further.
> >=20
> > However, this situation makes it fairly hard to extend and reuse both
> > the generic parts, and the panel-lvds itself.
> >=20
> > Let's remove the panel-lvds parts and leave only the generic LVDS
> > properties.
> >=20
> > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > ---
> >  .../display/panel/advantech,idk-1110wr.yaml   | 17 ++++++++++-
> >  .../display/panel/innolux,ee101ia-01d.yaml    | 21 +++++++++++++-
> >  .../bindings/display/panel/lvds.yaml          | 29 +------------------
> >  .../display/panel/mitsubishi,aa104xd12.yaml   | 17 ++++++++++-
> >  .../display/panel/mitsubishi,aa121td01.yaml   | 17 ++++++++++-
> >  .../display/panel/sgd,gktw70sdae4se.yaml      | 17 ++++++++++-
> >  6 files changed, 85 insertions(+), 33 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/panel/advantech,=
idk-1110wr.yaml b/Documentation/devicetree/bindings/display/panel/advantech=
,idk-1110wr.yaml
> > index 93878c2cd370..f27cd2038636 100644
> > --- a/Documentation/devicetree/bindings/display/panel/advantech,idk-111=
0wr.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/advantech,idk-111=
0wr.yaml
> > @@ -11,13 +11,23 @@ maintainers:
> >    - Thierry Reding <thierry.reding@gmail.com>
> > =20
> >  allOf:
> > +  - $ref: panel-common.yaml#
> >    - $ref: lvds.yaml#
> > =20
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: advantech,idk-1110wr
> > +
> > +  required:
> > +    - compatible
>=20
> I've never encountered this before, what does it do ?

select dictates if the schema is applied to a node or not.

It takes a schema, and if this schema is valid, the rest of the schema
will be applied to the current node.

It's mostly unused in the kernel because the dt-validate tool will add a
select clause from the compatible list in most case that would expand in
this case to:

select:
  properties:
    contains:
      enum:
        - advantech,idk-1110wr
	- panel-lvds

  required:
    - compatible

ie, it tries to validate with this schema any node that has either the
panel compatible or the generic compatible.

That means we would have that schema applied to all the nodes that have
panel-lvds, including the ones with a different compatible than the
advantech one.

With this clause, we make sure that we ignore the other panels, while
ensuring that the compatible list for the advantech compatible is
correct.

> > +
> >  properties:
> >    compatible:
> >      items:
> >        - const: advantech,idk-1110wr
> > -      - {} # panel-lvds, but not listed here to avoid false select
> > +      - const: panel-lvds
> > =20
> >    data-mapping:
> >      const: jeida-24
> > @@ -35,6 +45,11 @@ additionalProperties: false
> > =20
> >  required:
> >    - compatible
> > +  - data-mapping
> > +  - width-mm
> > +  - height-mm
> > +  - panel-timing
> > +  - port
> > =20
> >  examples:
> >    - |+
> > diff --git a/Documentation/devicetree/bindings/display/panel/innolux,ee=
101ia-01d.yaml b/Documentation/devicetree/bindings/display/panel/innolux,ee=
101ia-01d.yaml
> > index a69681e724cb..6e06eecac14e 100644
> > --- a/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-0=
1d.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/innolux,ee101ia-0=
1d.yaml
> > @@ -11,15 +11,26 @@ maintainers:
> >    - Thierry Reding <thierry.reding@gmail.com>
> > =20
> >  allOf:
> > +  - $ref: panel-common.yaml#
> >    - $ref: lvds.yaml#
> > =20
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: innolux,ee101ia-01d
> > +
> > +  required:
> > +    - compatible
> > +
> >  properties:
> >    compatible:
> >      items:
> >        - const: innolux,ee101ia-01d
> > -      - {} # panel-lvds, but not listed here to avoid false select
> > +      - const: panel-lvds
> > =20
> >    backlight: true
> > +  data-mapping: true
> >    enable-gpios: true
> >    power-supply: true
> >    width-mm: true
> > @@ -27,5 +38,13 @@ properties:
> >    panel-timing: true
> >    port: true
> > =20
> > +required:
> > +  - compatible
> > +  - data-mapping
> > +  - width-mm
> > +  - height-mm
> > +  - panel-timing
> > +  - port
> > +
> >  additionalProperties: false
> >  ...
> > diff --git a/Documentation/devicetree/bindings/display/panel/lvds.yaml =
b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > index 49460c9dceea..5281a75c8bb5 100644
> > --- a/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/lvds.yaml
> > @@ -4,7 +4,7 @@
> >  $id: http://devicetree.org/schemas/display/panel/lvds.yaml#
> >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > =20
> > -title: LVDS Display Panel
> > +title: LVDS Display Common Properties
>=20
> Maybe
>=20
> title: LVDS Display Panel Common Properties
>=20
> or do you foresee this being useful for non-panel LBDS sinks too ? In
> that case the title is fine, but the file could be moved in the parent
> directory.
>=20
> I'm also wondering what we should do with the data-mapping and
> data-mirror properties. For an LVDS panel they're fine at the device
> level, but for an LVDS sink, they may be better placed at the port or
> endpoint level.

That was my intent, but it might not be relevant indeed. Honestly at
this point I just want to have the tbs,a711-panel compatible documented
somewhere :)

Maxime
