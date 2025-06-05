Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BFFACEFAF
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 14:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED95810E968;
	Thu,  5 Jun 2025 12:55:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow.org header.i=@cknow.org header.b="B6OdNHm0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com
 [95.215.58.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E3010E808
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 12:55:53 +0000 (UTC)
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
 t=1749128148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iLfh3z3SZ208p/eWHCxbn+NAgJHxxAz/VVAyyqXWVco=;
 b=B6OdNHm0lZBSI3WoeIBsMpzxSbbchv6Knk0kJHIKNyIaCFjw9LqNx1owLrFTshwQ5X2U7V
 FhnPkyd0uVHEa58cYxQkq/7h3rAIF6GYEjPUXcvnpghwIvTu+spiTOrPgKZAfqdrxo6tjF
 d8hoUqO0qiHpztfSrgt4CG2zhyb9trMEik43WfAIq/D2+5P7g6NZyglS1N+osbpKTxMVaC
 px1ecg1Biiz9HfR92Inqy2wTFEI4Ogn3Ia2uiUU6fT7vF190bzpaxO8SPG9fLwEi9Utrrm
 qHbbyS7A5/TfnvPafiB2YqqQKmrxiiFZJs6ZFN+BbObuZQfE7HlkPT6U8Hsh1A==
Content-Type: multipart/signed;
 boundary=1d6a4595b3996cc7b6eed68782d8a2b1bd983f8490a29966be91698fee5d;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 05 Jun 2025 14:55:08 +0200
Message-Id: <DAEM5ZXWOVLM.10IJV82EMBVCK@cknow.org>
Cc: <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <sebastian.reichel@collabora.com>, <conor+dt@kernel.org>,
 <krzk+dt@kernel.org>, <robh@kernel.org>, <tzimmermann@suse.de>,
 <mripard@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <simona@ffwll.ch>, <airlied@gmail.com>, <quic_jesszhan@quicinc.com>,
 <neil.armstrong@linaro.org>, <javierm@redhat.com>, <megi@xff.cz>, "Chris
 Morgan" <macromorgan@hotmail.com>
Subject: Re: [PATCH 3/4] drm/panel: himax-hx8394: Add Support for Huiling
 hl055fhav028c
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Chris Morgan"
 <macroalpha82@gmail.com>, <dri-devel@lists.freedesktop.org>
References: <20250603193930.323607-1-macroalpha82@gmail.com>
 <20250603193930.323607-4-macroalpha82@gmail.com>
 <DAEKVTXT0FHB.TOVX7BU9ZYXA@cknow.org> <2932680.yaVYbkx8dN@diego>
In-Reply-To: <2932680.yaVYbkx8dN@diego>
X-Migadu-Flow: FLOW_OUT
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

--1d6a4595b3996cc7b6eed68782d8a2b1bd983f8490a29966be91698fee5d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Jun 5, 2025 at 2:46 PM CEST, Heiko St=C3=BCbner wrote:
> Am Donnerstag, 5. Juni 2025, 13:54:50 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Diederik de Haas:
>> On Tue Jun 3, 2025 at 9:39 PM CEST, Chris Morgan wrote:
>> > From: Chris Morgan <macromorgan@hotmail.com>
>> >
>> > Add support for the Huiling hl055fhav028c panel as used on the
>> > Gameforce Ace handheld gaming console. This panel uses a Himax HX8399C
>> > display controller and requires a sparsely documented vendor provided
>> > init sequence. The display resolution is 1080x1920 and is 70mm by 127m=
m
>> > as stated in the manufacturer's documentation.
>> >
>> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>> > ---
>> >  drivers/gpu/drm/panel/panel-himax-hx8394.c | 142 ++++++++++++++++++++=
+
>> >  1 file changed, 142 insertions(+)
>> >
>> > diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/=
drm/panel/panel-himax-hx8394.c
>> > index ff994bf0e3cc..16e450b156b7 100644
>> > --- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
>> > +++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
>> > @@ -477,6 +477,147 @@ static const struct hx8394_panel_desc mchp_ac40t=
08a_desc =3D {
>> >  	.init_sequence =3D mchp_ac40t08a_init_sequence,
>> >  };
>> > <snip>
>> > +
>> > +static const struct drm_display_mode hl055fhav028c_mode =3D {
>> > +	.hdisplay	=3D 1080,
>> > +	.hsync_start	=3D 1080 + 32,
>> > +	.hsync_end	=3D 1080 + 32 + 8,
>> > +	.htotal		=3D 1080 + 32 + 8 + 32,
>> > +	.vdisplay	=3D 1920,
>> > +	.vsync_start	=3D 1920 + 16,
>> > +	.vsync_end	=3D 1920 + 16 + 2,
>> > +	.vtotal		=3D 1920 + 16 + 2 + 14,
>>=20
>> Shouldn't this be 's/14/16/' ?
>
> Could you give a reason for why you think so please, so that we
> don't dance around the perceived problem too long :-) .

Yeah, sorry.
.htotal appears like the value from .hsync_end + .hsync_start (minus the
1080) and with that same logic, I would expect .vtotal to be .vsync_end
+ vsync_start (minus the 1920). So the '14' could've been a typo.

Hope that clarifies my thought process.

Cheers,
  Diederik

> The front-porch / back-porch values are not generally identical
> that is more a random event.
>
> Grabbing a random panel like the panel-leadtek-ltk050h3146w.c
> you'll see the values not matching.
>
> So those timing values are specific to the panel and in the common
> case not identical.
>
>
> Heiko
>
>>=20
>> Cheers,
>>   Diederik
>>=20
>> > +	.clock		=3D 134920,
>> > +	.flags		=3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
>> > +	.width_mm	=3D 70,
>> > +	.height_mm	=3D 127,
>> > +};
>> > +
>> > +static const struct hx8394_panel_desc hl055fhav028c_desc =3D {
>> > +	.mode =3D &hl055fhav028c_mode,
>> > +	.lanes =3D 4,
>> > +	.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST,
>> > +	.format =3D MIPI_DSI_FMT_RGB888,
>> > +	.init_sequence =3D hl055fhav028c_init_sequence,
>> > +};
>> > +
>> >  static int hx8394_enable(struct drm_panel *panel)
>> >  {
>> >  	struct hx8394 *ctx =3D panel_to_hx8394(panel);
>> > @@ -683,6 +824,7 @@ static void hx8394_remove(struct mipi_dsi_device *=
dsi)
>> > =20
>> >  static const struct of_device_id hx8394_of_match[] =3D {
>> >  	{ .compatible =3D "hannstar,hsd060bhw4", .data =3D &hsd060bhw4_desc =
},
>> > +	{ .compatible =3D "huiling,hl055fhav028c", .data =3D &hl055fhav028c_=
desc },
>> >  	{ .compatible =3D "powkiddy,x55-panel", .data =3D &powkiddy_x55_desc=
 },
>> >  	{ .compatible =3D "microchip,ac40t08a-mipi-panel", .data =3D &mchp_a=
c40t08a_desc },
>> >  	{ /* sentinel */ }
>>=20
>>=20


--1d6a4595b3996cc7b6eed68782d8a2b1bd983f8490a29966be91698fee5d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaEGTzAAKCRDXblvOeH7b
bjh1AP9cGBzcHoj4/QSIYlzp1KnpbeOVmTCmlp3PliPz3aPnzAEAnj7ufwBOTtNa
CNe/bOF3w/MM46lqxolwBK0aDDsEwQ4=
=awq7
-----END PGP SIGNATURE-----

--1d6a4595b3996cc7b6eed68782d8a2b1bd983f8490a29966be91698fee5d--
