Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5FC6AB84B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 09:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0F410E104;
	Mon,  6 Mar 2023 08:30:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0706610E104
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 08:30:28 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id t11so11647297lfr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Mar 2023 00:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678091427;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=aU1YjAUU/iFvVhvKaxFvWo0dvfjpSyP2e3R8zxMYNzY=;
 b=PQ7S3nY5VdXeauZHsRi3JhkbI935Asms738tDqWJPEQW+KK/FbfdbGvLhDd39jmZcc
 0DC5tyAupR2U6181B89olt9rvOxRfHtF2nlNph+vEf0j8N1oG38SzD/MZl1/06leAF6x
 LrO/7md1ava7ARos090gujVfQljymN0GJ/PQ5vLzvasLyV1Vnw+IFe3lT+EJgBJZt9VQ
 LJuHB7pLJvWzxwKuzyJPXCjmSa6skSwg1keXpjLL1w6uhcncko3/hG4fO/srAO3lrzVn
 nVP+9xsS3uQHNKJCo0gWT/5NcN4d/V9Oc4F09+4yV1yl2pEmbPxoLXENwCGUy6g3n5Uv
 xcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678091427;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aU1YjAUU/iFvVhvKaxFvWo0dvfjpSyP2e3R8zxMYNzY=;
 b=JA6ofT5W5oJjzOMjLjbvuVSx24gH8j7GuaqXReO92CG6x6dinlOiR1w+V40O0SLvPo
 x4Qnsdjow1+2v162TnkrZjWmhCRU84tvH/bGz7Po2dVA1370Q/fGI+S+E9tGLoUkZTCJ
 yad8ZDjJMRiISEEl4MPKOqu20QChTYULYfN7fecnOzl4+UBDsUjK/QEPjGJ6PJOiw29B
 E0oTJeBvRh6Hd3xmrwkt3Yd7nhZH9LQ3iBoQhb/ctNAP9wIyPNVatOMEwRnSfhiN2p24
 6ehYDndUOELrpApZRvC/JZJPTmj4EwieQThBHM92C90yddXxfE3Fzt2iIAlLYv177V1/
 Zt8A==
X-Gm-Message-State: AO0yUKWGlgBX4bAHE71reLEjBF2/tcLXdctvXDMfqRrsnMaVwO/BLZLs
 VYkRI6qRFr0l4Nl3lD/u/yc=
X-Google-Smtp-Source: AK7set97oWrOCDZe34nt//4wZyETDwFuLtUmCUTaERf+gvAQPzbSqlIhR4oses+L2clK57jbK6p1Lw==
X-Received: by 2002:a19:760e:0:b0:4df:2c71:57fb with SMTP id
 c14-20020a19760e000000b004df2c7157fbmr2510159lff.43.1678091426984; 
 Mon, 06 Mar 2023 00:30:26 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 a11-20020a05651c030b00b002959aecb63bsm1593604ljp.53.2023.03.06.00.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 00:30:26 -0800 (PST)
Date: Mon, 6 Mar 2023 10:30:15 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: fix typo in margin connector properties docs
Message-ID: <20230306103015.19bb5876@eldfell>
In-Reply-To: <20230305103503.42619-1-contact@emersion.fr>
References: <20230305103503.42619-1-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/QfLE5Fsmt0Zg4db0u42lav=";
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/QfLE5Fsmt0Zg4db0u42lav=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, 05 Mar 2023 10:35:10 +0000
Simon Ser <contact@emersion.fr> wrote:

> This was pointed out by Ville and Pekka in their replies, but
> forgot to apply the change properly before pushing. Sorry for
> the noise!
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Fixes: 409f07d353b3 ("drm: document connector margin properties")
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index 4b12c7a39ee3..48df7a5ea503 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -1452,7 +1452,7 @@ static const struct drm_prop_enum_list dp_colorspac=
es[] =3D {
>   *
>   * left margin, right margin, top margin, bottom margin:
>   *	Add margins to the connector's viewport. This is typically used to
> - *	mitigate underscan on TVs.
> + *	mitigate overscan on TVs.
>   *
>   *	The value is the size in pixels of the black border which will be
>   *	added. The attached CRTC's content will be scaled to fill the whole

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/QfLE5Fsmt0Zg4db0u42lav=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmQFpJgACgkQI1/ltBGq
qqfZPg/9ErTM8tiHUcj64YxpQUrNz4dSYjEQ8n//9RfYcsaezf8F4jJRPvkk6s87
t1JGPjclOrzTuDno0fFWiVV6blDGdSPUDTtm8BBtaIDQbgG192fL/CxuPw7KKAvD
ynvnFP9kYsAVE6e7aF2sH/cfHaoMkHpwnZhjQrYOi50oLpYmrVA2j8qIoBPU+eEE
t/En8ofRmJO4vqnyJ9lBTfwZyjOQZcGb5Xu05t91q9Pjj7XfTg198rsYLKzuQx4T
4N5K956YX5GSfu+0EDWV7wYzWQDz+A/TIZqY09tMm2DXVy9B3TIaqZVjMvA3oiW4
gYgu9ZD5rQ+ryMBdVLyuqfkwSTkq+Hm/jTnbFO+qZ76YbRQoba7/mZ6cmbWIsZX2
8r37y+bf7cVWMZMPYNIzkE0EPIaAt+fJq1MLratGwZNm69fRvEVZBb1jtrxzImAc
rhLtidsOVXgc5SMv5Ev5muwiFXmLYluAnLJLG1b4csyLTtXnelSVEIwfCq06sFyy
aopQZkmCff9sHswyuZiGQ/RtQoGkFRPy7m+mMcugTIlLkFyEzeLn+C9o44jtr295
kuIel7VOjqmcxZJz0DMEuUfU+HJAmD/UlA12LA7pYN2qpM85UvFl56j/Kdu81Cs5
m7MLJ/XgGlV+wGfBvo4Dydqg4K+Te6+WTlLVM7mfmhItD3jMzcg=
=I/p6
-----END PGP SIGNATURE-----

--Sig_/QfLE5Fsmt0Zg4db0u42lav=--
