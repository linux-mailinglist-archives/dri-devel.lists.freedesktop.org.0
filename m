Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E636374C0
	for <lists+dri-devel@lfdr.de>; Thu, 24 Nov 2022 10:06:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2C710E6BB;
	Thu, 24 Nov 2022 09:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBC810E6BB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 09:05:47 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id n20so2824718ejh.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Nov 2022 01:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XKlbdr0ixds4paIOPKsA175xamTIxoec9jBfY1XMP/c=;
 b=ManxrbJva+RcaZ1pgy61KlOXet2k5tNGPxzxLAtn07OZAKYM9J+CI9fCmoBZYuuuIV
 F1+ga8J+vsvrrp2+r7zT5RH3Dg51n5GslIyFLmWG/YOHjmYrhZg8pOo3ACajMl9zYV8R
 VWV91495k6gOZuLxLWiqrXwu0Bhi4Ddd7n210=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XKlbdr0ixds4paIOPKsA175xamTIxoec9jBfY1XMP/c=;
 b=q0tmNkdx18s1l5F1DVHW+kUjQflLi9gcxXrTDGRt/ziZF2mtOFCfQwb1/QkvKsAEC4
 H7raLLXgxHNsfsLYnjPEX3zRWBwKSwqfi/TbNTFx8kyTyhsMlISH6jdbQyrN6/AKyHPZ
 OC+08fAaSLCBq9fK2zTYIpekRkVTFc64gVx9C2ktVzKpPhKYeAXIswL1wxoCNd3ufdqe
 zALFFJoIX9Wnby7i/arUO59loSHkU8PEfReHbBkuvXNEJUpcC6llimshjyieIXf0c40P
 4GFhmNDG8B+ImAN/j6A8GiZtDO4614wuNknlgSND6rCa5qsLXYtqE5e/o//OOXsmgu9w
 KTTA==
X-Gm-Message-State: ANoB5pnIyegr8cZO8uSELJXIumhoOgSj2G25IvoX2eUUXfrgaxPylnEB
 yDlSavd6+sfEAmoAnQayKPSePg==
X-Google-Smtp-Source: AA0mqf7p10lzEx8VmXSg9+u5DLJIGEhK1NGmIuP+ia7oyyWd4DAtEakvIkIFE8FUqgbTHM1igSNn/g==
X-Received: by 2002:a17:906:524f:b0:7ae:59dd:e3f4 with SMTP id
 y15-20020a170906524f00b007ae59dde3f4mr15723133ejm.755.1669280746416; 
 Thu, 24 Nov 2022 01:05:46 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 i13-20020a17090639cd00b0078d957e65b6sm211642eje.23.2022.11.24.01.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 01:05:45 -0800 (PST)
Date: Thu, 24 Nov 2022 10:05:44 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-buf: A collection of typo and documentation fixes
Message-ID: <Y38z6A5IF/BlXVPp@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
References: <20221123193519.3948105-1-tjmercier@google.com>
 <260a86f0-057e-e235-ac38-abeb922d0dc1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <260a86f0-057e-e235-ac38-abeb922d0dc1@amd.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 "T.J. Mercier" <tjmercier@google.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 24, 2022 at 08:03:09AM +0100, Christian König wrote:
> Am 23.11.22 um 20:35 schrieb T.J. Mercier:
> > I've been collecting these typo fixes for a while and it feels like
> > time to send them in.
> > 
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> 
> Acked-by: Christian König <christian.koenig@amd.com>

Will you also push this? I think tj doesn't have commit rights yet, and I
somehow can't see the patch locally (I guess it's stuck in moderation).
-Daniel

