Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3FA86E0F3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 13:19:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7828B10E12B;
	Fri,  1 Mar 2024 12:19:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="S6lYDqXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5356E10E10A
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 12:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709295542;
 bh=/JuogARoTSkexC999JDvQiVZli/6nhMtXRKfthwm9cw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S6lYDqXJrWXUDzPO1wTmvcUBucoziKYFzSnZOSZUEAB1QwwGMnwSj9RquoSAOkPJ/
 ++HwlGFBlVjPES5nwc555SgdlGFrPN8PVYChSzRSTD7xQaR0O3JCCC1lIb2mLJtM31
 kCyDlCATlHHcYdwBa3hsXYzOM8N8+FE3uUD0XkYXid7DYVxuw+Vpx628DAilTvjnk/
 NcBvlpGOPQOxm8Hr2E+M0wtCChqfHXo/YJqFuJLjwaMF71knauhnn6nqVjoWOonb8K
 voWsn5IaQ7Cwlz4cnNjiGwOCUAVGjNT86uhYLgezNrfqseQxjy5zgS8lUHt8h3tkad
 1uVuziX/wL+7w==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id BEAED378000E;
 Fri,  1 Mar 2024 12:19:01 +0000 (UTC)
Date: Fri, 1 Mar 2024 14:19:00 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Sebastian Wick <sebastian.wick@redhat.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Sandy Huang
 <hjc@rock-chips.com>, Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Dave Stevenson
 <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v7 21/36] drm/connector: hdmi: Add Broadcast RGB property
Message-ID: <20240301141900.1ee1e2ef.pekka.paalanen@collabora.com>
In-Reply-To: <20240301-loyal-cornflower-oxpecker-83ed59@houat>
References: <20240222-kms-hdmi-connector-state-v7-0-8f4af575fce2@kernel.org>
 <20240222-kms-hdmi-connector-state-v7-21-8f4af575fce2@kernel.org>
 <20240229194726.GB166694@toolbox>
 <20240301-light-impressive-grasshopper-adabeb@houat>
 <20240301112941.GE166694@toolbox>
 <20240301-loyal-cornflower-oxpecker-83ed59@houat>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yomWKOIfqdy35zj6dRjUbn_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/yomWKOIfqdy35zj6dRjUbn_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 1 Mar 2024 13:12:02 +0100
Maxime Ripard <mripard@kernel.org> wrote:

> On Fri, Mar 01, 2024 at 12:29:41PM +0100, Sebastian Wick wrote:
> > On Fri, Mar 01, 2024 at 11:30:56AM +0100, Maxime Ripard wrote: =20
> > > On Thu, Feb 29, 2024 at 08:47:26PM +0100, Sebastian Wick wrote: =20
> > > > > @@ -1708,6 +1731,39 @@ EXPORT_SYMBOL(drm_connector_attach_dp_subc=
onnector_property);
> > > > >  /**
> > > > >   * DOC: HDMI connector properties
> > > > >   *
> > > > > + * Broadcast RGB (HDMI specific)
> > > > > + *      Indicates the Quantization Range (Full vs Limited) used.=
 The color
> > > > > + *      processing pipeline will be adjusted to match the value =
of the
> > > > > + *      property, and the Infoframes will be generated and sent =
accordingly.
> > > > > + *
> > > > > + *      This property is only relevant if the HDMI output format=
 is RGB. If
> > > > > + *      it's one of the YCbCr variant, it will be ignored and th=
e output will
> > > > > + *      use a limited quantization range. =20
> > > >=20
> > > > Uh, maybe just say that the quantization range is selected automati=
cally
> > > > in case a YCbCr output format is in use. I'm not sure every YCbCr
> > > > variant requires limited and even if it does, new formats could cha=
nge
> > > > this. =20
> > >=20
> > > I documented what i915 is doing:
> > > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i915/d=
isplay/intel_hdmi.c#L2143 =20
> >=20
> > Sure, this is one valid strategy for the automatic behavior of YCbCr.
> > Drivers could also always send an InfoFrame to ensure full range where
> > possible. The point here is that this property shall not affect YCbCr
> > output formats!
> >=20
> > Maybe it's even better to say "driver specific" instead of "automatic".=
 =20
>=20
> Honestly, I'm not sure what you want from me here. Ville and you
> insisted on the previous version to document what i915 is doing and to
> follow whatever the behaviour was, and that we shouldn't spend time
> improving the property. Fine, I did that.
>=20
> But now, you want me to ... improve the property?

Just drop the "and the output will use a limited quantization range"
part.


Thanks,
pq

--Sig_/yomWKOIfqdy35zj6dRjUbn_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXhx7QACgkQI1/ltBGq
qqcFMhAApnw120yGkMTU78b9MLRYnIpCL8IVDkC74fOg134teNF3ZHRveBy91rEy
yGr5TiB5iXahBTUIM8oSttIEu0IpqTauZISYsBOnVXqukbO2MktR8Nbec4YioVb0
HFLYbyzewiyTOkuF5Ud9C7icE2g65xEt/RxserG73jUAj6CTnhWRl8zbZQOo5ze7
1P8E2uWGehaZh8YRzbwIjXJYxj8gEUfj5vZy7HX+YmPYfls/lanw0XWU2ON+rs1f
xFM2u6nDeQ30pGSG7I0ccD6oXFw4yesbSusecHexpByjwIyDMlz0uP5HkLuqeI9I
mBZmvX4YEfyjQgq3H0Rnsm1OJIU3SC2pGQ9YLJxpmA/dSf3PZ2ktHsz3WQjRxbhr
aJq1d8DroMft41SRdindTDUwg2lssg1MNWu3GRLee8vWxc8Paf/4eNEhbolfTFHB
dXagpKniLK0Fk8BCpKv0M2TuKyiv5Hc5jCiwHtHX3ESIvhBC952k7UP4aHRPif5U
Df9nQwfRKgOb9CYXPKZK+Ug6u9Ayxb1m47e2Z3K0duRyi4I7yMz9M8FAEguvMNsH
YoghGtR4geDcBruuLIOI2yeORwOYorHRww9U+J9spCN1zEcbO+9aCxZ+EmEKABtw
XXN/e3yaSp0gEqGOQfIFopUV3gYq7M1YcNFP4hMRzIro6qVwqUQ=
=+Rkf
-----END PGP SIGNATURE-----

--Sig_/yomWKOIfqdy35zj6dRjUbn_--
