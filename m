Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BF1247D15
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 05:49:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F6189D56;
	Tue, 18 Aug 2020 03:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B56789D56
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 03:49:32 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f3b4f910000>; Mon, 17 Aug 2020 20:48:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 17 Aug 2020 20:49:31 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 17 Aug 2020 20:49:31 -0700
Received: from [172.20.40.73] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Aug
 2020 03:49:25 +0000
Subject: Re: [RFC] Experimental DMA-BUF Device Heaps
To: Brian Starkey <brian.starkey@arm.com>, Ezequiel Garcia
 <ezequiel@collabora.com>
References: <20200816172246.69146-1-ezequiel@collabora.com>
 <20200817151813.wet5faqg4fzlfbsh@DESKTOP-E1NTVVP.localdomain>
From: James Jones <jajones@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <c2450755-91fd-da72-bf1e-c015ad9d6b25@nvidia.com>
Date: Mon, 17 Aug 2020 20:49:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817151813.wet5faqg4fzlfbsh@DESKTOP-E1NTVVP.localdomain>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1597722513; bh=E3D1QMN/007xv1q7refetsEcNEdV2V0vO5Foh5kczJQ=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=sGibudKky7RmFrNgE9HMFeyxDAZpURIiDhUdJ4j0HCxJY9hnZKwe6mSQ4gxd4I1RG
 5CjrR7taPx/0QPc5GE2DU1/W9h6m8ptdjH0WgZtR7F4VhdIbyO1kg9mzzwp6OLENr3
 y1TN8NF4Z4LUZGawJRVA9eyi3rfidl17g3xYGvsAd7S0DfX9J5IiEc6v577A8eGi0n
 MB9PRnCSif2AqitC+hgd0I5bvfIWK0O807SWiVtW5YMeMUadsbbACOQ14a1lI4CTl2
 tPyjXpjgB7ascMHDVs8YFIIvkMZMoZnSMso70tcuLUjpNlDnqBy/j272BNfBF/CX/k
 0L0TUcivJ4AoQ==
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
Cc: Robert Beckett <bob.beckett@collabora.com>, nd@arm.com,
 Tomasz Figa <tfiga@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Benjamin
 Gaignard <benjamin.gaignard@st.com>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F . Davis" <afd@ti.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, Laura Abbott <labbott@kernel.org>,
 Daniel Stone <daniels@collabora.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/17/20 8:18 AM, Brian Starkey wrote:
> Hi Ezequiel,
> 
> On Sun, Aug 16, 2020 at 02:22:46PM -0300, Ezequiel Garcia wrote:
>> This heap is basically a wrapper around DMA-API dma_alloc_attrs,
>> which will allocate memory suitable for the given device.
>>
>> The implementation is mostly a port of the Contiguous Videobuf2
>> memory allocator (see videobuf2/videobuf2-dma-contig.c)
>> over to the DMA-BUF Heap interface.
>>
>> The intention of this allocator is to provide applications
>> with a more system-agnostic API: the only thing the application
>> needs to know is which device to get the buffer for.
>>
>> Whether the buffer is backed by CMA, IOMMU or a DMA Pool
>> is unknown to the application.
>>
>> I'm not really expecting this patch to be correct or even
>> a good idea, but just submitting it to start a discussion on DMA-BUF
>> heap discovery and negotiation.
>>
> 
> My initial reaction is that I thought dmabuf heaps are meant for use
> to allocate buffers for sharing across devices, which doesn't fit very
> well with having per-device heaps.
> 
> For single-device allocations, would using the buffer allocation
> functionality of that device's native API be better in most
> cases? (Some other possibly relevant discussion at [1])
> 
> I can see that this can save some boilerplate for devices that want
> to expose private chunks of memory, but might it also lead to 100
> aliases for the system's generic coherent memory pool?
> 
> I wonder if a set of helpers to allow devices to expose whatever they
> want with minimal effort would be better.

I'm rather interested on where this goes, as I was toying with using 
some sort of heap ID as a basis for a "device-local" constraint in the 
memory constraints proposals Simon and I will be discussing at XDC this 
year.  It would be rather elegant if there was one type of heap ID used 
universally throughout the kernel that could provide a unique handle for 
the shared system memory heap(s), as well as accelerator-local heaps on 
fancy NICs, GPUs, NN accelerators, capture devices, etc. so apps could 
negotiate a location among themselves.  This patch seems to be a step 
towards that in a way, but I agree it would be counterproductive if a 
bunch of devices that were using the same underlying system memory ended 
up each getting their own heap ID just because they used some SW 
framework that worked that way.

Would appreciate it if you could send along a pointer to your BoF if it 
happens!

Thanks,
-James

> Cheers,
> -Brian
> 
> 1. https://lore.kernel.org/dri-devel/57062477-30e7-a3de-6723-a50d03a402c4@kapsi.fi/
> 
>> Given Plumbers is just a couple weeks from now, I've submitted
>> a BoF proposal to discuss this, as perhaps it would make
>> sense to discuss this live?
>>
>> Not-signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
