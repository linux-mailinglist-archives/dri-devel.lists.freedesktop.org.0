Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8E49DAAA6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2024 16:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3E810EB2B;
	Wed, 27 Nov 2024 15:21:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="puOXGKqF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B3710EB2B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2024 15:21:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DEEBCA43909;
 Wed, 27 Nov 2024 15:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17077C4CECC;
 Wed, 27 Nov 2024 15:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732720862;
 bh=oLpo+hWAgB+0siG+hnBSnXiUeJoq42VkWg/Lo9jL3Y4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=puOXGKqF5ksn1wblnOcY2BV7BD2hEY/PjaVbaN+hAVlxwkGS0FpNeONX8QwQ7qur7
 yhSByGKFSXLUkUUpN2RKWdm2kPqdc7XHB2oYqjgBb6mkPjZ07SCnTGKzAB9ijG5DZ8
 /cewMaPyrYnZOUvPMzn6C4tbgo//s+dFcbcXQJqC6JUIkjHMPzpDMjxygqfCQkojID
 HuadncSYPfE02KOcwaRevfNPCCf0sBxzHJ3w2hqx/7bBHcUh9Mx5kcXmkF5ZIjnqXg
 XGqRCkhT3+fuKVThkldBn0zSIq5lccl8nERIlK2BOo0QGhJElH7p8CQq00TMTojKZK
 PC1iuy5aHH7Ug==
Date: Wed, 27 Nov 2024 16:21:00 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/vkms: Rename vkms_output to vkms_crtc
Message-ID: <20241127-aboriginal-spiked-centipede-cabef0@houat>
References: <20241122-b4-vkms-allocated-v2-0-ff7bddbf0bfb@bootlin.com>
 <20241122-b4-vkms-allocated-v2-4-ff7bddbf0bfb@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="umgahrspnwgk4kha"
Content-Disposition: inline
In-Reply-To: <20241122-b4-vkms-allocated-v2-4-ff7bddbf0bfb@bootlin.com>
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


--umgahrspnwgk4kha
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 4/4] drm/vkms: Rename vkms_output to vkms_crtc
MIME-Version: 1.0

On Fri, Nov 22, 2024 at 05:35:12PM +0100, Louis Chauvet wrote:
> The current vkms_output structure only contains crtc-related members.

That's not true though? There's a connector, the connector's workqueue,
etc. in there.

Maxime

--umgahrspnwgk4kha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ0c42wAKCRAnX84Zoj2+
di2IAYCNsqVrXaL8QKjOZw5i0osxjLvTGT3ohksTk4Zj5bIm4IEGtJ0YI+Xn90dH
Q8ljx/gBfjTY6PHH9jJz0+2aX68O4rXlj7iP6f0SBFqF/R2EhaeDh3HGjt3g2ts6
Gi8ti7HFnA==
=pbn6
-----END PGP SIGNATURE-----

--umgahrspnwgk4kha--
