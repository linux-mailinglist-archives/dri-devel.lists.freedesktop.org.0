Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F72870C35
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 22:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DBF1125CF;
	Mon,  4 Mar 2024 21:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="UzFjbLEa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7417E1125CF
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 21:12:54 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-412a2c2ce88so3725e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Mar 2024 13:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1709586772; x=1710191572;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X0r8+n+LARCJYSSmQ0wD96KaQybb4EGOOQP6AJjmTDY=;
 b=UzFjbLEainMMBxbWWfVSRXYaUt6hHJrS6aVPXiGaTcOExi4bYpk7Dv9+oVAXAnI7ga
 8Zvi5GM/uibR8C0pXaOTkjuqRgvPF2NFKhWyzgiIak2fTcvgkffW4J/mGh+NOCg7XWwc
 vP+Lvk8J8MGQWsSjCAEERKw9iSfjgaoZoWJCHRbkBrSqMad6MBrHMpqOJZHWeZVs5ItX
 7J1PT+1EGdhNOmfTBLaGydKwKbWaXvXDL0KgVk4R/4Rfpi4GxfqER2nGtEjqJbHdM6aK
 IuENyQzYNag04YvsKkFrs5ExWXlt+3+PLf+AjXQP/yBUEFmR6h/niezL296pY+cCaXel
 AzmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709586772; x=1710191572;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X0r8+n+LARCJYSSmQ0wD96KaQybb4EGOOQP6AJjmTDY=;
 b=H5FKr+D26heb5mXMW2sx/fS4Aj5NpaXcEPDxZupTjKSXx+ZttlI42mTotYV3y8lPaV
 wLtV3UPeszLfoNCFnFrRUOwsq7DP1HoTa6gdwwHpGr2s+zI0iDjglxSe/ZBzshQwMAX7
 ZGMfq1zCU52VBDBTURMY1FKs/CamUEO5nXjWHe/2MLPAmnRTLf3JYM2lijTAqmDRZ/wh
 N8uRzgRjL3uE08o3G5rF69Kgn3uIiu3Re6pGUdNHBH4KAhDrTZRhVQ8swJOy7iPTd6W9
 u7kRqBV4nJet2Z7ZA4GOM02DnaTAkrVBTEaVYgMBLVpW1r2fLH4hKgwZMMtWp2gj/CFu
 LpsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYvnhwppKWuEkETvpf3+WiqXqsaBmoDuYxZZGVjY0sx/MNZmV5UjBrPTbfeijoEGOxKFpPzGSBZN9yjvoXs6d2quwR9qNVfAVT/UjxCejv
X-Gm-Message-State: AOJu0Yw5WqoGO7P+y3tyxBwVW9IvKb6TxNqnI1DKwuTsG8mgmkMrwxk+
 BgEIsHm374X5VnMP27dZUhYbYvR9Xr8UH/qNSV2GmAE5GiFZqmV9NJAt4lTvZ5056fUMEpeuQ63
 fJHbXjb8BsNXY1FA8vhza+Y8GFCGIyDNtKq4=
X-Google-Smtp-Source: AGHT+IECNItZxLvJKd/Rw+CRnuwdWLqZljXefiZGSRl1nR5Qjt8q5oAPrO+7FrtSRttAa4RSVf8/eMwruC25X58qOdo=
X-Received: by 2002:a05:600c:1c18:b0:412:e492:7e5 with SMTP id
 j24-20020a05600c1c1800b00412e49207e5mr19489wms.1.1709586772388; Mon, 04 Mar
 2024 13:12:52 -0800 (PST)
MIME-Version: 1.0
References: <20240228-nifty-flashy-shrew-905edc@houat>
 <CANDhNCquJn6bH3KxKf65BWiTYLVqSd9892-xtFDHHqqyrroCMQ@mail.gmail.com>
 <20240304-bizarre-quizzical-dugong-caec1a@houat>
In-Reply-To: <20240304-bizarre-quizzical-dugong-caec1a@houat>
From: John Stultz <jstultz@google.com>
Date: Mon, 4 Mar 2024 13:12:39 -0800
Message-ID: <CANDhNCohz2O6==F_S_NvWPkaOo4R+CAEToY06PZLuwrLimDxqQ@mail.gmail.com>
Subject: Re: ECC memory semantics for heaps
To: Maxime Ripard <mripard@redhat.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org
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

On Mon, Mar 4, 2024 at 5:46=E2=80=AFAM Maxime Ripard <mripard@redhat.com> w=
rote:
> On Wed, Feb 28, 2024 at 08:17:55PM -0800, John Stultz wrote:
> > On Wed, Feb 28, 2024 at 7:24=E2=80=AFAM Maxime Ripard <mripard@redhat.c=
om> wrote:
> > >
> > > I'm currently working on a platform that seems to have togglable RAM =
ECC
> > > support. Enabling ECC reduces the memory capacity and memory bandwidt=
h,
> > > so while it's a good idea to protect most of the system, it's not wor=
th
> > > it for things like framebuffers that won't really be affected by a
> > > bitflip.
> > >
> > > It's currently setup by enabling ECC on the entire memory, and then
> > > having a region of memory where ECC is disabled and where we're suppo=
sed
> > > to allocate from for allocations that don't need it.
> > >
> > > My first thought to support this was to create a reserved memory regi=
on
> > > for the !ECC memory, and to create a heap to allocate buffers from th=
at
> > > region. That would leave the system protected by ECC, while enabling
> > > userspace to be nicer to the system by allocating buffers from the !E=
CC
> > > region if it doesn't need it.
> > >
> > > However, this creates basically a new combination compared to the one=
 we
