Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB842A26F9
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 10:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4F836E44C;
	Mon,  2 Nov 2020 09:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039D46E44E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 09:28:47 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id l36so4008223ota.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 01:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IbNuq3s1vVpD8H3QOsjV0sGqJ/Z7oSAbbkfkZvy1XHk=;
 b=ZwDmKsJx7x9H4A6oxnKV/0mfK5ZFxB3a1aM7tsS3KQVWBTroULG54b+/X/QAb8xkd8
 w60J0bsQvWMfAe1GP1j5aHGhevycwGs1eXOS5XmS9e1DzJwaERv34oRwd/zUc5NH25It
 evwbcfSzmlipcIbMmq2HHokuvcx7O5RLmy0O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IbNuq3s1vVpD8H3QOsjV0sGqJ/Z7oSAbbkfkZvy1XHk=;
 b=PiYihoAOCJ3quVrr6oqKOH3E9LoZOHH7/J5Ekgn9Jt9cz/WrzRLTP8uDalDb//NF40
 3NlESTQMuw9PQZykj8972d147VZ2mL0SwRY1SAbKgPaBa3WXWT1ljZQJwIYm/84lZso1
 ORjxuw6yTH5E5CgOVJlrzVGIaUouME/gwphftvCUAdfa/zv9ymBNijvduBkobJ4yOh5A
 xpvipMQf12pmeLCFuxiKdoxhrECKhRrINGeyQ97wcjgVVzbEv0/L/9MMmYX3oCTQARck
 51fk/1hu8ZvmlUcgt5gm50lkwjCXuMwJRJ1SEaRC4PEb1BdcN6bSBF7T9y00Na13Vu+Z
 5qJg==
X-Gm-Message-State: AOAM532GqKlHdG6/1Mf7WLhvEd3EG6FkY0qThwTsmNXj2k+LEKKRIODr
 8K8YZO63WO3wOU7jedHaegnYuSNomh3QTzW/GUdo8A==
X-Google-Smtp-Source: ABdhPJw4HWb5RIkueETRBm8Fwwh31WuQZ8e/6YOS+9xABgykOarqawuOiAF2wFN7DrH/qvVU5QujD60r3ppsBeugVQ4=
X-Received: by 2002:a9d:6e81:: with SMTP id a1mr10863311otr.303.1604309326237; 
 Mon, 02 Nov 2020 01:28:46 -0800 (PST)
MIME-Version: 1.0
References: <20201102124327.2f82b2a7@canb.auug.org.au>
In-Reply-To: <20201102124327.2f82b2a7@canb.auug.org.au>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 2 Nov 2020 10:28:34 +0100
Message-ID: <CAKMK7uHopZfa1vJ2++OQC8z=GKdDcJ=9=sKWJAcSfguec2UgyA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Christoph Hellwig <hch@infradead.org>
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
Cc: Joerg Roedel <jroedel@suse.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 2, 2020 at 2:43 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
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

I think simplest if this lands through dma-api tree into current -rc
kernels. Or should we just put this into drm-misc-next since that's
where the problem shows up? Christoph, any preference from dma-api
side?
-Daniel

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



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
