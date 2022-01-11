Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0244748C048
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 09:52:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17913112E46;
	Wed, 12 Jan 2022 08:51:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B205C10E64D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 23:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:content-disposition;
 bh=JGlaIoL3JiUKm69gr69makSNy4JbMH4jchaLUqVIQxs=; b=NM2fx5bsTE7zC6hwXw0Pgx4Buo
 YnfVscCdiluO/KndLwpHCA5V85udbr7MzWgEb1jg38WkJSJ8fL3OyoqyyqL4jqzpO8Pla/mmcgX9W
 VJ7W4VkXNJiQARYHA3wa32V1flSLWj92lPbrgdvrnpN3B7d/ng3u6q7Izch764pw8iqYH7LVLwavR
 9DYYHGpHiwJy0jdCORXgA+Mo7xeugu7AqTrSBASKABIReHfGXjUj6rWyn+3zZe7NXnGeToD2PVPbh
 9LKn87e0XzYUAwW/Ryxeab2v22Vg57Ssl+z8R3d88jdSx39zEXB+uAT7iAZZTtXcR3vfLHVYnyNhp
 88IglYGA==;
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <logang@deltatee.com>)
 id 1n7QA9-009o9j-CV; Tue, 11 Jan 2022 16:02:46 -0700
To: Jason Gunthorpe <jgg@nvidia.com>
References: <YdyKWeU0HTv8m7wD@casper.infradead.org>
 <20220111004126.GJ2328285@nvidia.com> <Yd0IeK5s/E0fuWqn@casper.infradead.org>
 <20220111150142.GL2328285@nvidia.com> <Yd3Nle3YN063ZFVY@casper.infradead.org>
 <20220111202159.GO2328285@nvidia.com> <Yd311C45gpQ3LqaW@casper.infradead.org>
 <ef01ce7d-f1d3-0bbb-38ba-2de4d3f7e31a@deltatee.com>
 <20220111225713.GS2328285@nvidia.com>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <ee523bd5-2818-269b-8b94-89106ad41767@deltatee.com>
Date: Tue, 11 Jan 2022 16:02:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111225713.GS2328285@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: nvdimm@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, linux-mm@kvack.org, netdev@vger.kernel.org,
 linux-block@vger.kernel.org, ming.lei@redhat.com, jhubbard@nvidia.com,
 joao.m.martins@oracle.com, hch@lst.de, linux-kernel@vger.kernel.org,
 willy@infradead.org, jgg@nvidia.com
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A autolearn=ham autolearn_force=no version=3.4.6
Subject: Re: Phyr Starter
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Wed, 12 Jan 2022 08:51:42 +0000
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
Cc: nvdimm@lists.linux.dev, linux-rdma@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 Joao Martins <joao.m.martins@oracle.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022-01-11 3:57 p.m., Jason Gunthorpe wrote:
> On Tue, Jan 11, 2022 at 03:09:13PM -0700, Logan Gunthorpe wrote:
> 
>> Either that, or we need a wrapper that allocates an appropriately
>> sized SGL to pass to any dma_map implementation that doesn't support
>> the new structures.
> 
> This is what I think we should do. If we start with RDMA then we can
> motivate the 4 main server IOMMU drivers to get updated ASAP, then it
> can acceptably start to spread to other users.

I suspect the preferred path forward is for the IOMMU drivers that don't
use dma-iommu should be converted to use it. Then anything we do to
dma-iommu will be applicable to the IOMMU drivers. Better than expecting
them to implement a bunch of new functionality themselves.

Logan
