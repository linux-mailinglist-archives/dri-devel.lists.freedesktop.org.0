Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF2355B8DF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 11:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6789111A3E0;
	Mon, 27 Jun 2022 09:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2F4D11A3DA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 09:08:35 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ay16so17740445ejb.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 02:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=k1e7Wwe1AjCbXe7sromgO+mILN6P9Y2vdSpGp2oCkCk=;
 b=b8qCSWEOKka9s84N0wcEJ/GTZwusewGy5IsaK2F9Q4UFzB6+y+8ozRjXh89hAvLlMU
 K12dt4t2k478igf5w1imCsx/nqsNQMxOs1sQIJ30nQnGe+id+s6HkddlqiCTvSHJSysA
 9g99nL0Wk1M/DhvRrpm4pO91F74cEKsE6GmoE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=k1e7Wwe1AjCbXe7sromgO+mILN6P9Y2vdSpGp2oCkCk=;
 b=N32gAp1rxyd1NJS/KNgNVripwuWVI2J+KjbUM3UCC+c+rAtlZrlRhvs55tQFyrP8Cx
 IfYE/+QyRDgsjXOwryMd69Tt8DmtipVid4QuyISf6rT8dXc+zb76k0bMrZW96TAqjEOd
 FxMLx72d0AMHW+hOvK36Zp0xsCgzg+3R45LRGSKKBTixhyjqr2flN51wUalUsI1xrtfE
 P/S6QjWR6pwjr/aUnIlSRukvGfawNefUSGwJ4kinAfW24E8v5z8K9/wW5UKf4cO9Mmwj
 FyZONP0x2RMN+GtFdMJjYZzJ6jhIlNiD4guvwF8Z4L0pAF/44ByKdIAuGsuS5BLYu7QJ
 Je1A==
X-Gm-Message-State: AJIora83Pfqjnah3kSrb3msC4bEbUcG4NI9P4ZGm5u/UlLOfRlN7cobF
 vTTTqRh2l5HENwkJEN6ceDjVPQ==
X-Google-Smtp-Source: AGRyM1vFhPN1meHKKImI2keGZpwl6qEWNsZwQgQPLYnEouybFA2jLTjk/b7ksAjiA+H1CLyv+UeX1w==
X-Received: by 2002:a17:907:7811:b0:6ef:a896:b407 with SMTP id
 la17-20020a170907781100b006efa896b407mr11583984ejc.645.1656320914396; 
 Mon, 27 Jun 2022 02:08:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a50e787000000b0042ab4e20543sm7225848edn.48.2022.06.27.02.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 02:08:33 -0700 (PDT)
Date: Mon, 27 Jun 2022 11:08:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2 7/8] dma-buf: remove useless FMODE_LSEEK flag
Message-ID: <YrlzkAlheCR0ZMuO@phenom.ffwll.local>
Mail-Followup-To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 Jens Axboe <axboe@kernel.dk>, linux-fsdevel@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
References: <20220625110115.39956-1-Jason@zx2c4.com>
 <20220625110115.39956-8-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220625110115.39956-8-Jason@zx2c4.com>
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 25, 2022 at 01:01:14PM +0200, Jason A. Donenfeld wrote:
> This is already set by anon_inode_getfile(), since dma_buf_fops has
> non-NULL ->llseek, so we don't need to set it here too.
> 
> Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

I'm assuming this is part of a vfs cleanup and lands through that tree?
For that:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/dma-buf/dma-buf.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 32f55640890c..3f08e0b960ec 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -549,7 +549,6 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
>  		goto err_dmabuf;
>  	}
>  
> -	file->f_mode |= FMODE_LSEEK;
>  	dmabuf->file = file;
>  
>  	mutex_init(&dmabuf->lock);
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
