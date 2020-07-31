Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA101233FE9
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 09:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728616E0AB;
	Fri, 31 Jul 2020 07:20:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B666E0AB
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 07:20:39 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id f24so9956575ejx.6
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 00:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=luiEONe58YbCF+Vc0W6WqJU9oWGQnZvE/YOoPDaENXc=;
 b=ex/cS/0XNfJwMQMUI6PJzSOw2YngvshWcNWTU0a3ahM/owcKVEKfgIZSMgUJVfXhUO
 bA+/3fxmRIruv1sP9095P2HkIMaMm6G1F4Lm4tr7MezD0+TNhoVv5FJKtQb46YOn9gv+
 keubfGFU2FDUz8aQQpRt66VnJzjZsykE9NYL2W3W5ZYV1EUQCxoA/wTPPCImAjNPTA1h
 QXCN3SiEMt1ZaRedupSgVOrfZJOOvJQtuDtB5HWFPm0fQeqNoxzeGmKfinA+nuK0xiRe
 HqQ56sS5igQtSeKnOZq0ynEPVxUVumpcQmWPu1Zib3mPseMT1eH6y0LmwFVTMAEcjJJV
 aidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=luiEONe58YbCF+Vc0W6WqJU9oWGQnZvE/YOoPDaENXc=;
 b=Mn9RR/xqgD545GHIN9R68cLXBB+7RBSj6024F/3QcaVBgMc/9ycyZhXazzl5gqeSkL
 zFq9/r1Wk7sKKiem0ct50QoR/tcz6r7djpM6JW48kYkwOV17Rlpsro94SD+gUwCTHYwS
 xFG4RCtAPU0LjzqKX+m4mwESZLxXilkcguF3S1M++rQBes4kwSQ8t4JpOp4YIAfF1Pxm
 +QAi11uWQjMTUiHGsefCV7DbTIXfvyoKq0YqfTOXkZf3i1ODigLw7UWDouoAyQiniP9A
 A0BrMYPp01AUj4EbvplU2tqdkjcyYsnddJF9ZVLElvVMVxOW4vivqKOg3afQfPcGCMLs
 d/AA==
X-Gm-Message-State: AOAM530unRhv0+CtoQpXqtoZlNVzymJTVnzPF+JGCOTKRYj4ee6PmyL4
 xmxcurMSbEVXjv69j17tV3mVLhMMcBFxgt5li4gHvw==
X-Google-Smtp-Source: ABdhPJyIqTppcN5tkkzUucxTLSRKPHh9iWvgT5HOG6BCFCu72iUe3txqZfcZVpJ/Ewhg/VeJZaMEK97HdB22LwFG8R4=
X-Received: by 2002:a17:906:b6c3:: with SMTP id
 ec3mr2643317ejb.101.1596180037563; 
 Fri, 31 Jul 2020 00:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-5-airlied@gmail.com>
 <e1d52e5c-326f-8069-9310-8fe96deb09df@suse.de>
In-Reply-To: <e1d52e5c-326f-8069-9310-8fe96deb09df@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 31 Jul 2020 17:20:26 +1000
Message-ID: <CAPM=9tzDu+_kr2c4Qhx=mQ7WZdNUCk83-3d+mbFskVi+A-sFpA@mail.gmail.com>
Subject: Re: [PATCH 04/49] drm/ttm: provide a driver-led init path for generic
 mm manager.
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, Roland Scheidegger <sroland@vmware.com>,
 "Koenig, Christian" <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 31 Jul 2020 at 16:57, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 31.07.20 um 06:04 schrieb Dave Airlie:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This lets the generic mm manager be initialised by the driver.
> >
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > ---
> >  drivers/gpu/drm/ttm/ttm_bo_manager.c | 23 ++++++++++++++++++++---
> >  include/drm/ttm/ttm_bo_driver.h      |  3 +++
> >  2 files changed, 23 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
> > index facd3049c3aa..64234e5caee3 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
> > @@ -104,8 +104,8 @@ static void ttm_bo_man_put_node(struct ttm_mem_type_manager *man,
> >       }
> >  }
> >
> > -static int ttm_bo_man_init(struct ttm_mem_type_manager *man,
> > -                        unsigned long p_size)
> > +static int ttm_bo_man_init_private(struct ttm_mem_type_manager *man,
> > +                 unsigned long p_size)
> >  {
> >       struct ttm_range_manager *rman;
> >
> > @@ -119,6 +119,23 @@ static int ttm_bo_man_init(struct ttm_mem_type_manager *man,
> >       return 0;
> >  }
> >
> > +int ttm_bo_man_init(struct ttm_bo_device *bdev,
> > +                 struct ttm_mem_type_manager *man,
> > +                 unsigned long p_size)
> > +{
> > +     int ret;
> > +
> > +     man->func = &ttm_bo_manager_func;
>
> Overriding man->func is the only reason for drivers to call
> ttm_bo_man_init_mm_base and ttm_bo_use_mm directly (e.g., as in nouveau)?
>
> If so, Wouldn't it be better to do
>
>   if (!man->func)
>       man->func = &ttm_bo_manager_func;
>
> in ttm_bo_man_init and forget about the other fucntions?

No ttm_bo_man_init, is just for the range manager, if you want to use
it, it's not generic code for driver manager that want to use a
different manager class (like nouveau).

Dave.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
