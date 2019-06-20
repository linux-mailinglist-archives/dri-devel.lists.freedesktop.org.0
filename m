Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1394CA42
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 11:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0FE6E55D;
	Thu, 20 Jun 2019 09:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3F16E55D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 09:07:23 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f17so2323911wme.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 02:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BMLC0UjeVndE6cwUWtdBVuBJxQ2ZnMRhYWK+s7JXyLM=;
 b=NYwE+ZNHTtfewHxIpBhM6yVWxwOShLCSny50qqhja6E3t3bEgYNzEajygV5eGyzhuB
 N0Dlw6/1XgRqJ4ijRtrx1eifVRkT7w2ZG2kHGpJT2eBNUpijBRanSen13UfR6hkKA204
 fkhBSOeED0nMPfQmG3GXSNyetQuRhkYAkTBgjk02Is6QqHlyDohBQ3ZbbPzfsPu1gvrE
 iz0La2xh/dZSdd8D1b42KNpX+vZ8hKu4R6OsQ3TwrWkNpuIAHzw7VKayDnOo29gTk7l7
 H4AXg2WtwfhRd8w5dBcnKCrKv9mEa8Qu0zgCnzWESfo4+wjEYvUsLW6ENuI9MrbGgWqz
 /CbA==
X-Gm-Message-State: APjAAAV98ZsFFpSWkaXj2wn12Twc0KUfDKUsNfZMQ/a3Dvz7XRy3jiFf
 2Hy3wGj4ZHGzqOLgkfeagIY=
X-Google-Smtp-Source: APXvYqxPbf9Xd5arqQa1kZ0i/rECTVCH6BEUdMPQonyjrf/B5lGzLobyPIlNoNB1lm5COCbm9zZn0w==
X-Received: by 2002:a1c:630a:: with SMTP id x10mr2044678wmb.113.1561021642104; 
 Thu, 20 Jun 2019 02:07:22 -0700 (PDT)
Received: from localhost (p2E5BEF36.dip0.t-ipconnect.de. [46.91.239.54])
 by smtp.gmail.com with ESMTPSA id b2sm26630918wrp.72.2019.06.20.02.07.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 02:07:21 -0700 (PDT)
Date: Thu, 20 Jun 2019 11:07:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 4/4] dt-bindings: display: Convert innolux, ee101ia-01
 panel to DT schema
Message-ID: <20190620090720.GE26689@ulmo>
References: <20190619215156.27795-1-robh@kernel.org>
 <20190619215156.27795-4-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20190619215156.27795-4-robh@kernel.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BMLC0UjeVndE6cwUWtdBVuBJxQ2ZnMRhYWK+s7JXyLM=;
 b=NqToZ/ZSVmmCTY4A/gk7pQCnUSpLKfJazYKltxEIZq3TKVMZxYziIJWKH1ad5J+8X6
 KRSxvfuf7M4Z0xI36IybU82GFicEn+CharNpV214AZQEgPCI0f5CuQQoir3B18ZDP2bv
 qSJoLyneMJLJMhQOYb/c+wquZX60y0eiz/ppIcy5hu7WSQA9YK/0cSIYh+qH9CR6ti5W
 aGLPUFMl/c/9N8cSClmiX+7ED6rvzQF6PUhp4HQ5qsFLo7gdOliRYknqQpeTHC5D6Z8y
 tH2tFLXAfvLKK9ufbG/EBjP+0dfAkH1F82kZu3KwTrXP29MhHZ87jptowjI9fY+q45V/
 6yig==
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
Cc: devicetree@vger.kernel.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1609426792=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1609426792==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2qXFWqzzG3v1+95a"
Content-Disposition: inline


--2qXFWqzzG3v1+95a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2019 at 03:51:56PM -0600, Rob Herring wrote:
> Convert the innolux,ee101ia-01 LVDS panel binding to DT schema.
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/panel/innolux,ee101ia-01d.txt     |  7 -------
>  .../display/panel/innolux,ee101ia-01d.yaml    | 21 +++++++++++++++++++
>  2 files changed, 21 insertions(+), 7 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/innol=
ux,ee101ia-01d.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/innol=
ux,ee101ia-01d.yaml

Acked-by: Thierry Reding <treding@nvidia.com>

--2qXFWqzzG3v1+95a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl0LTMgACgkQ3SOs138+
s6HTnA//XpMRpvIzlsj6bjRvDhdgl8TvPHw+KHstPrkShJJAVgRtW2KVQLdY5nTm
24C05Hn72m0VpcFpczml93ye6xWbctMc2fTEVXEEoA9sSi3n0MPPP07qoun+aDHk
gA+NM90RqQVW68KAckevmejVJxzhlN8IsmvLuZLxx4x2EcbEqFO5z9yt199zvItU
M41Xi2lWdLvDJplQHd5kKPYPHVYxyXNVd5mZA/LbFbWjVxp3RpcHOGDSIwLchLIP
exole/KJ1H7RECQyShMq1FRkL8I7cxQKF39b1SA8qY0zsUo+t49247jZrCJgkU8u
dvIRdNsT4mEVpIAuPIUTLeRxZigihvqbz2Ay00C6eGU7iL8HQX97dQKhn1/MImxe
ck662ma0pZHNNgCkcN3Bf+4fxvHVsBt1a2X3V0MM3cDLc8Bu0TiIuIpH3H9Bh44h
PbQzzH+1052oizKdXIiFtmoyGfJpZ5jHRuNQGbzE4ykAy6lb7uey8epWmDql9B14
kBUOHgAOdF+LKKZZMH02p5ISXGMAJ4Pe6HoHL/ox5DfosyMUnUGRIflYpUenliZe
Mgwr3ThVkTKeLwOpyhQdMvJStL1I3WafYH9vGYDgju0Vqn9jLCrf9+GonIj8NKVV
vsn6jEkuy9AQi56DWl3YRFUyv8J8lJyIHkcTWYxGe60cYnkbQeU=
=wPVf
-----END PGP SIGNATURE-----

--2qXFWqzzG3v1+95a--

--===============1609426792==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1609426792==--
