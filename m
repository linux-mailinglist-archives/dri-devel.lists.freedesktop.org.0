Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 457BBA3B69C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 10:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9F8110E120;
	Wed, 19 Feb 2025 09:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sEOXmjRR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6285810E120
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 09:09:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9C05F5C4BCA;
 Wed, 19 Feb 2025 09:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378CFC4CEE9;
 Wed, 19 Feb 2025 09:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739956140;
 bh=GI/zZAfXd78fKSLQl9MOP4wo+a0Lomx975UL3xwoalc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sEOXmjRRNjmS8T/IBHnQm7EdAeppPgMftJXV9AVnUS/bUMYTOTjN7Itm5MuIAgatO
 3/1fL/qnmDoo0RGzRkBET9Qbx6xKe7nUY57iZ6YTPMZEBFoX3BCZO/mLueJ0Gy8Bxc
 nr6afdvmLMTdO9GsKaGUeBoRfQUBPKOnpz6ILWAXEtJR+Dj+kVO9+lX9ZZwnQP4v/Y
 KMrWFF/Ugc06LWytQ3UWUQFKNae5tmZrbBeXu6qqXCFYZwyNuzvJPXVIMH3TMJVMd1
 8HwCWpZLCyqQz7u2ybntXWh9EPCzRA7UDJuaBxT73q3DQBOo7w4HZXgq/kHgMZE26e
 r2NMji12wW/Ww==
Date: Wed, 19 Feb 2025 10:08:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Tejun Heo <tj@kernel.org>
Cc: Maarten Lankhorst <dev@lankhorst.se>, 
 Friedrich Vock <friedrich.vock@gmx.de>, Johannes Weiner <hannes@cmpxchg.org>, 
 Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 cgroups@vger.kernel.org
Subject: Re: [PATCH v2] cgroup/dmem: Don't open-code
 css_for_each_descendant_pre
Message-ID: <20250219-tactful-attractive-goldfish-51f8fc@houat>
References: <20250114153912.278909-1-friedrich.vock@gmx.de>
 <20250127152754.21325-1-friedrich.vock@gmx.de>
 <7f799ba1-3776-49bd-8a53-dc409ef2afe3@lankhorst.se>
 <Z7TT_lFL6hu__NP-@slm.duckdns.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="aiqiclpoablwgytv"
Content-Disposition: inline
In-Reply-To: <Z7TT_lFL6hu__NP-@slm.duckdns.org>
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


--aiqiclpoablwgytv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] cgroup/dmem: Don't open-code
 css_for_each_descendant_pre
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 08:39:58AM -1000, Tejun Heo wrote:
> Hello,
>=20
> On Tue, Feb 18, 2025 at 03:55:43PM +0100, Maarten Lankhorst wrote:
> > Should this fix go through the cgroup tree?
>=20
> I haven't been routing any dmem patches. Might as well stick to drm tree?

We merged the dmem cgroup through drm because we also had driver
changes, but going forward, as far as I'm concerned, it's "your" thing,
and it really shouldn't go through drm

Maxime

--aiqiclpoablwgytv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ7WfqQAKCRAnX84Zoj2+
dn2kAYCJ9ZnCoPyW9ORtYScH/UdoOIDhrga7+EkoVHrUCTsmzyrfEwaJ33PRFvK9
fAA2/6ABgNU8qrJvyFhwXN18jwf4F9p0dy6WVLB5w7o4uQjC/u6VZSf8zUI0GW0m
0G7UR7rITw==
=KoGg
-----END PGP SIGNATURE-----

--aiqiclpoablwgytv--
