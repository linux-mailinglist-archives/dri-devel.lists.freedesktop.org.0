Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0793969B13
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 13:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDF0710E469;
	Tue,  3 Sep 2024 11:01:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="OGEpOjo7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2DB10E333
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:07:43 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42bbe908380so29946285e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 01:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1725350862; x=1725955662; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=eF/Q1l4P4AIs4Ghmv839+gvgnXfjxvafU64Put9I4Fo=;
 b=OGEpOjo7OTWXCoHyCfsDsOFkub8POGU/JL7sICX9eQx1eJGZtDTm9iuHanldoaiZmG
 E98Bbajsztvtlx3DugxLhWVEOlKnBsPVv4qkY7Mk8FZ5a8glji9/E8Dejo/ZbaJa/EH5
 24P/Hrg5MMY4rR6eC4nXxbJB61GUX9cMSfZoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725350862; x=1725955662;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eF/Q1l4P4AIs4Ghmv839+gvgnXfjxvafU64Put9I4Fo=;
 b=hpOxnMp+T4WSQMS84sHAAB7tyF3+Z9YcnwBL9F4sY5opyAbWxo3ucctM9IyRyKgIgU
 dMuxzpvJAd10GjuHmQ/c4PEW1xaeKf8PNoejwihK+eUs9tOG3jcen+erXDOq2CyfAKTi
 uTe86BIJtAGTadJF5jZ3vcBENvUe7vLXgHTYCVk5rqrDVI9ka+SfOnwsfHPswXvHHZj2
 R/EwX+hJcIyeMdoIFfM3Z8iqKvDb98+5TOGhPUfLZVvEr601fE/xUSXo/6dHE5MdYTau
 b7GpxOdq7Ao2xUy8WWxskz0E/lOjJOLq5fT4NTj9d2f+1HYx9CGtVwONM3VMoohssJc+
 7gWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTRUBUgavvp5EEOykRy7z7q4V31l0xbJyKibZQ97DJkM/nv4hoIxj7qea1orXibHCvitPEQZE09ZM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMf4BIEI9zM2U+uI0wPdTSjpqHBYghX5nYtK71jR5EXhCTT+ZN
 MdiEcwEwbh61yaOe2ZkLhkzVjJbKckaMfMeaRjUiz+cHJEo8kz96WHTchMGfYwc=
X-Google-Smtp-Source: AGHT+IFof7unLLrx3C7GNQNiHi/CC+JN7hTi3k8JW1nNfTf084hwjsWh+J8ZHoahXDnHKo6O6Ouqrw==
X-Received: by 2002:a05:600c:1c1a:b0:426:593c:935f with SMTP id
 5b1f17b1804b1-42bd731ee1bmr58766585e9.1.1725350861520; 
 Tue, 03 Sep 2024 01:07:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42bb6deb43esm163229725e9.7.2024.09.03.01.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 01:07:41 -0700 (PDT)
Date: Tue, 3 Sep 2024 10:07:38 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, matthew.auld@intel.com, daniel@ffwll.ch,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>
Subject: Re: [RFC PATCH 23/28] drm/xe: Add SVM VRAM migration
Message-ID: <ZtbDyrD0p-o8G7_d@phenom.ffwll.local>
References: <20240828024901.2582335-1-matthew.brost@intel.com>
 <20240828024901.2582335-24-matthew.brost@intel.com>
 <Zs9LF-jnNrd9ZlxW@phenom.ffwll.local>
 <cbe8aebe-fcad-4ff0-8f56-146628183fd3@amd.com>
 <368ee71bd5e39d4e26947de9cc417f4abe8d1f3b.camel@linux.intel.com>
 <ZtBVXjNf1xAQOHHR@phenom.ffwll.local>
 <ZtDyZceN6asCzSHT@DUT025-TGLU.fm.intel.com>
 <ZtW0N_p4KtiosN4J@phenom.ffwll.local>
 <ZtY6F7v/zIUnG6Kx@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtY6F7v/zIUnG6Kx@DUT025-TGLU.fm.intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 
X-Mailman-Approved-At: Tue, 03 Sep 2024 11:01:31 +0000
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

