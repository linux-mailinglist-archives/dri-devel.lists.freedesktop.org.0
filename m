Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7820F685CD5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 02:49:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA0410E0FE;
	Wed,  1 Feb 2023 01:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F34FD10E0FE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 01:49:22 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-4c131bede4bso227176577b3.5
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Jan 2023 17:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z1m13XCTvymftA/AFOwDDbr1NYjXo09zVt/zVuxJnSQ=;
 b=R+Dcj4zWuzGr6r5l2F611kxVGta7vRkU+AzU3k2BaP+94g2UqWf7s+N1I3h1EPQeMg
 tpyP1vFQ+tdCTJ5KZ95KtfSVCOkWEovHqWTCR94pctkt7jjLjVi8OIs60iUq+0WuPNbT
 amhAhh5vE5kQN8BodyTGKRKkGfOb9NNNSRCMY4pMl9Pksww6Mfubu9pdWcRvveIK8ryr
 rCO5ZKGxag4fXrEew8JYN0tbv6E1yBBAxA2cxrRyOnVBeVJp/tHNbqD0AeeV7ut8Usrt
 A+hHwUu5nUSHBlpn9CNBoTt2oPdDAAibNma7TzDQGp39pw/kSA+ZBcKqO+A1cVZa2/U9
 gFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z1m13XCTvymftA/AFOwDDbr1NYjXo09zVt/zVuxJnSQ=;
 b=xaDkVcrBZqK7+MxahbdnYTkG5ZNaMA7nikuAVpa72wlM2CGshK9EKnktcOtGsSzDNE
 Ac9l2GtoSkvjAQMgH/AnJdigBvKQhN1wTriQpj/DIREO5C3EL9T1T5z1pvDzefdvbVJJ
 oduN5e+haha+w6JbuzAY1UNJ5h1SSQIjRMKw+s5qHbkgerUxt7BtGyyygKSy8M6XwIiA
 RPe2gkaO3g8RibhyzeMsT8oQu0Cb2NZ0w6d/3LAbhHcCVrEq4AX1ax8pDhzSXHU/2fqD
 8ThCFkwWi/Mcu5TIaz1a87Pz6pna4FJEwMS5yxE5yWS1C720C78im/Ia2NabRyVf2fKu
 R1aA==
X-Gm-Message-State: AO0yUKXSy9tntIcx9MDAylqrfXLGEpyCGbK6gkVY/RyPXMMX3W+UWdzt
 UtV1mXVLpryfzV+r6MClOg8JAoXEd22EJdFzhM//5g==
X-Google-Smtp-Source: AK7set/wzA5afz5mZ+K94QaPji2ux5+fHm9/NlE+zLFQpSQHQsfBw/F6ZgDvrWDx4avq/xII6/kRx6OUWDoCRKtYyGc=
X-Received: by 2002:a81:994d:0:b0:508:4dc0:7f7c with SMTP id
 q74-20020a81994d000000b005084dc07f7cmr54078ywg.240.1675216161793; Tue, 31 Jan
 2023 17:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20230123191728.2928839-1-tjmercier@google.com>
 <20230123191728.2928839-2-tjmercier@google.com>
 <Y8/ybgp2FW+e3bjc@dhcp22.suse.cz>
 <20230124194628.d44rtcfsv23fndxw@google.com> <Y9EX+usSpAjZ/8LS@dhcp22.suse.cz>
 <347560bc-d06a-92b7-8003-133d2b8af2df@linux.intel.com>
 <CABdmKX09S3bYzX+xBkhfkFULk2BtzS11RhzrvWv94j+cHSezPA@mail.gmail.com>
 <ad6bd448-91bd-d47e-5b54-8755fe0e0340@linux.intel.com>
