Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0E0AC50F0
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 16:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DD0C10E4AA;
	Tue, 27 May 2025 14:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p+MWW49b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DB810E4AA
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 14:33:04 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2349282084bso11690715ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 07:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748356384; x=1748961184; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GRDZ/LCrpqxKUX7yBP1lPoeGMYrX58ozdV1M2xTcqr0=;
 b=p+MWW49b7s95hcCm/FPjyeAbLP2K/YPAf7hQbgQHctBM/Lbr1mBUbyrogws62gS7+W
 e+0yMY/uv3e4irFNtVit7RebcrhCDlmy6rfpLr9/W31vnllxji2IxD4dLOhrLvXDq+eV
 nXcTc9puSSVdljIJnrwK0Cb+LAKR7I9qk7s/r4O7d3H918coU2RhY8JJwHl2GuWNPR5V
 abMfMupwDqgZzk934ASvRGnx2GSz6GdEkgpgryquGQmBjc1qPBovvV+bvAuCgicSJD2+
 GCuN9U0nzuFAfeqJW2EdmtBOVNrxhejrUYcjWrpwEWl6qKvjoexCKVmFH3pStIMhMa9R
 PZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748356384; x=1748961184;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GRDZ/LCrpqxKUX7yBP1lPoeGMYrX58ozdV1M2xTcqr0=;
 b=wyI3ta+101KKRvnK86TVQSRQvhS5c7vLJSegbwg9Eg5DY5SkTzzIGM/UYpmZB/Bp1o
 rLhZrc3zEch7hKQ4KNnCdgHwbgmW2yltcSTGO4O0OubLM++b73MyaLGsq6O2fDsmTYcI
 g5EsvVMHZhUIbGlLfBbtgkEEIS9EdoOx13nqAATkTiJwfrTEaJtvxPvLvb07PWSGsAOh
 1L/MS6igiQzIIsfyJ1pdlgVtFrpy0CC0/jABag/WYFGmRi9XWsnHrH0kuEdGGD9BQOwW
 wVKrBdecGyoUxMmu8H/65OHyUiCt4p1rVubKH2QXLxW0j2NL7hIFqJ2Mn7gC06OmrR41
 yO8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWogpQSB6dgZcBY4n0F0yRl5gzKNQtivyNc9UWAgn9SjlCBk+2vDOH05L0av7xhppf3KhyR8fnyyhk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjBChqa0cWpvliO4Ewp8xz0gEzfXyMmi2GtHowC6LcLEKjiDCG
 OhftXhzFX8qa/QSxW/ZSldbRv068ZGXvmH9rd03j/YlvKe9848yPZEPzvSGm/axTs6jDyrGTzgw
 RiueFvi+RYTAoZEkzuYHRWh6LA/NQrxVxDU2Abw43aaY/OSC5wPAO
X-Gm-Gg: ASbGncvB4svovnhj9M9SVyN2bBUSJQYakvyrgozPamVcQCSONb3aerqeV5AnUg7knXA
 Z+gpjdNuD9fBM83meRSnov1FdXDFYEr5IJH2y2lAL8NpT2lKTdURqNQw69fZjAZYn8Ya5tZmoT+
 VwZoEZau+PwoIfV4qjATX9JT6C9z4pAMCT/A==
X-Google-Smtp-Source: AGHT+IG+kMuaBsaWSffxs+4dopBi6c2UidFw8vqj94comKMts1HGzvEPJpkPt4sT0Oi5flOvsO/w4xlAVEH4ZILhoBI=
X-Received: by 2002:a05:6808:6c93:b0:403:35ba:f91a with SMTP id
 5614622812f47-406468ba8c7mr7824256b6e.34.1748356373410; Tue, 27 May 2025
 07:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-8-jens.wiklander@linaro.org>
 <aDQZN-frPnr1_N5I@sumit-X1>
In-Reply-To: <aDQZN-frPnr1_N5I@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 27 May 2025 16:32:42 +0200
X-Gm-Features: AX0GCFtCRIMnpa06u8yxs_HtV-u6PU01-LbWY3-lo5Z1TuKmqqUniPvzQcB1mdY
Message-ID: <CAHUa44FHav67VAQK7o-S3Xhx-j_VypAX9Ya0dATty7RhdCbgJA@mail.gmail.com>
Subject: Re: [PATCH v9 7/9] optee: support protected memory allocation
To: Sumit Garg <sumit.garg@kernel.org>
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
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
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

