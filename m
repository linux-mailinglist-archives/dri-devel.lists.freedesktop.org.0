Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DAD6E6AC9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 19:18:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF87910E15E;
	Tue, 18 Apr 2023 17:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A966810E15E;
 Tue, 18 Apr 2023 17:18:40 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-38e12d973bfso426524b6e.0; 
 Tue, 18 Apr 2023 10:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681838319; x=1684430319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ue2iHRPcDF/ysAHWZn+Uzs9V6+se5cTuzHkq8jUYOro=;
 b=oA2oNpYHM92LdnuKDr3Xxg+ZAlH1XSEIZN3DkP3xGXTJ6T54M3aRkfX5tBihA+HZ48
 UEjYuRCZxJ18vsGUxvvjQL1pKQaJGpuTPBOJ4u2Juy1aj+osBiGPnbGcs4eoe+HfDyuk
 N3G3TjYt/MvOUS66Vlj6mMPlYv/LoX2A9KySlNVlSnciAxWP93ylegG4V5rVVCLvoAKi
 TihPrVXfmlMsTAET36Sp1Opp6+1ZqlRuxOs3WEznGlSugviurHthLoAMEUqhh6bwM9/P
 Th3PyIyw1eaF8JSatA0GLrI0pJpEY/wTnmivnm4qSuc+fh9K0Bj69Rmpi8b3HGZu8G/h
 gMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681838319; x=1684430319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ue2iHRPcDF/ysAHWZn+Uzs9V6+se5cTuzHkq8jUYOro=;
 b=Vkbk77G1EbFjoz5EmH0981GM7MSnovoxGIcSRGuDpBrO0FC+c3YKgZJcP1m0a1qHAJ
 PpLcEW0vud8et5I53cnXSRUygqBabPCsbk9ZroXlESPr594LV/FHa7/UoOxi6KjBDJ+a
 Cv66rKR7MTWZClVRb+NAabka6SLpvDYMPvum8TlilN5h5nFH794BIPvgEfYetFYIad4K
 8hGEqOPw9kJjkLrTl44D4E6DV01oj1kR62K1/OqXSUtz/yAUod/NSKNhpS/xvYXAMMvc
 7C7AJcudWWB8dni46sNQn5u4m3K8pK38tOQ+vtLKY9dG6wBruvJT9uHWWMMOp8C0fzSb
 s4QQ==
X-Gm-Message-State: AAQBX9dn0iylACyTiLslFjvleUrhElBjHQ1y+SEQjuwryHw0/0nkJAKq
 FdCiRfq065+nqP91O2KhN8yXYHKGHjPY0kcP1X8=
X-Google-Smtp-Source: AKy350aUXuowZHdSG+le2TE+OScOFH/nNQ3Cuqcw4KVChsc6z4+U32TxYsRHn6fStZLCcdfEyiG2Jd9T67D4kPpSVJ4=
X-Received: by 2002:aca:c002:0:b0:384:1cf9:912e with SMTP id
 q2-20020acac002000000b003841cf9912emr867467oif.5.1681838319362; Tue, 18 Apr
 2023 10:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-5-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230417155613.4143258-5-tvrtko.ursulin@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 18 Apr 2023 10:18:28 -0700
Message-ID: <CAF6AEGuobv8+fU-WU9D9vffNJC5zCqrHDtkppf__ieMJDHsWnw@mail.gmail.com>
Subject: Re: [RFC 4/6] drm: Add simple fdinfo memory helpers
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 8:56=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> For drivers who only wish to show one memory region called 'system,
> and only account the GEM buffer object handles under it.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  drivers/gpu/drm/drm_file.c | 45 ++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_file.h     |  6 +++++
>  2 files changed, 51 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index e202f79e816d..1e70669dddf7 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -872,6 +872,51 @@ void drm_send_event(struct drm_device *dev, struct d=
rm_pending_event *e)
>  }
>  EXPORT_SYMBOL(drm_send_event);
>
> +static void
> +add_obj(struct drm_gem_object *obj, struct drm_fdinfo_memory_stat *stats=
)
> +{
> +       u64 sz =3D obj->size;
> +
> +       stats[0].size +=3D sz;
> +
> +       if (obj->handle_count > 1)
> +               stats[0].shared +=3D sz;
> +
> +       if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true)))
> +               stats[0].active +=3D sz;
> +
> +       /* Not supported. */
> +       stats[0].resident =3D ~0ull;
> +       stats[0].purgeable =3D ~0ull;

Hmm, this kinda makes the simple helper not very useful.  In my
version, you get something that is useful for all UMA drivers (which
all, IIRC, have some form of madv ioctl).  I was kinda imagining that
for ttm drivers, my print_memory_stats() would just become a helper
and that TTM (or "multi-region") drivers would have their own thing.

BR,
-R

> +}
> +
> +char **
> +drm_query_fdinfo_system_region(struct drm_device *dev, unsigned int *num=
)
> +{
> +       static char *region[] =3D {
> +               "system",
> +       };
> +
> +       *num =3D 1;
> +
> +       return region;
> +}
> +EXPORT_SYMBOL(drm_query_fdinfo_system_region);
> +
> +void
> +drm_query_fdinfo_system_memory(struct drm_file *file,
> +                              struct drm_fdinfo_memory_stat *stats)
> +{
> +       struct drm_gem_object *obj;
> +       int id;
> +
> +       spin_lock(&file->table_lock);
> +       idr_for_each_entry(&file->object_idr, obj, id)
> +               add_obj(obj, stats);
> +       spin_unlock(&file->table_lock);
> +}
> +EXPORT_SYMBOL(drm_query_fdinfo_system_memory);
> +
>  static void
>  print_stat(struct drm_printer *p, const char *stat, const char *region, =
u64 sz)
>  {
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 00d48beeac5c..dd7c6fb2c975 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -383,6 +383,12 @@ struct drm_fdinfo_memory_stat {
>         u64 active;
>  };
>
> +char **drm_query_fdinfo_system_region(struct drm_device *dev,
> +                                     unsigned int *num);
> +void drm_query_fdinfo_system_memory(struct drm_file *file,
> +                                   struct drm_fdinfo_memory_stat *stats)=
;
> +
> +
>  /**
>   * drm_is_primary_client - is this an open file of the primary node
>   * @file_priv: DRM file
> --
> 2.37.2
>
