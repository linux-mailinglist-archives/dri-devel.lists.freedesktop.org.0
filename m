Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKksKjoujmmcAgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 20:47:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDE7130C55
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 20:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A5210E295;
	Thu, 12 Feb 2026 19:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q7aYkKFH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com
 [74.125.224.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53A6710E295
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 19:46:56 +0000 (UTC)
Received: by mail-yx1-f46.google.com with SMTP id
 956f58d0204a3-64937edbc9eso181365d50.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 11:46:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770925615; cv=none;
 d=google.com; s=arc-20240605;
 b=idhsfaWt57D77YCMfsrzzhUVziPvLURyQ+c0QOD6QGcplOlFlSP3bGBZFIn9a97l8r
 s0xDKH+RzHgf5iIlrDWQbAQksg+W7lENT5ivMxpAbxhkSApHYQoYHrEMNLJzRijqPVSp
 WmAMbaoid7fdDpDEtgKr9ZaewHJf9le6r0h45/ekvXeGwO7ZTTuH9sW48/zXYj1OXKRp
 mR5DT44GghM3PS/uEKMbWVNedVjh3D2AtbsH3b5s5dz3wdkSZFXR3rbtu7B2rr4uEyyh
 wMiMEc2JTFsren7WNfCIEylpqne1uiy6UKTjTU6wffBOmrqbtAcFpENZ099wYly2rAz/
 gsZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=HsMCDAo0Clvpf+cxb3sJ00+Kx2eH3rCgIBrGszExp2Q=;
 fh=Hv6KIMsgnu3V49xSYZNy2qops4h25IVuJIf5eVlrZIg=;
 b=L3wRmnEam+UCdV9VW6aTSDME5ZHfJ6rSLj9nuE61Z0EhwUwxLY0kuJ2ZJGYAuUyoX9
 ZBd31Qvtk023I8/LyO8qDjgTAZrWlgXVhQbAzTAQq4PXzfbcTJ1vrt+qJh6Pr5KS1s4U
 Gn676+DkEMferxYa+6KlI0VaBpIRsXppIuYcbgccQOE71/RI6kJ5GcOWNyRmn0pl3npv
 FMLj5ZKfFv5q82S01S5M83nKAAhmDFPxKMbkYM+pzSWUhdkpyue1CVXGe2f7ANzzwJtK
 gTHhxByUj97DvOtAmzDORo09xyTNGK3+JhGLJf5tEIs2t61WXCzk009p1vyGI2SSIdjD
 6URQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770925615; x=1771530415; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HsMCDAo0Clvpf+cxb3sJ00+Kx2eH3rCgIBrGszExp2Q=;
 b=Q7aYkKFH+UhkkiQiEJTd3/DXqncg66gitgruyJs5vmrCA4OvqViwVKaMrng96cTyiD
 jHSy5xtFHMRyY8U2H+21+4mLteOv7O0haRaknt9M5ycoIN2BDlYnYCNTHT9kfUmcsk2G
 Dw4gULX3eJoH3Pd+f2Ff5LY/Df0yWo/dK1DWArb4Y3LH8bloMn3L0A8VDmOvXXc5f4hr
 VINJt13/7cI4nHw66mSaUK2WzosohZtC6W9nq73iL+Ir7JW893gMwgyIZQwGH9htZHIe
 GSvO0Nh+SghN0PtHW//WLcqmTUMGdqkST1MN6zvKb9rJ5JnFftqUO+UaEv9KJdt/ingj
 LK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770925615; x=1771530415;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HsMCDAo0Clvpf+cxb3sJ00+Kx2eH3rCgIBrGszExp2Q=;
 b=twJUOH5lXoociaRhQs2adfDv3bJprD7jPhhhoFbp2IJVsbJv/OxX0WQXr1gu0thP3x
 nZLty3uZ14PHf8hSd78tbvsEXUZodmY7f7qWj401NrCr1+1rzLO4Y8G/L+Fjhv5w4k8w
 ApdYISXSaNUqpkZAjj+uDMxixIUVFYI3dix/o5y8j3qfB9hRBkeMH0Yi8vO45zYuOfq8
 LookwU2wFRsvCRmaaYs/7q4vCLKXhJ+vYeyUQ/7lHgbP3g7VdaX5nmFEgww6nwnf0MjK
 +bw5Tl1K6/pKnRXZNif3FG9HGDXolRYKQO/L/waaWoPkRf5jOw+DemQ7BcwypQZtEakU
 gogw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2XryBAe3JBDZdc1rNAfIJljqOceDBmcxK1vnCspzPBeFtPeyp2o5GNJnEd1wvQM72kCUQCjjRKyU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+kszF9bRMEnkUCR376oq1hvzBiz1/VetIxWkDfBlj8UKVbtdC
 sp5xlQ+PbjVwK3cbl2hXJbwJpjLzOPLQlQpbF1iJ+/O6CeSXuhqZPEI/XZFmBLcLXwjAM52OM3H
 ZUTRdQCTJqtKTweXH9zuZ5AvFgDf3TVo=
X-Gm-Gg: AZuq6aKNE/RVBGBeOrxh4FywN4IV6NvJN+cic2P9ur/kY/LYGhwt/vkWpJn01Z8wkHS
 szEYbo4uCsJd8pB32YAYM2Tr8srG77wy/VyoetXcs8V0Q54T4Q0cEFETjz9haPsj3/zYY71MT4+
 EsYtdEfvQrvLGsVywK4YmTPKHC1o6UzJzmRF08szzHVbbE+p9R7uM1PPYYfqRQKXY/KAkqC9LQS
 QSZvxcOgJsvM0XOEy6HvuzMDyfuCcqMlfzJhtWCV/VuzHl+sIoZz4GPwhpZpq3o5cgAUMQSoIvU
 UccagPpYdeXcLx6B0O2uii+jM67OkgPbvgJONtKe
X-Received: by 2002:a05:690e:15d2:b0:64a:da74:6d6b with SMTP id
 956f58d0204a3-64c14d62a2emr154584d50.56.1770925614772; Thu, 12 Feb 2026
 11:46:54 -0800 (PST)
MIME-Version: 1.0
References: <20260211080343.1887134-1-boris.brezillon@collabora.com>
 <20260211080343.1887134-6-boris.brezillon@collabora.com>
In-Reply-To: <20260211080343.1887134-6-boris.brezillon@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 12 Feb 2026 11:46:43 -0800
X-Gm-Features: AZwV_QiTsfyo0O7mUUVDt7tlztd2FuKS5POamKOfCgKM2-2frwc5C9YRSKZmTow
Message-ID: <CAPaKu7QPkyuEgMm49phMGeUPAOtTfmG7QUgh8CvHBzj3p6YA_g@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] drm/panthor: Part ways with drm_gem_shmem_object
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Chris Diamand <chris.diamand@arm.com>, Danilo Krummrich <dakr@kernel.org>, 
 Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Alice Ryhl <aliceryhl@google.com>, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:adrian.larumbe@collabora.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:akash.goel@arm.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:dmitry.osipenko@collabora.com,m:chris.diamand@arm.com,m:dakr@kernel.org,m:matthew.brost@intel.com,m:thomas.hellstrom@linux.intel.com,m:aliceryhl@google.com,m:kernel@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[olvaffe@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[olvaffe@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,lists.freedesktop.org,gmail.com,ffwll.ch,oss.qualcomm.com,poorly.run,kernel.org,linux.intel.com,suse.de,intel.com,google.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid,base.base:url]
X-Rspamd-Queue-Id: BEDE7130C55
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 2:12=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> While drm_gem_shmem_object does most of the job we need it to do, the
> way sub-resources (pages, sgt, vmap) are handled and their lifetimes
> gets in the way of BO reclaim. There has been attempts to address
> that [1], but in the meantime, new gem_shmem users were introduced
> (accel drivers), and some of them manually free some of these resources.
> This makes things harder to control/sanitize/validate.
>
> Thomas Zimmerman is not a huge fan of enforcing lifetimes of sub-resource=
s
> and forcing gem_shmem users to go through new gem_shmem helpers when they
> need manual control of some sort, and I believe this is a dead end if
> we don't force users to follow some stricter rules through carefully
> designed helpers, because there will always be one user doing crazy thing=
s
> with gem_shmem_object internals, which ends up tripping out the common
> helpers when they are called.
>
> The consensus we reached was that we would be better off forking
> gem_shmem in panthor. So here we are, parting ways with gem_shmem. The
> current transition tries to minimize the changes, but there are still
> some aspects that are different, the main one being that we no longer
> have a pages_use_count, and pages stays around until the GEM object is
> destroyed (or when evicted once we've added a shrinker). The sgt also
> no longer retains pages. This is losely based on how msm does things by
> the way.
>
> If there's any interest in sharing code (probably with msm, since the
> panthor shrinker is going to be losely based on the msm implementation),
> we can always change gears and do that once we have everything
> working/merged.
>
> [1]https://patchwork.kernel.org/project/dri-devel/patch/20240105184624.50=
8603-1-dmitry.osipenko@collabora.com/
>
> v2:
> - Fix refcounting
> - Add a _locked suffix to a bunch of functions expecting the resv lock
>   to be held
> - Take the lock before releasing resources in panthor_gem_free_object()
>
> v3:
> - Use ERR_CAST() to fix an ERR-ptr deref
> - Add missing resv_[un]lock() around a panthor_gem_backing_unpin_locked()
>   call
>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panthor/Kconfig         |   1 -
>  drivers/gpu/drm/panthor/panthor_drv.c   |   7 +-
>  drivers/gpu/drm/panthor/panthor_fw.c    |  16 +-
>  drivers/gpu/drm/panthor/panthor_gem.c   | 700 ++++++++++++++++++++----
>  drivers/gpu/drm/panthor/panthor_gem.h   |  62 ++-
>  drivers/gpu/drm/panthor/panthor_mmu.c   |  48 +-
>  drivers/gpu/drm/panthor/panthor_sched.c |   9 +-
>  7 files changed, 669 insertions(+), 174 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kc=
onfig
> index 55b40ad07f3b..911e7f4810c3 100644
> --- a/drivers/gpu/drm/panthor/Kconfig
> +++ b/drivers/gpu/drm/panthor/Kconfig
> @@ -8,7 +8,6 @@ config DRM_PANTHOR
>         depends on MMU
>         select DEVFREQ_GOV_SIMPLE_ONDEMAND
>         select DRM_EXEC
> -       select DRM_GEM_SHMEM_HELPER
>         select DRM_GPUVM
>         select DRM_SCHED
>         select IOMMU_IO_PGTABLE_LPAE
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index 52c27a60c84a..90e9abc22d9e 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -19,6 +19,7 @@
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_exec.h>
> +#include <drm/drm_file.h>
>  #include <drm/drm_ioctl.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_syncobj.h>
> @@ -1457,7 +1458,7 @@ static int panthor_ioctl_bo_query_info(struct drm_d=
evice *ddev, void *data,
>         args->create_flags =3D bo->flags;
>
>         args->extra_flags =3D 0;
> -       if (drm_gem_is_imported(&bo->base.base))
> +       if (drm_gem_is_imported(&bo->base))
>                 args->extra_flags |=3D DRM_PANTHOR_BO_IS_IMPORTED;
>
>         drm_gem_object_put(obj);
> @@ -1671,8 +1672,7 @@ static const struct drm_driver panthor_drm_driver =
=3D {
>         .major =3D 1,
>         .minor =3D 7,
>
> -       .gem_create_object =3D panthor_gem_create_object,
> -       .gem_prime_import_sg_table =3D drm_gem_shmem_prime_import_sg_tabl=
e,
> +       .gem_prime_import_sg_table =3D panthor_gem_prime_import_sg_table,
>         .gem_prime_import =3D panthor_gem_prime_import,
>  #ifdef CONFIG_DEBUG_FS
>         .debugfs_init =3D panthor_debugfs_init,
> @@ -1822,3 +1822,4 @@ module_exit(panthor_exit);
>  MODULE_AUTHOR("Panthor Project Developers");
>  MODULE_DESCRIPTION("Panthor DRM Driver");
>  MODULE_LICENSE("Dual MIT/GPL");
> +MODULE_IMPORT_NS("DMA_BUF");
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panth=
or/panthor_fw.c
> index 5a904ca64525..9e61d26c3a15 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -628,7 +628,6 @@ static int panthor_fw_load_section_entry(struct panth=
or_device *ptdev,
>                 u32 cache_mode =3D hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_=
CACHE_MODE_MASK;
>                 struct panthor_gem_object *bo;
>                 u32 vm_map_flags =3D 0;
> -               struct sg_table *sgt;
>                 u64 va =3D hdr.va.start;
>
>                 if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_WR))
> @@ -666,11 +665,12 @@ static int panthor_fw_load_section_entry(struct pan=
thor_device *ptdev,
>                 panthor_fw_init_section_mem(ptdev, section);
>
>                 bo =3D to_panthor_bo(section->mem->obj);
> -               sgt =3D drm_gem_shmem_get_pages_sgt(&bo->base);
> -               if (IS_ERR(sgt))
> -                       return PTR_ERR(sgt);
>
> -               dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_=
DEVICE);
> +               /* An sgt should have been requested when the kernel BO w=
as GPU-mapped. */
> +               if (drm_WARN_ON_ONCE(&ptdev->base, !bo->dmap.sgt))
> +                       return -EINVAL;
> +
> +               dma_sync_sgtable_for_device(ptdev->base.dev, bo->dmap.sgt=
, DMA_TO_DEVICE);
>         }
>
>         if (hdr.va.start =3D=3D CSF_MCU_SHARED_REGION_START)
> @@ -730,8 +730,10 @@ panthor_reload_fw_sections(struct panthor_device *pt=
dev, bool full_reload)
>                         continue;
>
>                 panthor_fw_init_section_mem(ptdev, section);
> -               sgt =3D drm_gem_shmem_get_pages_sgt(&to_panthor_bo(sectio=
n->mem->obj)->base);
> -               if (!drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(sgt)))
> +
> +               /* An sgt should have been requested when the kernel BO w=
as GPU-mapped. */
> +               sgt =3D to_panthor_bo(section->mem->obj)->dmap.sgt;
> +               if (!drm_WARN_ON_ONCE(&ptdev->base, !sgt))
>                         dma_sync_sgtable_for_device(ptdev->base.dev, sgt,=
 DMA_TO_DEVICE);
