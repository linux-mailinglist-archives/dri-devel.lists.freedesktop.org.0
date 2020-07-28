Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E78082313B6
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 22:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 415DD6E179;
	Tue, 28 Jul 2020 20:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64436E179
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 20:15:48 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id 133so11281358ybu.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 13:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IVecKCNgxoduRD0P++fKEjycercjKSS3LI+0txzd4nE=;
 b=MQMPU41peUy/Ob70gaARIWWaBL51q7WJuNIB8jMIi9AnY5bo1kJ3xdhMwUmS/vZ7xV
 KJrQ8mVICtPi0RtjPgAh5PAFxlZ9872GV9zWzUN3TJA7zCr4jq2NpIEkFdxukYKc9Ms3
 CGawJBZYyOwWYTCGpBXZRUsIQ/jqKr9mphQiApnPK88BV2xSJwGPVIN2T+MzkFj6FiOZ
 iqsnHXtEbPYhRaobRTa+qn8gRdlKLsIYeE0Z5qH85817q9M/BJfVE/EVzpnuhyB097dF
 Yc78cUxtzPoVwzSkL6JbcLZse17UU0p9icrmyZ+wexZ8tEAf39g+c8LpAgbtJR2IuljZ
 v3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IVecKCNgxoduRD0P++fKEjycercjKSS3LI+0txzd4nE=;
 b=RAr0BpeItYhy3o2BhSIWoBtKI1VJzyVpjX96tR4QKOgApx4K2+32GwtJdkzdkxIwoL
 Pt07g/Nzpro1rkSQfAxNZP/TegheTNcZasVXIjvMWqnlHRAQ+67fgLOO/Y/W4Wk/fSuU
 y52shxNxpKqshjpMZzKrpLLYWihx4bCnVmjkBpns55hwKHnw0Ep9cGjs8mLyKZrSrldD
 GvmCfkLxmupMxYRYoOBxgHfQG5BcGGZoV080bwx9BD1av5Xbh/8pgsAsXYu0TWlNlofF
 qtfiilRxvHaSHttLPm6cEbJCSvQd2b/NNJbPhmUNX9e4XdoZCZT05HWHBab54cPjdXgt
 rvbQ==
X-Gm-Message-State: AOAM532xp8BraXmRzna8xsFH6AMeRBVtuRbcary3SlY5v/j2BvVSueso
 UG7+geYGKdbkmQ3K4/DPpfoCwgBRpYjyyyKWJBc=
X-Google-Smtp-Source: ABdhPJzChUJ6OGrFtxJvp0KZG5q1xS3OocUmBWX5FFB71kkYhQe5BsX0pR50+29pyqLH5nzMfcdNkrxGE3EH2x2qyCo=
X-Received: by 2002:a25:cf08:: with SMTP id f8mr10357747ybg.435.1595967347755; 
 Tue, 28 Jul 2020 13:15:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200728032545.19878-1-airlied@gmail.com>
 <14063C7AD467DE4B82DEDB5C278E866301245EE4F7@FMSMSX108.amr.corp.intel.com>
