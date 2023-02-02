Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C2D688AFA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 00:43:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D8210E029;
	Thu,  2 Feb 2023 23:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [IPv6:2607:f8b0:4864:20::b33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D973310E029
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 23:43:46 +0000 (UTC)
Received: by mail-yb1-xb33.google.com with SMTP id o187so4369919ybg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 15:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ROLmwHYSDqJBPq7kKPGInXQpf4bK7pKmctUiXQuVxpE=;
 b=IMOn/NDdDEtKwzAbMi24+YFOQizkczfiaUuKHfOe1zCEgsIz7EJYQOoAw6W1GyLD8q
 BXdJrRYSQMe5r3Je/3ysqvnOcKjUSd3T56lPrJ+zok14k/mqVuu6L/GkMhXJnfYEoHCw
 dKpSYlAMNpSUEUNhhMrsRRqLkbGCuUlUC7Uoi/fnCv3Bv99kEyeGCecwyttn6is9CCbO
 ezUdusWQQ0MaZ0VP0Vl0bEKWKxv6aiwJneFc8RFVZFlCNJIv65CuGZ1BaRz55dnvyf9p
 sR+3gDs7WYthOCzj6swBJFNOG35AtgQ/0hTsI5Rr8GLPiAxzHDwXK1DY90T8CnejNOcI
 bk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ROLmwHYSDqJBPq7kKPGInXQpf4bK7pKmctUiXQuVxpE=;
 b=W4hTmyFIV4tCu9FtO+MXM4wukEYF17pDPVAnYNlnXM7DOuwjicdL6DC2IbVOUfi0es
 /Gw044aPLfdcEh4bU16wNmj01rBM9waQ/T3xfQA/uM7S58+93gQRxaQL865sF1SXbQOQ
 7gauT3xnVlhRc89HSlAgg3O1PS+qAOncd6ZeFn5DmncLNRrkK2bnN23ePlT/9dbRwyif
 AqymNlDaAjxVDqEA5/ZDG/DvYG9YgZvoLjNL3Ibo9C5P+K4cUB0OIGeDomfK8750kkY0
 gR1+f9Qrr8YoPU+oKN1ecJYGaEWfha4iIJ9YQlxB3c8//3hPbSu0N3uNzhQ8WNaVPbxD
 aCIg==
X-Gm-Message-State: AO0yUKVZg35eavzpSqf2O/2lwYQ6VVH7Rlj33JSD8wISh/qv5mjvE1vT
 vH9bt25mwUJlIHVrCWL2jE0bFXYFYoItdi+QtHMOPQ==
X-Google-Smtp-Source: AK7set8cEm/nKNanmYPqrmUPS66SPoAM5OhCZT8NT/l3HP5rCs7P9r9NDPVyrtBDrQUCo5SbvppxcgeooS+IVENEFyw=
X-Received: by 2002:a5b:80b:0:b0:869:6b48:a71d with SMTP id
 x11-20020a5b080b000000b008696b48a71dmr52188ybp.117.1675381425724; Thu, 02 Feb
 2023 15:43:45 -0800 (PST)
MIME-Version: 1.0
References: <20230123191728.2928839-1-tjmercier@google.com>
 <20230123191728.2928839-2-tjmercier@google.com>
 <Y8/ybgp2FW+e3bjc@dhcp22.suse.cz>
 <20230124194628.d44rtcfsv23fndxw@google.com> <Y9EX+usSpAjZ/8LS@dhcp22.suse.cz>
 <347560bc-d06a-92b7-8003-133d2b8af2df@linux.intel.com>
 <CABdmKX09S3bYzX+xBkhfkFULk2BtzS11RhzrvWv94j+cHSezPA@mail.gmail.com>
 <ad6bd448-91bd-d47e-5b54-8755fe0e0340@linux.intel.com>
 <CABdmKX3VSdF3jmktpw9VH4k+J+ZtQCLCPdNN6uye4XnZGPhG5g@mail.gmail.com>
 <15adf130-61f7-2423-2a48-883e611e3304@linux.intel.com>
In-Reply-To: <15adf130-61f7-2423-2a48-883e611e3304@linux.intel.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 2 Feb 2023 15:43:34 -0800
Message-ID: <CABdmKX181c21dbFGR+F=n_tF1MUeNPhXZXTNkAcW5FNRcLfxaQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] memcg: Track exported dma-buffers
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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

