Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 526964F5E60
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 14:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BB210E26E;
	Wed,  6 Apr 2022 12:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED6510E21E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 12:48:39 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id bq8so3990738ejb.10
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 05:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=XLbDeRdIqcHBTN8y8yOmAb/E868VYxGtotM6kj18Wk8=;
 b=bMj3MxQRDIdDiCAx9hA2dWVp6FsFnvhvj8xQdp4Ww/5l3cZpeOH22jRDdU6cPFguRM
 oNdzDRQoQvnVXiDHw/B6lo3ma75T4U1MSUED4LGjKe1CNP2lHkaoi0mVQdTY90kwF5DW
 iuQEzvCgNtmHpy8HdC2p+R0/hsgb2YTBBcnCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XLbDeRdIqcHBTN8y8yOmAb/E868VYxGtotM6kj18Wk8=;
 b=F4k+tWJAOTHBupoOsxkHgna6+OTgFqxWStaFaOW0K4tSfJHzRSFE5gZCQM6VUZfplY
 7kh37TNnuIcJYv4ofhLQfBtuhcdoENYOq14nfaw4ON6/HyGgxyrbiGk7092n8shISlKr
 fzhPbRgsCBWDqL01p4ilRlTNTxnS0Q6iCdm1h7rkHOEnewSow2a2+K5eGIB1UEU/CbHb
 AJSPmouk9isB7jhNf/mXRm8MNR47eJMTredHr1R3NUlztYYYYF9jR64R03xLDD9IO7/l
 o9TK/qF/oHcevchGZG0AprJ8GTtR3eDs9MIsxb0pdkQMpo+kchv4Ed5p3CDq9/4k9M/f
 RL0g==
X-Gm-Message-State: AOAM533pX/kpu+2xuy7ooD4cE5+6BCEY96ZsQKDDhU+mQUeccwJKCHzD
 OZtBlR6RsPXIoft86SDs3I29qA==
X-Google-Smtp-Source: ABdhPJzSxs/wc9qTXoleIg7jUBaFLpTMcykIG5F0hcYEhkpbGNPt0hr90ej/yYaCI7pB9AYbon9Rwg==
X-Received: by 2002:a17:906:66d5:b0:6e0:5ba8:8e0f with SMTP id
 k21-20020a17090666d500b006e05ba88e0fmr7850947ejp.581.1649249317987; 
 Wed, 06 Apr 2022 05:48:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 o3-20020aa7c7c3000000b00410d407da2esm7586346eds.13.2022.04.06.05.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 05:48:37 -0700 (PDT)
Date: Wed, 6 Apr 2022 14:48:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DMA-resvusage@phenom.ffwll.local
Subject: Re: [PATCH 10/16] RDMA: use DMA_RESV_USAGE_KERNEL
Message-ID: <Yk2MI3ZKA1Is973w@phenom.ffwll.local>
References: <20220406075132.3263-1-christian.koenig@amd.com>
 <20220406075132.3263-11-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220406075132.3263-11-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 06, 2022 at 09:51:26AM +0200, Christian König wrote:
> We only need to wait for kernel submissions here.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

I think we had an implied ack from Jason on this one. Not quite enough cc
to regrab it.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/infiniband/core/umem_dmabuf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
> index f9901d273b8e..fce80a4a5147 100644
> --- a/drivers/infiniband/core/umem_dmabuf.c
> +++ b/drivers/infiniband/core/umem_dmabuf.c
> @@ -68,7 +68,7 @@ int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
>  	 * the migration.
>  	 */
>  	return dma_resv_wait_timeout(umem_dmabuf->attach->dmabuf->resv,
> -				     DMA_RESV_USAGE_WRITE,
> +				     DMA_RESV_USAGE_KERNEL,
>  				     false, MAX_SCHEDULE_TIMEOUT);
>  }
>  EXPORT_SYMBOL(ib_umem_dmabuf_map_pages);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
