Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BF6392BF6
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 12:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC256EE6C;
	Thu, 27 May 2021 10:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A665A6EE66
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 10:38:11 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id n2so4277765wrm.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 03:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=OtWHShYQLBlBNobhDqHRsPnCkaRqWudc5vVCqBANcRs=;
 b=L9/WsfdVIXDVtZgTOY9N1377imsatpXOqP39SL3Lln5YWc+VgFTPqFv3UfMyzAr9Rd
 zutDqQdMmuwHYcUH4Z91HBQRJM9Zwwmy+NxRSQnj6nvrWVue82jr/Aj25a/wemi4nlr0
 TxtBIxlXUY209OXr7lhI4jMziw7DkrmEBLWEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=OtWHShYQLBlBNobhDqHRsPnCkaRqWudc5vVCqBANcRs=;
 b=E+pWZKcTQxdDuT/MbAJfTMH+/aQXPogBrOHYGdNeLqeTcDVUz7efqngxo7PIGzD2zz
 oGEG2btIutcZLrdnH6RFE6WcRJlPBibBha4HLNzcrfFS/JxPGMlCYkLbXV4OiWTg8z25
 fQ980bxAI/Ke/ArTjmBy033cHdQyFHtUdJ1I+8x2m3q2j4GWpiJgLrsMX+/DfzBVd3tw
 EosvZd3i+XYIs2Obk5uDw6GWa3f7Q4rCEVxFkpq8jutMH5sy+ppZaY5V4UDmKz5XVcD9
 CKBtKY/gVwbV5eDiC9UXMYv4buig7H8kTNVM0MEwUYFzlavCjFkBtB2+aBojvGLbxR2n
 JuSQ==
X-Gm-Message-State: AOAM5326NSU63PkOm30cgXVmXMv3Fsaht0SmKT/cUTdQPHbigCt2rVDV
 wzYoKM9r2z01x3Ff52G3d30qNQ==
X-Google-Smtp-Source: ABdhPJz0T4mnEvHciMXpnttAkeZTRN2qnsFYLg9Llxmuqwsaj6LFUJ3qUwZ0KTIM0WqB9vxkgAdgpg==
X-Received: by 2002:a05:6000:108f:: with SMTP id
 y15mr2653328wrw.115.1622111890306; 
 Thu, 27 May 2021 03:38:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k205sm2387069wmf.13.2021.05.27.03.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 03:38:09 -0700 (PDT)
Date: Thu, 27 May 2021 12:38:07 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH 4/7] dma-buf: Document DMA_BUF_IOCTL_SYNC
Message-ID: <YK92j8b8SZ61KTCO@phenom.ffwll.local>
References: <20210525211753.1086069-1-jason@jlekstrand.net>
 <20210525211753.1086069-5-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210525211753.1086069-5-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 04:17:50PM -0500, Jason Ekstrand wrote:
> This adds a new "DMA Buffer ioctls" section to the dma-buf docs and adds
> documentation for DMA_BUF_IOCTL_SYNC.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>

We're still missing the doc for the SET_NAME ioctl, but maybe Sumit can be
motivated to fix that?

> ---
>  Documentation/driver-api/dma-buf.rst |  8 +++++++
>  include/uapi/linux/dma-buf.h         | 32 +++++++++++++++++++++++++++-
>  2 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> index 7f37ec30d9fd7..784f84fe50a5e 100644
> --- a/Documentation/driver-api/dma-buf.rst
> +++ b/Documentation/driver-api/dma-buf.rst
> @@ -88,6 +88,9 @@ consider though:
>  - The DMA buffer FD is also pollable, see `Implicit Fence Poll Support`_ below for
>    details.
>  
> +- The DMA buffer FD also supports a few dma-buf-specific ioctls, see
> +  `DMA Buffer ioctls`_ below for details.
> +
>  Basic Operation and Device DMA Access
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> @@ -106,6 +109,11 @@ Implicit Fence Poll Support
>  .. kernel-doc:: drivers/dma-buf/dma-buf.c
>     :doc: implicit fence polling
>  
> +DMA Buffer ioctls
> +~~~~~~~~~~~~~~~~~
> +
> +.. kernel-doc:: include/uapi/linux/dma-buf.h
> +
>  Kernel Functions and Structures Reference
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> diff --git a/include/uapi/linux/dma-buf.h b/include/uapi/linux/dma-buf.h
> index 7f30393b92c3b..1f67ced853b14 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -22,8 +22,38 @@
>  
>  #include <linux/types.h>
>  
> -/* begin/end dma-buf functions used for userspace mmap. */
> +/**
> + * struct dma_buf_sync - Synchronize with CPU access.
> + *
> + * When a DMA buffer is accessed from the CPU via mmap, it is not always
> + * possible to guarantee coherency between the CPU-visible map and underlying
> + * memory.  To manage coherency, DMA_BUF_IOCTL_SYNC must be used to bracket
> + * any CPU access to give the kernel the chance to shuffle memory around if
> + * needed.
> + *
> + * Prior to accessing the map, the client should call DMA_BUF_IOCTL_SYNC

s/should/must/

> + * with DMA_BUF_SYNC_START and the appropriate read/write flags.  Once the
> + * access is complete, the client should call DMA_BUF_IOCTL_SYNC with
> + * DMA_BUF_SYNC_END and the same read/write flags.

I think we should make it really clear here that this is _only_ for cache
coherency, and that furthermore if you want coherency with gpu access you
either need to use poll() for implicit sync (link to the relevant section)
or handle explicit sync with sync_file (again link would be awesome).

> + */
>  struct dma_buf_sync {
> +	/**
> +	 * @flags: Set of access flags
> +	 *
> +	 * - DMA_BUF_SYNC_START: Indicates the start of a map access

Bikeshed, but I think the item list format instead of bullet point list
looks neater, e.g.  DOC: standard plane properties in drm_plane.c.


> +	 *   session.
> +	 *
> +	 * - DMA_BUF_SYNC_END: Indicates the end of a map access session.
> +	 *
> +	 * - DMA_BUF_SYNC_READ: Indicates that the mapped DMA buffer will
> +	 *   be read by the client via the CPU map.
> +	 *
> +	 * - DMA_BUF_SYNC_READ: Indicates that the mapped DMA buffer will

s/READ/WRITE/

> +	 *   be written by the client via the CPU map.
> +	 *
> +	 * - DMA_BUF_SYNC_RW: An alias for DMA_BUF_SYNC_READ |
> +	 *   DMA_BUF_SYNC_WRITE.
> +	 */

With the nits addressed: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  	__u64 flags;
>  };
>  
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