On Wed, Feb 1, 2023 at 6:23 AM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 01/02/2023 01:49, T.J. Mercier wrote:
> > On Tue, Jan 31, 2023 at 6:01 AM Tvrtko Ursulin
> > <tvrtko.ursulin@linux.intel.com> wrote:
> >>
> >>
> >> On 25/01/2023 20:04, T.J. Mercier wrote:
> >>> On Wed, Jan 25, 2023 at 9:31 AM Tvrtko Ursulin
> >>> <tvrtko.ursulin@linux.intel.com> wrote:
> >>>>
> >>>>
> >>>> Hi,
> >>>>
> >>>> On 25/01/2023 11:52, Michal Hocko wrote:
> >>>>> On Tue 24-01-23 19:46:28, Shakeel Butt wrote:
> >>>>>> On Tue, Jan 24, 2023 at 03:59:58PM +0100, Michal Hocko wrote:
> >>>>>>> On Mon 23-01-23 19:17:23, T.J. Mercier wrote:
> >>>>>>>> When a buffer is exported to userspace, use memcg to attribute t=
he
> >>>>>>>> buffer to the allocating cgroup until all buffer references are
> >>>>>>>> released.
> >>>>>>>
> >>>>>>> Is there any reason why this memory cannot be charged during the
> >>>>>>> allocation (__GFP_ACCOUNT used)?
> >>>>>>> Also you do charge and account the memory but underlying pages do=
 not
> >>>>>>> know about their memcg (this is normally done with commit_charge =
for
> >>>>>>> user mapped pages). This would become a problem if the memory is
> >>>>>>> migrated for example.
> >>>>>>
> >>>>>> I don't think this is movable memory.
> >>>>>>
> >>>>>>> This also means that you have to maintain memcg
> >>>>>>> reference outside of the memcg proper which is not really nice ei=
ther.
> >>>>>>> This mimicks tcp kmem limit implementation which I really have to=
 say I
> >>>>>>> am not a great fan of and this pattern shouldn't be coppied.
> >>>>>>>
> >>>>>>
> >>>>>> I think we should keep the discussion on technical merits instead =
of
> >>>>>> personal perference. To me using skmem like interface is totally f=
ine
> >>>>>> but the pros/cons need to be very explicit and the clear reasons t=
o
> >>>>>> select that option should be included.
> >>>>>
> >>>>> I do agree with that. I didn't want sound to be personal wrt tcp km=
em
> >>>>> accounting but the overall code maintenance cost is higher because
> >>>>> of how tcp take on accounting differs from anything else in the mem=
cg
> >>>>> proper. I would prefer to not grow another example like that.
> >>>>>
> >>>>>> To me there are two options:
> >>>>>>
> >>>>>> 1. Using skmem like interface as this patch series:
> >>>>>>
> >>>>>> The main pros of this option is that it is very simple. Let me lis=
t down
> >>>>>> the cons of this approach:
> >>>>>>
> >>>>>> a. There is time window between the actual memory allocation/free =
and
> >>>>>> the charge and uncharge and [un]charge happen when the whole memor=
y is
> >>>>>> allocated or freed. I think for the charge path that might not be =
a big
> >>>>>> issue but on the uncharge, this can cause issues. The application =
and
> >>>>>> the potential shrinkers have freed some of this dmabuf memory but =
until
> >>>>>> the whole dmabuf is freed, the memcg uncharge will not happen. Thi=
s can
> >>>>>> consequences on reclaim and oom behavior of the application.
> >>>>>>
> >>>>>> b. Due to the usage model i.e. a central daemon allocating the dma=
buf
> >>>>>> memory upfront, there is a requirement to have a memcg charge tran=
sfer
> >>>>>> functionality to transfer the charge from the central daemon to th=
e
> >>>>>> client applications. This does introduce complexity and avenues of=
 weird