> 
> > ---
> >   drivers/dma-buf/dma-buf.c | 14 +++++++-------
> >   include/linux/dma-buf.h   |  6 +++---
> >   2 files changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index dd0f83ee505b..614ccd208af4 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1141,7 +1141,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, DMA_BUF);
> >    *
> >    * @dmabuf:	[in]	buffer which is moving
> >    *
> > - * Informs all attachmenst that they need to destroy and recreated all their
> > + * Informs all attachments that they need to destroy and recreate all their
> >    * mappings.
> >    */
> >   void dma_buf_move_notify(struct dma_buf *dmabuf)
> > @@ -1159,11 +1159,11 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
> >   /**
> >    * DOC: cpu access
> >    *
> > - * There are mutliple reasons for supporting CPU access to a dma buffer object:
> > + * There are multiple reasons for supporting CPU access to a dma buffer object:
> >    *
> >    * - Fallback operations in the kernel, for example when a device is connected
> >    *   over USB and the kernel needs to shuffle the data around first before
> > - *   sending it away. Cache coherency is handled by braketing any transactions
> > + *   sending it away. Cache coherency is handled by bracketing any transactions
> >    *   with calls to dma_buf_begin_cpu_access() and dma_buf_end_cpu_access()
> >    *   access.
> >    *
> > @@ -1190,7 +1190,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
> >    *   replace ION buffers mmap support was needed.
> >    *
> >    *   There is no special interfaces, userspace simply calls mmap on the dma-buf
> > - *   fd. But like for CPU access there's a need to braket the actual access,
> > + *   fd. But like for CPU access there's a need to bracket the actual access,
> >    *   which is handled by the ioctl (DMA_BUF_IOCTL_SYNC). Note that
> >    *   DMA_BUF_IOCTL_SYNC can fail with -EAGAIN or -EINTR, in which case it must
> >    *   be restarted.
> > @@ -1264,10 +1264,10 @@ static int __dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> >    * preparations. Coherency is only guaranteed in the specified range for the
> >    * specified access direction.
> >    * @dmabuf:	[in]	buffer to prepare cpu access for.
> > - * @direction:	[in]	length of range for cpu access.
> > + * @direction:	[in]	direction of access.
> >    *
> >    * After the cpu access is complete the caller should call
> > - * dma_buf_end_cpu_access(). Only when cpu access is braketed by both calls is
> > + * dma_buf_end_cpu_access(). Only when cpu access is bracketed by both calls is
> >    * it guaranteed to be coherent with other DMA access.
> >    *
> >    * This function will also wait for any DMA transactions tracked through
> > @@ -1307,7 +1307,7 @@ EXPORT_SYMBOL_NS_GPL(dma_buf_begin_cpu_access, DMA_BUF);
> >    * actions. Coherency is only guaranteed in the specified range for the
> >    * specified access direction.
> >    * @dmabuf:	[in]	buffer to complete cpu access for.
> > - * @direction:	[in]	length of range for cpu access.
> > + * @direction:	[in]	direction of access.
> >    *
> >    * This terminates CPU access started with dma_buf_begin_cpu_access().
> >    *
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index 71731796c8c3..1d61a4f6db35 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -330,7 +330,7 @@ struct dma_buf {
> >   	 * @lock:
> >   	 *
> >   	 * Used internally to serialize list manipulation, attach/detach and
> > -	 * vmap/unmap. Note that in many cases this is superseeded by
> > +	 * vmap/unmap. Note that in many cases this is superseded by
> >   	 * dma_resv_lock() on @resv.
> >   	 */
> >   	struct mutex lock;
> > @@ -365,7 +365,7 @@ struct dma_buf {
> >   	 */
> >   	const char *name;
> > -	/** @name_lock: Spinlock to protect name acces for read access. */
> > +	/** @name_lock: Spinlock to protect name access for read access. */
> >   	spinlock_t name_lock;
> >   	/**
> > @@ -402,7 +402,7 @@ struct dma_buf {
> >   	 *   anything the userspace API considers write access.
> >   	 *
> >   	 * - Drivers may just always add a write fence, since that only
> > -	 *   causes unecessarily synchronization, but no correctness issues.
> > +	 *   causes unnecessary synchronization, but no correctness issues.
> >   	 *
> >   	 * - Some drivers only expose a synchronous userspace API with no
> >   	 *   pipelining across drivers. These do not set any fences for their
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
