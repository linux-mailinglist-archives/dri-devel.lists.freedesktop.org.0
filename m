Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJ7rMQGtnGlyJwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:39:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F1417C798
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 20:39:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6348510E172;
	Mon, 23 Feb 2026 19:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MJS3c3CP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21FF10E172
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 19:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771875580;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=67ebD5htsI6tjAjswLGtA5uaDjUqlsPp6plwpaEU6dc=;
 b=MJS3c3CPHIGLssrQBUJq6kMDK3U+tvMIsU5El5N7e5+iIniMf7FKnzHNlxGYAVC46tBFWm
 6aQu8ORETCjUNrQf0PZMjFGudSVH1qIppHqihD2RjlwjDu9TDQQjt/tOiKfVZmozSQt9nn
 T4PQSgE5pNiFZ2m2cUYTpLOqn9TXfuc=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-w788jIF1Pje-hrRMfIwGyQ-1; Mon, 23 Feb 2026 14:39:38 -0500
X-MC-Unique: w788jIF1Pje-hrRMfIwGyQ-1
X-Mimecast-MFC-AGG-ID: w788jIF1Pje-hrRMfIwGyQ_1771875578
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-89473f5a755so582760686d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 11:39:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771875578; x=1772480378;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=67ebD5htsI6tjAjswLGtA5uaDjUqlsPp6plwpaEU6dc=;
 b=AoC+I6TnPwSxJ7eY2i79U4W07Rk0UsNjUidhj+IpPGa2horRuX0wjwfrjxJsZgEssx
 oDZCONNsaIAvFwmrLdwqDN0GM9oBznkQ8+fiA+22NUzvrugb8eM6em9xOJPUXzqhuTHd
 TyVOegGB0TBTjv3q2dZxP9b6lQvahd2iVc0yjcsO8Mp2rl9xS823h0DAHsgY7tLXhBQE
 Z5DvrxTFEuipryqkrBM0ECkZhewUCmqS5gowDjwc58tDxAvFYet1JKIGNec8hgXU+dpa
 3kQzMlXta4uaiuCjiTs+DWS9BFv/R+J0+hsZUp8MLvuGDDyJYIURHzLCfbGOHZ3LxSWP
 VWqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBbPvw+VLVrXNsL9KbqzLJ9cQFbW+GvLBxMs8uRmWakCmzX4gAuIjNjNVxGcMUwE+GAqsHG4XW/hI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywwl3fctdGsFiQWv7ed+qWc3veG6/bioESCvkSzLUubppUdnA/D
 WDA1sitBJTJImiaCfS6J2nCqeDX8oPu3UJ6RhsjHFXQrbYov5lNbANkkGas6xePpjMwHvRbWhMb
 IRWAn0pBnN8yBpoTJyto+VyNk6ewUxuoX6TjNZCEQUWywZRJuLQSpYTDmpaGIEGXEkepO9Q==
X-Gm-Gg: ATEYQzwt95X3zumfsKdX/hXh3AdmoKYhNgykIIIIykXcxghobDNyhAHwD5WcjV4e+hi
 MvINi6keakkKJ8j6hoaRfEYuKEY20tkXalIZEBX9Rer/Snr3ACwTNf79O3chYTZXhXHldSoVPZn
 ierYJYRZZ4Uc8VZXOAgOh4X9a9TT3F8uqIbe6pN2WNk7fJjJzenz2vOMpsi+fhjyrj+iln6ZpjC
 gj7KVk8IOwUkemxOo1opc/2JqdlAvPLHGNh1xFmJrgtCtI9KKb03lB/vYuZfARV5yJKtsFqEsHD
 j+kyvthM2lfRhK6Ggc2N+WRiuzEaYOK8a2aIgbxS9zQwLzp6h4deMzwJL/2rP5iE0rftUJJD7C1
 f/C2I1TO3/FpYh43vaLm90mND2uHCY+O99uqV4hh0bTh/1hxfIyvCvi2PjiYgLHI=
X-Received: by 2002:ad4:5e8d:0:b0:897:306d:98be with SMTP id
 6a1803df08f44-89979efc4a9mr154810526d6.55.1771875578008; 
 Mon, 23 Feb 2026 11:39:38 -0800 (PST)
X-Received: by 2002:ad4:5e8d:0:b0:897:306d:98be with SMTP id
 6a1803df08f44-89979efc4a9mr154810126d6.55.1771875577480; 
 Mon, 23 Feb 2026 11:39:37 -0800 (PST)
