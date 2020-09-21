Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AA42730F5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 19:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCA126E50E;
	Mon, 21 Sep 2020 17:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4F86E061;
 Mon, 21 Sep 2020 17:43:00 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id n14so9898777pff.6;
 Mon, 21 Sep 2020 10:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QtMGv9Az8n8/1NHjLi6o0NjvgH4+/FeF5Ci7mHb3HKk=;
 b=C7h6inMmXViVfdzLNOvFuTTw5gDP/PsNQbK7XEZloBeiZ8TI/21zMOjn7CNA+2JpdR
 fcqHDQGOwu00JGZ24OItIms+ocEi5vn4ArXzVIiiv3IsrWX58V+/xvf5GAM6uWt45WHV
 J5uOcJSwwSsyQG3DI06e7LXhdO9u9oPEpVS+RmLizgAmeHXs0yGsQU1nOXkBOVIfgxKA
 R2QFqMXS/jWK8IGcmqN0UiZJVAO1wKzNqskrF4+I7n3VyZXcnkek4EZphD0W4XzFqzOv
 ok0cZ2Pc39gKnqlEn4+P3Rhkp0HO3HdeqOVIlHDzJsQPR318T1EvvNwcSWIeqku82piy
 vqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=QtMGv9Az8n8/1NHjLi6o0NjvgH4+/FeF5Ci7mHb3HKk=;
 b=NWLqyMgIZLgyq4eMOuV7j5dbGQ59qbpHx41vOx+OchlJzgAFTCtJU284/Ct7dPhayV
 Xr9P5A2HpmfGboypAunaX1ltSyZAAnYLLd8Ctay1muLMRJD3kBbV/DNU7Xg9dEmFNvlH
 nT8kbtJWqUSQc7fxb1QYmr0M+HLKL+CVnvVPaV4vDj3RYshiXPvUBRUYZtHOMMmA6d40
 UhfCeLv0beEsZRoU/1zkKd/4mgdLTGslZol/pPQSW1o4bOaUSIb5sunD3eBFTnMed4sB
 y7TvJXszaPxPuf6fOY6+dSw/TkHdL9toLa9oNSD6vQ4r7hcj3eAPlLF9M7vgS2lHh0xI
 SR8w==
X-Gm-Message-State: AOAM532xl13neHjndb6DNJPtwpcK8NmEGN0lWjzhOTPu7rkrKRRhPv5V
 SL4fpejoQKYabRS2gm6rOBo=
X-Google-Smtp-Source: ABdhPJz3bQvQ0y+Tkl35pFZsVWVp7/jEG6xMj1AV8L7OC4sV/ELLhXdmGbDdT9tBGrtDXWjgu18MoQ==
X-Received: by 2002:a17:902:8695:b029:d2:29b:991a with SMTP id
 g21-20020a1709028695b02900d2029b991amr1034190plo.80.1600710179810; 
 Mon, 21 Sep 2020 10:42:59 -0700 (PDT)
Received: from google.com ([2620:15c:211:1:7220:84ff:fe09:5e58])
 by smtp.gmail.com with ESMTPSA id ca6sm123394pjb.53.2020.09.21.10.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 10:42:58 -0700 (PDT)
Date: Mon, 21 Sep 2020 10:42:56 -0700
From: Minchan Kim <minchan@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/6] zsmalloc: switch from alloc_vm_area to get_vm_area
Message-ID: <20200921174256.GA387368@google.com>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-2-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918163724.2511-2-hch@lst.de>
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, intel-gfx@lists.freedesktop.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Nitin Gupta <ngupta@vflare.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 06:37:19PM +0200, Christoph Hellwig wrote:
> There is no obvious reason why zsmalloc needs to pre-fault the PTEs
> given that it later uses map_kernel_range to just like vmap().

IIRC, the problem was runtime pte popluating needs GFP_KERNEL but
zs_map_object API runs under non-preemtible section.

> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/zsmalloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
> index c36fdff9a37131..3e4fe3259612fd 100644
> --- a/mm/zsmalloc.c
> +++ b/mm/zsmalloc.c
> @@ -1122,7 +1122,7 @@ static inline int __zs_cpu_up(struct mapping_area *area)
>  	 */
>  	if (area->vm)
>  		return 0;
> -	area->vm = alloc_vm_area(PAGE_SIZE * 2, NULL);
> +	area->vm = get_vm_area(PAGE_SIZE * 2, 0);
>  	if (!area->vm)
>  		return -ENOMEM;
>  	return 0;

I think it shoud work.

diff --git a/mm/memory.c b/mm/memory.c
index 05789aa4af12..6a1e4d854593 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2232,7 +2232,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 	arch_enter_lazy_mmu_mode();
 
 	do {
-		if (create || !pte_none(*pte)) {
+		if ((create || !pte_none(*pte)) && fn) {
 			err = fn(pte++, addr, data);
 			if (err)
 				break;
diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 3e4fe3259612..9ef7daf3d279 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1116,6 +1116,8 @@ static struct zspage *find_get_zspage(struct size_class *class)
 #ifdef CONFIG_ZSMALLOC_PGTABLE_MAPPING
 static inline int __zs_cpu_up(struct mapping_area *area)
 {
+	int ret;
+
 	/*
 	 * Make sure we don't leak memory if a cpu UP notification
 	 * and zs_init() race and both call zs_cpu_up() on the same cpu
@@ -1125,7 +1127,13 @@ static inline int __zs_cpu_up(struct mapping_area *area)
 	area->vm = get_vm_area(PAGE_SIZE * 2, 0);
 	if (!area->vm)
 		return -ENOMEM;
-	return 0;
+
+	/*
+	 * Populate ptes in advance to avoid pte allocation with GFP_KERNEL
+	 * in non-preemtible context of zs_map_object.
+	 */
+	ret = apply_to_page_range(&init_mm, NULL, PAGE_SIZE * 2, NULL, NULL);
+	return ret;
 }
 
 static inline void __zs_cpu_down(struct mapping_area *area)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
