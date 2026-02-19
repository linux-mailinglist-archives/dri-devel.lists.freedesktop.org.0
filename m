Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDJSD8DblmlJpgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 10:45:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 922CF15D7C0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 10:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDE110E1D5;
	Thu, 19 Feb 2026 09:45:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZnpcxBN0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B72810E1D5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771494331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jc3i9FwjGQs8rH6ZGdIFq1/g5A3pmIExt0aTpd8WwbE=;
 b=ZnpcxBN0wUdRY3QMdCC0q6s+om+ROlbYUip9NFcJWTylBfNGwc5CXV9G498wxtiR173X25
 qaxo8mzVLtNW4dDJwmSPkcr5d0r+3xpiKmrGUcrXNlSxudJsvI1E6NwOpRCmuuXYZwpSc3
 pScq4hWdm9TQPMXixqKKITJc8JfY964=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684-oJunuhjpMgKMhEWWR15q0Q-1; Thu, 19 Feb 2026 04:45:29 -0500
X-MC-Unique: oJunuhjpMgKMhEWWR15q0Q-1
X-Mimecast-MFC-AGG-ID: oJunuhjpMgKMhEWWR15q0Q_1771494329
Received: by mail-yx1-f69.google.com with SMTP id
 956f58d0204a3-649d34b88d3so828478d50.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 01:45:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771494329; x=1772099129;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Jc3i9FwjGQs8rH6ZGdIFq1/g5A3pmIExt0aTpd8WwbE=;
 b=bfOFI9Cgn3f9JKWxtpMv6gbHUlEK/3jxfW8bK0Atr0Uwi9EQce3mliGikGQB+W1zMI
 n9lSa8Ve6SA91QkBzasRJLEds/wM4V7l5RkaEVAdNnJLGcUPbFjMdOo3Y7SvtM4o8UMT
 AAViC6nkRedESqiFUCK92ZmjyLgla+PA+U5umb2Uq7vjD+vvik45CDTWdIhaQlE0QjjO
 ajZOsIw4+t8YGVS2KEDql1n7y4iSe2qWCjqHaoAxa+Drg82bnp8OakfS7P+pooCf9HXN
 925DyfuAZAn2PRXIObaDo10Wym2lT8w5B00Xx3bJEVJ3bvyVUh289ZqLQsGrLQW/1G6V
 GHWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyIfPbu2w9v3eVRBJT3EJwwxdQcaVXN7d9hzxru5Fp1ejZK/pWdbpWx3jYbsb0Hbk/xvnQhbcrhBQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO1Cle3QKL8ffdSnZL2Leo5909mIXgBTRcS7adQV9uQUCwjLD+
 oVedxKjKbz/7gZqgCr1pXJEguWsAW64W5lI1YJOviLjMjQxxero3kS6pD4Tx+wl0011Quf4rK9e
 X+miNr1u0o2gz4GmHaGeyUJtxV02wht/iUHYOT5uqQjHVP8HRcWxONpUSD+Si9bBQEVstz89HkJ
 6wMJAarBw2L/2Qh4mIXReFHx9TEDL+hPjuxvNl0k9/JNIR
X-Gm-Gg: AZuq6aLEi/Vts/9X7OpNL1WPQeleNY0Kw/IpEmuPgCsK9xMYUeQ4VKgbECRwbNhgJjI
 sfJwPF7rlUjdYx58DJXfcT0nBdkQsA02+bOm2pN7murMTLSvLVkFB2npwn8XEC4kF1aBxYHLV3K
 EQfFpsZrPJsuKCFhZKdSPjEE/x6e3az1V92qDBRrguA8bgmUz9S1g9q7kl4+gxnraVqHvYT43l6
 w==
X-Received: by 2002:a53:ac83:0:b0:64a:cece:95f0 with SMTP id
 956f58d0204a3-64c21b189b8mr12656983d50.61.1771494329169; 
 Thu, 19 Feb 2026 01:45:29 -0800 (PST)
X-Received: by 2002:a53:ac83:0:b0:64a:cece:95f0 with SMTP id
 956f58d0204a3-64c21b189b8mr12656956d50.61.1771494328829; Thu, 19 Feb 2026
 01:45:28 -0800 (PST)
MIME-Version: 1.0
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
In-Reply-To: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 19 Feb 2026 10:45:17 +0100
X-Gm-Features: AaiRm51_qfw3XQOH44zsawVMk4430XcLLbmTSpOFr53O7yUQLt26G4MawVh9oqo
Message-ID: <CADSE00+6Jnv_R69nrWdakX2StNK058ksxva48z=ZnwT=Zr3UOQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
To: Eric Chanudet <echanude@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@redhat.com>,
 linux-mm@kvack.org, Maxime Ripard <mripard@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LcNfsqb-3iUuq6vaD9kG91c8KpLbiRagS4LctsVNugM_1771494329
X-Mimecast-Originator: redhat.com
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:echanude@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:mripard@redhat.com,m:linux-mm@kvack.org,m:mripard@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[aesteve@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 922CF15D7C0
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 6:15=E2=80=AFPM Eric Chanudet <echanude@redhat.com>=
 wrote:
>
> An earlier series[1] from Maxime introduced dmem to the cma allocator in
> an attempt to use it generally for dma-buf. Restart from there and apply
> the charge in the narrower context of the CMA dma-buf heap instead.
>
> In line with introducing cgroup to the system heap[2], this behavior is
> enabled based on dma_heap.mem_accounting, disabled by default.
>
> dmem is chosen for CMA heaps as it allows limits to be set for each
> region backing each heap. The charge is only put in the dma-buf heap for
> now as it guaranties it can be accounted against a userspace process
> that requested the allocation.
>
> [1] https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@k=
ernel.org/
> [2] https://lore.kernel.org/all/20260116-dmabuf-heap-system-memcg-v3-0-ec=
c6b62cc446@redhat.com/
>
> Signed-off-by: Eric Chanudet <echanude@redhat.com>

Tested-by: Albert Esteve <aesteve@redhat.com>

I tested the series with a Fedora VM, setting the global user.slice
dmem.max value and then trying to allocate buffers of different sizes
with DMA_HEAP_IOCTL_ALLOC. Exceeding the max limit results in
'Resource temporarily unavailable' and the allocation fails.

BR,
Albert

> ---
> Changes in v2:
> - Rebase on Maxime's introduction of dmem to the cma allocator:
>   https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@ker=
nel.org/
> - Remove the dmem region registration from the cma dma-buf heap
> - Remove the misplaced logic for the default region.
> - Link to v1: https://lore.kernel.org/r/20260130-dmabuf-heap-cma-dmem-v1-=
1-3647ea993e99@redhat.com
>
> ---
> Eric Chanudet (1):
>       dma-buf: heaps: cma: charge each cma heap's dmem
>
> Maxime Ripard (2):
>       cma: Register dmem region for each cma region
>       cma: Provide accessor to cma dmem region
>
>  drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
>  include/linux/cma.h              |  9 +++++++++
>  mm/cma.c                         | 20 +++++++++++++++++++-
>  mm/cma.h                         |  3 +++
>  4 files changed, 45 insertions(+), 2 deletions(-)
> ---
> base-commit: 948e195dfaa56e48eabda591f97630502ff7e27e
> change-id: 20260128-dmabuf-heap-cma-dmem-f4120a2df4a8
>
> Best regards,
> --
> Eric Chanudet <echanude@redhat.com>
>

