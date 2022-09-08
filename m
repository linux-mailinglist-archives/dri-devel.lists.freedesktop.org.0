Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5EA5B15E8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 09:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23DE10E995;
	Thu,  8 Sep 2022 07:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F70F10E995
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 07:46:49 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id x14so10982036lfu.10
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 00:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=qNTIN/IhlL6jREs741d+iZ6+IGeRCXB4ds5TvTZFqJY=;
 b=SiXyAIFLM6/F7h3+B3PFfjfk2/9usYvx/Ik7xF6WSzqzj+Ez69RlxLEPDBigiaUz2E
 yOeZEnjL7oCoWDvdfa+t5BzUMUbhbpAZ0wq9um+UVqgV5zLQuQEVSL8pw1lNq8ZcpeSL
 vF/+5DlrKFhNZ+oeXGWzuX0bWV4gvD2UAhJCgYxUuhW2NlbVWxPY2bdE5fotFJ0v24Zc
 6iAatWbUv/s3AHNz1aw9TqLGPaLBhjWfptBp0C/ZjDtVQ7/VOF5C3rcP4keUPQ9E6K8k
 8u+0SJ1+97ya1GyFPxZqXpW6Rn86qY8HNhszVmLKoHmbp1TqrYAlSAKqTzIVUsc48mE/
 RNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qNTIN/IhlL6jREs741d+iZ6+IGeRCXB4ds5TvTZFqJY=;
 b=YOSFLbZzLZsEV+6zS0zENJB1vMcyPDgCvNjLE4AglN3mw7vanHkiioCK9lbIFtylb1
 cumIB0VSHF8mkeTumUnRy3V3tvoPcZ1LEhXweWphFAiDpEjpZ9CyALtqz4AT7NeFsDM+
 Mi4WUbOjxNwthf8E6G9xLfru2Fbz6Kq5Xg5qLPHOHrRjMpyXCBQdbCWhTSY2ttEhsBNQ
 Es2Q7yi03JZrS0xFZ2iyEOgUWQ48/MaYNFk6VXOR0xqo7EVcQ3ij2Xh+jTIxSNA+WVgF
 embW/QlhsaT5HMCSRGpDY5pg0Ht4iX9tFONa3Kf2Cfbwm8t5YufSp+xtuDqdpyMRplaP
 0mxQ==
X-Gm-Message-State: ACgBeo2+XAYS1GuiudeGbUMV3fdfQmOWMrJZmFcboKODnKUb5eA50S+a
 M3Gqj/VFofsyg6ekm0PBje9YQp5KbU/N2+x2WTc=
X-Google-Smtp-Source: AA6agR4xv1O/syrkVAfd6qRjz9GjHtpC4UmOCQQj1vPFJcD1OXRB3lqiv7qyLdSXEQghJ6nQgnjzmcaM4clmoBXF5Q4=
X-Received: by 2002:a05:6512:1312:b0:492:e14d:54d4 with SMTP id
 x18-20020a056512131200b00492e14d54d4mr2165119lfu.469.1662623207533; Thu, 08
 Sep 2022 00:46:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220907100051.570641-1-christian.koenig@amd.com>
 <CAM0jSHMPbT1c=NZu+aj8iJ07Qz511K8mpC+g9ez9XTTX6b+8cw@mail.gmail.com>
In-Reply-To: <CAM0jSHMPbT1c=NZu+aj8iJ07Qz511K8mpC+g9ez9XTTX6b+8cw@mail.gmail.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Thu, 8 Sep 2022 08:46:19 +0100
Message-ID: <CAM0jSHM-Ozk6zWCirTH_9Ukz2SLiA8qX1pJ0+ZbELOUYdp5UDQ@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: cleanup the resource of ghost objects after
 locking them
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: ZhenGuo Yin <zhenguo.yin@amd.com>, jingwen.chen2@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 7 Sept 2022 at 11:26, Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Wed, 7 Sept 2022 at 11:00, Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Otherwise lockdep will complain about cleaning up the bulk_move.
> >
> > Not even compile tested.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Looks reasonable to me,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Christian, are you going to go ahead and push this one?

>
> > ---
> >  drivers/gpu/drm/ttm/ttm_bo_util.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/tt=
m_bo_util.c
> > index 57a27847206f..911141d16e95 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -236,6 +236,11 @@ static int ttm_buffer_object_transfer(struct ttm_b=
uffer_object *bo,
> >         if (bo->type !=3D ttm_bo_type_sg)
> >                 fbo->base.base.resv =3D &fbo->base.base._resv;
> >
> > +       dma_resv_init(&fbo->base.base._resv);
> > +       fbo->base.base.dev =3D NULL;
> > +       ret =3D dma_resv_trylock(&fbo->base.base._resv);
> > +       WARN_ON(!ret);
> > +
> >         if (fbo->base.resource) {
> >                 ttm_resource_set_bo(fbo->base.resource, &fbo->base);
> >                 bo->resource =3D NULL;
> > @@ -244,11 +249,6 @@ static int ttm_buffer_object_transfer(struct ttm_b=
uffer_object *bo,
> >                 fbo->base.bulk_move =3D NULL;
> >         }
> >
> > -       dma_resv_init(&fbo->base.base._resv);
> > -       fbo->base.base.dev =3D NULL;
> > -       ret =3D dma_resv_trylock(&fbo->base.base._resv);
> > -       WARN_ON(!ret);
> > -
> >         ret =3D dma_resv_reserve_fences(&fbo->base.base._resv, 1);
> >         if (ret) {
> >                 kfree(fbo);
> > --
> > 2.25.1
> >
