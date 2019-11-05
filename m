Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6974EF1F3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 01:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFF1C6E8C6;
	Tue,  5 Nov 2019 00:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514ED6E8C6
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 00:29:19 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id p20so8574378qtq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 16:29:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CDccPPlNGiCfoqu894jO9EoSUuh6MeezFwGXcRRqFkU=;
 b=LVQXaFWpkVpbIkcTjjmPzZKPRCm7tS3yFu+cSeyDDkVczMCDT3pD/0N1zyERCh4FRT
 iQPnC4SNdlcTHUFkG1eV5KbxIK24om+mSR0gpS/uC5QOXA0p61/QFR+yh4KyfM/oYhFX
 i5JRhM0aewG3bFwPoK0df/M1twBcRr+v4Dq/zzQAfi5qGRe30wUtqz33ifR1xkn5N2DQ
 O4Bd9t82UvTNhu6SW21Lzki0TXdGHex97CrGDf13iGY+kB7gQAYrnENiudE74gc3RduW
 EG94/0Z9k4wQ/GjL8PbW6ZAdmVc5V9qKBiciPwRVZxdowY2wpFjJO/8YBjabrLWybvSR
 XBCg==
X-Gm-Message-State: APjAAAU00A0xkzpZERfN5sflpMLaZo406lNHZ+tfvuh6qZLTc53UASel
 z2rSXLZgCh7sMPJ55KgZlIo=
X-Google-Smtp-Source: APXvYqws5wTbu9GRpxopz16IW/8ShhuXRJpvPoIQodrvP3ym7RED8lQkJNZVbzLH3dJdjORNMiO0Ug==
X-Received: by 2002:ad4:5289:: with SMTP id v9mr521802qvr.134.1572913758044;
 Mon, 04 Nov 2019 16:29:18 -0800 (PST)
Received: from smtp.gmail.com ([165.204.55.250])
 by smtp.gmail.com with ESMTPSA id t26sm2176247qta.75.2019.11.04.16.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 16:29:17 -0800 (PST)
Date: Mon, 4 Nov 2019 19:29:15 -0500
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Subject: Re: [PATCH VKMS v3] drm/vkms: Fix typo and preposion in function
 documentation
Message-ID: <20191105002914.wvscxesn2ecno5w3@smtp.gmail.com>
References: <20191104161424.18105-1-gabrielabittencourt00@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191104161424.18105-1-gabrielabittencourt00@gmail.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CDccPPlNGiCfoqu894jO9EoSUuh6MeezFwGXcRRqFkU=;
 b=HW0/m8GejFEos3m0bmUb9MlAgq1y3jwYvX8Ptry/DkSBH7GndVp/EeYs8a8dBgwM7+
 WQ6MAH8q5CeiYAC8JEAxSytav/btmSheGZNFz/iJnqmMEnISkVnWfB3qT5/sW6joK7mF
 8eZd8KOHdnYSIkm39RwOsbWZwVxGona5Ctg2kIIm1amf84SaJOL/NQQ3VS3aiBb0RgxL
 N0CYEmkkpt3EwGqzwNYY94Hqp7nvv7aPQ+DVuRXapWXbUu2DFlv89K3bosnVu7lzGRX/
 STCRmNCOHXiyaKJywC5TSr+Ve4NktLZpbWB6nRHar0gpimLiYi3KEb6OG2O8y37l0PCl
 S4SQ==
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, manasi.d.navare@intel.com,
 outreachy-kernel@googlegroups.com, lkcamp@lists.libreplanetbr.org
Content-Type: multipart/mixed; boundary="===============0773169979=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0773169979==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="335jnswaoauvhj7y"
Content-Disposition: inline


--335jnswaoauvhj7y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Gabriela,

Did you double-check for other typos?

Reviewed-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

Thanks

