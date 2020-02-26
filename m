Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 085CE17121E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:13:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDD46EC08;
	Thu, 27 Feb 2020 08:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27D66EB29
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 17:25:07 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3805E220DB;
 Wed, 26 Feb 2020 12:25:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 26 Feb 2020 12:25:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=c7ZiMoUzr8rewu+/7xDERme901m
 6TtSElKTdKwIsAjw=; b=FUHTLTnTOnwvRhoc6VnGUQtikYE81UjyRyPFQExKAgH
 6skZ1oaZde37HWBBsCn2CldrypDQdXFwj/sMvW2/XQ9WshlIhCzIOOk1N9tCqzul
 ZcTzgqszLrQ1P58/saQkSYKgHoH5omXKWpfhNKPiZyc2Xg0lMcWDNZNeA7C+fU3e
 k1WUXpSf+5ceG7e+dmqgokYG/cog86iQTpDRnaOYoLjlxP81Tu5GC4wOrP1G1HY1
 uSTjmk7+H/v+1PvJol9Crq98z/+pZOOuvZJQc7Pw/EwREePH13Gd7byHbYo1I9JJ
 ZcWViffce/IFj02vlzr/RWdnXR8uYULgzWoa9G6tcKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=c7ZiMo
 Uzr8rewu+/7xDERme901m6TtSElKTdKwIsAjw=; b=2rizDCNZSPIExD9g9HTki5
 IKLVDGgxE8Iu+VTbm3VMdZgUwpp6OhszdoCfjCtiiZoxwrRi00YivLtyvNxWFcPv
 e9/0ev63mGYUS+6+kkNvW+GdTH8G1YztP5R7W4k+eGdkZtIHTyXTZFQvPC/9WmQH
 9b/om4L3EnIzun6eVl2mvf6c3AFFkCj9HAfoPZfIl1IGWjJNam+4n6pLvAimIAJW
 U8/c3ua+tdHzqRI4QDoL5+f7O7N3u9M0wOFZffLIBniFsjaKLLNvfJIr6mkemDLM
 VHLsuwhPw1UdcjsKSTm4VZeXn3PB1ZovpwThvWxRUvjFOtCbuFnIid1CHe2KtNkg
 ==
X-ME-Sender: <xms:8KlWXhynEvFaUVkxal6TOVaMmCZUHqBM2TZjJep8tSEWuJtLNO4dfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrleeggddutdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:8KlWXhsWUdj_mW1sMsQyoe6KsXlU8TAB5hPbjgpO6eaEVA2KoGW-XQ>
 <xmx:8KlWXgzvBJQtqoq4MwZVZGdfR6-GMvG3Ynie-tIff6trCvArZMrMqQ>
 <xmx:8KlWXhfnJlKsntQC1wwfEF8qJONSgmYV10HtTdmrnJ_ZN96aUPjFDQ>
 <xmx:8alWXrUCeqkbC146fyDrJIkBJq2XNPETwNnNgq5W4pKdbdsUIdMQqg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id C8FDA3280059;
 Wed, 26 Feb 2020 12:25:02 -0500 (EST)
Date: Wed, 26 Feb 2020 18:25:00 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH 6/7] drm/sun4i: de2: Don't return de2_fmt_info struct
Message-ID: <20200226172500.shtzzsc6u5p4la3i@gilmour.lan>
References: <20200224173901.174016-1-jernej.skrabec@siol.net>
 <20200225083448.6upblnctjjrbarje@gilmour.lan>
 <CAGb2v64g7Q4e+ic08pA7tbamgToOjyYzuzqP0bpqBZjRuRUrPA@mail.gmail.com>
 <12462592.uLZWGnKmhe@jernej-laptop>
MIME-Version: 1.0
In-Reply-To: <12462592.uLZWGnKmhe@jernej-laptop>
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0198405019=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0198405019==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wcbclzj6eiyn4mwp"
Content-Disposition: inline