In-Reply-To: <ad6bd448-91bd-d47e-5b54-8755fe0e0340@linux.intel.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 31 Jan 2023 17:49:10 -0800
Message-ID: <CABdmKX3VSdF3jmktpw9VH4k+J+ZtQCLCPdNN6uye4XnZGPhG5g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] memcg: Track exported dma-buffers
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Michal Hocko <mhocko@suse.com>, linux-doc@vger.kernel.org,
 daniel.vetter@ffwll.ch, Roman Gushchin <roman.gushchin@linux.dev>,
 cmllamas@google.com, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 jstultz@google.com, Zefan Li <lizefan.x@bytedance.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, android-mm@google.com,
 Jonathan Corbet <corbet@lwn.net>, jeffv@google.com,
 linux-media@vger.kernel.org, selinux@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 cgroups@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 31, 2023 at 6:01 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 25/01/2023 20:04, T.J. Mercier wrote:
> > On Wed, Jan 25, 2023 at 9:31 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> Hi,
> >>
> >> On 25/01/2023 11:52, Michal Hocko wrote:
> >>> On Tue 24-01-23 19:46:28, Shakeel Butt wrote:
> >>>> On Tue, Jan 24, 2023 at 03:59:58PM +0100, Michal Hocko wrote:
> >>>>> On Mon 23-01-23 19:17:23, T.J. Mercier wrote:
> >>>>>> When a buffer is exported to userspace, use memcg to attribute the
> >>>>>> buffer to the allocating cgroup until all buffer references are
> >>>>>> released.
> >>>>>
> >>>>> Is there any reason why this memory cannot be charged during the
> >>>>> allocation (__GFP_ACCOUNT used)?
> >>>>> Also you do charge and account the memory but underlying pages do not
> >>>>> know about their memcg (this is normally done with commit_charge for
> >>>>> user mapped pages). This would become a problem if the memory is
> >>>>> migrated for example.
> >>>>
> >>>> I don't think this is movable memory.
> >>>>
> >>>>> This also means that you have to maintain memcg
> >>>>> reference outside of the memcg proper which is not really nice either.
> >>>>> This mimicks tcp kmem limit implementation which I really have to say I
> >>>>> am not a great fan of and this pattern shouldn't be coppied.
> >>>>>
> >>>>
> >>>> I think we should keep the discussion on technical merits instead of
> >>>> personal perference. To me using skmem like interface is totally fine
> >>>> but the pros/cons need to be very explicit and the clear reasons to
> >>>> select that option should be included.
> >>>
> >>> I do agree with that. I didn't want sound to be personal wrt tcp kmem
> >>> accounting but the overall code maintenance cost is higher because
> >>> of how tcp take on accounting differs from anything else in the memcg
> >>> proper. I would prefer to not grow another example like that.
> >>>
> >>>> To me there are two options:
> >>>>
> >>>> 1. Using skmem like interface as this patch series:
> >>>>
> >>>> The main pros of this option is that it is very simple. Let me list down
> >>>> the cons of this approach:
> >>>>
> >>>> a. There is time window between the actual memory allocation/free and
> >>>> the charge and uncharge and [un]charge happen when the whole memory is
> >>>> allocated or freed. I think for the charge path that might not be a big
> >>>> issue but on the uncharge, this can cause issues. The application and
> >>>> the potential shrinkers have freed some of this dmabuf memory but until
> >>>> the whole dmabuf is freed, the memcg uncharge will not happen. This can
> >>>> consequences on reclaim and oom behavior of the application.
> >>>>
> >>>> b. Due to the usage model i.e. a central daemon allocating the dmabuf
> >>>> memory upfront, there is a requirement to have a memcg charge transfer
> >>>> functionality to transfer the charge from the central daemon to the
> >>>> client applications. This does introduce complexity and avenues of weird
> >>>> reclaim and oom behavior.
> >>>>
> >>>>
> >>>> 2. Allocate and charge the memory on page fault by actual user
> >>>>
> >>>> In this approach, the memory is not allocated upfront by the central
> >>>> daemon but rather on the page fault by the client application and the
> >>>> memcg charge happen at the same time.
> >>>>
> >>>> The only cons I can think of is this approach is more involved and may
> >>>> need some clever tricks to track the page on the free patch i.e. we to
> >>>> decrement the dmabuf memcg stat on free path. Maybe a page flag.
> >>>>
> >>>> The pros of this approach is there is no need have a charge transfer
> >>>> functionality and the charge/uncharge being closely tied to the actual
> >>>> memory allocation and free.
> >>>>
> >>>> Personally I would prefer the second approach but I don't want to just
> >>>> block this work if the dmabuf folks are ok with the cons mentioned of
> >>>> the first approach.
> >>>
> >>> I am not familiar with dmabuf internals to judge complexity on their end
> >>> but I fully agree that charge-when-used is much more easier to reason
> >>> about and it should have less subtle surprises.
> >>
> >> Disclaimer that I don't seem to see patches 3&4 on dri-devel so maybe I
> >> am missing something, but in principle yes, I agree that the 2nd option
> >> (charge the user, not exporter) should be preferred. Thing being that at
> >> export time there may not be any backing store allocated, plus if the
> >> series is restricting the charge transfer to just Android clients then
> >> it seems it has the potential to miss many other use cases. At least
> >> needs to outline a description on how the feature will be useful outside
> >> Android.
> >>
> > There is no restriction like that. It's available to anybody who wants
> > to call dma_buf_charge_transfer if they actually have a need for that,
> > which I don't really expect to be common since most users/owners of
> > the buffers will be the ones causing the export in the first place.
> > It's just not like that on Android with the extra allocator process in
> > the middle most of the time.
>
> Yeah I used the wrong term "restrict", apologies. What I meant was, if
> the idea was to allow spotting memory leaks, with the charge transfer
> being optional and in the series only wired up for Android Binder, then
> it obviously only fully works for that one case. So a step back..
>
Oh, spotting kernel memory leaks is a side-benefit of accounting
kernel-only buffers in the root cgroup. The primary goal is to
attribute buffers to applications that originated them (via
per-application cgroups) simply for accounting purposes. Buffers are
using memory on the system, and we want to know who created them and
how much memory is used. That information is/will no longer available
with the recent deprecation of the dmabuf sysfs statistics.

