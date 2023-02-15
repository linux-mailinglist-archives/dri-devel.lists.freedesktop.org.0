Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B69697DA7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 14:41:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D8F10E108;
	Wed, 15 Feb 2023 13:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7943410E108
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 13:41:46 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id qw12so48326114ejc.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 05:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xHLXDrtfiQvVpwQHY4pgmNGVZSECGSvMcpUwROFYPdM=;
 b=ARXiugtm7pkeTBUfUENMo6Razg9AaieidCWncC7e5uysbETISSOtdtIAxED18+82ik
 0kNeTcwYWjwFnIAw9FPas4KaONC3GFjawyldtlbwCDnxXgpOKX6ECm0yr6H8Sgq0MBuI
 ZTYhbdR2QT52srLoxWTFirm0ZU2I3YCOa9CqP15TDcLExKErjbve9zbCcF0aUmXTkaJd
 18qmPOtXtIM6i/IrT0epaK1efl9teiOk+4kImzTymvxT2Y+K2gJSD1lLPtyMaNNHZNr+
 6MAInSL3xf0rpbQxfv0Vvu7IIwpo1wDnQqImxYJK64KNJP29y4F3Xnvz9d3DcYVxD4CZ
 M2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xHLXDrtfiQvVpwQHY4pgmNGVZSECGSvMcpUwROFYPdM=;
 b=0T7N+zZKuyE1RkVNhg0+sSAKi0KSD3PMy2aunyT8mwAYRDDQ5xTp+rlW+OQ/11f9Ji
 Wm5jWD7LJ33B6vab8WpbXEcZrCwIIsoZnJ+MeprA6w6R4Myc5ChOFqkyEdiovuzz8Cwx
 sNjM0+tc8BjgNhd5Sqe22q1o6adi+U9aOpdPTYqTJk1bM+EhjqTPUxkjjDd9h3re7z1C
 Vhg1oOS9mwgM8WziMr9IA2cTXtsS8pBkjC3KQpN7J9+oP+e8X9JNUN0ee+Zty2PKTSV5
 fGU/EeSprg3f8aA+NKbzYI3TYB+cbZIgLqC7BR58MNBPhg1SS/VzW+1Dm1COgq1nsGvp
 49hg==
X-Gm-Message-State: AO0yUKXVEjIWKV8FqrahcyUSunBZjruRFYLTgpnUtFcuk8dcmWFaaB5Z
 l3DS1/OCNQc46ombJE9El2c=
X-Google-Smtp-Source: AK7set/1yFozLOsv+25fYOgYG/38fiH/b8bgY2Nl4XNec1M14iAJ6hR9Mm5+sBBOzJbOGrTaGLIk7g==
X-Received: by 2002:a17:906:7e55:b0:88f:9c29:d232 with SMTP id
 z21-20020a1709067e5500b0088f9c29d232mr2279323ejr.57.1676468504744; 
 Wed, 15 Feb 2023 05:41:44 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 t4-20020a1709060c4400b008b14399b74fsm876703ejf.201.2023.02.15.05.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 05:41:44 -0800 (PST)
Date: Wed, 15 Feb 2023 15:41:23 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document expectations for GETFB2 handles
Message-ID: <20230215154123.3f9fefce@eldfell>
In-Reply-To: <20230215124152.101548-1-contact@emersion.fr>
References: <20230215124152.101548-1-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qDkw/V/wS.ZJliQo6FDZ+pX";
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/qDkw/V/wS.ZJliQo6FDZ+pX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 15 Feb 2023 12:42:00 +0000
Simon Ser <contact@emersion.fr> wrote:

> There are two important details missing from the docs:
>=20
> - If the memory object backing the FB already has a GEM handle,
>   it's not re-used, a new one is generated.
> - Aliased planes will return the same GEM handle.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  include/uapi/drm/drm.h | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 642808520d92..4cb956a52aee 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1104,8 +1104,13 @@ extern "C" {
>   * struct as the output.
>   *
>   * If the client is DRM master or has &CAP_SYS_ADMIN, &drm_mode_fb_cmd2.=
handles
> - * will be filled with GEM buffer handles. Planes are valid until one ha=
s a
> - * zero handle -- this can be used to compute the number of planes.
> + * will be filled with GEM buffer handles. Fresh new GEM handles are alw=
ays
> + * returned, even if another GEM handle referring to the same memory obj=
ect
> + * already exists on the DRM file description. The caller is responsible=
 for
> + * removing the new handles, e.g. via the &DRM_IOCTL_GEM_CLOSE IOCTL. Th=
e same
> + * new handle will be returned for multiple planes in case they use the =
same
> + * memory object. Planes are valid until one has a zero handle -- this c=
an be
> + * used to compute the number of planes.
>   *
>   * Otherwise, &drm_mode_fb_cmd2.handles will be zeroed and planes are va=
lid
>   * until one has a zero &drm_mode_fb_cmd2.pitches.

It is well-written, clear, and a surprise to me.

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

I didn't know it was at all possible to have different GEM handles
pointing to the same object. DMABUF import is guaranteed to return the
existing GEM handle, right? Why is GETFB2 different? Why does it not
have the same problem as what forced DMABUF import to return existing
handles?


Thanks,
pq

--Sig_/qDkw/V/wS.ZJliQo6FDZ+pX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPs4QMACgkQI1/ltBGq
qqdREA//VkhuJpT5U91ldMo8M+5MYTHueyIdaeYlkJhJJKsRxnVkNV0Z9/QlR54e
eN2vo/s6BBvG/eEfkObQokorm0DFgMOSMKx0X6u5ITHUW/eTmjjRCf+DJr8MA9sA
7dYkkBCmRGdpX9ebsol7bh6KhgvG4CsWlMrOz8hQfNfCENAurHylL24JdsbWYT59
1IJRCTyKp7UPeV/zwTUgzAmpQ2+KLYXDLDjN85uHTPxQhgLgQAeqm1lpYUzewrVh
moix5Iz3T/Mc4MRdIDDpST/jG7hkAHTsMrvMFGL+pr2Vuowv8/h18ap9PAzEkXf8
r2td0IrJ9qnec+ObSNVCvc0XoS/8RVoPvtVkgXm+iUorZtmpLnBjgBILVlpY0u31
AKfky+VTGSGV3mZoz+qfm/p9yagYViYjfaGgHx/Vg70onp6EddiwD28jnY2rjXeh
px1Pw9/kaj3igwrE8u1P9t/mZ/fR6ul598VmKQG4nczvpyapmwmB529iLTND+ilw
0q8/9o2CLlSWOIB0kurKJVJ1kci9slFE/Y7dMjmT9GuQBpTGYOq31fH3FxjMIaZh
geIT54f8uf4Kd08S/P8JANnAIzxthnUgTvd+dRp66lmXNRDmNYrojhCXhugenVJH
yi5/i+L5cT0kB5LgrrlTm3IFP9WS5Mjc/TCOUavQfeMPWtFONbM=
=3A3K
-----END PGP SIGNATURE-----

--Sig_/qDkw/V/wS.ZJliQo6FDZ+pX--
