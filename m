Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC954434AF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 18:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9F67345B;
	Tue,  2 Nov 2021 17:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA6773459;
 Tue,  2 Nov 2021 17:41:08 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id bm28so5285030qkb.9;
 Tue, 02 Nov 2021 10:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=P9YYDqayKKiXR5zgaHetXT8800BD2UqRM7ErgFSyw/M=;
 b=O+6xzSBXXJe0MxpF2Mf6VpPBYtYwWe8jBjBysHFfHDXov4QSr75ZS922TtGiObobFe
 VZQz6uzc0D2pyQEAuqlhOsjT4aEchVozTWotCDKQTDCV98wj/hOFXxbtHsUdyooJXAm2
 9f+3KNqx+GIDODHdCGM3E7P7mftQDQfLvCJyf3zmqDu5/09p0ZAeb/RLW/grV5seRC2W
 alan7jMBpAItcFXb6wqMA69dZyKu2gsPyYJjSbAlVEplmwtrPncEIq0JtdvjO8djp2cr
 SicMMM2WC0wLLM+jp2RgEkcLB6yUYHhtudyEw0L4JGp4+v1vWKDwWrWlIeZG0MMj3hYS
 TE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=P9YYDqayKKiXR5zgaHetXT8800BD2UqRM7ErgFSyw/M=;
 b=TovtbJqlk2d7/cmZBlevxoOpDn5+y0v5YstClYsyEoJt3Wt+0rk7nrXfUg64IYtTuc
 77PkEvOa54c4U2GsS3ypysLmqWG86+a+Px8iOY1Q+3iAUeW9vmHl3NcPFo05jtkCH66u
 CBr9X1CI7osglNCXUhwj7tMcHi2PhC7Cw0v+JnqfmFQ/jxKffKNgPHuC8yE/5lJAGTV8
 nSKElLnVYY8Z/kWc0LwciyTfPqPSw0FOdFuLhW/2fDd/FN8PDFiM3clmbAMvLSH912+t
 Q6LHBv1/pGesS0uIqVH8wJFRksRfAv54toUzHQaSjYUpC/jkySg5T8QVbaHVj9UEWrPB
 L6zQ==
X-Gm-Message-State: AOAM533OzINAheQHK9UVjvnh6SF/UMFwHUjekiVZuJZQmtF7IxmOPdnR
 Yr6sWEA6DpN2tupRXRKFw5vRr5fLnAPN1OfTlj0=
X-Google-Smtp-Source: ABdhPJwcjGlvh+QLMK1UQnMXLHe6GWCh0a7nbrncR4YsvWYg7mb3tzhVkqDRTOLmeefLkd1Lx+srUQ1RWbx6+pnK0MM=
X-Received: by 2002:a05:620a:29c3:: with SMTP id
 s3mr5914858qkp.342.1635874867316; 
 Tue, 02 Nov 2021 10:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211102163425.505732-1-thomas.hellstrom@linux.intel.com>
 <20211102163425.505732-3-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20211102163425.505732-3-thomas.hellstrom@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 2 Nov 2021 17:40:41 +0000
Message-ID: <CAM0jSHO-ZUP39Rw=Nm=wUrNEhCzhVG_ve+3we8gWzSkoisn4yQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/i915/ttm: Failsafe migration blits
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2 Nov 2021 at 16:39, Thomas Hellstr=C3=B6m
<thomas.hellstrom@linux.intel.com> wrote:
>
> If the initial fill blit or copy blit of an object fails, the old
> content of the data might be exposed and read as soon as either CPU- or
> GPU PTEs are set up to point at the pages.
>
> Intercept the blit fence with an async callback that checks the
> blit fence for errors and if there are errors performs an async cpu blit
> instead. If there is a failure to allocate the async dma_fence_work,
> allocate it on the stack and sync wait for the blit to complete.
>
> Add selftests that simulate gpu blit failures and failure to allocate
> the async dma_fence_work.
>
> A previous version of this pach used dma_fence_work, now that's
> opencoded which adds more code but might lower the latency
> somewhat in the common non-error case.
>
> v3:
> - Style fixes (Matthew Auld)
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 322 +++++++++++++++---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h  |   5 +
>  .../drm/i915/gem/selftests/i915_gem_migrate.c |  24 +-
>  3 files changed, 295 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_ttm_move.c
> index 0ed6b7f2b95f..b89672c547f8 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
> @@ -18,6 +18,29 @@
>  #include "gt/intel_gt.h"
>  #include "gt/intel_migrate.h"
>
> +/**
> + * DOC: Selftest failure modes for failsafe migration:
> + *
> + * For fail_gpu_migration, the gpu blit scheduled is always a clear blit
> + * rather than a copy blit, and then we force the failure paths as if
> + * the blit fence returned an error.
> + *
> + * For fail_work_allocation we fail the kmalloc of the async worker, we
> + * sync the gpu blit. If it then fails, or fail_gpu_migration is set to
> + * true, then a memcpy operation is performed sync.
> + */
> +#ifdef CONFIG_DRM_I915_SELFTEST

When pushing maybe make this:

#if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)

Which seems to be consistent with most of the other places.

> +static bool fail_gpu_migration;
> +static bool fail_work_allocation;
> +
> +void i915_ttm_migrate_set_failure_modes(bool gpu_migration,
> +                                       bool work_allocation)
> +{
> +       fail_gpu_migration =3D gpu_migration;
> +       fail_work_allocation =3D work_allocation;
> +}
> +#endif
> +
