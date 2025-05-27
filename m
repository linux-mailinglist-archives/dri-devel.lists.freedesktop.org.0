Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EB6AC519A
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 17:07:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 760D510E4DF;
	Tue, 27 May 2025 15:07:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Apr2dZnD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2713D10E4B3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 15:07:33 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-605ff8aa9d2so726121eaf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 08:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748358452; x=1748963252; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4HvNpqBKFOVDi+Mx9KGaepBPynHnQJMRXklI5JhKtbg=;
 b=Apr2dZnDkRzg+oc4EyeDJqimSGkBoZ610IlqQSw3dwwJgqkf2FEvZzb8fOjkPnYOWd
 nlIuFo4EnCbTQVGVBAVfhtjnaNU8aS8b0t+O7wWxvBP3HX8yE6F+/UbxN1tx2YakxlFv
 fB3rEUVPQedaDjEnh84f/OUCb47u6aiZBLuIQS4P1TH1PLNQHBnNzMspN8eZ0mIGlKHo
 xtq2OcYh/Gcy1eC8PTFNSNyp5iLpSceM9Qxqxkby7cCXJxsSgpyQkt1YKBzYaFkV99Q4
 jIltSRrtLaZg5jUzi1TZJ7FiTpPNc8vMXzdfibNVMqx8xxOjv6WKAcX/oxBWT4IQDiJL
 Tk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748358452; x=1748963252;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4HvNpqBKFOVDi+Mx9KGaepBPynHnQJMRXklI5JhKtbg=;
 b=WEKBVSwukiYtFvkZ9u7rCB3SX7nUrbdhjUyEgbRkm3Du2eAmFzhJW3q73K3uvzlJiG
 Oz4j8ggIgi4q504GeUwOtuXkat2v3MHriG3L1Q9m3CoyjxBvr2sGYSKahnVy/1aIAS9i
 KAfP8UT/rlMkR2bJR4f/vtDMjZ3GFMhHvX3nt2jX2wrmwqAShHXTxiXj27AOK5lBpafa
 967dFLRGQFjlVHS3Iy6UDgtPiqrzsgfCmE+FDiVqZkJH49CQl5nHwUyJHsCDD8QVdris
 K9ZR3E3r2ZZw55gFucUTYPSDDMnsTrE/7XnK/DQKUdyVzzHXyqEE3R8wAzj1jbYPF+Mr
 o9tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9hO82m7giCVssjHRw4q+9MY88OzDPvLo0ZcnpWgC69pByJVuesS/YRmOzX5Fa1JAHv4Wd/E9i9Ww=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEQ06s8+eTs51z5MgpIX+z9zX1+F/NJCX7xSw+Tsgg9wSz/Kig
 xM2dIgbW6zKlcZRHdtrfLef/WEMFcfelXJtrvy/IUiETV8ZCitdOA7m94i5jmMaCQ2qv3DeWOyj
 seh5a3mta3DMAe+kQL7jzPswzNVvZQ6GZ75ooqsQ7ew==
X-Gm-Gg: ASbGncsFComv2X6K5sS6MDGaQSDq9CCJlp9ZmKbv/Isvvy76uvDseRhmlCq20G/29BH
 sYbQ433vvMkA0gheGFCX8Uzbu9v6Z2T+Ta0WnKiQFy2kkvIaKUxYT+kMSARxpl3LIhd0Xtf6HsO
 4u8HIT9yCZVTS5K/MhwUo0bcSxYrix5vBygA==
X-Google-Smtp-Source: AGHT+IHcnwyoLk78Sdyqna09vDLwno8N4DKtCoMRIDEgmxMn5EJ8+I+135oFuaEbt0jukPgDX+G63PqFO04gyL6xVSo=
X-Received: by 2002:a05:6820:2610:b0:5fe:9edb:eafe with SMTP id
 006d021491bc7-60b9fba1696mr6694046eaf.5.1748358452253; Tue, 27 May 2025
 08:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
 <20250520152436.474778-9-jens.wiklander@linaro.org>
 <aDQhn9_fezC42GwS@sumit-X1>
