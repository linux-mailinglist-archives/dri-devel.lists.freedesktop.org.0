Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F0D8748D8
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 08:37:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BCE910EFEB;
	Thu,  7 Mar 2024 07:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YdJIO9k2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D537010EFEB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 07:37:28 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-5643ae47cd3so641215a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 23:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709797047; x=1710401847; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1kw0N/eOAnZk7gfPXfHIs1qJP19DGGStl8rmjj+wRpo=;
 b=YdJIO9k2ijXlziHWP9LpQtNlA2kg07omI3x640FBW1iSwglAV16e/eddNHNh3WerGC
 zEAHFEFxfPc4Im8iNpb2WCB6KbzRzA1jxMrIRH3tsTdsGMqtsTF7e1atMPVxW6ooxuS8
 C8xggBsT2wYEfKEDCO1+bu7OFPABTLTlFDwxA3BDbtvZPP8wkZkTlwHx+0XInvHLkeoW
 7tUWTD2B/6V7Au18JFxpOkNQJzVavyzcPAJeCQXQBxn0v1x9xprMBAqBHvlYl8tKQ/na
 mrm6IKylL3qnpzbVl0IApJH+Tiuhk2fn8cZAm4qYR4vWwMmD+YQMkRmkxOT5aptpbUQn
 wLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709797047; x=1710401847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1kw0N/eOAnZk7gfPXfHIs1qJP19DGGStl8rmjj+wRpo=;
 b=kWeTfuC9hMaOabQe44F2S4Dii9l9ll2xbqcrb37FIFSCqKM7+5+qBtLsaQUAqdDtZx
 ghg0oISBWJFAXMbb/LmegzkHGYwWDJLBvredo1wKlaZSouVfHacGv0NP6woPToMFY7v5
 QIwAPsDY7zkEf6Jqgy+e/wHTij+zbnu6xlYKjwFfzl8Mf7BACfVjIm6eHsCk6wUBtMom
 5FyViAfW+tYeb1cNcBXgvoEFx/K5vfR0lUQ+iWMqmOmjK2BnfIe8C13AH5PZHgNFKKhz
 wxAMHpkbMj1+Jw7FQ/1I6yxIoRgs/8OtLatQyhnHz6j3PCp+kOXIlpTxv7t6OUHVwp1C
 PQIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5OihoHe57pyfiydlbQDJeTMhuImu5dIDvcHrjC+3K8RICmvtQnB1Zkg+ZCnw7Ft7SrUQIS2KBQY2QL1UrWnoxcqGgwLhjGORrqJTuLzh6
X-Gm-Message-State: AOJu0YwsRg5cqwoPkX6AnO2FOvzqFwIpzjQsSYwaUFP/1Bm0lLc05jCG
 JBuy1jkXggb6PjSrmst4krFi1njtUENDJrQgliBp3Kle2kMugYwft7/ZE+w8Uc6toCpbmefSlK0
 UXcaB3UAL/lbpW+lCppSFgfaufxh3eus8FJl9Tw==
X-Google-Smtp-Source: AGHT+IEanJhlxrJ0m3zCL0/FeuJM7oxCf5rvMMCu8nSAcar4vS1rMrFlRHpWwKJ8Ocvgn+dG5rIRCHc9Y5rV3Z2n5EY=
X-Received: by 2002:a05:6402:1ec9:b0:568:316:2616 with SMTP id
 g9-20020a0564021ec900b0056803162616mr1744389edg.15.1709797046953; Wed, 06 Mar
 2024 23:37:26 -0800 (PST)
MIME-Version: 1.0
References: <20240305-class_cleanup-drm-v1-0-94f82740525a@marliere.net>
 <20240305-class_cleanup-drm-v1-4-94f82740525a@marliere.net>
 <CABdmKX0VGyBdTo8gzEocyz2HFcqEtu_31PYVjWzioBdCbnXW6w@mail.gmail.com>
