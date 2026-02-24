Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBqwIAtinWksPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:32:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF26C183B7B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:32:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4FF10E4D9;
	Tue, 24 Feb 2026 08:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="nRUCR/be";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A681810E4D9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 08:32:07 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-483a2338616so33279215e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 00:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1771921926; x=1772526726;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/EquV0ZhBp1KMAQWMVyF7t2k8W3NQOG5g8XyiQs2v3s=;
 b=nRUCR/be966W4hEzO3ORrdWJ9yPJ//8t8nyxMHb8pbxz18JibH+uzN6Nunjjjwg1KX
 6oNIZumFqvL9RwIArGfqr+8yy4HyER6wXGl8yLKgwkkXe8DDnIeMKSvampQsR8XrSpgN
 872W6zJ+f44vwQeJyUUj4L1MC1tnDpunA5bbqHg7uxXay3Lwbhjp7+uWVLpbYwGYEsxW
 bljtyoQzOhqlGBfAzHsjQ+FOH87ZNRiNaHgGfczwPck6hkS4YGgzwRFro2vtdZ88tE+E
 kPlzXE4YRfuLn1sXzL35quEKjVdeS+k35mbNb1/gK1zyooRPN8AMPZtGnw67u4AK5tFH
 RIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771921926; x=1772526726;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/EquV0ZhBp1KMAQWMVyF7t2k8W3NQOG5g8XyiQs2v3s=;
 b=kcCWeIsWDMVEllIB6vYF/GB4ItN2TUYr1kEr7N3pQemOjx7vjTOMphqP3M740QEzpo
 3teDmBAYqVbKkRVpSDBLnjNfiRMrn1KxEtoT8RiPquU1Q/j2wIgp0JwieXXw7ppVVSrP
 66N5YPimNVy4G2nuxHpuJEE7zI4JafF8lKaYBvjRcgtL2K8sOqT6BEX6gSh4RjzzghWn
 vA5oqHOa8JyxLQgujfw+qWABUH7GjMdxB8clLPBI0XW6EEZDyBk9IQlvI56CV/9ZTc4c
 7IdCI2cFos2XnZY7kGY2Gg/Z742tU0JohU9unpSUmLRb4sPu6UmfF4+bMdWUUmO/TR6l
 Lm1w==
X-Gm-Message-State: AOJu0Yz2WFJRQxzUk9uouzU/oFz8Fgf22hwr3Y/Uq9+7BVdkFKAEtjSG
 Rb2gWKtAlqhInqGDbkEhTKn71yVlXjiFshJrzMbOn6RspUP2efo9ZyNX3aAs6DuvXKc=
X-Gm-Gg: AZuq6aJp5+2N8mYzEVBjZU0ckvKkOfxI9eNJaXkwDcSm5lycB1PzZon2Wu7bhC1XWkd
 1A6XCjM+cciDfFWLApxoLPOkbfSrqEXQcl8KbGjs5fddmleGv749E/+TeN4NU8fGY1MG5Q2o4ix
 D2bWqpJFegbpskAeXWxhiJHbfBC0cmlz5lAoQym+1J7TUhWBGixJbhO+wuj6keosw5Fg/kahF0e
 fHqVggnp/nZj0dwTjVKQnzzWUULgdxxaR94QK18/jHovnjkVMOiWCsFNuhSqx9zMpbZWvVJ3/t/
 ee7gRER7T379AU5onLqdDY9ON5F2tmQAMB1CFovWxCgEQWuOaucojZ5/JQhiXiOyh9MK/mm5ByS
 q5n7x9KK3ZAusgSk/oUjhkzwe8Eh05QItgStMli8dER1CdVfQJCKKboKGHP6NhNds+b++4rPDru
 jKogzSoVJN87t2WQBL9/CVZOnbbH/69Y0=
X-Received: by 2002:a05:600c:1386:b0:483:887:59b0 with SMTP id
 5b1f17b1804b1-483a960c879mr236583495e9.35.1771921925134; 
 Tue, 24 Feb 2026 00:32:05 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483b820f718sm14689075e9.5.2026.02.24.00.32.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 00:32:04 -0800 (PST)
Date: Tue, 24 Feb 2026 09:32:01 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: John Stultz <jstultz@google.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
 christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com,
 jgg@ziepe.ca, 
 leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
 catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: system: add system_cc_decrypted
 heap for explicitly decrypted memory
Message-ID: <5z6d2etfr24oscoxhk3samf2bbhtcz6hymf65cow76omagsplf@6gdaev2perkk>
References: <20260223095136.225277-1-jiri@resnulli.us>
 <20260223095136.225277-3-jiri@resnulli.us>
 <CANDhNCp94KG06P_7ivMTNA27qEM9g8ox-h3b_tZ=v6e-25xJ3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCp94KG06P_7ivMTNA27qEM9g8ox-h3b_tZ=v6e-25xJ3g@mail.gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:jstultz@google.com,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:jgg@ziepe.ca,m:leon@kernel.org,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,resnulli-us.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: CF26C183B7B
