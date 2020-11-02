Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3602A2839
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 11:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 136716E492;
	Mon,  2 Nov 2020 10:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 076116E492
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 10:28:27 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id 6so5025989oiy.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 02:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2Z8GQ3+dlPgWj8N6iGHuphE6RpytAvFZo39Sbtwdhws=;
 b=EzwfEuuEwGYTUTjIasAnUKUIVmBIxn7qJYQhUc2GVEKajha3SO3J3d/VjzMgnwV94F
 V1xFvThPUl79p5+V+oEa5uZ2gpuitZ5MzSvlI5wHu8TwB48Z8uCSz1bX+J83hOAQl2Mc
 ybmPexJOB3IDKeTvAmmWQSMGJBSZzm4EiWwGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2Z8GQ3+dlPgWj8N6iGHuphE6RpytAvFZo39Sbtwdhws=;
 b=KuLlYvpQFnS+V6E83SnVK4HnDhJ6U//+2J4o6kKD4KJ5xe9IuobMUx3YJmMNGrNxiH
 n5Kp/nzzh2jrGMae7tmY6qxZkxuK4wQtNalfnsXWb/hGxJW86RAmnkNN+auHDu55ruL4
 ZX4t/Fo/BVlb32Y8jlY+XdvxhqcQLemT2ud+or3qcuhSKdeP3xssMI2lf4g6BlxEMi/5
 Pjv/ecvRc0aeOXMaiDBKYEtkJQawCSi0+sK1AGwMJKGE1hnTQPdnbaCaw3rPKdu9bTrF
 qkqDBq1gjdtnaEAdG03vrmcLnvagi0VNOefnhNOWHrpyusKYtO0SPfnLAoYilwVz4xdb
 6XHw==
X-Gm-Message-State: AOAM530ZorvH0Gm9fbeE6ZjmEFB2RHckylyuBGPz+NSZPGAxwUtqco+v
 7oD+ANm+EkmqsWUuwivyZUZuQnVLpu6GGOBnSKirzw==
X-Google-Smtp-Source: ABdhPJxtPz32ksTu7x/wIQLWRExfPZVZ9cFoMP8T8mP3YC5ZyI58He8otzTX9cJ+0Sx2RumLcBUlS7qWt0oefuIvIy0=
X-Received: by 2002:aca:b141:: with SMTP id a62mr8909832oif.101.1604312906398; 
 Mon, 02 Nov 2020 02:28:26 -0800 (PST)
MIME-Version: 1.0
References: <20201102124327.2f82b2a7@canb.auug.org.au>
 <CAKMK7uHopZfa1vJ2++OQC8z=GKdDcJ=9=sKWJAcSfguec2UgyA@mail.gmail.com>
 <20201102052254-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201102052254-mutt-send-email-mst@kernel.org>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 2 Nov 2020 11:28:15 +0100
Message-ID: <CAKMK7uFKRHnYFYw19b-iQHfzQisqn0Zms+1+bxVa6CSbExTP8w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: "Michael S. Tsirkin" <mst@redhat.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Joerg Roedel <jroedel@suse.de>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Christoph Hellwig <hch@infradead.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 2, 2020 at 11:23 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Mon, Nov 02, 2020 at 10:28:34AM +0100, Daniel Vetter wrote:
> > On Mon, Nov 2, 2020 at 2:43 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > After merging the drm-misc tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > >
> > > In file included from drivers/gpu/drm/nouveau/nouveau_ttm.c:26:
> > > include/linux/swiotlb.h: In function 'swiotlb_max_mapping_size':
> > > include/linux/swiotlb.h:99:9: error: 'SIZE_MAX' undeclared (first use in this function)
> > >    99 |  return SIZE_MAX;
> > >       |         ^~~~~~~~
> > > include/linux/swiotlb.h:7:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
> > >     6 | #include <linux/init.h>
> > >   +++ |+#include <stdint.h>
> > >     7 | #include <linux/types.h>
> > > include/linux/swiotlb.h:99:9: note: each undeclared identifier is reported only once for each function it appears in
> > >    99 |  return SIZE_MAX;
> > >       |         ^~~~~~~~
> > >
> > > Caused by commit
> > >
> > >   abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
> > >
> > > but only exposed by commit
> > >
> > >   4dbafbd30aef ("drm/nouveu: fix swiotlb include")
> > >
> > > I applied the following fix for today:
> > >
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Mon, 2 Nov 2020 12:34:57 +1100
> > > Subject: [PATCH] swiotlb: using SIZE_MAX needs limits.h included
> > >
> > > Fixes: abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >
> > I think simplest if this lands through dma-api tree into current -rc
> > kernels. Or should we just put this into drm-misc-next since that's
> > where the problem shows up? Christoph, any preference from dma-api
> > side?
> > -Daniel
>
>
> Or I can merge it since I merged the original patch causing the
> issue ...

Works for me too.
-Daniel
>
> > > ---
> > >  include/linux/swiotlb.h | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > > index 513913ff7486..ed9de7855d3b 100644
> > > --- a/include/linux/swiotlb.h
> > > +++ b/include/linux/swiotlb.h
> > > @@ -5,6 +5,9 @@
> > >  #include <linux/dma-direction.h>
> > >  #include <linux/init.h>
> > >  #include <linux/types.h>
> > > +#ifndef CONFIG_SWIOTLB
> > > +#include <linux/limits.h>
> > > +#endif
> > >
> > >  struct device;
> > >  struct page;
> > > --
> > > 2.28.0
> > >
> > > --
> > > Cheers,
> > > Stephen Rothwell
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