In-Reply-To: <CABdmKX0VGyBdTo8gzEocyz2HFcqEtu_31PYVjWzioBdCbnXW6w@mail.gmail.com>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Thu, 7 Mar 2024 13:07:15 +0530
Message-ID: <CAO_48GH_RyeTkUsZ9Ad=o2D+Poh3DVQnXiOmyApuWy2Ycn5P5w@mail.gmail.com>
Subject: Re: [PATCH RESEND drm-misc 4/4] dma-buf: heaps: make dma_heap_class
 constant
To: "T.J. Mercier" <tjmercier@google.com>
Cc: "Ricardo B. Marliere" <ricardo@marliere.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
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

Hello Ricardo,

On Tue, 5 Mar 2024 at 22:37, T.J. Mercier <tjmercier@google.com> wrote:
>
> On Tue, Mar 5, 2024 at 3:34=E2=80=AFAM Ricardo B. Marliere <ricardo@marli=
ere.net> wrote:
> >
> > Since commit 43a7206b0963 ("driver core: class: make class_register() t=
ake
> > a const *"), the driver core allows for struct class to be in read-only
> > memory, so move the dma_heap_class structure to be declared at build ti=
me
> > placing it into read-only memory, instead of having to be dynamically
> > allocated at boot time.
> >
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> > ---
> >  drivers/dma-buf/dma-heap.c | 26 ++++++++++++++------------
> >  1 file changed, 14 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 84ae708fafe7..bcca6a2bbce8 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -43,10 +43,18 @@ struct dma_heap {
> >         struct cdev heap_cdev;
> >  };
> >
> > +static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
> > +{
> > +       return kasprintf(GFP_KERNEL, "dma_heap/%s", dev_name(dev));
> > +}
> > +
> >  static LIST_HEAD(heap_list);
> >  static DEFINE_MUTEX(heap_list_lock);
> >  static dev_t dma_heap_devt;
> > -static struct class *dma_heap_class;
> > +static struct class dma_heap_class =3D {
> > +       .name =3D DEVNAME,
> > +       .devnode =3D dma_heap_devnode,
> > +};
> >  static DEFINE_XARRAY_ALLOC(dma_heap_minors);
> >
> >  static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> > @@ -261,7 +269,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >                 goto err1;
> >         }
> >
> > -       dev_ret =3D device_create(dma_heap_class,
> > +       dev_ret =3D device_create(&dma_heap_class,
> >                                 NULL,
> >                                 heap->heap_devt,
> >                                 NULL,
> > @@ -291,7 +299,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >         return heap;
> >
> >  err3:
> > -       device_destroy(dma_heap_class, heap->heap_devt);
> > +       device_destroy(&dma_heap_class, heap->heap_devt);
> >  err2:
> >         cdev_del(&heap->heap_cdev);
> >  err1:
> > @@ -301,11 +309,6 @@ struct dma_heap *dma_heap_add(const struct dma_hea=
p_export_info *exp_info)
> >         return err_ret;
> >  }
> >
> > -static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
> > -{
> > -       return kasprintf(GFP_KERNEL, "dma_heap/%s", dev_name(dev));
> > -}
> > -
> >  static int dma_heap_init(void)
> >  {
> >         int ret;
> > @@ -314,12 +317,11 @@ static int dma_heap_init(void)
> >         if (ret)
> >                 return ret;
> >
> > -       dma_heap_class =3D class_create(DEVNAME);
> > -       if (IS_ERR(dma_heap_class)) {
> > +       ret =3D class_register(&dma_heap_class);
> > +       if (ret) {
> >                 unregister_chrdev_region(dma_heap_devt, NUM_HEAP_MINORS=
);
> > -               return PTR_ERR(dma_heap_class);
> > +               return ret;
> >         }
> > -       dma_heap_class->devnode =3D dma_heap_devnode;
> >
> >         return 0;
> >  }
> >
> > --
> > 2.43.0
>
> Reviewed-by: T.J. Mercier <tjmercier@google.com>


FWIW, please free to add my
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

>
>
> Is this really a resend? I don't see anything on lore and I can't
> recall seeing this patch in my inbox before.


Best,
Sumit.

--=20
Thanks and regards,

Sumit Semwal (he / him)
Tech Lead - LCG, Vertical Technologies
Linaro.org =E2=94=82 Open source software for ARM SoCs
