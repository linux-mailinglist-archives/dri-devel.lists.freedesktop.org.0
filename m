Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBBA2A2816
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 11:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1966E48D;
	Mon,  2 Nov 2020 10:19:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321D76E48D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 10:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604312353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ai/gGgjTQcmU+eCPscVzw0UhOXfAfCGYsrcIbvjwE7U=;
 b=WCXotckBgKcv8UAC6AYfCXqblMMCupxHfF7IXlgbPDzCOgc3c7B6iaTU6MCxphgHGm101p
 7gFcqHusQscJkAr3QJDFx812fejc2Eu5m3l9EmLaVCRhbw17X7rixsFdbvMe398by1bTSj
 je67oxg0VYi3CehFaIRcJbqq0NyRx94=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-17biXHeXMiqYxdgepzJ2xQ-1; Mon, 02 Nov 2020 05:19:11 -0500
X-MC-Unique: 17biXHeXMiqYxdgepzJ2xQ-1
Received: by mail-wm1-f70.google.com with SMTP id 8so343098wmg.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 02:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ai/gGgjTQcmU+eCPscVzw0UhOXfAfCGYsrcIbvjwE7U=;
 b=jU+1yPg+JwnsQKKkpX53jATPDD24yonDi9+uHUfQPr11RLw0yhW4VFVJpJQCpHKnTf
 VpYn3grfHwYcJKmlK8jAH1l8EoUwWz7rT/ix4fZHhGQstYbXaE1iaM9DG6H1KoX9QIzT
 qng/mVwkXtjQUB5W8X0l5rwQvka6Laewr8RzbzvvX+w6NSIQEcaVVqB2ixDTY2ugn7wp
 3SwKSNs9Ml8Whe3BBzRTsNPTFEcVg02prejORIgo54NqbJq9ftSAAHgMJ6zThAin8X/9
 RN0Tu9d7K76TGW0aJ4mizfO0dsDsDoY0StObKY5tMxb+eCmfplqtlzNYb20UutLDfMnY
 dPwA==
X-Gm-Message-State: AOAM533Po77DD7n9ZjLT5GQ2EhsoREpRn7mN6S3wADls8fXNgeaxOYv/
 jB8U7wvlkrIGN/0e+xsIxLb+na1YveZHLdn1fr+5HuPRNx4zZcqL8kN4wWH0RyNXL8CKiGUScX3
 4OBh/iFtCJwD9Ha5QGjU3Zz7pvH6h
X-Received: by 2002:a1c:9d94:: with SMTP id g142mr17543688wme.66.1604312350463; 
 Mon, 02 Nov 2020 02:19:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMZrcZUQ6qnAtGtdhm7af/rwNXetvdJKh2zEGv4XNpm4y+mMw4DGIIvdD/ljXcKDwgaNDKtw==
X-Received: by 2002:a1c:9d94:: with SMTP id g142mr17543670wme.66.1604312350279; 
 Mon, 02 Nov 2020 02:19:10 -0800 (PST)
Received: from redhat.com (bzq-79-181-134-187.red.bezeqint.net.
 [79.181.134.187])
 by smtp.gmail.com with ESMTPSA id z5sm21822717wrw.87.2020.11.02.02.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 02:19:09 -0800 (PST)
Date: Mon, 2 Nov 2020 05:19:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20201102051822-mutt-send-email-mst@kernel.org>
References: <20201102124327.2f82b2a7@canb.auug.org.au>
MIME-Version: 1.0
In-Reply-To: <20201102124327.2f82b2a7@canb.auug.org.au>
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
Cc: Joerg Roedel <jroedel@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 02, 2020 at 12:43:27PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> In file included from drivers/gpu/drm/nouveau/nouveau_ttm.c:26:
> include/linux/swiotlb.h: In function 'swiotlb_max_mapping_size':
> include/linux/swiotlb.h:99:9: error: 'SIZE_MAX' undeclared (first use in this function)
>    99 |  return SIZE_MAX;
>       |         ^~~~~~~~
> include/linux/swiotlb.h:7:1: note: 'SIZE_MAX' is defined in header '<stdint.h>'; did you forget to '#include <stdint.h>'?
>     6 | #include <linux/init.h>
>   +++ |+#include <stdint.h>
>     7 | #include <linux/types.h>
> include/linux/swiotlb.h:99:9: note: each undeclared identifier is reported only once for each function it appears in
>    99 |  return SIZE_MAX;
>       |         ^~~~~~~~
> 
> Caused by commit
> 
>   abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
> 
> but only exposed by commit
> 
>   4dbafbd30aef ("drm/nouveu: fix swiotlb include")
> 
> I applied the following fix for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 2 Nov 2020 12:34:57 +1100
> Subject: [PATCH] swiotlb: using SIZE_MAX needs limits.h included
> 
> Fixes: abe420bfae52 ("swiotlb: Introduce swiotlb_max_mapping_size()")
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

I guess it makes sense to pick this up for this release directly.
I'll merge this unless there are any objections.

> ---
>  include/linux/swiotlb.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 513913ff7486..ed9de7855d3b 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -5,6 +5,9 @@
>  #include <linux/dma-direction.h>
>  #include <linux/init.h>
>  #include <linux/types.h>
> +#ifndef CONFIG_SWIOTLB
> +#include <linux/limits.h>
> +#endif
>  
>  struct device;
>  struct page;
> -- 
> 2.28.0
> 
> -- 
> Cheers,
> Stephen Rothwell


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
