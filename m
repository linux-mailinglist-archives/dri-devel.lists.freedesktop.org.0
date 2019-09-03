Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD2CA68E1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 14:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D10989320;
	Tue,  3 Sep 2019 12:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C1189317;
 Tue,  3 Sep 2019 12:48:48 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id p12so35570559iog.5;
 Tue, 03 Sep 2019 05:48:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OxhTjFMzsMPahnY7yPAHTAcPblgoxRftK/8FKreejXw=;
 b=g0tbahVtxZOjiqLJCrhkPVT70Wn7PZX++Y8mAv7J9KkrCpPWi0ZeOR4qcvVz3DPq+W
 cwmYPz0+SOGg1l4VbiuWkKmHDMqzeS9MUyyZACDj0SvajAYR1wJe5x4PE/fN+L1U70ex
 sbfJdK9UfY0eKjalidVEs/AfmGmmLRreYiziiflAruCH04flGy5/umDHEI1zM62fmABf
 TjDtITagsrTEjn22uZFncHk9nwmqRVIjiuorL1oNRKMo8kcn3hr5Ib/5TP3lkVBRZ6yh
 iRZf306ujKIIcfLoMxl3LCNOfc76H2rngjflIinD/E95e4UcTUk22eiVSRObYd0bfeMq
 1BgQ==
X-Gm-Message-State: APjAAAX1HN1zLGC3vqfp2VjF3yOeWR2dxLEs+cGGWXceS+YFostwlH0x
 4f8tXZVhPsD1QSU2MCmOQV8=
X-Google-Smtp-Source: APXvYqyrd2nHteZivlkmCkOI0rd6W7LhsOb8NOjEiSzALgTYHkdQV4otPHgUTDJnads5lKANjAmVvA==
X-Received: by 2002:a6b:b805:: with SMTP id i5mr13693456iof.106.1567514927819; 
 Tue, 03 Sep 2019 05:48:47 -0700 (PDT)
Received: from smtp.gmail.com ([165.204.55.250])
 by smtp.gmail.com with ESMTPSA id g4sm7407353ion.26.2019.09.03.05.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 05:48:46 -0700 (PDT)
Date: Tue, 3 Sep 2019 08:49:06 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/3] drm/vkms: Use wait_for_flip_done
Message-ID: <20190903124906.sytisd2swa77zh4h@smtp.gmail.com>
References: <20190719152314.7706-1-daniel.vetter@ffwll.ch>
 <20190719152314.7706-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20190719152314.7706-2-daniel.vetter@ffwll.ch>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OxhTjFMzsMPahnY7yPAHTAcPblgoxRftK/8FKreejXw=;
 b=K+dqlqlJc2uoxSIz4B0nEVQOR831dqmUAXoM9cnf8KlhHoXigzi3s0Zliyua8AsHXH
 hOjTOEfkDRFbP4vx6dpa71s/ZyFygHU5DVa9UEZ7W15YH8smkEqpcoPkV6gc+OTOeVrD
 B9EhwysjT+JWNf/tkF1YOiy7XxRGaSlq/bDskcFHdvqmXe+HWRFw73HJnsxgbOsF1oUf
 fR3oVBl0j7O9AmDUbgNrOaALWnjVXS/wl2uMxDs021PVm1z1hXWR5DKwOI00yATOjU4G
 R2Ecj/S+PsBSJ52Wnffr+MYjCqolHxBa6UbwEERrD6bGwAG+0HbtrSrzpFP/P1deZIvx
 ny1Q==
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Content-Type: multipart/mixed; boundary="===============1081521240=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1081521240==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aswdu57iq62gcvs6"
Content-Disposition: inline


--aswdu57iq62gcvs6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/19, Daniel Vetter wrote:
> It's the recommended version, wait_for_vblanks is a bit a hacky
> interim thing that predates all the flip_done tracking. It's
> unfortunately still the default ...

Just one question, is it safe to replace drm_atomic_helper_wait_for_vblanks=
 by
drm_atomic_helper_wait_for_flip_done? I noticed that only six drivers use t=
hese
functions; they are:

* atmel-hlcdc
* mediatek
* msm
* tegra
* tilcdc
* virtio

If we change these drivers, can we drop the helper
drm_atomic_helper_wait_for_vblanks?

Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

Thanks

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_=
drv.c
> index 44ab9f8ef8be..80524a22412a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -83,7 +83,7 @@ static void vkms_atomic_commit_tail(struct drm_atomic_s=
tate *old_state)
> =20
>  	drm_atomic_helper_commit_hw_done(old_state);
> =20
> -	drm_atomic_helper_wait_for_vblanks(dev, old_state);
> +	drm_atomic_helper_wait_for_flip_done(dev, old_state);
> =20
>  	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
>  		struct vkms_crtc_state *vkms_state =3D
> --=20
> 2.22.0
>=20

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--aswdu57iq62gcvs6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl1uYUIACgkQWJzP/com
vP/oaA//TTSZpIP1tYDeccQZ9Ud11QtDKpuFtpzQsBcwflXvx6jISlD3cFz6EGlf
N/XlkF7QY8asp0GL3mUiJajW0ops7LJ7gt9heTvChJ5ikjGnDGHqK6UT/IaEJO2l
rXFa2AoWZQfqVtOtZunjsFiXe3Bx5IneiQOoSazNdyy56rGAnj9HgB3UZMNgR9/I
HV4jdzQGnHA5BOsusWPrK2roRm9UmjaOG4MPa6Zmv0G8brpq1ptiyh8go86mZ2KF
3bWwpRN8ggGANzMtFlEjev3UVt9V6qPxZxRdXKTRp316Teu9vNULh0AfAgxR4pLI
PXuGSLg9vCd2M1XEbfo4Zr0OjZx9y28lvSEcpMPpx4LE6s29NpEkHEPj/LXHwaw5
vwg6vA+Me05ZkIZ5AfQL+fegYOZD9abaDlI2ZiUuVuTyC02KPnkuJyPAqMr1gbxK
wHRboIrfvQW19oo6s3g8AWrLGWdI5bmdon8V1UB9LidEMyzcfqauIlRc4esBxrQL
3N4ogQ6iDDRQ5m+JniCMgwwBJzvILcwhu9T+h0NyMPpqZVauRq3TKN8nsfmuTC2e
NY9w1dpD3REokcm95xAVfjSbO4k5Km7I7SRuIGw4i91MjSnx6CjYDwAlWMT49ZF4
MSbSjqm3z+5Uvdnzv45ad5U/KkdBicH66it0/qkG3sCLoC3P7po=
=+Ymn
-----END PGP SIGNATURE-----

--aswdu57iq62gcvs6--

--===============1081521240==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1081521240==--
