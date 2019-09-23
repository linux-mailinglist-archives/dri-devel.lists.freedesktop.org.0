Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CDBBB7F5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 17:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC9C6E947;
	Mon, 23 Sep 2019 15:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3556E947
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 15:31:53 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72105207FD;
 Mon, 23 Sep 2019 15:31:52 +0000 (UTC)
Date: Mon, 23 Sep 2019 17:31:50 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>
Subject: Re: [PATCH 2/2] MAINTAINERS: Add Jernej =?utf-8?Q?=C5=A0krabe?=
 =?utf-8?Q?c?= as a reviewer for DE2
Message-ID: <20190923153150.wk7tnkfcnhww4siu@gilmour>
References: <20190919173020.11655-1-mripard@kernel.org>
 <20190919173020.11655-2-mripard@kernel.org>
 <47543680.g9p3ZYuVmN@jernej-laptop>
MIME-Version: 1.0
In-Reply-To: <47543680.g9p3ZYuVmN@jernej-laptop>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569252712;
 bh=I3s6QLN0I7/kMMc0+gEOf5zUq70NKAXt8BhNsNJjCBQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B0Tjsa/lKijPYbhKnic69usoeCoKFqXX4+1z+KSkQLs2M6IH1Ry1R/07WOg+JuUE4
 bv9Br/zqNqWgyd+dvDw5M8+cT8n1lBfnFSm8RgtWGp9VtYqJyX9q7R+1YyPvmjaYZN
 fkp2Q9HVDT7i8az/ju5LDaRy6cPA32q1qWonVq04=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Chen-Yu Tsai <wens@csie.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1301549505=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1301549505==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cmciu6a5u4rnz3vz"
Content-Disposition: inline


--cmciu6a5u4rnz3vz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 19, 2019 at 08:24:18PM +0200, Jernej =C5=A0krabec wrote:
> Dne =C4=8Detrtek, 19. september 2019 ob 19:30:20 CEST je Maxime Ripard na=
pisal(a):
> > The newer Allwinner SoCs have a different layers controller than the ol=
der
> > ones. Jernej wrote that support and has been reviewing patches for a wh=
ile
> > now, so let's make him a formal reviewer.
> >
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  MAINTAINERS | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 54e222e1d0d6..fae328f06c17 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5361,6 +5361,15 @@ F:	drivers/gpu/drm/sun4i/
> >  F:	Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> >  T:	git git://anongit.freedesktop.org/drm/drm-misc
> >
> > +DRM DRIVER FOR ALLWINNER DE2 ENGINE
>
> Please make that DE2 and DE3 engine, they share almost all code.
>
> > +M:	Maxime Ripard <mripard@kernel.org>
> > +M:	Chen-Yu Tsai <wens@csie.org>
> > +R:	Jernej =C5=A0krabec <jernej.skrabec@siol.net>
>
> Please make that "S" for consistency with other entry.
>
> With that:
> Reviewed-by: Jernej Skrabec <jernej.skrabec@siol.net>

Applied both patches, with your suggestions.

Thanks, and welcome to the team :)

Maxime

--cmciu6a5u4rnz3vz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXYjlZgAKCRDj7w1vZxhR
xVZiAQC6uSz8aaShyUZYNpqgmpidEd8SmryOJsH+L7keh/2YQwD/XI4O0MqOfAdW
M3oC6BBgY92pG0KyEyZhHUPFYYT38wM=
=rVsl
-----END PGP SIGNATURE-----

--cmciu6a5u4rnz3vz--

--===============1301549505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1301549505==--
