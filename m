Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4456C47D92C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 23:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AFB10E33B;
	Wed, 22 Dec 2021 22:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDDCF10E33B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 22:11:02 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id bm14so13925147edb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 14:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=CXXmUNxPkCxymkecbPfwTry1g1NESxMh7D+z/VdxfYM=;
 b=lLDhp0wKuaC0pk+ZWgOndJjJ1vfksBUUmOsvbYXG6ot3ltaiHTdLdwModIOhcX0XgB
 eXThLSvO7jjKN6s4JOXUO/W20CCl0dpGZRBs56wJWZ2aVMgfE2xDB4FezaG2S9142X0Q
 hZgzlOUuQPsrGmSm9csErzgeVApLf0CQX96Tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=CXXmUNxPkCxymkecbPfwTry1g1NESxMh7D+z/VdxfYM=;
 b=NRogF1d8Ec8gc56rKqdoHpjrxWIacUCysr0B4h+4tShqwlcqCVpscCDqKLDZ5OJvzc
 wjfhgRc+jJRY2VA3pxmtNPYf3PXOtqRHnWYVjdJUqSzAAKxAUCADqUKH8HkGUrtJA4Ye
 iWlYw3ymGB4r3UnzYXmHWuyCr+5HYqTgWHQU8Zl2PTQ4MdmP4YlNfY84s2Ti7MjXGG3z
 7xHsIY2+u3nNvfcbLlixelIcTZTdY8R7OIg3pfebINaY+NhWmNr2IYLYSHUH3bJ82i0N
 7uy0/vLQRMO/713KRmSaLtuiRixu2ZDpknWvJjAtRIqE5qtEGOC6CM9+prle1aQGk+R7
 vX9w==
X-Gm-Message-State: AOAM530HYpIrp/drMJeVh5ptBnlJLh+nYf2YD0sWSyCFYzWt7V2CyEkA
 lMJZvulM7gykanVQ/s1GbUeuKQ==
X-Google-Smtp-Source: ABdhPJyuWQsjblHvDjWOxEzOBMZLQ5tyFeaZsLWJLpnsj7fb46SUk3Yhx/EVMpWBN8NtsJFox7aAhA==
X-Received: by 2002:a17:906:5d0f:: with SMTP id
 g15mr4154210ejt.295.1640211061287; 
 Wed, 22 Dec 2021 14:11:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id sd39sm1164322ejc.14.2021.12.22.14.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 14:11:00 -0800 (PST)
Date: Wed, 22 Dec 2021 23:10:58 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 21/24] dma-buf: add DMA_RESV_USAGE_BOOKKEEP
Message-ID: <YcOicrYTIFJXG/3I@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-22-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-22-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 07, 2021 at 01:34:08PM +0100, Christian König wrote:
> Add an usage for submissions independent of implicit sync but still
> interesting for memory management.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Focusing on the kerneldoc first to get semantics agreed.

> diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
> index 29d799991496..07ae5b00c1fa 100644
> --- a/include/linux/dma-resv.h
> +++ b/include/linux/dma-resv.h
> @@ -55,7 +55,7 @@ struct dma_resv_list;
>   * This enum describes the different use cases for a dma_resv object and
>   * controls which fences are returned when queried.
>   *
> - * An important fact is that there is the order KERNEL<WRITE<READ and
> + * An important fact is that there is the order KERNEL<WRITE<READ<BOOKKEEP and
>   * when the dma_resv object is asked for fences for one use case the fences
>   * for the lower use case are returned as well.
>   *
> @@ -93,6 +93,22 @@ enum dma_resv_usage {
>  	 * an implicit read dependency.
>  	 */
>  	DMA_RESV_USAGE_READ,
> +
> +	/**
> +	 * @DMA_RESV_USAGE_BOOKKEEP: No implicit sync.
> +	 *
> +	 * This should be used by submissions which don't want to participate in
> +	 * implicit synchronization.

Uh we might still have a disagreement, because that isn't really what
drivers which added opt-in implicit sync have done thus far. Minimally we
need a note that some drivers also use _READ for this.

> +	 *
> +	 * The most common case are submissions with explicit synchronization,
> +	 * but also things like preemption fences as well as page table updates
> +	 * might use this.
> +	 *
> +	 * The kernel memory management *always* need to wait for those fences
> +	 * before moving or freeing the resource protected by the dma_resv
> +	 * object.

Yeah this is the comment I wanted to see for READ, and which now is in
bookkeeping (where it's correct in the end). I think we still should have
something in the READ comment (and here) explaining that there could very
well be writes hiding behind this, and that the kernel cannot assume
anything about what's going on in general (maybe some drivers enforce
read/write through command parsers).

Also all the text in dma_buf.resv needs to be updated to use the right
constants instead of words.
-Daniel


> +	 */
> +	DMA_RESV_USAGE_BOOKKEEP
>  };
>  
>  /**
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
