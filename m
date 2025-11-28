Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EE6C91937
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 11:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E4D810E7BD;
	Fri, 28 Nov 2025 10:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="QnFkow+8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C359810E7BD;
 Fri, 28 Nov 2025 10:11:08 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4dHpwS3YDSz9sdZ;
 Fri, 28 Nov 2025 11:11:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1764324664; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=diyPQXL2Qw5FDt7Bp6VAknCUIYnOUGOR+UNKfDdY3pk=;
 b=QnFkow+8knOc6MGgdlNbHOPaNpn98fyeV4U6Thpb0+aAqIuPJvUphwsYP/DFqJmxkqvRJ8
 M0jWW37hrwAD9jwJfBx2lhRZckFTgJvUOkPAxbzXMAs/g+HH/8xH9rPQNGhs26l6oy+vWM
 tWHzgnJgguKlFRSsG9ckKkCZkOuspIBTmaPguADzN0ERYb62h51BnE4GXDXlnt9fHN1Ubj
 8kOJL81mw6ZIKI8Ecvjwj9FzT5UcnGHzlglmjV5+O4LrSTHia68P6TVfDA8BwoIKDUMj7P
 AXFUyXKSBR07zpC9zpZEsMMzw+QaSwwgG2Nq+xhGvXb/k7RGlg+73SLNx5dolQ==
Message-ID: <29754f848abcf7aebf7950862ef780362034fcf2.camel@mailbox.org>
Subject: Re: [PATCH 13/18] drm/amdgpu: independence for the amdkfd_fence! v2
From: Philipp Stanner <phasta@mailbox.org>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch, 
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org,  amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,  sumit.semwal@linaro.org
Date: Fri, 28 Nov 2025 11:10:56 +0100
In-Reply-To: <30c8a395-6870-4787-a954-6c9cbc68be62@amd.com>
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-14-christian.koenig@amd.com>
 <3cf92ff5fa9c9c73c8464434b0e8e13e402091fd.camel@mailbox.org>
 <30c8a395-6870-4787-a954-6c9cbc68be62@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 273c6748449d38d7929
X-MBO-RS-META: pupishafmnrirwwugygfw5qb4p4a3kom
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2025-11-28 at 11:06 +0100, Christian K=C3=B6nig wrote:
> On 11/27/25 12:10, Philipp Stanner wrote:
> > On Thu, 2025-11-13 at 15:51 +0100, Christian K=C3=B6nig wrote:
> > > This should allow amdkfd_fences to outlive the amdgpu module.
> > >=20
> > > v2: implement Felix suggestion to lock the fence while signaling it.
> > >=20
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > ---
> > >=20
> > >=20

[=E2=80=A6]

> > > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/d=
rm/amd/amdkfd/kfd_process.c
> > > index a085faac9fe1..8fac70b839ed 100644
> > > --- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> > > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
> > > @@ -1173,7 +1173,7 @@ static void kfd_process_wq_release(struct work_=
struct *work)
> > > =C2=A0	synchronize_rcu();
> > > =C2=A0	ef =3D rcu_access_pointer(p->ef);
> > > =C2=A0	if (ef)
> > > -		dma_fence_signal(ef);
> > > +		amdkfd_fence_signal(ef);
> > > =C2=A0
> > > =C2=A0	kfd_process_remove_sysfs(p);
> > > =C2=A0	kfd_debugfs_remove_process(p);
> > > @@ -1990,7 +1990,6 @@ kfd_process_gpuid_from_node(struct kfd_process =
*p, struct kfd_node *node,
> > > =C2=A0static int signal_eviction_fence(struct kfd_process *p)
> > > =C2=A0{
> > > =C2=A0	struct dma_fence *ef;
> > > -	int ret;
> > > =C2=A0
> > > =C2=A0	rcu_read_lock();
> > > =C2=A0	ef =3D dma_fence_get_rcu_safe(&p->ef);
> > > @@ -1998,10 +1997,10 @@ static int signal_eviction_fence(struct kfd_p=
rocess *p)
> > > =C2=A0	if (!ef)
> > > =C2=A0		return -EINVAL;
> > > =C2=A0
> > > -	ret =3D dma_fence_signal(ef);
> > > +	amdkfd_fence_signal(ef);
> > > =C2=A0	dma_fence_put(ef);
> > > =C2=A0
> > > -	return ret;
> > > +	return 0;
> >=20
> > Oh wait, that's the code I'm also touching in my return code series!
> >=20
> > https://lore.kernel.org/dri-devel/cef83fed-5994-4c77-962c-9c7aac9f7306@=
amd.com/
> >=20
> >=20
> > Does this series then solve the problem Felix pointed out in
> > evict_process_worker()?
>=20
> No it doesn't, I wasn't aware that the higher level code actually needs t=
he status. After all Felix is the maintainer of this part.
>=20
> This patch here needs to be rebased on top of yours and changed according=
ly to still return the fence status correctly.
>=20
> But thanks for pointing that out.


Alright, so my (repaired, v2) status-code-removal series shall enter drm-mi=
sc-next first, and then your series here. ACK?


P.
