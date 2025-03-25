Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D6CA702E7
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 14:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AC610E577;
	Tue, 25 Mar 2025 13:55:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RcBXFkHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AF310E3A2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 13:55:44 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-2c2c754af3cso2823682fac.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 06:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742910944; x=1743515744; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HfXW1tINyjybFH59i2/tceSOuMsWCGxf0dWvSOQSE9Q=;
 b=RcBXFkHgoxip16/Ymiz+ezHaDGUvqVbfcahBOeLIKWXfo8PkwKnddd+z8bDP5brnWy
 YK5c2DV2AerrCiZCKRrFMu9vBcFdWmheENy9uNBJNVgHC3zEdFpjltIfaskShHssT7/q
 EEo4xwftRNMucR9QmaF4q8+bjXe+tcRRVXxF1dMDt8Xk1X5vJe5C+SvZCh43UynFJPNO
 JVpI8kbXmQzTbKZD1luhDNKabUbmwJgArTYntJaw5hGbiwEQAW7m34tnsj8RsEqPe9xl
 AORCYZD7co/bLdX+ER/DIO6Vi2u9wNfz9YvrtQwsBXCyVZdxisapgUuHCOpUNh9B4ZRZ
 ne3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742910944; x=1743515744;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HfXW1tINyjybFH59i2/tceSOuMsWCGxf0dWvSOQSE9Q=;
 b=bT61jOcXYCdl5sxaYcKYa5lU8SCWcPo19tw/mJBpszzPA8mpBUw8GqqM7FzH5X1cU4
 rKqUcZltnj0rJchZVz2WXJks9bkuIuUzN6aPGxZRTWYM+NHhXeIN51EBj62YC7ft8y5h
 K6QoJnSJlS1xKIekdyzIRnjW5QEL6qtsQdX/xffJngc2ovgcBkBS5SZ06wXzwEOvHof8
 sXzDibXSodIWymcEpfjVRVEJjwhlof3sPLFzvBWsY9MtL5gC5yT7J5S12bZecXp6p4L+
 Zt1ZBulpGmJQw+29VNSV6Jclssu7+i6ImssijAY1MEicWZamj41WED7ElGhkklim+ReC
 /ahQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC/uaoVU05fEc4p9nYKb1HgMRKg4HuWiBHh0KTrswVOSHAINegWu34SPsyYajS9zWzSEKvKpUbbE4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSio7gqlCoKaK4TmmFzQUg5tvwgG0QN0MbnLThEzQv+Eh3IGwv
 N8gKwtr/cQBEajF5KsYBZuvBsxteMbLItqdh21acmVSzFoNegTWOprOHcLztohF+TpchpfA6DtN
 mSyzldKsnUj4rqcGmqnCPsZ7Y/+2erh7jckvbzw==
X-Gm-Gg: ASbGncsvoHR0PdurhmIEXxVpP7aPFcA+x2wlb33366tSsc4U9C9JKTcuVUhn01xLd3E
 7imupRRpKRFwiOu3Y3RbCR5W4ff02cH36qmsoVD8VaS2auMRaWl9S0oOHSnnYKHpL9CW+Yulzol
 8cWG8iCbaV6O8dJ7vwDAykpKVbGco=
X-Google-Smtp-Source: AGHT+IEwBPPwUVoRos1sVNedvDmYTl2oPMhg6qa7EWRFlVhYT0/1fPMMFcZLaxlXCLhryoazT9mEtzOs9FsiBb8tVPo=
X-Received: by 2002:a05:6870:f80b:b0:296:bbc8:4a82 with SMTP id
 586e51a60fabf-2c780495379mr12124356fac.27.1742910943713; Tue, 25 Mar 2025
 06:55:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
 <20250305130634.1850178-9-jens.wiklander@linaro.org>
 <Z-JWIyd8cKyXQR0H@sumit-X1>
In-Reply-To: <Z-JWIyd8cKyXQR0H@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 25 Mar 2025 14:55:32 +0100
X-Gm-Features: AQ5f1Jp3D7eSeWP8gWeTN_I1pHWpPzOxKysZVMBSQkU1nox7ff2kFajLYyiQcek
Message-ID: <CAHUa44FXjG1hC9v18Yx1ENPX_Bc9sZW1Z2=+m6+KUsxPMvDE+w@mail.gmail.com>
Subject: Re: [PATCH v6 08/10] optee: support restricted memory allocation
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
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>
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

