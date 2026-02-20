Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAo9Gpe1l2kf6wIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 02:15:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E491641B3
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 02:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115E510E348;
	Fri, 20 Feb 2026 01:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="TbrzHDR0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C84910E348
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 01:14:58 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4806b0963a9so35685e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Feb 2026 17:14:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771550097; cv=none;
 d=google.com; s=arc-20240605;
 b=NpP6i/saXpos5rXAlELl6NLfnYulsZo/L3hvIv+yD9qOuiZmu/kuu5o2jlyoAKUWPa
 W4HiI9lWp3qAac7HeVL6W+RxJKbNEk08E4wQI7gpBZSSJ8uipiO1GkpyERIRsfQ2uHgz
 eNJeSJODkg/ahAVgt5qkT6uG9yCCcKgAHWAjBZE9qSbE9KN33Y4xG3bwSRi+HnCvLi35
 rhUf5BXqGgrFMvov4q1Oef582V5tbgrJYsb4ZWjQl/u5hV4xB/+Em3rHP2H7UEkyVsK+
 zVbT21RyBa/44kFix1q49kfpvp1DrE5PU9phZfaWGPxCciVqi/lKta20dmpfszCdCul0
 X+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=nmKdALZJb5FBSVFY2g/62lb/+tq0bPSvdEv6SUxXw5M=;
 fh=OJpaA7AjLIC4Y/QOXRJPTYMt7yxpijPx+nzytkzSbD0=;
 b=JhUhas0XeQSZszfrvLBKHUCYalN9WpBBTXBy0rOv1aqqNN5VcSMrnlOXlIk4KaEhXx
 raQF/ng/zWMxUS7Q9hdnx3fvedvunQSTrb02Pp8fjt/18tPldeN14mUNL0EyhlOx/WXA
 XK4E0S+OKsOSob7HnczMQWw87NPJ3RILmzoZZMfT2GZI3uTU8mXnHvp+P9hqiaKcM65I
 nPmnbOu9Z7iBp44Mo8Sp5VmCd7xFHij18+QGv9Xaug8swr1VQmZAiUbl6il5zgZX2PU8
 gIjSuuVKhRI07v9W/NCzF8VXUMPP3cX1NX4+JX0X4cd8qMm8PXS/c1cdCvrp4AJuzmS0
 zL1Q==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771550097; x=1772154897;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nmKdALZJb5FBSVFY2g/62lb/+tq0bPSvdEv6SUxXw5M=;
 b=TbrzHDR0Pu/DvaD0vQfJSZIzWMTUauygBkEPHOMOZkqXxXwqW4RfiLXonFrRrK38gD
 YF1CmWAuGEX15PFGUnuf1XbD2XyEy51CRX0CDupxTED8+ComMi3yVuDQy0ddoIqNLexF
 Egx1NwQ5j/Qtg5I6bLqX6BzGbY23yuXgTg7Jx138usf7tIYYpN+C3bDV8j9is18rCZsX
 hKt6/ptG6jR9ZcArMCb7oVjyf5UcXPr6y3We65Rra/6GvBb32ZNdmwaHEsYd4s29J196
 x8HV0O7ooCGv+7MdtiYNCknu81gxMTDfscih0LXZ4REkoKN5w0779H0/cT2HYmBqyqIR
 7ArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771550097; x=1772154897;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nmKdALZJb5FBSVFY2g/62lb/+tq0bPSvdEv6SUxXw5M=;
 b=YYjIu1JZZKBwHP1bJcnQvlrJZo6d53eA2R6YC/N1Jv6tWlXLCUeton57YxYdIBdbmo
 BHDa3YHjqwcDx8uh4h8RWCArY7w93DspNE9wDuot8alKrAQA/BGAAPn4NGgWm3VgjhHY
 /2IE8IroSv8enosZ/7DJbzKniWGR4jraEjOD7aXOTe73cNKon40T/zRzcpTIAoT0ikR2
 Pxu2OW0eXPxxkNQpl3GOC7fzTexP5nD+cIt9iso8RFy2Nv24YJxfFTEIuVAhyDdyQMLk
 BaLcPMVCuLKfjeTO3fPA/5S12nPN7hAjJdoSJHT7yko97XC8EgZ4MgeyFIXgxApfGh5k
 Igwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXujdYHa8feVuPsp+i0rCotnO6XCiM6hUSTVAbbqORlrX/DxlCBtFEbtpECCZ4EveGiJmzBMefhBKY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/OURLWJJhBI+Y+KD/JAmH4ZQvgONfWOxEZjd6dCr4iHVerq/u
 SAYfiTvTFmJOxeWGzoWMgY0fkGp/m3mncHDkygaq4LfWZJBGH3VyXVuD2wU1kgjzMy2aAeQiWXm
 fj07gc8K+C0HckFZpd/rjMWBvlGE61UhQONBcv1Fm
X-Gm-Gg: AZuq6aK1jjk3SLoheykmioTa2aPEF07pKuroRoS7DvlZjkbquteZi/DGdJexon3eX90
 nquhI3/f/HjldL5/eaWYUOivbYSTSOo3rA0gUog7sxVZlj93MraSu8DHSoUWw4rTp4yC28L+c0E
 B4UwsEf/v+dhOLfwoYGxaIp5FQgS0htFPpnc0KQ+gyzJ/cbegg0W/4KjoiNWauZ91oden7aCZMv
 zJAcjj289KTdz3cht0EEy68Ag0Ib0NnefIAISs1MfhFBPszbjJnwlXlKkMT58Jb0gkbOy5T0E53
 +cxPaDg7c5HlkbOQczfH3tEVI0bD9DtX5ECbIMQVdXTnp5cWmOVA1zQTRZfxDee76gKTKsT3aXD
 3dg2D
X-Received: by 2002:a05:600d:108:20b0:483:7f52:162b with SMTP id
 5b1f17b1804b1-483a3e452bcmr287525e9.0.1771550096636; Thu, 19 Feb 2026
 17:14:56 -0800 (PST)
MIME-Version: 1.0
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
In-Reply-To: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 19 Feb 2026 17:14:42 -0800
X-Gm-Features: AaiRm51VY-6IMlt-ihglkgENMjUfEiHWPo38nPxJvuL5b9iXSTZyagxYxax_pqI
Message-ID: <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
To: Eric Chanudet <echanude@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@redhat.com>, 
 Albert Esteve <aesteve@redhat.com>, linux-mm@kvack.org,
 Maxime Ripard <mripard@kernel.org>, 
 Yosry Ahmed <yosryahmed@google.com>, Shakeel Butt <shakeel.butt@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:echanude@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:christian.koenig@amd.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:mripard@redhat.com,m:aesteve@redhat.com,m:linux-mm@kvack.org,m:mripard@kernel.org,m:yosryahmed@google.com,m:shakeel.butt@linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D0E491641B3
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 9:15=E2=80=AFAM Eric Chanudet <echanude@redhat.com>=
 wrote:

Hi Eric,

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

But CMA memory is system memory, and regular (non-CMA) movable
allocations can occur out of these CMA areas. So this splits system
memory accounting between memcg (from [2]) and dmem. If I want to put
a limit on system memory use I have to adjust multiple limits (memcg +
dmems) and know how to divide the total between them all.

How do you envision using this combination of different controllers?

Thanks,
T.J.

> [1] https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@k=
ernel.org/
> [2] https://lore.kernel.org/all/20260116-dmabuf-heap-system-memcg-v3-0-ec=
c6b62cc446@redhat.com/
>
> Signed-off-by: Eric Chanudet <echanude@redhat.com>
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
