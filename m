Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4EE249575
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 08:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408D46E1B4;
	Wed, 19 Aug 2020 06:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 588 seconds by postgrey-1.36 at gabe;
 Wed, 19 Aug 2020 04:03:51 UTC
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996E589B3B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 04:03:51 +0000 (UTC)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20200819035400epoutp0237f5b68c76402c43f6da2a4daf219a33~sjwoACgsn0411204112epoutp02F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 03:54:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20200819035400epoutp0237f5b68c76402c43f6da2a4daf219a33~sjwoACgsn0411204112epoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1597809240;
 bh=VWZYIWvbo8FyzZmp6q7gNu2nQM3g4xxG5QZg6Oj32mY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eUQjoyaYbTTQpAXXOypKuXelLTzWm6Con9wwkCSantlcNdldKoRhEsZVhAtIg2x3t
 ToDuh2/k5zMJw2NtocHzN4IRUr7qxrhzKPxd42ElqiOTittSNaFGJLciYUWZEHEJ0L
 mFkmXXTLS35YpBz/FRzQYAfbm34er+ie8a9ISVKQ=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTP id
 20200819035359epcas2p1d07fa5ac07155cbde39ec139311ac897~sjwnFdAJ02461124611epcas2p1X;
 Wed, 19 Aug 2020 03:53:59 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.40.183]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4BWYmj4q7PzMqYlt; Wed, 19 Aug
 2020 03:53:57 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
 epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
 AC.5E.27013.552AC3F5; Wed, 19 Aug 2020 12:53:57 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
 20200819035356epcas2p4bf6e672c27e14d4e0f728aae9a5f43fb~sjwjf74Jn2934829348epcas2p40;
 Wed, 19 Aug 2020 03:53:56 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200819035356epsmtrp2add31132847dd79bcb8bff3a29704536~sjwje1X0n0355803558epsmtrp2E;
 Wed, 19 Aug 2020 03:53:56 +0000 (GMT)
X-AuditID: b6c32a48-d35ff70000006985-2b-5f3ca2551cd4
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 71.85.08303.352AC3F5; Wed, 19 Aug 2020 12:53:55 +0900 (KST)
Received: from KEI (unknown [12.36.155.227]) by epsmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20200819035355epsmtip2ae445ec6236a53184e2ae990b7dada13~sjwjNPcQf0530505305epsmtip2C;
 Wed, 19 Aug 2020 03:53:55 +0000 (GMT)
