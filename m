Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 191F77B6D58
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 17:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405D410E2B7;
	Tue,  3 Oct 2023 15:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9138E10E2B7;
 Tue,  3 Oct 2023 15:42:04 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-533d31a8523so1954400a12.1; 
 Tue, 03 Oct 2023 08:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696347723; x=1696952523; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zwcIH/MJaknxI2AysetsnqfxTchI6FhcS9I0JiipDi8=;
 b=GjlPMV7fpxE49vm/ctofHH4//YYxtyK/wcLjszYQ9nUnilT90BJYZOquv9Gp8XDYhj
 LOcWyBBMPmk7UYw1ZxqjTMGnPtjMDlYk9T+xFdEk3S9hDxJlxamtqtYHtaPawj4/butk
 HGgTxhMQO7CA9KClFdH8i6Q4H/Jr6HVGxIIG7XbGW2QTeKXsglrTm74sMQWWbaRk1UiC
 uENyn6Z+uEkukZ5nCp/207keKsY40sDdm+AqjpHXFyXjb5S9eFmI1DcTE0sNojDIMNaR
 Kvlb2mh3AiYf/t+1EKje8ZU34ZGTVrvFlh8z4XCSlAP5VSoUearOR/2KBIkXtgwdsbzb
 D+fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696347723; x=1696952523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zwcIH/MJaknxI2AysetsnqfxTchI6FhcS9I0JiipDi8=;
 b=ryYXQUcSXzM/zjS5wdudFnTqF7do+0/1sa1lMwd2wyzADx7IH59NLNEbcSZWAfIK+E
 dbiq3bHGcK9YsETc4KyVWagjSdffosaM5amVhkddrY4qOdFTqKgCi3XaEfpdvORRB740
 TO0qWSM93HKWSSjgFd1xAxUdJEWxaVBxluAekJOrzxp73t2X8kljbjhQaXJT9AtR+lZD
 aRFjqH9k9UTn6Bu2I7LMTUj3vvYmLJwkY+QLfxPt6yv27LbQah8crSASSqt/trOhg0UX
 opIb7GgHjb+KeoiJN+hzapOg6Bbm4zEZyNelvhDpWWWNtVnoOr/wDd8/p8sFzRVctENJ
 Gkeg==
X-Gm-Message-State: AOJu0YwXCvmRqfYKJscKKgQV6fPdXa3nBgLLQb7c1vmy6PJTDyLm/7B9
 CZJ3hdYorfjqj1qpBCYUvlIzf0RppKHmk3En1PM=
X-Google-Smtp-Source: AGHT+IFfYq7iZhbGBkD+298cNE5AGyY/ae4vqG/gUVjcZgH8FPFdolrszeguKhwmL4VBTmQ0KiloX9AVBu/Hy81fRBA=
X-Received: by 2002:a05:6402:d0:b0:530:ccf7:37af with SMTP id
 i16-20020a05640200d000b00530ccf737afmr12920690edu.12.1696347722588; Tue, 03
 Oct 2023 08:42:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230929181616.2769345-1-adrian.larumbe@collabora.com>
 <20230929181616.2769345-5-adrian.larumbe@collabora.com>
In-Reply-To: <20230929181616.2769345-5-adrian.larumbe@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 3 Oct 2023 08:41:49 -0700
Message-ID: <CAF6AEGuQEi8piaw60ySOqfQpjr-cvR0cw8U78=kG3UyMv-NQYg@mail.gmail.com>
Subject: Re: [PATCH v8 4/5] drm/drm_file: Add DRM obj's RSS reporting function
 for fdinfo
To: =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
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
Cc: kernel@collabora.com, tzimmermann@suse.de, tvrtko.ursulin@linux.intel.com,
 sean@poorly.run, quic_abhinavk@quicinc.com, mripard@kernel.org,
 steven.price@arm.com, healych@amazon.com, boris.brezillon@collabora.com,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 29, 2023 at 11:16=E2=80=AFAM Adri=C3=A1n Larumbe
<adrian.larumbe@collabora.com> wrote:
>
> Some BO's might be mapped onto physical memory chunkwise and on demand,
> like Panfrost's tiler heap. In this case, even though the
> drm_gem_shmem_object page array might already be allocated, only a very
> small fraction of the BO is currently backed by system memory, but
> drm_show_memory_stats will then proceed to add its entire virtual size to
> the file's total resident size regardless.
>
> This led to very unrealistic RSS sizes being reckoned for Panfrost, where
> said tiler heap buffer is initially allocated with a virtual size of 128
> MiB, but only a small part of it will eventually be backed by system memo=
ry
> after successive GPU page faults.
>
> Provide a new DRM object generic function that would allow drivers to
> return a more accurate RSS and purgeable sizes for their BOs.
>
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
>  drivers/gpu/drm/drm_file.c | 8 +++++---
>  include/drm/drm_gem.h      | 9 +++++++++
>  2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 883d83bc0e3d..9a1bd8d0d785 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -930,6 +930,8 @@ void drm_show_memory_stats(struct drm_printer *p, str=
uct drm_file *file)
>         spin_lock(&file->table_lock);
>         idr_for_each_entry (&file->object_idr, obj, id) {
>                 enum drm_gem_object_status s =3D 0;
> +               size_t add_size =3D (obj->funcs && obj->funcs->rss) ?
> +                       obj->funcs->rss(obj) : obj->size;
>
>                 if (obj->funcs && obj->funcs->status) {
>                         s =3D obj->funcs->status(obj);
> @@ -944,7 +946,7 @@ void drm_show_memory_stats(struct drm_printer *p, str=
uct drm_file *file)
>                 }
>
>                 if (s & DRM_GEM_OBJECT_RESIDENT) {
> -                       status.resident +=3D obj->size;
> +                       status.resident +=3D add_size;
>                 } else {
>                         /* If already purged or not yet backed by pages, =
don't
>                          * count it as purgeable:
> @@ -953,14 +955,14 @@ void drm_show_memory_stats(struct drm_printer *p, s=
truct drm_file *file)
>                 }
>
>                 if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(=
true))) {
> -                       status.active +=3D obj->size;
> +                       status.active +=3D add_size;
>
>                         /* If still active, don't count as purgeable: */
>                         s &=3D ~DRM_GEM_OBJECT_PURGEABLE;
>                 }
>
>                 if (s & DRM_GEM_OBJECT_PURGEABLE)
> -                       status.purgeable +=3D obj->size;
> +                       status.purgeable +=3D add_size;
>         }
>         spin_unlock(&file->table_lock);
>
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index bc9f6aa2f3fe..16364487fde9 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -208,6 +208,15 @@ struct drm_gem_object_funcs {
>          */
>         enum drm_gem_object_status (*status)(struct drm_gem_object *obj);
>
> +       /**
> +        * @rss:
> +        *
> +        * Return resident size of the object in physical memory.
> +        *
> +        * Called by drm_show_memory_stats().
> +        */
> +       size_t (*rss)(struct drm_gem_object *obj);
> +
>         /**
>          * @vm_ops:
>          *
> --
> 2.42.0
>
