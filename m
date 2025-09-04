Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9145B42FB5
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 04:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C61710E3D1;
	Thu,  4 Sep 2025 02:22:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RLSNpFH7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CA810E3D1
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Sep 2025 02:22:06 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-61cd3748c6dso912454a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Sep 2025 19:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756952525; x=1757557325; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DXVSLMWASFD03eCh7RAZNIgqIvAhKcab9R9R5MJY7EU=;
 b=RLSNpFH7RCqsGtIPPz203cD69HitUJJm77X+PZMMDdLS3ldqp0cxmPGQYgJTSxXnSk
 QkxTdzxI9FMIxGpXQpuTPlM8sfhm1QgY3uJ32YedZJtn8rZ4KOGRuRNmJ6z3yQkQ+YKp
 ClHN7ovowhn+AFYM9uYYQ82OSCA9aSK/3ysSoiqSVO4lgcaaH2ppZFnUYFhzwlv9tDY6
 t6P3RisArxVGx26YSq0+rrCtPg7kXFrGSXvmp9ar7LiY3nH1iHUFJawlOoub2JWTNBuX
 LWzMhTgAca/FHz0wZudbMSPRlLI94w1f50gb53YCHDL2kndeyfJo8hI5Kx6iPoctV0Fi
 6u0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756952525; x=1757557325;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DXVSLMWASFD03eCh7RAZNIgqIvAhKcab9R9R5MJY7EU=;
 b=IDBkKjLL2ONZW8qUDRq6mlKUv27FQ36uswuOyIY6203oisFB8dLZtejMpVlFGhG6NP
 +si9n9UOlmb41PuciP8zvFt61WVVDXZzOUu4ipFerJnUfnhueHP9XCjqA82LpGmlSDYG
 7NDlvrifTCXBjgrkHI3Tc1OJvKRWwmJovtWK69Nnu/L/vZ0vMr1Lb2ikRGAFw1oqDg/C
 4F9R7/w2Wdkrp4C1QDWk7sYYjXpiOXpgQ6/TjiV7V0PyeHcj0tqa5Av0F4f5DuGBtLbF
 k1J0GpDoE6JUMCb4Z+r/w8NiB1MoUPFimPzuyjz7mixcuIGsl2H59XF93aqKj5V+m+NP
 rTfw==
X-Gm-Message-State: AOJu0YwBIhgRdNQFWQU7hIRESUeHofkB7whe0D1in68eMMRq6m8FQK0f
 2xIPPaZxmaFvn5F4Om0k5Xx43QO7MpbDjDEIMx8iGmVd1DUwGcbZoNrrsX5xDAgUiFSwJZFslwa
 8CAHhPs2bB+DIns4NTvgh+MVJqo53T86cWA==
X-Gm-Gg: ASbGncur0yi166zPO5mVS3x8cao1iKik4DfECundwWUn75NTAaO+0xX+97sF2xE72am
 n96dRcTyM1PfR6k+A/JUh5gCza6z6LWBma6mQAjdaSKFVMPtC1ZQUn88cVOcHlwImif1ZuLTThl
 bal0UDkTIaiJloYAFl53SW7A8QTa+AbIjCjF5auK2MwJldxW1LZYB2lcvJa92Lm6ZsRP8vTmRU1
 6pdBA==
X-Google-Smtp-Source: AGHT+IEcqmtj81HfK+9kHhNiA6AXxxKlsMDqPVXZRpbMNel0k6GBh80LEZ+J24B+dPaLV1bTxSagay7ZwP49Lkj+V20=
X-Received: by 2002:a17:906:f596:b0:b04:65b4:707 with SMTP id
 a640c23a62f3a-b0465b40b24mr528466666b.13.1756952525112; Wed, 03 Sep 2025
 19:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250902041024.2040450-1-airlied@gmail.com>
 <20250902041024.2040450-10-airlied@gmail.com>
 <e1507242-952c-4131-93e1-6af52760b283@amd.com>
In-Reply-To: <e1507242-952c-4131-93e1-6af52760b283@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 4 Sep 2025 12:21:53 +1000
X-Gm-Features: Ac12FXwW1MaD_A4-ok2fSvRkEovDekWEGy5dDSEU50r6EOTRHxe79q64hkc2Qto
Message-ID: <CAPM=9txo88E9y96w1Ti5hXC322HVRDhD18CrmBj8zse8Xx=V4Q@mail.gmail.com>
Subject: Re: [PATCH 09/15] ttm/pool: initialise the shrinker earlier
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, tj@kernel.org, 
 Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, 
 Muchun Song <muchun.song@linux.dev>, cgroups@vger.kernel.org, 
 Dave Chinner <david@fromorbit.com>, Waiman Long <longman@redhat.com>,
 simona@ffwll.ch
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

On Wed, 3 Sept 2025 at 00:07, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
>
>
> On 02.09.25 06:06, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > Later memcg enablement needs the shrinker initialised before the list l=
ru,
> > Just move it for now.
>
> Hui? That should just be the other way around.
>
> The shrinker depends on the list lru and so needs to come after ttm_pool_=
type_init() and not before.

list_lru_init_memcg needs to take a registered shrinker as an
argument, also the shrinker list is locked so this is fine, if we get
called to shrinker before ttm_pool_type_init happens, shrinker_scan
will have 0 pools.

Dave.

>
> Regards,
> Christian.
>
> >
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > ---
> >  drivers/gpu/drm/ttm/ttm_pool.c | 22 +++++++++++-----------
> >  1 file changed, 11 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_p=
ool.c
> > index 9a8b4f824bc1..2c9969de7517 100644
> > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > @@ -1381,6 +1381,17 @@ int ttm_pool_mgr_init(unsigned long num_pages)
> >       spin_lock_init(&shrinker_lock);
> >       INIT_LIST_HEAD(&shrinker_list);
> >
> > +     mm_shrinker =3D shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool=
");
> > +     if (!mm_shrinker)
> > +             return -ENOMEM;
> > +
> > +     mm_shrinker->count_objects =3D ttm_pool_shrinker_count;
> > +     mm_shrinker->scan_objects =3D ttm_pool_shrinker_scan;
> > +     mm_shrinker->batch =3D TTM_SHRINKER_BATCH;
> > +     mm_shrinker->seeks =3D 1;
> > +
> > +     shrinker_register(mm_shrinker);
> > +
> >       for (i =3D 0; i < NR_PAGE_ORDERS; ++i) {
> >               ttm_pool_type_init(&global_write_combined[i], NULL,
> >                                  ttm_write_combined, i);
> > @@ -1403,17 +1414,6 @@ int ttm_pool_mgr_init(unsigned long num_pages)
> >  #endif
> >  #endif
> >
> > -     mm_shrinker =3D shrinker_alloc(SHRINKER_NUMA_AWARE, "drm-ttm_pool=
");
> > -     if (!mm_shrinker)
> > -             return -ENOMEM;
> > -
> > -     mm_shrinker->count_objects =3D ttm_pool_shrinker_count;
> > -     mm_shrinker->scan_objects =3D ttm_pool_shrinker_scan;
> > -     mm_shrinker->batch =3D TTM_SHRINKER_BATCH;
> > -     mm_shrinker->seeks =3D 1;
> > -
> > -     shrinker_register(mm_shrinker);
> > -
> >       return 0;
> >  }
> >
>
