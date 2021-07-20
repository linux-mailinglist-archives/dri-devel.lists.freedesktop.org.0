Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8B73CF85E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 12:53:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E103D89842;
	Tue, 20 Jul 2021 10:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 538D989471;
 Tue, 20 Jul 2021 10:53:50 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id o31so4489742qvo.1;
 Tue, 20 Jul 2021 03:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tBTuc7Iq+lu2XvSD42SCyxBWmZoIbcrFIOYn6sxO2MA=;
 b=u/sCtSBXopKFzZ7rKpa4aAov0T0h0KP7k6FZ66WuFV/XLTwp2oKbC2tZyAEzdCg1Vf
 KN6XHFQykKohgCv6KCl+gsWNq3iTGAdFEJh4u0FX+1VR/02JC/Eh5l8yuyI2N49dGqx4
 pxiIpGXPvPWLWVokMMdp48MhgOgw3c8AK45EdUp/CZq5WEbrQFSCAvkNxvWqTMlVr+a2
 kEUUJVgFzzaxgB9SBlcdBOge8z0ItmfLLVn1iiASxaTCEOaMwe6fUYnIWeyHfTU2pRm6
 oUJ6vYLuI4kxtM1+hzB/lEGFK9U59LXpNk+q/ADID3Wzc2EZ566mxrgp1QjZDHmYx4w5
 s75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tBTuc7Iq+lu2XvSD42SCyxBWmZoIbcrFIOYn6sxO2MA=;
 b=DzE894s40EQjD+XIKxwVc3mKMDIMck5aFHvkfl8UWoogD9QbPpNQOAW5vV1qyAxs1L
 bMDQ24gpi52qKpwh/ap0x+ZYAy9zF675dXqJREWqPJfgpHWT9ap8xG7Zi2CYJCPPRTWQ
 j9ZJTvbtf5vV+SC/d725RFtZno4MFlylwvhlsiPp+EY7cDIe0qUXAPETZIsVp7ZzCwfd
 kaX1x5RHlDloF9RJ0WD1ai9qG08jZwaTxC22UaXoG34kK/LMTJwucFSEKIz/y3YBWav8
 xyksq/P03zdnz4FAAFWo0q1GOirc3ojR9DtEmlSW0KcTTk9rmxsmaDQdwNFJ9jYNmAX5
 Sgfw==
X-Gm-Message-State: AOAM533fUBmiP5IRufIcU/Ixa8+tihfIZdZHbQdigs+XMdKuCUoBOtPy
 ZPgWDyRu2AiESR9m0Y5D8cvXDK77fBNcjtrZbws=
X-Google-Smtp-Source: ABdhPJxk4noqhD14HYiC9qf+OnA/igIkF3Gys1IvWYFDq+IYVjrCCCIPhf2OR/9S76fKUtxLYaubfL0ZoQH78qsS9Eg=
X-Received: by 2002:a0c:e54e:: with SMTP id n14mr29732005qvm.41.1626778429663; 
 Tue, 20 Jul 2021 03:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210716141426.1904528-1-jason@jlekstrand.net>
 <20210716141426.1904528-8-jason@jlekstrand.net>
In-Reply-To: <20210716141426.1904528-8-jason@jlekstrand.net>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 20 Jul 2021 11:53:23 +0100
Message-ID: <CAM0jSHNqgEpt6cjm3yERyPFN8jXDiSi8zUfLM4PpZL3jroXsmQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 7/7] drm/i915/gem: Migrate to system at
 dma-buf attach time (v6)
