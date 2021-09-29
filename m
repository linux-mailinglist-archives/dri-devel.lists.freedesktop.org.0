Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1D941C530
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 15:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F376E1B7;
	Wed, 29 Sep 2021 13:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DFD66E1B7
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 13:07:14 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x27so10558647lfu.5
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 06:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=bGeQ7y2svFE0Lj3Jnuht4oAdkemf+UUM5TRE8QHDIKc=;
 b=n2s4e587abBogP87qa4R4eujv0kGi17KZ2c/hCHtnxr7CJc6lfYCf40aEJNCrrLUkj
 i9XUiCIL49/jcvU6kveH//YC/hm41qS/kXz76iUcoiF1Sm+1yw4VrlTlwvpTXLqJ6XW8
 uGIxMbgvPwN60oaKq6nhK3PmrIO+DcIuJ1W4x7i0D6yW67f0miZqag5DSmKT7Rwaj05j
 85cUTW8OzZV9fLEgHUtuqKv2CcWWq413BWkZGZWmb3mnqXPSRHHplX9Q3hJb28qBXY+U
 XiDYBABKSRBhVwvFCp+3DO3CYbMSQtcHAmgDK1cZzFhWU6IJOyrjcr+mv8fXwX5Bfni7
 61aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=bGeQ7y2svFE0Lj3Jnuht4oAdkemf+UUM5TRE8QHDIKc=;
 b=yvjV8lty8AuNDvDuPcUBqYBSti3tXzlGypD65WnMPpASfdoEH0yyxRRjap6hWr8N1T
 n25Cnd0UqkyMViR7MmwFLYJhxfRfZdEuz/se/mKWQXTqQeyZDzO06u99aiC6ARmCbXQC
 He7s6RK+GJnjmEWSoLa8My0SnFA/YlVCj7K8eV7mYwgQrleGO/iK0r6aroEawsCqw4Vs
 UthnG337jxTdftkO4vgqpURhmSzpjhzK8IGPzyNgvHySxe35yFdGzueb++/kTJ9Uxplz
 kPk6wtnd0pJrIFVcGErtjORfngK8sd2yt4uIrpgFLJaEAegScPJoiSWLxvF+locduM22
 8hPA==
X-Gm-Message-State: AOAM532UBmLJZoUqtS1MGUaBHdfE15/L6MmRDsUwB6V/9+DZEWUqMCfP
 0Q8owlDswl18EAbagpfM+VY=
X-Google-Smtp-Source: ABdhPJwkyCzC6bAOv8B7+A2Gh17nVH9PNHxjUaYxzJtVuk8Be8Tz2GrejSiwORI9PiaRqF3k4HrF0w==
X-Received: by 2002:a05:6512:1154:: with SMTP id
 m20mr11229959lfg.382.1632920832305; 
 Wed, 29 Sep 2021 06:07:12 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id t11sm239410lfr.281.2021.09.29.06.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:07:12 -0700 (PDT)
Date: Wed, 29 Sep 2021 16:07:01 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: document pre-multiplied assumptions
Message-ID: <20210929160701.2bf6d8c9@eldfell>
In-Reply-To: <20210929095357.49984-1-contact@emersion.fr>
References: <20210929095357.49984-1-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wW5JC6pQYAWdxAjDwRYg+_y";
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

--Sig_/wW5JC6pQYAWdxAjDwRYg+_y
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 29 Sep 2021 09:54:14 +0000
Simon Ser <contact@emersion.fr> wrote:

> When a plane is missing the "alpha blend mode" property, KMS drivers
> will use the pre-multiplied mode.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  drivers/gpu/drm/drm_blend.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index ec37cbfabb50..eebb32ba84d7 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -185,6 +185,9 @@
>   *		 plane does not expose the "alpha" property, then this is
>   *		 assumed to be 1.0
>   *
> + *	When a plane is missing this property, the plane uses the
> + *	"Pre-multiplied" equation.
> + *
>   * Note that all the property extensions described here apply either to =
the
>   * plane or the CRTC (e.g. for the background color, which currently is =
not
>   * exposed and assumed to be black).

Hi Simon,

thank you! :-D

I have no idea if that's correct though, but also nothing against it,
and it does help with what I ranted about in
https://lists.freedesktop.org/archives/wayland-devel/2021-September/041993.=
html
so is it appropriate to offer my

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

?


Thanks,
pq

--Sig_/wW5JC6pQYAWdxAjDwRYg+_y
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFUZPUACgkQI1/ltBGq
qqdZ5g//bgFGuWgM8jMjxNh4ePyLT14vXT3o2mkLLJsrCow8TxNnKrRpZX/NusJP
K/qzqxk/eZEVPUvBUVu6B7CJm7SReBSDkB7gt4U2YBa+LoqEfXWxC8xqUYt8B4IA
Aqb1YRdqtUp9fslDJEzOTgZQzfjMybQnDp0DLAo1HmB0UKd/aElIBUQ2gAGN3/Dl
GBIWaTZvYRVjSFX+4j584DKTwQjLZrtLIsA/0rbvxznXXAqnXg7jVcZ6Ql6Gu/dK
jbPWinMJbnm3vVHtuISzhPqMcopZ2oar5qqtSHc+2b8VOYU2doK8ajk1rGY/fszZ
PiZPieaymq3WoqVeoSv2KfkTuiD+aKzVzzbyuxHNrVE+bRdE4Az/Nvg43CbgD4yX
XaWAj/LulcJJ4JrGkKxeYZNlXG9Y6RVsRAh00XPHGYeou6+VjScEx+S2qskDOpgZ
kaOsFA7Th27bolpjakO8C8Hl4ot5S7WXSUrJ/4yXivUKmoahUzvcAEvN5uPf+7k3
1R/VqvMr60WweNvL9yzgDBGFB7Lwox+AiSEHKXAujpMKShNQTqJa5V0HwdbKkJU2
cf3SHoH4YDl2EkyL1w4mliHGWlhKvVNAwiTFIOG0D+Hm2kjMkqA+DOYuCclHtVUy
Z5/ZWGmeS/7JPPs7OSboW1Yic5+opu7bF9ZQYv4HzbYNK1EuIkQ=
=FoLB
-----END PGP SIGNATURE-----

--Sig_/wW5JC6pQYAWdxAjDwRYg+_y--