--wcbclzj6eiyn4mwp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2020 at 07:50:03PM +0100, Jernej =C5=A0krabec wrote:
> Hi!
>
> Dne torek, 25. februar 2020 ob 09:52:18 CET je Chen-Yu Tsai napisal(a):
> > On Tue, Feb 25, 2020 at 4:35 PM Maxime Ripard <maxime@cerno.tech> wrote:
> > > Hi,
> > >
> > > On Mon, Feb 24, 2020 at 06:39:00PM +0100, Jernej Skrabec wrote:
> > > > Now that de2_fmt_info contains only DRM <-> HW format mapping, it
> > > > doesn't make sense to return pointer to structure when searching by=
 DRM
> > > > format. Rework that to return only HW format instead.
> > > >
> > > > This doesn't make any functional change.
> > > >
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> > > > ---
> > > >
> > > >  drivers/gpu/drm/sun4i/sun8i_mixer.c    | 15 +++++++++++----
> > > >  drivers/gpu/drm/sun4i/sun8i_mixer.h    |  7 +------
> > > >  drivers/gpu/drm/sun4i/sun8i_ui_layer.c | 10 +++++-----
> > > >  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 12 ++++++------
> > > >  4 files changed, 23 insertions(+), 21 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > b/drivers/gpu/drm/sun4i/sun8i_mixer.c index e078ec96de2d..56cc037fd=
312
> > > > 100644
> > > > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > > @@ -27,6 +27,11 @@
> > > >
> > > >  #include "sun8i_vi_layer.h"
> > > >  #include "sunxi_engine.h"
> > > >
> > > > +struct de2_fmt_info {
> > > > +     u32     drm_fmt;
> > > > +     u32     de2_fmt;
> > > > +};
> > > > +
> > > >
> > > >  static const struct de2_fmt_info de2_formats[] =3D {
> > > >
> > > >       {
> > > >
> > > >               .drm_fmt =3D DRM_FORMAT_ARGB8888,
> > > >
> > > > @@ -230,15 +235,17 @@ static const struct de2_fmt_info de2_formats[=
] =3D {
> > > >
> > > >       },
> > > >
> > > >  };
> > > >
> > > > -const struct de2_fmt_info *sun8i_mixer_format_info(u32 format)
> > > > +int sun8i_mixer_drm_format_to_hw(u32 format, u32 *hw_format)
> > > >
> > > >  {
> > > >
> > > >       unsigned int i;
> > > >
> > > >       for (i =3D 0; i < ARRAY_SIZE(de2_formats); ++i)
> > > >
> > > > -             if (de2_formats[i].drm_fmt =3D=3D format)
> > > > -                     return &de2_formats[i];
> > > > +             if (de2_formats[i].drm_fmt =3D=3D format) {
> > > > +                     *hw_format =3D de2_formats[i].de2_fmt;
> > > > +                     return 0;
> > > > +             }
> > > >
> > > > -     return NULL;
> > > > +     return -EINVAL;
> > > >
> > > >  }
> > >
> > > I'm not too sure about that one. It breaks the consistency with the
> > > other functions, and I don't really see a particular benefit to it?
> >
>
> I don't have strong opinion about this patch. It can be dropped.
>
> > I guess we could just define an "invalid" value, and have the function
> > return that if can't find a match? I'm guessing 0x0 is valid, so maybe
> > 0xffffffff or 0xdeadbeef ?
> >
> > That would keep consistency with everything else all the while
> > removing the level of indirection you wanted to.
>
> I modeled this after
> static int sun4i_backend_drm_format_to_layer(u32 format, u32 *mode);
> from sun4i_backend.c.
>
> What consistency do you have in mind?

Well I guess if we're doing that elsewhere it's not really fair to ask
you to change this then :)

Fine by me

Maxime

--wcbclzj6eiyn4mwp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXlap7AAKCRDj7w1vZxhR
xWSuAQDSjM7vAamUrz1brXSiN1EmntlNKE3xq2CuTQ1FDUJlCAEAn2clWE2FWZ46
YQm62RnkBfEvRJlvDq6RUBE5k3Z4aQs=
=Qy9H
-----END PGP SIGNATURE-----

--wcbclzj6eiyn4mwp--

--===============0198405019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0198405019==--
