Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1A5AF69DB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 07:43:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B7810E0DE;
	Thu,  3 Jul 2025 05:43:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LJbl5+Fl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B22B10E0DE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 05:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751521430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKaZ5viri1/pmq8riVmTFfqdXVoy25LpivCg58yqOOo=;
 b=LJbl5+FlyurjNQoYySGNxxv0TcqIZl+E79d5bEqZ+57be+FtMOzTY4twBKMmuzNr6ePilY
 eTddT4QwrnnBbB0iCq8GYrsczjG6pN0EHMW3s58QW5ik0uIsaC3/pQi/P88baPjaAEvGqk
 eiNPQvlmlVx9GCmOKsnbzIUoOoe95dk=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-ugLaFTXsOJ2dB7YJ5qKjHw-1; Thu, 03 Jul 2025 01:43:48 -0400
X-MC-Unique: ugLaFTXsOJ2dB7YJ5qKjHw-1
X-Mimecast-MFC-AGG-ID: ugLaFTXsOJ2dB7YJ5qKjHw_1751521427
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b362d101243so1838740a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jul 2025 22:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751521427; x=1752126227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kKaZ5viri1/pmq8riVmTFfqdXVoy25LpivCg58yqOOo=;
 b=k1BE+SihOhPLmxWuhmmzBxFUJd1XXKqLl26u3NVCglmUSLXvYdY/2siAOfvm4ry+yu
 CysOv33FBa1OkrPvcfYAKeBNogiRChdwH3ZdFTgV+87YMddnGZ2IxZcGlHdRqtSHaSb0
 MHUE9Jv+IQJ0wUeF1qq7PKracF6EG5ahaiqLD7h/lPdwsgvkomvqY8qk/R0JEafNGAYz
 bU5v6qxp0p3MUin0QaZmSmWKosBg3dKmPvaHK63IiLMllS0fer62G3L8tPZPynxR0dcD
 NQ1bpQBo2WGWUCs0aKnDvyl8pGHWzKPhz5cr/3CLFKONgGXSiPnZ6tI3I1ot4UBgbjc8
 /Esg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1sdmBml1enSsy28+ar5xGWKaQMzQsoRoJqpqu4Fg+/RUeMFz7YZTGHlMPOGC/0MYk0s9WujShtkQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8AL3ic00nOJAMs5gXpSvBV9+2MoP09WNRr21x9EsY53YWj8tR
 NA9ty6h2WxEBLhCkzjP1acDiGeF3UP3/y/wm0QuNcUVYZxYW8alsh804ODiSN3w3QaKyvSEPe50
 kYsPs81RuaC8YZ2iValfdYCeT0gAVp3D/CxKNCxNtEshcBiEZUlmfbxwdKuuTtqNuW9/7R8SLmJ
 9qILYsb2yChOALx+NMwpbxzLgNQVH8EcUOfHm4hrdugqS5
X-Gm-Gg: ASbGnct1gsGiAmYyl/tnddtfyb2bsXDY9+aUGxuQk71eFZbq5q3eOGc9htLyIdacZhx
 5t4lVTn1Qqan4JSqhgz+KHVmYLvsSP1FDH3nOnqJcONJWpRgIWKwKmANicFmUYJ0P9C0X2ydm2y
 5hrg==
X-Received: by 2002:a17:90b:58c8:b0:312:ffdc:42b2 with SMTP id
 98e67ed59e1d1-31a90bef1ebmr6758369a91.23.1751521427401; 
 Wed, 02 Jul 2025 22:43:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNsNNeUhmCJU5v4NOb3SgJID6VMCS7g+2prUcFjlNHum/299MbqRloAN44Kj54IR57+Xk5Lsz5JmEa9QqBrsI=
X-Received: by 2002:a17:90b:58c8:b0:312:ffdc:42b2 with SMTP id
 98e67ed59e1d1-31a90bef1ebmr6758357a91.23.1751521427059; Wed, 02 Jul 2025
 22:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-9-airlied@gmail.com>
 <kk5qq4af4roysrnba3w5433fmhmbt4ps5kfnmvickh3uxlqc3g@lpqtnmqhuzgm>
