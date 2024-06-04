Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC87B8FB76F
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 17:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFFE710E520;
	Tue,  4 Jun 2024 15:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="TvZN5eI4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B2810E520
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 15:34:01 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4213a2acc59so104545e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1717515240; x=1718120040;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YPrZTWhMGfW1Op6H/y2W3cwWgY4x9WIkaqKqTA6XOsk=;
 b=TvZN5eI4nWyY0XTI5ECUxEeuxBHPjyc96r4UNZn6iKfn5xbsI1DvQ2Kj+BDqvr6wLV
 GD835u8pwZta/SzVuTgW+9mc/r12EKGjXR7PhY8Bgg57zVkigCIgexbI30SUi1zPl8lz
 DXg+IvOkwNj5lg7QqF0KYzZqzUZFoKdQLDYh+anosE7CspzA/wqT0VbVJHPYcx8L/O7o
 pSZ/Vb+YHFBcKgJdlZT4ZxGzx6U2ZyycLOSNvNKcSx5UCMZ1Tr1rbO4is0qfNTRe7VQ1
 5h6OyO7REbtv+tT7XbIO74Zf7sOyXiq1lVaK6nxOmcv5jX7TBOAYRd0ZZ5eGeWiCSX3F
 6Ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717515240; x=1718120040;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YPrZTWhMGfW1Op6H/y2W3cwWgY4x9WIkaqKqTA6XOsk=;
 b=PMopJWHzlmR5XzaBs5X8E9WfrVXmM3ie937dJxx5JMUKBumgSqlZoLj5rzQB1dv8NY
 qfLNSmUGaxHboCJ5bWP4GAJld9hV7VYvrELSgSZOPETbci2JmspAvcGkM1VTjaFbnh8g
 H6uV2PmGbLkrBW7y4P5fSYIlj4Cz3FQJv33bVVndXHwACw8SGrxNv80bNZzJWkWdZvkS
 js9MaXWqvBRetZ8n3A7XZoIHIheFRv9//A1i2LLSq8v6t9/SYbx9OOrE2TO02Yjjm8kG
 K9xkjBRWcyZZ7BaTpfLcK7IoY+BaG8QLVxnyKoeSu1XGiywpuxGU6v2AEzTrajDbw/xg
 9mSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGrp3pVq3g6sixmzKaudONDQshVA724qQiAMaiNFJCU3beMIgaGBHAQ/7bXaGwh/KhYBxcU98z3VG/O/DiBF2DoTTAU/UyK+LAi7LHZ5Tr
X-Gm-Message-State: AOJu0YzYuwFf33m6VRm7MFEbDr2edBzIE6Fv5az6rxVCPyWbhd7SYTbZ
 aEl07G9+oxCuL6IHtbTb4nj9Dp9qPDIv6F9R1dxBsG03/OFdqf/cc3rA2NrEPArqkAST/7mUdbn
 +mO3WcFEnzM90K9x0bKVnHj9vEgxpH8/MZ9E=
X-Google-Smtp-Source: AGHT+IGgt6qVmKsMEINkAA4HYjs0uN2WeNDrPuAe6rAIuy/AuDyc36S0WKxfN4JyUkzqKUjfzg5pNUGXlPz9X67UZxY=
X-Received: by 2002:a7b:ca46:0:b0:41b:8715:1158 with SMTP id
 5b1f17b1804b1-4214947b20amr2777065e9.6.1717515240106; Tue, 04 Jun 2024
 08:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240603114008.16235-1-hailong.liu@oppo.com>
 <CANDhNCq50zPB+TS+_Oo0HY0aUuBAdik2KrC8eJRTygbis293sw@mail.gmail.com>
 <20240603172148.gb7txpg2ya43jyxn@oppo.com>
 <CANDhNCrwgce7G5_-4tNfgTHcdL12zt3JKBg=o3bHrzMmfFMctg@mail.gmail.com>
 <cff79c75-4c9c-46e0-a3ac-b9c0e8cad6f0@oppo.com>
In-Reply-To: <cff79c75-4c9c-46e0-a3ac-b9c0e8cad6f0@oppo.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 4 Jun 2024 08:33:47 -0700
Message-ID: <CANDhNCq1O9T6WxCpe9yNBycMu7U0SCVYBdW3R=J8jEqyqWYCiA@mail.gmail.com>
Subject: Re: [RFC PATCH v1] dma-buf: heaps: move the verification of
 heap_flags to the corresponding heap
To: Hailong Liu <hailong.liu@oppo.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 21cnbao@gmail.com, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org
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

On Mon, Jun 3, 2024 at 11:30=E2=80=AFPM Hailong Liu <hailong.liu@oppo.com> =
wrote:
> On 6/4/2024 2:06 AM, John Stultz wrote:
> > On Mon, Jun 3, 2024 at 10:21=E2=80=AFAM Hailong Liu <hailong.liu@oppo.c=
om> wrote:
> >> We now aim to improve priority dma-buf allocation. Consider android
> >> animations scene:
> >>
> >> when device is in low memory, Allocating dma-buf as animation
> >> buffers enter direct_reclaimation, longer allocation time result in a
> >> laggy UI. But if we know the usage of the dma-buf, we can use some
> >> mechanisms to boost, e.g. animation-memory-pool.
> >
> > Can you generalize this a bit further? When would userland know to use
> > this new flag?
> > If it is aware, would it make sense to just use a separate heap name in=
stead?
> >
> > (Also: These other mechanisms you mention should probably also be
> > submitted upstream, however for upstream there's also the requirement
> > that we have open users and are not just enabling proprietary blob
> > userspace, which makes any changes to dma-buf heaps for out of tree
> > code quite difficult)
> >
> >> However, dma-buf usage identification becomes a challenge. A potential
> >> solution could be heap_flags. the use of heap_flags seems ugly and
> >> contrary to the intended design as you said, How aboult extending
> >> dma_heap_allocation_data as follows?
> >>
> >> struct dma_heap_allocation_data {
> >>         __u64 len;
> >>         __u32 fd;
> >>         __u32 fd_flags;
> >>         __u64 heap_flags;
> >>         __u64 buf_flags: // buf usage
> >> };
> >
> > This would affect the ABI (forcing a new ioctl number).  And it's
> > unclear what flags you envision as buffer specific (rather than heap
> > specific as this patch suggested).
> >
> > I think we need more details about the specific problem you're seeing
> > and trying to resolve.
> This patch mainly focuses on optimization for Android scenarios. Let=E2=
=80=99s
> discuss it on the issue website.
> Bug: 344501512

Ok, we can do that if you need.

But if this is ever going to go upstream (and it's more and more
important that we minimize out of tree technical debt), conversations
about how to generalize this will need to happen on the list.

thanks
-john