> > > already have (ie, physically contiguous vs virtually contiguous), and=
 we
> > > probably would want to throw in cacheable vs non-cacheable too.
> > >
> > > If we had to provide new heaps for each variation, we would have 8 he=
aps
> > > (and 6 new ones), which could be fine I guess but would still increas=
e
> > > quite a lot the number of heaps we have so far.
> > >
> > > Is it something that would be a problem? If it is, do you see another
> > > way to support those kind of allocations (like providing hints throug=
h
> > > the ioctl maybe?)?
> >
> > So, the dma-buf heaps interface uses chardevs so that we can have a
> > lot of flexibility in the types of heaps (and don't have the risk of
> > bitmask exhaustion like ION had). So I don't see adding many
> > differently named heaps as particularly problematic.
>
> Ok
>
> > That said, if there are truly generic properties (cacheable vs
> > non-cachable is maybe one of those) which apply to most heaps, I'm
> > open to making use of the flags. But I want to avoid having per-heap
> > flags, it really needs to be a generic attribute.
> >
> > And I personally don't mind the idea of having things added as heaps
> > initially, and potentially upgrading them to flags if needed (allowing
> > heap drivers to optionally enumerate the old chardevs behind a config
> > option for backwards compatibility).
> >
> > How common is the hardware that is going to provide this configurable
> > ECC option
>
> In terms of number of SoCs with the feature, it's probably a handful. In
> terms of number of units shipped, we're in the fairly common range :)
>

Sure, I guess I was trying to get a sense of is this a feature we'll
likely be seeing commonly across hardware (such that internal kernel
allocators would be considering it as a flag), or is it more tied to a
single vendor such that enabling/isolating it in a driver is the right
place in the abstraction to put it.


> > and will you really want the option on all of the heap types?
>
> Aside from the cacheable/uncacheable discussion, yes. We could probably
> get away with only physically contiguous allocations at the moment
> though, I'll double check.

Ok, that will be useful to know.

> > Will there be any hardware constraint limitations caused by the
> > ECC/!ECC flags? (ie: Devices that can't use !ECC allocated buffers?)
>
> My understanding is that there's no device restriction. It will be a
> carved out memory so we will need to maintain a separate pool and it
> will be limited in size, but that's pretty much the only one afaik.

Ok.

> > If not, I wonder if it would make sense to have something more along
> > the lines using a fcntl()  like how F_SEAL_* is used with memfds?
> > With some of the discussion around "restricted"/"secure" heaps that
> > can change state, I've liked this idea of just allocating dmabufs from
> > normal heaps and then using fcntl or something similar to modify
> > properties of the buffer that are separate from the type of memory
> > that is needed to be allocated to satisfy device constraints.
>
> Sorry, I'm not super familiar with F_SEAL so I don't really follow what
> you have in mind here. Do you have any additional resources I could read
> to understand better what you're thinking about?

See the File Sealing section: https://man7.org/linux/man-pages/man2/fcntl.2=
.html

> Also, if we were to modify the ECC attributes after the dma-buf has been
> allocated by dma-buf, and if the !ECC memory is carved out only, then
> wouldn't that mean we would need to reallocate the backing buffer for
> that dma-buf?

So yea, having to work on a larger pool likely makes this not useful
here, so apologies for the tangent.

To explain myself, part of what I'm thinking of is, the dmabuf heaps
(and really ION before it) try to solve how to allocate a buffer type
that can be used across a number of devices that may have different
constraints. So the focus was on "types of memory" to satisfy the
constraint (contiguous, non-contiguous, secure/restricted, etc), which
come down to what pages actually get used.  However, outside of the
"constraint type" the buffer may have, there are other "properties"
that may affect performance (like cacheability, and some variants of
"restricted buffers" which can change over their lifetime).  With ION
vendors would mix these two together in their vendor heaps, and with
out-of-tree dmabuf heaps it is also common to tangle types and
properties together.

So I'm sort of stewing on how to best distinguish between heaps for
"types of memory/pages" (ie: what's *required* to share the buffer
between devices) vs these buffer properties (which affect performance)
that may apply to multiple memory types.
(And I'm also not 100% convinced that distinguishing between this is
necessary, but casually mixing them feels messy to me)

For buffers where those properties might change over time (like some
variants of restricted buffers), I think the fnctl/F_SEAL_* idea makes
sense to allow the buffer to become restricted.

For cacheability, it seems likely an allocation flag would be nicest,
but we don't have upstream users and not a lot of heap types yet, thus
the out-of-tree "system-uncached" heap which sort of mixes types and
properties.

With ECC I was trying to get a sense of where it would sit between
this "type of memory" vs a "buffer property".  If internal allocators
are likely to consider it in a way similar to CMA (and with the pool
granular control, it sounds like it), then yeah, it probably should be
a type of memory, so a new heap name is likely the way to go - but
there is still the question of how to best support the various
combinations of (contiguous, cacheable) along with ECC.  But if it
were something that was dynamically controllable at a finer grained
level in the future, maybe it would be something like a  buffer
property.

thanks
-john