> .. For instance, it is not feasible to transfer the charge when dmabuf
> is attached, or imported? That would attribute the usage to the
> user/importer so give better visibility on who is actually causing the
> memory leak.
>
Instead of accounting at export, we could account at attach. That just
turns out not to be very useful when the majority of our
heap-allocated buffers don't have attachments at any particular point
in time. :\ But again it's less about leaks and more about knowing
which buffers exist in the first place.

> Further more, if above is feasible, then could it also be implemented in
> the common layer so it would automatically cover all drivers?
>
Which common layer code specifically? The dmabuf interface appears to
be the most central/common place to me.

> >> Also stepping back for a moment - is a new memory category really
> >> needed, versus perhaps attempting to charge the actual backing store
> >> memory to the correct client? (There might have been many past
> >> discussions on this so it's okay to point me towards something in the
> >> archives.)
> >>
> > Well the dmabuf counter for the stat file is really just a subcategory
> > of memory that is charged. Its existence is not related to getting the
> > charge attributed to the right process/cgroup. We do want to know how
> > much of the memory attributed to a process is for dmabufs, which is
> > the main point of this series.
>
> Then I am probably missing something because the statement how proposal
> is not intended to charge to the right process, but wants to know how
> much dmabuf "size" is attributed to a process, confuses me due a seeming
> contradiction. And the fact it would not be externally observable how
> much of the stats is accurate and how much is not (without knowing the
> implementation detail of which drivers implement charge transfer and
> when). Maybe I completely misunderstood the use case.
>
Hmm, did I clear this up above or no? The current proposal is for the
process causing the export of a buffer to be charged for it,
regardless of whatever happens afterwards. (Unless that process is
like gralloc on Android, in which case the charge is transferred from
gralloc to whoever called gralloc to allocate the buffer on their
behalf.)

> Regards,
>
> Tvrtko
