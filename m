Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 304935B8C8D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 18:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D83310E971;
	Wed, 14 Sep 2022 16:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940AA10E971
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 16:09:30 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id e17so23002474edc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 09:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=J9WP5NAr8P+W1UksCrZF3YJhEi14gphUNqpwhxjXLCQ=;
 b=lEFBMKf8ZS6KKEPDHuqzNAJ+5Of0Z6HiwTQT4F37IVMHCgb5BwSOpET0+DOhB5EHKk
 naCAS5F67wzqhIfzw46ablNIT12Wt9f1C+8RWU1Qrz0eB4ekf/aZicO3evvSXfhJ4G0n
 sDS6G8ZEyTTHJgqofI/MJ0WF8C3UJlvZh5WvlzHEykrhuWwp42/U6Ul37f3HGJFgj2m7
 O12liGEnBs/3oxbbfVMq5/OhHAGbF/dPcPs9Agoi4hJ/Bd2d8pWKbjSCVnnRAc4WXPO6
 oIxW7pFKNTngrf5JTHuXHVaPRCfeCecczv/9cEOQD1VzndliKU74vzWjynec0IzxNvI5
 AIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=J9WP5NAr8P+W1UksCrZF3YJhEi14gphUNqpwhxjXLCQ=;
 b=C1moCC2mmcbT6PnUVOuALerREV86bNQYuyXyOGuS04P4V0iHdlySjNo/3vw8cO6a9N
 VvjJOhvXXoXOkEgeYsHoXrvOwg/W2x7UNpQ80VJZmcFug752ZP73s9dwiafVGEYPsm9e
 IKsxZQaHKusctpDPvPNNGi1fUjvKxWQsOyvpYqYSFtkjHYrQs9rSWaWL81kdvwSJIPgU
 /t5EfhgfcubNuvjdVcO5QRdm+8dXkag/3U1Dh5EUe83AtK4ROKR9GA2bXTRSFdwG/Wa+
 kaQr7eu5RgOGtQgCEo5FXem9UMCD5sziRXH4MXQVeujHLkadSh1j2gfBdeXLQEEyBjCd
 u2hA==
X-Gm-Message-State: ACgBeo3NgviEgbUrw5sGg42AzFHygF1pAOAXhs+AkpNi37sJDPdagR/h
 M3oubrL7Ka+5PpAwQ+SDVTYkn/kMZOg=
X-Google-Smtp-Source: AA6agR6letvFVXy0kyg6RWZbEBaY7Vfuqj8lLvQdQ78j3nCVTH28wJ+Wl+Vf81pKhiQW8/gbDALNNg==
X-Received: by 2002:a05:6402:84e:b0:440:4bac:be5a with SMTP id
 b14-20020a056402084e00b004404bacbe5amr31362493edz.103.1663171768555; 
 Wed, 14 Sep 2022 09:09:28 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 g22-20020a170906539600b0076fa6d9d891sm7670196ejo.46.2022.09.14.09.09.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 09:09:27 -0700 (PDT)
Date: Wed, 14 Sep 2022 18:09:25 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 4/6] drm/format-helper: Support the AB24 format
Message-ID: <YyH8tTbezISxZ4oG@orome>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
 <20220905163300.391692-5-thierry.reding@gmail.com>
 <d4e76fbc-bb75-4b1a-c345-5dc7670d6a14@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4wzS7dWHSNWGI7MZ"
Content-Disposition: inline
In-Reply-To: <d4e76fbc-bb75-4b1a-c345-5dc7670d6a14@suse.de>
User-Agent: Mutt/2.2.7 (2022-08-07)
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
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4wzS7dWHSNWGI7MZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2022 at 09:23:01AM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 05.09.22 um 18:32 schrieb Thierry Reding:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Add a conversion helper for the AB24 format to use in drm_fb_blit().
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >   drivers/gpu/drm/drm_format_helper.c | 35 +++++++++++++++++++++++++++++
> >   1 file changed, 35 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_=
format_helper.c
> > index 56642816fdff..d564412a816b 100644
> > --- a/drivers/gpu/drm/drm_format_helper.c
> > +++ b/drivers/gpu/drm/drm_format_helper.c
> > @@ -503,6 +503,36 @@ static void drm_fb_rgb888_to_xrgb8888(struct iosys=
_map *dst, const unsigned int
> >   		    drm_fb_rgb888_to_xrgb8888_line);
> >   }
> > +static void drm_fb_xrgb8888_to_abgr8888_line(void *dbuf, const void *s=
buf, unsigned int pixels)
> > +{
> > +	__le32 *dbuf32 =3D dbuf;
> > +	const __le32 *sbuf32 =3D sbuf;
> > +	unsigned int x;
> > +	u32 pix;
> > +
> > +	for (x =3D 0; x < pixels; x++) {
> > +		pix =3D le32_to_cpu(sbuf32[x]);
> > +		pix =3D ((pix & 0xff000000) >> 24) << 24 |
> > +		      ((pix & 0x00ff0000) >> 16) <<  0 |
> > +		      ((pix & 0x0000ff00) >>  8) <<  8 |
> > +		      ((pix & 0x000000ff) >>  0) << 16;
> > +		*dbuf32++ =3D cpu_to_le32(pix);
> > +	}
> > +}
>=20
> What does the Jetson device do with these alpha bits?
>=20
> AFAIK the X channel's content is undefined. Shifting the bits into the A
> channel might result in wrong results in the general case. Better just set
> the alpha to 0xff unconditionally.

