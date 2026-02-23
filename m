Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOCXGnWdnGnCJgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 19:33:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF3A17B922
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 19:33:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FED10E1AA;
	Mon, 23 Feb 2026 18:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="JA6jVh9O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6659A10E1AA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 18:33:21 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-65bfe9c585cso7552899a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 10:33:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771871600; cv=none;
 d=google.com; s=arc-20240605;
 b=Fzv8Z5vQjont/v3TuAljqb+uzoDpFLiVxarozFdo5RbRYISa2VnzDGiRLqHsnF0Wwm
 Qlt3NiL9dBdiEEey+dvNVd2WYYtW6/Zn1cRCNvO5mj45wOyGmU+InDG8eoN12lJtIYh8
 PDgnG5U289Sueh4OUJ9FdTluXyE82I9r+SJbGIPFPNjXhtIQjfKvaZi09hYkk8GXyziK
 RWPLwMJhz2UHyQA4kGiUsH8EFZ3mMk7YDIzVUJCNs5z9Tvoug+C1Drugla3F58UzYVia
 DEL16RyxCMY83duAXwwGORr1MVSyaaFe8plpiLi06J1YveFLgUH4DyYBarlRClUpYKbA
 XSaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=SdXTYyc+CZiWHvNxIlGUblHb7sAtxXqArT15DTb3rus=;
 fh=mfhnUmUQeqTNzS9rwMuBAPxcROppY5k8sgmAq7oo4JA=;
 b=NoDHPMh83t6nl82Jw+juqqTb+eFCHw0rrvnRlSwcEHjJopwWSlmddMegsN8WQFWEiH
 f12kKKqxZq/ld24rd+Ga72RS94ka331nEqWMILBsXOnHTrvkN5ibziOdLzZKmfZnDMEc
 Nm1esU7TvywUlcgvM8QEXg38nOCV7uvfyDlfRmH6PziXrTfjUZIuRYtpyTXgXgAIJvm+
 HCAPMTw80J7k1NTjG46ECgn/cPxBCMFM0eIRrCw9id9pWvgcTbJvdPpxI5PLrg6eP7rk
 wuH9Lm8IUxfRhKehPgdggUiMBJbISPAdLhZidOhFkU+3UkJQ2qtAi1Iql3iHYun7Xyc9
 ZC0g==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771871600; x=1772476400;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SdXTYyc+CZiWHvNxIlGUblHb7sAtxXqArT15DTb3rus=;
 b=JA6jVh9OpWNf3QnBz2WrIVsovv7oq3715Y5lFFBURKHkRhIaTtJZaNkOO6QTFTGcYa
 i0RXaoI6hZRvPufuWCxKbw1fJfrCbMKnsql0zlmTd/QJ4iXmsfh35wfbcC7U5V8YcXRS
 IhDpwYursxggWZ12fqwJTcXI49ZjVpHpfJ59wRXiHRhCR4/VnTRqL07pu/JLc9NqFOAE
 ETmiBSeSD5ckO9T0vOnwaQnfkZEn9Fsr7ozyNysldGJ9EcHwnwIQjaPFgrNB/Ow1dLxo
 bzIgCeqrBbaL9hi+UrGquhjDDCpn+8uOw/MspI/iv4hi/rRWJ7ISwSEXN4NdyBBwNaEF
 eNjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771871600; x=1772476400;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SdXTYyc+CZiWHvNxIlGUblHb7sAtxXqArT15DTb3rus=;
 b=rg+XjuYXJV1hQZb8UJHzIR4B5GrISQG+dPvCRqdECQkhR6LyS1oD8Ewu6WdLtIVwnt
 R1hz8Muc0UgiIrpCB2Zj1a0jec4Mpb3BKQsRYPrD6asRUSEIzRbPIa7XkFVFJ0JPL0mw
 okiYpVd7HJUT81kOZiyRFFXHm2UB9ayItYbAF24twnMKR3qwBQE0W6GObh9JlbQzCYgV
 eFE3Zkm8Q+u0aSjugVAcwkbiqy6dk7l0Beue2HX4CskpHhJXqndJJ4TzOscnjQIbde1+
 R0KDG61mIYNJNTUXRf2a7daUPLVmqSBdmGXiqdmBEkoMRIUADE1LpnbnRZtVrC0uR1Uq
 McIg==
X-Gm-Message-State: AOJu0YzAEe/XVHwWetnJa3a6xBQAYl3Nta00k7HgQQ9RE4TtDWnjT0TV
 fbDVh4eRrjHdXITNCNZnMRy1sHjIHtijU6+LYA/zmk/7HTHFDHH1fWZgH2CB9s0zEv63xH8bAfM
 Lb6QVs5MtKbtdLhlFzG2eS+YqU6iyUFucLWi3u+c=
X-Gm-Gg: AZuq6aJDQz7NKDX661Ca/I8r4CD0tR0KAHDJ6CjbNLEtmSUKKXAEz54IVlFFmtYMZJ1
 DRJXGtjK+ltqggDXq+tRj5Xag0a1bxLNv/R172lcG2H8q2afcRJ1P70TlCEFkqtfeTTPrsJef9r
 aCeWnh2o1QEYrpxplCX1DHeWZXs/rmboWLbp7jHygKwog+ANshNtNOpeJnFjlA7sxhG79+eXRlH
 tqeg84/86BUdTEqCPO80TVSB7n9mjxd3Zngw2mMHPK3KPgBoF0/OfNILX1MnlQTVR7nGTA3K3z6
 Fb9iKtPpmFZKEXK5ZVYoEI3rm1RmvN2tADcA
