Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B55F23B75FE
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 17:55:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30846E8AD;
	Tue, 29 Jun 2021 15:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639576E8AD
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 15:55:19 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i94so26466501wri.4
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 08:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=WEojPjsV3ykyxbi9z7NRgZv6sToKhUFLAsfPvjr4z+E=;
 b=kav40qXis5AYEd1L7EDM6xxJivVvxbNSKSq+CBd5s+18VHu75OqZrXoI+sY+3/1k6t
 +00O8pauIDVVjBILhvdBPu4wUErbUhmbZermGLoCv9sB5xLLeUgW9PhBNqBhLLlJd4R0
 eXT70pVBcNa+evB30t/7wTKlxa/kXzLRBdMu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=WEojPjsV3ykyxbi9z7NRgZv6sToKhUFLAsfPvjr4z+E=;
 b=fCDM5NuIKgtmeyuDScgLPjHJ+zPmmXjQB7Oq09va87K0kmffv8Ky4nt3792qNKpO6O
 jE9fuijLzdUSzULnrOrAOCJG4oybrYflaIC4dUmQGZlyViOy1tLMTtswTz6GBRhAXVe/
 n6zwxji+Fwpcqz9qkcYOFa67HszrmtZ1yNvJo34NeQrxSc12CktB3RIDEn7of6MBjOvU
 ESXlyKeeZCn3eYco5ODAnTddc6FEGXrGUrjrpbt0rBp+jxFUzHA9E0FOSZhsWEbML/Yx
 1bBroCwfDG4CxacCgtK4rwhJqHQkUGPPn68B3ajVKxowWeAckP/vyoRLD5vEpoMyDYzj
 oH0Q==
X-Gm-Message-State: AOAM533RrQ+1gT0OE2ebP3+0FG1Pl/2Tpf931uFARxIoxUAx7II3ocBT
 ChelgKQiaZlxRyKDkC8U1sUbSw==
X-Google-Smtp-Source: ABdhPJwy//RfOpOtuDUFzUPw0qGyBWCU1xYg2FxNtD+pBORPuM1k7hT2WqXFwV1cl1tJjWezk3iDOA==
X-Received: by 2002:adf:f246:: with SMTP id b6mr8264853wrp.331.1624982118145; 
 Tue, 29 Jun 2021 08:55:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t16sm4438422wrx.89.2021.06.29.08.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 08:55:17 -0700 (PDT)
Date: Tue, 29 Jun 2021 17:55:15 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH -next] <linux/dma-resv.h>: correct a function name in
 kernel-doc
Message-ID: <YNtCYyHXOrObRUDK@phenom.ffwll.local>
Mail-Followup-To: Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
References: <20210628004012.6792-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210628004012.6792-1-rdunlap@infradead.org>
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
Cc: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 27, 2021 at 05:40:12PM -0700, Randy Dunlap wrote:
> Fix kernel-doc function name warning:
> 
> ../include/linux/dma-resv.h:227: warning: expecting prototype for dma_resv_exclusive(). Prototype was for dma_resv_excl_fence() instead
> 
> Fixes: 6edbd6abb783d ("ma-buf: rename and cleanup dma_resv_get_excl v3")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linaro-mm-sig@lists.linaro.org

Queued up, thanks for your patch (and the handy -next signifier in the
patch tag). I think Christian had the fix for this already, but queued up
in the next branch (for the 5.15 merge window, we're already prepping
stuff there to avoid late feature additions for 5.14), so applied yours
once more to the right tree.

Cheers, Daniel

> ---
>  include/linux/dma-resv.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20210625.orig/include/linux/dma-resv.h
> +++ linux-next-20210625/include/linux/dma-resv.h
> @@ -212,7 +212,7 @@ static inline void dma_resv_unlock(struc
>  }
>  
>  /**
> - * dma_resv_exclusive - return the object's exclusive fence
> + * dma_resv_excl_fence - return the object's exclusive fence
>   * @obj: the reservation object
>   *
>   * Returns the exclusive fence (if any). Caller must either hold the objects

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
