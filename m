Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7644F9BA85E
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 22:45:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A140710E137;
	Sun,  3 Nov 2024 21:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="B96YJmKu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE7A10E137
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2024 21:45:25 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-a9abe139088so547249866b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Nov 2024 13:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730670324; x=1731275124;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fDsVfxWSxibgwiHWXvp5TfhRKUZTk8C7MEMbs4lIB8I=;
 b=B96YJmKutaIJS1naASK8TOTvCxnrj+wZ6Uh3THHOsSxQWurVh6CqHbpV4o1X7Xmmt/
 HF+f4JCgxbMq9CtJmlnzAJy438LJeHAddW3RBjlknQuPh5UPdqGeXw/yBl+6cv3EJP/v
 Bv4AMumxO8HQHHAF8E4vSeLaBhG+KfFPy5tJm5D/hZ4W8/e9ESFFKgU6DpMvXy4JkwQg
 H2ghNK9qGzBnv2DdJab27Vi0m9Zi29y+0ohiJi12ILX/dNMGPOmQQghD6bf+kWOf434F
 c/wcSV5K5Vp75vuYrejJgnVI3IkeDkJQ9SrKb/URA0SwySxd/c6Qmd2b4NfnaBdqWpHG
 B7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730670324; x=1731275124;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fDsVfxWSxibgwiHWXvp5TfhRKUZTk8C7MEMbs4lIB8I=;
 b=GRPe88ci9l6p6hnaex8UjXtpwmxogA92/RqYf2d3+B2pFoaPluhX3KAsJwVOySwqSo
 QZChgg8/xRxTRZDnAgX4eYz5VEvxLGs8YO768tCdtrmA6HOPZWwqNwRMSHzPeHwK0c/n
 fB2BApWtabkYgBjPtSd8S9uMRAe3hN8kPXD/g6e6nWnN7aEQRy7RFLFetjJv5oOsEBgR
 zgcw5Sx45z8lSjvGnKbwC2BGdYhqurnmKl6vZbCQRCqxL4ITgYYIw/Q4b7YPfYSkmNrQ
 LWHRdufhJmU41a8zvuKOcVOZtpEpuRYcWsp0eirPmrap9DIVL1xx3QQPqyE/b8prhjRN
 wftw==
X-Gm-Message-State: AOJu0Yy3PpSld0mPejUkafYu0z38kpAwjDUJGFDTVGqhUPjEKDmRQNvb
 RERzS9tV239tJh7XemeYIndp4B4PydxZzNaP6FVrHfbTUULVf4uEEPFRKwxlgrU=
X-Google-Smtp-Source: AGHT+IHlq+5WaJNNnC3cSuVu1fMq+NoF5PXvOYg3gK86bS3bh+XJomuMCK7sJs8ucPG4TBf4LSkdVA==
X-Received: by 2002:a17:907:944f:b0:a9a:825:4c39 with SMTP id
 a640c23a62f3a-a9de5d00e3emr3301725266b.20.1730670323622; 
 Sun, 03 Nov 2024 13:45:23 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e5664361fsm476108966b.172.2024.11.03.13.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Nov 2024 13:45:22 -0800 (PST)
Date: Sun, 3 Nov 2024 22:45:19 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: Switch back to struct platform_driver::remove()
Message-ID: <hl6lkazu4xqxb6z5gdrcxopkmx3pihq4uzusuxqikou33id4ks@yqt3vac6z3tw>
References: <20241008084552.461361-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="zd66titzorvif2fu"
Content-Disposition: inline
In-Reply-To: <20241008084552.461361-2-u.kleine-koenig@baylibre.com>
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


--zd66titzorvif2fu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm: Switch back to struct platform_driver::remove()
MIME-Version: 1.0

Hello,

On Tue, Oct 08, 2024 at 10:45:53AM +0200, Uwe Kleine-K=F6nig wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>=20
> Convert all platform drivers below drivers/gpu/drm/ to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>=20
> given the simplicity of the individual changes I do this all in a single
> patch. I you don't agree, please tell and I will happily split it.
>=20
> It's based on Friday's next, feel free to drop changes that result in a
> conflict when you come around to apply this. I'll care for the fallout
> at a later time then. (Having said that, if you use b4 am -3 and git am
> -3, there should be hardly any conflict.)

The patch doesn't apply to next cleanly any more because of some
renaming in drivers/gpu/drm/msm/dp/dp_display.c. Should I send an
updated patch? Who's attention do I need to get this applied? Or should
I split per driver?

Best regards
Uwe

--zd66titzorvif2fu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcn7usACgkQj4D7WH0S
/k5rUggAuHShKRNMaytsIKmT9mMsrrd/bd6fK0JfvLjIBJtIGay2KG3PPqDSOPDr
GqYchfcjWhwIA3n9eN4seS3cTXokDArsptF9FK8XjHdW5F0OEprowb6epaJBEU6G
hq+uKrxtTndT/6PJH9jywc7XhhvHZ5vr9LRD44enA+JEbEWCkUwlc2gJVpI+N0If
z6r5rvPFs98BZxIXMx8ruA6wl3E00wL1fRLW32sxuRi/PW1Mvmzpdz2bIM/q+McR
59xl6zz1ZRKzCu/1UEh5rt3lGBkWLekINPgA/D9uPW4P3rEnkf6OmuG6uPwcwWVT
pAIBu3lB9I2N30FvGH7GCLVRw3JiIQ==
=vpX/
-----END PGP SIGNATURE-----

--zd66titzorvif2fu--
