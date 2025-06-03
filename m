Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B5DACC76E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:14:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69F010E030;
	Tue,  3 Jun 2025 13:13:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UpgetnCo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14B710E030;
 Tue,  3 Jun 2025 13:13:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6602DA5014A;
 Tue,  3 Jun 2025 13:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAFAC4CEED;
 Tue,  3 Jun 2025 13:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748956429;
 bh=39QVSQdlEunyDPQMXllJix/sOLusRs7AyHXNLyYHebo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UpgetnCodjjXd8xYtQ0AJXBj6gThGptV1PPVXhRTFPf/ZW9mXeevHkJ422HpPi9IE
 3cluumTXUPGLdV5XsERn/VfOi8xgnsocmRxb05lr5pudms703buYhdSw+OvcvCnwF9
 CyqtkWtgIs30VMlAViK/SZ+IKzcZ2qb4mNJtYopCf+Xmby9eg1IYcmhvjtUTPhg9Po
 TcW0nguoR21uy5BQptps8fJ3+ZXwoVWOBbazHvATqSEN0xbD7N9rFgT5ODO5fpLm1+
 rlBtX7DS2zbd5CLgCF1GpkUjP4XapI02R2XyPO5HjUPkdhqvAfNe3Z273BhJhatZmy
 VlRq7y5DpNqow==
Date: Tue, 3 Jun 2025 15:13:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, kernel-dev@igalia.com
Subject: Re: [PATCH v4 2/9] dma-fence: Use a flag for 64-bit seqnos
Message-ID: <20250603-outrageous-kakapo-of-felicity-6dc41a@houat>
References: <20250515095004.28318-1-tvrtko.ursulin@igalia.com>
 <20250515095004.28318-3-tvrtko.ursulin@igalia.com>
 <c93c05be-b2c8-42a2-84d1-32b90743eb82@amd.com>
 <b59cadff-da9a-409f-a5ed-96aafdfe3f0b@igalia.com>
 <13c5edf6-ccad-4a06-85d4-dccf2afd0c62@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="dqnx5uyzsy7xnzpf"
Content-Disposition: inline
In-Reply-To: <13c5edf6-ccad-4a06-85d4-dccf2afd0c62@amd.com>
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


--dqnx5uyzsy7xnzpf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/9] dma-fence: Use a flag for 64-bit seqnos
MIME-Version: 1.0

Hi,

On Mon, Jun 02, 2025 at 04:42:27PM +0200, Christian K=F6nig wrote:
> On 6/2/25 15:05, Tvrtko Ursulin wrote:
> > On 15/05/2025 14:15, Christian K=F6nig wrote:
> >> Hey drm-misc maintainers,
> >>
> >> can you guys please backmerge drm-next into drm-misc-next?
> >>
> >> I want to push this patch here but it depends on changes which are par=
tially in drm-next and partially in drm-misc-next.
> >=20
> > Looks like the backmerge is still pending?
>=20
> Yes, @Maarten, @Maxime and @Thomas ping on this.

It's done

Maxime

--dqnx5uyzsy7xnzpf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaD71CQAKCRAnX84Zoj2+
dp9jAX9u79CLhp4GCgWfIOWa3qsFqPl6tJ233zRU0nefH4IQ5uGsfi13qF6RXPic
qi8D9QMBfi8ZjYy/0C1GdO3wm3XAOpv8rhv8JVUNzDAe0KFrs6bFRLLTmXpBZ7RZ
qswqWy6hJw==
=2vgs
-----END PGP SIGNATURE-----

--dqnx5uyzsy7xnzpf--
