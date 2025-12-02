Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C2DC9B20F
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 11:26:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09CD310E601;
	Tue,  2 Dec 2025 10:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bFOm8/v6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF0310E5F4;
 Tue,  2 Dec 2025 10:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764671174;
 bh=e7TL2i9NphOc/kce1J1qGMHgFQPOLfYmW0DnWE9bCNo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bFOm8/v6aGx1M8z9Zpyb9UCv3oCX5iuw35PHBfvlLzi1JdAc/hfcxthIarnTbNCmy
 2I0VCRherX6/R1pZ7//qNSValT98ap82x/aN8rBQadvr/Sqp/fCX03wW2OP0k00VlR
 BNYWfg0jR7SWsb5PuFzr2aPjdx25oUmHUZCb9wL3kl6gaWVsd3sl9q22u8MS9gbY1m
 biItp7+M0CcXY89Skv35SgVG3yNdN3Twq6IUnzBBPyLTnrsqNNs/tC8WG0dtzdLHmY
 zQlHEjlBD/b2u6jACtPmAUphkSD0T77qcK4KuQxC8PeqtJQrzbo8d+J2XIwpuAkP8C
 N60bj6/UJdbjQ==
Received: from [IPV6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa] (unknown
 [IPv6:2a01:e0a:5e3:6100:7aed:fe0e:8590:cbaa])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: loicmolinari)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 91D2717E114C;
 Tue,  2 Dec 2025 11:26:13 +0100 (CET)
Message-ID: <5554e135-8184-4aab-9b25-19f9e8cf1d7c@collabora.com>
Date: Tue, 2 Dec 2025 11:26:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 10/10] Documentation/gpu/drm-mm: Add THP paragraph to
 GEM mapping section
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
 Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?Q?Miko=C5=82aj_Wasiak?=
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>,
 Nitin Gote <nitin.r.gote@intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Christopher Healy <healych@amazon.com>, Matthew Wilcox
 <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
References: <20251128185252.3092-1-loic.molinari@collabora.com>
 <20251128185252.3092-11-loic.molinari@collabora.com>
 <f1a5e5a9-2193-4a47-9fce-c51b223985aa@igalia.com>
Content-Language: fr
From: =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>
Organization: Collabora Ltd
In-Reply-To: <f1a5e5a9-2193-4a47-9fce-c51b223985aa@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Maíra,

On 01/12/2025 14:27, Maíra Canal wrote:
> Hi Loïc,
> 
> On 28/11/25 15:52, Loïc Molinari wrote:
>> Add a paragraph to the GEM objects mapping section explaining how
>> transparent huge pages are handled by GEM.
>>
>> v4:
>> - fix wording after huge_pages handler removal
>>
>> v6:
>> - fix wording after map_pages handler removal
>>
>> Signed-off-by: Loïc Molinari <loic.molinari@collabora.com>
>> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>> ---
>>   Documentation/gpu/drm-mm.rst | 22 +++++++++++++++++-----
>>   1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
>> index d55751cad67c..d69eab0b4093 100644
>> --- a/Documentation/gpu/drm-mm.rst
>> +++ b/Documentation/gpu/drm-mm.rst
>> @@ -290,15 +290,27 @@ The open and close operations must update the 
>> GEM object reference
>>   count. Drivers can use the drm_gem_vm_open() and drm_gem_vm_close() 
>> helper
>>   functions directly as open and close handlers.
>> -The fault operation handler is responsible for mapping individual pages
>> -to userspace when a page fault occurs. Depending on the memory
>> -allocation scheme, drivers can allocate pages at fault time, or can
>> -decide to allocate memory for the GEM object at the time the object is
>> -created.
>> +The fault operation handler is responsible for mapping pages to
>> +userspace when a page fault occurs. Depending on the memory allocation
>> +scheme, drivers can allocate pages at fault time, or can decide to
>> +allocate memory for the GEM object at the time the object is created.
>>   Drivers that want to map the GEM object upfront instead of handling 
>> page
>>   faults can implement their own mmap file operation handler.
>> +In order to reduce page table overhead, if the internal shmem mountpoint
>> +"shm_mnt" is configured to use transparent huge pages (for builds with
>> +CONFIG_TRANSPARENT_HUGEPAGE enabled) and if the shmem backing store
>> +managed to allocate a huge page for a faulty address, the fault handler
>> +will first attempt to insert that huge page into the VMA before falling
>> +back to individual page insertion. mmap() user address alignment for GEM
>> +objects is handled by providing a custom get_unmapped_area file
>> +operation which forwards to the shmem backing store. For most drivers,
>> +which don't create a huge mountpoint by default or through a module
>> +parameter, transparent huge pages can be enabled by either setting the
>> +"transparent_hugepage_shmem" kernel parameter or the
>> +"/sys/kernel/mm/transparent_hugepage/shmem_enabled" sysfs knob.
> 
> It would be nice to have a paragraph about the use of the huge tmpfs
> mountpoint helpers (maybe in the "GEM Objects Creation" section?).

Thanks for the review.

I've added a few words about the drm_gem_huge_huge_mnt() helper into the 
"GEM Objects Creation" section in patch series v11. I've also just 
realized that I added your R-b to that commit without you asking for 
it... sorry for that. I'll remove it in v12 unless you explicitly ask to 
let it there.

Regards,
Loïc

> Best Regards,
> - Maíra
> 
>> +
>>   For platforms without MMU the GEM core provides a helper method
>>   drm_gem_dma_get_unmapped_area(). The mmap() routines will call this 
>> to get a
>>   proposed address for the mapping.
> 

