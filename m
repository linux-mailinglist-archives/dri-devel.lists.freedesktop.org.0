Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4891A75310
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 00:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81CB10E1EF;
	Fri, 28 Mar 2025 23:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3DBA10E1DD
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 21:09:24 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-22548a28d0cso75149775ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 14:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743196164; x=1743800964; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hwl4NdWNLA+WiZCnf70iMDLkFwdpvil0W/uJAOBiirY=;
 b=Z0tAG/Tt3vuE+YM3HItT9e9gsLYLd/QJPteJldyfPKPfzlnxu+Oy0OL+g0q1BMUqYR
 gmWurbYl/sPd/CZND3nekCaxValWchH05E3lWapi+9JMZdt2DwA/qnmtmAoIGG40358r
 7lDmTCbqUJIu3LyqdrBDAonMq8v4VMV55HmrImBhEoYRKqrH72fQdMYmBNgI5FYvYeRw
 WmWf25R15uKXWBMxhGGg+Vx/NA3xMxqgKM9kebh/f0vYI6Otbev0x0brm0m9nTsP1cO0
 6w1QkcT6F/XnxXtFWskFr6hxMNtz7jZkGora4C9YxQ1lsDvOBbHwgYrSe2d+X2qGqHju
 VZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743196164; x=1743800964;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hwl4NdWNLA+WiZCnf70iMDLkFwdpvil0W/uJAOBiirY=;
 b=NcamEM2POGOjfRWdpzKgUEM5WFa1GxK387SLjk9RPrG35CKb4cxWEdiKCiD1s6zN/f
 qR+4Zp42aTFUhZDi7WfYmrh6PJMIlViOCXtM813SK89Y2i7YoMLvpZHyIs2fD8DTr4ac
 nxhtlDonA3PoInyn51ranxl6t9OCRdr3Hf2m0tEjgv2/v1Xrw3OfFwc5Nk9O94/VjPmU
 4t1XTIF/WQfH/n/VgNupzWaPmY+tSlvUiPBlkMJqS1pkh30uvuoMNCJE1ZWG4cYQcDRn
 OujIrL/DDic7ES0dA77Rd6dXRoPAQrMqsY0eswUeZuj+p1nkdONCbg2P4Os1oxC0W8k7
 HGgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUISKM5E/4HQBJr/O9xBtSNEp0oc3goPpdkkv/DKnfoNyhmkZk8kdyrU/0qqfIk5wmupzFjWBEG0XQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZWBx39pnER1EZRuklC7ltT9uXP1Vaa4ZndaX3bKe5tZsnSrjH
 BvpTEBZp7Ko5lAB6jJuBRW/Vly9qBaTe77jcVNBL4pF0ThxiW8Oo
X-Gm-Gg: ASbGncsPeuEQ65G5cGxo4E2YwqSw2ot9FgWQzVcwuisEQzDjJiMvQAyxpuUntJHZG/i
 NHeN6ZRe+UMEKkFmqp7h9WzerVGrJ80SwopPovph/EvWKHaBZvXEpvP8fn6kvNLiZxuuKf09Q91
 VCD55SSz/i260hoH7A2k5GrOVMkql+oBRRVQ3+3HJoIn7lMLrQ+eVXRyig7TSzRMlLtcTp2mRyJ
 eq2aMF4Pv6scMyRVKi0kTsWZfgjjREo8FRTS4/d9oxiehiXNkZMdSC2XFblXrIx3ARjc5XNjF9u
 3cqgxTh9LLN5yLi7wTZQBQvzHC33YIi56Is28c8kDO7sNaqDHg+q+S6DbFiPrmWbd/zakR+23nP
 F
X-Google-Smtp-Source: AGHT+IHd9fQtVFVVgph9WnMxD+yvA2cH9ftmKIA/aV/HJRnRVCXLI90/TItx7A2zuPaJnIRPAtH+Uw==
X-Received: by 2002:a17:903:2ce:b0:220:e5be:29c7 with SMTP id
 d9443c01a7336-2292f9f64fbmr10191425ad.39.1743196164150; 
 Fri, 28 Mar 2025 14:09:24 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2291eee22a2sm23351755ad.81.2025.03.28.14.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 14:09:23 -0700 (PDT)
