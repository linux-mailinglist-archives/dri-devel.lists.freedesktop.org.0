Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D51A10E74
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 18:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485A810E457;
	Tue, 14 Jan 2025 17:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VkpnoVSb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3F710E45A
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 17:56:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D59A35C5762;
 Tue, 14 Jan 2025 17:56:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 007E9C4CEDD;
 Tue, 14 Jan 2025 17:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736877401;
 bh=HVAs2E2tbiTll+bmQK7MYfZHFdUhyRyMfEKuzz7fbdU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VkpnoVSb5QcZqnbtk3/XpQNgNbUfIHXLcGU3WRhQJiZxIUDWEGoL6cTsl+xXJjwqu
 oEgybG8IWKaSVCCdyqsN9Rs5LRtSRTD9joTaQLNM7byEVYuuGRqtOZ6eTyjKNXi7O6
 FbtLH6wsfXSV+rnlPku3k6KuXUvi9j6UmNcZRsIbSKceN96JDTQ9ghgW3dG1vW665p
 rcZsfJRmepux7QYnV7LwzHc3l6ax2fs/SaNgfn2+YNOgTQryFgKOexkwuCkRBLCy/f
 VYoVkUeUtgG5kiwuEys9AiAKlByKDwl/z1uO/GJhElUjlfB62Z7IzdZLB6CjEy8VbX
 ZG0gCeVkhcZwg==
Date: Tue, 14 Jan 2025 18:56:38 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Waiman Long <llong@redhat.com>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, tj@kernel.org, 
 hannes@cmpxchg.org, mkoutny@suse.com, cgroups@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH -next] kernel/cgroup: Remove the unused variable climit
Message-ID: <20250114-voracious-optimal-alligator-cdaaba@houat>
References: <20250114062804.5092-1-jiapeng.chong@linux.alibaba.com>
 <f502ee68-7743-48c6-9024-83431265a6b8@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="aanl67po5zzp3cqw"
Content-Disposition: inline
In-Reply-To: <f502ee68-7743-48c6-9024-83431265a6b8@redhat.com>
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


--aanl67po5zzp3cqw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH -next] kernel/cgroup: Remove the unused variable climit
MIME-Version: 1.0

On Tue, Jan 14, 2025 at 10:41:28AM -0500, Waiman Long wrote:
> On 1/14/25 1:28 AM, Jiapeng Chong wrote:
> > Variable climit is not effectively used, so delete it.
> >=20
> > kernel/cgroup/dmem.c:302:23: warning: variable =E2=80=98climit=E2=80=99=
 set but not used.
> >=20
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D13512
> > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> > ---
> >   kernel/cgroup/dmem.c | 3 +--
> >   1 file changed, 1 insertion(+), 2 deletions(-)
> >=20
> > diff --git a/kernel/cgroup/dmem.c b/kernel/cgroup/dmem.c
> > index 52736ef0ccf2..78d9361ed521 100644
> > --- a/kernel/cgroup/dmem.c
> > +++ b/kernel/cgroup/dmem.c
> > @@ -299,7 +299,7 @@ bool dmem_cgroup_state_evict_valuable(struct dmem_c=
group_pool_state *limit_pool,
> >   				      bool ignore_low, bool *ret_hit_low)
> >   {
> >   	struct dmem_cgroup_pool_state *pool =3D test_pool;
> > -	struct page_counter *climit, *ctest;
> > +	struct page_counter *ctest;
> >   	u64 used, min, low;
> >   	/* Can always evict from current pool, despite limits */
> > @@ -324,7 +324,6 @@ bool dmem_cgroup_state_evict_valuable(struct dmem_c=
group_pool_state *limit_pool,
> >   			{}
> >   	}
> > -	climit =3D &limit_pool->cnt;
> >   	ctest =3D &test_pool->cnt;
> >   	dmem_cgroup_calculate_protection(limit_pool, test_pool);
>=20
> The dmem controller is actually pulled into the drm tree at the moment.
>=20
> cc relevant parties on how to handle this fix commit.

We can either take it through drm with one of the cgroup maintainers
ack, or they can merge the PR in their tree and merge the fixes as they
wish through their tree.

Maxime

--aanl67po5zzp3cqw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4alVgAKCRAnX84Zoj2+
dkbhAYCvXuQH457px9VQnRHo/JbT0RoUcJKd/ZYksLGw3xZOOofgHU5mWjQXqy6f
Kxjp5SABfRPrRSXBThg/8O4SJqCxmLasieuJ7nPihfhLfoG0PJFpe8OaKQQrvnGN
OJsmuzpNGA==
=nWul
-----END PGP SIGNATURE-----

--aanl67po5zzp3cqw--
