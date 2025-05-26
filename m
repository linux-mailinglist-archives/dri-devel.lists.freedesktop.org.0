Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB54AC4538
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 00:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885A810E440;
	Mon, 26 May 2025 22:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QQxCtQ9E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9332810E454
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 22:30:35 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ad51ef2424bso530664466b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 May 2025 15:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748298634; x=1748903434; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Mnlpqdqg1ATa19nfUGxO9pq5QknDaAKLueAoG4lACFo=;
 b=QQxCtQ9EuNvxl+2pjuAlcbHdWD/sWz//SB2GnmhAwBAJGmvKVV10iiFA1A8l6wu+ra
 adyz+3i7fezTMhBsa5j1yn0ZB/R/FP+MF/TLLufVjJAURExuqgw8pPPJp5c3O5qiUDCO
 /+Wo3vc9HmKSzn6+9UEBHgRb0YKKjg+A9ytT+MVmeAUFL6PhHavEDpp5NPqTmvcVGRcW
 xT62MN+FREwMHo3k84SxuqrV15+Re73vTmuUegDDMfGe/ZO1vHsDuiX4wMjh3b9hFk6X
 90jc3ejGQFSuz5o/prS0vLE78oNScyGkZvIlPmdHORie8TVubPXmbHyPIXmz0kMdqyYF
 3/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748298634; x=1748903434;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mnlpqdqg1ATa19nfUGxO9pq5QknDaAKLueAoG4lACFo=;
 b=HDh6LuYzCqpWCETvFIUoV3NJWhFXzYhQMhhk4BGeqORxNBxmY0f7oCq156iA6wvwo2
 dMHHgzr+AAvntB3x+ctTuoccxr85TUCfT2dOWlMl8PULOlEGAQxeAeTUQGteiqDKo+H/
 JB7BsB6KKcQix147+Ea8cRqmqQ8vRLJr2pRzGUBUlA3zcIh9IHdzpG3dKbvntfE/Ephm
 9UYaukhDygjtkSULnRJUM9R5cu8/jQbqHFqxfLNk+UwOuKtrUijzBXkc726zgrFOBx4o
 a3vDjBMl+IPxp/Qp9rtD/AtoRcE7QBmmM/iQ3PSBRXKugOabjdVdOVbFtsTddHdxRTsO
 c3tQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/nFiWdwqOTIO1vLd2LgwuRN7s5jWTssj0ELIVhG64mKazcMZEx4tPXHlTi91Qv0wjLRqZwcSFXOk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXkmxkf2vIPCKF7r7R6zTcepQDnJkIc1dejVwLswJu6KahtBTG
 n/L1EMcL+XqqTUmL6bQVK+zJ1OF6OZSPX09ZO9ES8vo6pEWHsUO0FO4QR3D13sUhtSBUiMg5OJ+
 aMovHCr539hIz+rlF/unktDUNLorNjO0=
X-Gm-Gg: ASbGncsM3xhpKefMnCQhnYLvFjo8s/naLc1trHiOo4sRarZ/L2WULKoxxikHQqZohl4
 XTf5SgfrUB40yV/xRzmimB40hGv9iWySfJP47LdNiVB/F2hyBRynIa9UeYFIalDY8CTlJt2kDAC
 u+gdISscW5NZPsu/8H6DdtVLYFyzbxx4CMEbQVNqVrLg==
X-Google-Smtp-Source: AGHT+IEBFz39c6SWGp8GpVV0dcX99+COyta/ER9KGZNUBNOh8IvcWio/kFIl2Akmfon9zDxTGqNaq3MCsWv7cNDRxsU=
X-Received: by 2002:a17:906:99c2:b0:ad2:4144:2329 with SMTP id
 a640c23a62f3a-ad85b1205c3mr970343466b.7.1748298633527; Mon, 26 May 2025
 15:30:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tyJgHPp5N6XpauFRL1hZDLCG8L+9Gmi7RCLRaK4BN4tzA@mail.gmail.com>
 <aDTmUw-CQYuZ1THd@dread.disaster.area>
