Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88360282311
	for <lists+dri-devel@lfdr.de>; Sat,  3 Oct 2020 11:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7273E6E32A;
	Sat,  3 Oct 2020 09:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D86F6E0DD;
 Fri,  2 Oct 2020 15:02:37 +0000 (UTC)
Received: from HKMAIL103.nvidia.com (Not Verified[10.18.92.100]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7741090000>; Fri, 02 Oct 2020 23:02:33 +0800
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL103.nvidia.com
 (10.18.16.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 15:02:31 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Fri, 2 Oct 2020 15:02:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2dEVBSPb6F62h2fvVXdjxm3H5dnZJ8USu0pNffi5tLZOkFe/SGO1y7KwkaTW1700RXjj9Uw1g0/TWWDps+FtTxJWFZJEdlvagDsRxF57+gpqP/baTUQLLcxSz4hFca780NsBPZGz9CoFqjp2QwX93REPCAVpBFedsR1xIshSPLLJOfV2OFLZVZaZCCy24uHhgcMkwW5KP0H9w0Wnp8tYmGiL5Qqpph6QDmTeuNNHgd1/rkh0pJ1a6Ac0bkKDcsNRhJ/b220V+HYBF3LH2C7ziaYKCTO8rnyvl4B8BsBcSdbitt7u46YqQ5xETbplGaxMxIraa774t3Z90kx4amKCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gYhoD4eUWiVZW5V1o8Lr0aPyImgXJ34OhnHf+S2HlBY=;
 b=bqTKCmMo4GvytYyqOVRJ8GIX9WnBBZlQ7QUKsXFhfWdjb8Qo5SXa+9zYp/GcBmORKvq+zxzSYq2uPAzk1fOeDDbbKFXKqEOmbeD0q55uq/XjwSIMpw7P5lsLMFya00UyyW6a3tpC8Sir2yN5CSngGZuddDFCJdfr6/VbYgZ8DIVUxuJ7LIIBkI9se0L+4hyc93aWvgaPw3/Q2Ike8AWuf8YB5VYzfXIMSpHcReeWg55T1zY4OG6wjakxrQ5ZEGC4RSks9GViEeTYgJuse/M1xZaJpdW4Y79CNVFFiem4m40Q0KSP/8QdEAigHC9vnquOHUmUB3vl02kuiwcnGWuXjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1145.namprd12.prod.outlook.com (2603:10b6:3:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32; Fri, 2 Oct
 2020 15:02:29 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3433.038; Fri, 2 Oct 2020
 15:02:29 +0000
Date: Fri, 2 Oct 2020 12:02:27 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH rdma-next v4 1/4] lib/scatterlist: Add support in dynamic
 allocation of SG table from pages
Message-ID: <20201002150227.GA1350139@nvidia.com>
References: <20200927064647.3106737-1-leon@kernel.org>
 <20200927064647.3106737-2-leon@kernel.org>
Content-Disposition: inline
In-Reply-To: <20200927064647.3106737-2-leon@kernel.org>
X-ClientProxiedBy: MN2PR12CA0011.namprd12.prod.outlook.com
 (2603:10b6:208:a8::24) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR12CA0011.namprd12.prod.outlook.com (2603:10b6:208:a8::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.36 via Frontend Transport; Fri, 2 Oct 2020 15:02:29 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kOMZo-005rzO-0W; Fri, 02 Oct 2020 12:02:28 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601650953; bh=gYhoD4eUWiVZW5V1o8Lr0aPyImgXJ34OhnHf+S2HlBY=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=A+ibKMd1673+eRSi2IOjyjU5J8gPum2b2z2A67KGIleVRbsRLztActbguUCRCTmdy
 CMrP9Fw4KB1QMHmzVZsL0xEUcpkT+DOhcy4mvHGrap5VyFSWGZmBE0CQkIZL+d6QqZ
 xN6k3aZB7kI1P22gu9YwaxkV6DT5JsWHV1efOJWbyvBGOYJ7EUrp2tPmwCmhUrgid4
 51tuRcdZ4Bl1dw0ED6xKNaUuubNZ2/6jrmVFaTioHH9Lmwp4Gmkb2eQ7blYxnvUZXQ
 nog6B9u2wxVNjOMjO+6M7CeIVTmxs6O/OoUVdh8VageYhTBpbbaa+4nAWH6gzV7rgU
 iFWQZI+IB523Q==
X-Mailman-Approved-At: Sat, 03 Oct 2020 09:23:39 +0000
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, linux-rdma@vger.kernel.org,
 Doug Ledford <dledford@redhat.com>, VMware
 Graphics <linux-graphics-maintainer@vmware.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maor Gottlieb <maorg@nvidia.com>,
 Maor Gottlieb <maorg@mellanox.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 27, 2020 at 09:46:44AM +0300, Leon Romanovsky wrote:
> +struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
> +		struct page **pages, unsigned int n_pages, unsigned int offset,
> +		unsigned long size, unsigned int max_segment,
> +		struct scatterlist *prv, unsigned int left_pages,
> +		gfp_t gfp_mask)
>  {
> -	unsigned int chunks, cur_page, seg_len, i;
> +	unsigned int chunks, cur_page, seg_len, i, prv_len = 0;
> +	struct scatterlist *s = prv;
> +	unsigned int table_size;
> +	unsigned int tmp_nents;
>  	int ret;
> -	struct scatterlist *s;
> 
>  	if (WARN_ON(!max_segment || offset_in_page(max_segment)))
> -		return -EINVAL;
> +		return ERR_PTR(-EINVAL);
> +	if (IS_ENABLED(CONFIG_ARCH_NO_SG_CHAIN) && prv)
> +		return ERR_PTR(-EOPNOTSUPP);
> +
> +	tmp_nents = prv ? sgt->nents : 0;
> +
> +	if (prv &&
> +	    page_to_pfn(sg_page(prv)) + (prv->length >> PAGE_SHIFT) ==

This calculation of the end doesn't consider sg->offset

> +	    page_to_pfn(pages[0]))
> +		prv_len = prv->length;
> 
>  	/* compute number of contiguous chunks */
>  	chunks = 1;
> @@ -410,13 +461,17 @@ int __sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
>  		}
>  	}
> 
> -	ret = sg_alloc_table(sgt, chunks, gfp_mask);
> -	if (unlikely(ret))
> -		return ret;
> +	if (!prv) {
> +		/* Only the last allocation could be less than the maximum */
> +		table_size = left_pages ? SG_MAX_SINGLE_ALLOC : chunks;
> +		ret = sg_alloc_table(sgt, table_size, gfp_mask);
> +		if (unlikely(ret))
> +			return ERR_PTR(ret);
> +	}

This is basically redundant right? Now that get_next_sg() can allocate
SGs it can just build them one by one, no need to preallocate.

Actually all the changes the the allocation seem like overkill, just
allocate a single new array directly in get_next_sg() whenever it
needs.

Something like this:

@@ -365,6 +372,37 @@ int sg_alloc_table(struct sg_table *table, unsigned int nents, gfp_t gfp_mask)
 }
 EXPORT_SYMBOL(sg_alloc_table);
 
