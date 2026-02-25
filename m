Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKAQOZE3n2m5ZQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:55:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E9D19BD5B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 18:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8348310E7DB;
	Wed, 25 Feb 2026 17:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kWIvRRa0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CA110E7DB
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 17:55:24 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-48373ad38d2so3415e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 09:55:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772042123; cv=none;
 d=google.com; s=arc-20240605;
 b=c3b2++YsgPjTp6adJ7HY3d0Li87WS93b6hKAOv4NbUNSXltnRG/yENrLDPP4gOCFTZ
 c+36wlWGTy+DKcQiClzm5VvTvW7foG1iC/HOgmQsd7VStiMtgz7wsMWngmE8YGR+oglu
 VYth6f5KCcB4/9HqYffn8xrnP8l4NE0dGqV1ZEO0pgRD+JmNUTDAWDm2TzKR1jJ+0Nse
 rrEYQ3RUdclUA4ItQicQ+ILdARg04zf5TahmfFtCJoJvRMbtXo4BV76anGj2GS1nBJYK
 YbtskRoCya5pXIgV6umP3oGiqgO6iOEkMQxGtil7jBWbVZm1Ov+lx54v2MfFnEpqvUqK
 /fZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=i8gRH0YBs8R4dCXzko++9eZOKgk9GpolaSr9eR7PWeg=;
 fh=jV88R47cYmmXd6Dvmt1NsYW4DLE9it3k3G6EUdeFPdo=;
 b=DQKXljU4Tz334GwJdZ3VuSwA1MThw7GUSAuhP7YXTaPyCfo+dXxNmArAXK6pN06bg9
 s+7khkRJJoXTcz88gH7NE3E0CR6wMwD2XCznYx3+/PpsJq8D7arVfdp3SJ5sLsyAyb1V
 fb8Mx1jiENrCVw5AH2W8unpTW+2MJF5bKgekE8ZgpAfhmXXQaFvRabLwjlu2boEQdhET
 GXRwyjrh5LhSDUULsnJTpL07/6c3K4+6D4GivsO3VKJDFfKzbM9rEehIsa7rV34YC7du
 Feqftbd/kjHi2IgPxCWHMu0MQRVKojykSMLCaN1c5CQAWSHvFB2d5c/H3Mwj8OdVXKAD
 Ogzw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772042123; x=1772646923;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i8gRH0YBs8R4dCXzko++9eZOKgk9GpolaSr9eR7PWeg=;
 b=kWIvRRa0RJ/Sz0yrAOOM447pOsh7HCgCY6kaomXmucgD55IdS7QeIp2lBpYhbWEFKl
 hUupXgvqUzRx+nvPdieX7Sv7fYqspoj6OukNoH8HPObv/9+nRLN0qC23eC5M4qBR2xsc
 9FrZ3JQ3LMsUBArkiVAPf0VxnmDLlqXjYUOQlmFWemXu+HZbd8caPpju2ffHhCTyyoZo
 4IkOFXYF6ug06dhRSEBOdw0FPzB6hs4fVowDTfqq2bBe50vWjcKHFA0os33puCHsR0RC
 1n9SVo4SfdWxMoZnJHjOhIY6ud5ko8XaVOYI4FNPjd1BKSAQi+eGklOHxSgqNdIKKaEJ
 PKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772042123; x=1772646923;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=i8gRH0YBs8R4dCXzko++9eZOKgk9GpolaSr9eR7PWeg=;
 b=SHY6umnHOR2ie05Ld8AS0OEinwbe6Q4hJeO499VVfrjPZRnntd/zsZ4Bn+SKYO4mdB
 v3U/rUMCA+aM3QTPWVCbBMYv/3BtTLq8QiBxlevlpx0cxA96ez/WSiv/ejGBaIeoSzeZ
 vkWlKqxP1gonHHvl+DpAJs6NA10o/5LeX8K9ELDQjdp4JKYeZLNE3Ctlk/LFVBBVFQUk
 MhLqEpeBgosczvKlFh/As3HchDHTAL6jn/qTrSEEjDpM9uajcjQ7Qg8BzfKMr9H321ip
 jw18fw2SXU53oDPZf/dP02XEM2kS8tZ+RnETlWtgLI6InXHtK77tGNkvqCUU5GlZ+HMy
 vLLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX13VcsIk9EJYbtebhR8tOa9YfPwA+66lbusOL8mNvaqd8dCfI/GLb/vZrOM9bluOcTJzNdQothh/A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YydzsxxG8nP7d8kh+70JftE7lnZGWJkYMuwaQgc2bBSO1f/P0LD
 /5/y/19av4K6HUa9mAX/KFjF6u/7NNFbmaYdzmb9oeeofIgLacClIClTjehr2BrpR6N6aUQ/kJ5
 IUzIzW8XPp/9G2pBVSEbgyi9Y4NdJjPhIDQEACd19