To: Jason Ekstrand <jason@jlekstrand.net>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Jul 2021 at 15:14, Jason Ekstrand <jason@jlekstrand.net> wrote:
>
> From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>
> Until we support p2p dma or as a complement to that, migrate data
> to system memory at dma-buf attach time if possible.
>
> v2:
> - Rebase on dynamic exporter. Update the igt_dmabuf_import_same_driver
>   selftest to migrate if we are LMEM capable.
> v3:
> - Migrate also in the pin() callback.
> v4:
> - Migrate in attach
> v5: (jason)
> - Lock around the migration
> v6: (jason)
> - Move the can_migrate check outside the lock
> - Rework the selftests to test more migration conditions.  In
>   particular, SMEM, LMEM, and LMEM+SMEM are all checked.
>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_create.c    |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    | 23 ++++-
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  4 +
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 89 ++++++++++++++++++-
>  4 files changed, 112 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm=
/i915/gem/i915_gem_create.c
> index 039e4f3b39c79..41c4cd3e1ea01 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> @@ -82,7 +82,7 @@ static int i915_gem_publish(struct drm_i915_gem_object =
*obj,
>         return 0;
>  }
>
> -static struct drm_i915_gem_object *
> +struct drm_i915_gem_object *
>  i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
>                             struct intel_memory_region **placements,
>                             unsigned int n_placements)
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm=
/i915/gem/i915_gem_dmabuf.c
> index 9a655f69a0671..5d438b95826b9 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -170,8 +170,29 @@ static int i915_gem_dmabuf_attach(struct dma_buf *dm=
abuf,
>                                   struct dma_buf_attachment *attach)
>  {
>         struct drm_i915_gem_object *obj =3D dma_buf_to_obj(dmabuf);
> +       struct i915_gem_ww_ctx ww;
> +       int err;
> +
> +       if (!i915_gem_object_can_migrate(obj, INTEL_REGION_SMEM))
> +               return -EOPNOTSUPP;
> +
> +       for_i915_gem_ww(&ww, err, true) {
> +               err =3D i915_gem_object_lock(obj, &ww);
> +               if (err)
> +                       continue;
> +
> +               err =3D i915_gem_object_migrate(obj, &ww, INTEL_REGION_SM=
EM);
> +               if (err)
> +                       continue;
>
> -       return i915_gem_object_pin_pages_unlocked(obj);
> +               err =3D i915_gem_object_wait_migration(obj, 0);
> +               if (err)
> +                       continue;
> +
> +               err =3D i915_gem_object_pin_pages(obj);
> +       }
> +
> +       return err;
>  }
>
>  static void i915_gem_dmabuf_detach(struct dma_buf *dmabuf,
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm=
/i915/gem/i915_gem_object.h
> index 8be4fadeee487..fbae53bd46384 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
> @@ -61,6 +61,10 @@ i915_gem_object_create_shmem(struct drm_i915_private *=
i915,
>  struct drm_i915_gem_object *
>  i915_gem_object_create_shmem_from_data(struct drm_i915_private *i915,
>                                        const void *data, resource_size_t =
size);
> +struct drm_i915_gem_object *
> +i915_gem_object_create_user(struct drm_i915_private *i915, u64 size,
> +                           struct intel_memory_region **placements,
> +                           unsigned int n_placements);
>
>  extern const struct drm_i915_gem_object_ops i915_gem_shmem_ops;
>
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drive=
rs/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index 4451bbb4917e4..7b7647e7e220a 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -85,9 +85,62 @@ static int igt_dmabuf_import_self(void *arg)
>         return err;
>  }
>
> -static int igt_dmabuf_import_same_driver(void *arg)
> +static int igt_dmabuf_import_same_driver_lmem(void *arg)
>  {
>         struct drm_i915_private *i915 =3D arg;
> +       struct intel_memory_region *lmem =3D i915->mm.regions[INTEL_REGIO=
N_LMEM];
> +       struct drm_i915_gem_object *obj;
> +       struct drm_gem_object *import;
> +       struct dma_buf *dmabuf;
> +       int err;
> +
> +       if (!i915->mm.regions[INTEL_REGION_LMEM])

!lmem

> +               return 0;
> +
> +       force_different_devices =3D true;
> +
> +       obj =3D i915_gem_object_create_user(i915, PAGE_SIZE, &lmem, 1);
> +       if (IS_ERR(obj)) {
> +               pr_err("i915_gem_object_create_user failed with err=3D%d\=
n",
> +                      (int)PTR_ERR(dmabuf));

PTR_ERR(obj)

> +               err =3D PTR_ERR(obj);
> +               goto out_ret;
> +       }
> +
> +       dmabuf =3D i915_gem_prime_export(&obj->base, 0);
> +       if (IS_ERR(dmabuf)) {
> +               pr_err("i915_gem_prime_export failed with err=3D%d\n",
> +                      (int)PTR_ERR(dmabuf));
> +               err =3D PTR_ERR(dmabuf);
> +               goto out;
> +       }
> +
> +       /* We expect an import of an LMEM-only object to fail with
> +        * -EOPNOTSUPP because it can't be migrated to SMEM.
> +        */

/*
 * We expect...
 */

> +       import =3D i915_gem_prime_import(&i915->drm, dmabuf);
> +       if (!IS_ERR(import)) {
> +               drm_gem_object_put(import);
> +               pr_err("i915_gem_prime_import succeeded when it shouldn't=
 have\n");
> +               err =3D -EINVAL;
> +       } else if (PTR_ERR(import) !=3D -EOPNOTSUPP) {
> +               pr_err("i915_gem_prime_import failed with the wrong err=
=3D%d\n",
> +                      (int)PTR_ERR(import));
> +               err =3D PTR_ERR(import);
> +       }
> +
> +       dma_buf_put(dmabuf);
> +out:
> +       i915_gem_object_put(obj);
> +out_ret:
> +       force_different_devices =3D false;
> +       return err;
> +}
> +
> +static int igt_dmabuf_import_same_driver(struct drm_i915_private *i915,
> +                                        struct intel_memory_region **reg=
ions,
> +                                        unsigned int num_regions)
> +{
>         struct drm_i915_gem_object *obj, *import_obj;
>         struct drm_gem_object *import;
>         struct dma_buf *dmabuf;
> @@ -97,9 +150,15 @@ static int igt_dmabuf_import_same_driver(void *arg)
>         int err;
>
>         force_different_devices =3D true;
> -       obj =3D i915_gem_object_create_shmem(i915, PAGE_SIZE);
> -       if (IS_ERR(obj))
> +
> +       obj =3D i915_gem_object_create_user(i915, PAGE_SIZE,
> +                                         regions, num_regions);
> +       if (IS_ERR(obj)) {
> +               pr_err("i915_gem_object_create_user failed with err=3D%d\=
n",
> +                      (int)PTR_ERR(dmabuf));

PTR_ERR(obj)

> +               err =3D PTR_ERR(obj);
>                 goto out_ret;
> +       }
>
>         dmabuf =3D i915_gem_prime_export(&obj->base, 0);
>         if (IS_ERR(dmabuf)) {
> @@ -174,6 +233,26 @@ static int igt_dmabuf_import_same_driver(void *arg)
>         return err;
>  }
>
> +static int igt_dmabuf_import_same_driver_smem(void *arg)
> +{
> +       struct drm_i915_private *i915 =3D arg;
> +       struct intel_memory_region *smem =3D i915->mm.regions[INTEL_REGIO=
N_SMEM];

Newline.

> +       return igt_dmabuf_import_same_driver(i915, &smem, 1);
> +}
> +
> +static int igt_dmabuf_import_same_driver_lmem_smem(void *arg)
> +{
> +       struct drm_i915_private *i915 =3D arg;
> +       struct intel_memory_region *regions[2];
> +
> +       if (!i915->mm.regions[INTEL_REGION_LMEM])
> +               return 0;
> +
> +       regions[0] =3D i915->mm.regions[INTEL_REGION_LMEM];
> +       regions[1] =3D i915->mm.regions[INTEL_REGION_SMEM];
> +       return igt_dmabuf_import_same_driver(i915, regions, 2);
> +}
> +
>  static int igt_dmabuf_import(void *arg)
>  {
>         struct drm_i915_private *i915 =3D arg;
> @@ -384,7 +463,9 @@ int i915_gem_dmabuf_live_selftests(struct drm_i915_pr=
ivate *i915)
>  {
>         static const struct i915_subtest tests[] =3D {
>                 SUBTEST(igt_dmabuf_export),
> -               SUBTEST(igt_dmabuf_import_same_driver),
> +               SUBTEST(igt_dmabuf_import_same_driver_lmem),
> +               SUBTEST(igt_dmabuf_import_same_driver_smem),
> +               SUBTEST(igt_dmabuf_import_same_driver_lmem_smem),
>         };
>
>         return i915_subtests(tests, i915);
> --
> 2.31.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
