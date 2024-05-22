Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DADD88CC5BA
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 19:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427A610E1C7;
	Wed, 22 May 2024 17:40:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mrsplrw2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D6910E1C7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 17:40:53 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-de607ab52f4so5248337276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 10:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1716399652; x=1717004452;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m+KExuXY6x2RNXAGihFUdQFtzxyzRd1UAydMgLYyZeM=;
 b=mrsplrw2H5WcW43Q8XYEXz+DcaQKJBzP5B6DhkjdTFn3fFbK7IEOCES5f/LfNj2GNK
 xgRSIDfh3oAo2o9SYgJFG6fjWVtd7w2nr4mzzxuWlkFbVKx5NRAR+V1rxCGSfiOAMflx
 e/aLtodVYRlIOrVHO1P9BFoRKCHsaHcG5Uy8bTSDxJ6DFfv55YsuBdZBILw1K07peu/h
 /E3FptDVkUedSBhUf6E3Haag3KyYSbAl8oPAHjNVUab1mZXTHynsk020ax6Ug6D0V1Oc
 4GELoo+lx6wiJnwhoKDOk3yixuItgxtjz/DviP0FaYWuHUUSTDeNtmQstaGPUEMU/9sC
 KPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716399652; x=1717004452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m+KExuXY6x2RNXAGihFUdQFtzxyzRd1UAydMgLYyZeM=;
 b=UnTkXtAkM5sFx31z9OODnXr6QGW/bxnDbxZLxnIWLhoaFByarsvQzP8tK+t41meU/T
 vc3N3KTtDOn8zM3oNoU4uz7aVL83OXddvUgWGY9pytbIsDsFPOO7BtIcRlgASAO/XSr5
 B9/nq8zoKTTpt2oHUccfEiUEMOechBQxFhwEq604LZ1pIORJPad6tAkmBfVrffHSYAa4
 fYvIWxc5QZaWnt7fP/FRmeuvvDjyPMx62l+yd5MDe4iHjh+epe70sLy/CCeKpAXm0PxG
 Z9dk0nPwQ96wztvjG+gTgRnMLgKkrvCmZPxA/2cW49srBS+upvx6jQjo6wRrGu0wOoZP
 XfqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMPyBEewTsmb0jeDOfKh5GbUp2o0pNKdawYtrx/i8Y2dlGxc5OSEBNQgKMAFWm9g7FGSJCC2Bfp5A3v+O4Ggwiuv6O0z/EdgDo7Iah375j
X-Gm-Message-State: AOJu0Yw8aK+6P/CaYuRSF50V54AuqWoLL/lV7GeD9nKdf2mmpIvbnXp2
 Tp2HNEFVV48/Z8Ly/6EBa8oKclHNr6jCCsUHOx32fVn4D3n4Ei6WRVdTL6EG01wa4ign7Kdbc43
 sYqM+SlaQCiDeyf7Rg8Z+nU/X9aQla8yYppvl
X-Google-Smtp-Source: AGHT+IFEar4omGEdEg7p1pIeJHpqJdxEZysSMoFwL4CvUt49f3bponvnO1J/Gp3qNrH1hFjfFb/lUdHwXQMMQUkAlvw=
X-Received: by 2002:a25:e08c:0:b0:de4:5d85:6928 with SMTP id
 3f1490d57ef6-df4e0bc6db1mr3041714276.31.1716399651838; Wed, 22 May 2024
 10:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240522122326.696928-1-pchelkin@ispras.ru>
In-Reply-To: <20240522122326.696928-1-pchelkin@ispras.ru>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 22 May 2024 10:40:39 -0700
Message-ID: <CABdmKX2tb_Vn8sF_hXVOMZ7HV9cU9KMwu_WyKrJuoeNjWF85bQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: handle testing kthreads creation failure
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, 
 lvc-project@linuxtesting.org, stable@vger.kernel.org
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

On Wed, May 22, 2024 at 5:24=E2=80=AFAM Fedor Pchelkin <pchelkin@ispras.ru>=
 wrote:
>
> kthread creation may possibly fail inside race_signal_callback(). In
> such case stop the already started threads and return with error code.
>
> Found by Linux Verification Center (linuxtesting.org).
>
> Fixes: 2989f6451084 ("dma-buf: Add selftests for dma-fence")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> ---
>  drivers/dma-buf/st-dma-fence.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/dma-buf/st-dma-fence.c b/drivers/dma-buf/st-dma-fenc=
e.c
> index b7c6f7ea9e0c..ab1ec4631578 100644
> --- a/drivers/dma-buf/st-dma-fence.c
> +++ b/drivers/dma-buf/st-dma-fence.c
> @@ -540,6 +540,12 @@ static int race_signal_callback(void *arg)
>                         t[i].before =3D pass;
>                         t[i].task =3D kthread_run(thread_signal_callback,=
 &t[i],
>                                                 "dma-fence:%d", i);
> +                       if (IS_ERR(t[i].task)) {
> +                               ret =3D PTR_ERR(t[i].task);
> +                               while (--i >=3D 0)
> +                                       kthread_stop(t[i].task);

This looks like it needs to be kthread_stop_put since get_task_struct
was called for previous successful kthread_run calls.

> +                               return ret;
> +                       }
>                         get_task_struct(t[i].task);
>                 }
>
> --
> 2.39.2
>
