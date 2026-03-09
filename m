Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBsKLdHprmlRKAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:40:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1314D23BDF4
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 16:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3679C10E190;
	Mon,  9 Mar 2026 15:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="TRFeZXpO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com
 [74.125.224.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358E710E190
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 15:39:57 +0000 (UTC)
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-64ca4dfdd88so11484277d50.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Mar 2026 08:39:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773070796; cv=none;
 d=google.com; s=arc-20240605;
 b=W11kG9BWyj6r0OZlZZ3bV66xDU0dHD2S3g+6ZyJ0M68wt1ZTBjBRJPahY8w05OufCQ
 An3/Td52N4pe5FRWzzDF4h2iHomR4WexWSJUFoF1eUiW/xbmDNBiyv8u7eQrsvz8ZeOa
 T1ImDgQNkeV/MXU64QTI2pQqlRKLCuzw4GO+4VaKUy1oX3Iuh0RZnjOhOpD6mhyEM//y
 GK+x6yTAq4sk9+oCeVuPfKLSRS5dfCDCUFLu+Zn6KkIr/iL+3sVI6yXxq4vgc2mmis7m
 HFrwkGCIpU4wBsaTt5mydl463iBy8+/bcEN8XgjtoNom5jshmKOEU0jCijwiVQKJFoWJ
 H67A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=MvLYcYLZmHSPzURtRpTfKGpAse3rZ5uBdKhXxFZ9chA=;
 fh=spU3NA5R2prOwFSagRVPaVUJs+vj8M2Dq2Aff3uoebQ=;
 b=iMlsD3Kk2KbmSL5Jx+NbXES4POuv5+V+s5Pj2Lr64CaVK32S21xVnS+SVmAhJRxodn
 YxK1B5bSyY9gE0FBt2+XyBlCBUPsfJ0ivraXWrJvoT72iXVr7Q5r8zENCCAThYyTznxb
 xN9E5qxHHnr5YD3ntPmsG3sa+FADN/R8pPyKI3+SiyXLom0kSX1AgBnGv/m+7qN/+tbT
 o3MubDvECWTVkBmrqkn97VTTkY/sKdp8Fbhzinb3mo/GzXikXXMkIm8m+UUfMN+OAorN
 oImQIaqqTshVHqRrTLFltYTtdcBXxwWgwo1yLlUJc6NEpLzgGvqKRx25CPHzdBkHd2BN
 jfEg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1773070796; x=1773675596;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MvLYcYLZmHSPzURtRpTfKGpAse3rZ5uBdKhXxFZ9chA=;
 b=TRFeZXpOr/yN65nBDSxPi6MQNAfg6FncFefV7junp3ipW/hrxVuxJTXxAk9ZeTSQwf
 WhAbVw4PDmfs2GznXn4cmQXpzX+xEWgjEpnYaAeeLQp2Lb+b0OA3Of/UuLhQAJLP+0sZ
 zj9F6o09a6z25BZczbUek3eeTQlTpq7+/1f3kAAda/1WS9eybcaTJ6fwT7pc9mBI+gAO
 9p8/mgkozebjr8SGU6D+824/FPLBRkdKyHG8+DcADJHCDcTK7ASz3v34TFdUg7Tk07FT
 TLKTwc+SdfRlZWOKwcrz4KY33z3XTs8aTone5+4lC9tP2hxoLac70HyNoX0HM+TaaiTe
 9BMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773070796; x=1773675596;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=MvLYcYLZmHSPzURtRpTfKGpAse3rZ5uBdKhXxFZ9chA=;
 b=lnZNwQUYF7zDUtDwzdSvzims7jv5OQvwVTCkWSC5vneV6rUn2Btgr+6N9hU2LUgGUL
 twA1GwMbhxl+kP1FBWYQaZu52gNN3Mp/mObKx7r/d7xnqEMJ2/8pXMaOYfC0nHJQN1OB
 cb37c0T7K3jogfgarDrqcvmVoIvMZ3B0piT0UxuxE1839F9aM2gfyS19eQO/r2HGj5ft
 zi5KEHvxErnUs5wG1eN8d+te9CZmfWdXynqlrvH3iKQmdmpV33nE1ebtzRfqvZUaaP0g
 hy4Bp6dRq6f9Fq8zFXNZ3cN2VnXC4oalJgOUbcIhGy7SLMX4UJ9dx3WW0PeQi6BOKJnM
 ZZKA==
X-Gm-Message-State: AOJu0YwwXLPVFwChqlugWA30xQApymrpJ6yq2jTBpdEwMgfgUZ6bU7Gv
 w6X6IIuRuURsra81rTPPKVdN0Or1T4ORv1SxcTCSSo8W/0nlIUWGUnXaE2rs4s/RneKI4jo95i5
 kp+80jcpYWPj4zTrSnVfHokLUu+w8wm+NR9YqYlP/
X-Gm-Gg: ATEYQzyvqVDP5DHaBslsbmf04uFI4GcrHVqlNOkq33u4i9ktVUcwn2P7mFBRe4IixhV
 my8TBUvIO4nGP75M+l29NhmpBO0NKegJNwodEjAsMhZfp9SFykMmFbl+g/O6yKquVUStPTNbDwt
 s8pXUPnIokeNFBwU+D4sreSR8+C2W3PLGrFFqazmqIj+9KiM61hV+XlVm17yohDKI0Utq+HbPmz
 gK7qB3vTsPyirIvFU+t4w/doUxL6wZsM24uq0BPEdOJUzn6kYZ7B0QSxQqM526Ew0eIcNpYwKer
 F3m5Yyyi+fkZ6vHPqYOyk8FWNDnhGLtTXAMpuLX5KG7P11GN
X-Received: by 2002:a05:690e:16cc:b0:64d:29c6:7974 with SMTP id
 956f58d0204a3-64d29c67a27mr3174372d50.11.1773070795335; Mon, 09 Mar 2026
 08:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260305123641.164164-1-jiri@resnulli.us>
 <20260305123641.164164-3-jiri@resnulli.us>
In-Reply-To: <20260305123641.164164-3-jiri@resnulli.us>
From: Peter Gonda <pgonda@google.com>
Date: Mon, 9 Mar 2026 09:39:44 -0600
X-Gm-Features: AaiRm51h3c_DzKOKsC7CokIZvNyOKydjIyhi9bVIzEGXBlmxcqpV-AFuGedzucs
Message-ID: <CAMkAt6o_yZ5T-3TRwymjYQZEq-Q_z=DAA3vc61h81X9sQr_CXA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] dma-buf: heaps: system: add
 system_cc_decrypted heap for explicitly decrypted memory
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
 tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
 robin.murphy@arm.com, jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, 
 ptesarik@suse.com, catalin.marinas@arm.com, aneesh.kumar@kernel.org, 
 suzuki.poulose@arm.com, steven.price@arm.com, thomas.lendacky@amd.com, 
 john.allen@amd.com, ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
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
X-Rspamd-Queue-Id: 1314D23BDF4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:jiri@resnulli.us,m:linaro-mm-sig@lists.linaro.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:jgg@ziepe.ca,m:leon@kernel.org,m:sean.anderson@linux.dev,m:ptesarik@suse.com,m:catalin.marinas@arm.com,m:aneesh.kumar@kernel.org,m:suzuki.poulose@arm.com,m:steven.price@arm.com,m:thomas.lendacky@amd.com,m:john.allen@amd.com,m:ashish.kalra@amd.com,m:suravee.suthikulpanit@amd.com,m:linux-coco@lists.linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[pgonda@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pgonda@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,nvidia.com:email,resnulli.us:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Great feature to have thanks Jiri! A couple naive questions.

On Thu, Mar 5, 2026 at 5:38=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote:
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

So this only works on new mappings? What if there are existing
mappings to the memory that will be converted to shared?

It's also slightly worse than just reading ciphertext. If another
process writes to the memory with the incorrect mapping it could cause
corruption on AMD SEV, or an RMP violation on AMD SEV-SNP. Can we
update the existing mappings?
