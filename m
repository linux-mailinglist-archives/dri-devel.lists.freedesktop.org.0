Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEFFC904B9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 23:28:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC04810E085;
	Thu, 27 Nov 2025 22:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NGd1KbwZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B751010E834
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 16:53:17 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5957c929a5eso1577148e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 08:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764262396; x=1764867196; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=P4drWKEd4RAmd7MBRAIQVZy+ZqrpPhSLkolh9dDZECE=;
 b=NGd1KbwZGHwcB1Ff6xAsWKzrRA9A4/iH06JkLCIs6jG8rdLZYXVa7DDvzw7xsiAp89
 73xhwADHyD2nSvpxlPjeTAg7FC9VJCcB9MDHgKR9Vnts0hmsSmxW+fQA2FHhqbHWOSOS
 EKjA0e3MWRn85kZJ2cW4wg7RnFodO5SXQByroUFts0gLpzbXF9MN5rtgbU4yvFEtZcXw
 l8Yblua2FVxbhE42zvCZrFoSWkuUAksBaS7fyvl4tR0I4uV+uXWd1x4FlUSK7bpyw6BM
 7GmkesguMurdqZghgNKZIbY7VvqUMhp8KClfQRdmOC/6bnymT/vG4D/SMYA2kidMWZOz
 JB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764262396; x=1764867196;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P4drWKEd4RAmd7MBRAIQVZy+ZqrpPhSLkolh9dDZECE=;
 b=FiYhZJPxMKccoJrcVRy+cGbPUwWcRMmy+TQi4ruJIFeCboF00M9O8SeVtJsjRy9I9A
 tfgbdXpmrtALe7b9RfSHT/oFfbyF4bW67AITJDDGsOjJ1l/sHcSkzenoR3epJGweEcGn
 cR+ApPWrWgZWdOe3kRVGKhD493WBtXcByuxMC2lbDEE5d7GS1peMQVt4POk7bvRbc8xf
 CfgI8ir4pBVpkNmskUd5YURn3/i+5Ej8hmmbuXXSMjXUBO6/0oCv3iZNKHXRLYVNL6Ly
 yF04aLL3aEWhbvHfGHmAW8sgc6meGTVmONLo+nh2EqBrnUdbEgoCavQPVmCU0/y+lD7U
 CA4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVk0mIQ9uVj+EmmPUNvanv8ibEX8gsM3bVlc+tASjcT9T4VCnaRrvGf72QqWZbVgnOXFlC5XVQrWog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJECUtLBqUpbs5+yOXfUwGgb6tV+ArevGTd5zE5HCGU7x+8p+k
 4UAtJwTMYau45JcSh9ueFQdTz7zs5KdgPuNJqzgoSTM4XHqikZ0HBqb1
X-Gm-Gg: ASbGncsIWCYyXjnMfwFzyBrsJIvhg47BHb4sXZRwH865fT6LVrZgo1qRAWK5fo6YWVg
 9PXfyAQioRe3qD4DYPPdM9Zd9hrbqCsNSIrTosV6Jg7FezxU7g3eUawb1XRXRIh0XS8QRvFAVfd
 TbFoZcEfBpdiflnmEW/Z6xIH5pslAQE3bsJ1enaQEbbNXVXsJheK9cmwIZEfqQJjFVAJpuV40UV
 /qosMcILdnfHJz4bMSYqV84qApOwVB++nNW4gpc0sLg6qjc/RRAa2PcKp0yH6vgsmdAlaDgB2pz
 Pf1yLEITGoPAn5k/2Rpi0I9dcbaon8Nr8kl/fovcbvOpJktPa+VyBr057Gd2IzWDeubq5mgIOWj
 AK6sjTpTzcHAO3m6CIBdUsjU+5iKbqNkJMEFKi3k0drUrhAV1IM/Cmg==
X-Google-Smtp-Source: AGHT+IH8j638xjzoDHoozqoJ+ZLnXS1T0OqZepwP8h1W2O745wvjvCM314d3621pAOHVbu+pSPoujA==
X-Received: by 2002:a05:6512:6d1:b0:595:9d26:f551 with SMTP id
 2adb3069b0e04-596b529c014mr4240034e87.48.1764262395589; 
 Thu, 27 Nov 2025 08:53:15 -0800 (PST)
Received: from milan ([2001:9b1:d5a0:a500::24b])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-596bfa44058sm530323e87.60.2025.11.27.08.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 08:53:14 -0800 (PST)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Thu, 27 Nov 2025 17:53:13 +0100
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Barry Song <v-songbaohua@oppo.com>, Uladzislau Rezki <urezki@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, John Stultz <jstultz@google.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH RFC] mm/vmap: map contiguous pages in batches whenever
 possible
Message-ID: <aSiB-UsunuE7u295@milan>
References: <20251122090343.81243-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251122090343.81243-1-21cnbao@gmail.com>
X-Mailman-Approved-At: Thu, 27 Nov 2025 22:28:39 +0000
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