+static struct scatterlist *get_next_sg(struct sg_table *table,
+		struct scatterlist *cur, unsigned long needed_sges,
+		gfp_t gfp_mask)
+{
+	struct scatterlist *new_sg;
+	unsigned int alloc_size;
+
+	if (cur) {
+		struct scatterlist *next_sg = sg_next(cur);
+
+		/* Check if last entry should be keeped for chainning */
+		if (!sg_is_last(next_sg) || needed_sges == 1)
+			return next_sg;
+	}
+
+	alloc_size = min_t(unsigned long, needed_sges, SG_MAX_SINGLE_ALLOC);
+	new_sg = sg_kmalloc(alloc_size, gfp_mask);
+	if (!new_sg)
+		return ERR_PTR(-ENOMEM);
+	sg_init_table(new_sg, alloc_size);
+	if (cur) {
+		__sg_chain(cur, new_sg);
+		table->orig_nents += alloc_size - 1;
+	} else {
+		table->sgl = new_sg;
+		table->orig_nents = alloc_size;
+		table->nents = 0;
+	}
+	return new_sg;
+}
+
 /**
  * __sg_alloc_table_from_pages - Allocate and initialize an sg table from
  *			         an array of pages
@@ -374,29 +412,64 @@ EXPORT_SYMBOL(sg_alloc_table);
  * @offset:      Offset from start of the first page to the start of a buffer
  * @size:        Number of valid bytes in the buffer (after offset)
  * @max_segment: Maximum size of a scatterlist node in bytes (page aligned)
+ * @prv:	 Last populated sge in sgt
+ * @left_pages:  Left pages caller have to set after this call
  * @gfp_mask:	 GFP allocation mask
  *
- *  Description:
- *    Allocate and initialize an sg table from a list of pages. Contiguous
- *    ranges of the pages are squashed into a single scatterlist node up to the
- *    maximum size specified in @max_segment. An user may provide an offset at a
- *    start and a size of valid data in a buffer specified by the page array.
- *    The returned sg table is released by sg_free_table.
+ * Description:
+ *    If @prv is NULL, allocate and initialize an sg table from a list of pages,
+ *    else reuse the scatterlist passed in at @prv.
+ *    Contiguous ranges of the pages are squashed into a single scatterlist
+ *    entry up to the maximum size specified in @max_segment.  A user may
+ *    provide an offset at a start and a size of valid data in a buffer
+ *    specified by the page array.
  *
  * Returns:
- *   0 on success, negative error on failure
+ *   Last SGE in sgt on success, PTR_ERR on otherwise.
+ *   The allocation in @sgt must be released by sg_free_table.
+ *
+ * Notes:
+ *   If this function returns non-0 (eg failure), the caller must call
+ *   sg_free_table() to cleanup any leftover allocations.
  */