Date: Wed, 19 Aug 2020 12:46:26 +0900
From: Cho KyongHo <pullip.cho@samsung.com>
To: Brian Starkey <brian.starkey@arm.com>
Subject: Re: [PATCH 0/3] Chunk Heap Support on DMA-HEAP
Message-ID: <20200819034626.GB70898@KEI>
MIME-Version: 1.0
In-Reply-To: <20200818105557.svky5c7gdvk6khzu@DESKTOP-E1NTVVP.localdomain>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxTZxTH8/S29xZm5VKhPgMyuztnhI2X8vqIMM2m5kYdAcn2gei6rr0D
 Yim15U2zBNiGIBW0wBhiXTuGY1YWHDJEkG20GASBMMBiYIMBZnMwXkYByQi4lisJ337nn/M/
 5znn5OFjQgPhxU9WpTEalUxJ4a7cRqsv8n+vKkoa9P1/YjTXpSeQoa4WR59aunA00dUH0MxY
 Cw8Z23t5aHBpDkdrF/p46IbuMxw9M01gqHvVH924t8JBi4PjHDTQbMDRxVs/8tBo7XMequy0
 cdC3S3ME6q65iKG81nYCdf1uJ1BpvwlHV3OLwcGddF7/Gk7XflUL6IHiIg5tqk+n680XcLp+
 oYSgC2cGOfRvtns4/aBilUuP6To49Mj6JEbP/fQIp4sbzIDuNrUTdMfjOxzaXv9KLJmgjEpi
 ZApGI2ZU8lRFsioxmjoWL31HGhYeJPGX7EMRlFglS2GiqUPHY/2PJCsdu6DEGTJlukOKlWm1
 VOBbUZrU9DRGnJSqTYumGLVCqZZI1AFaWYo2XZUYIE9NiZQEBQWHOTI/VCa13f4FqKu8s2ar
 h7g5YF5UCFz4kAyFZcN/EIXAlS8kmwC059Ry2WABwEclxTw2sAO4XKF3BPwNi3U6kNWbAayb
 /wZ3lhKS4wCO/8U4mUu+Di8NGzAn46QfvHmtAzi9HqQvzDVInV6MvMaF/+TrNrw7yAhoNRdw
 nSwg98I6/QLGsjvsvPJkQ3chj0Jd/ZONOp7kbjjVlu2sA0mrC5yZKAfsOIeg0cy+B5I74FRH
 A8GyF7TPtuKs4UsAZ42WF0m3HZO1uLMcAiv/zN8ohJFJcGJlEGMHfg22D3NZeTsssK4RrCyA
 BeeFrHM3vPuFjbvZqrj18Qum4fXGzR32ALjUbOBcBrsqt4xWuaUby29CU8sCXulogZHesGad
 z6IvrGsONAGeGYgYtTYlkdEGq0O33roebHwTP7oJXJ2ZD7AADh9YAORjlIegqHW/VChQyM6e
 YzSpUk26ktFaQJjjTnrMy1Oe6vhnqjSpJCw4PDxoXxgKCw9G1E7BbGTfB0IyUZbGnGYYNaPZ
 9HH4Ll45nPKJ8mrNHkLOnXZpe1jW9Xy0aNkWEvf3nu0d6Tq7DjTqa0oOiJTvFtsIS/K/Fl3H
 yOmKKl/tylhb1rapIUN8v72352TpD43TYttL1kVh89HD1JjPKPSJEW07+XZc3rJxlQqpfVBG
 9XI97mYUTRrDVyw9cdLCTDeflEL3p1duGT/q14wYnh72fvnMpZt3GuSLkYKFUyc+X03McyuS
 iVxDGpqWE459nen5ScLHTa+eG1Kcz7Z0Th4ZcF0xG90kB3/dFUNH5N4P9iFjsxd16+sFzzJP
 vV96lpkVVQeeeSht0b8ReiBfbK3Jqiw/IQm8rzg+mTG/F7uu+E60v4+I+VkgV8ZTXG2STOKH
 abSy/wFXMz7nrwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRmVeSWpSXmKPExsWy7bCSvG7wIpt4gycXLCzen5rIbjFn/Ro2
 i6ZDp9gsHp26wGjx9v5uVov5R86xWlz5+p7N4m/nBVaLld3NbBbfFzxitjjzW9di5Z4fTBZf
 rjxksri8aw6bRc+GrawW99b8Z7WYdfIak8Wyr+/ZLc4s72G2aN17hN3i1N3P7BaTLy1gs5jd
 2MfoIO7Reukvm8eaeWsYPS739TJ5LNhU6rFpVSebx6ZPk9g9ut5eYfK4c20Pm8eJGb9ZPO53
 H2fyuP3vMbPH+31X2Tz6tqxi9Diz4Ai7x/Eb25k8Pm+SCxCI4rJJSc3JLEst0rdL4Mp48UGj
 4JFERd/NP2wNjCdFuhg5OCQETCQOv9bvYuTiEBLYwShx6tEl9i5GTqC4lMS87rVMELawxP2W
 I6wQRfcZJTrPX2IFSbAIqEr035rDDGKzCWhJrJ57nBFkqIiApkTjnHiQemaBhSwSV2ctYwOp
 ERYwlzi8qoMFxOYV0JBYP/ETM8TQs4wSs45/YodICEqcnPkErIgZaOiNfy+ZQIYyC0hLLP/H
 ARLmFPCS6N70BGyXqICKxKuD9RMYBWchaZ6FpHkWQvMCRuZVjJKpBcW56bnFhgVGeanlesWJ
 ucWleel6yfm5mxjBiUBLawfjnlUf9A4xMnEwHmKU4GBWEuHt3WsdL8SbklhZlVqUH19UmpNa
 fIhRmoNFSZz366yFcUIC6YklqdmpqQWpRTBZJg5OqQamDvHtZ96YTP+kLjh1fs6bpW2/X+w7
 ZPbir2/3Ma6/P4uv3VRoVNb3eMN5zK/UW9aY224zp8e/h0eEtl4MsilT3ZXz4pjYhj7lEO8X
 Ai8UN3TG6DfwcT2Ka2ixrfz7ZKn7LJPGZr3j8ac0niZPki2/symt5RaL9ZJ5rdWiP+rPXNNf
 vW1u/HcR1XmrOP2awzg4jSMm/7xQ4CjTl8Hd/udSzX055vPLPFZc0NKZPq02/G/fvA/PNdwD
 bJZN1G9Lf8druSD9nRvj7sDzIQ91FTJLN1hc323KX9i3aEtl1yLPiMulImp3ltz5+ummaVxO
 TtREpxTXHzcuf5ny5oitcCjvB2M+qdWR7ytc81jOlxcrsRRnJBpqMRcVJwIAVw1au3MDAAA=
X-CMS-MailID: 20200819035356epcas2p4bf6e672c27e14d4e0f728aae9a5f43fb
X-Msg-Generator: CA
Content-Type: multipart/mixed;
 boundary="----wn.C777VfLFf0j4dI6teQ5O7yZ9hP4.it_WB71vmM7CNsG.7=_322d9_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200818074547epcas2p21e0c2442873d03800c7bc2c3e76405d6
