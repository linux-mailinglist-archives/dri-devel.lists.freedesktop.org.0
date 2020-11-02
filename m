Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438152A2824
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 11:23:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CB36E48E;
	Mon,  2 Nov 2020 10:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A34516E48E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 10:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604312622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Wp9LWIdQQeaVWYBrapN4RJch0BVmepD/23UqIg4kz2Q=;
 b=Kl2vfjVFoXvTlsK3Xx57pHqVNA6um6BJYdoh4KA2sT+dErzxpzaRbFZWGhIT0ZARaDrxEx
 /pClIzpTvmI9yJd2KqrAX2GrTy/fwdgI5K02mXPg/NVCpvdNK2A7wAqeOjDcf/YEufF9jC
 T/RazfGcdsxUEW8C9sBouJRs1P5WjnQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-h1KGPNiuM9CknX7oWGCRrQ-1; Mon, 02 Nov 2020 05:23:39 -0500
X-MC-Unique: h1KGPNiuM9CknX7oWGCRrQ-1
Received: by mail-wr1-f69.google.com with SMTP id f11so6228800wro.15
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 02:23:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Wp9LWIdQQeaVWYBrapN4RJch0BVmepD/23UqIg4kz2Q=;
 b=WpqFllGMSpmVM5dxbHiaGeT2fng2Ay0q0skee186M40xfZf6FRFk782Lab1tHQQeRn
 XFNzSMJKOQ1JokBFg6BFcjb8lZucsQfatkUfewKKltnlvEKA1t+bC2MTUbbkY7/pMYIJ
 g15Emj+fMHyanItyMrExv+qcdoyLJsXgnIgB/gVw7oNC2yr/vYlLMyLrPB9aE6aELsIb
 LolF7/I8t2rdCNJDkzwO7JmaN9qV8zcD4hvCOE1jcYYFXqVDzqZ/veKRrAoQ0lnst2fy
 pXWKd1jOvPh6IeWWTGLVbrIGqdn8E47GTwv+A1icGFxVajB7/Oj3Gnq2jsMO21slS2YC
 T8sw==
X-Gm-Message-State: AOAM531+mY7nDqro1f0OADEkpADw7ykD+VJcIN9axxl+Uz5VqsyABVKT
 qa3LqFIU95zBk1tObu485r/sB3DjPz0wpDOHavMXt6PmOjiAzOgVxncuEUnNVsCn9CU0HQjKJv2
 09udekeLCuxMai2M/zSWw6Y0fpdJs
X-Received: by 2002:a05:6000:18f:: with SMTP id
 p15mr12460076wrx.185.1604312618488; 
 Mon, 02 Nov 2020 02:23:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznFGNmmLYGwZJwr0mGaJjbUUa+GHkURX7Blm6FFeB1v9AnrgQ4pPjIhkgBVh1ilzBqxxD+OQ==
X-Received: by 2002:a05:6000:18f:: with SMTP id
 p15mr12460054wrx.185.1604312618293; 
 Mon, 02 Nov 2020 02:23:38 -0800 (PST)
Received: from redhat.com (bzq-79-182-97-190.red.bezeqint.net. [79.182.97.190])
 by smtp.gmail.com with ESMTPSA id z15sm20847366wrq.24.2020.11.02.02.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 02:23:37 -0800 (PST)
Date: Mon, 2 Nov 2020 05:23:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20201102052254-mutt-send-email-mst@kernel.org>
References: <20201102124327.2f82b2a7@canb.auug.org.au>
 <CAKMK7uHopZfa1vJ2++OQC8z=GKdDcJ=9=sKWJAcSfguec2UgyA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHopZfa1vJ2++OQC8z=GKdDcJ=9=sKWJAcSfguec2UgyA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 10:28:34AM +0100, Daniel Vetter wrote:
> On Mon, Nov 2, 2020 at 2:43 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the drm-misc tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> >
> > In file included from drivers/gpu/drm/nouveau/nouveau_ttm.c:26:
> > include/linux/swiotlb.h: In function 'swiotlb_max_mapping_size':
> > include/linux/swiotlb.h:99:9: error: 'SIZE_MAX' undeclared (first use in this function)
> >    99 |  return SIZE_MAX;
> >       |         ^~~~~~~~
> > include/linux/swiotlb.h:7:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
> >     6 | #include <linux/init.h>
> >   +++ |+#include <stdint.h>
> >     7 | #include <linux/types.h>
> > include/linux/swiotlb.h:99:9: note: each undeclared identifier is reported only once for each function it appears in
> >    99 |  return SIZE_MAX;
> >       |         ^~~~~~~~
> >
> > Caused by commit
> >
> >   abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
> >
> > but only exposed by commit
> >
> >   4dbafbd30aef ("drm/nouveu: fix swiotlb include")
> >
> > I applied the following fix for today:
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 2 Nov 2020 12:34:57 +1100
> > Subject: [PATCH] swiotlb: using SIZE_MAX needs limits.h included
> >
> > Fixes: abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> 
> I think simplest if this lands through dma-api tree into current -rc
> kernels. Or should we just put this into drm-misc-next since that's
> where the problem shows up? Christoph, any preference from dma-api
> side?
> -Daniel


Or I can merge it since I merged the original patch causing the
issue ...

> > ---
> >  include/linux/swiotlb.h | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> > index 513913ff7486..ed9de7855d3b 100644
> > --- a/include/linux/swiotlb.h
> > +++ b/include/linux/swiotlb.h
> > @@ -5,6 +5,9 @@
> >  #include <linux/dma-direction.h>
> >  #include <linux/init.h>
> >  #include <linux/types.h>
> > +#ifndef CONFIG_SWIOTLB
> > +#include <linux/limits.h>
> > +#endif
> >
> >  struct device;
> >  struct page;
> > --
> > 2.28.0
> >
> > --
> > Cheers,
> > Stephen Rothwell
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
