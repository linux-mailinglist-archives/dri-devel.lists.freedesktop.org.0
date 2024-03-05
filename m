Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB49872523
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 18:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB98A112C1E;
	Tue,  5 Mar 2024 17:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="EH82IdcG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com
 [209.85.219.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB831126F7
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 17:07:30 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id
 3f1490d57ef6-dc742543119so5999773276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 09:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709658450; x=1710263250;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xf8U/YCUFimTwrJwKD9PvTi4VYclikCpHMhYCrDyA6M=;
 b=EH82IdcG7wNeoWGql1mWGvhqF1qgbgQTAacyFCKLA9mKSHbYPsPe2WanJDp6X0NK8F
 vv0aZh30KIA6MdLroG8Mz6G5cn8+n/K6zpbfCVzu76nZlo6tsaK8Dzb/V5vTBCGQxuRx
 eZTp0ov/nsE4UPlSoxPKPIW0qQb0w9apaRiC7ym5O6Fd3lplldvUerpOX67tAx9qqeKs
 TMFwyMu98mTaryFCi2umKrFt2zvv3FsQMq1LNUlFwO0poeNMhcNT9UsMCJ5Fz+NBO4u8
 8JBM8sU84INyPVAa5p81CqyjxKbMbUO5DGRIi1DseqJgK+nDedAzVOIR9qcF2wHydQZS
 w6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709658450; x=1710263250;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xf8U/YCUFimTwrJwKD9PvTi4VYclikCpHMhYCrDyA6M=;
 b=nwtXp1wR0gVz1kWb37weGyrFr1SOSzFoTw5zieQpHElhrbLhtvnpH1mzRW+0V6F+JV
 l4Cyb2bYo39ccBtKa7TAQnIv/vx9sbih0a9gswZWihEUsc9e3oezmngUIbvYS9bCYGFy
 NurWilvDsrMy/psio1EXRVNdvI18of6/c/NFvFVqYTF8bbat+NiuNGP5Dw1K2fSRuqKG
 7kIhmhXrH6rn14NSMzfHJgQ8k4JjuAdZXl97jR94sMvHj7RFQll8bY/vNYtiEY98tyqC
 bNYO1/A7YrLflfK846wIMYSxQaYc4VFFO27Gi82mdrpIlGiUXEFUdtL/hCgcNb1s6MhN
 zs+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV7D578wEORgYpXAJ/NTp9ik9eT9EoQIz2cQmgg4EJBQaQfDjksdyd6EqVYEC1ilzHG1R4fMjYGYGFXhKFuv6iZpxpygg+QhUfu6dtJQLv
X-Gm-Message-State: AOJu0YyE1INijjpffaYu9xx3z4XAkxwQwdGZWEw7vGmG/xb5RhK4+9Jj
 PbM2oJo4aLD9dRXR7/i2p6/ymqksTWI+tz2AosppiOSvpxFlW89A3xUZul118aKAlTio2D18YCu
 CFBk/diqPHxEMDDxSxpJML6lFX6pjSpmFmIJm
X-Google-Smtp-Source: AGHT+IFcqAf9bC17H0h/tfqRs3xLoCqraMHelviOyaD+ddhbqiDr1geTm3/Xp4CxcT44v3PUNnOU4ePnKKfLZOimpLI=
X-Received: by 2002:a05:6902:2012:b0:dc6:18d0:95b0 with SMTP id
 dh18-20020a056902201200b00dc618d095b0mr11090518ybb.8.1709658449653; Tue, 05
 Mar 2024 09:07:29 -0800 (PST)
MIME-Version: 1.0
References: <20240305-class_cleanup-drm-v1-0-94f82740525a@marliere.net>
 <20240305-class_cleanup-drm-v1-4-94f82740525a@marliere.net>
In-Reply-To: <20240305-class_cleanup-drm-v1-4-94f82740525a@marliere.net>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 5 Mar 2024 09:07:17 -0800
Message-ID: <CABdmKX0VGyBdTo8gzEocyz2HFcqEtu_31PYVjWzioBdCbnXW6w@mail.gmail.com>
Subject: Re: [PATCH RESEND drm-misc 4/4] dma-buf: heaps: make dma_heap_class
 constant
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, Helge Deller <deller@gmx.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
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

On Tue, Mar 5, 2024 at 3:34=E2=80=AFAM Ricardo B. Marliere <ricardo@marlier=
e.net> wrote:
>
> Since commit 43a7206b0963 ("driver core: class: make class_register() tak=
e
> a const *"), the driver core allows for struct class to be in read-only
> memory, so move the dma_heap_class structure to be declared at build time
> placing it into read-only memory, instead of having to be dynamically
> allocated at boot time.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> ---
>  drivers/dma-buf/dma-heap.c | 26 ++++++++++++++------------
>  1 file changed, 14 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> index 84ae708fafe7..bcca6a2bbce8 100644
> --- a/drivers/dma-buf/dma-heap.c
> +++ b/drivers/dma-buf/dma-heap.c
> @@ -43,10 +43,18 @@ struct dma_heap {
>         struct cdev heap_cdev;
>  };
>
> +static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
> +{
> +       return kasprintf(GFP_KERNEL, "dma_heap/%s", dev_name(dev));
> +}
> +
>  static LIST_HEAD(heap_list);
>  static DEFINE_MUTEX(heap_list_lock);
>  static dev_t dma_heap_devt;
> -static struct class *dma_heap_class;
> +static struct class dma_heap_class =3D {
> +       .name =3D DEVNAME,
> +       .devnode =3D dma_heap_devnode,
> +};
>  static DEFINE_XARRAY_ALLOC(dma_heap_minors);
>
>  static int dma_heap_buffer_alloc(struct dma_heap *heap, size_t len,
> @@ -261,7 +269,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_e=
xport_info *exp_info)
>                 goto err1;
>         }
>
> -       dev_ret =3D device_create(dma_heap_class,
> +       dev_ret =3D device_create(&dma_heap_class,
>                                 NULL,
>                                 heap->heap_devt,
>                                 NULL,
> @@ -291,7 +299,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_e=
xport_info *exp_info)
>         return heap;
>
>  err3:
> -       device_destroy(dma_heap_class, heap->heap_devt);
> +       device_destroy(&dma_heap_class, heap->heap_devt);
>  err2:
>         cdev_del(&heap->heap_cdev);
>  err1:
> @@ -301,11 +309,6 @@ struct dma_heap *dma_heap_add(const struct dma_heap_=
export_info *exp_info)
>         return err_ret;
>  }
>
> -static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
> -{
> -       return kasprintf(GFP_KERNEL, "dma_heap/%s", dev_name(dev));
> -}
> -
>  static int dma_heap_init(void)
>  {
>         int ret;
> @@ -314,12 +317,11 @@ static int dma_heap_init(void)
>         if (ret)
>                 return ret;
>
> -       dma_heap_class =3D class_create(DEVNAME);
> -       if (IS_ERR(dma_heap_class)) {
> +       ret =3D class_register(&dma_heap_class);
> +       if (ret) {
>                 unregister_chrdev_region(dma_heap_devt, NUM_HEAP_MINORS);
> -               return PTR_ERR(dma_heap_class);
> +               return ret;
>         }
> -       dma_heap_class->devnode =3D dma_heap_devnode;
>
>         return 0;
>  }
>
> --
> 2.43.0

Reviewed-by: T.J. Mercier <tjmercier@google.com>

Is this really a resend? I don't see anything on lore and I can't
recall seeing this patch in my inbox before.
