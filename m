Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EE510EBDD
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 15:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A4A6E0AB;
	Mon,  2 Dec 2019 14:53:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EE86E0AB
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 14:53:10 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u8so42494wmu.0
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Dec 2019 06:53:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zmgzqOyCDhjpjwk0Vg1FhXVuITig63Ncr/eMsxh04VI=;
 b=HRw8m37DS3AeTBdiW2ICuvWZ/NdvMgDX7L9i3aDW/SHXYJHk5Xk3dO94bPqcR32wf3
 KK2K4Zxu6W6iTZhcm1UKVcQW4WjF1kkGJhj6tC0mS0UnE6rBC7ZknCFEdRCeIJ8PpRK3
 Yg25n8WzzqJ9+FJltcOlXRj53BtJBZ1ICBsR9y7Fli7HdR0I62tl3Q2SovRBgVKrgxBf
 MsLcaY8UfVXtmkDUjxStsNKFTqZPSTrzlbm6a4O5GOLubphtGlz6DTm/RT5qb5nigq41
 zHC2wSCPRFV9iDS2H47xmfsJyNazUIZP5HAVrPiptVosOpYFaU/j7ya0m3Yby9gI3Yj/
 Buug==
X-Gm-Message-State: APjAAAXq6zt4Hb9S+3Mq5u86+oaj/TrWNVazDanSkRI407hSuD+VPqKU
 YFuhRdW0mYx/W7s7bj5Svr11tbW1yEU=
X-Google-Smtp-Source: APXvYqxYJxvkw3vly/HCk2neZgZ4Jy8fOwSSwUZ7R5XkmCd+QrOKulfaLQRQXCsGC/Ar60bF/kRl1A==
X-Received: by 2002:a7b:cb59:: with SMTP id v25mr28615918wmj.159.1575298388836; 
 Mon, 02 Dec 2019 06:53:08 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id t5sm16538558wrr.35.2019.12.02.06.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 06:53:06 -0800 (PST)
Date: Mon, 2 Dec 2019 15:53:05 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Torsten Duwe <duwe@lst.de>
Subject: Re: [PATCH] drm/bridge: analogix-anx78xx: Fix drm_dp_link helper
 removal
Message-ID: <20191202145305.GA56608@ulmo>
References: <20191130145155.86B0F68BE1@verein.lst.de>
MIME-Version: 1.0
In-Reply-To: <20191130145155.86B0F68BE1@verein.lst.de>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zmgzqOyCDhjpjwk0Vg1FhXVuITig63Ncr/eMsxh04VI=;
 b=FFbW7Jw81tAWuyxW3ovU5jkMvcxf+HKCdhE7ydqQ8QDV9EolgKruxuYKKcDMD6mGHG
 80dctRb9eEzv9MFOYdNr3CPal0EJtCjS0ppOV0fegKZac1ED2UH2HlWTJ8UKzhRK8JUF
 x44nUSwvm260JiiesquuG3FgRUULYwp1d5c0cKJTxUM6aELQuRNOAfCBo5JcZ4TJ1zD+
 IHBe1c9/Uil8ujKAI4RcJlpxnesTJhuy9U6iK69agsbqrcWutiPkRkWlMy80prBr4cWp
 h50mn3ZpwwfTwTBDLQMCw5QC5GhkOR/GD2ht7CTExld+32cNMKQ5nBHQYQULswzpCUeS
 567A==
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: multipart/mixed; boundary="===============0599943519=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0599943519==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Content-Disposition: inline


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 30, 2019 at 03:51:55PM +0100, Torsten Duwe wrote:
> drm_dp_link_rate_to_bw_code and ...bw_code_to_link_rate simply divide by
> and multiply with 27000, respectively. Avoid an overflow in the u8 dpcd[0]
> and the multiply+divide alltogether.

This was supposed to be a 1:1 conversion of what the helpers did, but
then I tried to be clever and reuse variables rather than add an
intermediate one and failed to realize that dpcd[0] was u8 and would
therefore overflow with the multiplication.

Personally I think it's slightly nicer to go through the multiply/divide
for consistency with how these helpers are used. MAX_LINK_RATE is a bit
of an exception in that the field occupies the whole register, but most
other registers need to have the fields extracted properly.

In this case it doesn't really matter, so the below is probably good
enough.

Good catch!

Reviewed-by: Thierry Reding <treding@nvidia.com>

> fixes: ff1e8fb68ea06027 ("analogix-anx78xx: Avoid drm_dp_link helpers")
> Signed-off-by: Torsten Duwe <duwe@suse.de>
> ---
> Has anybody actually tested ff1e8fb68ea06027 ? I copied that code in good
> faith for the anx6345 and changed a few other things simultaneously, and
> spent some time wondering why the panel stayed dark.
>=20
> ---
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers=
/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 41867be03751..864423f59d66 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -722,10 +722,9 @@ static int anx78xx_dp_link_training(struct anx78xx *=
anx78xx)
>  	if (err)
>  		return err;
> =20
> -	dpcd[0] =3D drm_dp_max_link_rate(anx78xx->dpcd);
> -	dpcd[0] =3D drm_dp_link_rate_to_bw_code(dpcd[0]);
>  	err =3D regmap_write(anx78xx->map[I2C_IDX_TX_P0],
> -			   SP_DP_MAIN_LINK_BW_SET_REG, dpcd[0]);
> +			   SP_DP_MAIN_LINK_BW_SET_REG,
> +			   anx78xx->dpcd[DP_MAX_LINK_RATE]);
>  	if (err)
>  		return err;
> =20

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3lJU8ACgkQ3SOs138+
s6ESyxAAsH3lHwAcvFDOveRKXMNwNMz1zUqjIvSUJBPaF6mdj1WfLsQt9s91DMGz
WTPVTEDM+I0whk3svW4kqtxrbtoge6A35j89dCk8EuqkhYSxNym6nUbLlBmFeTR/
Z1voKA/16p650+ONpEhdWXGToW1SUy7KsIW7zuv0kTe2+CyY25F8oFL11n3/12sM
SpIqBRHZBr7EK15hI1HywUkgrnCUjH0Br3vW5taqOZ6zB3WXei7HcL+9CRSdc3zJ
ncQVjvx87Outr0KMKpEkFwiVk75G0BtOoBsiXtp1Je+k+UKwZAIRD/B4NarLV6nZ
YfDWCdcOSlbXX+cioSozXgZtb6VtbCIMGxrqxQ13/k0QNTvYtjNCxhanG+BNJaoL
C2AgI/Qb84tk0XO8M/wnajfMvg4ZuKxdeX6V3T+HQxgQk0tr3OXOZ8osN/IpWu9S
uNVxIBlaEYU6h2/Y3QN+ggeyp9k3mgDBPWxEtCc+Ka/7kJaPo4yUL9lPNGZO8NRx
3ZzMDVk77kHBAQe2C8vkaF3iQ0yYUK6oaTPsoSU33i0cX0fXxqsALVcOqv3xZ6wb
FBHFdCrniSwprTx81e5Iy64G7p0LOhIuOT8FVDodAZOrFNfPIhqwH+l8XpgpxKUd
05pAyNGeKEvQd0G59T10lGaDUlllvOYDk4oo1ke59w+GQUwr/zw=
=+amW
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--

--===============0599943519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0599943519==--