Received: from localhost (pool-100-17-19-56.bstnma.fios.verizon.net.
 [100.17.19.56]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5070d544cb8sm74614481cf.12.2026.02.23.11.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 11:39:35 -0800 (PST)
Date: Mon, 23 Feb 2026 14:39:34 -0500
From: Eric Chanudet <echanude@redhat.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>,
 linux-mm@kvack.org, 
 Maxime Ripard <mripard@kernel.org>, Yosry Ahmed <yosryahmed@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
Message-ID: <aZoHfloupKvF2oSu@fedora>
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
 <a446b598-5041-450b-aaa9-3c39a09ff6a0@amd.com>
MIME-Version: 1.0
In-Reply-To: <a446b598-5041-450b-aaa9-3c39a09ff6a0@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y_UbQ2mzCEPcwFFlMZBNFRhxJ8OXti1C1dposS0OqEE_1771875578
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:christian.koenig@amd.com,m:tjmercier@google.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:mripard@redhat.com,m:aesteve@redhat.com,m:linux-mm@kvack.org,m:mripard@kernel.org,m:yosryahmed@google.com,m:shakeel.butt@linux.dev,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER(0.00)[echanude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[echanude@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 38F1417C798
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 10:45:08AM +0100, Christian König wrote:
> On 2/20/26 02:14, T.J. Mercier wrote:
> > On Wed, Feb 18, 2026 at 9:15 AM Eric Chanudet <echanude@redhat.com> wrote:
> > 
> > Hi Eric,
> > 
> >> An earlier series[1] from Maxime introduced dmem to the cma allocator in
> >> an attempt to use it generally for dma-buf. Restart from there and apply
> >> the charge in the narrower context of the CMA dma-buf heap instead.
> >>
> >> In line with introducing cgroup to the system heap[2], this behavior is
> >> enabled based on dma_heap.mem_accounting, disabled by default.
> >>
> >> dmem is chosen for CMA heaps as it allows limits to be set for each
> >> region backing each heap. The charge is only put in the dma-buf heap for
> >> now as it guaranties it can be accounted against a userspace process
> >> that requested the allocation.
> > 
> > But CMA memory is system memory, and regular (non-CMA) movable
> > allocations can occur out of these CMA areas. So this splits system
> > memory accounting between memcg (from [2]) and dmem. If I want to put
> > a limit on system memory use I have to adjust multiple limits (memcg +
> > dmems) and know how to divide the total between them all.
> > 
> > How do you envision using this combination of different controllers?

We are trying to control each CMA heap use of their CMA regions.

Regular allocation would be migrated out should CMA allocation require
some space already taken in the region (bare, I suppose, if these end up
pinned...) so I didn't think it needed to account for these in dmem.

As for accounting for CMA allocations in memcg, I suppose that's the
question prior discussions explored as well.

> Yeah we have this problem pretty much everywhere.
> 
> There are both use cases where you want to account device allocations to memcg and when you don't want that.
> 
> From what I know at the moment it would be best if the administrator could say for each dmem if it should account additionally to memcg or not.
> 
> Using module parameters to enable/disable it globally is just a workaround as far as I can see.
> 

So, for example, adding a dmem knob so one can:
echo "cma/reserved $SIZE" > /sys/fs/cgroup/user.slice/dmem.max
echo "cma/reserved 1" > /sys/fs/cgroup/user.slice/dmem.charge_memcg

I'll take a look.

> Regards,
> Christian.
> 
> > 
> > Thanks,
> > T.J.
> > 
> >> [1] https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org/
> >> [2] https://lore.kernel.org/all/20260116-dmabuf-heap-system-memcg-v3-0-ecc6b62cc446@redhat.com/
> >>
> >> Signed-off-by: Eric Chanudet <echanude@redhat.com>
> >> ---
> >> Changes in v2:
> >> - Rebase on Maxime's introduction of dmem to the cma allocator:
> >>   https://lore.kernel.org/all/20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org/
> >> - Remove the dmem region registration from the cma dma-buf heap
> >> - Remove the misplaced logic for the default region.
> >> - Link to v1: https://lore.kernel.org/r/20260130-dmabuf-heap-cma-dmem-v1-1-3647ea993e99@redhat.com
> >>
> >> ---
> >> Eric Chanudet (1):
> >>       dma-buf: heaps: cma: charge each cma heap's dmem
> >>
> >> Maxime Ripard (2):
> >>       cma: Register dmem region for each cma region
> >>       cma: Provide accessor to cma dmem region
> >>
> >>  drivers/dma-buf/heaps/cma_heap.c | 15 ++++++++++++++-
> >>  include/linux/cma.h              |  9 +++++++++
> >>  mm/cma.c                         | 20 +++++++++++++++++++-
> >>  mm/cma.h                         |  3 +++
> >>  4 files changed, 45 insertions(+), 2 deletions(-)
> >> ---
> >> base-commit: 948e195dfaa56e48eabda591f97630502ff7e27e
> >> change-id: 20260128-dmabuf-heap-cma-dmem-f4120a2df4a8
> >>
> >> Best regards,
> >> --
> >> Eric Chanudet <echanude@redhat.com>
> >>
> 

-- 
Eric Chanudet

