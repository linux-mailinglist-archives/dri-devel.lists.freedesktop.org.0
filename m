Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1932C4AFE1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 04:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F2A6E27A;
	Wed, 19 Jun 2019 02:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB286E27A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 02:10:37 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id d4so24627296edr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 19:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=urJuQnFtlxDLCZVzeNDwE562IYnNP8kOvDGk4FlmAj8=;
 b=Az/h8c7t/LPYdhIATvWDD3QGSKsP/dZVXLfbs9D93lkLvlYhX9yrkHZDrqpAH5I6ZE
 ijgTIEPAQkEuY63K0LSAftXS5g8tW65B9W0fMR+hwiCg3jWsm9TVP9oyCpjWMv5AhKjS
 0HUIjvvqdKTRh1c+MMEZ4AM5GWupXuOG1fc1vZF7ONO11du3bOv9LuqqVkBuy96odTcS
 sYxOlEfx8bm04FSE0QnM7VTyNMpUCVF4Rirv6JctZ4zvInOckHurRL5mdMHAlsmpxJOn
 RsIrYiLPpekn26RlpydurwNw1v1Bua+cQpgPntfQektXaKbZ7PhRGDR5mEOEvxIemWW/
 bg5g==
X-Gm-Message-State: APjAAAVI5wc/DK7wzSP/HJr5DqOTH7jYRHoLPvTNJ3X6jN42QvGkPPXB
 ujV23T69Tiqj/LX8go5SF/X0NLrLr0M=
X-Google-Smtp-Source: APXvYqwTPSCHlpP6tuEyLSOpm1kjyUpSGagSccvUjMoaHCIqUbcRQ2I70KE9ClHshfmQRqsbG1YE6A==
X-Received: by 2002:a17:906:1804:: with SMTP id
 v4mr1791206eje.188.1560910236431; 
 Tue, 18 Jun 2019 19:10:36 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id w11sm1630496ejk.63.2019.06.18.19.10.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 19:10:35 -0700 (PDT)
Date: Tue, 18 Jun 2019 23:10:31 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Oleg Vasilev <oleg.vasilev@intel.com>
Subject: Re: [PATCH 3/3] drm/vkms: add crc sources list
Message-ID: <20190619021031.gqq3pndevmhixftx@smtp.gmail.com>
References: <20190613121802.2193-1-oleg.vasilev@intel.com>
 <20190613121802.2193-3-oleg.vasilev@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190613121802.2193-3-oleg.vasilev@intel.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=urJuQnFtlxDLCZVzeNDwE562IYnNP8kOvDGk4FlmAj8=;
 b=mMAK0Sz3NZ1anTLHjc2S0tO9BwDSvrkJl+kHE2++KDxamRryTIaV0cFydM0MD2vZwJ
 C0Jc4fINM1NtwfOfqTPvPSHlvjoeRuoE/FpteI/8SOlEcWklkfWuJQ9onbk7uy6hTvBh
 G6AVMHErlwBy0JE9X6VzyBf/+yLhT+RaugfVmImGdDqb1EMI0peWF8zkM2nHiGnapafz
 ydnaU1J0rnM6KSYrBYz6Krh/18Y/9/TiGMtGjeQnFfCgvK7LzKfP36GCLG8FBQxDfYyK
 RzQkBpGUGHRtkEbQta1L9ttei3elZOgpr6oSZatMCqgKM/F54Ifa2TTV3QnuE9ijzZik
 nbLA==
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
Cc: Shayenne Moura <shayenneluzmoura@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1861875205=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1861875205==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cr4dg3qspd3barbx"
Content-Disposition: inline


