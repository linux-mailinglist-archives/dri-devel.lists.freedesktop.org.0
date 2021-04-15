Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D53B360528
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 11:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 605796EA10;
	Thu, 15 Apr 2021 09:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D6D6EA10
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 09:03:16 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3FBE5580731;
 Thu, 15 Apr 2021 05:03:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 15 Apr 2021 05:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Ix39sTXIdzBPeQc6zVxgol87V62
 s6qIp0rqVdblLghI=; b=ZjPdlSAMvhzGHZTqukqSHIySHquqmpAGd57SVplw3wx
 wtEnql7pT00+S8MigfilGegogxQhaxz3+W32v5osInHdI1gMlCT2yNuNGvNGh5Xv
 exjimUBqqSrKHr8smU6GGYztrIc5pT4tXEpTrlZ2+w5jeh4X+vDdq/j+TllG17vJ
 0RSM6VcDq8x0z2o5rhRXrB7jMAC6CE2RylXNQS0LO2l4Aohc/QoMOSpXtup3hpOl
 fxdZlG2qt6HgiSX2Ne4og9U1ZeRsAd05EJQvA8tlfn8sSRhA2CovxiJJeKfxDF7a
 jX+76iWHIMfo+5L7CRwfM1fVK5FPLUGmbhS6Sftlgpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Ix39sT
 XIdzBPeQc6zVxgol87V62s6qIp0rqVdblLghI=; b=IkH8qVy+9k6U2N+2SlYNiB
 JzRs+9uU7j1Jy+b0KSy64uO3kG7cfMMqTAkRACUL0aerc/d7WtshYhyNm64E30Bj
 F17O0okCm+GLsYcorEVbKHyfU0tbLiwOXv0Yrpcdufgr+OuOdy9qf0rjy4g0EgbR
 ke6eIsnBaDvBT4QL50NO8aSume8OTm7CAT3zrKhzDH6T+UXhVYewnqfShTtKdDXs
 GuELPLaJ5rA7Fmb3bowZrA1+wxx3EV75zUDMCCYHSyy6TQpVMGqBu6BHjjo/cy+o
 VS1RdD/o4eq2UJomFkJDZm/K2Z16GB0IsHHity7tUIB2Maaa48mr2AScoxG7JqPQ
 ==
X-ME-Sender: <xms:UwF4YOw9lyr9OemRme-Wa3av4Nc-Hr_KxjPtHWd13wx4I0XqV-Bjig>
 <xme:UwF4YL1hnoow4g7g0-o_qCcH2UWwJWtnjhE5AEcMqZmjWfA1NQWTtYbJGaP0zqRh9
 PqHnwFaWqYJB2vLbj8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelfedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepuedtgfejueduheevgfevvdettdduleffgfffkeeltdffkeegudekjeeuveei
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UwF4YGpSR8noiMvS-M775CJeteQjU_k1XpAYE3i8Orf68uv6Ski-7Q>
 <xmx:UwF4YAWMxyCfrrrH4qelauzQoHmPvuop4JJZUpZHxOacIaRNu8DHvA>
 <xmx:UwF4YHod1NftVt0r8bqvjUEF94G7GPvwbZVZH_xcE-sWzE-b9KIbhg>
 <xmx:VAF4YMwGaDJvpckZHF14L6205XLPw_olC4rZzxl9AAc0e7ukJ7JpvQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CA03F1080069;
 Thu, 15 Apr 2021 05:03:14 -0400 (EDT)
Date: Thu, 15 Apr 2021 11:03:12 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v4 4/6] drm/sprd: add Unisoc's drm display controller
 driver
Message-ID: <20210415090312.md6exuuv2y4mblxn@gilmour>
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-5-kevin3.tang@gmail.com>
 <20210324111019.og6d3w47swjim2mq@gilmour>
 <CAFPSGXYZPoM45vF_HcjMBcO_Ek-UJZw7F+Q0Of-gWZxvVaPQjg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFPSGXYZPoM45vF_HcjMBcO_Ek-UJZw7F+Q0Of-gWZxvVaPQjg@mail.gmail.com>
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
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: multipart/mixed; boundary="===============0752476291=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0752476291==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ypmvmwrpdbpuk4rg"
Content-Disposition: inline


--ypmvmwrpdbpuk4rg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 15, 2021 at 08:18:52AM +0800, Kevin Tang wrote:
> Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B43=E6=9C=8824=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=887:10=E5=86=99=E9=81=93=EF=BC=9A
> > > +static struct sprd_dpu *sprd_crtc_init(struct drm_device *drm,
> > > +                      struct drm_plane *primary)
> > > +{
> > > +     struct device_node *port;
> > > +     struct sprd_dpu *dpu;
> > > +
> > > +     /*
> > > +      * set crtc port so that drm_of_find_possible_crtcs call works
> > > +      */
> > > +     port =3D of_parse_phandle(drm->dev->of_node, "ports", 0);
> > > +     if (!port) {
> > > +             drm_err(drm, "find 'ports' phandle of %s failed\n",
> > > +                       drm->dev->of_node->full_name);
> > > +             return ERR_PTR(-EINVAL);
> > > +     }
> > > +     of_node_put(port);
> >
> > The YAML binding should already make sure that your binding is sane, and
> > if you still get a DT that doesn't follow it, you have a whole lot of
> > other issues than whether ports is there :)
> >
> > > +     dpu =3D drmm_crtc_alloc_with_planes(drm, struct sprd_dpu, base,
> > > +                                     primary, NULL,
> > > +                                     &sprd_crtc_funcs, NULL);
> > > +     if (IS_ERR(dpu)) {
> > > +             drm_err(drm, "failed to init crtc.\n");
> > > +             return dpu;
> > > +     }
> > > +
> > > +     dpu->base.port =3D port;
> >
> > But you're still referencing it here, while you called of_node_put on it
> > already? You should only call it once you're done with it.
>=20
>  of_node_put should be called after done with it, this maybe indeed be a =
bug.
> i will fix it.
> >
> >
> > I'm not really sure why you would need drm_of_find_possible_crtcs to
> > work then if you don't follow the OF-Graph bindings.
>=20
> it scan all endports of encoder, if a matching crtc is found by
> OF-Graph bindings
> and then genarate the crtc mask, here is description:
> 41  /**
> 42   * drm_of_find_possible_crtcs - find the possible CRTCs for an encode=
r port
> 43   * @dev: DRM device
> 44   * @port: encoder port to scan for endpoints
> 45   *
> 46   * Scan all endpoints attached to a port, locate their attached CRTCs,
> 47   * and generate the DRM mask of CRTCs which may be attached to this
> 48   * encoder.
> 49   *
> if we don't follow the OF-Graph bindings, crtc can't attched to encoder.

Yeah, what I'm actually confused about is why you would need the
of_parse_phandle call. You usually call drm_of_find_possible_crtcs with
the encoder device node, so from your MIPI-DSI driver in your case, and
with it's device->of_node pointer and it should work perfectly fine?

Maxime

--ypmvmwrpdbpuk4rg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYHgBUAAKCRDj7w1vZxhR
xVRAAQDaqBTh/injDtSwQK3iV7Z5wvP7T2ktGwk9WYZ2ZfAq9gEAwhppNac9aGVm
la/J2jdy4d1ngYkDjjhlgrRCDASW+gU=
=Rre6
-----END PGP SIGNATURE-----

--ypmvmwrpdbpuk4rg--

--===============0752476291==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0752476291==--