References: <CGME20200818074547epcas2p21e0c2442873d03800c7bc2c3e76405d6@epcas2p2.samsung.com>
 <20200818080415.7531-1-hyesoo.yu@samsung.com>
 <20200818105557.svky5c7gdvk6khzu@DESKTOP-E1NTVVP.localdomain>
X-Mailman-Approved-At: Wed, 19 Aug 2020 06:56:51 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Hyesoo Yu <hyesoo.yu@samsung.com>, labbott@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org, nd@arm.com,
 surenb@google.com, akpm@linux-foundation.org, vbabka@suse.cz,
 linux-kernel@vger.kernel.org, lmark@codeaurora.org, afd@ti.com,
 minchan@kernel.org, joaodias@google.com, iamjoonsoo.kim@lge.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

------wn.C777VfLFf0j4dI6teQ5O7yZ9hP4.it_WB71vmM7CNsG.7=_322d9_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 18, 2020 at 11:55:57AM +0100, Brian Starkey wrote:
> Hi,
> 
> On Tue, Aug 18, 2020 at 05:04:12PM +0900, Hyesoo Yu wrote:
> > These patch series to introduce a new dma heap, chunk heap.
> > That heap is needed for special HW that requires bulk allocation of
> > fixed high order pages. For example, 64MB dma-buf pages are made up
> > to fixed order-4 pages * 1024.
> > 
> > The chunk heap uses alloc_pages_bulk to allocate high order page.
> > https://lore.kernel.org/linux-mm/20200814173131.2803002-1-minchan@kernel.org
> > 
> > The chunk heap is registered by device tree with alignment and memory node
> > of contiguous memory allocator(CMA). Alignment defines chunk page size.
> > For example, alignment 0x1_0000 means chunk page size is 64KB.
> > The phandle to memory node indicates contiguous memory allocator(CMA).
> > If device node doesn't have cma, the registration of chunk heap fails.
> 
> This reminds me of an ion heap developed at Arm several years ago:
> https://protect2.fireeye.com/v1/url?k=aceed8af-f122140a-acef53e0-0cc47a30d446-0980fa451deb2df6&q=1&e=a58a9bb0-a837-4fc5-970e-907089bfe25e&u=https%3A%2F%2Fgit.linaro.org%2Flanding-teams%2Fworking%2Farm%2Fkernel.git%2Ftree%2Fdrivers%2Fstaging%2Fandroid%2Fion%2Fion_compound_page.c
> 
> Some more descriptive text here:
> https://protect2.fireeye.com/v1/url?k=83dc3e8b-de10f22e-83ddb5c4-0cc47a30d446-a406aa201ca7dddc&q=1&e=a58a9bb0-a837-4fc5-970e-907089bfe25e&u=https%3A%2F%2Fgithub.com%2FARM-software%2FCPA
> 
> It maintains a pool of high-order pages with a worker thread to
> attempt compaction and allocation to keep the pool filled, with high
> and low watermarks to trigger freeing/allocating of chunks.
> It implements a shrinker to allow the system to reclaim the pool under
> high memory pressure.
> 
> Is maintaining a pool something you considered? From the
> alloc_pages_bulk thread it sounds like you want to allocate 300M at a
> time, so I expect if you tuned the pool size to match that it could
> work quite well.
> 
> That implementation isn't using a CMA region, but a similar approach
> could definitely be applied.
> 
I have seriously considered CPA in our product but we developed our own
because of the pool in CPA.
The high-order pages are required by some specific users like Netflix
app. Moreover required number of bytes are dramatically increasing
because of high resolution videos and displays in these days.

Gathering lots of free high-order pages in the background during
run-time means reserving that amount of pages from the entier available
system memory. Moreover the gathered pages are soon reclaimed whenever
the system is sufferring from memory pressure (i.e. camera recording,
heavy games). So we had to consider allocating hundreds of megabytes at
at time. Of course we don't allocate all buffers by a single call to
alloc_pages_bulk(). But still a buffer is very large.
A single frame of 8K HDR video needs 95MB (7680*4320*2*1.5). Even a
single frame of HDR 4K video needs 24MB and 4K HDR is now popular in
Netflix, YouTube and Google Play video.

> Thanks,
> -Brian

Thank you!

KyongHo

------wn.C777VfLFf0j4dI6teQ5O7yZ9hP4.it_WB71vmM7CNsG.7=_322d9_
Content-Type: text/plain; charset="utf-8"


------wn.C777VfLFf0j4dI6teQ5O7yZ9hP4.it_WB71vmM7CNsG.7=_322d9_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

------wn.C777VfLFf0j4dI6teQ5O7yZ9hP4.it_WB71vmM7CNsG.7=_322d9_--
