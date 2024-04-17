Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 744198AAE5A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 14:23:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEB910FE96;
	Fri, 19 Apr 2024 12:23:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iYZQKBRf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C3F10FE96;
 Fri, 19 Apr 2024 12:23:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B1B861997;
 Fri, 19 Apr 2024 12:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7415EC072AA;
 Fri, 19 Apr 2024 12:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713529423;
 bh=ZCuR0hCdw7usB7UJdssbldvEaDtdNOrfZF2hneMEmi0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iYZQKBRfj8cxz0gXb8itwdJ5p77zImwhrch1rdAHA5r0QZqNhzH22hbJo+Vm/pra1
 Cko/F2N5ST+QDX/JRRvuK0qk/2SaLpaCrxWIeR393FcVsbTnwv79OiSIarVUlNyiYk
 aaBXasmq3z/uidG2Yl3amH6FoqUIfh771SzjGb+2qU8RRr8JGG2K3xAsBPQMeCbcyV
 nkl5ecNv+P8w4FtRnzyx4qeDZe/rmn8H7YKjLr7l2fRIlcimFAqHBbdTsV3PzSVoeP
 jnOIUMc6j6Oj2fevkJKHr82zRQH5tIJv1OLBlXcqHP1KEn6KTvj0pcboSKvfaM5ptO
 6AzsEkuotkfAw==
Date: Wed, 17 Apr 2024 16:05:27 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-intel-next
Message-ID: <20240417-curly-boobook-of-health-d243b4@penduick>
References: <Zh_Q72gYKMMbge9A@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="gwjnbgvni7ag3trl"
Content-Disposition: inline
In-Reply-To: <Zh_Q72gYKMMbge9A@intel.com>
X-TUID: juxlMduY+QJY
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


--gwjnbgvni7ag3trl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Apr 17, 2024 at 09:38:55AM -0400, Rodrigo Vivi wrote:
> Another thing that it is important to highlight is that we have 3 drm level
> patches in this pull request where I didn't see any explicit recorded
> ack from you (drm maintainers) nor from drm-misc maintainers.
> The patches looks good to me and shouldn't cause conflict, so I hope it
> is okay to continue with them here instead of a big removal at this
> point.

Sigh...

I guess it's a good occasion to test
https://gitlab.freedesktop.org/drm/maintainer-tools/-/merge_requests/40

And merge it if it works.

Maxime

--gwjnbgvni7ag3trl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZh/XJwAKCRAnX84Zoj2+
djkHAX9CreiHGCmBEsXUfIIPxwBL5K6HuB9EDUwhNWihNMZWAF/dIaXV+LiRvLcX
wt7pv0MBfR99leGy88Q8p94gw3EP3ZhVB3sNa8a79dw5aHrfEE7f/4+HaMdRaJe4
Nkf1dV5NlA==
=ANa0
-----END PGP SIGNATURE-----

--gwjnbgvni7ag3trl--
