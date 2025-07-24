Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A08B107CF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 12:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F7810E91F;
	Thu, 24 Jul 2025 10:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=caterina.shablia@collabora.com header.b="Z+IxacRT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979EB10E1F3;
 Thu, 24 Jul 2025 10:32:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1753353162; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FsITs/KURZXMu22rAO551EaLS2V8OSLn0waxpjxhOkAZQR5nijDeDXf8FFV7ndllAMvWaqBLfi7TVYc+V4VrQzGTX56Qd3nKueK1KcnNlL+Zle6GM82bRMf6SivBMI5UQlhiSFYmZ5qkFgmuixudXG7/1j/s3tb1ZBHKOxt2NEw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1753353162;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4wmYApn9wGtb+W6Wt3Ug/OxBHr90gym6aX1SwTrXfS0=; 
 b=lUloMMeNdQqoCSHzrJPHXhRM1XwGQvkuPht2u5d7L/fTIyRqS5J/ddoQUsNa7TMNggpjwSTnIDmDg6ucDHuyxB+xXFxARShahWy5jCrqCoddubq9nCe6Z4oaMpDUa+h6edkmLa1iVE4ABdh29txHRYD8tKe5sZY1P13KNRpXuZE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=caterina.shablia@collabora.com;
 dmarc=pass header.from=<caterina.shablia@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753353162; 
 s=zohomail; d=collabora.com; i=caterina.shablia@collabora.com; 
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=4wmYApn9wGtb+W6Wt3Ug/OxBHr90gym6aX1SwTrXfS0=;
 b=Z+IxacRT4LwL/lRxz36b2ys8X+LgXrnY4Nlyyj62ajL+40G5vQSuf6MkvRBQN7DC
 WOUNYdm8x866bpi730R2jIMs7MJQkVB0IUvKYMn21Z/im0b1Oog2ql62w03PwMhsb2y
 hVIdRq+BjU+VSjQqOYO/+me12SYjeSOsitTwws2k=
Received: by mx.zohomail.com with SMTPS id 175335316097995.59171158793265;
 Thu, 24 Jul 2025 03:32:40 -0700 (PDT)
From: Caterina Shablia <caterina.shablia@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>
Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 intel-xe@lists.freedesktop.org,
 Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>,
 Danilo Krummrich <dakr@redhat.com>, Boris Brezillon <bbrezillon@kernel.org>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 01/23] Introduce drm_gpuvm_sm_map_ops_flags enums for
 sm_map_ops
Date: Thu, 24 Jul 2025 12:32:37 +0200
Message-ID: <2304014.vFx2qVVIhK@xps>
In-Reply-To: <aIGBzCnTAcyb6v1H@lstrano-desk.jf.intel.com>
References: <20250722133526.3550547-1-himal.prasad.ghimiray@intel.com>
 <DBIMILMUUV20.YED53M3X50H5@kernel.org>
 <aIGBzCnTAcyb6v1H@lstrano-desk.jf.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

El jueves, 24 de julio de 2025 2:43:56 (hora de verano de Europa central),=
=20
Matthew Brost escribi=C3=B3:
> On Tue, Jul 22, 2025 at 03:38:14PM +0200, Danilo Krummrich wrote:
> > (Cc: Caterina)
> >=20
> > On Tue Jul 22, 2025 at 3:35 PM CEST, Himal Prasad Ghimiray wrote:
> > > - DRM_GPUVM_SM_MAP_NOT_MADVISE: Default sm_map operations for the inp=
ut
> > >=20
> > >   range.
> > >=20
> > > - DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
> > >=20
> > >   drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
> > >=20
> > > user-provided range and split the existing non-GEM object VMA if the
> > > start or end of the input range lies within it. The operations can
> > > create up to 2 REMAPS and 2 MAPs. The purpose of this operation is to=
 be
