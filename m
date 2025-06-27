Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5716AEAC7F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 04:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A65A10E0A0;
	Fri, 27 Jun 2025 02:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FG4Du5Es";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5C110E0A0;
 Fri, 27 Jun 2025 02:03:36 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-52d9a275c27so1211703e0c.0; 
 Thu, 26 Jun 2025 19:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750989816; x=1751594616; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i/f/+hiyDwdHx+cA843RdLoAxbDE7w4hdsMpE4lkbXo=;
 b=FG4Du5Es/55TAWIIXDCgpOPakoH6iGeKmB6sWLPAVTGqv15wPnzwdocLH0nrgms5cG
 fSge2rvIcE/cr6aciCOZbaEKhS0VO6jGLcDPAGkSw3ovQmHgc0bcNIXYZHfIacvMwzi8
 pHDdMjb4VqkJBpUoTBXQo9VLLkJkMBYTE474Jy22uJs/v0zPIRH4/BtjcFV24mibuGDN
 S71OatJAWrZ2dua62PBY9BU5w3Qj6M3s0dQuzhgHJbPo/TOwyE1GI8gb1ll2+YSBufzc
 EqOCV/w+lNWizjEwf3Z0LDoiBuNlc7nWSyFI/k3c0G52MnUCSWQOtUbqbbOcSdcCDUTm
 ZK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750989816; x=1751594616;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i/f/+hiyDwdHx+cA843RdLoAxbDE7w4hdsMpE4lkbXo=;
 b=fFTq4fvli1VI5hhpy3f1OmN9ziauBMX7Mzdvh+yi+tbTn2iC2A3XJVmng3aVHf6ueg
 jRNBwMYP+CpUb6z/r0IVBW7BIZkmExIiTN/n4xjS6ZWicPCt7u036JuLG/QS7POkRUK7
 uFctD7mw0Gf10+BJUeybk2PQZ/vh6caGI6/lFfiwJyC3PrKW6dnhiJzinOLqNbsmnKOV
 F+kjmw/mbDnON5lwVBh6/25DwXvag+P+6Xo30im2kGeZIxapAYmqIGGDxlAfxotjXEnI
 FT3jKP9MPy5oUggGrUBlPsLPO7V/OZdpIQo69x/L2edd6n0mB/i31Y5JYatTQHWvldrY
 2mxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2jlynKSxICdtdW6xvOkez7q96n6b0YsjRBYjcx6keyr0ZnYvgpFMKEPuWEWz31LUj1MxqWtgwhxX5@lists.freedesktop.org,
 AJvYcCXAnjjDI7z5UkvJKVeB2jR/10QbE1VO008juCsHrzT6K+sTpQdK+csxo9ucq9V3FYRhJGbxe68jh4I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDvkF2UsmQ0td/zMRPaaNARaBm9KX1A6JvVN7rqR9Dfw2rpZsi
 eiQdJh6/5mwPvY+WabxxdyzzhRqyZrKVDJ0YIK5bYgnQvxz1oLXMUuJ50Dt71bt/aQuGLnKMXYB
 8uQ+AEfFQMNHEzqRMcVwBVnpDvas4lFk=
X-Gm-Gg: ASbGnctnMAxlOGE+vior0cb9imIMlOP/IKyvhgJtW1XgtyDkR+Jvv0yw34quoTaIaG9
 ofwprplu5aEHA+XKhtr4CXbsny4WkQgj+7GvWxGe1Nktw0KMU09KmKuLxghzyW+AkdrfaYv73pD
 xQJSN38h/aeg9mG4wVwbFuqHD0HtFcm+qL7EUXTZYuBA==
X-Google-Smtp-Source: AGHT+IHhVsq5/VI1dr0dwY9jUchBPbEamRa2csC8XrsamXPtwwwYjcpSjiIYO02pEuPWifIo5HwkuElrIvaVqdLt0x0=
X-Received: by 2002:a05:6122:8c1a:b0:531:2906:752e with SMTP id
 71dfb90a1353d-5330beda07fmr1498050e0c.5.1750989815830; Thu, 26 Jun 2025
 19:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250618-restricted-pointers-drm-v1-0-781e0d88cd92@linutronix.de>
 <20250618-restricted-pointers-drm-v1-2-781e0d88cd92@linutronix.de>
In-Reply-To: <20250618-restricted-pointers-drm-v1-2-781e0d88cd92@linutronix.de>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 11:02:59 +0900
X-Gm-Features: Ac12FXx_H-k6IjgjBdIwZwvFGVMe7aOTzmfWa57DZUuTaImbO0rimzs6HuQBV-w
Message-ID: <CAAQKjZMBfU5pSsY9sHE3DBB1AZ1sBDp6hXiV9iXVo6acEZezWg@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/exynos: Don't use %pK through printk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
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

