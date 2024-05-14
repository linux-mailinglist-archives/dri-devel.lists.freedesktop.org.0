Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0658C59AA
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 18:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF8A10E3D5;
	Tue, 14 May 2024 16:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="afb4nh6K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52AF110E3D5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 16:22:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 08C6B6126C;
 Tue, 14 May 2024 16:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE41C2BD10;
 Tue, 14 May 2024 16:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715703724;
 bh=IZFkvJvbgIHEjxhIM81KkL7BVlhpWpSB8wfcs7pwyfc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=afb4nh6KH7MCpd0c5b1pGIYCVx4ZMQGOnrZozF1kR/cSPG4F40M3yvyXlbUPAoZbJ
 9WsrjyB0DodVpK6zsPPJdZ028UuJr1HD4NewpKJjtrODKcy7WVz2tELrAYc+//fHdO
 gHGeKF9wrp9s1kZ5E1sq6gT2YA2KGvFu9ZMt7EMjIyGnzRaksgYDz97I72j69n9Mn9
 9ndiJNz9PEE3dkWKGjxUtozFtWKdpv2DuOul4rBd6NqKEmDwu1MaeyK6Etb4HNBThZ
 tm6lcr0nqvg4UAhi8iPZyw9hPZEyrkKCX9U4ySeSh7afDrOroky/+98slqxKXiC2YZ
 KQAssQSwxzmcA==
Date: Tue, 14 May 2024 18:22:01 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/bridge: Add 'struct device *' field to the
 drm_bridge structure
Message-ID: <20240514-scarlet-corgi-of-efficiency-faf2bb@penduick>
References: <20240514154045.309925-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="dgblqp33k4x2lbe7"
Content-Disposition: inline
In-Reply-To: <20240514154045.309925-1-sui.jingfeng@linux.dev>
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


--dgblqp33k4x2lbe7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, May 14, 2024 at 11:40:43PM +0800, Sui Jingfeng wrote:
> Because a lot of implementations has already added it into their drived
> class, promote it into drm_bridge core may benifits a lot. drm bridge is
> a driver, it should know the underlying hardware entity.

Is there some actual benefits, or is it theoretical at this point?

Maxime

--dgblqp33k4x2lbe7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZkOPpAAKCRAnX84Zoj2+
djLpAYCd28PWUhDWrhqkqi6BHUk9bT+cXJcAbMjeLgzcYs5NLe68uc4CGgzJJOpX
1OT5hikBfjD+kofCGPbLiRyVYR3LmtorahIMfw7JgdLmMERa3yPgYuEi33wzdVG7
H1XdJkSB4w==
=J0+X
-----END PGP SIGNATURE-----

--dgblqp33k4x2lbe7--
