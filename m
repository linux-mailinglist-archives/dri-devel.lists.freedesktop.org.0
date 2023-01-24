Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3945867A34E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 20:46:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E737910E0EB;
	Tue, 24 Jan 2023 19:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B406C10E0EB
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 19:46:31 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 p51-20020a056a0026f300b0058df209da03so7236141pfw.15
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jan 2023 11:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=/GyNyIeeVhsFfDVzo3Uv5K6TJGpkGDF80R1/yVGfsGs=;
 b=s+S6NvStNDfxmLH+7HdkNoMxBGNFu15nS1JbU3o7kKshlx447vodpqXHX0di6WuhDZ
 a1MO4rwyUgw2LrSCtGq08zPjHV51A98+yZHCXgSTngUgV4XXVXDeDPcjG7CuFBAKTuAR
 kTHeE5yNP/OikYuovflyL/aEcJ+JOgjIm+SFfej2Z5ILJ8d5oy9l9Ll/yZqUaJp+iWXi
 DD5HNZQ0qbq4VEtW0G8okZMv8molLKQ44+tNH1Nu8KJ7B9jWjxkED24jWjgeRCFRcQ8I
 izZ99IapQOypOy9ZAzpJglu0Rf0PFoxX1xa78gNX6tsRtckWTeEuw1Q3Oze2b7gqQYar
 JRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/GyNyIeeVhsFfDVzo3Uv5K6TJGpkGDF80R1/yVGfsGs=;
 b=fy1ouFdf95iXQ3rx7Q15Vc3WJ06aoIVh20vFY0O0UpQ0xmCrKzDtp/SuKLo6Clby89
 eL0hkSqoe93GdZovkpfNppDayFrLw7FGge3KsXH8+EVMiVe1w3ATdMEQ9Q3m0CCagL0a
 AC+VpCaloZrXsi7VZmWHjMWJg0dcdlyV+nIygWxBv9QpCz9Eh8EPUcfr4xJwPfu/+P0H
 ZjKXM5uOUhkjNbxR6v/WotnZb4taeDzArbrweUWdTymiIMupxbIfvjxcg1u0ci4HwDm7
 AeT8JEbbDpHpOGM4KJUNwYTe5GLNTiMKt+v/KaVMTxBh5j+mjh9izmVSjJtqrjv5Izje
 TYCw==
X-Gm-Message-State: AFqh2krjdhvN2i5rGxBcA81/Gqk5sFZ+Amn7EQIuo+F3eUUxxFRYo7eD
 NVP4ItM/61DYSyoQFl0RuRWKvjUOfbUolg==
X-Google-Smtp-Source: AMrXdXukkwsl/ioqg+fD35BqMTHaPjz5qGGy0gbqkxllMlQZ94JVGByIXE/sjuoEMUouo8MXOIoUEVSlfpldQQ==
X-Received: from shakeelb.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:262e])
 (user=shakeelb job=sendgmr) by 2002:a62:30c7:0:b0:58d:af10:5831 with SMTP id
 w190-20020a6230c7000000b0058daf105831mr2987930pfw.24.1674589591181; Tue, 24
 Jan 2023 11:46:31 -0800 (PST)
Date: Tue, 24 Jan 2023 19:46:28 +0000
In-Reply-To: <Y8/ybgp2FW+e3bjc@dhcp22.suse.cz>
Mime-Version: 1.0
References: <20230123191728.2928839-1-tjmercier@google.com>
 <20230123191728.2928839-2-tjmercier@google.com>
 <Y8/ybgp2FW+e3bjc@dhcp22.suse.cz>
Message-ID: <20230124194628.d44rtcfsv23fndxw@google.com>
Subject: Re: [PATCH v2 1/4] memcg: Track exported dma-buffers
From: Shakeel Butt <shakeelb@google.com>
To: Michal Hocko <mhocko@suse.com>
Content-Type: text/plain; charset="us-ascii"
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
 linaro-mm-sig@lists.linaro.org, cgroups@vger.kernel.org,
 "T.J. Mercier" <tjmercier@google.com>, Muchun Song <muchun.song@linux.dev>,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 24, 2023 at 03:59:58PM +0100, Michal Hocko wrote:
> On Mon 23-01-23 19:17:23, T.J. Mercier wrote:
> > When a buffer is exported to userspace, use memcg to attribute the
> > buffer to the allocating cgroup until all buffer references are
> > released.
> 
> Is there any reason why this memory cannot be charged during the
> allocation (__GFP_ACCOUNT used)?
> Also you do charge and account the memory but underlying pages do not
> know about their memcg (this is normally done with commit_charge for
> user mapped pages). This would become a problem if the memory is
> migrated for example.

I don't think this is movable memory.

> This also means that you have to maintain memcg
> reference outside of the memcg proper which is not really nice either.
> This mimicks tcp kmem limit implementation which I really have to say I
> am not a great fan of and this pattern shouldn't be coppied.
> 

I think we should keep the discussion on technical merits instead of
personal perference. To me using skmem like interface is totally fine
but the pros/cons need to be very explicit and the clear reasons to
select that option should be included.

To me there are two options:

1. Using skmem like interface as this patch series:

The main pros of this option is that it is very simple. Let me list down
the cons of this approach:

a. There is time window between the actual memory allocation/free and
the charge and uncharge and [un]charge happen when the whole memory is
allocated or freed. I think for the charge path that might not be a big
issue but on the uncharge, this can cause issues. The application and
the potential shrinkers have freed some of this dmabuf memory but until
the whole dmabuf is freed, the memcg uncharge will not happen. This can
consequences on reclaim and oom behavior of the application.

b. Due to the usage model i.e. a central daemon allocating the dmabuf
memory upfront, there is a requirement to have a memcg charge transfer
functionality to transfer the charge from the central daemon to the
client applications. This does introduce complexity and avenues of weird
reclaim and oom behavior.


2. Allocate and charge the memory on page fault by actual user

In this approach, the memory is not allocated upfront by the central
daemon but rather on the page fault by the client application and the
memcg charge happen at the same time.

The only cons I can think of is this approach is more involved and may
need some clever tricks to track the page on the free patch i.e. we to
decrement the dmabuf memcg stat on free path. Maybe a page flag.

The pros of this approach is there is no need have a charge transfer
functionality and the charge/uncharge being closely tied to the actual
memory allocation and free.

Personally I would prefer the second approach but I don't want to just
block this work if the dmabuf folks are ok with the cons mentioned of
the first approach.

thanks,
Shakeel
