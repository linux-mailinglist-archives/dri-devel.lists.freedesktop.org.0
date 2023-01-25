Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D2467B243
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 13:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B59BA10E799;
	Wed, 25 Jan 2023 12:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2139210E799
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 12:05:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BDBC621DAC;
 Wed, 25 Jan 2023 12:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1674648350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M6ZhLLcIfUWj0Dx+OmAWrztylazBquGZXcGl1z85yuQ=;
 b=tjJPeQ8m8W5P71g2m3JXDLxSp72HbJQftZy3vAdP9Nl5ZEHWbqPcQpFn4uWOw77aDGRZxH
 61qkk+aV/38b489Z7WPEGg5c6TfyGOai2/nQeNkVYrNH/43gA/P/ON4+Sm72XqAf9C3oEF
 fsOYWoE2wspY0mKU/zUs0DzufjAsLUw=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 96D241358F;
 Wed, 25 Jan 2023 12:05:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WtVTJB4b0WMbdgAAMHmgww
 (envelope-from <mhocko@suse.com>); Wed, 25 Jan 2023 12:05:50 +0000
Date: Wed, 25 Jan 2023 13:05:49 +0100
From: Michal Hocko <mhocko@suse.com>
To: "T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v2 1/4] memcg: Track exported dma-buffers
Message-ID: <Y9EbHW84ydBzpTTO@dhcp22.suse.cz>
References: <20230123191728.2928839-1-tjmercier@google.com>
 <20230123191728.2928839-2-tjmercier@google.com>
 <Y8/ybgp2FW+e3bjc@dhcp22.suse.cz>
 <CABdmKX1c_8LdJJboENnZhwGjrszDWOOVt-Do93-sJW46mZMD6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABdmKX1c_8LdJJboENnZhwGjrszDWOOVt-Do93-sJW46mZMD6A@mail.gmail.com>
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
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 24-01-23 10:55:21, T.J. Mercier wrote:
> On Tue, Jan 24, 2023 at 7:00 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Mon 23-01-23 19:17:23, T.J. Mercier wrote:
> > > When a buffer is exported to userspace, use memcg to attribute the
> > > buffer to the allocating cgroup until all buffer references are
> > > released.
> >
> > Is there any reason why this memory cannot be charged during the
> > allocation (__GFP_ACCOUNT used)?
> 
> My main motivation was to keep code changes away from exporters and
> implement the accounting in one common spot for all of them. This is a
> bit of a carryover from a previous approach [1] where there was some
> objection to pushing off this work onto exporters and forcing them to
> adapt, but __GFP_ACCOUNT does seem like a smaller burden than before
> at least initially. However in order to support charge transfer
> between cgroups with __GFP_ACCOUNT we'd need to be able to get at the
> pages backing dmabuf objects, and the exporters are the ones with that
> access. Meaning I think we'd have to add some additional dma_buf_ops
> to achieve that, which was the objection from [1].
> 
> [1] https://lore.kernel.org/lkml/5cc27a05-8131-ce9b-dea1-5c75e994216d@amd.com/
> 
> >
> > Also you do charge and account the memory but underlying pages do not
> > know about their memcg (this is normally done with commit_charge for
> > user mapped pages). This would become a problem if the memory is
> > migrated for example.
> 
> Hmm, what problem do you see in this situation? If the backing pages
> are to be migrated that requires the cooperation of the exporter,
> which currently has no influence on how the cgroup charging is done
> and that seems fine. (Unless you mean migrating the charge across
> cgroups? In which case that's the next patch.)

My main concern was that page migration could lose the external tracking
without some additional steps on the dmabuf front.

> > This also means that you have to maintain memcg
> > reference outside of the memcg proper which is not really nice either.
> > This mimicks tcp kmem limit implementation which I really have to say I
> > am not a great fan of and this pattern shouldn't be coppied.
> >
> Ah, what can I say. This way looked simple to me. I think otherwise
> we're back to making all exporters do more stuff for the accounting.
> 
> > Also you are not really saying anything about the oom behavior. With
> > this implementation the kernel will try to reclaim the memory and even
> > trigger the memcg oom killer if the request size is <= 8 pages. Is this
> > a desirable behavior?
> 
> It will try to reclaim some memory, but not the dmabuf pages right?
> Not *yet* anyway. This behavior sounds expected to me.

Yes, we have discussed that shrinkers will follow up later which is
fine. The question is how much reclaim actually makes sense at this
stage. Charging interface usually copes with sizes resulting from
allocation requests (so usually 1<<order based). I can imagine that a
batch charge like implemented here could easily be 100s of MBs and it is
much harder to define reclaim targets for. At least that is something
the memcg charging hasn't really considered yet.  Maybe the existing
try_charge implementation can cope with that just fine but it would be
really great to have the expected behavior described.

E.g. should be memcg OOM killer be invoked? Should reclaim really target
regular memory at all costs or just a lightweight memory reclaim is
preferred (is the dmabuf charge failure an expensive operation wrt.
memory refault due to reclaim).
-- 
Michal Hocko
SUSE Labs
