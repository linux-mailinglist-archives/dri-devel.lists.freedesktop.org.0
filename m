Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938758F0C2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 18:52:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A486E14B13F;
	Wed, 10 Aug 2022 16:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501B114AE43
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 16:51:37 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 i128-20020a1c3b86000000b003a536d58f73so1306134wma.4
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 09:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc; bh=lWfrAoXxVHXbhkuomaZdWya3VTYtQlo2c1Ei9aMf4QI=;
 b=ap5d/xqFftsbBitBxOcPRemV8XqbP5ZdmM9NGdAdoh0SKuAqcZuc4H8vwixxsdknjY
 hQxj6sZvqynIarjgcpGo9vJmg8rzvtJrd7VtQ1DZsX7kH2spjdK21lRu+KdFnMjeWQ14
 PPV/sk+vBgMu7qzpOvWra+vO5YW1ZwJBfv5+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=lWfrAoXxVHXbhkuomaZdWya3VTYtQlo2c1Ei9aMf4QI=;
 b=XBuB6Kru2HaOQznm/CVD02huNofEdkZfaU8JhweZL8kTflU99wjDDcnGgOVnKxwzZd
 DwmfzKzENbiHBnyKPYF+NjkbTzbirmgGflBjV8jil2I7eiAl/Gx7kGiauiJmqjuWuilp
 74YbftB8DIXtrU9n+Cbfvo/2+PFos5EmoZeP1oU4ebdhLW/LPjaB0ZBtBYhAr1jBDkb8
 C0S7HCtV01rN3Xhy5u1DOG4TV8j4rdiabGbjGW+nthvX3fZIbCPe33s6WlFb1XA9Z78g
 MtX9bjkMfE7Yt81i/5s+HI7+iVqTwNUDlZ7ywIq1r1oYAc2L17fqJROHNjJVpT2c7h6w
 UyOg==
X-Gm-Message-State: ACgBeo22eIMVQBmuzpv9iFCR362yiwBTew5Zd/NNkRDFfzAg5ESjtY0e
 3VMnNL2NUQsvKUas5vD0mjbtIw==
X-Google-Smtp-Source: AA6agR43A0U3CxBaG/pwAjxm6ETbq1ZTA/0wn+vLG7ILpaqLzgTR7ANYl+Syh3bE/yDBKAxRu0QLqQ==
X-Received: by 2002:a7b:c5d2:0:b0:3a3:55d9:fd36 with SMTP id
 n18-20020a7bc5d2000000b003a355d9fd36mr3146947wmk.52.1660150296416; 
 Wed, 10 Aug 2022 09:51:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j13-20020adfe50d000000b00222d512d96asm7089559wrm.75.2022.08.10.09.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 09:51:35 -0700 (PDT)
Date: Wed, 10 Aug 2022 18:51:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Subject: Re: [Linaro-mm-sig] [PATCH] dma-buf/dma_resv_usage: update explicit
 sync documentation
Message-ID: <YvPiFYOvH4ZI2frl@phenom.ffwll.local>
References: <20220712131201.131475-1-christian.koenig@amd.com>
 <CADnq5_PSECF0b_ynF=UhXu3Os0hYZcvcQtk1pD+T3q+Z1g-Hgg@mail.gmail.com>
 <a3dfc73f-5867-d442-b74d-a890a42753bd@amd.com>
 <CAP+8YyHLy9=ueEcgVbk6nnAr=aqJXW1f31xm37gkGVrzdG3o=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP+8YyHLy9=ueEcgVbk6nnAr=aqJXW1f31xm37gkGVrzdG3o=g@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 13, 2022 at 01:27:13PM +0200, Bas Nieuwenhuizen wrote:
> With that changed
> 
> Reviewed-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>

Yeah this is a nice clarification.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

In case it hasn't landed yet or so.
-Daniel

> 
> Thanks!
> 
> On Tue, Jul 12, 2022 at 3:23 PM Christian König
> <christian.koenig@amd.com> wrote:
> >
> > Am 12.07.22 um 15:20 schrieb Alex Deucher:
> > > On Tue, Jul 12, 2022 at 9:12 AM Christian König
> > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > >> Make it clear that DMA_RESV_USAGE_BOOKMARK can be used for explicit synced
> > > DMA_RESV_USAGE_BOOKKEEP?
> >
> > Crappy autocorrect and copy&paste. Thanks for pointing that out.
> >
> > Christian.
> >
> > >
> > >> user space submissions as well and document the rules around adding the
> > >> same fence with different usages.
> > >>
> > >> Signed-off-by: Christian König <christian.koenig@amd.com>
> > >> ---
> > >>   include/linux/dma-resv.h | 16 +++++++++++++---
> > >>   1 file changed, 13 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> > >> index c8ccbc94d5d2..264e27e56dff 100644
> > >> --- a/include/linux/dma-resv.h
> > >> +++ b/include/linux/dma-resv.h
> > >> @@ -62,6 +62,11 @@ struct dma_resv_list;
> > >>    * For example when asking for WRITE fences then the KERNEL fences are returned
> > >>    * as well. Similar when asked for READ fences then both WRITE and KERNEL
> > >>    * fences are returned as well.
> > >> + *
> > >> + * Already used fences can be promoted in the sense that a fence with
> > >> + * DMA_RESV_USAGE_BOOKMARK could become DMA_RESV_USAGE_READ by adding it again
> > > Same here.
> > >
> > > With that fixed,
> > > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> > >
> > > Alex
> > >
> > >> + * with this usage. But fences can never be degraded in the sense that a fence
> > >> + * with DMA_RESV_USAGE_WRITE could become DMA_RESV_USAGE_READ.
> > >>    */
> > >>   enum dma_resv_usage {
> > >>          /**
> > >> @@ -98,10 +103,15 @@ enum dma_resv_usage {
> > >>           * @DMA_RESV_USAGE_BOOKKEEP: No implicit sync.
> > >>           *
> > >>           * This should be used by submissions which don't want to participate in
> > >> -        * implicit synchronization.
> > >> +        * any implicit synchronization.
> > >> +        *
> > >> +        * The most common case are preemption fences, page table updates, TLB
> > >> +        * flushes as well as explicit synced user submissions.
> > >>           *
> > >> -        * The most common case are preemption fences as well as page table
> > >> -        * updates and their TLB flushes.
> > >> +        * Explicit synced user user submissions can be promoted to
> > >> +        * DMA_RESV_USAGE_READ or DMA_RESV_USAGE_WRITE as needed using
> > >> +        * dma_buf_import_sync_file() when implicit synchronization should
> > >> +        * become necessary after initial adding of the fence.
> > >>           */
> > >>          DMA_RESV_USAGE_BOOKKEEP
> > >>   };
> > >> --
> > >> 2.25.1
> > >>
> > >> _______________________________________________
> > >> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> > >> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
