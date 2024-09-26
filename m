Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8E89874C4
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0B1510EB4F;
	Thu, 26 Sep 2024 13:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D7vBlLzU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33EA510EB4F
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 13:51:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 881265C5ADD;
 Thu, 26 Sep 2024 13:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8307C4CEC5;
 Thu, 26 Sep 2024 13:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727358672;
 bh=seGa3YZuIkcZ518ZOugBJdFhUkXxCVj713OsNnonW6s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D7vBlLzUGJ7m76bzW9jjYrDiuvb3IvSzK8oUcPBXsSVmfdZ8QQtU/YkTxO8ArtmZY
 V79Z8AXkcvg3CAOSlpqIZEiwGDPjgehno4MArS3RhVdoX0c6V8ReRn3bBIpnx6i9Xl
 /f2udLS8kAd8AYMEgBYW41wZR7GT4v/jccuPHhBYkj2kv0kYddbEN9bvl9sPm3CY/V
 fNr5tVnjdJTFkVWFx4pA8EfzqHL8gqUb0uqfODaAOZResjvOLYSQVzrBA/H0c/S35t
 Cuo7fr1x3sX+nBH622TSc/kypjgf7fqlcFaXSaaccI2OTpt/rWuNJhywhijze16Zbf
 Ky+/Re3hbenZA==
Date: Thu, 26 Sep 2024 15:51:09 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Andi Kleen <ak@linux.intel.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm: Print bad EDID notices only once
Message-ID: <20240926-jumping-garrulous-tarsier-9dc7e8@houat>
References: <20240926133253.2623342-1-ak@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="oiypsfwtgmha5rcp"
Content-Disposition: inline
In-Reply-To: <20240926133253.2623342-1-ak@linux.intel.com>
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


--oiypsfwtgmha5rcp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 26, 2024 at 06:32:53AM GMT, Andi Kleen wrote:
> I have an old monitor that reports a zero EDID block, which results in a
> warning message. This happens on every screen save cycle, and maybe in
> some other situations, and over time the whole kernel log gets filled
> with these redundant messages. Printing it only once should be
> sufficient.
>=20
> Mark all the bad EDID notices as _once.

Is it?

I mean, it probably is if you connect and reconnect the same display,
but if it's two different then the second definitely has value.

Maxime

--oiypsfwtgmha5rcp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvVmyQAKCRAnX84Zoj2+
dtqFAYCZb3aWkEei3H7AqvGX21ULFokxMHu0ORGE9PBjjffWrIQw8RtwG69k7jbI
YF/EpaMBgOPIP9xHAheoGYZX8SXs/qxCkJ9w/tOgs9sk4jgWCv6QeDkArvh03+LA
kk2nBbuScg==
=tjDx
-----END PGP SIGNATURE-----

--oiypsfwtgmha5rcp--
