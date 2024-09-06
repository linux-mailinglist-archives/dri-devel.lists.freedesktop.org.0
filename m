Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7823096F94C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 18:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B9610EA78;
	Fri,  6 Sep 2024 16:29:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RlT02/cq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0F010E975
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 16:29:53 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a868b739cd9so290855566b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 09:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725640191; x=1726244991;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UFAX7TLBdg6mTbGrs2W+S51abCNVZ2uGp7qKd93zHm0=;
 b=RlT02/cqo1jXBx6kzLvG3CUQMULan8FVfAN4BYKnHBG4oY5m8go75vrtmH3kEfYZTm
 uI9J0lO+8CNIUoAyqTSAd2V+yomUmPHtgp/u/A9SYJWpj1Yo+au7wcoEkyqCsXEdcn/F
 hirqFaTdLUmSDBXB4mEYAGdzvDs6zIyuwmTSHZPYb77YvkJSz4uDGyXQCnozryNxvv9o
 O4yzqcV6lR7PC0RSfKIDMRv/pzvdVHXTAGZZkY8ec90dw67Pf3OmkLIreIBd19lRHYQO
 1PtiLlc9q5Q8AAv1JTJk+qpauGSEX8cDma2/8J1dU34TfIVl42IAoMRbju2aDVdeEF7n
 Z8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725640191; x=1726244991;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UFAX7TLBdg6mTbGrs2W+S51abCNVZ2uGp7qKd93zHm0=;
 b=xCycBi/K0VJDqrXp2N8K4sYuGx2ZB4E0iwdvnTuvJSSle0fzMylraG7/7ebx52Duh6
 PGCy02+rNWnpYRTpDOBk/ikpL4K10SqtnBjQTNt6TLk3PyK+tJ5qaVA8PsL58LX0nSYr
 VXlNNeHDYtA28vSQum44EJGaBstabH1gNYn8VCAmCaI7CsZdmR7QU3u7yOdT0+a3tSel
 M21fhnwZRMWZCjtcaVokdPSxrlyww3RdF9WBaA3/gqzxjp5ikFxrRvwj6Cu67aatRjiN
 2kXA38P0mWmD9FKsJT1ftBBLCHb4YROvyXUJyeRsAMA89Om5bmoKICZuv8yG+n2u23lO
 aFUw==
X-Gm-Message-State: AOJu0Yx2+c1k18NSaZVnHcdBigtQNKTpGMpj6HqyYLxTxVBTAWdfY6h4
 c3XDSTaHtgtRWoYOUVnGEOfbcUD7bRdot2VpqPnXR5Fmu2sF7BwC6hEszS2nj0I=
X-Google-Smtp-Source: AGHT+IF4LS9d7XWydGrkl99lvx5rWBPaspGyzWsUYkRal2vYT7E+cmJEaI77A/f+4eJXDF6zNvOhzQ==
X-Received: by 2002:a17:906:6a0d:b0:a8b:5dcf:4961 with SMTP id
 a640c23a62f3a-a8b5dcf5066mr154112666b.67.1725640191207; 
 Fri, 06 Sep 2024 09:29:51 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6236d374sm293638666b.139.2024.09.06.09.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 09:29:50 -0700 (PDT)
Date: Fri, 6 Sep 2024 18:29:49 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel@pengutronix.de
Subject: Re: [PATCH] drm: Drop explicit initialization of struct
 i2c_device_id::driver_data to 0
Message-ID: <g3g5x5iksrx45d7udloiwfuo7kw6dwgiewsg7uv4klz6eb5q2x@y3ddbso6h65j>
References: <20240516123837.81664-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="edzpg5jjhiaw67vg"
Content-Disposition: inline
In-Reply-To: <20240516123837.81664-2-u.kleine-koenig@pengutronix.de>
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


--edzpg5jjhiaw67vg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

hello,

On Thu, May 16, 2024 at 02:38:38PM +0200, Uwe Kleine-K=F6nig wrote:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
>=20
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
>=20
> While add it, also remove commas after the sentinel entries.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I didn't receive any feedback on this one. It still applies on today's
next.

Someone taking a look (or even applying it!) would be great.

Thanks
Uwe

--edzpg5jjhiaw67vg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbbLfoACgkQj4D7WH0S
/k6DlQf/V/sEKyQ0S2H7PU7/UbYZg4jqxT00S8OnihOroT51wJV1Yn/8whwWFBoW
cVjk5/mmZLfyLxA85bmsQcLBFzDoPIodQJzsDPBe3MPuBt7yfiWaQhGghO+JKU7h
hP8LL1q0SCea1H6A/ncBNhdM76LoIqJ424+7cQwd5IPfwASEl6tAT/uIX2K1sgoJ
n4BdMdesOzefr3D57PFbn4pJ5OLXj6ljvljmEzmFeLUZkk/XBeK3zwKrNimOUqno
Ruexq21l+mHFSf1uDnandhXPr+Iugr4jx8XRa9G3NvwJsORj4nKV1J5sXNtSBsOo
uVrHBiMV2raT13fAlXCYTgCwQm0csg==
=IK22
-----END PGP SIGNATURE-----

--edzpg5jjhiaw67vg--