2025=EB=85=84 6=EC=9B=94 18=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 4:56, T=
homas Wei=C3=9Fschuh
<thomas.weissschuh@linutronix.de>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
>
> Switch to the regular pointer formatting which is safer and
> easier to reason about.

Applied.

Thanks,
Inki Dae

>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c | 32 ++++++++++++++++-----------=
-----
>  2 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_gem.c
> index 4787fee4696f8e6f9eecaacb1535765c246688c8..d44401a695e203bd36b3b6678=
fdeb3572a91bfda 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -174,7 +174,7 @@ static struct exynos_drm_gem *exynos_drm_gem_init(str=
uct drm_device *dev,
>                 return ERR_PTR(ret);
>         }
>
> -       DRM_DEV_DEBUG_KMS(dev->dev, "created file object =3D %pK\n", obj-=
>filp);
> +       DRM_DEV_DEBUG_KMS(dev->dev, "created file object =3D %p\n", obj->=
filp);
>
>         return exynos_gem;
>  }
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_ipp.c
> index ea9f66037600e1020da4b0a9c318ca2f2266a871..03c8490af4f45447d123a2077=
7e5362ebd933b46 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
> @@ -271,7 +271,7 @@ static inline struct exynos_drm_ipp_task *
>         task->src.rect.h =3D task->dst.rect.h =3D UINT_MAX;
>         task->transform.rotation =3D DRM_MODE_ROTATE_0;
>
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "Allocated task %pK\n", task);
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "Allocated task %p\n", task);
>
>         return task;
>  }
> @@ -339,7 +339,7 @@ static int exynos_drm_ipp_task_set(struct exynos_drm_=
ipp_task *task,
>         }
>
>         DRM_DEV_DEBUG_DRIVER(task->dev,
> -                            "Got task %pK configuration from userspace\n=
",
> +                            "Got task %p configuration from userspace\n"=
,
>                              task);
>         return 0;
>  }
> @@ -394,7 +394,7 @@ static void exynos_drm_ipp_task_release_buf(struct ex=
ynos_drm_ipp_buffer *buf)
>  static void exynos_drm_ipp_task_free(struct exynos_drm_ipp *ipp,
>                                  struct exynos_drm_ipp_task *task)
>  {
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "Freeing task %pK\n", task);
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "Freeing task %p\n", task);
>
>         exynos_drm_ipp_task_release_buf(&task->src);
>         exynos_drm_ipp_task_release_buf(&task->dst);
> @@ -559,7 +559,7 @@ static int exynos_drm_ipp_check_format(struct exynos_=
drm_ipp_task *task,
>                                             DRM_EXYNOS_IPP_FORMAT_DESTINA=
TION);
>         if (!fmt) {
>                 DRM_DEV_DEBUG_DRIVER(task->dev,
> -                                    "Task %pK: %s format not supported\n=
",
> +                                    "Task %p: %s format not supported\n"=
,
>                                      task, buf =3D=3D src ? "src" : "dst"=
);
>                 return -EINVAL;
>         }
> @@ -609,7 +609,7 @@ static int exynos_drm_ipp_task_check(struct exynos_dr=
m_ipp_task *task)
>         bool rotate =3D (rotation !=3D DRM_MODE_ROTATE_0);
>         bool scale =3D false;
>
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "Checking task %pK\n", task);
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "Checking task %p\n", task);
>
>         if (src->rect.w =3D=3D UINT_MAX)
>                 src->rect.w =3D src->buf.width;
> @@ -625,7 +625,7 @@ static int exynos_drm_ipp_task_check(struct exynos_dr=
m_ipp_task *task)
>             dst->rect.x + dst->rect.w > (dst->buf.width) ||
>             dst->rect.y + dst->rect.h > (dst->buf.height)) {
>                 DRM_DEV_DEBUG_DRIVER(task->dev,
> -                                    "Task %pK: defined area is outside p=
rovided buffers\n",
> +                                    "Task %p: defined area is outside pr=
ovided buffers\n",
>                                      task);
>                 return -EINVAL;
>         }
> @@ -642,7 +642,7 @@ static int exynos_drm_ipp_task_check(struct exynos_dr=
m_ipp_task *task)
>             (!(ipp->capabilities & DRM_EXYNOS_IPP_CAP_SCALE) && scale) ||
>             (!(ipp->capabilities & DRM_EXYNOS_IPP_CAP_CONVERT) &&
>              src->buf.fourcc !=3D dst->buf.fourcc)) {
> -               DRM_DEV_DEBUG_DRIVER(task->dev, "Task %pK: hw capabilitie=
s exceeded\n",
> +               DRM_DEV_DEBUG_DRIVER(task->dev, "Task %p: hw capabilities=
 exceeded\n",
>                                      task);
>                 return -EINVAL;
>         }
> @@ -655,7 +655,7 @@ static int exynos_drm_ipp_task_check(struct exynos_dr=
m_ipp_task *task)
>         if (ret)
>                 return ret;
>
> -       DRM_DEV_DEBUG_DRIVER(ipp->dev, "Task %pK: all checks done.\n",
> +       DRM_DEV_DEBUG_DRIVER(ipp->dev, "Task %p: all checks done.\n",
>                              task);
>
>         return ret;
> @@ -667,25 +667,25 @@ static int exynos_drm_ipp_task_setup_buffers(struct=
 exynos_drm_ipp_task *task,
>         struct exynos_drm_ipp_buffer *src =3D &task->src, *dst =3D &task-=
>dst;
>         int ret =3D 0;
>
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "Setting buffer for task %pK\n",
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "Setting buffer for task %p\n",
>                              task);
>
>         ret =3D exynos_drm_ipp_task_setup_buffer(src, filp);
>         if (ret) {
>                 DRM_DEV_DEBUG_DRIVER(task->dev,
> -                                    "Task %pK: src buffer setup failed\n=
",
> +                                    "Task %p: src buffer setup failed\n"=
,
>                                      task);
>                 return ret;
>         }
>         ret =3D exynos_drm_ipp_task_setup_buffer(dst, filp);
>         if (ret) {
>                 DRM_DEV_DEBUG_DRIVER(task->dev,
> -                                    "Task %pK: dst buffer setup failed\n=
",
> +                                    "Task %p: dst buffer setup failed\n"=
,
>                                      task);
>                 return ret;
>         }
>
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "Task %pK: buffers prepared.\n",
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "Task %p: buffers prepared.\n",
>                              task);
>
>         return ret;
> @@ -764,7 +764,7 @@ void exynos_drm_ipp_task_done(struct exynos_drm_ipp_t=
ask *task, int ret)
>         struct exynos_drm_ipp *ipp =3D task->ipp;
>         unsigned long flags;
>
> -       DRM_DEV_DEBUG_DRIVER(task->dev, "ipp: %d, task %pK done: %d\n",
> +       DRM_DEV_DEBUG_DRIVER(task->dev, "ipp: %d, task %p done: %d\n",
>                              ipp->id, task, ret);
>
>         spin_lock_irqsave(&ipp->lock, flags);
> @@ -807,7 +807,7 @@ static void exynos_drm_ipp_next_task(struct exynos_dr=
m_ipp *ipp)
>         spin_unlock_irqrestore(&ipp->lock, flags);
>
>         DRM_DEV_DEBUG_DRIVER(ipp->dev,
> -                            "ipp: %d, selected task %pK to run\n", ipp->=
id,
> +                            "ipp: %d, selected task %p to run\n", ipp->i=
d,
>                              task);
>
>         ret =3D ipp->funcs->commit(ipp, task);
> @@ -917,14 +917,14 @@ int exynos_drm_ipp_commit_ioctl(struct drm_device *=
dev, void *data,
>          */
>         if (arg->flags & DRM_EXYNOS_IPP_FLAG_NONBLOCK) {
>                 DRM_DEV_DEBUG_DRIVER(ipp->dev,
> -                                    "ipp: %d, nonblocking processing tas=
k %pK\n",
> +                                    "ipp: %d, nonblocking processing tas=
k %p\n",
>                                      ipp->id, task);
>
>                 task->flags |=3D DRM_EXYNOS_IPP_TASK_ASYNC;
>                 exynos_drm_ipp_schedule_task(task->ipp, task);
>                 ret =3D 0;
>         } else {
> -               DRM_DEV_DEBUG_DRIVER(ipp->dev, "ipp: %d, processing task =
%pK\n",
> +               DRM_DEV_DEBUG_DRIVER(ipp->dev, "ipp: %d, processing task =
%p\n",
>                                      ipp->id, task);
>                 exynos_drm_ipp_schedule_task(ipp, task);
>                 ret =3D wait_event_interruptible(ipp->done_wq,
>
> --
> 2.49.0
>
>
