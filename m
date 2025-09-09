Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93390B4A278
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 08:39:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CD010E147;
	Tue,  9 Sep 2025 06:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LAZ8R0j3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E40E510E147
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 06:39:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A62F140053;
 Tue,  9 Sep 2025 06:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099AEC4CEF4;
 Tue,  9 Sep 2025 06:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757399985;
 bh=CDGgDx4Nki73aVoqrw4ePQX/fS/RDBiwv6Ilq8gxKAw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LAZ8R0j3Vu3SejTmZVGa209vyubij2W5+HI0vyLeeCExpyUOTPOl1orGi3DuJl03G
 JAvPioYpOy2LYqXPwMAv21aqWKEC6Nh1XA+scKx9nNMrjtXDGOOvBohtpxj23ksiTv
 uewdU44EmAEnqX3/GVfoIfjkLtJMwC0LcrsqZz+k5HjxiW28LUvBtBTNMZKnX+9AkE
 A6v4lVb/3qw90yJ1dksSZzRr/Emj2pDp5uR8p5MVjCuNu1WMytesAFi1OQxUDUW806
 ilf+MMcau1yjUaaA/+uuG1sh/DhOVBLZwblzGYU/mSy32BJGo7Mp9Grb9LDluyAIKU
 UEVEH6bbGcPAw==
Date: Tue, 9 Sep 2025 08:39:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
 cristian.ciocaltea@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 
 p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
Message-ID: <20250909-omniscient-honeybee-of-development-adca8a@houat>
References: <20250821073131.2550798-1-shengjiu.wang@nxp.com>
 <20250821073131.2550798-5-shengjiu.wang@nxp.com>
 <20250901185208.394cd162@booty>
 <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="xbvuwjwmyrruqbpw"
Content-Disposition: inline
In-Reply-To: <CAA+D8AOCTqb5jLeRapYk4wRGZrsrPiuAR=ow3OA1B0+M9X4k7w@mail.gmail.com>
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


--xbvuwjwmyrruqbpw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 4/7] drm/bridge: dw-hdmi: Add API
 dw_hdmi_set_sample_iec958() for iec958 format
MIME-Version: 1.0

Hi,

On Wed, Sep 03, 2025 at 06:41:05PM +0800, Shengjiu Wang wrote:
> On Tue, Sep 2, 2025 at 12:52=E2=80=AFAM Luca Ceresoli <luca.ceresoli@boot=
lin.com> wrote:
> >
> > Hello Shengjiu,
> >
> > On Thu, 21 Aug 2025 15:31:28 +0800
> > Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> >
> > > Add API dw_hdmi_set_sample_iec958() for IEC958 format because audio d=
evice
> > > driver needs IEC958 information to configure this specific setting.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > Acked-by: Liu Ying <victor.liu@nxp.com>
> >
> > [...]
> >
> > > +void dw_hdmi_set_sample_iec958(struct dw_hdmi *hdmi, unsigned int ie=
c958)
> > > +{
> > > +     mutex_lock(&hdmi->audio_mutex);
> > > +     hdmi->sample_iec958 =3D iec958;
> > > +     mutex_unlock(&hdmi->audio_mutex);
> > > +}
> >
> > Apologies for jumping in the discussion as late as in v5, but I noticed
> > this patch and I was wondering whether this mutex_lock/unlock() is
> > really needed, as you're copying an int.
>=20
> Thanks for your comments.
>=20
> Seems it is not necessary to add mutex here. I just follow the code as
> other similar functions.  I will send a new version to update it.

Let's not be smart about it. Next thing you know, someone will add
another field in there that would absolutely require a mutex and now
you're not race free anymore.

Unless there's a real concern, the mutex must stay.

Maxime

--xbvuwjwmyrruqbpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaL/LpQAKCRAnX84Zoj2+
dor3AYCHio4X2egliC/DxGhE69IFjoCB2kz5rTVR9L9w9lm/BGcwlE52ivJCxATo
hyl0oZ4BgJ1LN6fhReyRbAA8/h8WtarRKmetqF8Cuizv58UMifibdOHkCJ59vF5M
4NuXwPWs5A==
=Ylzo
-----END PGP SIGNATURE-----

--xbvuwjwmyrruqbpw--
