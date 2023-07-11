Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8741A74E348
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 03:17:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E342710E0D7;
	Tue, 11 Jul 2023 01:17:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1925910E0BE;
 Tue, 11 Jul 2023 01:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1689038230;
 bh=r7uxpV11jSeaVAgCvED5AOMsk39lPtkrYKKKN2qj+sU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qo/Sk9UVTtUHtbn95isa8UXMOGAn2rgMaTlT0B1Od1S/VbKlFKaMcySkc4By/8KKd
 AvzrIFcgwntIslAmfI6+DyyhY36qjgYDRvOCC7giGQ2+rBkb4nPDHTiM7rbYfuM7Dy
 KQzz8nI77qvayxTu+Sx+uLorNvXP9z5PJKc6m/+8NRxy8tUO8SO4PUVuz+lRPt4f34
 vRc5GqnFYRZKLGw0+qwSi0GUAwc2f58QQNJNy4pH9zwyJo6shdGfxbBj+rv5Z3z8Mn
 v4ibkb3Wzp4W42pgFgV+IqZrO2ruaNqeOJt4VidSRBYHCPK4rWS01mMFRBz41EWvVP
 uzwMYBz4JdGrQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4R0NJP1mZrz4wyF;
 Tue, 11 Jul 2023 11:17:09 +1000 (AEST)
Date: Tue, 11 Jul 2023 11:17:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: manual merge of the drm tree with the
 drm-misc-fixes tree
Message-ID: <20230711111707.05d2c8b2@canb.auug.org.au>
In-Reply-To: <20230627115432.6179f0ea@canb.auug.org.au>
References: <20230627115432.6179f0ea@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tT8FL3fDMyck2qEDkk/.e/a";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/tT8FL3fDMyck2qEDkk/.e/a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 27 Jun 2023 11:54:32 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   include/drm/gpu_scheduler.h
>=20
> between commit:
>=20
>   db8b4968a8d0 ("drm/sched: Call drm_sched_fence_set_parent() from drm_sc=
hed_fence_scheduled()")
>=20
> from the drm-misc-fixes tree and commit:
>=20
>   539f9ee4b52a ("drm/scheduler: properly forward fence errors")
>=20
> from the drm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> diff --cc include/drm/gpu_scheduler.h
> index b29e347b10a9,e95b4837e5a3..000000000000
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@@ -581,16 -581,18 +581,17 @@@ void drm_sched_entity_push_job(struct d
>   void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
>   				   enum drm_sched_priority priority);
>   bool drm_sched_entity_is_ready(struct drm_sched_entity *entity);
> + int drm_sched_entity_error(struct drm_sched_entity *entity);
>  =20
>  -void drm_sched_fence_set_parent(struct drm_sched_fence *s_fence,
>  -				struct dma_fence *fence);
>   struct drm_sched_fence *drm_sched_fence_alloc(
>   	struct drm_sched_entity *s_entity, void *owner);
>   void drm_sched_fence_init(struct drm_sched_fence *fence,
>   			  struct drm_sched_entity *entity);
>   void drm_sched_fence_free(struct drm_sched_fence *fence);
>  =20
>  -void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>  +void drm_sched_fence_scheduled(struct drm_sched_fence *fence,
>  +			       struct dma_fence *parent);
> - void drm_sched_fence_finished(struct drm_sched_fence *fence);
> + void drm_sched_fence_finished(struct drm_sched_fence *fence, int result=
);
>  =20
>   unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched=
);
>   void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,

This is now a conflict between the drm-misc-fixes tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/tT8FL3fDMyck2qEDkk/.e/a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmSsrZMACgkQAVBC80lX
0GxRkQf/UPcZ8xn0EtVhBVzVXfoMc/wQYaQHwDbf3VARrURbheu3OSQ9kIbgaqvV
c717MNShUqkfN/44Ctqrhd37h1nNQguNz6R+fcuhVBbCdAnlgKqNo1p6QkrC1W3n
gGMlFohwDBvRnBw+yqqdXuhQP6HiBTShoRgHFH2G2xBFkbKhLjYxUB+eOJyocBSJ
xwkuy/tf620xa8Wv9FXrcYHx9mpOjjrl1Gcjx0mF/KRQL+6NP7o8unYsXJ24lA4o
nhldhr6wk37VowB9VBgROkGRlvh5//ptJ7cEHNLDUU58mK5H+R/DNqmv2zvmYo0c
rr+FkKgNH1lQUPcufbdCstcEjkqITw==
=MRSk
-----END PGP SIGNATURE-----

--Sig_/tT8FL3fDMyck2qEDkk/.e/a--
