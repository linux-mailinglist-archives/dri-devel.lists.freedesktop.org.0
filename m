Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A4C582A2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 14:31:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BDBF6E1E2;
	Thu, 27 Jun 2019 12:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B941C6E1E2;
 Thu, 27 Jun 2019 12:31:25 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a15so5554276wmj.5;
 Thu, 27 Jun 2019 05:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QNmDaWnkPZ3V5JoWMkua5wmj/dzieumr1ok4M0VSwz0=;
 b=SmWB48oKlFb5bPPb6LwpNu5kURGV7xJ1ac4iaohWkikHJJgPeLkWVOnzOnfYXrfxiC
 JgP4Y+T7jX6Myj6QSm1Ld8nzg7xbadpLAQVCaQYTRtaz8cTtgNwEe0yoRWl2yPywZD9f
 yNsteSzfkD9ecf0XPfmPJPpd+lGxMTxpUy7pC6i7mlHCXRTk/+nRF0R6sHLtQqegllJS
 djGUA88ELvcMEg/Xl77koRTt9FkD/Cg2RfLa6LH1UE4aakglguCon/sKlkdfCB0HAoAD
 GbzFx4+HoDdhIkbpG/H4jUrXSPubHzyGUMDJb+4SavSea097KsgCNiAhz6ZI0YqKmO5T
 zcVQ==
X-Gm-Message-State: APjAAAWN6vxvOKY9BjyH68vDldW5pZ990YAfU8w4PTI7ePGed/Zf4miz
 V0AtYr+/IG2/2R+p52mtims=
X-Google-Smtp-Source: APXvYqyeO1ELccwuyYIf3iZoexRechiZ6xW1JLeTzpV9aC59RkVTKHBp1NAA8puma89XWcJakxt0Fg==
X-Received: by 2002:a1c:bbc1:: with SMTP id l184mr3018950wmf.111.1561638684311; 
 Thu, 27 Jun 2019 05:31:24 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id n14sm5022701wra.75.2019.06.27.05.31.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 05:31:23 -0700 (PDT)
Date: Thu, 27 Jun 2019 14:31:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/panel: make drm_panel.h self-contained
Message-ID: <20190627123122.GC21242@ulmo>
References: <20190627110103.7539-1-jani.nikula@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190627110103.7539-1-jani.nikula@intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QNmDaWnkPZ3V5JoWMkua5wmj/dzieumr1ok4M0VSwz0=;
 b=d387Q6hHUtV64fSDSFSwDZ0pVtntH4afwuWrGJ6jYHTIVnPa9rZE9L/Yqi+X/2wtQa
 qh0WgjEwKxWEOiQvrKY0HHa7xemS+GSJis5ZwtqAIG7kmArTkHTp8krgqGL30m4Tw3uE
 0CljSk8/BgRwx2pxLb0bZGmSErIkyA4mnc4xfW5FAHTRL5w2g/ewllFiar3iBiHMqaJb
 KN1BN7q4JAEQ5nPYYLoUtElqrcXZsK6MFkx4SvG5zUJx6Xz8YBIrJnt+qDK7H16YHQOf
 50Te11MTbnaZWa1uMetuO5OXbTta3ounNDxMmPwhSblY55Wbyf+csonC6WdJ11k00fmM
 YIsg==
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 intel-gfx@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1403815796=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1403815796==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wxDdMuZNg1r63Hyj"
Content-Disposition: inline


--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2019 at 02:01:03PM +0300, Jani Nikula wrote:
> Fix build warning if drm_panel.h is built with CONFIG_OF=3Dn or
> CONFIG_DRM_PANEL=3Dn and included without the prerequisite err.h:
>=20
> ./include/drm/drm_panel.h: In function =E2=80=98of_drm_find_panel=E2=80=
=99:
> ./include/drm/drm_panel.h:203:9: error: implicit declaration of function =
=E2=80=98ERR_PTR=E2=80=99 [-Werror=3Dimplicit-function-declaration]
>   return ERR_PTR(-ENODEV);
>          ^~~~~~~
> ./include/drm/drm_panel.h:203:9: error: returning =E2=80=98int=E2=80=99 f=
rom a function with return type =E2=80=98struct drm_panel *=E2=80=99 makes =
pointer from integer without a cast [-Werror=3Dint-conversion]
>   return ERR_PTR(-ENODEV);
>          ^~~~~~~~~~~~~~~~
>=20
> Fixes: 5fa8e4a22182 ("drm/panel: Make of_drm_find_panel() return an ERR_P=
TR() instead of NULL")
> Cc: Boris Brezillon <boris.brezillon@bootlin.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>=20
> ---
>=20
> I don't know if there's a combo where this actually fails, so I'm not
> adding cc: stable. It's just something I hit when playing with other
> code.
> ---
>  include/drm/drm_panel.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0UtxYACgkQ3SOs138+
s6H5iBAAwUCyHu2PzWK1XZYphwP0keEicqHmUiJG1ofO8Yk70N9ZL2JQaoG3ckr2
GgVrPExJvFJCvgLhbIYHc2uzqCYEkKGJV45mo79wf16C8jg9BLCacRUpHSvYFiUo
S+09uDDqQYvW2N2KGokjC2ln8W5g+2tVLMYuSEIyrHk1c2+gdvZfG/y2h7F7q2Jc
aprcq91AJMi4YbZCSh0z26TrHsk6FXhIETiWqLJzv5gg6t5vhuszv506zBb2+ptG
T69xr0Saw8lTWNhi/hDdjdKXNq00tg/8z2Y8PRS6AVolPLWZW7c9981DJtt5Wkxo
GQcRzrYNUjwbGMEvxdKvhEdY5cxyZcijzd+iTvI8DGpCAJAGUiZjYeBFOi55TeAj
173yxt+zICRgiCRpJyl0mAsOmTJhZR23nXqQ2z9dbJs7sHTTREhTPxsGs6c++JoJ
vuQVlAy1Buru7jx18jGx+JQBRycqXHbuHMS9Jiq22iRarlkalw4iGJEatksr3mDV
Guj+mj/madvI7hE+WVmZHohtCj6mAatJjnliptVxf1gzACG6MwagAx5K5VUckDgh
fFpvQ0Fc6WyjUYXcGH7fZWmr1vjmeIIwtDnTW+1uaYGxqloM9lpxam/eyRfpYE8C
g/xKnDXCfQ9co0vh9Go1Ks8nV8zXp0jhfnaSmFlLfcIO3d95xw0=
=eZKc
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--

--===============1403815796==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1403815796==--
