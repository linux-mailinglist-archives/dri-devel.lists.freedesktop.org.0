Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE03667A1EA
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 19:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA2910E08A;
	Tue, 24 Jan 2023 18:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C1D10E08A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 18:55:33 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-506609635cbso17364577b3.4
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 10:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5iP8zaH4qhJm7u23Me24MfP0ksC5myih/koifVjd6bQ=;
 b=L97ftDdvRyPqQWji9bbudEKZD0LDLmKOVOT0VCiZU2LCV4qkff4lF/IdPTXrUURWIL
 ff9SdNebMBFiJK7tO0W11Q1G3UAXgTPUqwqhK5wAl6n35fMRrabPmvj7OKd4VEXabKNe
 fPfG1+wRSo+CGN8gb1ygCJ4/kEeW/hVXaBUNrg4mvfNQT/BKe7VDh8MR1pAOAXvVpeRH
 iSMTwWB8dLyPnn97HzVO9MptWE6TkOpSAkEtIzxtQqNOTsOqkk7JQsVXrGtclwnaZu3B
 HwIb13tYMPFn1tPWBxylMI8CnFv9i3PBeFrmGSlZCW+l6NJP5u3gl1vi0n9snU8rYOV/
 xPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5iP8zaH4qhJm7u23Me24MfP0ksC5myih/koifVjd6bQ=;
 b=qdA/ZptS8vYCN8vgk1WO0dMn3t9KdtYWthb+lluszfjOwo6SvXpmTmoU3N5SaTQGCt
 n4pRjbl4TZMmzBgDA0UWlpS7VD0NLMzrAX8VPmEVsHUd6VtkqqqFLtjS8HB4OAJMLzog
 DIzcsGZ28hmZU4hZiufg7gToVeQMr8nwNRudZQ1M7ukhLRhIA2/W2Gn4eF1OJbsIES7T
 vIZj3lSpLnL7bHcfkzhr0eE4inWSwFunFdt4jfqaIbAVcP/eLmAj3Q+2i5ORz2CXGfR0
 kGpOnCysShlZOvfesVL/lZ5WKKPPiXZ+wuoPkU4U1eGt/eizz1FWJqvE53uZt8uraJuk
 l5dw==
X-Gm-Message-State: AFqh2kqU3ybh7SgdANBaIqf5fUuA6uP+EzgLLh04jLisKAjncxD4o8wf
 gpawKAKX/vqx0ZblUmYxbyaUD3UrigpYx7rPFXPNTA==
X-Google-Smtp-Source: AMrXdXvYfqSwoaAvj+x6Y8rOABSC1o3UELoBjL8mxdEcOy8itZdY1Gyy4qtRJtS0OI19YGFM9lWbjo9sqQUT8b8rESs=
X-Received: by 2002:a81:ee03:0:b0:4ec:8f55:59f7 with SMTP id
 l3-20020a81ee03000000b004ec8f5559f7mr3333976ywm.317.1674586532265; Tue, 24
 Jan 2023 10:55:32 -0800 (PST)
MIME-Version: 1.0
References: <20230123191728.2928839-1-tjmercier@google.com>
 <20230123191728.2928839-2-tjmercier@google.com>
 <Y8/ybgp2FW+e3bjc@dhcp22.suse.cz>
In-Reply-To: <Y8/ybgp2FW+e3bjc@dhcp22.suse.cz>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 24 Jan 2023 10:55:21 -0800
Message-ID: <CABdmKX1c_8LdJJboENnZhwGjrszDWOOVt-Do93-sJW46mZMD6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] memcg: Track exported dma-buffers
To: Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 Roman Gushchin <roman.gushchin@linux.dev>, cmllamas@google.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, jstultz@google.com,
 Zefan Li <lizefan.x@bytedance.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 android-mm@google.com, Jonathan Corbet <corbet@lwn.net>, jeffv@google.com,
 linux-media@vger.kernel.org, selinux@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 cgroups@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 24, 2023 at 7:00 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Mon 23-01-23 19:17:23, T.J. Mercier wrote:
> > When a buffer is exported to userspace, use memcg to attribute the
> > buffer to the allocating cgroup until all buffer references are
> > released.
>
> Is there any reason why this memory cannot be charged during the
> allocation (__GFP_ACCOUNT used)?

My main motivation was to keep code changes away from exporters and
implement the accounting in one common spot for all of them. This is a
bit of a carryover from a previous approach [1] where there was some
objection to pushing off this work onto exporters and forcing them to
adapt, but __GFP_ACCOUNT does seem like a smaller burden than before
at least initially. However in order to support charge transfer
between cgroups with __GFP_ACCOUNT we'd need to be able to get at the
pages backing dmabuf objects, and the exporters are the ones with that
access. Meaning I think we'd have to add some additional dma_buf_ops
to achieve that, which was the objection from [1].

[1] https://lore.kernel.org/lkml/5cc27a05-8131-ce9b-dea1-5c75e994216d@amd.com/

>
> Also you do charge and account the memory but underlying pages do not
> know about their memcg (this is normally done with commit_charge for
> user mapped pages). This would become a problem if the memory is
> migrated for example.

Hmm, what problem do you see in this situation? If the backing pages
are to be migrated that requires the cooperation of the exporter,
which currently has no influence on how the cgroup charging is done
and that seems fine. (Unless you mean migrating the charge across
cgroups? In which case that's the next patch.)

> This also means that you have to maintain memcg
> reference outside of the memcg proper which is not really nice either.
> This mimicks tcp kmem limit implementation which I really have to say I
> am not a great fan of and this pattern shouldn't be coppied.
>
Ah, what can I say. This way looked simple to me. I think otherwise
we're back to making all exporters do more stuff for the accounting.

> Also you are not really saying anything about the oom behavior. With
> this implementation the kernel will try to reclaim the memory and even
> trigger the memcg oom killer if the request size is <= 8 pages. Is this
> a desirable behavior?

It will try to reclaim some memory, but not the dmabuf pages right?
Not *yet* anyway. This behavior sounds expected to me. I would only
expect it to be surprising for cgroups making heavy use of dmabufs
(that weren't accounted before) *and* with hard limits already very
close to actual usage. I remember Johannes mentioning that what counts
under memcg use is already a bit of a moving target.

> --
> Michal Hocko
> SUSE Labs
