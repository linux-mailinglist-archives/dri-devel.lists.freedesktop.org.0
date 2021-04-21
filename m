Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 927283668BF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 12:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1526E971;
	Wed, 21 Apr 2021 10:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D91E6E971
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 10:00:58 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1153C5804F2;
 Wed, 21 Apr 2021 06:00:58 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 21 Apr 2021 06:00:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=d5yWQMfM/Co2rLORB29xCNYtdUp
 YpDGcIm7lir7nAGY=; b=b/p8TqIhLg7pPNSTCKSnslytl8onsOGnWIA8xYMuMe+
 qyRE9+0YZlilCL7ye6NWgpTfEFIYJBxcYdohgGs9alOxf/zbe6hi82JrS9bO6WUJ
 yxoF5PtCtLgvboOZ7qUt1A83Sh44vhK9zJn2yeTBkVnzEvUf89MBpNNLxSVgO9tX
 5ZbtZSeSKC4BicPMINIAlGs56wmZPb1AheIzgchSaYoc7vfc9xog9VxhVO/VVTEh
 PY9xDmouJM6zTjssRBgJHk10citEkQeJImaS7/EwPvXtKPSJEK8bCAb2pH4x0PHm
 yd9KRcW1/rlOcCFohaVcOcCluiaQDWjcQgex6yufTrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=d5yWQM
 fM/Co2rLORB29xCNYtdUpYpDGcIm7lir7nAGY=; b=uFwiUhHsWbDMf1DwUm1b5C
 iGjD+Jff5gc28W1BgCPiuqNBxxd55jajR82MDE/UAx3QlFnN9OFpoqSwEXNqJBqN
 GFC4bVNbIRADqroj2pisTgW6X1EzCDQk/IfksmDvfPXfWHDYTg6QR0QJ+xmi3KCq
 xfK+d/5BJHgo/10JnliV053JKQKz6jYw9J6ynmgM/jAVE2tV24TOV9FLCschx1rp
 k/HGvHwOnE825MmXlsu9GhV5C8v52+fm0sxvT9/urTAg3MnH3oldpwrX+CFTvE+h
 2H0J5NjAUDcubc1rqIFaCo3Gk8X183yTSQP1j+eD4JyszHbCpJpRKjyNk/WGZh3A
 ==
X-ME-Sender: <xms:2Pd_YFOdqyQORzN9sEWJfMXN5TgbA_mXmTcwmRZsAXTKD-oCs8TsnA>
 <xme:2Pd_YPUE99ymJyNj5pKIQFt2Q5mh8-wyDwNCEmZjFWj1_K9F-Wd_8KkY-71SfqBTO
 jFqP_Gh2qLuV_BdZzw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtkedgvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjedtudekleffteevffduvdekfffffedvtdeuveffgfeffedtleetueelgeef
 leetnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdeike
 drjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 mhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2Pd_YJ0-Swphm2nvmI43zwVklfjsTBBINvIebDv2W2uGTR6CPu6zvA>
 <xmx:2Pd_YNqSSsafnlsivi_f67R91HgmVjYhHNySFV4URxdWHoYeNFBNqA>
 <xmx:2Pd_YAXRV2k1yYyp5kmropoQ_g1W7Mx_SfQm-Ez4KAxQFqLpzVXTmg>
 <xmx:2vd_YMQ60ED7h6aHjREUJPwhL3-PdnpZz8VopHd3wi4K_06Ea6K7Cg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3E9ED1080063;
 Wed, 21 Apr 2021 06:00:56 -0400 (EDT)
Date: Wed, 21 Apr 2021 12:00:52 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Kevin Tang <kevin3.tang@gmail.com>
Subject: Re: [PATCH v4 4/6] drm/sprd: add Unisoc's drm display controller
 driver
Message-ID: <20210421100052.gujzkrafp26e6tcz@gilmour>
References: <20210222132822.7830-1-kevin3.tang@gmail.com>
 <20210222132822.7830-5-kevin3.tang@gmail.com>
 <20210324111019.og6d3w47swjim2mq@gilmour>
 <CAFPSGXYZPoM45vF_HcjMBcO_Ek-UJZw7F+Q0Of-gWZxvVaPQjg@mail.gmail.com>
 <20210415090312.md6exuuv2y4mblxn@gilmour>
 <CAFPSGXYdA=09xWZJi2oCQsbr3eH1GBgzjD8DRm5=beiKAtx37Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFPSGXYdA=09xWZJi2oCQsbr3eH1GBgzjD8DRm5=beiKAtx37Q@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1989321345=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1989321345==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kpgrv3m2gbmdl54j"
Content-Disposition: inline