I'm not exactly sure, so I'd have to do some digging. I suspect that
perhaps this might actually be XBGR rather than ABGR, so this may end up
doing nothing. EFI FB reports this as ABGR, at least if I read the
output right, so that's what I went with for the DT implementation.

> > +
> > +static void drm_fb_xrgb8888_to_abgr8888(struct iosys_map *dst, const u=
nsigned int *dst_pitch,
> > +					const struct iosys_map *src,
> > +					const struct drm_framebuffer *fb,
> > +					const struct drm_rect *clip)
> > +{
> > +	static const u8 dst_pixsize[DRM_FORMAT_MAX_PLANES] =3D {
> > +		4,
> > +	};
> > +
> > +	drm_fb_xfrm(dst, dst_pitch, dst_pixsize, src, fb, clip, false,
> > +		    drm_fb_xrgb8888_to_abgr8888_line);
> > +}
> > +
> >   static void drm_fb_xrgb8888_to_xrgb2101010_line(void *dbuf, const voi=
d *sbuf, unsigned int pixels)
> >   {
> >   	__le32 *dbuf32 =3D dbuf;
> > @@ -672,6 +702,11 @@ int drm_fb_blit(struct iosys_map *dst, const unsig=
ned int *dst_pitch, uint32_t d
> >   			drm_fb_rgb565_to_xrgb8888(dst, dst_pitch, src, fb, clip);
> >   			return 0;
> >   		}
> > +	} else if (dst_format =3D=3D DRM_FORMAT_ABGR8888) {
> > +		if (fb_format =3D=3D DRM_FORMAT_XRGB8888) {
> > +			drm_fb_xrgb8888_to_abgr8888(dst, dst_pitch, src, fb, clip);
> > +			return 0;
> > +		}
>=20
> For the other alpha-containing formats, we treat them like non-alpha form=
ats
> (see the top of this function). Maybe just do the same here and then
> implement the conversion as drm_fb_xrgb8888_to_xbgr8888() helpers?

Yeah, that's probably for the best. None of the boot splash uses alpha
as far as I can tell and neither does the kernel framebuffer console, so
there's really little point in trying to support it.

Thierry

--4wzS7dWHSNWGI7MZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmMh/LUACgkQ3SOs138+
s6F2Hw/+JUOGp26n+gtC1KDkeBQO82s4xok6P12uIcrECywcrTMRuOJNlPkME5y2
26ne4bgYj5xBylsErvjWTDwZ2iIEpUIVxCH841xuLJ9eZ1zgOiMLmQax2EcjvvFb
/yKaVaZ1SyHoc5cXLTjCCHfdbGxhoEtNSRshtU0IUh85iHykBS2Z6NnmF0BLtCfj
mc9jrcqvvuHGrKKMWnlAdRPZiTRrj4MjLucavqr0OFJAHPjaOjjZpQ/Fne5GVfyx
Onx8qfi4q5FuWRzoZDljrC71H//94HqNxKdCmcW/MlMGlmFMi9R1ADCx1NA4iO0y
KQNsDXTlXTfna3/bF8KBvclSebL7o2onDKVnSbpkrkxowT+wq82zNuqW/96GlUw8
9dA54Ft+81QMuGdQLKxAoCfxjb3RZqAKDh9KrKBuTX8RXcCl0MuNdzToxBjv6AbX
Ck9Vo9fQrOWG9abO83L/fioStpBx4vbxPVDQcSx39oo5Fcrg/9jprjXlFgC9Nw1C
vy9jFdM3V3+1IsX479ltY9fEZ/bxaDly2hoeZIQ2/gflAfHcSQB5iyztGZZ8IsPc
lGFunjxtOAWNneMaWl7q0+qQFuANNV0kfL9rWs6Q0dXk1rCSAU5L6IHw32ThvgFs
9hLYOdkUdzk+OJSVaSSM45k/9Pi9vQPAkrOd5gyIWOaau/BQagQ=
=MPct
-----END PGP SIGNATURE-----

--4wzS7dWHSNWGI7MZ--
