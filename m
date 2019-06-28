Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D825A7C9
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jun 2019 01:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD386E98F;
	Fri, 28 Jun 2019 23:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8C16E98F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 23:50:59 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g135so10578220wme.4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 16:50:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E/8G2PjZazjY+3koArK1GNsdz2h0E+2RlYWcCl/197M=;
 b=th/QNJi0vbCzpb7bU+3tbE6mLLuULQf9NqDw+r3ARka+lIHGR9/xqSu506r6pRi4eh
 GRNmf004kc91+BhsyKtZoHuPAEfpsePHkWsBK8A9mKgxCyTk148TN8y/tQ/bGZXnmvPC
 WFz29jXJqRNfQrLaSm052yO+jJW+S+oXfGs7v5HTYDXKV6DLsMmyE0URLgi27Tt2+XBJ
 3AM2edSRDx+5kc1ZDupoz3l7sl7rczuqF1bhkwAMyLRbm1VggX8lBcElX+m2XOZVIYaa
 KbvBCjYcqxVZpK0ItW+LGc1zAuY2ApWrR6JI2G3orTkUkfqcDg2cojul+ex0NKnuPK8u
 ABaA==
X-Gm-Message-State: APjAAAWYZdE+jtUPs9p6n5vlQXdM2W3Oaz3Ocb7BQNgfn1h0SbJnqaVc
 Rdlz/XpVouRnIV7+IrNvN/A=
X-Google-Smtp-Source: APXvYqwwYIGX0BKFhNZzNRBY6/lBKez08qsNZRlKhSbmT7GM7lr64gjllaB0S3ROfyfooX0EEFWCOg==
X-Received: by 2002:a1c:9ac9:: with SMTP id c192mr9275089wme.0.1561765858237; 
 Fri, 28 Jun 2019 16:50:58 -0700 (PDT)
Received: from localhost
 (p200300E41F2AB200021F3CFFFE37B91B.dip0.t-ipconnect.de.
 [2003:e4:1f2a:b200:21f:3cff:fe37:b91b])
 by smtp.gmail.com with ESMTPSA id t14sm3634009wrr.33.2019.06.28.16.50.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 16:50:57 -0700 (PDT)
Date: Sat, 29 Jun 2019 01:50:56 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 5/7] drm/panel: simple: Use display_timing for AUO
 b101ean01
Message-ID: <20190628235056.GD1189@mithrandir>
References: <20190401171724.215780-1-dianders@chromium.org>
 <20190401171724.215780-6-dianders@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20190401171724.215780-6-dianders@chromium.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=E/8G2PjZazjY+3koArK1GNsdz2h0E+2RlYWcCl/197M=;
 b=O3DDTJZYIWWPfnAp3HyoJ+2BKJJYwV9YAcHXhNbab8OkXYmj7TCDn6L1ciJ5mH1KO2
 xHOPWC7xq8XznaLHUGH79kWjTEul8jEn7/tJpqaFaRNmyDHm3Jkly+sfvdNAt+0SJC+c
 vIKNnCau9BWNg8JNN5Z5Hd4/aTnl00+f74nhzJSJ7Mrzw3lNFTsw+zvGB7Boe6M2PKzX
 y6wyI6YsWiJAO8E+8XyelBuZkOklteNg6eBGOUyP2bbZIb5FeZ6LQpQMQIb8nnywub2k
 EatzrG99+rp2SHBrvEFe5kCeu6Lrz0T+8z2fIkHTmPp6Vq+5hNQUVqFhjW/cwapYHIwV
 FC7Q==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Enric =?utf-8?B?QmFsbGV0YsOy?= <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Ezequiel Garcia <ezequiel@collabora.com>,
 mka@chromium.org
Content-Type: multipart/mixed; boundary="===============0841661774=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0841661774==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="llIrKcgUOe3dCx0c"
Content-Disposition: inline


--llIrKcgUOe3dCx0c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2019 at 10:17:22AM -0700, Douglas Anderson wrote:
> Convert the AUO b101ean01 from using a fixed mode to specifying a
> display timing with min/typ/max values.
>=20
> The AUO b101ean01's datasheet says:
> * Vertical blanking min is 12
> * Horizontal blanking min is 60
> * Pixel clock is between 65.3 MHz and 75 MHz
>=20
> The goal here is to be able to specify the proper timing in device
> tree to use on rk3288-veyron-minnie to match what the downstream
> kernel is using so that it can used the fixed PLL.
>=20
> Changes in v4:
>  - display_timing for AUO b101ean01 new for v4.
>=20
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>=20
>  drivers/gpu/drm/panel/panel-simple.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)

Acked-by: Thierry Reding <thierry.reding@gmail.com>

--llIrKcgUOe3dCx0c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0Wp+AACgkQ3SOs138+
s6EvcQ//Tbw0f5ozO/fe70CrFitDkI3rMEe8H/oX9vrS8glGIG4EjzpDwgvGTK2Q
D/DP0Y3lmDH7qbvuGkMI2PEOqpraUK6utBFaN1SFu5ZtnSHi44GsqRP8y8lnaRNi
1qsxORATUYK+CpxTPW0/YMCDse/fXHGoMAV7yN4Ml4ufhYL/08XR95rEc/doFZyc
QcERscJUhv5lMegiv+y+aCmRqnvkHWvWonxhE6yCzh54KnfpJeUNI3A2zsZMTw0W
/HUt0DEu2qi9OkoDOG2YCji4yfGjMLsHG1oLTvSZxDmDUOc7C4k12XV25RswW8if
EpckvCxfI+4/JWuK53ofikg5s172SFvDZTLpgMM1M94R/36fp86pX6phZ+CV2Q4H
vARuHnLEFIgs9J5p33EDhRG5pH4xToEzme7wAaJuSpXv24LdsrMp4ewVm17tJ4Ki
koosRochNUaH85RqSs7H1gi5GqWlONIZCj4hG91IvDYDoHbQNzTFWknx85Yge4hG
K8tKn5JpKJg9kKsQQuQbHXO9ziJDta1lmrhykCv8dYENNncEwpK3vwrZaOEmweqQ
w5GZyH7U/gXwhUaSNPeTefo6jZH6185HouIBfPj+BQ0ZKgzSnYN9yEgYxcpWHnaw
4jM6jsv4tpohTfiGOXlbQU5Poz23azF0Q7Jl8Cm7KSgit41OMzY=
=5nXl
-----END PGP SIGNATURE-----

--llIrKcgUOe3dCx0c--

--===============0841661774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0841661774==--
