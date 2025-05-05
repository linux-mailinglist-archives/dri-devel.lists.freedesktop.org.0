Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D83FAA92BA
	for <lists+dri-devel@lfdr.de>; Mon,  5 May 2025 14:10:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356E310E294;
	Mon,  5 May 2025 12:10:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gFd/e8hY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE86F10E294
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 12:10:24 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-2c769da02b0so3429332fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 May 2025 05:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746447024; x=1747051824; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xf1P+9z9XiJdCaUpuTBjGVfwsl02CsdlqTVjlTuR+ug=;
 b=gFd/e8hYgzLieVC8Z7czqn1T3vWZHrY97I1QxXHLaAto1jX7dx+gP0pMKljFh/vY2t
 +7a3uE0HuuDTs7YhP8SM9k4LocJLtintfgbEx08w6JAFzJLD71ysvYamxs0y7WZbJ+J0
 zD4KedNfes0qv3BjFqMQWlGd9+AskFGQBIo7svUkzrx8gkot7zIqauqs5ba08kqKpO65
 OMyB3zWWr9vRlInqJVzhP6Jw4/c6n6m1k2b694XgcRiNMpqkHv77qAxp/bBkreA44YGK
 /Sai5iKKQ/RALeDuWQ91haYg3G/3OUDAPq9ievePECJqsSYRnmiOLVH4MmRembmtIWiN
 bz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746447024; x=1747051824;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xf1P+9z9XiJdCaUpuTBjGVfwsl02CsdlqTVjlTuR+ug=;
 b=FQPcChsvez0onP6lUiEMxD6W0FrzfIni83PXGN5VBAE7z8C8veqANT8QXQk52IMbPx
 +TSs+DPJSIbSv4b0BlXlO/7nlfcxN7MzX4tIoQBWci89w6+vdi/LrXuXpFJCAUZakSi+
 8nMNVlSZqZ3iT7IuCnDKNd6if35zMwKskMtzxFsFFA88XEjCxid/hsUWNHwuW0syzjss
 0THKHeslGPeFIyMueL6OP8VLY1qVNAuOmlWKdhS4wTbFJsy9K0C0UOd82ZO8fGNc0mTl
 f8snBJDFwIYe1B4pc3qhibMsdNS1VappPKAbW6Tu8Wqn1/Gy+e6a858JYj4OFwvjElez
 iDBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtnxdccAUYkIzM4lsEx00lxd12q5lxNdFi6qFVahmWBIV94gHb5BhOULCPexL6sJ5hy2B6Fst7RC4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIN6qEsVtGgieTe1sFmkvkH1mPnhEEX0BsAqsWPRTThc7Ieiwg
 eLp69rUclIZddoMTHyzv4C1oxxuCu6zrMtfR9w07FJBsSXWVrMIvXK189016lirWHsXaVXSw+TQ
 RhCf2XbI/IWzCVZVDgfy7yje/eejvcek4vyx7Ew==
X-Gm-Gg: ASbGnctUzjU8q6VwDizHGRSHwq4jlBXZoZyCDNm6KRWDBQxczo212T9mHzL9J4c53cd
 O97haSJky4lPg1Zeo8w8RuA5Q5tDKRqfkcEm9vajTuvwnNGqvVMhY7NX3BDajWWRQlL3JRXrNLw
 YrYBTbYs8lthQ5ycR1mN3LeSA=
X-Google-Smtp-Source: AGHT+IGrfUH9MPAdQwNS2twFxhlagwaLPCfCXznz+rgBdFwPjZ3ioiuEo3A9Gk0YdclatuJ1Za+bseaIMHaboEvs7gU=
X-Received: by 2002:a05:6870:7196:b0:2d5:230f:b352 with SMTP id
 586e51a60fabf-2dae8619680mr3755206fac.27.1746447023762; Mon, 05 May 2025
 05:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
 <20250502100049.1746335-2-jens.wiklander@linaro.org>
 <6236d3cb-fbf2-4a41-a84a-276aa8079b9a@arm.com>
In-Reply-To: <6236d3cb-fbf2-4a41-a84a-276aa8079b9a@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 5 May 2025 14:10:11 +0200
X-Gm-Features: ATxdqUFEAD2cD1D5jQOZdhIhdxiPr-7TKi7md7xZJRysmAHd6QQOFGSu_VWfcD0
Message-ID: <CAHUa44EhdHZofZHRWQ8SJUn4OcAuMwzxxdfjhLQuXQXx4KEaUA@mail.gmail.com>
Subject: Re: [PATCH v8 01/14] tee: tee_device_alloc(): copy dma_mask from
 parent device
To: Robin Murphy <robin.murphy@arm.com>
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

Hi,

On Fri, May 2, 2025 at 3:36=E2=80=AFPM Robin Murphy <robin.murphy@arm.com> =
wrote:
>
> On 02/05/2025 10:59 am, Jens Wiklander wrote:
> > If a parent device is supplied to tee_device_alloc(), copy the dma_mask
> > field into the new device. This avoids future warnings when mapping a
> > DMA-buf for the device.
>
> That also sounds dodgy. If the parent device is the hardware device
> physically performing the DMA, then that is the device which should be
> passed to the DMA API. Trying to copy random bits of one device's
> configuration to another device and hoping it will work is not robust -
> not only is DMA-relevant information all over the place, including in
> archdata and/or bus/IOMMU driver-private data, but it can also opens up
> a whole can of subtle lifecycle issues...

We have a reference to the parent device until the teedev goes away.
The dma_maks needed by tee_shm_register_fd() in
https://lore.kernel.org/lkml/20250502100049.1746335-9-jens.wiklander@linaro=
.org/
to be able to extract the PA from a DMA-buf allocated from another DMA
heap. We can drop this patch and support for unrelated DMA heaps in
tee_shm_register_fd() without losing critical features from the patch
set if we can't handle dma_mask in this way.

>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
> > ---
> >   drivers/tee/tee_core.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > index d113679b1e2d..685afcaa3ea1 100644
> > --- a/drivers/tee/tee_core.c
> > +++ b/drivers/tee/tee_core.c
> > @@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct te=
e_desc *teedesc,
> >       teedev->dev.class =3D &tee_class;
> >       teedev->dev.release =3D tee_release_device;
> >       teedev->dev.parent =3D dev;
> > +     if (dev)
> > +             teedev->dev.dma_mask =3D dev->dma_mask;
>
> ...for instance, I don't see any obvious guarantee that "dev" can't go
> away during the lifetime of "teedev" and leave this pointer dangling.

A successful call to tee_device_alloc() must be followed by a call to
tee_device_register() or tee_device_unregister(). The former calls
cdev_device_add(), which results in a call to device_add() and an
increased reference to teedev->dev.parent, "dev" in question.

Thanks,
Jens

>
> Thanks,
> Robin.
>
> >
> >       teedev->dev.devt =3D MKDEV(MAJOR(tee_devt), teedev->id);
> >
