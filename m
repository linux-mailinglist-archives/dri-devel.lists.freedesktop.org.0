Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909AEB122B5
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 19:10:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F007110E390;
	Fri, 25 Jul 2025 17:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=deltatee.com header.i=@deltatee.com header.b="QwPbWJ/O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2337 seconds by postgrey-1.36 at gabe;
 Fri, 25 Jul 2025 17:10:03 UTC
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B242A10E390
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 17:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:From:References:Cc:To:
 MIME-Version:Date:Message-ID:content-disposition;
 bh=f47Ky90dFPkL1Ya+qWKSgUqpFHN5ODLjpNudWVSb5u8=; b=QwPbWJ/OWzQX8Q226ojxfza0WS
 hTwTo6/vPF246VLRi+47uocSVLkOn0eD6rbMZRZD07tT3AUM6z95tZTUeAEDALmOKRCr9SwWCtSWo
 Vl40IAQDTTCjPykxMQJzgZjUrWmcuoWHdCN8wv2e2ot8dxaFvJW7K4bmnXuC/9eazXKfZuuVimmSg
 tGZI0VE8yThg0M2uXVwtlJ46NYkhpaiehvoG18/F/CMQ0pf9gs/S0p4bVOocrwE1PtjveEbBVRg1u
 Kb4oYtEyAdpejHSKoYmOlKpt55+jX9YkR+phKZwkr98AAn+Xl4RiugB4uevi4n7lK1TZ6DnW/l4Ya
 BaSNp5Dg==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <logang@deltatee.com>) id 1ufLJz-006C5W-2Q;
 Fri, 25 Jul 2025 10:31:00 -0600
Message-ID: <b32ae619-6c4a-46fc-a368-6ad4e245d581@deltatee.com>
Date: Fri, 25 Jul 2025 10:30:46 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Leon Romanovsky <leon@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
References: <cover.1753274085.git.leonro@nvidia.com>
 <82e62eb59afcd39b68ae143573d5ed113a92344e.1753274085.git.leonro@nvidia.com>
 <20250724080313.GA31887@lst.de> <20250724081321.GT402218@unreal>
Content-Language: en-CA
From: Logan Gunthorpe <logang@deltatee.com>
In-Reply-To: <20250724081321.GT402218@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: leon@kernel.org, hch@lst.de, alex.williamson@redhat.com,
 jgg@nvidia.com, akpm@linux-foundation.org, bhelgaas@google.com,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, axboe@kernel.dk, jglisse@redhat.com, joro@8bytes.org,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 m.szyprowski@samsung.com, robin.murphy@arm.com, sumit.semwal@linaro.org,
 vivek.kasireddy@intel.com, will@kernel.org
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=ham autolearn_force=no version=4.0.1
Subject: Re: [PATCH 05/10] PCI/P2PDMA: Export pci_p2pdma_map_type() function
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
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



On 2025-07-24 02:13, Leon Romanovsky wrote:
> On Thu, Jul 24, 2025 at 10:03:13AM +0200, Christoph Hellwig wrote:
>> On Wed, Jul 23, 2025 at 04:00:06PM +0300, Leon Romanovsky wrote:
>>> From: Leon Romanovsky <leonro@nvidia.com>
>>>
>>> Export the pci_p2pdma_map_type() function to allow external modules
>>> and subsystems to determine the appropriate mapping type for P2PDMA
>>> transfers between a provider and target device.
>>
>> External modules have no business doing this.
> 
> VFIO PCI code is built as module. There is no way to access PCI p2p code
> without exporting functions in it.

The solution that would make more sense to me would be for either
dma_iova_try_alloc() or another helper in dma-iommu.c to handle the
P2PDMA case. dma-iommu.c already uses those same interfaces and thus
there would be no need to export the low level helpers from the p2pdma code.

Logan