Date: Fri, 28 Mar 2025 14:09:20 -0700
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Huan Yang <link@vivo.com>
Cc: bingbu.cao@linux.intel.com, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@lst.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 opensource.kernel@vivo.com
Subject: Re: [RFC PATCH 0/6] Deep talk about folio vmap
Message-ID: <Z-cQAIsh3dAhaT6s@fedora>
References: <20250327092922.536-1-link@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327092922.536-1-link@vivo.com>
X-Mailman-Approved-At: Fri, 28 Mar 2025 23:15:34 +0000
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

On Thu, Mar 27, 2025 at 05:28:27PM +0800, Huan Yang wrote:
> Bingbu reported an issue in [1] that udmabuf vmap failed and in [2], we
> discussed the scenario of folio vmap due to the misuse of vmap_pfn
> in udmabuf.
> 
> We reached the conclusion that vmap_pfn prohibits the use of page-based
> PFNs:
> Christoph Hellwig : 'No, vmap_pfn is entirely for memory not backed by
> pages or folios, i.e. PCIe BARs and similar memory.  This must not be
> mixed with proper folio backed memory.'
> 
> But udmabuf still need consider HVO based folio's vmap, and need fix
> vmap issue. This RFC code want to show the two point that I mentioned
> in [2], and more deep talk it:
> 
> Point1. simple copy vmap_pfn code, don't bother common vmap_pfn, use by
> itself and remove pfn_valid check.
> 
> Point2. implement folio array based vmap(vmap_folios), which can given a
> range of each folio(offset, nr_pages), so can suit HVO folio's vmap.
> 
> Patch 1-2 implement point1, and add a test simple set in udmabuf driver.
> Patch 3-5 implement point2, also can test it.
> 
> Kasireddy also show that 'another option is to just limit udmabuf's vmap()
> to only shmem folios'(This I guess folio_test_hugetlb_vmemmap_optimized
> can help.)
> 
> But I prefer point2 to solution this issue, and IMO, folio based vmap still
> need.
> 
> Compare to page based vmap(or pfn based), we need split each large folio
> into single page struct, this need more large array struct and more longer
> iter. If each tail page struct not exist(like HVO), can only use pfn vmap,
> but there are no common api to do this.
> 
> In [2], we talked that udmabuf can use hugetlb as the memory
> provider, and can give a range use. So if HVO used in hugetlb, each folio's
> tail page may freed, so we can't use page based vmap, only can use pfn
> based, which show in point1.
> 
> Further more, Folio based vmap only need record each folio(and offset,
> nr_pages if range need). For 20MB vmap, page based need 5120 pages(40KB),
> 2MB folios only need 10 folio(80Byte).
> 
> Matthew show that Vishal also offered a folio based vmap - vmap_file[3].
> This RFC patch want a range based folio, not only a full folio's map(like
> file's folio), to resolve some problem like HVO's range folio vmap.

Hmmm, I should've been more communicative, sorry about that. V1 was
poorly implemented, and I've had a V2 sitting around that does Exactly
what you want.

I'll send V2 to the mailing list and you can take a look at it;
preferrably you integrate that into this patchset instead (it would
make both the udma and vmalloc code much neater).

> Please give me more suggestion.
> 
> Test case:
> //enable/disable HVO
> 1. echo [1|0] > /proc/sys/vm/hugetlb_optimize_vmemmap
> //prepare HUGETLB
> 2. echo 10 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
> 3. ./udmabuf_vmap
> 4. check output, and dmesg if any warn.
> 
> [1] https://lore.kernel.org/all/9172a601-c360-0d5b-ba1b-33deba430455@linux.intel.com/
> [2] https://lore.kernel.org/lkml/20250312061513.1126496-1-link@vivo.com/
> [3] https://lore.kernel.org/linux-mm/20250131001806.92349-1-vishal.moola@gmail.com/
> 
> Huan Yang (6):
>   udmabuf: try fix udmabuf vmap
>   udmabuf: try udmabuf vmap test
>   mm/vmalloc: try add vmap folios range
>   udmabuf: use vmap_range_folios
>   udmabuf: vmap test suit for pages and pfns compare
>   udmabuf: remove no need code
> 
>  drivers/dma-buf/udmabuf.c | 29 +++++++++-----------
>  include/linux/vmalloc.h   | 57 +++++++++++++++++++++++++++++++++++++++
>  mm/vmalloc.c              | 47 ++++++++++++++++++++++++++++++++
>  3 files changed, 117 insertions(+), 16 deletions(-)
> 
> --
> 2.48.1
> 