>         }
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index 4b3d82f001d8..c07ae062c98f 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -8,9 +8,11 @@
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
>  #include <linux/slab.h>
> +#include <linux/vmalloc.h>
>
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_file.h>
> +#include <drm/drm_prime.h>
>  #include <drm/drm_print.h>
>  #include <drm/panthor_drm.h>
>
> @@ -44,7 +46,7 @@ static void panthor_gem_debugfs_bo_init(struct panthor_=
gem_object *bo)
>
>  static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo)
>  {
> -       struct panthor_device *ptdev =3D container_of(bo->base.base.dev,
> +       struct panthor_device *ptdev =3D container_of(bo->base.dev,
>                                                     struct panthor_device=
, base);
>
>         bo->debugfs.creator.tgid =3D current->group_leader->pid;
> @@ -57,7 +59,7 @@ static void panthor_gem_debugfs_bo_add(struct panthor_g=
em_object *bo)
>
>  static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
>  {
> -       struct panthor_device *ptdev =3D container_of(bo->base.base.dev,
> +       struct panthor_device *ptdev =3D container_of(bo->base.dev,
>                                                     struct panthor_device=
, base);
>
>         if (list_empty(&bo->debugfs.node))
> @@ -80,9 +82,9 @@ static void panthor_gem_debugfs_bo_init(struct panthor_=
gem_object *bo) {}
>  #endif
>
>  static bool
> -should_map_wc(struct panthor_gem_object *bo, struct panthor_vm *exclusiv=
e_vm)
> +should_map_wc(struct panthor_gem_object *bo)
>  {
> -       struct panthor_device *ptdev =3D container_of(bo->base.base.dev, =
struct panthor_device, base);
> +       struct panthor_device *ptdev =3D container_of(bo->base.dev, struc=
t panthor_device, base);
>
>         /* We can't do uncached mappings if the device is coherent,
>          * because the zeroing done by the shmem layer at page allocation
> @@ -112,6 +114,211 @@ should_map_wc(struct panthor_gem_object *bo, struct=
 panthor_vm *exclusive_vm)
>         return true;
>  }
>
> +static void
> +panthor_gem_backing_cleanup_locked(struct panthor_gem_object *bo)
> +{
> +       dma_resv_assert_held(bo->base.resv);
> +
> +       if (!bo->backing.pages)
> +               return;
> +
> +       drm_gem_put_pages(&bo->base, bo->backing.pages, true, false);
> +       bo->backing.pages =3D NULL;
> +}
> +
> +static int
> +panthor_gem_backing_get_pages_locked(struct panthor_gem_object *bo)
> +{
> +       dma_resv_assert_held(bo->base.resv);
> +
> +       if (bo->backing.pages)
> +               return 0;
> +
> +       bo->backing.pages =3D drm_gem_get_pages(&bo->base);
> +       if (IS_ERR(bo->backing.pages)) {
> +               drm_dbg_kms(bo->base.dev, "Failed to get pages (%pe)\n",
> +                           bo->backing.pages);
> +               return PTR_ERR(bo->backing.pages);
After this happens once, subsequent get_pages_locked calls will
incorrectly return 0.
> +       }
> +
> +       return 0;
> +}
> +
> +static int panthor_gem_backing_pin_locked(struct panthor_gem_object *bo)
> +{
> +       int ret;
> +
> +       dma_resv_assert_held(bo->base.resv);
> +       drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base));
> +
> +       if (refcount_inc_not_zero(&bo->backing.pin_count))
> +               return 0;
> +
> +       ret =3D panthor_gem_backing_get_pages_locked(bo);
> +       if (!ret)
> +               refcount_set(&bo->backing.pin_count, 1);
> +
> +       return ret;
> +}
> +
> +static void panthor_gem_backing_unpin_locked(struct panthor_gem_object *=
bo)
> +{
> +       dma_resv_assert_held(bo->base.resv);
> +       drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base));
> +
> +       if (refcount_dec_and_test(&bo->backing.pin_count)) {
> +               /* We don't release anything when pin_count drops to zero=
.
> +                * Pages stay there until an explicit cleanup is requeste=
d.
> +                */
> +       }
> +}
> +
> +static void
> +panthor_gem_dev_map_cleanup_locked(struct panthor_gem_object *bo)
> +{
> +       dma_resv_assert_held(bo->base.resv);
> +
> +       if (!bo->dmap.sgt)
> +               return;
> +
> +       dma_unmap_sgtable(drm_dev_dma_dev(bo->base.dev), bo->dmap.sgt, DM=
A_BIDIRECTIONAL, 0);
> +       sg_free_table(bo->dmap.sgt);
> +       kfree(bo->dmap.sgt);
> +       bo->dmap.sgt =3D NULL;
> +}
> +
> +static struct sg_table *
> +panthor_gem_dev_map_get_sgt_locked(struct panthor_gem_object *bo)
> +{
> +       struct sg_table *sgt;
> +       int ret;
> +
> +       dma_resv_assert_held(bo->base.resv);
> +
> +       if (bo->dmap.sgt)
> +               return bo->dmap.sgt;
> +
> +       if (drm_WARN_ON_ONCE(bo->base.dev, !bo->backing.pages))
> +               return ERR_PTR(-EINVAL);
> +
> +       /* Pages stay around after they've been allocated. At least that =
stands
> +        * until we add a shrinker.
> +        */
> +       ret =3D panthor_gem_backing_get_pages_locked(bo);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       sgt =3D drm_prime_pages_to_sg(bo->base.dev, bo->backing.pages,
> +                                   bo->base.size >> PAGE_SHIFT);
> +       if (IS_ERR(sgt))
> +               return sgt;
> +
> +       /* Map the pages for use by the h/w. */
> +       ret =3D dma_map_sgtable(drm_dev_dma_dev(bo->base.dev), sgt, DMA_B=
IDIRECTIONAL, 0);
> +       if (ret)
> +               goto err_free_sgt;
> +
> +       bo->dmap.sgt =3D sgt;
> +       return sgt;
> +
> +err_free_sgt:
> +       sg_free_table(sgt);
> +       kfree(sgt);
> +       return ERR_PTR(ret);
> +}
> +
> +struct sg_table *
> +panthor_gem_get_dev_sgt(struct panthor_gem_object *bo)
> +{
> +       struct sg_table *sgt;
> +
> +       dma_resv_lock(bo->base.resv, NULL);
> +       sgt =3D panthor_gem_dev_map_get_sgt_locked(bo);
> +       dma_resv_unlock(bo->base.resv);
> +
> +       return sgt;
> +}
> +
> +static void
> +panthor_gem_vmap_cleanup_locked(struct panthor_gem_object *bo)
> +{
> +       if (!bo->cmap.vaddr)
> +               return;
> +
> +       vunmap(bo->cmap.vaddr);
> +       bo->cmap.vaddr =3D NULL;
> +       panthor_gem_backing_unpin_locked(bo);
> +}
> +
> +static int
> +panthor_gem_prep_for_cpu_map_locked(struct panthor_gem_object *bo)
> +{
> +       if (should_map_wc(bo)) {
> +               struct sg_table *sgt;
> +
> +               sgt =3D panthor_gem_dev_map_get_sgt_locked(bo);
> +               if (IS_ERR(sgt))
> +                       return PTR_ERR(sgt);
> +       }
> +
> +       return 0;
> +}
> +
> +static void *
> +panthor_gem_vmap_get_locked(struct panthor_gem_object *bo)
> +{
> +       pgprot_t prot =3D PAGE_KERNEL;
> +       void *vaddr;
> +       int ret;
> +
> +       dma_resv_assert_held(bo->base.resv);
> +
> +       if (drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base)=
))
> +               return ERR_PTR(-EINVAL);
> +
> +       if (refcount_inc_not_zero(&bo->cmap.vaddr_use_count)) {
> +               drm_WARN_ON_ONCE(bo->base.dev, !bo->cmap.vaddr);
> +               return bo->cmap.vaddr;
> +       }
> +
> +       ret =3D panthor_gem_backing_pin_locked(bo);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       ret =3D panthor_gem_prep_for_cpu_map_locked(bo);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       if (should_map_wc(bo))
> +               prot =3D pgprot_writecombine(prot);
> +
> +       vaddr =3D vmap(bo->backing.pages, bo->base.size >> PAGE_SHIFT, VM=
_MAP, prot);
> +       if (!vaddr) {
> +               ret =3D -ENOMEM;
> +               goto err_unpin;
> +       }
> +
> +       bo->cmap.vaddr =3D vaddr;
> +       refcount_set(&bo->cmap.vaddr_use_count, 1);
> +       return vaddr;
> +
> +err_unpin:
> +       panthor_gem_backing_unpin_locked(bo);
> +       return ERR_PTR(ret);
> +}
> +
> +static void
> +panthor_gem_vmap_put_locked(struct panthor_gem_object *bo)
> +{
> +       dma_resv_assert_held(bo->base.resv);
> +
> +       if (drm_WARN_ON_ONCE(bo->base.dev, drm_gem_is_imported(&bo->base)=
))
> +               return;
> +
> +       if (refcount_dec_and_test(&bo->cmap.vaddr_use_count))
> +               panthor_gem_vmap_cleanup_locked(bo);
> +}
> +
>  static void panthor_gem_free_object(struct drm_gem_object *obj)
>  {
>         struct panthor_gem_object *bo =3D to_panthor_bo(obj);
> @@ -127,8 +334,19 @@ static void panthor_gem_free_object(struct drm_gem_o=
bject *obj)
>
>         mutex_destroy(&bo->label.lock);
>
> -       drm_gem_free_mmap_offset(&bo->base.base);
> -       drm_gem_shmem_free(&bo->base);
> +       if (drm_gem_is_imported(obj)) {
> +               drm_prime_gem_destroy(obj, bo->dmap.sgt);
> +       } else {
> +               dma_resv_lock(obj->resv, NULL);
> +               panthor_gem_vmap_cleanup_locked(bo);
> +               panthor_gem_dev_map_cleanup_locked(bo);
> +               panthor_gem_backing_cleanup_locked(bo);
> +               dma_resv_unlock(obj->resv);
> +       }
> +
> +       drm_gem_object_release(obj);
> +
> +       kfree(bo);
>         drm_gem_object_put(vm_root_gem);
>  }
>
> @@ -159,15 +377,15 @@ panthor_gem_prime_begin_cpu_access(struct dma_buf *=
dma_buf,
>  {
>         struct drm_gem_object *obj =3D dma_buf->priv;
>         struct drm_device *dev =3D obj->dev;
> -       struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> +       struct panthor_gem_object *bo =3D to_panthor_bo(obj);
>         struct dma_buf_attachment *attach;
>
>         dma_resv_lock(obj->resv, NULL);
> -       if (shmem->sgt)
> -               dma_sync_sgtable_for_cpu(dev->dev, shmem->sgt, dir);
> +       if (bo->dmap.sgt)
> +               dma_sync_sgtable_for_cpu(drm_dev_dma_dev(dev), bo->dmap.s=
gt, dir);
>
> -       if (shmem->vaddr)
> -               invalidate_kernel_vmap_range(shmem->vaddr, shmem->base.si=
ze);
> +       if (bo->cmap.vaddr)
> +               invalidate_kernel_vmap_range(bo->cmap.vaddr, bo->base.siz=
e);
>
>         list_for_each_entry(attach, &dma_buf->attachments, node) {
>                 struct sg_table *sgt =3D attach->priv;
> @@ -186,7 +404,7 @@ panthor_gem_prime_end_cpu_access(struct dma_buf *dma_=
buf,
>  {
>         struct drm_gem_object *obj =3D dma_buf->priv;
>         struct drm_device *dev =3D obj->dev;
> -       struct drm_gem_shmem_object *shmem =3D to_drm_gem_shmem_obj(obj);
> +       struct panthor_gem_object *bo =3D to_panthor_bo(obj);
>         struct dma_buf_attachment *attach;
>
>         dma_resv_lock(obj->resv, NULL);
> @@ -197,11 +415,11 @@ panthor_gem_prime_end_cpu_access(struct dma_buf *dm=
a_buf,
>                         dma_sync_sgtable_for_device(attach->dev, sgt, dir=
);
>         }
>
> -       if (shmem->vaddr)
> -               flush_kernel_vmap_range(shmem->vaddr, shmem->base.size);
> +       if (bo->cmap.vaddr)
> +               flush_kernel_vmap_range(bo->cmap.vaddr, bo->base.size);
>
> -       if (shmem->sgt)
> -               dma_sync_sgtable_for_device(dev->dev, shmem->sgt, dir);
> +       if (bo->dmap.sgt)
> +               dma_sync_sgtable_for_device(drm_dev_dma_dev(dev), bo->dma=
p.sgt, dir);
>
>         dma_resv_unlock(obj->resv);
>         return 0;
> @@ -258,53 +476,338 @@ panthor_gem_prime_import(struct drm_device *dev,
>         return drm_gem_prime_import(dev, dma_buf);
>  }
>
> +static void panthor_gem_print_info(struct drm_printer *p, unsigned int i=
ndent,
> +                                  const struct drm_gem_object *obj)
> +{
> +       const struct panthor_gem_object *bo =3D to_panthor_bo(obj);
> +
> +       if (drm_gem_is_imported(&bo->base))
> +               return;
> +
> +       drm_printf_indent(p, indent, "resident=3D%s\n", str_true_false(bo=
->backing.pages));
> +       drm_printf_indent(p, indent, "pages_pin_count=3D%u\n", refcount_r=
ead(&bo->backing.pin_count));
> +       drm_printf_indent(p, indent, "vmap_use_count=3D%u\n",
> +                         refcount_read(&bo->cmap.vaddr_use_count));
> +       drm_printf_indent(p, indent, "vaddr=3D%p\n", bo->cmap.vaddr);
> +}
> +
> +static int panthor_gem_pin_locked(struct drm_gem_object *obj)
> +{
> +       if (drm_gem_is_imported(obj))
> +               return 0;
> +
> +       return panthor_gem_backing_pin_locked(to_panthor_bo(obj));
> +}
> +
> +static void panthor_gem_unpin_locked(struct drm_gem_object *obj)
> +{
> +       if (!drm_gem_is_imported(obj))
> +               panthor_gem_backing_unpin_locked(to_panthor_bo(obj));
> +}
> +
> +int panthor_gem_pin(struct panthor_gem_object *bo)
> +{
> +       int ret =3D 0;
> +
> +       if (drm_gem_is_imported(&bo->base))
> +               return 0;
> +
> +       if (refcount_inc_not_zero(&bo->backing.pin_count))
> +               return 0;
> +
> +       dma_resv_lock(bo->base.resv, NULL);
> +       ret =3D panthor_gem_backing_pin_locked(bo);
> +       dma_resv_unlock(bo->base.resv);
> +
> +       return ret;
> +}
> +
> +void panthor_gem_unpin(struct panthor_gem_object *bo)
> +{
> +       if (drm_gem_is_imported(&bo->base))
> +               return;
> +
> +       if (!refcount_dec_not_one(&bo->backing.pin_count)) {
Can we make panthor_gem_{pin,unpin} have the same style? We negate the
test here but not in panthor_gem_pin.

> +               dma_resv_lock(bo->base.resv, NULL);
> +               panthor_gem_backing_unpin_locked(bo);
> +               dma_resv_unlock(bo->base.resv);
> +       }
> +}
> +
> +static struct sg_table *panthor_gem_get_sg_table(struct drm_gem_object *=
obj)
> +{
> +       struct panthor_gem_object *bo =3D to_panthor_bo(obj);
> +
> +       drm_WARN_ON_ONCE(obj->dev, drm_gem_is_imported(obj));
> +       drm_WARN_ON_ONCE(obj->dev, !bo->backing.pages);
> +       drm_WARN_ON_ONCE(obj->dev, !refcount_read(&bo->backing.pin_count)=
);
> +
> +       return drm_prime_pages_to_sg(obj->dev, bo->backing.pages, obj->si=
ze >> PAGE_SHIFT);
> +}
> +
> +static int panthor_gem_vmap_locked(struct drm_gem_object *obj,
> +                                  struct iosys_map *map)
> +{
> +       struct panthor_gem_object *bo =3D to_panthor_bo(obj);
> +       void *vaddr;
> +
> +       dma_resv_assert_held(obj->resv);
> +
> +       if (drm_gem_is_imported(obj))
> +               return dma_buf_vmap(obj->import_attach->dmabuf, map);
> +
> +       vaddr =3D panthor_gem_vmap_get_locked(bo);
> +       if (IS_ERR(vaddr))
> +               return PTR_ERR(vaddr);
> +
> +       iosys_map_set_vaddr(map, vaddr);
> +       return 0;
> +}
> +
> +static void panthor_gem_vunmap_locked(struct drm_gem_object *obj,
> +                                     struct iosys_map *map)
> +{
> +       struct panthor_gem_object *bo =3D to_panthor_bo(obj);
> +
> +       dma_resv_assert_held(obj->resv);
> +
> +       if (drm_gem_is_imported(obj)) {
> +               dma_buf_vunmap(obj->import_attach->dmabuf, map);
> +       } else {
> +               drm_WARN_ON_ONCE(obj->dev, bo->cmap.vaddr !=3D map->vaddr=
);
> +               panthor_gem_vmap_put_locked(bo);
> +       }
> +}
> +
> +static int panthor_gem_mmap(struct drm_gem_object *obj, struct vm_area_s=
truct *vma)
> +{
> +       struct panthor_gem_object *bo =3D to_panthor_bo(obj);
> +       int ret;
> +
> +       if (drm_gem_is_imported(obj)) {
> +               /* Reset both vm_ops and vm_private_data, so we don't end=
 up with
> +                * vm_ops pointing to our implementation if the dma-buf b=
ackend
> +                * doesn't set those fields.
> +                */
> +               vma->vm_private_data =3D NULL;
> +               vma->vm_ops =3D NULL;
> +
> +               ret =3D dma_buf_mmap(obj->dma_buf, vma, 0);
> +
> +               /* Drop the reference drm_gem_mmap_obj() acquired.*/
> +               if (!ret)
> +                       drm_gem_object_put(obj);
> +
> +               return ret;
> +       }
> +
> +       if (is_cow_mapping(vma->vm_flags))
> +               return -EINVAL;
> +
> +       dma_resv_lock(obj->resv, NULL);
> +       ret =3D panthor_gem_backing_get_pages_locked(bo);
> +       if (!ret)
> +               ret =3D panthor_gem_prep_for_cpu_map_locked(bo);
> +       dma_resv_unlock(obj->resv);
> +
> +       if (ret)
> +               return ret;
> +
> +       vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
> +       vma->vm_page_prot =3D vm_get_page_prot(vma->vm_flags);
> +       if (should_map_wc(bo))
> +               vma->vm_page_prot =3D pgprot_writecombine(vma->vm_page_pr=
ot);
> +
> +       return 0;
> +}
> +
>  static enum drm_gem_object_status panthor_gem_status(struct drm_gem_obje=
ct *obj)
>  {
>         struct panthor_gem_object *bo =3D to_panthor_bo(obj);
>         enum drm_gem_object_status res =3D 0;
>
> -       if (drm_gem_is_imported(&bo->base.base) || bo->base.pages)
> +       if (drm_gem_is_imported(&bo->base) || bo->backing.pages)
>                 res |=3D DRM_GEM_OBJECT_RESIDENT;
>
>         return res;
>  }
>
> -static const struct drm_gem_object_funcs panthor_gem_funcs =3D {
> -       .free =3D panthor_gem_free_object,
> -       .print_info =3D drm_gem_shmem_object_print_info,
> -       .pin =3D drm_gem_shmem_object_pin,
> -       .unpin =3D drm_gem_shmem_object_unpin,
> -       .get_sg_table =3D drm_gem_shmem_object_get_sg_table,
> -       .vmap =3D drm_gem_shmem_object_vmap,
> -       .vunmap =3D drm_gem_shmem_object_vunmap,
> -       .mmap =3D drm_gem_shmem_object_mmap,
> -       .status =3D panthor_gem_status,
> -       .export =3D panthor_gem_prime_export,
> -       .vm_ops =3D &drm_gem_shmem_vm_ops,
> +static bool try_map_pmd(struct vm_fault *vmf, unsigned long addr, struct=
 page *page)
> +{
> +#ifdef CONFIG_ARCH_SUPPORTS_PMD_PFNMAP
> +       unsigned long pfn =3D page_to_pfn(page);
> +       unsigned long paddr =3D pfn << PAGE_SHIFT;
> +       bool aligned =3D (addr & ~PMD_MASK) =3D=3D (paddr & ~PMD_MASK);
> +
> +       if (aligned &&
> +           pmd_none(*vmf->pmd) &&
> +           folio_test_pmd_mappable(page_folio(page))) {
> +               pfn &=3D PMD_MASK >> PAGE_SHIFT;
> +               if (vmf_insert_pfn_pmd(vmf, pfn, false) =3D=3D VM_FAULT_N=
OPAGE)
> +                       return true;
> +       }
> +#endif
> +
> +       return false;
> +}
> +
> +static vm_fault_t panthor_gem_fault(struct vm_fault *vmf)
> +{
> +       struct vm_area_struct *vma =3D vmf->vma;
> +       struct drm_gem_object *obj =3D vma->vm_private_data;
> +       struct panthor_gem_object *bo =3D to_panthor_bo(vma->vm_private_d=
ata);
> +       loff_t num_pages =3D obj->size >> PAGE_SHIFT;
> +       vm_fault_t ret;
> +       pgoff_t page_offset;
> +       unsigned long pfn;
> +
> +       /* Offset to faulty address in the VMA. */
> +       page_offset =3D vmf->pgoff - vma->vm_pgoff;
> +
> +       dma_resv_lock(bo->base.resv, NULL);
> +
> +       if (page_offset >=3D num_pages ||
> +           drm_WARN_ON_ONCE(obj->dev, !bo->backing.pages)) {
> +               ret =3D VM_FAULT_SIGBUS;
> +               goto out;
> +       }
> +
> +       if (try_map_pmd(vmf, vmf->address, bo->backing.pages[page_offset]=
)) {
> +               ret =3D VM_FAULT_NOPAGE;
> +               goto out;
> +       }
> +
> +       pfn =3D page_to_pfn(bo->backing.pages[page_offset]);
> +       ret =3D vmf_insert_pfn(vma, vmf->address, pfn);
> +
> + out:
> +       dma_resv_unlock(bo->base.resv);
> +
> +       return ret;
> +}
> +
> +static void panthor_gem_vm_open(struct vm_area_struct *vma)
> +{
> +       struct panthor_gem_object *bo =3D to_panthor_bo(vma->vm_private_d=
ata);
> +
> +       drm_WARN_ON(bo->base.dev, drm_gem_is_imported(&bo->base));
> +
> +       dma_resv_lock(bo->base.resv, NULL);
> +
> +       /* We should have already pinned the pages when the buffer was fi=
rst
> +        * mmap'd, vm_open() just grabs an additional reference for the n=
ew
> +        * mm the vma is getting copied into (ie. on fork()).
> +        */
> +       drm_WARN_ON_ONCE(bo->base.dev, !bo->backing.pages);
> +
> +       dma_resv_unlock(bo->base.resv);
> +
> +       drm_gem_vm_open(vma);
> +}
> +
> +const struct vm_operations_struct panthor_gem_vm_ops =3D {
> +       .fault =3D panthor_gem_fault,
> +       .open =3D panthor_gem_vm_open,
> +       .close =3D drm_gem_vm_close,
>  };
>
> -/**
> - * panthor_gem_create_object - Implementation of driver->gem_create_obje=
ct.
> - * @ddev: DRM device
> - * @size: Size in bytes of the memory the object will reference
> - *
> - * This lets the GEM helpers allocate object structs for us, and keep
> - * our BO stats correct.
> - */
> -struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev=
, size_t size)
> -{
> -       struct panthor_gem_object *obj;
> +static const struct drm_gem_object_funcs panthor_gem_funcs =3D {
> +       .free =3D panthor_gem_free_object,
> +       .print_info =3D panthor_gem_print_info,
> +       .pin =3D panthor_gem_pin_locked,
> +       .unpin =3D panthor_gem_unpin_locked,
> +       .get_sg_table =3D panthor_gem_get_sg_table,
> +       .vmap =3D panthor_gem_vmap_locked,
> +       .vunmap =3D panthor_gem_vunmap_locked,
> +       .mmap =3D panthor_gem_mmap,
> +       .status =3D panthor_gem_status,
> +       .export =3D panthor_gem_prime_export,
> +       .vm_ops =3D &panthor_gem_vm_ops,
> +};
>
> -       obj =3D kzalloc(sizeof(*obj), GFP_KERNEL);
> -       if (!obj)
> +static struct panthor_gem_object *
> +panthor_gem_alloc_object(uint32_t flags)
> +{
> +       struct panthor_gem_object *bo;
> +
> +       bo =3D kzalloc(sizeof(*bo), GFP_KERNEL);
> +       if (!bo)
>                 return ERR_PTR(-ENOMEM);
>
> -       obj->base.base.funcs =3D &panthor_gem_funcs;
> -       mutex_init(&obj->label.lock);
> +       bo->base.funcs =3D &panthor_gem_funcs;
> +       bo->flags =3D flags;
> +       mutex_init(&bo->label.lock);
> +       panthor_gem_debugfs_bo_init(bo);
> +       return bo;
> +}
>
> -       panthor_gem_debugfs_bo_init(obj);
> +static struct panthor_gem_object *
> +panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
> +                  struct panthor_vm *exclusive_vm, u32 usage_flags)
> +{
> +       struct panthor_gem_object *bo;
> +       int ret;
>
> -       return &obj->base.base;
> +       bo =3D panthor_gem_alloc_object(flags);
> +       if (IS_ERR(bo))
> +               return bo;
> +
> +       size =3D PAGE_ALIGN(size);
> +       ret =3D drm_gem_object_init(dev, &bo->base, size);
> +       if (ret)
> +               goto err_put;
> +
> +       /* Our buffers are kept pinned, so allocating them
> +        * from the MOVABLE zone is a really bad idea, and
> +        * conflicts with CMA. See comments above new_inode()
> +        * why this is required _and_ expected if you're
> +        * going to pin these pages.
> +        */
> +       mapping_set_gfp_mask(bo->base.filp->f_mapping,
> +                            GFP_HIGHUSER | __GFP_RETRY_MAYFAIL | __GFP_N=
OWARN);
> +
> +       ret =3D drm_gem_create_mmap_offset(&bo->base);
> +       if (ret)
> +               goto err_put;
> +
> +       if (exclusive_vm) {
> +               bo->exclusive_vm_root_gem =3D panthor_vm_root_gem(exclusi=
ve_vm);
> +               drm_gem_object_get(bo->exclusive_vm_root_gem);
> +               bo->base.resv =3D bo->exclusive_vm_root_gem->resv;
> +       }
> +
> +       panthor_gem_debugfs_set_usage_flags(bo, usage_flags);
> +       return bo;
> +
> +err_put:
> +       drm_gem_object_put(&bo->base);
> +       return ERR_PTR(ret);
> +}
> +
> +struct drm_gem_object *
> +panthor_gem_prime_import_sg_table(struct drm_device *dev,
> +                                 struct dma_buf_attachment *attach,
> +                                 struct sg_table *sgt)
> +{
> +       struct panthor_gem_object *bo;
> +       int ret;
> +
> +       bo =3D panthor_gem_alloc_object(0);
> +       if (IS_ERR(bo))
> +               return ERR_CAST(bo);
> +
> +       drm_gem_private_object_init(dev, &bo->base, attach->dmabuf->size)=
;
> +
> +       ret =3D drm_gem_create_mmap_offset(&bo->base);
> +       if (ret)
> +               goto err_put;
> +
> +       bo->dmap.sgt =3D sgt;
> +       return &bo->base;
> +
> +err_put:
> +       drm_gem_object_put(&bo->base);
> +       return ERR_PTR(ret);
>  }
>
>  /**
> @@ -325,54 +828,22 @@ panthor_gem_create_with_handle(struct drm_file *fil=
e,
>                                u64 *size, u32 flags, u32 *handle)
>  {
>         int ret;
> -       struct drm_gem_shmem_object *shmem;
>         struct panthor_gem_object *bo;
>
> -       shmem =3D drm_gem_shmem_create(ddev, *size);
> -       if (IS_ERR(shmem))
> -               return PTR_ERR(shmem);
> -
> -       bo =3D to_panthor_bo(&shmem->base);
> -       bo->flags =3D flags;
> -       bo->base.map_wc =3D should_map_wc(bo, exclusive_vm);
> -
> -       if (exclusive_vm) {
> -               bo->exclusive_vm_root_gem =3D panthor_vm_root_gem(exclusi=
ve_vm);
> -               drm_gem_object_get(bo->exclusive_vm_root_gem);
> -               bo->base.base.resv =3D bo->exclusive_vm_root_gem->resv;
> -       }
> -
> -       panthor_gem_debugfs_set_usage_flags(bo, 0);
> -
> -       /* If this is a write-combine mapping, we query the sgt to force =
a CPU
> -        * cache flush (dma_map_sgtable() is called when the sgt is creat=
ed).
> -        * This ensures the zero-ing is visible to any uncached mapping c=
reated
> -        * by vmap/mmap.
> -        * FIXME: Ideally this should be done when pages are allocated, n=
ot at
> -        * BO creation time.
> -        */
> -       if (shmem->map_wc) {
> -               struct sg_table *sgt;
> -
> -               sgt =3D drm_gem_shmem_get_pages_sgt(shmem);
> -               if (IS_ERR(sgt)) {
> -                       ret =3D PTR_ERR(sgt);
> -                       goto out_put_gem;
> -               }
> -       }
> +       bo =3D panthor_gem_create(ddev, *size, flags, exclusive_vm, 0);
> +       if (IS_ERR(bo))
> +               return PTR_ERR(bo);
>
>         /*
>          * Allocate an id of idr table where the obj is registered
>          * and handle has the id what user can see.
>          */
> -       ret =3D drm_gem_handle_create(file, &shmem->base, handle);
> +       ret =3D drm_gem_handle_create(file, &bo->base, handle);
>         if (!ret)
> -               *size =3D bo->base.base.size;
> +               *size =3D bo->base.size;
>
> -out_put_gem:
>         /* drop reference from allocate - handle holds it now. */
> -       drm_gem_object_put(&shmem->base);
> -
> +       drm_gem_object_put(&bo->base);
>         return ret;
>  }
>
> @@ -417,18 +888,17 @@ panthor_gem_sync(struct drm_gem_object *obj, u32 ty=
pe,
>                  u64 offset, u64 size)
>  {
>         struct panthor_gem_object *bo =3D to_panthor_bo(obj);
> -       struct drm_gem_shmem_object *shmem =3D &bo->base;
> -       const struct drm_device *dev =3D shmem->base.dev;
> +       struct device *dma_dev =3D drm_dev_dma_dev(bo->base.dev);
>         struct sg_table *sgt;
>         struct scatterlist *sgl;
>         unsigned int count;
>
>         /* Make sure the range is in bounds. */
> -       if (offset + size < offset || offset + size > shmem->base.size)
> +       if (offset + size < offset || offset + size > bo->base.size)
>                 return -EINVAL;
>
>         /* Disallow CPU-cache maintenance on imported buffers. */
> -       if (drm_gem_is_imported(&shmem->base))
> +       if (drm_gem_is_imported(&bo->base))
>                 return -EINVAL;
>
>         switch (type) {
> @@ -441,14 +911,14 @@ panthor_gem_sync(struct drm_gem_object *obj, u32 ty=
pe,
>         }
>
>         /* Don't bother if it's WC-mapped */
> -       if (shmem->map_wc)
> +       if (should_map_wc(bo))
>                 return 0;
>
>         /* Nothing to do if the size is zero. */
>         if (size =3D=3D 0)
>                 return 0;
>
> -       sgt =3D drm_gem_shmem_get_pages_sgt(shmem);
> +       sgt =3D panthor_gem_get_dev_sgt(bo);
>         if (IS_ERR(sgt))
>                 return PTR_ERR(sgt);
>
> @@ -489,9 +959,9 @@ panthor_gem_sync(struct drm_gem_object *obj, u32 type=
,
>                  *
>                  * for the flush+invalidate case.
>                  */
> -               dma_sync_single_for_device(dev->dev, paddr, len, DMA_TO_D=
EVICE);
> +               dma_sync_single_for_device(dma_dev, paddr, len, DMA_TO_DE=
VICE);
>                 if (type =3D=3D DRM_PANTHOR_BO_SYNC_CPU_CACHE_FLUSH_AND_I=
NVALIDATE)
> -                       dma_sync_single_for_cpu(dev->dev, paddr, len, DMA=
_FROM_DEVICE);
> +                       dma_sync_single_for_cpu(dma_dev, paddr, len, DMA_=
FROM_DEVICE);
>         }
>
>         return 0;
> @@ -541,7 +1011,6 @@ panthor_kernel_bo_create(struct panthor_device *ptde=
v, struct panthor_vm *vm,
>                          size_t size, u32 bo_flags, u32 vm_map_flags,
>                          u64 gpu_va, const char *name)
>  {
> -       struct drm_gem_shmem_object *obj;
>         struct panthor_kernel_bo *kbo;
>         struct panthor_gem_object *bo;
>         u32 debug_flags =3D PANTHOR_DEBUGFS_GEM_USAGE_FLAG_KERNEL;
> @@ -554,25 +1023,18 @@ panthor_kernel_bo_create(struct panthor_device *pt=
dev, struct panthor_vm *vm,
>         if (!kbo)
>                 return ERR_PTR(-ENOMEM);
>
> -       obj =3D drm_gem_shmem_create(&ptdev->base, size);
> -       if (IS_ERR(obj)) {
> -               ret =3D PTR_ERR(obj);
> -               goto err_free_bo;
> -       }
> -
> -       bo =3D to_panthor_bo(&obj->base);
> -       kbo->obj =3D &obj->base;
> -       bo->flags =3D bo_flags;
> -       bo->base.map_wc =3D should_map_wc(bo, vm);
> -       bo->exclusive_vm_root_gem =3D panthor_vm_root_gem(vm);
> -       drm_gem_object_get(bo->exclusive_vm_root_gem);
> -       bo->base.base.resv =3D bo->exclusive_vm_root_gem->resv;
> -
>         if (vm =3D=3D panthor_fw_vm(ptdev))
>                 debug_flags |=3D PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED=
;
>
> +       bo =3D panthor_gem_create(&ptdev->base, size, bo_flags, vm, debug=
_flags);
> +       if (IS_ERR(bo)) {
> +               ret =3D PTR_ERR(bo);
> +               goto err_free_kbo;
> +       }
> +
> +       kbo->obj =3D &bo->base;
> +
>         panthor_gem_kernel_bo_set_label(kbo, name);
> -       panthor_gem_debugfs_set_usage_flags(to_panthor_bo(kbo->obj), debu=
g_flags);
>
>         /* The system and GPU MMU page size might differ, which becomes a
>          * problem for FW sections that need to be mapped at explicit add=
ress
> @@ -596,9 +1058,9 @@ panthor_kernel_bo_create(struct panthor_device *ptde=
v, struct panthor_vm *vm,
>         panthor_vm_free_va(vm, &kbo->va_node);
>
>  err_put_obj:
> -       drm_gem_object_put(&obj->base);
> +       drm_gem_object_put(&bo->base);
>
> -err_free_bo:
> +err_free_kbo:
>         kfree(kbo);
>         return ERR_PTR(ret);
>  }
> @@ -646,7 +1108,7 @@ static void panthor_gem_debugfs_bo_print(struct pant=
hor_gem_object *bo,
>                                          struct seq_file *m,
>                                          struct gem_size_totals *totals)
>  {
> -       unsigned int refcount =3D kref_read(&bo->base.base.refcount);
> +       unsigned int refcount =3D kref_read(&bo->base.refcount);
>         char creator_info[32] =3D {};
>         size_t resident_size;
>         u32 gem_usage_flags =3D bo->debugfs.flags;
> @@ -656,21 +1118,21 @@ static void panthor_gem_debugfs_bo_print(struct pa=
nthor_gem_object *bo,
>         if (!refcount)
>                 return;
>
> -       resident_size =3D bo->base.pages ? bo->base.base.size : 0;
> +       resident_size =3D bo->backing.pages ? bo->base.size : 0;
>
>         snprintf(creator_info, sizeof(creator_info),
>                  "%s/%d", bo->debugfs.creator.process_name, bo->debugfs.c=
reator.tgid);
>         seq_printf(m, "%-32s%-16d%-16d%-16zd%-16zd0x%-16lx",
>                    creator_info,
> -                  bo->base.base.name,
> +                  bo->base.name,
>                    refcount,
> -                  bo->base.base.size,
> +                  bo->base.size,
>                    resident_size,
> -                  drm_vma_node_start(&bo->base.base.vma_node));
> +                  drm_vma_node_start(&bo->base.vma_node));
>
> -       if (bo->base.base.import_attach)
> +       if (bo->base.import_attach)
>                 gem_state_flags |=3D PANTHOR_DEBUGFS_GEM_STATE_FLAG_IMPOR=
TED;
> -       if (bo->base.base.dma_buf)
> +       if (bo->base.dma_buf)
>                 gem_state_flags |=3D PANTHOR_DEBUGFS_GEM_STATE_FLAG_EXPOR=
TED;
>
>         seq_printf(m, "0x%-8x 0x%-10x", gem_state_flags, gem_usage_flags)=
;
> @@ -679,10 +1141,8 @@ static void panthor_gem_debugfs_bo_print(struct pan=
thor_gem_object *bo,
>                 seq_printf(m, "%s\n", bo->label.str ? : "");
>         }
>
> -       totals->size +=3D bo->base.base.size;
> +       totals->size +=3D bo->base.size;
>         totals->resident +=3D resident_size;
> -       if (bo->base.madv > 0)
> -               totals->reclaimable +=3D resident_size;
>  }
>
>  static void panthor_gem_debugfs_print_bos(struct panthor_device *ptdev,
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/pant=
hor/panthor_gem.h
> index 94b2d17cf032..b66478c9590c 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.h
> +++ b/drivers/gpu/drm/panthor/panthor_gem.h
> @@ -5,7 +5,7 @@
>  #ifndef __PANTHOR_GEM_H__
>  #define __PANTHOR_GEM_H__
>
> -#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_gem.h>
>  #include <drm/drm_mm.h>
>
>  #include <linux/iosys-map.h>
> @@ -60,12 +60,51 @@ struct panthor_gem_debugfs {
>         u32 flags;
>  };
>
> +/**
> + * struct panthor_gem_backing - GEM memory backing related data
> + */
> +struct panthor_gem_backing {
> +       /** @pages: Pages requested with drm_gem_get_pages() */
> +       struct page **pages;
> +
> +       /** @pin_count: Number of active pin requests on this GEM */
> +       refcount_t pin_count;
> +};
> +
> +/**
> + * struct panthor_gem_cpu_map - GEM CPU mapping related data
> + */
> +struct panthor_gem_cpu_map {
> +       /** @vaddr: Address returned by vmap() */
> +       void *vaddr;
> +
> +       /** @vaddr_use_count: Number of active vmap() requests on this GE=
M */
> +       refcount_t vaddr_use_count;
> +};
> +
> +/**
> + * struct panthor_gem_dev_map - GEM device mapping related data
> + */
> +struct panthor_gem_dev_map {
> +       /** @sgt: Device mapped sg_table for this GEM */
> +       struct sg_table *sgt;
> +};
> +
>  /**
>   * struct panthor_gem_object - Driver specific GEM object.
>   */
>  struct panthor_gem_object {
> -       /** @base: Inherit from drm_gem_shmem_object. */
> -       struct drm_gem_shmem_object base;
> +       /** @base: Inherit from drm_gem_object. */
> +       struct drm_gem_object base;
> +
> +       /** @backing: Memory backing state */
> +       struct panthor_gem_backing backing;
> +
> +       /** @cmap: CPU mapping state */
> +       struct panthor_gem_cpu_map cmap;
> +
> +       /** @dmap: Device mapping state */
> +       struct panthor_gem_dev_map dmap;
>
>         /**
>          * @exclusive_vm_root_gem: Root GEM of the exclusive VM this GEM =
object
> @@ -130,22 +169,25 @@ struct panthor_kernel_bo {
>         void *kmap;
>  };
>
> -static inline
> -struct panthor_gem_object *to_panthor_bo(struct drm_gem_object *obj)
> -{
> -       return container_of(to_drm_gem_shmem_obj(obj), struct panthor_gem=
_object, base);
> -}
> +#define to_panthor_bo(obj) container_of_const(obj, struct panthor_gem_ob=
ject, base)
>
>  void panthor_gem_init(struct panthor_device *ptdev);
>
> -struct drm_gem_object *panthor_gem_create_object(struct drm_device *ddev=
, size_t size);
> -
> +struct drm_gem_object *
> +panthor_gem_prime_import_sg_table(struct drm_device *dev,
> +                                 struct dma_buf_attachment *attach,
> +                                 struct sg_table *sgt);
>  int
>  panthor_gem_create_with_handle(struct drm_file *file,
>                                struct drm_device *ddev,
>                                struct panthor_vm *exclusive_vm,
>                                u64 *size, u32 flags, uint32_t *handle);
>
> +struct sg_table *
> +panthor_gem_get_dev_sgt(struct panthor_gem_object *bo);
> +int panthor_gem_pin(struct panthor_gem_object *bo);
> +void panthor_gem_unpin(struct panthor_gem_object *bo);
> +
>  void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *la=
bel);
>  void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const=
 char *label);
>  int panthor_gem_sync(struct drm_gem_object *obj,
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index 99c794c429ca..dc2d653edf12 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -5,6 +5,7 @@
>  #include <drm/drm_debugfs.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_exec.h>
> +#include <drm/drm_file.h>
>  #include <drm/drm_gpuvm.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
> @@ -1083,8 +1084,7 @@ static void panthor_vm_bo_free(struct drm_gpuvm_bo =
*vm_bo)
>  {
>         struct panthor_gem_object *bo =3D to_panthor_bo(vm_bo->obj);
>
> -       if (!drm_gem_is_imported(&bo->base.base))
> -               drm_gem_shmem_unpin(&bo->base);
> +       panthor_gem_unpin(bo);
>         kfree(vm_bo);
>  }
>
> @@ -1206,7 +1206,7 @@ static int panthor_vm_prepare_map_op_ctx(struct pan=
thor_vm_op_ctx *op_ctx,
>                 return -EINVAL;
>
>         /* Make sure the VA and size are in-bounds. */
> -       if (size > bo->base.base.size || offset > bo->base.base.size - si=
ze)
> +       if (size > bo->base.size || offset > bo->base.size - size)
>                 return -EINVAL;
>
>         /* If the BO has an exclusive VM attached, it can't be mapped to =
other VMs. */
> @@ -1223,39 +1223,30 @@ static int panthor_vm_prepare_map_op_ctx(struct p=
anthor_vm_op_ctx *op_ctx,
>         if (ret)
>                 goto err_cleanup;
>
> -       if (!drm_gem_is_imported(&bo->base.base)) {
> -               /* Pre-reserve the BO pages, so the map operation doesn't=
 have to
> -                * allocate. This pin is dropped in panthor_vm_bo_free(),=
 so
> -                * once we have successfully called drm_gpuvm_bo_create()=
,
> -                * GPUVM will take care of dropping the pin for us.
> -                */
> -               ret =3D drm_gem_shmem_pin(&bo->base);
> -               if (ret)
> -                       goto err_cleanup;
> -       }
> +       /* Pre-reserve the BO pages, so the map operation doesn't have to
> +        * allocate.
> +        */
> +       ret =3D panthor_gem_pin(bo);
> +       if (ret)
> +               goto err_cleanup;
>
> -       sgt =3D drm_gem_shmem_get_pages_sgt(&bo->base);
> +       sgt =3D panthor_gem_get_dev_sgt(bo);
>         if (IS_ERR(sgt)) {
> -               if (!drm_gem_is_imported(&bo->base.base))
> -                       drm_gem_shmem_unpin(&bo->base);
> -
> +               panthor_gem_unpin(bo);
>                 ret =3D PTR_ERR(sgt);
>                 goto err_cleanup;
>         }
>
>         op_ctx->map.sgt =3D sgt;
>
> -       preallocated_vm_bo =3D drm_gpuvm_bo_create(&vm->base, &bo->base.b=
ase);
> +       preallocated_vm_bo =3D drm_gpuvm_bo_create(&vm->base, &bo->base);
>         if (!preallocated_vm_bo) {
> -               if (!drm_gem_is_imported(&bo->base.base))
> -                       drm_gem_shmem_unpin(&bo->base);
> -
> +               panthor_gem_unpin(bo);
>                 ret =3D -ENOMEM;
>                 goto err_cleanup;
>         }
>
>         op_ctx->map.vm_bo =3D drm_gpuvm_bo_obtain_prealloc(preallocated_v=
m_bo);
> -
>         op_ctx->map.bo_offset =3D offset;
>
>         /* L1, L2 and L3 page tables.
> @@ -1284,7 +1275,7 @@ static int panthor_vm_prepare_map_op_ctx(struct pan=
thor_vm_op_ctx *op_ctx,
>         }
>
>         /* Insert BO into the extobj list last, when we know nothing can =
fail. */
> -       if (bo->base.base.resv !=3D panthor_vm_resv(vm)) {
> +       if (bo->base.resv !=3D panthor_vm_resv(vm)) {
>                 dma_resv_lock(panthor_vm_resv(vm), NULL);
>                 drm_gpuvm_bo_extobj_add(op_ctx->map.vm_bo);
>                 dma_resv_unlock(panthor_vm_resv(vm));
> @@ -2056,9 +2047,9 @@ static void panthor_vma_link(struct panthor_vm *vm,
>  {
>         struct panthor_gem_object *bo =3D to_panthor_bo(vma->base.gem.obj=
);
>
> -       mutex_lock(&bo->base.base.gpuva.lock);
> +       mutex_lock(&bo->base.gpuva.lock);
>         drm_gpuva_link(&vma->base, vm_bo);
> -       mutex_unlock(&bo->base.base.gpuva.lock);
> +       mutex_unlock(&bo->base.gpuva.lock);
>  }
>
>  static void panthor_vma_unlink(struct panthor_vma *vma)
> @@ -2110,11 +2101,12 @@ static int panthor_gpuva_sm_step_map(struct drm_g=
puva_op *op, void *priv)
>  static bool
>  iova_mapped_as_huge_page(struct drm_gpuva_op_map *op, u64 addr)
>  {
> +       struct panthor_gem_object *bo =3D to_panthor_bo(op->gem.obj);
>         const struct page *pg;
>         pgoff_t bo_offset;
>
>         bo_offset =3D addr - op->va.addr + op->gem.offset;
> -       pg =3D to_panthor_bo(op->gem.obj)->base.pages[bo_offset >> PAGE_S=
HIFT];
> +       pg =3D bo->backing.pages[bo_offset >> PAGE_SHIFT];
>
>         return folio_size(page_folio(pg)) >=3D SZ_2M;
>  }
> @@ -2183,7 +2175,7 @@ static int panthor_gpuva_sm_step_remap(struct drm_g=
puva_op *op,
>                 u64 size =3D op->remap.prev->va.addr + op->remap.prev->va=
.range - unmap_start;
>
>                 ret =3D panthor_vm_map_pages(vm, unmap_start, flags_to_pr=
ot(unmap_vma->flags),
> -                                          bo->base.sgt, offset, size);
> +                                          bo->dmap.sgt, offset, size);
>                 if (ret)
>                         return ret;
>
> @@ -2197,7 +2189,7 @@ static int panthor_gpuva_sm_step_remap(struct drm_g=
puva_op *op,
>                 u64 size =3D unmap_start + unmap_range - op->remap.next->=
va.addr;
>
>                 ret =3D panthor_vm_map_pages(vm, addr, flags_to_prot(unma=
p_vma->flags),
> -                                          bo->base.sgt, op->remap.next->=
gem.offset, size);
> +                                          bo->dmap.sgt, op->remap.next->=
gem.offset, size);
>                 if (ret)
>                         return ret;
>
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index ca272dbae14d..2ddf64870d85 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -3,7 +3,7 @@
>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_exec.h>
> -#include <drm/drm_gem_shmem_helper.h>
> +#include <drm/drm_file.h>
>  #include <drm/drm_managed.h>
>  #include <drm/drm_print.h>
>  #include <drm/gpu_scheduler.h>
> @@ -871,8 +871,7 @@ panthor_queue_get_syncwait_obj(struct panthor_group *=
group, struct panthor_queue
>         int ret;
>
>         if (queue->syncwait.kmap) {
> -               bo =3D container_of(queue->syncwait.obj,
> -                                 struct panthor_gem_object, base.base);
> +               bo =3D to_panthor_bo(queue->syncwait.obj);
>                 goto out_sync;
>         }
>
> @@ -882,7 +881,7 @@ panthor_queue_get_syncwait_obj(struct panthor_group *=
group, struct panthor_queue
>         if (drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(bo)))
>                 goto err_put_syncwait_obj;
>
> -       queue->syncwait.obj =3D &bo->base.base;
> +       queue->syncwait.obj =3D &bo->base;
>         ret =3D drm_gem_vmap(queue->syncwait.obj, &map);
>         if (drm_WARN_ON(&ptdev->base, ret))
>                 goto err_put_syncwait_obj;
> @@ -896,7 +895,7 @@ panthor_queue_get_syncwait_obj(struct panthor_group *=
group, struct panthor_queue
>          * drm_gem_shmem_sync() is a NOP if map_wc=3Dtrue, so no need to =
check
>          * it here.
>          */
> -       panthor_gem_sync(&bo->base.base, queue->syncwait.offset,
> +       panthor_gem_sync(&bo->base, queue->syncwait.offset,
>                          queue->syncwait.sync64 ?
>                          sizeof(struct panthor_syncobj_64b) :
>                          sizeof(struct panthor_syncobj_32b),
> --
> 2.52.0
>
