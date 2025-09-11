Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE664B52A7A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 09:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9075610E0AC;
	Thu, 11 Sep 2025 07:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="psFQtBHM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com
 [209.85.161.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D2910E0AC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 07:50:16 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id
 006d021491bc7-62189987b47so214873eaf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 00:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757577015; x=1758181815; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tZ6E6bW5eiC9q7CDA3LI31bAgUOE0PZhjrPZI2/QSuQ=;
 b=psFQtBHMPowWhqU+qrzYsLHnp3aZJ268sMJsDgoFJdbnkp9B0wk/FYHOy9Hep8c4AD
 hs0rsSb3BJQpKjVkTqxoh+/CcRnS21m8DiKpNHzfFpPtTa800Cyu9ATf6q8AEaZvcIFT
 TfEVc7ZUZhAoVaKBGxkDYwUNQbk9wm0/A/5jPYc44b1n6y/bfSVaM+CM04kv+1lMU1Ay
 /f2ZeLdOmVRHzbzB9MoZSdkqaqvuMcDT7+BLJSYs29DxbsqXuaqGBuubteQrugCleQZJ
 f4BQk8C65z6FJQcIS/8jZs8t5eTGwGu66Vn6ySv6vy4+wBJVAt9CxFnxbdADt2EeWVBL
 dTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757577015; x=1758181815;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tZ6E6bW5eiC9q7CDA3LI31bAgUOE0PZhjrPZI2/QSuQ=;
 b=DjNo/QozjoY7sWZexW31CBvE6VxYisOu/RxjRPwmSu1AjIxWHKQF9JYWZEPWuOcmo1
 ZfbOz+TQYCep6jmNlJvXXxsz2CkQaQyuxh2KovNsLyb2rdoxxcdzABqFj69am2GMkcIo
 t0VKESupIm7HL5/YrVbezkdvb8uWVc9Ggz4beed3lLAqYJm4C700MPn8ojeZdIztwIpI
 dxjtl4kT7Ou36LCG+DyNOLT9Vvp8o3Irb0Gpu5PbSujsrL9UKNzp+aJ41wQgHyGt2EVI
 LGage1jNJ39wkROmhuHWWg/Q12AM2UEs/zEtoyitQV9rWLCWeTJqPOaNo/xLqdDVAwsO
 v3Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoXF7aSCyJa/c4Na88cW2mGOdMw4yp9CuMofq7Me+9hO9CKE3Cl4tnKnh5r9qlTHRrebrjGMZ4pAE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBd1a1zfVnZYyzXVSydRwGOv3/KGMOh+pvo3e7Wktp6Fq3ctr0
 4goWfyl4xzVS7zQHGfbWDyUwrks9ZtVdhVZsGzxVrco0wHGMXJ+5cTf/K70myJnWCqxT+yj83fg
 S9L4kG5kF6EMnDr6gWh2bEdEiscgPIwrXOGeghPgnxg==
X-Gm-Gg: ASbGnct66JI7XOZYfyhrdz4Tp4jLXTCEG0Qy1weHa0ZLCrMo9vU3mDCo1V+ECcO3DlA
 Wuud4WPrQxVH4810gYXZW69nJzlvzToqP7d68hOgRrGToClS3W5KH6Gj1tQ+V96fn5mfPk8bQG9
 jcsaNos+LfeKhv1dTCajdKv3agwL+uDyLttqXfCN/4aP6w3QQH6Ae2GfzvRqH+/jKrg3fc2p2/6
 4Cp+QNx
X-Google-Smtp-Source: AGHT+IHM+qomPa7mkwPaxbF4J0ZwMvmQZ4r3i08spiXwqRdColY0ofOiN+xC4zPpK9pKKDVK1an+zwdrKVe+3sc2KLA=
X-Received: by 2002:a05:6820:1518:b0:620:ea78:ceb4 with SMTP id
 006d021491bc7-6217897a730mr7686244eaf.0.1757577015334; Thu, 11 Sep 2025
 00:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
 <20250813060339.2977604-3-jens.wiklander@linaro.org>
 <aJ1-YpgvGt4_6CFU@sumit-X1>
 <CABdmKX2FPg+hO55qWndMajuWP0kZH=OWEh9v-d8aO6HQWyxJtQ@mail.gmail.com>
 <CAO_48GEqkf_Jm8kSTPEDZkZy-YmT56Zs1Jx9zCvzETPsCzrkEg@mail.gmail.com>
In-Reply-To: <CAO_48GEqkf_Jm8kSTPEDZkZy-YmT56Zs1Jx9zCvzETPsCzrkEg@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 11 Sep 2025 09:50:04 +0200
X-Gm-Features: Ac12FXyvCWRnQD7Gsb8VWVWslCX8Upv9AarUZnTiiQT33HIlYHfy4GNTnaJlFIg
Message-ID: <CAHUa44HHSKwiBYPMSY5hj6wyWc9-uvtQVx+JLx4M5yjD5AwyTg@mail.gmail.com>
Subject: Re: [PATCH v11 2/9] dma-buf: dma-heap: export declared functions
To: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, Sumit Garg <sumit.garg@kernel.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org, 
 Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, 
 Simona Vetter <simona.vetter@ffwll.ch>, Daniel Stone <daniel@fooishbar.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com, 
 Sumit Garg <sumit.garg@oss.qualcomm.com>
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

Hi Sumit,

On Thu, Sep 11, 2025 at 9:15=E2=80=AFAM Sumit Semwal <sumit.semwal@linaro.o=
rg> wrote:
>
> Hello Jens,
>
> On Fri, 15 Aug 2025 at 05:00, T.J. Mercier <tjmercier@google.com> wrote:
> >
> > On Wed, Aug 13, 2025 at 11:13=E2=80=AFPM Sumit Garg <sumit.garg@kernel.=
org> wrote:
> > >
> > > On Wed, Aug 13, 2025 at 08:02:51AM +0200, Jens Wiklander wrote:
> > > > Export the dma-buf heap functions to allow them to be used by the O=
P-TEE
> > > > driver. The OP-TEE driver wants to register and manage specific sec=
ure
> > > > DMA heaps with it.
> Thank you for the series.
>
> Could you please use EXPORT_SYMBOL_GPL_NS instead of EXPORT_SYMBOL for th=
ese?

Sure, what namespace do you want in the argument for
EXPORT_SYMBOL_GPL_NS()? "DMA_BUF"?

>
> With that change, please feel free to use my
> Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

Thanks,
Jens

> > > >
> > > > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > > Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > ---
> > > >  drivers/dma-buf/dma-heap.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > >
> > > Can we get an ack from DMAbuf maintainers here? With that we should b=
e
> > > able to queue this patch-set for linux-next targetting the 6.18 merge
> > > window.
> > >
> > > -Sumit
> >
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> >
> > Sorry I haven't been able to participate much upstream lately.
> > >
> > > > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.=
c
> > > > index 3cbe87d4a464..cdddf0e24dce 100644
> > > > --- a/drivers/dma-buf/dma-heap.c
> > > > +++ b/drivers/dma-buf/dma-heap.c
> > > > @@ -202,6 +202,7 @@ void *dma_heap_get_drvdata(struct dma_heap *hea=
p)
> > > >  {
> > > >       return heap->priv;
> > > >  }
> > > > +EXPORT_SYMBOL(dma_heap_get_drvdata);
> > > >
> > > >  /**
> > > >   * dma_heap_get_name - get heap name
> > > > @@ -214,6 +215,7 @@ const char *dma_heap_get_name(struct dma_heap *=
heap)
> > > >  {
> > > >       return heap->name;
> > > >  }
> > > > +EXPORT_SYMBOL(dma_heap_get_name);
> > > >
> > > >  /**
> > > >   * dma_heap_add - adds a heap to dmabuf heaps
> > > > @@ -303,6 +305,7 @@ struct dma_heap *dma_heap_add(const struct dma_=
heap_export_info *exp_info)
> > > >       kfree(heap);
> > > >       return err_ret;
> > > >  }
> > > > +EXPORT_SYMBOL(dma_heap_add);
> > > >
> > > >  static char *dma_heap_devnode(const struct device *dev, umode_t *m=
ode)
> > > >  {
> > > > --
> > > > 2.43.0
> > > >
>
> Best,
> Sumit.