> > > used by the Xe driver to assign attributes to GPUVMA's within the
> > > user-defined range. Unlike drm_gpuvm_sm_map_ops_flags in default mode,
> > > the operation with this flag will never have UNMAPs and
> > > merges, and can be without any final operations.
> > >=20
> > > v2
> > > - use drm_gpuvm_sm_map_ops_create with flags instead of defining new
> > >=20
> > >   ops_create (Danilo)
> > >=20
> > > - Add doc (Danilo)
> > >=20
> > > v3
> > > - Fix doc
> > > - Fix unmapping check
> > >=20
> > > v4
> > > - Fix mapping for non madvise ops
> > >=20
> > > Cc: Danilo Krummrich <dakr@redhat.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > > Cc: <dri-devel@lists.freedesktop.org>
> > > Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> > > ---
> > >=20
> > >  drivers/gpu/drm/drm_gpuvm.c            | 93 ++++++++++++++++++++----=
=2D-
> > >  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  1 +
> > >  drivers/gpu/drm/xe/xe_vm.c             |  1 +
> >=20
> > What about the other drivers using GPUVM, aren't they affected by the
> > changes?
> Yes, this seemly would break the build or other users. If the baseline
> includes the patch below that I suggest to pull in this is a moot point
> though.
>=20
> > >  include/drm/drm_gpuvm.h                | 25 ++++++-
> > >  4 files changed, 98 insertions(+), 22 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > > index e89b932e987c..c7779588ea38 100644
> > > --- a/drivers/gpu/drm/drm_gpuvm.c
> > > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > > @@ -2103,10 +2103,13 @@ static int
> > >=20
> > >  __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> > > =20
> > >  		   const struct drm_gpuvm_ops *ops, void *priv,
> > >  		   u64 req_addr, u64 req_range,
> > >=20
> > > +		   enum drm_gpuvm_sm_map_ops_flags flags,
> >=20
> > Please coordinate with Boris and Caterina here. They're adding a new
> > request structure, struct drm_gpuvm_map_req.
> >=20
> > I think we can define it as
> >=20
> > 	struct drm_gpuvm_map_req {
> > =09
> > 		struct drm_gpuva_op_map map;
> > 		struct drm_gpuvm_sm_map_ops_flags flags;
> > =09
> > 	}
>=20
> +1, I see the patch [2] and the suggested change to drm_gpuva_op_map
> [3]. Both patch and your suggestion look good to me.
>=20
> Perhaps we try to accelerate [2] landing ahead of either series as
> overall just looks like a good cleanup which can be merged asap.
I'm not sure my patchset would be in a mergeable state any time soon -- I'v=
e=20
discovered some issues with split/merge of repeated mappings while writing =
the=20
doc, so it will be a while before I'll be submitting that again. [2] itself=
 is=20
in a good shape, absolutely feel free to submit that as part of your series.
>=20
> Himal - I'd rebase on top [2], with Danilo suggestion in [3] if this
> hasn't landed by your next rev.
>=20
> [2]
> https://lore.kernel.org/all/20250707170442.1437009-4-caterina.shablia@col=
la
> bora.com/ [3]
> https://lore.kernel.org/all/DB61N61AKIJ3.FG7GUJBG386P@kernel.org/
> > eventually.
> >=20
> > Please also coordinate on the changes in __drm_gpuvm_sm_map() below
> > regarding Caterina's series [1], it looks like they're conflicting.
>=20
> It looks pretty minor actually. I'm sure if really matter who this is
> race but yes, always good to coordinate.
>=20
> > [1]
> > https://lore.kernel.org/all/20250707170442.1437009-1-caterina.shablia@c=
ol
> > labora.com/>=20
> > > +/**
> > > + * enum drm_gpuvm_sm_map_ops_flags - flags for drm_gpuvm split/merge
> > > ops
> > > + */
> > > +enum drm_gpuvm_sm_map_ops_flags {
> > > +	/**
> > > +	 * @DRM_GPUVM_SM_MAP_NOT_MADVISE: DEFAULT sm_map ops
> > > +	 */
> > > +	DRM_GPUVM_SM_MAP_NOT_MADVISE =3D 0,
> >=20
> > Why would we name this "NOT_MADVISE"? What if we add more flags for oth=
er
> > purposes?
>=20
> How about...
>=20
> s/DRM_GPUVM_SM_MAP_NOT_MADVISE/DRM_GPUVM_SM_MAP_OPS_FLAG_NONE/
>=20
> > > +	/**
> > > +	 * @DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE: This flag is used by
> > > +	 * drm_gpuvm_sm_map_ops_create to iterate over GPUVMA's in the
> > > +	 * user-provided range and split the existing non-GEM object VMA=20
if
> > > the
> > > +	 * start or end of the input range lies within it. The operations=20
can
> > > +	 * create up to 2 REMAPS and 2 MAPs. Unlike=20
drm_gpuvm_sm_map_ops_flags
> > > +	 * in default mode, the operation with this flag will never have
> > > UNMAPs and +	 * merges, and can be without any final operations.
> > > +	 */
> > > +	DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE =3D BIT(0),
>=20
> Then normalize this one...
>=20
> s/DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE/DRM_GPUVM_SM_MAP_OPS_FLAG_SPLIT=
_MA
> DVISE/
>=20
> Matt
>=20
> > > +};