On Mon, Sep 02, 2024 at 10:20:07PM +0000, Matthew Brost wrote:
> On Mon, Sep 02, 2024 at 02:48:55PM +0200, Daniel Vetter wrote:
> > On Thu, Aug 29, 2024 at 10:12:53PM +0000, Matthew Brost wrote:
> > > On Thu, Aug 29, 2024 at 01:02:54PM +0200, Daniel Vetter wrote:
> > > > On Thu, Aug 29, 2024 at 11:53:58AM +0200, Thomas Hellström wrote:
> > > > > But as Sima pointed out in private communication, exhaustive eviction
> > > > > is not really needed for faulting to make (crawling) progress.
> > > > > Watermarks and VRAM trylock shrinking should suffice, since we're
> > > > > strictly only required to service a single gpu page granule at a time.
> > > > > 
> > > > > However, ordinary bo-based jobs would still like to be able to
> > > > > completely evict SVM vram. Whether that is important enough to strive
> > > > > for is ofc up for discussion.
> > > > 
> > > > My take is that you don't win anything for exhaustive eviction by having
> > > > the dma_resv somewhere in there for svm allocations. Roughly for split lru
> > > > world, where svm ignores bo/dma_resv:
> > > > 
> > > > When evicting vram from the ttm side we'll fairly switch between selecting
> > > > bo and throwing out svm pages. With drm_exec/ww_acquire_ctx selecting bo
> > > > will eventually succeed in vacuuming up everything (with a few retries
> > > > perhaps, if we're not yet at the head of the ww ticket queue).
> > > > 
> > > > svm pages we need to try to evict anyway - there's no guarantee, becaue
> > > > the core mm might be holding temporary page references (which block
> > > 
> > > Yea, but think you can could kill the app then - not suggesting we
> > > should but could. To me this is akin to a CPU fault and not being able
> > > to migrate the device pages - the migration layer doc says when this
> > > happens kick this to user space and segfault the app.
> > > 
> > > My last patch in the series adds some asserts to see if this ever
> > > happens, thus far never. If it occurs we could gracefully handle it by
> > > aborting the migration I guess... I think the user really needs to
> > > something a bit crazy to trigger this condition - I don't think the core
> > > randomly grabs refs to device pages but could be wrong.
> > 
> > I think it does :-/
> > 
> > If you read do_swap_page around ->migrate_to_ram:
> > 
> > 
> > 	get_page(vmf->page);
> > 	pte_unmap_unlock(vmf->pte, vmf->ptl);
> > 	ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> > 	put_page(vmf->page);
> > 
> 
> Yep, I've seen this show in some of local rework getting MREMAP working.
> The common case is I have test with 2M mapping which I call MREMAP on
> and then immediately read from the new mapping (the one from MREMAP).
> Since a MREMAP results in a UNMAP notifier event one of the possible
> solutions I have just evict the VRAM via drm_gpusvm_evict_to_sram upon
> the UNMAP event. This case race with fault from the user space so the
> evict only moves 511 of the pages while the CPU fault moves 1 page. This
> actually seems to be fine though as the entire VRAM allocation is
> migrated.

There's also MREMAP_DONTUNMAP for added fun. So you cannot rely on the
unmap happening I think.

> > Also the migrate code itself does lock pages. So unless we toss in
> > additional locking on top of what core mm does (which I think should be
> > enough to cover migration), migrations will temporarily fail. And this is
> > just for multiple threads trying to get the same page back to sram, which
> > I think is a case we should support because the application did nothing
> > wrong.
> 
> Yes, I think I've mentioned this already. Multiple CPU faults from
> different threads targeting the same range / allocation can race but
> again this actually seems fine too. Each thread gets a semi-random set
> of VRAM pages which it migrates but again the end result the entire
> VRAM allocation is migrated after all racing faults are serviced. I
> think the only guarantee when CPU faults race is the faulting page per
> each thread is migrated in that thread.
> 
> I have threaded test which hammers reads on a single 2M migration which
> checks every 4k page's data integrity that passes reliably. Working on
> updated this to fork version now too.
> 
> > 
> > > > migration) or have the page locked (which also block the migration). But
> > > > as long as those two steps succeed, we'll win and get the pages. There
> > > > might be some thrashing against concurrent svm faults stealing them again,
> > > > but they have a disadvantage since they can't steal dma_resv_locked bo.
> > > > And if it's still too much we can stall them in the page allocator.
> > > > 
> > > > So it's not entirely reliable, but should be close enough.
> > > > 
> > > > Now for bo based svm the picture isn't any different, because holding
> > > > dma_resv is not actually enough to migrate svm mappings. We still need to
> > > > hope there's no temporary page references around, and we still need to
> > > > succeed at locking the page. And the migration code only does trylocks,
> > > > because that's it's deadlock prevent algorithm if different migrations
> > > > needing the same set of pages, but acquiring them in a different order. So
> > > > we win nothing.
> > > 
> > > Ok, maybe my statement above is false...
> > > 
> > > Wouldn't be the only time this falls is if another migration is in
> > > flight (e.g. CPU fault) and they race? Then the eviction will naturally
> > > happen via refcount being dropped from the other migration. I guess I
> > > likely need to update my eviction code to not free the TTM resource if
> > > all pages are not migrated.
> > 
> > Yeah. And additionally core mm relies on some amount of Good Luck here,
> > plus the assumption that at least falling back to a single page/folio will
> > work out. At least eventually ...
> > 
> > The trouble is if your design assumes you can migrate an entire block,
> > because then if threads hammer that range in different orders you'll never
> > make forward progress. Because the core mm code doesn't have a fancy ww
> > locking scheme to get out of this, but only uses trylock, plus the
> > assumption that falling back to a single page will work out eventually.
> > 
> 
> Hmm, see above. I think forward progess is made unless I'm completely
> missing something. 
> 
> > Wrt TTM resource refcounting, I think that all looks ok. But maybe I
> > checked the wrong things.
> > 
> > > > Worse, if dma_resv does actually hold up svm migration and reclaim, then
> > > > we potentially deadlock because that lock is for a bigger range than
> > > > individual pages (or folios). And the core mm assumes that it can get out
> > > > of a deadlock bind by (at least stochastically) eventually succeeding in
> > > > acquiring/locking down a single page.
> > > > 
> > > > This means we cannot use dma_resv tricks to give the ttm world an
> > > > advantage in exhaustive eviction against concurrent svm faults. Or at
> > > > least not more than we can do without by just stalling svm faults that
> > > > need to allocate gpu memory (but that must happen without holding locks or
> > > > we're busted).
> > > > 
> > > 
> > > I'm a little lost here on the deadlock case. Do you mean when we try to
> > > evict SVM BO we trigger reclaim by allocating system pages and can
> > > deadlock? Doesn't TTM already have this dependency when evicting non-SVM
> > > BOs?
> > 
> > So you can have multiple cpu threads hammering a given svm range. And
> > thanks to the lols of mremap and fork each of them can have a different
> > view of that range (they are all obviously different processes from the
> > one that has created the gpusvm binding). And if you try to migrate, they
> > might all grab the pages in different orders, which can deadlock.
> > 
> 
> Yes, grabbing locks in different orders would be bad and that could
> deadlock. But I don't that that will happen, even with a range lock I
> believe I have this working as the range in zdd is pointing the
> originally allocated range. The MM and start / end can be wrong (with
> fork / mremap) so that has to worked around which isn't ideal. If zdd or
> vram allocation has the lock and we remove the range from migration view
> this conceptually makes more sense which kinda where I'm trending if we
> agree to roughly keep what I have in place at least initially.
> 
> Touch on this here too [1].
> 
> [1] https://patchwork.freedesktop.org/patch/610957/?series=137870&rev=1#comment_1112527 

So I think there's multiple scenarios:

- You use your mmap_write hack, and don't have forks. There's only one
  migration ever, the write mmap lock will block any concurrent faults. No
  troubles.

- With the migration_mutex, at least how I understand the amdgpu design I
  think there can be trouble, if you throw enough threads at the issue.

  1. Lots of threads fault on different pages in the same range. They all
  grap a page reference from do_swap_page around calling ->migrate_to_ram.

  2. First thing they do is mutex_lock(range->migration_mutex). That
  serializes everything. It also means that the other threads will not
  wait on the migration pte, because that's not visible outside of holding
  the migration_mutex, instead they pile up against that lock. So you have
  pages in that range you cannot migrate, and you need partial migration
  support or you're stuck.

  Unless you force a full eviction for anything partially migrated before
  you try to handle gpu faults, you also need to handle partial migrations
  on the fault side or things won't make forward progress. As soon as you
  allow faults to fully race with migrate_to_ram (with or without
  migration_mutex) you need to support partial migration state because the
  gpu fault side is not in any way better at winning races than the cpu
  fault migration.

  Or you fall back to sram, but for "must be in vram" memory that's not
  going to work too well.

- Next up is migration_mutex with partial migrations, but instead of
  threads hammering different pages in parallel, they hammer the same page
  in parallel. They will all pile up in the mutex_lock(migration_mutex),
  because the migration pte is never visible outside of that lock. And the
  migration won't ever work, because there's other threads that have an
  elevated page reference.

  You can fix that by making the migration_mutex a trylock. At that point
  you've pretty much exactly reinvented the page lock semantics, except
  the lock is for a pile of pages instead of each individually.

  If you're not yet seeing this I think there's not yet ennough concurrent
  faulting in your tests going on. And this is a legit use case:
  1. allocate range, move it to gpu
  2. do stuff on gpu
  3. when gpu finishes a thundering herd of cpu threads want to look at
  the result

  Note that even the trylock isn't good enough, because there's a window
  between when do_swap_page elevates the page refcount and when we
  trylock. But if we _only_ use the page lock we could move that trylock
  into do_swap_page, while we hold the cpu pagetable lock, which would
  close the race. Cpu threads that lost the race will simply busy-loop for
  a bit until the migration pte is installed, at which point they'll block
  and wait for the migration to finish.

So I think even if we limit us to legit use-cases the migration_mutex (or
any other physical storage lock that's not the page lock) will just get in
the way eventually. And the core mm page lock really should be enough to
make sure migration doesn't race.

> > That's why there's so much retrying and also why core mm only does trylock
> > on pages if it grabs an entire pile.
> > 
> > Now if you have a lock that nests within the page lock you need to trylock
> > it, or it deadlocks. Which kinda defeats the point of having a bigger lock
> > and moving the entire bo as a unit.
> > 
> > But if that is outside of the page lock (like amdgpu), you still have the
> > issue of the elevated page reference from do_swap_page. Which also blocks
> > migration.
> > 
> 
> See above, it doesn't actually block migration as each thread still make
> forward progress and collectively all complete the migration, at least
> that is what I'm observing.
> 
> > Note that neither is a hard deadlock, as in lockdep complaints, because
> > they're all retrying anyway. They're more like lifelocks, and the bigger
> > your pile of pages the more likely that you'll always have a failed page
> > and need to abort and retry. Which results in threads spinning forever.
> > 
> > > > So the only benefit I'm seeing is the unified lru, which I'm not sure is
> > > > worth it. There's also a bit a lru design tension here, because for the bo
> > > 
> > > Well also not rewriting the world...
> > 
> > Yeah it's tough. I'm still at the "understanding all the tradeoffs" stage,
> > just to make that clear.
> 
> That's basically where I'm at too. Trying balance between simple as
> possible vs. dream solution. Wrote this series fairly quickly to what I
> could get working and help me understand how all of this works. 
> 
> I've also said this a few time throughout my replies, also really want
> UMD / application data to help understand how SVM will be used too. Feel
> like that information will also help determine some design choices (e.g.
> what to optimize for).

My thinking is a bit different: ttm bo world is from a lot of semantics
fundamentally at odds with core mm. And I didn't realize this fully until
this recent thread, but migrate_device.c and hmm.c really inflict most of
the bonkers "we love all the races" mm semantics onto drivers. Which means
we have a huge semantic design conflict, and the question is where should
we solve it. There's a range, but the two extremes are roughly:

- Try to make svm look as much as possible as the bo+userptr world. This
  means lots of tensions within our code, and the risk that we design
  ourselves into a corner we cannot fix. Like we cannot trylock the
  range->migration_mutex while holding cpu pagetables in do_swap_page, so
  we'd need a different fix for that, and I haven't come up with one yet.

- Just adopt core mm design, and end up with a bunch of duplicated code.
  This means tension between these two worlds, but there's a clear design
  to address that from core mm (shrinkers for ttm bo, page reclaim for
  svm, running in a loop applying equal eviction pressure to both). So
  much cleaner separation, and really well structured interaction between
  the two worlds like we have on the igpu side already for managing sram.
  But it comes at the cost of more code.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