In-Reply-To: <aDTmUw-CQYuZ1THd@dread.disaster.area>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 27 May 2025 08:30:22 +1000
X-Gm-Features: AX0GCFtxh8ehm51W-r3isSLvl0UJfOjefxToxyn7LjTvMxJ4CnkigsUehs7Td6E
Message-ID: <CAPM=9txBdeJmAhZb1XW=3m-uxPxfDdQgb=PCBvssoJkQQDAdFw@mail.gmail.com>
Subject: Re: list_lru operation for new child memcg?
To: Dave Chinner <david@fromorbit.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "Koenig, Christian" <Christian.Koenig@amd.com>, kasong@tencent.com,
 nphamcs@gmail.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 27 May 2025 at 08:08, Dave Chinner <david@fromorbit.com> wrote:
>
> On Tue, May 27, 2025 at 06:32:30AM +1000, Dave Airlie wrote:
> > Hey all,
> >
> > Hope someone here can help me work this out, I've been studying
> > list_lru a bit this week for possible use in the GPU driver memory
> > pool code.
> >
> > I understand that when a cgroup goes away, it's lru resources get
> > reparented into the parent resource, however I'm wondering about
> > operation in the opposite direction and whether this is possible or
> > something we'd like to add.
>
> It's possible, but you need to write the code yourself.
>
> You might want to look at the zswap code, it has a memcg-aware
> global object LRU that charges individual entries to the memcg that
> use space in the pool.
>
> > Scenario:
> > 1. Toplevel cgroup - empty LRU
> > 2. Child cgroup A created, adds a bunch of special pages to the LRU
> > 3. Child cgroup A dies, pages in lru list get reparented to toplevel cgroup
> > 4. Child cgroup B created. Now if B wants to get special pages from
> > the pool, is it possible for B to get access to the LRU from the
> > toplevel cgroup automatically?
> >
> > Ideally B would takes pages from the
> > parent LRU, and put them back into it's LRU, and then reuse the ones
> > from it's LRU, and only finally allocate new special pages once it has
> > none and the parent cgroup has none as well.
>
> The list_lru has nothing to do with what context gets a new
> reference to the objects on the LRU. This is something that your
> pool object lookup/allocation interface would do.
>
> If your lookup interface is cgroup aware, it can look up the parent,
> search it's pool and dequeue from the LRU via:
>
>         parent_memcg = parent_mem_cgroup(child_memcg);
>         <lookup object>
>         list_lru_del(<object> ..., parent_memcg);
>
> parent_memcg). When the child is done with it, it can add it back to
> it's own LRU via:
>
>         list_lru_add(...., child_memcg).

Thanks Dave,

So this seems like something that would need to recurse up to the root
cgroup, which makes me wonder if generic code could/should provide it.

list_lru_walk_node already does a bit of policy here, where it walks
the non-memcg lru, then walks the per-memcg ones,

I kinda need that but in reverse, where it walks the memcg, then its
ancestors, then the non-memcg lru, just wondering if that makes sense
in common code like list_lru_walk_node does?

>
> > I'm just not seeing where the code for 4 happens, but I'm not fully
> > across this all yet either,
>
> You won't find it, because it doesn't do 4) at all - that's consumer
> side functionality, not generic functionality. If you want to have a
> pool that is owned by a parent memcg and charge/track it to a child
> memcg on allocation, then you need to write the pool management code
> that performs this management. The APIs are there to build this sort
> of thing, but it's not generic functionality the list_lru provides.

I have the pool bits, just wasn't sure how generic the code to
traverse the memcg lrus from the child to the root to see if any level
has some pages in it's lru. I can write it in the consumer, but I do
think it's quite like list_lru_walk_node just with a different
allocation strategy.

Dave.
