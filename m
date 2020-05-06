Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA221C780F
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 19:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F946E8B7;
	Wed,  6 May 2020 17:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B29A36E8B7
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 17:35:43 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 046HZVkw103808;
 Wed, 6 May 2020 12:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1588786531;
 bh=EaGNiVHRrlAZYXXBERxfZT7BGumy9fgH/Sfqh9FjJlc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=EF5rBrg4HaRDOlGi6AEnqAdzew8tmyq3c6VEkbyVuQhCVWPq7GTRT3wdAFQhU0o/1
 l4gbAAe7XGImtfHrJbviASZQITOZ+Q9R6V/BfcOeUgmpsfVobtkx5RLpbf2Dq7GDPG
 yIwsqKJOE0XeGpHrG4sTB4N4OCyHsCE1Tgq95ii4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 046HZVFP049979
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 6 May 2020 12:35:31 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 May
 2020 12:35:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 May 2020 12:35:31 -0500
Received: from [10.250.38.163] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 046HZUNM126702;
 Wed, 6 May 2020 12:35:30 -0500
Subject: Re: [RFC][PATCH 1/4] devicetree: bindings: Add linux, cma-heap tag for
 reserved memory
To: John Stultz <john.stultz@linaro.org>
References: <20200501073949.120396-1-john.stultz@linaro.org>
 <20200501073949.120396-2-john.stultz@linaro.org>
 <20200501104216.4f226c2a7bzval5o@DESKTOP-E1NTVVP.localdomain>
 <CALAqxLVScV1j-zxw=cwpE0+eDoaubchXx6SJgu=1Zvh8HnE-Tg@mail.gmail.com>
 <20200504085007.5yrjhknkg6ugbqwk@DESKTOP-E1NTVVP.localdomain>
 <1bddb721-d4d9-f113-bacc-0a0ca2d57753@ti.com>
 <CALAqxLWnEj-c3CYGC6p23cwMqce-MV6pJOzGbp+ptWFB0NQoog@mail.gmail.com>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <1b82e66e-01b9-5c4d-9777-1aa34bf1b07e@ti.com>
Date: Wed, 6 May 2020 13:35:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLWnEj-c3CYGC6p23cwMqce-MV6pJOzGbp+ptWFB0NQoog@mail.gmail.com>
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
 Alistair Strachan <astrachan@google.com>, Sandeep Patil <sspatil@google.com>,
 Robin Murphy <robin.murphy@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
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

On 5/6/20 12:30 PM, John Stultz wrote:
> On Wed, May 6, 2020 at 9:04 AM Andrew F. Davis <afd@ti.com> wrote:
>> On 5/4/20 4:50 AM, Brian Starkey wrote:
>>> On Fri, May 01, 2020 at 11:40:16AM -0700, John Stultz wrote:
>>>> So the name we expose is the CMA name itself. So with dt it will be
>>>> the name of the reserved memory node that the flag property is added
>>>> to.
>>>>
>>>
>>> Yeah I'm just wondering if that's "stable" so we can say "the heap
>>> will use the node name", or if saying that would cause us a headache
>>> in the future.
>>
>>
>> The issue is going to be this causes the node name in DT to become a
>> kind of ABI. Right now until we have some userspace lib that enumerates
>> the heaps in a stable way programs will hard-code the full heap name,
>> which right now would look like:
>>
>> char *heap = "/dev/dma_heap/dma_heap_mem@89000000";
>>
> 
> If that's what the device chose to export.
> 


Well no "device" exported it, we did mostly automatically using only DT
information. When making a DT I don't want to be thinking about how
names will break userspace, for instance if node naming guidance is
updated do apps suddenly stop working? That worries me a bit.


>> Yuk.. we might want to look into exporting heap properties to make them
>> searchable based on something other than name here soon. Or this will be
>> a mess to cleanup in the future.
> 
> Eh. I don't see this as such an issue. On different systems we have
> different device nodes. Some boards have more or fewer NICs, or
> various partitions, etc. There has to be some device specific userland
> config that determines which partitions are mounted where (this is my
> "gralloc is fstab" thesis :)
> 


Oh I agree here, net interface names and /dev/<hd> names have a history
of changing, but those did both break a lot of apps. It could be argued
they were abusing the API by making assumptions about the names, but we
still have old scripts floating assuming "eth0" is going to just work..

So the sooner we get this fstab scheme in place and in practice, the
fewer apps in the wild will hard-code names.


> I think with the heaps, qualities other than name are going to be
> poorly specified or unenumerable, so any generic query interface is
> going to fall down there (and be awful to use).
> 


Sure, so this "fstab" style config will have to be a mapping of names
(which we will have to make static per heap in kernel) to properties
that interest the current users of a system. For now I can only think of
cached/uncached, contiguous/sg, and secure/mappable. Then maybe a list
of devices that can consume buffers of that variety, should allow for
simple constraint matching. I'll need to think on this a bit more as the
use-cases show up..

Andrew


> thanks
> -john
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