--kpgrv3m2gbmdl54j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 19, 2021 at 07:01:00AM +0800, Kevin Tang wrote:
> Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B44=E6=9C=8815=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=885:03=E5=86=99=E9=81=93=EF=BC=9A
> > On Thu, Apr 15, 2021 at 08:18:52AM +0800, Kevin Tang wrote:
> > > Maxime Ripard <maxime@cerno.tech> =E4=BA=8E2021=E5=B9=B43=E6=9C=8824=
=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=887:10=E5=86=99=E9=81=93=EF=BC=
=9A
> > > > > +static struct sprd_dpu *sprd_crtc_init(struct drm_device *drm,
> > > > > +                      struct drm_plane *primary)
> > > > > +{
> > > > > +     struct device_node *port;
> > > > > +     struct sprd_dpu *dpu;
> > > > > +
> > > > > +     /*
> > > > > +      * set crtc port so that drm_of_find_possible_crtcs call wo=
rks
> > > > > +      */
> > > > > +     port =3D of_parse_phandle(drm->dev->of_node, "ports", 0);
> > > > > +     if (!port) {
> > > > > +             drm_err(drm, "find 'ports' phandle of %s failed\n",
> > > > > +                       drm->dev->of_node->full_name);
> > > > > +             return ERR_PTR(-EINVAL);
> > > > > +     }
> > > > > +     of_node_put(port);
> > > >
> > > > The YAML binding should already make sure that your binding is sane=
, and
> > > > if you still get a DT that doesn't follow it, you have a whole lot =
of
> > > > other issues than whether ports is there :)
> > > >
> > > > > +     dpu =3D drmm_crtc_alloc_with_planes(drm, struct sprd_dpu, b=
ase,
> > > > > +                                     primary, NULL,
> > > > > +                                     &sprd_crtc_funcs, NULL);
> > > > > +     if (IS_ERR(dpu)) {
> > > > > +             drm_err(drm, "failed to init crtc.\n");
> > > > > +             return dpu;
> > > > > +     }
> > > > > +
> > > > > +     dpu->base.port =3D port;
> > > >
> > > > But you're still referencing it here, while you called of_node_put =
on it
> > > > already? You should only call it once you're done with it.
> > >
> > >  of_node_put should be called after done with it, this maybe indeed b=
e a bug.
> > > i will fix it.
> > > >
> > > >
> > > > I'm not really sure why you would need drm_of_find_possible_crtcs to
> > > > work then if you don't follow the OF-Graph bindings.
> > >
> > > it scan all endports of encoder, if a matching crtc is found by
> > > OF-Graph bindings
> > > and then genarate the crtc mask, here is description:
> > > 41  /**
> > > 42   * drm_of_find_possible_crtcs - find the possible CRTCs for an en=
coder port
> > > 43   * @dev: DRM device
> > > 44   * @port: encoder port to scan for endpoints
> > > 45   *
> > > 46   * Scan all endpoints attached to a port, locate their attached C=
RTCs,
> > > 47   * and generate the DRM mask of CRTCs which may be attached to th=
is
> > > 48   * encoder.
> > > 49   *
> > > if we don't follow the OF-Graph bindings, crtc can't attched to encod=
er.
> >
> > Yeah, what I'm actually confused about is why you would need the
> > of_parse_phandle call. You usually call drm_of_find_possible_crtcs with
> > the encoder device node, so from your MIPI-DSI driver in your case, and
> > with it's device->of_node pointer and it should work perfectly fine?
> I still confused about use drm_of_find_possible_crtcs to bind crtc and
> encoder, the port of drm_crtc, default is null?
>=20
> 709  /**
> 710   * struct drm_crtc - central CRTC control structure
> 711   * @dev: parent DRM device
> 712   * @port: OF node used by drm_of_find_possible_crtcs()
> -------------------------------------------------------------------------=
----------------------------
> 25  static uint32_t drm_crtc_port_mask(struct drm_device *dev,
> 26     struct device_node *port)
> 27  {
> 28   unsigned int index =3D 0;
> 29   struct drm_crtc *tmp;
> 30
> 31   drm_for_each_crtc(tmp, dev) {
> 32   if (tmp->port =3D=3D port)
> 33   return 1 << index;
> 34
> 35   index++;
> 36   }
> 37
> 38   return 0;
> 39  }
>=20
> I did not see any place to initialize the port of drm_crtc in the drm
> framework, if not setup it.
> it looks like the port of drm_crtc is undefined.
>=20
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/rockchip/r=
ockchip_drm_vop.c#L1851
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/tilcdc/til=
cdc_crtc.c#L1051

Yeah, you need to initialize it for drm_of_find_possible_crtcs to work,
but my point was that you shouldn't do it through of_parse_phandle, just
put the output of_graph_get_port_by_id like you found in those drivers.

Maxime

--kpgrv3m2gbmdl54j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYH/31AAKCRDj7w1vZxhR
xfYbAQCyx/frCmI48iF2v9KLvwRkV6q7XhdIGq6JZ8So9sDZdwEAg7fNpob0hObc
+1Speo1tpFxjtmM3FtNHpH8nYvYk4ww=
=LDrh
-----END PGP SIGNATURE-----

--kpgrv3m2gbmdl54j--

--===============1989321345==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1989321345==--