> >>>>>> reclaim and oom behavior.
> >>>>>>
> >>>>>>
> >>>>>> 2. Allocate and charge the memory on page fault by actual user
> >>>>>>
> >>>>>> In this approach, the memory is not allocated upfront by the centr=
al
> >>>>>> daemon but rather on the page fault by the client application and =
the
> >>>>>> memcg charge happen at the same time.
> >>>>>>
> >>>>>> The only cons I can think of is this approach is more involved and=
 may
> >>>>>> need some clever tricks to track the page on the free patch i.e. w=
e to
> >>>>>> decrement the dmabuf memcg stat on free path. Maybe a page flag.
> >>>>>>
> >>>>>> The pros of this approach is there is no need have a charge transf=
er
> >>>>>> functionality and the charge/uncharge being closely tied to the ac=
tual
> >>>>>> memory allocation and free.
> >>>>>>
> >>>>>> Personally I would prefer the second approach but I don't want to =
just
> >>>>>> block this work if the dmabuf folks are ok with the cons mentioned=
 of
> >>>>>> the first approach.
> >>>>>
> >>>>> I am not familiar with dmabuf internals to judge complexity on thei=
r end
> >>>>> but I fully agree that charge-when-used is much more easier to reas=
on
> >>>>> about and it should have less subtle surprises.
> >>>>
> >>>> Disclaimer that I don't seem to see patches 3&4 on dri-devel so mayb=
e I
> >>>> am missing something, but in principle yes, I agree that the 2nd opt=
ion
> >>>> (charge the user, not exporter) should be preferred. Thing being tha=
t at
> >>>> export time there may not be any backing store allocated, plus if th=
e
> >>>> series is restricting the charge transfer to just Android clients th=
en
> >>>> it seems it has the potential to miss many other use cases. At least
> >>>> needs to outline a description on how the feature will be useful out=
side
> >>>> Android.
> >>>>
> >>> There is no restriction like that. It's available to anybody who want=
s
> >>> to call dma_buf_charge_transfer if they actually have a need for that=
,
> >>> which I don't really expect to be common since most users/owners of
> >>> the buffers will be the ones causing the export in the first place.
> >>> It's just not like that on Android with the extra allocator process i=
n
> >>> the middle most of the time.
> >>
> >> Yeah I used the wrong term "restrict", apologies. What I meant was, if
> >> the idea was to allow spotting memory leaks, with the charge transfer
> >> being optional and in the series only wired up for Android Binder, the=
n
> >> it obviously only fully works for that one case. So a step back..
> >>
> > Oh, spotting kernel memory leaks is a side-benefit of accounting
> > kernel-only buffers in the root cgroup. The primary goal is to
> > attribute buffers to applications that originated them (via
> > per-application cgroups) simply for accounting purposes. Buffers are
> > using memory on the system, and we want to know who created them and
> > how much memory is used. That information is/will no longer available
> > with the recent deprecation of the dmabuf sysfs statistics.
> >
> >> .. For instance, it is not feasible to transfer the charge when dmabuf
> >> is attached, or imported? That would attribute the usage to the
> >> user/importer so give better visibility on who is actually causing the
> >> memory leak.
> >>
> > Instead of accounting at export, we could account at attach. That just
> > turns out not to be very useful when the majority of our
> > heap-allocated buffers don't have attachments at any particular point
> > in time. :\ But again it's less about leaks and more about knowing
> > which buffers exist in the first place.
> >
> >> Further more, if above is feasible, then could it also be implemented =
in
> >> the common layer so it would automatically cover all drivers?
> >>
> > Which common layer code specifically? The dmabuf interface appears to
> > be the most central/common place to me.
>
> Yes, I meant dma_buf_attach / detach. More below.
> >>>> Also stepping back for a moment - is a new memory category really
> >>>> needed, versus perhaps attempting to charge the actual backing store
> >>>> memory to the correct client? (There might have been many past
> >>>> discussions on this so it's okay to point me towards something in th=
e
> >>>> archives.)
> >>>>
> >>> Well the dmabuf counter for the stat file is really just a subcategor=
y
> >>> of memory that is charged. Its existence is not related to getting th=
e
> >>> charge attributed to the right process/cgroup. We do want to know how
> >>> much of the memory attributed to a process is for dmabufs, which is
> >>> the main point of this series.
> >>
> >> Then I am probably missing something because the statement how proposa=
l
> >> is not intended to charge to the right process, but wants to know how
> >> much dmabuf "size" is attributed to a process, confuses me due a seemi=
ng
> >> contradiction. And the fact it would not be externally observable how
> >> much of the stats is accurate and how much is not (without knowing the
> >> implementation detail of which drivers implement charge transfer and
> >> when). Maybe I completely misunderstood the use case.
> >>
> > Hmm, did I clear this up above or no? The current proposal is for the
> > process causing the export of a buffer to be charged for it,
> > regardless of whatever happens afterwards. (Unless that process is
> > like gralloc on Android, in which case the charge is transferred from
> > gralloc to whoever called gralloc to allocate the buffer on their
> > behalf.)
>
> Main problem for me is that charging at export time has no relation to me=
mory used. But I am not familiar with the memcg counters to know if any oth=
er counter sets that same precedent. If all other are about real memory use=
 then IMO this does not fit that well. I mean specifically this:
