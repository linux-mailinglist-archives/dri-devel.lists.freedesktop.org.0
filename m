Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B5918DF9F
	for <lists+dri-devel@lfdr.de>; Sat, 21 Mar 2020 11:45:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D9EA6E328;
	Sat, 21 Mar 2020 10:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA086E1A3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 16:59:47 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id q9so6688929iod.4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 09:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J9JcxoC0xHItzd7Bm+/rd4h3D6gYeCH34NADuZJ9STU=;
 b=UicuVQOUEOFXjcAue0sr6wmiMWeQXUmp/+3fIH5Zf7ToFdz2MJUF/GwaQV0CfokeCb
 R2ZYWS8t6p3i85jB4vGXhW7eauCyoXDMnLR5bqGUsHf6p7MUJiRrBD7IoIVVEIB4rwuA
 y7Ou48uJJJSNcpH0D02oeN5/knSWGgZa6OE2WopCjZyKOqlXD1J4bWaHUAy88Hi+g7z4
 OQy9KADO+sZIv3HZ5Z5kH4FLvXskp7bNMpRHHZ5+zSKF0JlEddd3Ns59vClO3DaXjZ4u
 SHP/vweGSCa3pfVODg70IS9UBVRTZnSNlDoLy3DvscRGxnThtEJy7i8cblj+pDVJdQlx
 F1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J9JcxoC0xHItzd7Bm+/rd4h3D6gYeCH34NADuZJ9STU=;
 b=X9ut8kRxj3Tz3jbNMQrhhzVAFEdtBqX3VKoi4sjBrvO7y6xD+Cqr8z3FXsc9RN/Y9j
 2OsCuI8IppuhoHxkr2/EbjOhfJ+x/BFYOK99Xmhx9t42656rdl+7HJ75qqn3LTRr8v5n
 AAq1l3XISeIg1KkHYrYnhy1gPHh+0FdlcFLr6LLbU2At3yfYXHKd5dyEabeSrzsXO+X0
 hz8K9sSZL7ynRP0Fa7Kg6fnvNvTBU+OZyXhtM2bWiYofwhRIZvCwzuJw9FbuS1JdjDbh
 26F3hbe7dKmaZLO8Pd0Qhv4wE41WLxJ/3+YcWqZU9GaJaGfMhFs7zN4nK4KEHOGR1TTa
 V0XQ==
X-Gm-Message-State: ANhLgQ2AnGDwIc3+efZnRBLHDXR7z5OxUpTypPVxYFD5WLfwQi+4AxBY
 RD9VHJBf2vf/Zi2Sp5rIgC00Id99Cl9uEg==
X-Google-Smtp-Source: ADFU+vtuzdu+L+cKseNEMu1uY1fgXL01MDSyACtZa/2w0baVgXDZzqzudj1Yb+oXFP4S8/aXJlsNnQ==
X-Received: by 2002:a37:9544:: with SMTP id x65mr8264783qkd.48.1584723025227; 
 Fri, 20 Mar 2020 09:50:25 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id z11sm4894505qti.23.2020.03.20.09.50.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Mar 2020 09:50:24 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jFKql-0005kC-9J; Fri, 20 Mar 2020 13:50:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH hmm 3/6] mm/hmm: remove unused code and tidy comments
Date: Fri, 20 Mar 2020 13:49:02 -0300
Message-Id: <20200320164905.21722-4-jgg@ziepe.ca>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200320164905.21722-1-jgg@ziepe.ca>
References: <20200320164905.21722-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 21 Mar 2020 10:44:30 +0000
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
Cc: Philip Yang <Philip.Yang@amd.com>, John Hubbard <jhubbard@nvidia.com>,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

Delete several functions that are never called, fix some desync between
comments and structure content, remove an unused ret, and move one
function only used by hmm.c into hmm.c

Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 include/linux/hmm.h | 50 ---------------------------------------------
 mm/hmm.c            | 12 +++++++++++
 2 files changed, 12 insertions(+), 50 deletions(-)

