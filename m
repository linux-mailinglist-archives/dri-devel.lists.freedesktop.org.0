Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836851C7637
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 18:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E136E8A6;
	Wed,  6 May 2020 16:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1369 seconds by postgrey-1.36 at gabe;
 Wed, 06 May 2020 16:27:17 UTC
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BF66E8A6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 16:27:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 046G4ET5110157;
 Wed, 6 May 2020 11:04:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1588781054;
 bh=jrBEKIuDSFaXhQfGrlKMPFW+Bx5UgahVAfVa73raab4=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=QK1DBcPecEckxuot4abYGboZrEbwYN8Rn9JK6Oeim1zGW9j/AvtOUFyDSgD2I1Bqe
 XveTUdb5sUjHIFiSM3FDtHr3bTgTVe+HCK1HY6um/weszTHox3ptURhZzAW7saxWSl
 PXUrwG8AUQcRPbUDNTUWv4RgJiMXknD77JEEENG0=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 046G4Efl031379
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 6 May 2020 11:04:14 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 May
 2020 11:04:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 May 2020 11:04:13 -0500
Received: from [10.250.38.163] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 046G4CAX086976;
 Wed, 6 May 2020 11:04:12 -0500
Subject: Re: [RFC][PATCH 1/4] devicetree: bindings: Add linux, cma-heap tag for
 reserved memory
To: Brian Starkey <brian.starkey@arm.com>, John Stultz <john.stultz@linaro.org>
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-2-john.stultz@linaro.org>
 <20200501104216.4f226c2a7bzval5o@DESKTOP-E1NTVVP.localdomain>
 <CALAqxLVScV1j-zxw=cwpE0+eDoaubchXx6SJgu=1Zvh8HnE-Tg@mail.gmail.com>
 <20200504085007.5yrjhknkg6ugbqwk@DESKTOP-E1NTVVP.localdomain>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <1bddb721-d4d9-f113-bacc-0a0ca2d57753@ti.com>
Date: Wed, 6 May 2020 12:04:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504085007.5yrjhknkg6ugbqwk@DESKTOP-E1NTVVP.localdomain>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, nd <nd@arm.com>,
 Sandeep Patil <sspatil@google.com>, Robin Murphy <robin.murphy@arm.com>,
 Chenbo Feng <fengc@google.com>, lkml <linux-kernel@vger.kernel.org>,
 Liam Mark <lmark@codeaurora.org>, Alistair Strachan <astrachan@google.com>,
 linux-mm <linux-mm@kvack.org>, Rob Herring <robh+dt@kernel.org>,
 Christoph Hellwig <hch@lst.de>, dri-devel <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Laura Abbott <labbott@redhat.com>,
 Pratik Patel <pratikp@codeaurora.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/4/20 4:50 AM, Brian Starkey wrote:
> On Fri, May 01, 2020 at 11:40:16AM -0700, John Stultz wrote:
>> On Fri, May 1, 2020 at 3:42 AM Brian Starkey <brian.starkey@arm.com> wrote:
>>>
>>> Hi,
>>>
>>> On Fri, May 01, 2020 at 07:39:46AM +0000, John Stultz wrote:
>>>> This patch adds a linux,cma-heap property for CMA reserved memory
>>>> regions, which will be used to allow the region to be exposed via
>>>> the DMA-BUF Heaps interface
>>>>
>>>> Cc: Rob Herring <robh+dt@kernel.org>
>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>> Cc: "Andrew F. Davis" <afd@ti.com>
>>>> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
>>>> Cc: Liam Mark <lmark@codeaurora.org>
>>>> Cc: Pratik Patel <pratikp@codeaurora.org>
>>>> Cc: Laura Abbott <labbott@redhat.com>
>>>> Cc: Brian Starkey <Brian.Starkey@arm.com>
>>>> Cc: Chenbo Feng <fengc@google.com>
>>>> Cc: Alistair Strachan <astrachan@google.com>
>>>> Cc: Sandeep Patil <sspatil@google.com>
>>>> Cc: Hridya Valsaraju <hridya@google.com>
>>>> Cc: Christoph Hellwig <hch@lst.de>
>>>> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> Cc: Robin Murphy <robin.murphy@arm.com>
>>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>>> Cc: devicetree@vger.kernel.org
>>>> Cc: dri-devel@lists.freedesktop.org
>>>> Cc: linux-mm@kvack.org
>>>> Signed-off-by: John Stultz <john.stultz@linaro.org>
>>>> ---
>>>>  .../devicetree/bindings/reserved-memory/reserved-memory.txt    | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>>> index bac4afa3b197..e97b6a4c3bc0 100644
>>>> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>>> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>>> @@ -68,6 +68,9 @@ Linux implementation note:
>>>>  - If a "linux,cma-default" property is present, then Linux will use the
>>>>    region for the default pool of the contiguous memory allocator.
>>>>
>>>> +- If a "linux,cma-heap" property is present, then Linux will expose the
>>>> +  the CMA region via the DMA-BUF Heaps interface.
>>>> +
>>>
>>> Would it be useful or even possible to give some indication of what
>>> the heap will end up being called? I'm afraid I don't remember what if
>>> any conclusions came out of previous discussions on UAPI for heap
>>> enumeration.
>>
>> So the name we expose is the CMA name itself. So with dt it will be
>> the name of the reserved memory node that the flag property is added
>> to.
>>
> 
> Yeah I'm just wondering if that's "stable" so we can say "the heap
> will use the node name", or if saying that would cause us a headache
> in the future.


The issue is going to be this causes the node name in DT to become a
kind of ABI. Right now until we have some userspace lib that enumerates
the heaps in a stable way programs will hard-code the full heap name,
which right now would look like:

char *heap = "/dev/dma_heap/dma_heap_mem@89000000";

Yuk.. we might want to look into exporting heap properties to make them
searchable based on something other than name here soon. Or this will be
a mess to cleanup in the future.

Andrew


> 
>>> I suppose CMA names haven't been relevant to userspace before, but
>>> they perhaps would be with this change.
>>>
>>> Alternatively, leaving it effectively undefined doesn't tie us down,
>>> and something like links in sysfs can be added as a richer API in the
>>> future.
>>
>> Hrm. Mind expanding on what you're thinking here?
> 
> Super hand-wavy, something like:
> 
> /sys/devices/blah/display@2f000000/cma_region is a symlink to
> 	/sys/class/dma_heaps/heap_display
> 
> I think danvet had some thoughts in this vein.
> 
> Cheers,
> -Brian
> 
>>
>> thanks
>> -john
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