On Mon, May 26, 2025 at 9:33=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Tue, May 20, 2025 at 05:16:50PM +0200, Jens Wiklander wrote:
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
> >  drivers/tee/optee/core.c          | 10 +++++++
> >  drivers/tee/optee/optee_private.h |  2 ++
> >  drivers/tee/optee/smc_abi.c       | 45 +++++++++++++++++++++++++++++--
> >  3 files changed, 55 insertions(+), 2 deletions(-)
> >
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
> > index f0c3ac1103bb..f3cae8243785 100644
> > --- a/drivers/tee/optee/smc_abi.c
> > +++ b/drivers/tee/optee/smc_abi.c
> > @@ -1584,6 +1584,42 @@ static inline int optee_load_fw(struct platform_=
device *pdev,
> >  }
> >  #endif
> >
> > +static int optee_protmem_pool_init(struct optee *optee)
> > +{
> > +     enum tee_dma_heap_id heap_id =3D TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> > +     struct tee_protmem_pool *pool;
> > +     int rc;
> > +
> > +     if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM) {
> > +             union {
> > +                     struct arm_smccc_res smccc;
> > +                     struct optee_smc_get_protmem_config_result result=
;
> > +             } res;
> > +
> > +             optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, =
0, 0,
> > +                                  0, 0, 0, &res.smccc);
> > +             if (res.result.status !=3D OPTEE_SMC_RETURN_OK) {
> > +                     pr_err("Secure Data Path service not available\n"=
);
> > +                     return 0;
> > +             }
> > +             rc =3D optee_set_dma_mask(optee, res.result.pa_width);
> > +             if (!rc)
> > +                     pool =3D tee_protmem_static_pool_alloc(res.result=
.start,
> > +                                                          res.result.s=
ize);
> > +             if (IS_ERR(pool))
> > +                     return PTR_ERR(pool);
> > +
> > +             rc =3D tee_device_register_dma_heap(optee->teedev, heap_i=
d, pool);
> > +             if (rc)
> > +                     goto err;
> > +     }
> > +
> > +     return 0;
> > +err:
> > +     pool->ops->destroy_pool(pool);
> > +     return rc;
> > +}
> > +
> >  static int optee_probe(struct platform_device *pdev)
> >  {
> >       optee_invoke_fn *invoke_fn;
> > @@ -1679,7 +1715,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >       optee =3D kzalloc(sizeof(*optee), GFP_KERNEL);
> >       if (!optee) {
> >               rc =3D -ENOMEM;
> > -             goto err_free_pool;
> > +             goto err_free_shm_pool;
> >       }
> >
> >       optee->ops =3D &optee_ops;
> > @@ -1752,6 +1788,10 @@ static int optee_probe(struct platform_device *p=
dev)
> >               pr_info("Asynchronous notifications enabled\n");
> >       }
> >
> > +     rc =3D optee_protmem_pool_init(optee);
>
> Here we should do a Kconfig check for CONFIG_DMABUF_HEAPS so that we
> don't proceed any further with initialization.

Why? If OP-TEE is configured for protected memory but the kernel
isn't, something isn't right, and a print could be useful.

Cheers,
Jens

>
> Rest looks good to me.
>
> -Sumit
>
> > +     if (rc)
> > +             goto err_notif_uninit;
> > +
> >       /*
> >        * Ensure that there are no pre-existing shm objects before enabl=
ing
> >        * the shm cache so that there's no chance of receiving an invali=
d
> > @@ -1787,6 +1827,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >               optee_disable_shm_cache(optee);
> >       optee_smc_notif_uninit_irq(optee);
> >       optee_unregister_devices();
> > +     tee_device_unregister_all_dma_heaps(optee->teedev);
> >  err_notif_uninit:
> >       optee_notif_uninit(optee);
> >  err_close_ctx:
> > @@ -1803,7 +1844,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >       tee_device_unregister(optee->teedev);
> >  err_free_optee:
> >       kfree(optee);
> > -err_free_pool:
> > +err_free_shm_pool:
> >       tee_shm_pool_free(pool);
> >       if (memremaped_shm)
> >               memunmap(memremaped_shm);
> > --
> > 2.43.0
> >