diff --git a/include/linux/hmm.h b/include/linux/hmm.h
index bb6be4428633a8..184a8633260f9d 100644
--- a/include/linux/hmm.h
+++ b/include/linux/hmm.h
@@ -120,9 +120,6 @@ enum hmm_pfn_value_e {
  *
  * @notifier: a mmu_interval_notifier that includes the start/end
  * @notifier_seq: result of mmu_interval_read_begin()
- * @hmm: the core HMM structure this range is active against
- * @vma: the vm area struct for the range
- * @list: all range lock are on a list
  * @start: range virtual start address (inclusive)
  * @end: range virtual end address (exclusive)
  * @pfns: array of pfns (big enough for the range)
@@ -131,7 +128,6 @@ enum hmm_pfn_value_e {
  * @default_flags: default flags for the range (write, read, ... see hmm doc)
  * @pfn_flags_mask: allows to mask pfn flags so that only default_flags matter
  * @pfn_shifts: pfn shift value (should be <= PAGE_SHIFT)
- * @valid: pfns array did not change since it has been fill by an HMM function
  * @dev_private_owner: owner of device private pages
  */
 struct hmm_range {
@@ -171,52 +167,6 @@ static inline struct page *hmm_device_entry_to_page(const struct hmm_range *rang
 	return pfn_to_page(entry >> range->pfn_shift);
 }
 
-/*
- * hmm_device_entry_to_pfn() - return pfn value store in a device entry
- * @range: range use to decode device entry value
- * @entry: device entry to extract pfn from
- * Return: pfn value if device entry is valid, -1UL otherwise
- */
-static inline unsigned long
-hmm_device_entry_to_pfn(const struct hmm_range *range, uint64_t pfn)
-{
-	if (pfn == range->values[HMM_PFN_NONE])
-		return -1UL;
-	if (pfn == range->values[HMM_PFN_ERROR])
-		return -1UL;
-	if (pfn == range->values[HMM_PFN_SPECIAL])
-		return -1UL;
-	if (!(pfn & range->flags[HMM_PFN_VALID]))
-		return -1UL;
-	return (pfn >> range->pfn_shift);
-}
-
-/*
- * hmm_device_entry_from_page() - create a valid device entry for a page
- * @range: range use to encode HMM pfn value
- * @page: page for which to create the device entry
- * Return: valid device entry for the page
- */
-static inline uint64_t hmm_device_entry_from_page(const struct hmm_range *range,
-						  struct page *page)
-{
-	return (page_to_pfn(page) << range->pfn_shift) |
-		range->flags[HMM_PFN_VALID];
-}
-
-/*
- * hmm_device_entry_from_pfn() - create a valid device entry value from pfn
- * @range: range use to encode HMM pfn value
- * @pfn: pfn value for which to create the device entry
- * Return: valid device entry for the pfn
- */
-static inline uint64_t hmm_device_entry_from_pfn(const struct hmm_range *range,
-						 unsigned long pfn)
-{
-	return (pfn << range->pfn_shift) |
-		range->flags[HMM_PFN_VALID];
-}
-
 /* Don't fault in missing PTEs, just snapshot the current state. */
 #define HMM_FAULT_SNAPSHOT		(1 << 1)
 
diff --git a/mm/hmm.c b/mm/hmm.c
index b4f662eadb7a7c..687d21c675ee60 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -37,6 +37,18 @@ enum {
 	NEED_WRITE_FAULT = 1 << 1,
 };
 
+/*
+ * hmm_device_entry_from_pfn() - create a valid device entry value from pfn
+ * @range: range use to encode HMM pfn value
+ * @pfn: pfn value for which to create the device entry
+ * Return: valid device entry for the pfn
+ */
+static uint64_t hmm_device_entry_from_pfn(const struct hmm_range *range,
+					  unsigned long pfn)
+{
+	return (pfn << range->pfn_shift) | range->flags[HMM_PFN_VALID];
+}
+
 static int hmm_pfns_fill(unsigned long addr, unsigned long end,
 		struct hmm_range *range, enum hmm_pfn_value_e value)
 {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