On 11/04, Gabriela Bittencourt wrote:
> Fix typo in word 'blend' and in the word 'destination' and change
> preposition 'at' to 'of' in function 'blend' documentation.
> And change the task introduction word 'Todo' for the word all in uppercase
> - 'TODO'. With the TODO word all in uppercase (as it's the standard) it's
> easier to find the tasks that have to be done throughout the code.
>=20
> Changes since V3:
>  Rodrigo:
>  - Merge the patch series into a single patch since it contains one single
>  logical change
>=20
> Changes since V2:
>  - Add fix typo in  word 'destination'
>  - Add change of the preposition
>  - Fix the name of the function in log message
>  - Add the change in word 'Todo'
>=20
> Signed-off-by: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
>=20
> ---
>=20
> I've tested the patch using kernel-doc
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index d5585695c64d..4af2f19480f4 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -43,18 +43,18 @@ static uint32_t compute_crc(void *vaddr_out, struct v=
kms_composer *composer)
>  }
> =20
>  /**
> - * blend - belnd value at vaddr_src with value at vaddr_dst
> + * blend - blend value at vaddr_src with value at vaddr_dst
>   * @vaddr_dst: destination address
>   * @vaddr_src: source address
>   * @dest_composer: destination framebuffer's metadata
>   * @src_composer: source framebuffer's metadata
>   *
>   * Blend value at vaddr_src with value at vaddr_dst.
> - * Currently, this function write value at vaddr_src on value
> + * Currently, this function write value of vaddr_src on value
>   * at vaddr_dst using buffer's metadata to locate the new values
> - * from vaddr_src and their distenation at vaddr_dst.
> + * from vaddr_src and their destination at vaddr_dst.
>   *
> - * Todo: Use the alpha value to blend vaddr_src with vaddr_dst
> + * TODO: Use the alpha value to blend vaddr_src with vaddr_dst
>   *	 instead of overwriting it.
>   */
>  static void blend(void *vaddr_dst, void *vaddr_src,
> --=20
> 2.20.1
>=20

--=20
Rodrigo Siqueira
Software Engineer, Advanced Micro Devices (AMD)
https://siqueira.tech

--335jnswaoauvhj7y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl3AwloACgkQWJzP/com
vP+wqA//RY1Usj+euFpORZ/pNoIlcFq/SrA/bmS4Iys6TkbVypP114kOmX4EyG3f
Tvbeb32D0lsPv+d3pcqMENJfT4Gef0LS9t9wXuhoAdfcfs83FAsPvxRW44G0U40F
lMVjp13b9pjmsxs74NcxoyEmc7BFfi5sjvZd3dKZS2W/dknvBWrWutrSptNE1iLs
w17SGsiNSx11c92i74pFMf1wD/bw868+53+dhQT1b4QfA8E/WgUs9aAd99I0T7iN
RCiOWUpHgXQ+E/1koZ1XvESECEi1ByBoalQG/MxzY53fJe97oKolUKq7tSmtVwer
Xw4zad+WXVa9hUjoqzoTfPrY0OOX3WgW5Ger+jepbSaGGRWB4qYLuHU89S1uJ6qL
wlYnMVGngOs5Z7Ee46i0Hn57C2q7foSg4xbetYTo3DUqPlTTswr9wIdUsnmgWEaC
5MRRk//wuCBGlef+TDjPyY0Z84aRKKFLR+fYX6kVYsGacRQ2gn8dUtzD9N+jSWd7
5kxwX73u+D1Tm5093lN053VtyOaZn6ESwPTmKHpj4Xd3BIailr3d2Q0H/gACdXr3
uP15UPitWukP5qTXZcuAvFI5rg87qF9yxZ4zxzIGbs6eqWOFT2RhhZA5wdUJ+rcb
+UvXuSowTajR4bs6z6MUUIxEowrzVg+MuHS+ZRXNqDbIMw5z+H8=
=zC3i
-----END PGP SIGNATURE-----

--335jnswaoauvhj7y--

--===============0773169979==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0773169979==--
