Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0670E28472E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 09:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767686E3DA;
	Tue,  6 Oct 2020 07:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6338189CC4
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 14:18:27 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 71C67580333;
 Mon,  5 Oct 2020 10:18:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 05 Oct 2020 10:18:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=6wsLdnF0Lcj4VRsQV0kAmaPfVtC
 x6J2lDHDdjPu+HyI=; b=qEf14hR9GLWy2VYGK0g4RItIG6bSVGLVfyck9C/MtYK
 8QojfuokJjmy3jNrqw0QbShD5V37P4bhDNMyH1k87xvZAHRb++uD1Q/1F6MOTRBP
 DlaDa2+CQA3IzxmfPJKvvpD/Y7r3uEICJUatd4zgWHZgQDAX/lK0BzlT7yKLbeHg
 CNdldgGtoIb0jhGG7YRbPx3XUCqJyZ+NsH3oHR5XTXDxlvTDUV3RElsI3aChgiOp
 fPufdD373MI8kbPfKYe75WjXx45v+1zjZB9BDb7M75ykDKJ41NQ/OYscMSuXFHKk
 MIX6o6R7JccBjBLvLY6rvIxwI/wcRJJbHJfvzyMnjAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6wsLdn
 F0Lcj4VRsQV0kAmaPfVtCx6J2lDHDdjPu+HyI=; b=o9jZWd/ynS7GLOdyWQCj+m
 rEctlEU2QqL3K2BEK37+O9DiRY2JSM6vC/nGDXSI/KZkAnkDFYH9aRXvwA6st8IE
 6Fni0N9Sx4WK0pJetFjGY+4QzrnkLB8Gqj6cy2RLKGF+afuu+2RYg8BujsbAJdV4
 9thcnZtcy2NrDLnd3uSaHUmj8nsSxu7Wu9obcGZ3xyrrR4IG+KPKYQwBmUesuOm0
 JCkdT+fdz69g1b3r9pY7ZPu23cG9BCE8dOEF01lN4elyDJQcNn6+UhYE6ilNrmxd
 8E/JG+3CufRvYMmdLGl9HZCk1GL7i6ic9InU7KeLfMh0+cdAoRDtKfCqI8kgJEiQ
 ==
X-ME-Sender: <xms:Kyt7X05OcjCXZEew0bn6vCYkyt8pJYCgVk2q2f0YQrW6Kt8FfS8Omw>
 <xme:Kyt7X16H427lNHlHNvc_MQDYWca3xi9_o6Ci85wfsHIXXlf8e0mCLlDEd6JKt39zt
 LQEJmZR3wSRLC7HsE0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrgedvgdejjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Kyt7Xzdvh-hGhEgpTjkaAHOt0OaJpUJ1MoJ74zpLKsmEc4G4m-qWuw>
 <xmx:Kyt7X5IwLS0iCslBAxt1ZzDYdotsIiy-Jl714TA0gXokk1meWhUthw>
 <xmx:Kyt7X4KevHQonHGNq1_mdxw4KnJA6ttiwH-NC1V3Uo9igGQAK3wdWg>
 <xmx:Mit7X9WZF7If6pSu-DXFP3uQc8AcRZsbPmbhZL_YAGAjApkVcHN2tA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9A796328005D;
 Mon,  5 Oct 2020 10:18:19 -0400 (EDT)
Date: Mon, 5 Oct 2020 16:18:17 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2 2/4] drm/sun4i: tcon: Refactor the LVDS and panel
 probing
Message-ID: <20201005141817.rsj7d6wwnsgdrydo@gilmour.lan>
References: <cover.7029eefe5c5350920f91d4cd4cbc061466752f3c.1596101672.git-series.maxime@cerno.tech>
 <1df5a7bcafa091e008edb439ee9de4262ae4d5d1.1596101672.git-series.maxime@cerno.tech>
 <CAGb2v64dsqavVYL4UvjWw=DzpbE-Egwso1Ma8xH3qYgS2Te9zg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGb2v64dsqavVYL4UvjWw=DzpbE-Egwso1Ma8xH3qYgS2Te9zg@mail.gmail.com>
X-Mailman-Approved-At: Tue, 06 Oct 2020 07:31:05 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============1958969433=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1958969433==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k233jlwaazxqabpi"
Content-Disposition: inline


--k233jlwaazxqabpi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

Sorry for the delay

On Sat, Aug 29, 2020 at 02:43:53PM +0800, Chen-Yu Tsai wrote:
> > +static int sun4i_tcon_register_panel(struct drm_device *drm,
> > +                                    struct sun4i_tcon *tcon)
> > +{
> > +       struct device_node *companion;
> > +       struct device_node *remote;
> > +       struct device *dev =3D tcon->dev;
> > +       bool has_lvds_alt;
> > +       bool has_lvds_rst;
> > +       int ret;
> > +
> > +       /*
> > +        * If we have an LVDS panel connected to the TCON, we should
> > +        * just probe the LVDS connector. Otherwise, let's just register
> > +        * an RGB panel.
> > +        */
> > +       remote =3D of_graph_get_remote_node(dev->of_node, 1, 0);
> > +       if (!tcon->quirks->supports_lvds ||
> > +           !of_device_is_compatible(remote, "panel-lvds"))
> > +               return sun4i_rgb_init(drm, tcon);
>=20
> Slightly related: IIRC there are a few LVDS panels supported in panel-sim=
ple
> so they don't use the panel-lvds compatible. Any idea how to deal with th=
ose?

I agree that this is an issue, I'm not entirely sure how to fix it. The
proper fix would be to have multiple output ports, one for each output
type, but given how our current binding looks like I'm not sure how we
could retro-fit that without some horror-looking code.

Maybe we can add a property on the endpoint?

Maxime

--k233jlwaazxqabpi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3srKQAKCRDj7w1vZxhR
xW3UAP9LhISLvgGCp85tX5q7sVKwegF/hpc+qmUEDuDHFUfNxAD/TgzPFraDdq+R
cptbFzYYVHyTjiKe1IYyDHx6x0BdTgA=
=n+wt
-----END PGP SIGNATURE-----

--k233jlwaazxqabpi--

--===============1958969433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1958969433==--
