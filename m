Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B83AE5E10
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 09:39:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02AF10E4F0;
	Tue, 24 Jun 2025 07:38:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SyQxSY+b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2CF10E4ED
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 07:38:56 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-61169c35f2aso26002eaf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 00:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750750735; x=1751355535; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/btdfiDxU5+NfLXwgveKgggXqAGO0bFMTRE67tAX7B4=;
 b=SyQxSY+bhX5kHl/mzZRPccYGmcm5Y2vLkoIiP2qGzw0oxdZLi1OrVc+jZw5DD1FKN3
 oHL94JX6gGdDQ9000rakixa+yDghVIFitMuKHU06r50OYOuHmVGYr2NiTaAQ6L4wLrHL
 hWovnDFCyLtWm2hN786WRxyQHaEk8nMqe9xEi7hFYNY4k198hNkb5SDOaFlsDvGJ9usV
 ZwjQ2sIBMzOftBPEJ2gy1d1Y2JbjcayFDH3oY3AjMtKI3uDMPTR9uFMPTejLLJ6DPej+
 2ii+OzewsiLBWGTFJLQC1Vl9Jjy+9L2H589iE1pzXO8Vo9tVkyAO4szbP48HoZkZwP7t
 D/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750750735; x=1751355535;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/btdfiDxU5+NfLXwgveKgggXqAGO0bFMTRE67tAX7B4=;
 b=GnqLNQAG+yzw/RU+/tN7NYstCWkiHw67mUgNhSTaFBN+nJSJPOcw6GZBX/xie2g2o7
 +sMnbqGxu8eybYrfTnhkVInj4oZeTKyceptXBE+yO1jNURmR7fVfFYVhD1/3Sjbyn72F
 8dtLUNrUhbFLNzLU6kBSNUpr10pdaPlQcwjACjLEVbWbag5HwqMigOSoHK19QlPvOpJ2
 i203Y4dvXkSx193Rla7LKVNCq47WU7+yqsZrnsfzZj6b3VSx222ovs4pDN4FNTXNhyKf
 Nu9gZJH5VoUC0GQgw2waZGYQm9UauOtRZWP6IZ49OFjPFS47/8uWW1EypZ/dz/q5dTXw
 JYDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGezTWRlqlCtLIvzT9mSkXpT/ha0Kqq62NdDSnhfYj4ka4MEdUZERP1pk+DG1o8nvtFDdEaJ8vZTk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxf2RKF+7RMHqjjIFOOzfEul9OLH9GXldwQzFtrWkRmjv0K9s4I
 MaH2ugtt6byTiJhBUqBgxpbJQ/M6cZtVUfltAmFa8d1vRgOGVmChmqoC1AligE78R6ld85e4nK/
 H1XytZbM5JmqYUXhiFCZ4+L1WeZlAxicQ1JTCGngDlQ==
X-Gm-Gg: ASbGncvt2DRb6KvePpm4rnKkszI4u9/Cp3zsba18vbPBm3WWggaARKd6gMxqZnAIUwL
 HpuQf3F757MmPLK2HQ3Xt+LNF+lmK+piBDpDhr7UmasRjgCJrlx9LyLMHGt/2nz5NdgXnAZuDxm
 x3hxeZJV0nqIc1ntjESP4p41cBB8QY8XAsxAKffKdxezog
X-Google-Smtp-Source: AGHT+IFv5Vd9I2g8ShfadWNai4MGcPsTVNYM9JBJbAh0Rl83gxR175ZIBNF3BJDM4El7jyE4KTKddR9JG2+zTp5dAx4=
X-Received: by 2002:a05:6820:f08:b0:611:4042:bcfa with SMTP id
 006d021491bc7-6115ba3be83mr13813272eaf.6.1750750735187; Tue, 24 Jun 2025
 00:38:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
 <20250610131600.2972232-8-jens.wiklander@linaro.org>
 <2d93ee96-0c36-4651-b6ad-9fddd0f6ad88@oss.qualcomm.com>