In-Reply-To: <aDQhn9_fezC42GwS@sumit-X1>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 27 May 2025 17:07:18 +0200
X-Gm-Features: AX0GCFv4xwxS381XBNqHvZmFreXW7Y4SbgNJb3O8wPMOP2rKatTJj8xDdz14iuA
Message-ID: <CAHUa44HFPu87JCHDxu6HWAp6YaXrHFwi55JHTb9X=JvTz30XpA@mail.gmail.com>
Subject: Re: [PATCH v9 8/9] optee: FF-A: dynamic protected memory allocation
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

On Mon, May 26, 2025 at 10:09=E2=80=AFAM Sumit Garg <sumit.garg@kernel.org>=
 wrote:
>
> On Tue, May 20, 2025 at 05:16:51PM +0200, Jens Wiklander wrote:
> > Add support in the OP-TEE backend driver dynamic protected memory
> > allocation with FF-A.
> >
> > The protected memory pools for dynamically allocated protected memory
> > are instantiated when requested by user-space. This instantiation can
> > fail if OP-TEE doesn't support the requested use-case of protected
> > memory.
> >
> > Restricted memory pools based on a static carveout or dynamic allocatio=
n
> > can coexist for different use-cases. We use only dynamic allocation wit=
h
> > FF-A.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
[...]
> > +static int optee_ffa_protmem_pool_init(struct optee *optee, u32 sec_ca=
ps)
> > +{
> > +     enum tee_dma_heap_id id =3D TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
> > +     struct tee_protmem_pool *pool;
> > +     int rc =3D 0;
> > +
> > +     if (sec_caps & OPTEE_FFA_SEC_CAP_PROTMEM) {
> > +             pool =3D optee_protmem_alloc_dyn_pool(optee, id);
> > +             if (IS_ERR(pool))
> > +                     return PTR_ERR(pool);
> > +
> > +             rc =3D tee_device_register_dma_heap(optee->teedev, id, po=
ol);
> > +             if (rc)
> > +                     pool->ops->destroy_pool(pool);
> > +     }
> > +
> > +     return rc;
> > +}
> > +
> >  static int optee_ffa_probe(struct ffa_device *ffa_dev)
> >  {
> >       const struct ffa_notifier_ops *notif_ops;
> > @@ -918,7 +1057,7 @@ static int optee_ffa_probe(struct ffa_device *ffa_=
dev)
> >                                 optee);
> >       if (IS_ERR(teedev)) {
> >               rc =3D PTR_ERR(teedev);
> > -             goto err_free_pool;
> > +             goto err_free_shm_pool;
> >       }
> >       optee->teedev =3D teedev;
> >
> > @@ -965,6 +1104,9 @@ static int optee_ffa_probe(struct ffa_device *ffa_=
dev)
> >                              rc);
> >       }
> >
> > +     if (optee_ffa_protmem_pool_init(optee, sec_caps))
>
> Let's add a Kconfig check for DMABUF heaps support here as well.

I prefer complaining in the log if there's something wrong with the
configuration.

>
> > +             pr_info("Protected memory service not available\n");
> > +
[...]
> > +static int init_dyn_protmem(struct optee_protmem_dyn_pool *rp)
> > +{
> > +     int rc;
> > +
> > +     rp->protmem =3D tee_shm_alloc_dma_mem(rp->optee->ctx, rp->page_co=
unt);
> > +     if (IS_ERR(rp->protmem)) {
> > +             rc =3D PTR_ERR(rp->protmem);
> > +             goto err_null_protmem;
> > +     }
> > +
> > +     /*
> > +      * TODO unmap the memory range since the physical memory will
> > +      * become inaccesible after the lend_protmem() call.
>
> Let's ellaborate this comment to also say that unmap isn't strictly
> needed here in case a platform supports hypervisor in EL2 which can
> perform unmapping as part for memory lending to secure world as that
> will avoid any cache pre-fetch of memory lent to secure world.
>
> With that I can live with this as a ToDo in kernel which can be
> implemented once we see platforms requiring this change to happen.

OK, I'll add something.

[...]
> > +
> > +struct tee_protmem_pool *optee_protmem_alloc_dyn_pool(struct optee *op=
tee,
> > +                                                   enum tee_dma_heap_i=
d id)
> > +{
> > +     struct optee_protmem_dyn_pool *rp;
> > +     u32 use_case =3D id;
>
> Here we can get rid of redundant extra variable with s/id/use_case/.

OK, I'll update.

Cheers,
Jens