X-Received: by 2002:a17:907:9452:b0:b88:713e:78a5 with SMTP id
 a640c23a62f3a-b9081aeedf7mr579641266b.28.1771871599312; Mon, 23 Feb 2026
 10:33:19 -0800 (PST)
MIME-Version: 1.0
References: <20260223095136.225277-1-jiri@resnulli.us>
 <20260223095136.225277-3-jiri@resnulli.us>
In-Reply-To: <20260223095136.225277-3-jiri@resnulli.us>
From: John Stultz <jstultz@google.com>
Date: Mon, 23 Feb 2026 10:33:07 -0800
X-Gm-Features: AaiRm51mY0mKY0_1_wq03WmYtA7Qg-aNpUveVzAZTLNHpqLqVMbVU7X_E2imwkI
Message-ID: <CANDhNCp94KG06P_7ivMTNA27qEM9g8ox-h3b_tZ=v6e-25xJ3g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dma-buf: heaps: system: add system_cc_decrypted
 heap for explicitly decrypted memory
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, tjmercier@google.com, 
 christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
 jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
 catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
 steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
 ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
 linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:jiri@resnulli.us,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:jgg@ziepe.ca,m:leon@kernel.org,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jstultz@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jstultz@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,resnulli.us:email,nvidia.com:email]
X-Rspamd-Queue-Id: BDF3A17B922
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 1:51=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote=
:
>
> From: Jiri Pirko <jiri@nvidia.com>
>
> Add a new "system_cc_decrypted" dma-buf heap to allow userspace to
> allocate decrypted (shared) memory for confidential computing (CoCo)
> VMs.
>
> On CoCo VMs, guest memory is encrypted by default. The hardware uses an
> encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
> Intel TDX) to control whether a given memory access is encrypted or
> decrypted. The kernel's direct map is set up with encryption enabled,
> so pages returned by alloc_pages() are encrypted in the direct map
> by default. To make this memory usable for devices that do not support
> DMA to encrypted memory (no TDISP support), it has to be explicitly
> decrypted. A couple of things are needed to properly handle
> decrypted memory for the dma-buf use case:
>
> - set_memory_decrypted() on the direct map after allocation:
>   Besides clearing the encryption bit in the direct map PTEs, this
>   also notifies the hypervisor about the page state change. On free,
>   the inverse set_memory_encrypted() must be called before returning
>   pages to the allocator. If re-encryption fails, pages
>   are intentionally leaked to prevent decrypted memory from being
>   reused as private.
>
> - pgprot_decrypted() for userspace and kernel virtual mappings:
>   Any new mapping of the decrypted pages, be it to userspace via
>   mmap or to kernel vmalloc space via vmap, creates PTEs independent
>   of the direct map. These must also have the encryption bit cleared,
>   otherwise accesses through them would see encrypted (garbage) data.
>
> - DMA_ATTR_CC_DECRYPTED for DMA mapping:
>   Since the pages are already decrypted, the DMA API needs to be
>   informed via DMA_ATTR_CC_DECRYPTED so it can map them correctly
>   as unencrypted for device access.
>
> On non-CoCo VMs, the system_cc_decrypted heap is not registered
> to prevent misuse by userspace that does not understand
> the security implications of explicitly decrypted memory.
>
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>

Thanks for reworking this! I've not reviewed it super closely, but I
believe it resolves my objection on your first version.

Few nits/questions below.

> @@ -296,6 +345,14 @@ static void system_heap_dma_buf_release(struct dma_b=
uf *dmabuf)
>         for_each_sgtable_sg(table, sg, i) {
>                 struct page *page =3D sg_page(sg);
>
> +               /*
> +                * Intentionally leak pages that cannot be re-encrypted
> +                * to prevent decrypted memory from being reused.
> +                */
> +               if (buffer->decrypted &&
> +                   system_heap_set_page_encrypted(page))
> +                       continue;
> +

What are the conditions where this would fail? How much of an edge
case is this? I fret this opens a DoS vector if one is able to
allocate from this heap and then stress the system when doing the
free.

Should there be some global list of leaked decrypted pages such that
the mm subsystem could try again later to recover these?

> diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> index 648328a64b27..d97b668413c1 100644
> --- a/include/linux/dma-heap.h
> +++ b/include/linux/dma-heap.h
> @@ -10,6 +10,7 @@
>  #define _DMA_HEAPS_H
>
>  #include <linux/types.h>
> +#include <uapi/linux/dma-heap.h>
>
>  struct dma_heap;
>
> diff --git a/include/uapi/linux/dma-heap.h b/include/uapi/linux/dma-heap.=
h
> index a4cf716a49fa..ab95bb355ed5 100644
> --- a/include/uapi/linux/dma-heap.h
> +++ b/include/uapi/linux/dma-heap.h
> @@ -18,8 +18,7 @@
>  /* Valid FD_FLAGS are O_CLOEXEC, O_RDONLY, O_WRONLY, O_RDWR */
>  #define DMA_HEAP_VALID_FD_FLAGS (O_CLOEXEC | O_ACCMODE)
>
> -/* Currently no heap flags */
> -#define DMA_HEAP_VALID_HEAP_FLAGS (0ULL)
> +#define DMA_HEAP_VALID_HEAP_FLAGS (0)
>
>  /**
>   * struct dma_heap_allocation_data - metadata passed from userspace for

Are these header changes still necessary?

thanks
-john
