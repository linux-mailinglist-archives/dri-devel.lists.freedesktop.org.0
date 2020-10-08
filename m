Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940632875AC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Oct 2020 16:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9A5F89A9B;
	Thu,  8 Oct 2020 14:09:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A10B4896C4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Oct 2020 14:09:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n18so6785251wrs.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Oct 2020 07:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=elZJD7XRgqQldYOtQwrqdR/qGnh8Wpkk/pfQRzrmtYM=;
 b=enBpRbP+Y+vrFIYrWPQNxBnkuaMmg25PgrMBeow6OQNpTFvPzN+XBpA5OiRQs3FnpH
 yn2sjyj5Z/cKTHqfztw85EqTF/+tUnU7Ggylp9H+9saopjbyB39hup7iipRvTm1N8QkU
 4hcPZCQBIGwlfCroWRjBD48VJcP3UF4X4GYKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=elZJD7XRgqQldYOtQwrqdR/qGnh8Wpkk/pfQRzrmtYM=;
 b=NBnscYZVQ/rHHud2V9g4JuKPMPTiPJruAUM6JnrHB9x+B/dRy3CXpjPL0gsoAzLdBb
 hosGMtYWG4a6IqSfZW6G8aYXQ5emlONqk8To0v00mz8QLsFCKD1RHscJ3is+L9vjYUsk
 IKgKs7F/2KaW5QISkvsGN35+crXv9EWyTG6a7bDZ6BHS2/lAlipjCj7E2Ua2R+B4n2jm
 O4kBYlIAG4DCEmqDOzQAwSSDMvlnZTp5IHIO0KDLvBxYT/uf30s27RWN/Csk3M/dJvb8
 0gBRXMvt1Orq1V7FaD7ohz5X/ouaIU3vqKXP86f05UqEECAGBE7nnJIlX4O2bTQSXjv6
 x3gw==
X-Gm-Message-State: AOAM533tEuECUnokWX8DW2S8lYAfNjZmjOoSct8XfMWM/Wf7yGIzCg5s
 wfiEyngvdxIdZQHUiOHtgxJoyw==
X-Google-Smtp-Source: ABdhPJxnvjHp0B8DifTQr62vFQPdmb3m15u0GYpDuxfNs6OohHQD8sm0hL1lDYa4JXvQgG/WhvcUCQ==
X-Received: by 2002:a5d:4802:: with SMTP id l2mr9290612wrq.282.1602166157191; 
 Thu, 08 Oct 2020 07:09:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b200sm7777009wme.44.2020.10.08.07.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 07:09:16 -0700 (PDT)
Date: Thu, 8 Oct 2020 16:09:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 2/4] drm/prime: document that use the page array is
 deprecated
Message-ID: <20201008140914.GF438822@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, chris@chris-wilson.co.uk,
 airlied@redhat.com, akpm@linux-foundation.org,
 sumit.semwal@linaro.org
References: <20201008112342.9394-1-christian.koenig@amd.com>
 <20201008112342.9394-2-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201008112342.9394-2-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
 chris@chris-wilson.co.uk, linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 airlied@redhat.com, akpm@linux-foundation.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 08, 2020 at 01:23:40PM +0200, Christian K=F6nig wrote:
> We have reoccurring requests on this so better document that
> this approach doesn't work and dma_buf_mmap() needs to be used instead.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/drm_prime.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 4910c446db83..16fa2bfc271e 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -956,7 +956,7 @@ EXPORT_SYMBOL(drm_gem_prime_import);
>  /**
>   * drm_prime_sg_to_page_addr_arrays - convert an sg table into a page ar=
ray
>   * @sgt: scatter-gather table to convert
> - * @pages: optional array of page pointers to store the page array in
> + * @pages: deprecated array of page pointers to store the page array in
>   * @addrs: optional array to store the dma bus address of each page
>   * @max_entries: size of both the passed-in arrays
>   *
> @@ -965,6 +965,11 @@ EXPORT_SYMBOL(drm_gem_prime_import);
>   *
>   * Drivers can use this in their &drm_driver.gem_prime_import_sg_table
>   * implementation.
> + *
> + * Specifying the pages array is deprecated and strongly discouraged for=
 new
> + * drivers. The pages array is only useful for page faults and those can
> + * corrupt fields in the struct page if they are not handled by the expo=
rting
> + * driver.
>   */

I'd make this a _lot_ stronger: Aside from amdgpu and radeon all drivers
using this only need it for the pages array. Imo just open-code the sg
table walking loop in amdgpu/radeon (it's really not much code), and then
drop the dma_addr_t parameter from this function here (it's set to NULL by
everyone else).

And then deprecate this entire function here with a big warning that a)
dma_buf_map_attachment is allowed to leave the struct page pointers NULL
and b) this breaks mmap, users must call dma_buf_mmap instead.

Also maybe make it an uppercase DEPRECATED or something like that :-)
-Daniel

>  int drm_prime_sg_to_page_addr_arrays(struct sg_table *sgt, struct page *=
*pages,
>  				     dma_addr_t *addrs, int max_entries)
> -- =

> 2.17.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