X-Gm-Gg: ATEYQzyEJRtVhY1EHELgEjGN7Sw/Eud0YRK6oAFhgpYMwzgVWhw2JbWQAApFZ1tWO4X
 E1Rz0pB0iD8oPZ+kfLBk27VsarOSizhGic0NGm8gnI+HdZ4aFo1TUoAu716CsxnwopGNoTrHJ9w
 xlltrQuT0byTdwHuZrIy7NRHvYWRXPTIUpCthgY4qJHibrjjW1mZD6lq9GBPUY+yxfiiB/qWCut
 2IOnPZaj4aObw6XaomJP9YmTK8dvNLwPbvl2usPdBeCxafY3A8Wqer9+XepsQtRjajdZYwMJbca
 fAbyRjyg1adEKwWszI3wG2RebroRq8V//D+3n3pMHAiXRiq/9inFeY5nF7GZv2qEAXk2YTzHnlp
 bi2db
X-Received: by 2002:a05:600c:8611:b0:47e:d9e7:1c12 with SMTP id
 5b1f17b1804b1-483bebec818mr726105e9.6.1772042122791; Wed, 25 Feb 2026
 09:55:22 -0800 (PST)
MIME-Version: 1.0
References: <20260218-dmabuf-heap-cma-dmem-v2-0-b249886fb7b2@redhat.com>
 <CABdmKX0LpKJ9tw48oQh7=3CF0UR5uFtgo0OMwQhHBB40LnijyQ@mail.gmail.com>
 <20260224-terrestrial-jaguarundi-of-influence-e3ccf1@houat>
In-Reply-To: <20260224-terrestrial-jaguarundi-of-influence-e3ccf1@houat>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 25 Feb 2026 09:55:10 -0800
X-Gm-Features: AaiRm52tUhgFoM5nopMxGR-oiwd-4ooH-ZyIViR4nk0fPe7YzI5THkHnLy4-ths
Message-ID: <CABdmKX1-SdLGR4=3q2dNAztA-2qz_AktVB9Pbs7kEZGQ3xLT_A@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] dma-buf: heaps: cma: enable dmem cgroup accounting
To: Maxime Ripard <mripard@redhat.com>
Cc: Eric Chanudet <echanude@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
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
 linux-kernel@vger.kernel.org, Albert Esteve <aesteve@redhat.com>,
 linux-mm@kvack.org, 
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
	FORGED_RECIPIENTS(0.00)[m:mripard@redhat.com,m:echanude@redhat.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:christian.koenig@amd.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:aesteve@redhat.com,m:linux-mm@kvack.org,m:yosryahmed@google.com,m:shakeel.butt@linux.dev,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tjmercier@google.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 49E9D19BD5B
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 1:42=E2=80=AFAM Maxime Ripard <mripard@redhat.com> =
wrote:
>
> Hi TJ,
>
> On Thu, Feb 19, 2026 at 05:14:42PM -0800, T.J. Mercier wrote:
> > On Wed, Feb 18, 2026 at 9:15=E2=80=AFAM Eric Chanudet <echanude@redhat.=
com> wrote:
> > > An earlier series[1] from Maxime introduced dmem to the cma allocator=
 in
> > > an attempt to use it generally for dma-buf. Restart from there and ap=
ply
> > > the charge in the narrower context of the CMA dma-buf heap instead.
> > >
> > > In line with introducing cgroup to the system heap[2], this behavior =
is
> > > enabled based on dma_heap.mem_accounting, disabled by default.
> > >
> > > dmem is chosen for CMA heaps as it allows limits to be set for each
> > > region backing each heap. The charge is only put in the dma-buf heap =
for
> > > now as it guaranties it can be accounted against a userspace process
> > > that requested the allocation.
> >
> > But CMA memory is system memory, and regular (non-CMA) movable
> > allocations can occur out of these CMA areas. So this splits system
> > memory accounting between memcg (from [2]) and dmem. If I want to put
> > a limit on system memory use I have to adjust multiple limits (memcg +
> > dmems) and know how to divide the total between them all.
> >
> > How do you envision using this combination of different controllers?
>
> I feel like it can be argued either way, and I don't really see a way
> out of supporting both.
>
> Like you pointed out, CMA can indeed be seen as system memory, but it's
> also a limited pool that you might want to place arbitrary limits on
> since, unlike system memory, it can't be reclaimed, will not trigger the
> OOM killer, and more generally is a much more sparse resource.

Ok thanks. Yeah I guess we'll just have to add the accounting
complexity as needed to satisfy everyone's different needs.
