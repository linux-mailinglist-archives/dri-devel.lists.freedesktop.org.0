Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C933602FDD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 17:38:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBEE10EF51;
	Tue, 18 Oct 2022 15:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B1BB10EF50;
 Tue, 18 Oct 2022 15:38:01 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 a16-20020a056830101000b006619dba7fd4so7822050otp.12; 
 Tue, 18 Oct 2022 08:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9FVYFl3OeRImqDYuxVKVMdtUIZQ6+BesBZI4nsKHXk8=;
 b=AYpWLPiqoq2DH5/7La7E+zT32WMDwIMMuN9qlzheOd7FZHo3fW79ElVZ3H417YQMwq
 Gp/W/SmWfB0ISLUZzbdrzJnRCGXcB2sG542tp2BGAQg/mMA2UUdt6CKbXkpnkhl4WAWL
 /sIRwhDXj1lBfBHnMTxZULHtuZUwBiW3GX3AZN+Gmri/nF4BqiCN7UGz6TVnZPvMlsT+
 Z46f9VcQAYuAvsrymkB9Huh4IEPIoIU/RaORwS2TZmSyxsp5PxCgIeWZPvN8KGkx/REE
 y4vChrHfGDZccWH+9cn8mD2mE1wErTtGFFv5ttSw2s8Oo9iCnWhwLa0ibRSc45y4L5Zn
 JCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9FVYFl3OeRImqDYuxVKVMdtUIZQ6+BesBZI4nsKHXk8=;
 b=i/dp4YF1qUh+5uzLFeOAjtiHj7SqbwPc92i3Hfr7DSJKOra54LFXMcA/Y6BvmJCiVY
 pclKbpxX0hUaxuFPHDIdZX3QLCqRaMzGgnmzQbSYQuL4jG9tk/tKoTJYcgQ0/jnh4yMh
 /O+Y8gy0u7V3SP0LjKjVxISxLSrBLtbhuGCNwtOGBa7m3wcBpVMQaHLSmNClGojtubZq
 GNSQynQ1PFif5YP4HfMu1I8Jm2X+hFY2PnWMuYiHbScFn7tTCZEPrwM549S/rbt0Q4ty
 D9kXrFphE1iDsRKO1a04pyTpkGzs91neNFPUobu8yNpWFreocvxQO1yIXkT0ZJbklcJ0
 GxbQ==
X-Gm-Message-State: ACrzQf29ySd6K3TBN1VnI7LJEb2PRECY6oJSd92DkmdZogBFQJ52OdI6
 juEEaRPF5geYdBAAEoIMs4bYPKC8kVw4GAmpwFc=
X-Google-Smtp-Source: AMsMyM6xa5Hwnj8DSFsjPkcyTA6tkKE0pH23kKIDBBzp/Fh8dVNPOlt95M1Ro9KbXK/sRcYugsYA/f55tr3beLNx2dk=
X-Received: by 2002:a05:6830:2475:b0:661:b91c:f32a with SMTP id
 x53-20020a056830247500b00661b91cf32amr1601540otr.123.1666107480684; Tue, 18
 Oct 2022 08:38:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221014081553.114899-1-christian.koenig@amd.com>
 <c8585fab-6e8d-de4b-eb2a-e8bff6e3fde8@amd.com>
In-Reply-To: <c8585fab-6e8d-de4b-eb2a-e8bff6e3fde8@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 18 Oct 2022 11:37:49 -0400
Message-ID: <CADnq5_P9dZUUg_nwUikEM3T_sswFypk8tJPqayYEVtcNtnS5fA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/sched: add DRM_SCHED_FENCE_DONT_PIPELINE flag
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 luben.tuikov@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 11:11 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Gentle ping to others to get this reviewed.
>
> Alex, this is fixing the TLB flush errors and I think we need to get it
> into -fixes ASAP.
>
> Christian.
>
> Am 14.10.22 um 10:15 schrieb Christian K=C3=B6nig:
> > Setting this flag on a scheduler fence prevents pipelining of jobs
> > depending on this fence. In other words we always insert a full CPU
> > round trip before dependen jobs are pushed to the pipeline.

typo: dependen -> dependent

> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > CC: stable@vger.kernel.org # 5.19+

Please add a link to the bug as well for both patches.  With those
fixed, series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> > ---
> >   drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
> >   include/drm/gpu_scheduler.h              | 9 +++++++++
> >   2 files changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> > index 191c56064f19..43d337d8b153 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -385,7 +385,8 @@ static bool drm_sched_entity_add_dependency_cb(stru=
ct drm_sched_entity *entity)
> >       }
> >
> >       s_fence =3D to_drm_sched_fence(fence);
> > -     if (s_fence && s_fence->sched =3D=3D sched) {
> > +     if (s_fence && s_fence->sched =3D=3D sched &&
> > +         !test_bit(DRM_SCHED_FENCE_DONT_PIPELINE, &fence->flags)) {
> >
> >               /*
> >                * Fence is from the same scheduler, only need to wait fo=
r
> > diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> > index 0fca8f38bee4..f01d14b231ed 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -32,6 +32,15 @@
> >
> >   #define MAX_WAIT_SCHED_ENTITY_Q_EMPTY msecs_to_jiffies(1000)
> >
> > +/**
> > + * DRM_SCHED_FENCE_DONT_PIPELINE - Prefent dependency pipelining
> > + *
> > + * Setting this flag on a scheduler fence prevents pipelining of jobs =
depending
> > + * on this fence. In other words we always insert a full CPU round tri=
p before
> > + * dependen jobs are pushed to the hw queue.
> > + */
> > +#define DRM_SCHED_FENCE_DONT_PIPELINE        DMA_FENCE_FLAG_USER_BITS
> > +
> >   struct drm_gem_object;
> >
> >   struct drm_gpu_scheduler;
>