In-Reply-To: <kk5qq4af4roysrnba3w5433fmhmbt4ps5kfnmvickh3uxlqc3g@lpqtnmqhuzgm>
From: David Airlie <airlied@redhat.com>
Date: Thu, 3 Jul 2025 15:43:35 +1000
X-Gm-Features: Ac12FXzaZE0LM44seaQchGs9qGCjGmZ1Sx3Me9vakIm7o5BNxnCpdZzclz6bX1Y
Message-ID: <CAMwc25pN-bBmQgA7VVWinojeL7ViOi-UcrWRa2+NjiJyitxqcQ@mail.gmail.com>
Subject: Re: [PATCH 08/17] memcg: add support for GPU page counters.
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
 Christian Koenig <christian.koenig@amd.com>, 
 Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XRR4j67UEIj6y5dZtlBEvO_YylKkbu0CQfBPcGM4ZPg_1751521427
X-Mimecast-Originator: redhat.com
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

On Thu, Jul 3, 2025 at 2:06=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.dev=
> wrote:
>
> On Mon, Jun 30, 2025 at 02:49:27PM +1000, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > This introduces 2 new statistics and 3 new memcontrol APIs for dealing
> > with GPU system memory allocations.
> >
> > The stats corresponds to the same stats in the global vmstat,
> > for number of active GPU pages, and number of pages in pools that
> > can be reclaimed.
> >
> > The first API charges a order of pages to a objcg, and sets
> > the objcg on the pages like kmem does, and updates the active/reclaim
> > statistic.
> >
> > The second API uncharges a page from the obj cgroup it is currently cha=
rged
> > to.
> >
> > The third API allows moving a page to/from reclaim and between obj cgro=
ups.
> > When pages are added to the pool lru, this just updates accounting.
> > When pages are being removed from a pool lru, they can be taken from
> > the parent objcg so this allows them to be uncharged from there and tra=
nsferred
> > to a new child objcg.
> >
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> > ---
> >  Documentation/admin-guide/cgroup-v2.rst |   6 ++
> >  include/linux/memcontrol.h              |  14 +++
> >  mm/memcontrol.c                         | 110 ++++++++++++++++++++++++
> >  3 files changed, 130 insertions(+)
> >
> > diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/ad=
min-guide/cgroup-v2.rst
> > index 0cc35a14afbe..d6f057c4fe2e 100644
> > --- a/Documentation/admin-guide/cgroup-v2.rst
> > +++ b/Documentation/admin-guide/cgroup-v2.rst
> > @@ -1542,6 +1542,12 @@ The following nested keys are defined.
> >         vmalloc (npn)
> >               Amount of memory used for vmap backed memory.
> >
> > +       gpu (npn)
> > +             Amount of system memory used for GPU devices.
> > +
> > +       gpu_reclaim (npn)
> > +             Amount of system memory cached for GPU devices.
> > +
> >         shmem
> >               Amount of cached filesystem data that is swap-backed,
> >               such as tmpfs, shm segments, shared anonymous mmap()s
> > diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
> > index 87b6688f124a..ff82d603910d 100644
> > --- a/include/linux/memcontrol.h
> > +++ b/include/linux/memcontrol.h
> > @@ -36,6 +36,8 @@ enum memcg_stat_item {
> >       MEMCG_SOCK,
> >       MEMCG_PERCPU_B,
> >       MEMCG_VMALLOC,
> > +     MEMCG_GPU,
> > +     MEMCG_GPU_RECLAIM,
>
> You already added node level counters i.e. GPUActive & GPUReclaim, just
> use those instead of these. Add them to memcg_node_stat_items[].
>

Thanks for the pointer, yes I did mess that up, I've rewrote it
locally today and it makes more sense now.

Dave.

