Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAA5AD8E8B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 16:04:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B2E10E9D9;
	Fri, 13 Jun 2025 14:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="DhEaMQsL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36FB10E9D6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 14:04:51 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-452f9735424so7740795e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1749823490; x=1750428290; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=dLoT73LsyTQbF53tUJuIUTun3OKeL9kjLtI94AuwaSE=;
 b=DhEaMQsLSfey/60tn16LxA5UlBdjkZkOzMl5hlrD/FxRaLX9XXCxquUHtYLaSLdTxt
 Wa2xpuoXolqjOwwkM5d2/Psj1r9fgKKNVG0q5QhUXU4AUJwZGOfIkoCxGuuZmU3LHz6O
 C48+N7OZFIL6XNawiMNuM1LMOPKCXB8rBK7cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749823490; x=1750428290;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dLoT73LsyTQbF53tUJuIUTun3OKeL9kjLtI94AuwaSE=;
 b=YqVFbvgbxj8ffNbPi7pPYKffMtmQ5f5ZjE8yRBSnt1dyydjroNZr/T3OmKfy/0U4yp
 vRklzbeLYOoGiBMZL05GZ6yfCy8FePAeCck1JJj9I3S0nbOudfWPcSHFNgj20Lo1pSjc
 Z31j76eFUBSMDZRDkIIyHsnNaXvcoqJxp5HgJBeGMhCP13721iAwF/bUYekalMke/1uc
 JvBowY6W3aobLU4vAny2eqEPQw/bV2x4vz+cSIp0t6Nepu9Mcm4pVFxSFaZ7TTovXOkq
 LRy9jad3bEhRLMAOCeqWM81olxJP/A2n3JMiGQhy6oODF/3gFDYeoTh5Uupr6qyjdv0W
 pRbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCF/IRGw/XgiNkc59CuiumW3YTYAPnj/e4rZBogUjWrFs8ZqTSM4MF8smkwyD4YNLIDfGRz37+Vmc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYLQQtwJRQtcFPLSPm8BzdSYwk56sG/+Bv8ua0G1Ee0PcBhDls
 N5LlpTUreH7qVQ/q+BwMoVPpR0JlgyfYzO4gqjSkuKUCPQ+sNyZHrdsG+RnEjFNhS9I=
X-Gm-Gg: ASbGncvU6NsVN2obinnCBXKZRjSpwPkY072tLjHd7wL2x2SO0FMgPvXRJxC1MI1QHjp
 qe5vL70n8nuvghNvY36BcmIJe0fMVC0orNFyLjol+3jZ4RVvvcTmCNwQl79D/dUCt1CZxgsDepw
 nIW5KMUjbVNzKcHFkqbnWQ/MmrRKhEntELEEedqWWoObIeH63zlrLTHJvecBIA2mA7QEyLJjBfg
 kiTaRf9qL+DCn9xxBCR5+t8Ra/k6e/7JrISeptLOsHQ6kRVYso+PeorPpz+QfaYxzBmmctxT7R6
 pEMVFrGEAzbezakm0am8HBZhB4HUfRuU6uJvOCGShoW28wHgyQfPskC2808GiPiQDX/IFz7+Uw=
 =
X-Google-Smtp-Source: AGHT+IFD0MmLobVMMsI10ydNOl9DsZDfzQOnH9VuyW9r6egrw2n2JCwEyHROq9zNJ3ikKb5BHfp+mA==
X-Received: by 2002:a05:600c:4706:b0:43c:fa24:8721 with SMTP id
 5b1f17b1804b1-45334ad06f5mr36114185e9.17.1749823488919; 
 Fri, 13 Jun 2025 07:04:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568b089cdsm2505296f8f.64.2025.06.13.07.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 07:04:48 -0700 (PDT)
Date: Fri, 13 Jun 2025 16:04:46 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: jani.saarinen@intel.com, jani.nikula@linux.intel.com,
 tursulin@ursulin.net, simona.vetter@ffwll.ch, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/prime: fix drm_prime_add_buf_handle
Message-ID: <aEwv_sV3V6p8dmkP@phenom.ffwll.local>
References: <20250613131201.2141-1-christian.koenig@amd.com>
 <20250613131201.2141-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613131201.2141-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 6.12.30-amd64 
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 13, 2025 at 03:12:01PM +0200, Christian König wrote:
> It is possible through flink or IOCTLs like MODE_GETFB2 to create
> multiple handles for the same underlying GEM object.
> 
> But in prime we explicitely don't want to have multiple handles for the
> same DMA-buf. So just ignore it if a DMA-buf is exported with another
> handle.
> 
> This was made obvious by removing the extra check in
> drm_gem_prime_handle_to_dmabuf() to not add the handle if we could already
> find it in the housekeeping structures.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_prime.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 1d93b44c00c4..f5f30d947b61 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -113,6 +113,17 @@ static int drm_prime_add_buf_handle(struct drm_prime_file_private *prime_fpriv,
>  
>  		rb = *p;
>  		pos = rb_entry(rb, struct drm_prime_member, dmabuf_rb);
> +
> +		/*
> +		 * Just ignore the new handle if we already have an handle for
> +		 * this DMA-buf.
> +		 */
> +		if (dma_buf == pos->dma_buf) {
> +			dma_buf_put(dma_buf);
> +			kfree(member);
> +			return 0;

This feels a bit brittle, because this case should only be possible when
called from drm_gem_prime_handle_to_dmabuf and not from
drm_gem_prime_fd_to_handle() (where it would indicate a real race and
hence bug in our code).

I think  drm_gem_prime_fd_to_handle() should WARN_ON if it hits this case. 

Otherwise yes this is the functional change that I've missed :-/ Note that
there's no race in the original code, because it's all protected by the
file_priv->prime.lock. Which means I think you're claim that you've only
widened the race with your patch is wrong.

Cheers, Sima

> +
> +		}
>  		if (dma_buf > pos->dma_buf)
>  			p = &rb->rb_right;
>  		else
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
