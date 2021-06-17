Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D851B3ABD15
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 21:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949AA6E9AD;
	Thu, 17 Jun 2021 19:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F30536E9AD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 19:46:53 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v9so8058466wrx.6
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 12:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Sa8td/BAiP1sJEiWFtZXqgYTFUOS+PVjo6wgeyQNFsg=;
 b=YHkPV0PyJ1QqznDOUdw1wTkAKUpXPM+AT3W/U/nXLQK1Nf3K5s0/YOpw9tQIgNRJ5j
 RlRwkEuu+yqkuUE6nSA/npNsI33EmAgxWoeu3f2QvvxCuBYCyccpgHVM1/7Y0Gn9Rdg2
 Df4XwYGE4YBiE/iRgxJxABpineA83h87T+wyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Sa8td/BAiP1sJEiWFtZXqgYTFUOS+PVjo6wgeyQNFsg=;
 b=mHFdvtUvclDhVaI0opHvqJZ3JMjzh5BG0XfMRuAIsVC8Lxl5gFJscMRBCMeGz4oOTH
 /W/ZHf6Crkg0BaTW70Dz2/mkjMNSh8oJkBCXYvamVA0RQTa1ASeTIMaiPBvuC7qhSNSe
 esfyrGPNE3dr8lclK0I247bioP/NSvjdfti1MvZh3qmMZ4GLM1iDzkzxLGSXxAU1yuXa
 7UDqyISuDEMk+su5R4IrkMVqsovmTivBLUX+gjHsPbBTEfLvgduAn3zIWy+EMB3cqXWF
 J4qUfFYAwgn7WoMddAqWmAHf5yOLdJgjKIYPKMy0Dc6gyF0qqPx5LJndsW7l8PR3ZQRo
 chJw==
X-Gm-Message-State: AOAM53316oM6UIg2y6+ovZG4TkjvP3Pn93LQQRq7g64BTXxaiI2tKgwB
 NFQMPT3oGrUYM+6RJRd9oAiGeQ==
X-Google-Smtp-Source: ABdhPJziVpWbH2JxH1eEbmqdAv9uqamFPQzWfGUWzdRQYSV2lv2mWYpaIFsff8IVeJ+O046LbFFLUQ==
X-Received: by 2002:a5d:6da2:: with SMTP id u2mr7784064wrs.355.1623959212668; 
 Thu, 17 Jun 2021 12:46:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q11sm6325093wrx.80.2021.06.17.12.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:46:51 -0700 (PDT)
Date: Thu, 17 Jun 2021 21:46:50 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: [PATCH] dma-buf: Document DMA_BUF_IOCTL_SYNC (v3)
Message-ID: <YMumqnSpXjLGaOfn@phenom.ffwll.local>
References: <20210617194258.579011-1-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210617194258.579011-1-jason@jlekstrand.net>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 17, 2021 at 02:42:58PM -0500, Jason Ekstrand wrote:
> This adds a new "DMA Buffer ioctls" section to the dma-buf docs and adds
> documentation for DMA_BUF_IOCTL_SYNC.
> 
> v2 (Daniel Vetter):
>  - Fix a couple typos
>  - Add commentary about synchronization with other devices
>  - Use item list format for describing flags
> 
> v3 (Pekka Paalanen):
>  - Clarify stalling requirements.
>  - Be more clear that that DMA_BUF_IOCTL_SYNC with SINC_END has to be
>    called before more GPU work happens.
> 
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Acked-by: Christian König <christian.koenig@amd.com>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>

Merged to drm-misc-next, thanks.
-Daniel

> ---
>  Documentation/driver-api/dma-buf.rst |  8 +++++
>  include/uapi/linux/dma-buf.h         | 50 +++++++++++++++++++++++++++-
>  2 files changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> index 7f21425d9435a..0d4c13ec1a800 100644
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
> index 7f30393b92c3b..8e4a2ca0bcbf7 100644
> --- a/include/uapi/linux/dma-buf.h
> +++ b/include/uapi/linux/dma-buf.h
> @@ -22,8 +22,56 @@
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
> + * Prior to accessing the map, the client must call DMA_BUF_IOCTL_SYNC
> + * with DMA_BUF_SYNC_START and the appropriate read/write flags.  Once the
> + * access is complete, the client should call DMA_BUF_IOCTL_SYNC with
> + * DMA_BUF_SYNC_END and the same read/write flags.
> + *
> + * The synchronization provided via DMA_BUF_IOCTL_SYNC only provides cache
> + * coherency.  It does not prevent other processes or devices from
> + * accessing the memory at the same time.  If synchronization with a GPU or
> + * other device driver is required, it is the client's responsibility to
> + * wait for buffer to be ready for reading or writing before calling this
> + * ioctl with DMA_BUF_SYNC_START.  Likewise, the client must ensure that
> + * follow-up work is not submitted to GPU or other device driver until
> + * after this ioctl has been called with DMA_BUF_SYNC_END?
> + *
> + * If the driver or API with which the client is interacting uses implicit
> + * synchronization, waiting for prior work to complete can be done via
> + * poll() on the DMA buffer file descriptor.  If the driver or API requires
> + * explicit synchronization, the client may have to wait on a sync_file or
> + * other synchronization primitive outside the scope of the DMA buffer API.
> + */
>  struct dma_buf_sync {
> +	/**
> +	 * @flags: Set of access flags
> +	 *
> +	 * DMA_BUF_SYNC_START:
> +	 *     Indicates the start of a map access session.
> +	 *
> +	 * DMA_BUF_SYNC_END:
> +	 *     Indicates the end of a map access session.
> +	 *
> +	 * DMA_BUF_SYNC_READ:
> +	 *     Indicates that the mapped DMA buffer will be read by the
> +	 *     client via the CPU map.
> +	 *
> +	 * DMA_BUF_SYNC_WRITE:
> +	 *     Indicates that the mapped DMA buffer will be written by the
> +	 *     client via the CPU map.
> +	 *
> +	 * DMA_BUF_SYNC_RW:
> +	 *     An alias for DMA_BUF_SYNC_READ | DMA_BUF_SYNC_WRITE.
> +	 */
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