>
> +         dmabuf (npn)
> +               Amount of memory used for exported DMA buffers allocated =
by the cgroup.
> +               Stays with the allocating cgroup regardless of how the bu=
ffer is shared.
> +
>
> I think that "Amount of memory used for exported..." is not correct. As i=
mplemented it is more akin the virtual address space size in the cpu space =
- it can have no relation to the actual usage since backing store is not al=
located until the attachment is made.
>
> Then also this:
>
> @@ -446,6 +447,8 @@ struct dma_buf {
>                 struct dma_buf *dmabuf;
>         } *sysfs_entry;
>   #endif
> +       /* The cgroup to which this buffer is currently attributed */
> +       struct mem_cgroup *memcg;
>   };
>
> Does not conceptually fit in my mind. Dmabufs are not associated with one=
 cgroup at a time.
>
It's true that a dmabuf could be shared among processes in different
cgroups, but this refers to the one that's charged for it. Similar to
how the shmem pages that back memfds which can be similarly shared get
charged to the first cgroup that touches each page, here it's the
entire buffer instead of each individual page. Maybe it'd be possible
to charge whoever attaches / maps first, but I have to point out
there'd be a gap between then and export where we'd have no accounting
of the memory for cases where pages actually do get allocated during
export (like in the system_heap).

> So if you would place tracking into dma_buf_attach/detach you would be ab=
le to charge to correct cgroup regardless of a driver and since by contract=
 at this stage there is backing store, the reflected memory usage counter w=
ould be truthful.
>
> But then you state a problem, that majority of the time there are no atta=
chments in your setup, and you also say the proposal is not so much about l=
eaks but more about knowing what is exported.
>
> In this case you could additionally track that via dma_buf_getfile / dma_=
buf_file_release as a separate category like dmabuf-exported? But again, I =
personally don't know if such "may not really be using memory" counters fit=
 in memcg.
>
> (Hm you'd probably still need dmabuf->export_memcg to store who was the o=
riginal caller of dma_buf_getfile, in case last reference is dropped from a=
 different process/context. Even dmabuf->attach_memcg for attach/detach to =
work correctly for the same reason.)
>
> Regards,
>
> Tvrtko