X-Rspamd-Action: no action

Mon, Feb 23, 2026 at 07:33:07PM +0100, jstultz@google.com wrote:
>On Mon, Feb 23, 2026 at 1:51 AM Jiri Pirko <jiri@resnulli.us> wrote:
>>
>> From: Jiri Pirko <jiri@nvidia.com>
>>
>> Add a new "system_cc_decrypted" dma-buf heap to allow userspace to
>> allocate decrypted (shared) memory for confidential computing (CoCo)
>> VMs.
>>
>> On CoCo VMs, guest memory is encrypted by default. The hardware uses an
>> encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
>> Intel TDX) to control whether a given memory access is encrypted or
>> decrypted. The kernel's direct map is set up with encryption enabled,
>> so pages returned by alloc_pages() are encrypted in the direct map
>> by default. To make this memory usable for devices that do not support
>> DMA to encrypted memory (no TDISP support), it has to be explicitly
>> decrypted. A couple of things are needed to properly handle
>> decrypted memory for the dma-buf use case:
>>
>> - set_memory_decrypted() on the direct map after allocation:
>>   Besides clearing the encryption bit in the direct map PTEs, this
>>   also notifies the hypervisor about the page state change. On free,
>>   the inverse set_memory_encrypted() must be called before returning
>>   pages to the allocator. If re-encryption fails, pages
>>   are intentionally leaked to prevent decrypted memory from being
>>   reused as private.
>>
>> - pgprot_decrypted() for userspace and kernel virtual mappings:
>>   Any new mapping of the decrypted pages, be it to userspace via
>>   mmap or to kernel vmalloc space via vmap, creates PTEs independent
>>   of the direct map. These must also have the encryption bit cleared,
>>   otherwise accesses through them would see encrypted (garbage) data.
>>
>> - DMA_ATTR_CC_DECRYPTED for DMA mapping:
>>   Since the pages are already decrypted, the DMA API needs to be
>>   informed via DMA_ATTR_CC_DECRYPTED so it can map them correctly
>>   as unencrypted for device access.
>>
>> On non-CoCo VMs, the system_cc_decrypted heap is not registered
>> to prevent misuse by userspace that does not understand
>> the security implications of explicitly decrypted memory.
>>
>> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
>
>Thanks for reworking this! I've not reviewed it super closely, but I
>believe it resolves my objection on your first version.
>
>Few nits/questions below.
>
>> @@ -296,6 +345,14 @@ static void system_heap_dma_buf_release(struct dma_buf *dmabuf)
>>         for_each_sgtable_sg(table, sg, i) {
>>                 struct page *page = sg_page(sg);
>>
>> +               /*
>> +                * Intentionally leak pages that cannot be re-encrypted
>> +                * to prevent decrypted memory from being reused.
>> +                */
>> +               if (buffer->decrypted &&
>> +                   system_heap_set_page_encrypted(page))
>> +                       continue;
>> +
>
>What are the conditions where this would fail? How much of an edge
>case is this? I fret this opens a DoS vector if one is able to
>allocate from this heap and then stress the system when doing the
>free.

From what I can see, the failure of set_memory_encrypted() is quite
rare. Don't see any real DoS scenario for this. All the failures seems
to be either theoretical (sanity checks, malicious VMM) or concurrent
kexec execution in case of x86/pat.


>
>Should there be some global list of leaked decrypted pages such that
>the mm subsystem could try again later to recover these?

swiotlb does the same non-recovery leakage. I belive is it not worth
implementing this at this time,


>
>> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
>> index 648328a64b27..d97b668413c1 100644
>> --- a/include/linux/dma-heap.h
>> +++ b/include/linux/dma-heap.h
>> @@ -10,6 +10,7 @@
>>  #define _DMA_HEAPS_H
>>
>>  #include <linux/types.h>
>> +#include <uapi/linux/dma-heap.h>
>>
>>  struct dma_heap;
>>
>> diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.h
>> index a4cf716a49fa..ab95bb355ed5 100644
>> --- a/include/uapi/linux/dma-heap.h
>> +++ b/include/uapi/linux/dma-heap.h
>> @@ -18,8 +18,7 @@
>>  /* Valid FD_FLAGS are O_CLOEXEC, O_RDONLY, O_WRONLY, O_RDWR */
>>  #define DMA_HEAP_VALID_FD_FLAGS (O_CLOEXEC | O_ACCMODE)
>>
>> -/* Currently no heap flags */
>> -#define DMA_HEAP_VALID_HEAP_FLAGS (0ULL)
>> +#define DMA_HEAP_VALID_HEAP_FLAGS (0)
>>
>>  /**
>>   * struct dma_heap_allocation_data - metadata passed from userspace for
>
>Are these header changes still necessary?

Oops, leftovers. Will remove.

Thanks!

>
>thanks
>-john