-int __sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
-				unsigned int n_pages, unsigned int offset,
-				unsigned long size, unsigned int max_segment,
-				gfp_t gfp_mask)
+struct scatterlist *__sg_alloc_table_from_pages(struct sg_table *sgt,
+		struct page **pages, unsigned int n_pages, unsigned int offset,
+		unsigned long size, unsigned int max_segment,
+		struct scatterlist *prv, unsigned int left_pages,
+		gfp_t gfp_mask)
 {
-	unsigned int chunks, cur_page, seg_len, i;
-	int ret;
-	struct scatterlist *s;
+	unsigned int chunks, cur_page, seg_len, i, prv_len = 0;
+	unsigned int added_nents = 0;
+	struct scatterlist *s = prv;
 
 	if (WARN_ON(!max_segment || offset_in_page(max_segment)))
-		return -EINVAL;
+		return ERR_PTR(-EINVAL);
+	if (IS_ENABLED(CONFIG_ARCH_NO_SG_CHAIN) && prv)
+		return ERR_PTR(-EOPNOTSUPP);
+
+	if (prv) {
+		unsigned long paddr = (page_to_pfn(sg_page(prv)) * PAGE_SIZE +
+				       prv->offset + prv->length) /
+				      PAGE_SIZE;
+
+		if (WARN_ON(offset))
+			return ERR_PTR(-EINVAL);
+
+		/* Merge contiguous pages into the last SG */
+		prv_len = prv->length;
+		while (n_pages && page_to_pfn(pages[0]) == paddr) {
+			if (prv->length + PAGE_SIZE > max_segment)
+				break;
+			prv->length += PAGE_SIZE;
+			paddr++;
+			pages++;
+			n_pages--;
+		}
+		if (!n_pages) {
+			sg_mark_end(sg_next(prv));
+			return prv;
+		}
+	}
 
 	/* compute number of contiguous chunks */
 	chunks = 1;
@@ -410,13 +483,9 @@ int __sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
 		}
 	}
 
-	ret = sg_alloc_table(sgt, chunks, gfp_mask);
-	if (unlikely(ret))
-		return ret;
-
 	/* merging chunks and putting them into the scatterlist */
 	cur_page = 0;
-	for_each_sg(sgt->sgl, s, sgt->orig_nents, i) {
+	for (i = 0; i < chunks; i++) {
 		unsigned int j, chunk_size;
 
 		/* look for the end of the current chunk */
@@ -429,15 +498,28 @@ int __sg_alloc_table_from_pages(struct sg_table *sgt, struct page **pages,
 				break;
 		}
 
+		/* Pass how many chunks might be left */
+		s = get_next_sg(sgt, s, chunks - i + left_pages, gfp_mask);
+		if (IS_ERR(s)) {
+			/*
+			 * Adjust entry length to be as before function was
+			 * called.
+			 */
+			if (prv)
+				prv->length = prv_len;
+			return s;
+		}
 		chunk_size = ((j - cur_page) << PAGE_SHIFT) - offset;
 		sg_set_page(s, pages[cur_page],
 			    min_t(unsigned long, size, chunk_size), offset);
+		added_nents++;
 		size -= chunk_size;
 		offset = 0;
 		cur_page = j;
 	}
-
-	return 0;
+	sgt->nents += added_nents;
+	sg_mark_end(s);
+	return s;
 }
 EXPORT_SYMBOL(__sg_alloc_table_from_pages);
 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
