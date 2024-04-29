Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C011A8B56A1
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 13:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B4FB112BBF;
	Mon, 29 Apr 2024 11:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ckzv3usm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2A1112BBA
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 11:30:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8229ECE0B1F;
 Mon, 29 Apr 2024 11:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 545B7C113CD;
 Mon, 29 Apr 2024 11:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714390227;
 bh=s9la03KAqMZbmHkM+p4tM0f8zTwprOrhAE2ZUhSrgT0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ckzv3usmQnXsMZi87PZnCjE/Nxq7K4+bTiq8vaRhF8+cT5QoYUkxgpxNMihah1YT5
 JnYf8LjFRMDjHR5ntgTQGPe6bfhS2WEwlyJHACA1IXvO9DOypJ49rRlWGrxTGgZ2J/
 wZecRbCGYkGG7NN6VhQlFancLWTC/R5VGLM63d/uczlSjTlD0Y53UHzSHezR0yj7cc
 MpxyZoO25b3331Wi/9RXZci+Vwgg7oEjxlOSWJ48I4xYJL2E+hQoe609OvWvW9rKvp
 P4QLbk/+ZW0Vud7cwH/YTSIJxgjZPLsV0787ZBLNvJ6+2/MgRh4Z78xeFW8iDYSdMv
 It2NBHhzGQXOA==
Date: Mon, 29 Apr 2024 13:30:24 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Sui Jingfeng <suijingfeng@bosc.ac.cn>
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: drm/debugfs: Drop conditionals around of_node pointers
Message-ID: <20240429-enchanted-cooperative-jacamar-cf2902@houat>
References: <20240321222258.1440130-1-sui.jingfeng@linux.dev>
 <caa6fb05-8080-444a-93c3-2d9283ccb74d@bosc.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="3nmuggz3oikoizoh"
Content-Disposition: inline
In-Reply-To: <caa6fb05-8080-444a-93c3-2d9283ccb74d@bosc.ac.cn>
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


--3nmuggz3oikoizoh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 28, 2024 at 04:52:13PM +0800, Sui Jingfeng wrote:
> ping
>=20
> =E5=9C=A8 2024/3/22 06:22, Sui Jingfeng =E5=86=99=E9=81=93:
> > Having conditional around the of_node pointer of the drm_bridge structu=
re
> > turns out to make driver code use ugly #ifdef blocks.

The code being ugly is an opinion, what problem is it causing exactly?

> Drop the conditionals to simplify debugfs.

What does it simplifies?

> >=20
> > Fixes: d8dfccde2709 ("drm/bridge: Drop conditionals around of_node poin=
ters")
> > Signed-off-by: Sui Jingfeng <sui.jingfeng@linux.dev>

Why do we want to backport that patch to stable?

Maxime

--3nmuggz3oikoizoh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZi+EywAKCRAnX84Zoj2+
dvtsAX47pT1uA7b31OvET3HBHTtXyenRfki8jPgwaCBOQV19P4BIYankTKkwNNly
1KoRjAMBgMAjKByVUU852HrG8xSBQ++PQ9em26hkmkBm2QkB0VQoIpSlDN+gEyB9
Fhk/ZF5o0Q==
=B2q0
-----END PGP SIGNATURE-----

--3nmuggz3oikoizoh--