In-Reply-To: <14063C7AD467DE4B82DEDB5C278E866301245EE4F7@FMSMSX108.amr.corp.intel.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 29 Jul 2020 06:15:36 +1000
Message-ID: <CACAvsv6_V4jhKra4wY32h5chheBddyZDzPWZHHOzsQn+UZLfQQ@mail.gmail.com>
Subject: Re: [PATCH] nouveau: use ttm populate mapping functions. (v2)
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
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
Cc: "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Jul 2020 at 02:08, Ruhl, Michael J <michael.j.ruhl@intel.com> wrote:
>
> >-----Original Message-----
> >From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
> >Dave Airlie
> >Sent: Monday, July 27, 2020 11:26 PM
> >To: dri-devel@lists.freedesktop.org
> >Cc: bskeggs@redhat.com
> >Subject: [PATCH] nouveau: use ttm populate mapping functions. (v2)
> >
> >From: Dave Airlie <airlied@redhat.com>
> >
> >Instead of rolling driver copies of them.
> >
> >v2: cleanup return handling (Ben)
> >Signed-off-by: Dave Airlie <airlied@redhat.com>
> >---
> > drivers/gpu/drm/nouveau/nouveau_bo.c | 38 ++--------------------------
> > 1 file changed, 2 insertions(+), 36 deletions(-)
> >
> >diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c
> >b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >index 7806278dce57..6ef5085c9a91 100644
> >--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> >+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> >@@ -1231,8 +1231,6 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm,
> >struct ttm_operation_ctx *ctx)
> >       struct ttm_dma_tt *ttm_dma = (void *)ttm;
> >       struct nouveau_drm *drm;
> >       struct device *dev;
> >-      unsigned i;
> >-      int r;
> >       bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
> >
> >       if (ttm->state != tt_unpopulated)
> >@@ -1260,31 +1258,7 @@ nouveau_ttm_tt_populate(struct ttm_tt *ttm,
> >struct ttm_operation_ctx *ctx)
> >               return ttm_dma_populate((void *)ttm, dev, ctx);
> >       }
> > #endif
> >-
> >-      r = ttm_pool_populate(ttm, ctx);
> >-      if (r) {
> >-              return r;
> >-      }
> >-
> >-      for (i = 0; i < ttm->num_pages; i++) {
> >-              dma_addr_t addr;
> >-
> >-              addr = dma_map_page(dev, ttm->pages[i], 0, PAGE_SIZE,
> >-                                  DMA_BIDIRECTIONAL);
> >-
> >-              if (dma_mapping_error(dev, addr)) {
> >-                      while (i--) {
> >-                              dma_unmap_page(dev, ttm_dma-
> >>dma_address[i],
> >-                                             PAGE_SIZE,
> >DMA_BIDIRECTIONAL);
> >-                              ttm_dma->dma_address[i] = 0;
> >-                      }
> >-                      ttm_pool_unpopulate(ttm);
> >-                      return -EFAULT;
> >-              }
> >-
> >-              ttm_dma->dma_address[i] = addr;
> >-      }
> >-      return 0;
> >+      return ttm_populate_and_map_pages(dev, ttm_dma, ctx);
>
> This is not a completely straight code replacement.
>
> ttm_populate_and_map_pages() also has code to deal with pages that are
> contiguous (consolidates them).
>
> Is it possible that the nouveau HW can't handle a contiguous buffer larger
> than PAG_SIZE?
I think it's fine.  The function appears to consolidate the pages for
the dma_map_page() call, but otherwise leave dma_address[] in
PAGE_SIZE chunks, I don't believe anything else in the driver will
care.

Ben.

>
> Thanks,
>
> Mike
>
> > }
> >
> > static void
> >@@ -1293,7 +1267,6 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
> >       struct ttm_dma_tt *ttm_dma = (void *)ttm;
> >       struct nouveau_drm *drm;
> >       struct device *dev;
> >-      unsigned i;
> >       bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
> >
> >       if (slave)
> >@@ -1316,14 +1289,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_tt *ttm)
> >       }
> > #endif
> >
> >-      for (i = 0; i < ttm->num_pages; i++) {
> >-              if (ttm_dma->dma_address[i]) {
> >-                      dma_unmap_page(dev, ttm_dma->dma_address[i],
> >PAGE_SIZE,
> >-                                     DMA_BIDIRECTIONAL);
> >-              }
> >-      }
> >-
> >-      ttm_pool_unpopulate(ttm);
> >+      ttm_unmap_and_unpopulate_pages(dev, ttm_dma);
> > }
> >
> > void
> >--
> >2.26.2
> >
> >_______________________________________________
> >dri-devel mailing list
> >dri-devel@lists.freedesktop.org
> >https://lists.freedesktop.org/mailman/listinfo/dri-devel
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