--cr4dg3qspd3barbx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/13, Oleg Vasilev wrote:
> Other drivers are able to list crc sources when accessing
> /sys/kernel/debug/dri/.../crtc-0/crc/control
>=20
> Even though VKMS now supports only 'auto' mode, it is more consistent to
> have the list available to the userspace.
>=20
> Signed-off-by: Oleg Vasilev <oleg.vasilev@intel.com>
> ---
>  drivers/gpu/drm/vkms/vkms_crc.c  | 9 +++++++++
>  drivers/gpu/drm/vkms/vkms_crtc.c | 1 +
>  drivers/gpu/drm/vkms/vkms_drv.h  | 2 ++
>  3 files changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_crc.c b/drivers/gpu/drm/vkms/vkms_=
crc.c
> index bc717a8888b5..819313ef80b6 100644
> --- a/drivers/gpu/drm/vkms/vkms_crc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crc.c
> @@ -220,6 +220,15 @@ void vkms_crc_work_handle(struct work_struct *work)
>  	spin_unlock_irqrestore(&out->state_lock, flags);
>  }
> =20
> +static const char * const pipe_crc_sources[] =3D {"auto"};
> +
> +const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> +					size_t *count)
> +{
> +	*count =3D ARRAY_SIZE(pipe_crc_sources);
> +	return pipe_crc_sources;
> +}
> +
>  static int vkms_crc_parse_source(const char *src_name, bool *enabled)
>  {
>  	int ret =3D 0;
> diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms=
_crtc.c
> index 1bbe099b7db8..4d11292bc6f3 100644
> --- a/drivers/gpu/drm/vkms/vkms_crtc.c
> +++ b/drivers/gpu/drm/vkms/vkms_crtc.c
> @@ -147,6 +147,7 @@ static const struct drm_crtc_funcs vkms_crtc_funcs =
=3D {
>  	.atomic_destroy_state   =3D vkms_atomic_crtc_destroy_state,
>  	.enable_vblank		=3D vkms_enable_vblank,
>  	.disable_vblank		=3D vkms_disable_vblank,
> +	.get_crc_sources	=3D vkms_get_crc_sources,
>  	.set_crc_source		=3D vkms_set_crc_source,
>  	.verify_crc_source	=3D vkms_verify_crc_source,
>  };
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index 81f1cfbeb936..891f2d63d74f 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -136,6 +136,8 @@ int vkms_gem_vmap(struct drm_gem_object *obj);
>  void vkms_gem_vunmap(struct drm_gem_object *obj);
> =20
>  /* CRC Support */
> +const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> +					size_t *count);
>  int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name);
>  int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_nam=
e,
>  			   size_t *values_cnt);
> --=20
> 2.21.0
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

Applied to drm-misc-next.

Thanks

--=20
Rodrigo Siqueira
https://siqueira.tech

--cr4dg3qspd3barbx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0JmZcACgkQWJzP/com
vP8CvBAAs3EgwxUEIaNT7S1eZcw5vRNwZ/T+HfBCgqOQCVR4iSRp0Mawp3QQj88I
KRZOnnwbhf2ndDKzDtPQqsu8ipJ0xcT+3nH9Md6aPw8WvHSYZzspQcW/m7SLh8u7
D4g8JkSqrgRaMf5+XJgklOuxwmWa5kK9iSLU8voIgxcVofYNVav8nfzqkSTR4qp4
urxaRUJfmMpWAR23dcgsbxE2I9UIfoYjfK5y8ha7T8MPsk4/MuwgrxXecm0g3UMC
eIcodtLK6VD2Rxx/3OTnopoAUa2Vj4sHuRBYIYYduNtv7RAWmiSVHL2/UAsmqAys
4sJx/90OqPr7B3ovL+MDAH3KI0L+IcEXk5gGJP6pfsWOm4LuOc9Doz83DMMUaGpx
qliEY3lrrblnY4RvyZIkkfWWuG3E2kIdXcLN7qcYzmL7Zqb3VIaFuA55iQe1u/oq
UUmTZeH6KrO3w/248wYviWc7ktTM7nDleZQRYC5MTieOwGaYzoTpgx7Jsxceaszr
piI16GyHUNOzWk5PucL/UxRZev8l+U0thTAXtrLJ8WUJvpPeTV9q0UdpS7Opij9q
xArmlpQSTBGxhcRZk25N3YW9gtEk3h64P2ZgKaNeTtQ42yIdqky6c+TVRFO1yB57
mF+2wIPTMdHmtCqsmXO4vS744w1ijrwhbyohayFlralMOwzUG5g=
=RWdN
-----END PGP SIGNATURE-----

--cr4dg3qspd3barbx--

--===============1861875205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1861875205==--