In-Reply-To: <2d93ee96-0c36-4651-b6ad-9fddd0f6ad88@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 24 Jun 2025 09:38:43 +0200
X-Gm-Features: AX0GCFuM5JcuB2movGdmuDiMPV5NoYMd-NK6xp4w95s0PznpYBirMN1LlHfC1B8
Message-ID: <CAHUa44GXCVaShPhw_Yw0+CWovX+pi7=UOXXGr5dKKSXz4JppeA@mail.gmail.com>
Subject: Re: [PATCH v10 7/9] optee: support protected memory allocation
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Garg <sumit.garg@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com
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

Hi Amir,

On Tue, Jun 24, 2025 at 8:54=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Hi Jens,
>
> On 6/10/2025 11:13 PM, Jens Wiklander wrote:
> > Add support in the OP-TEE backend driver for protected memory
> > allocation. The support is limited to only the SMC ABI and for secure
> > video buffers.
> >
> > OP-TEE is probed for the range of protected physical memory and a
> > memory pool allocator is initialized if OP-TEE have support for such
> > memory.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/optee/Kconfig         |  5 +++
> >  drivers/tee/optee/core.c          | 10 +++++
> >  drivers/tee/optee/optee_private.h |  2 +
> >  drivers/tee/optee/smc_abi.c       | 70 ++++++++++++++++++++++++++++++-
> >  4 files changed, 85 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
> > index 7bb7990d0b07..50d2051f7f20 100644
> > --- a/drivers/tee/optee/Kconfig
> > +++ b/drivers/tee/optee/Kconfig
> > @@ -25,3 +25,8 @@ config OPTEE_INSECURE_LOAD_IMAGE
> >
> >         Additional documentation on kernel security risks are at
> >         Documentation/tee/op-tee.rst.
> > +
> > +config OPTEE_STATIC_PROTMEM_POOL
> > +     bool
> > +     depends on HAS_IOMEM && TEE_DMABUF_HEAPS
> > +     default y
> > diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> > index c75fddc83576..4b14a7ac56f9 100644
> > --- a/drivers/tee/optee/core.c
> > +++ b/drivers/tee/optee/core.c
> > @@ -56,6 +56,15 @@ int optee_rpmb_intf_rdev(struct notifier_block *intf=
, unsigned long action,
> >       return 0;
> >  }
> >
> > +int optee_set_dma_mask(struct optee *optee, u_int pa_width)
> > +{
> > +     u64 mask =3D DMA_BIT_MASK(min(64, pa_width));
> > +
>
> nit: Why not dma_coerce_mask_and_coherent() instead of bellow?

Good point, I'll update in the next version.

Thanks,
Jens

>
> - Amir
>
> > +     optee->teedev->dev.dma_mask =3D &optee->teedev->dev.coherent_dma_=
mask;
> > +
> > +     return dma_set_mask_and_coherent(&optee->teedev->dev, mask);
> > +}
> > +
> >  static void optee_bus_scan(struct work_struct *work)
> >  {
> >       WARN_ON(optee_enumerate_devices(PTA_CMD_GET_DEVICES_SUPP));
> > @@ -181,6 +190,7 @@ void optee_remove_common(struct optee *optee)
> >       tee_device_unregister(optee->supp_teedev);
> >       tee_device_unregister(optee->teedev);
> >
> > +     tee_device_unregister_all_dma_heaps(optee->teedev);
> >       tee_shm_pool_free(optee->pool);
> >       optee_supp_uninit(&optee->supp);
> >       mutex_destroy(&optee->call_queue.mutex);
> > diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/opte=
e_private.h
> > index dc0f355ef72a..5e3c34802121 100644
> > --- a/drivers/tee/optee/optee_private.h
> > +++ b/drivers/tee/optee/optee_private.h
> > @@ -272,6 +272,8 @@ struct optee_call_ctx {
> >
> >  extern struct blocking_notifier_head optee_rpmb_intf_added;
> >
> > +int optee_set_dma_mask(struct optee *optee, u_int pa_width);
> > +
> >  int optee_notif_init(struct optee *optee, u_int max_key);
> >  void optee_notif_uninit(struct optee *optee);
> >  int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
> > diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> > index f0c3ac1103bb..cf106d15e64e 100644
> > --- a/drivers/tee/optee/smc_abi.c
> > +++ b/drivers/tee/optee/smc_abi.c
> > @@ -1584,6 +1584,68 @@ static inline int optee_load_fw(struct platform_=
device *pdev,
> >  }
> >  #endif
> >
> > +static struct tee_protmem_pool *static_protmem_pool_init(struct optee =
*optee)
> > +{
> > +#if IS_ENABLED(CONFIG_OPTEE_STATIC_PROTMEM_POOL)
> > +     union {
> > +             struct arm_smccc_res smccc;
> > +             struct optee_smc_get_protmem_config_result result;
> > +     } res;
> > +     struct tee_protmem_pool *pool;
> > +     void *p;
> > +     int rc;
> > +
> > +     optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
> > +                          0, 0, 0, &res.smccc);
> > +     if (res.result.status !=3D OPTEE_SMC_RETURN_OK)
> > +             return ERR_PTR(-EINVAL);
> > +
> > +     rc =3D optee_set_dma_mask(optee, res.result.pa_width);
> > +     if (rc)
> > +             return ERR_PTR(rc);
> > +
> > +     /*
> > +      * Map the memory as uncached to make sure the kernel can work wi=
th
> > +      * __pfn_to_page() and friends since that's needed when passing t=
he
> > +      * protected DMA-buf to a device. The memory should otherwise not
> > +      * be touched by the kernel since it's likely to cause an externa=
l
> > +      * abort due to the protection status.
> > +      */
> > +     p =3D devm_memremap(&optee->teedev->dev, res.result.start,
> > +                       res.result.size, MEMREMAP_WC);
> > +     if (IS_ERR(p))
> > +             return p;
> > +
> > +     pool =3D tee_protmem_static_pool_alloc(res.result.start, res.resu=
lt.size);
> > +     if (IS_ERR(pool))
> > +             devm_memunmap(&optee->teedev->dev, p);
> > +
> > +     return pool;
> > +#else
> > +     return ERR_PTR(-EINVAL);
> > +#endif
> > +}
> > +
> > +static int optee_protmem_pool_init(struct optee *optee)
> > +{
> > +     enum tee_dma_heap_id heap_id =3D TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> > +     struct tee_protmem_pool *pool =3D ERR_PTR(-EINVAL);
> > +     int rc;
> > +
> > +     if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM))
> > +             return 0;
> > +
> > +     pool =3D static_protmem_pool_init(optee);
> > +     if (IS_ERR(pool))
> > +             return PTR_ERR(pool);
> > +
> > +     rc =3D tee_device_register_dma_heap(optee->teedev, heap_id, pool)=
;
> > +     if (rc)
> > +             pool->ops->destroy_pool(pool);
> > +
> > +     return rc;
> > +}
> > +
> >  static int optee_probe(struct platform_device *pdev)
> >  {
> >       optee_invoke_fn *invoke_fn;
> > @@ -1679,7 +1741,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >       optee =3D kzalloc(sizeof(*optee), GFP_KERNEL);
> >       if (!optee) {
> >               rc =3D -ENOMEM;
> > -             goto err_free_pool;
> > +             goto err_free_shm_pool;
> >       }
> >
> >       optee->ops =3D &optee_ops;
> > @@ -1752,6 +1814,9 @@ static int optee_probe(struct platform_device *pd=
ev)
> >               pr_info("Asynchronous notifications enabled\n");
> >       }
> >
> > +     if (optee_protmem_pool_init(optee))
> > +             pr_info("Protected memory service not available\n");
> > +
> >       /*
> >        * Ensure that there are no pre-existing shm objects before enabl=
ing
> >        * the shm cache so that there's no chance of receiving an invali=
d
> > @@ -1787,6 +1852,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >               optee_disable_shm_cache(optee);
> >       optee_smc_notif_uninit_irq(optee);
> >       optee_unregister_devices();
> > +     tee_device_unregister_all_dma_heaps(optee->teedev);
> >  err_notif_uninit:
> >       optee_notif_uninit(optee);
> >  err_close_ctx:
> > @@ -1803,7 +1869,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >       tee_device_unregister(optee->teedev);
> >  err_free_optee:
> >       kfree(optee);
> > -err_free_pool:
> > +err_free_shm_pool:
> >       tee_shm_pool_free(pool);
> >       if (memremaped_shm)
> >               memunmap(memremaped_shm);
>