On Tue, Mar 25, 2025 at 8:07=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org> =
wrote:
>
> On Wed, Mar 05, 2025 at 02:04:14PM +0100, Jens Wiklander wrote:
> > Add support in the OP-TEE backend driver for restricted memory
> > allocation. The support is limited to only the SMC ABI and for secure
> > video buffers.
> >
> > OP-TEE is probed for the range of restricted physical memory and a
> > memory pool allocator is initialized if OP-TEE have support for such
> > memory.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  drivers/tee/optee/core.c    |  1 +
> >  drivers/tee/optee/smc_abi.c | 44 +++++++++++++++++++++++++++++++++++--
> >  2 files changed, 43 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> > index c75fddc83576..c7fd8040480e 100644
> > --- a/drivers/tee/optee/core.c
> > +++ b/drivers/tee/optee/core.c
> > @@ -181,6 +181,7 @@ void optee_remove_common(struct optee *optee)
> >       tee_device_unregister(optee->supp_teedev);
> >       tee_device_unregister(optee->teedev);
> >
> > +     tee_device_unregister_all_dma_heaps(optee->teedev);
> >       tee_shm_pool_free(optee->pool);
> >       optee_supp_uninit(&optee->supp);
> >       mutex_destroy(&optee->call_queue.mutex);
> > diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> > index cfdae266548b..a14ff0b7d3b3 100644
> > --- a/drivers/tee/optee/smc_abi.c
> > +++ b/drivers/tee/optee/smc_abi.c
> > @@ -1620,6 +1620,41 @@ static inline int optee_load_fw(struct platform_=
device *pdev,
> >  }
> >  #endif
> >
> > +static int optee_sdp_pool_init(struct optee *optee)
> > +{
> > +     enum tee_dma_heap_id heap_id =3D TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> > +     struct tee_rstmem_pool *pool;
> > +     int rc;
> > +
> > +     if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP) {
>
> Is this SDP capability an ABI yet since we haven't supported it in
> upstream kernel? If no then can we rename it as
> OPTEE_SMC_SEC_CAP_RSTMEM?

No problem. We can rename it.

>
> > +             union {
> > +                     struct arm_smccc_res smccc;
> > +                     struct optee_smc_get_sdp_config_result result;
> > +             } res;
> > +
> > +             optee->smc.invoke_fn(OPTEE_SMC_GET_SDP_CONFIG, 0, 0, 0, 0=
, 0, 0,
> > +                                  0, &res.smccc);
> > +             if (res.result.status !=3D OPTEE_SMC_RETURN_OK) {
> > +                     pr_err("Secure Data Path service not available\n"=
);
> > +                     return 0;
> > +             }
> > +
> > +             pool =3D tee_rstmem_static_pool_alloc(res.result.start,
> > +                                                 res.result.size);
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
> > @@ -1715,7 +1750,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >       optee =3D kzalloc(sizeof(*optee), GFP_KERNEL);
> >       if (!optee) {
> >               rc =3D -ENOMEM;
> > -             goto err_free_pool;
> > +             goto err_free_shm_pool;
> >       }
> >
> >       optee->ops =3D &optee_ops;
> > @@ -1788,6 +1823,10 @@ static int optee_probe(struct platform_device *p=
dev)
> >               pr_info("Asynchronous notifications enabled\n");
> >       }
> >
> > +     rc =3D optee_sdp_pool_init(optee);
>
> s/optee_sdp_pool_init/optee_rstmem_pool_init/

OK

Cheers,
Jens

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
> > @@ -1823,6 +1862,7 @@ static int optee_probe(struct platform_device *pd=
ev)
> >               optee_disable_shm_cache(optee);
> >       optee_smc_notif_uninit_irq(optee);
> >       optee_unregister_devices();
> > +     tee_device_unregister_all_dma_heaps(optee->teedev);
> >  err_notif_uninit:
> >       optee_notif_uninit(optee);
> >  err_close_ctx:
> > @@ -1839,7 +1879,7 @@ static int optee_probe(struct platform_device *pd=
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