On Sat, Nov 22, 2025 at 05:03:43PM +0800, Barry Song wrote:
> From: Barry Song <v-songbaohua@oppo.com>
> 
> In many cases, the pages passed to vmap() may include
> high-order pages—for example, the systemheap often allocates
> pages in descending order: order 8, then 4, then 0. Currently,
> vmap() iterates over every page individually—even the pages
> inside a high-order block are handled one by one. This patch
> detects high-order pages and maps them as a single contiguous
> block whenever possible.
> 
> Another possibility is to implement a new API, vmap_sg().
> However, that change seems to be quite large in scope.
> 
> When vmapping a 128MB dma-buf using the systemheap,
> this RFC appears to make system_heap_do_vmap() 16× faster:
> 
> W/ patch:
> [   51.363682] system_heap_do_vmap took 2474000 ns
> [   53.307044] system_heap_do_vmap took 2469008 ns
> [   55.061985] system_heap_do_vmap took 2519008 ns
> [   56.653810] system_heap_do_vmap took 2674000 ns
> 
> W/o patch:
> [    8.260880] system_heap_do_vmap took 39490000 ns
> [   32.513292] system_heap_do_vmap took 38784000 ns
> [   82.673374] system_heap_do_vmap took 40711008 ns
> [   84.579062] system_heap_do_vmap took 40236000 ns
> 
> Cc: Uladzislau Rezki <urezki@gmail.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: John Stultz <jstultz@google.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  mm/vmalloc.c | 49 +++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 43 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 0832f944544c..af2e3e8c052a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -642,6 +642,34 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
>  	return err;
>  }
>  
> +static inline int get_vmap_batch_order(struct page **pages,
> +		unsigned int stride,
> +		int max_steps,
> +		unsigned int idx)
> +{
> +	/*
> +	 * Currently, batching is only supported in vmap_pages_range
> +	 * when page_shift == PAGE_SHIFT.
> +	 */
> +	if (stride != 1)
> +		return 0;
> +
> +	struct page *base = pages[idx];
> +	if (!PageHead(base))
> +		return 0;
> +
> +	int order = compound_order(base);
> +	int nr_pages = 1 << order;
> +
> +	if (max_steps < nr_pages)
> +		return 0;
> +
> +	for (int i = 0; i < nr_pages; i++)
> +		if (pages[idx + i] != base + i)
> +			return 0;
> +	return order;
> +}
> +
>  /*
>   * vmap_pages_range_noflush is similar to vmap_pages_range, but does not
>   * flush caches.
> @@ -655,23 +683,32 @@ int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  		pgprot_t prot, struct page **pages, unsigned int page_shift)
>  {
>  	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> +	unsigned int stride;
>  
>  	WARN_ON(page_shift < PAGE_SHIFT);
>  
> +	/*
> +	 * Some users may allocate pages from high-order down to order 0.
> +	 * We roughly check if the first page is a compound page. If so,
> +	 * there is a chance to batch multiple pages together.
> +	 */
>  	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
> -			page_shift == PAGE_SHIFT)
> +			(page_shift == PAGE_SHIFT && !PageCompound(pages[0])))
>
Do we support __GFP_COMP as vmalloc/vmap flag? As i see from latest:

/*
 * See __vmalloc_node_range() for a clear list of supported vmalloc flags.
 * This gfp lists all flags currently passed through vmalloc. Currently,
 * __GFP_ZERO is used by BPF and __GFP_NORETRY is used by percpu. Both drm
 * and BPF also use GFP_USER. Additionally, various users pass
 * GFP_KERNEL_ACCOUNT. Xfs uses __GFP_NOLOCKDEP.
 */
#define GFP_VMALLOC_SUPPORTED (GFP_KERNEL | GFP_ATOMIC | GFP_NOWAIT |\
                               __GFP_NOFAIL |  __GFP_ZERO | __GFP_NORETRY |\
                               GFP_NOFS | GFP_NOIO | GFP_KERNEL_ACCOUNT |\
                               GFP_USER | __GFP_NOLOCKDEP)

Could you please clarify when PageCompound(pages[0]) returns true?

>  		return vmap_small_pages_range_noflush(addr, end, prot, pages);
>  
> -	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
> -		int err;
> +	stride = 1U << (page_shift - PAGE_SHIFT);
> +	for (i = 0; i < nr; ) {
> +		int err, order;
>  
> -		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
> +		order = get_vmap_batch_order(pages, stride, nr - i, i);
> +		err = vmap_range_noflush(addr, addr + (1UL << (page_shift + order)),
>  					page_to_phys(pages[i]), prot,
> -					page_shift);
> +					page_shift + order);
>  		if (err)
>  			return err;
>  
> -		addr += 1UL << page_shift;
> +		addr += 1UL  << (page_shift + order);
> +		i += 1U << (order + page_shift - PAGE_SHIFT);
>  	}
>  
>  	return 0;
> -- 
> 2.39.3 (Apple Git-146)
> 
