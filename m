Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B6CA76F8C
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 22:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E4F10E03D;
	Mon, 31 Mar 2025 20:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jVd/+TZe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B1E710E03D
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 20:43:56 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ac2bfcd2a70so638300166b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 13:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743453835; x=1744058635; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NhmnlMAAlfE+UJZ4bK8dEFy6Cahb9IglOuPC0RLUf2U=;
 b=jVd/+TZe28kHtzG19cf8mfzSZZHB1SLTaktisPWUplza/BdtgO0l/IFjWHSsK7xstn
 wr9cV3uTe7W7PiL0crdPWJi7tU2SG6JRh90rArLKF2hoxXAq4cE2XsjmzlH4RjFrM/32
 p882EpMUJmvuG7XvNwZXAyfpAHj9R1NFM9pmb37L5Jxw9G00g5neVpUxJhsUFgvKN0e/
 amqpoTUrZftMBI4DdKCu4tb/WQcbDCoSKLUgJDHANgbMB3SSdLd30k9H4OFAycBnmeY8
 A6wgn80rCt5jhtKLgNSHHJYM0WOGIs5uEZVPB9Ezua1vfEYh7JTIEt0n0xVdLqVMmy1h
 N9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743453835; x=1744058635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NhmnlMAAlfE+UJZ4bK8dEFy6Cahb9IglOuPC0RLUf2U=;
 b=cJw1j8cu52RObvIq4ujdy1bCP+CS34dg5NI/HaUX6AdM6QQhnNoX6wfIV4kqt60yqy
 xw9Rd5i46ZeCeLGGEQL5Cj+Ik51UNtRZRiNvlx2bnp/yf45e0Y8DndaZV7j6YI6Px3nA
 AZAA6srIvjS9iFW0NlmFXGIbDZB9FI5M3nqK8vzqyT1ZFPTeJmc0hdivP40XBfzCOwSx
 6g8QXdpWzZqXjS8nZ9ti6Qw87wZMdfdc5nY50QmNdxU1f+am3yUJ2dgPxUlfPoxtGPCo
 YWJXoi0D8HoULSA6hQvBFPNnDMNYoZIvNsedBO/Dm2Yqoi7UAClLVKNnf+UQtg5ujpit
 BKUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIuothhiFKSufqgcPdGGGqYprQC2eD2vXTqpI3hIkP/PHleTJA2K+Msei5foNSu6tO20eymFV/H2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxtj6Y+5FmBXIM7391+nrs8QOYRPpLieZzKjMA3lOmP9nD0Z+3F
 LeCeapt7soDWDMzx8p699PQ8xKnwfN0eu4Eh7vkwaEHoQMnbaLbM8CwIxoTfowOHR3ohMphII/7
 fcij8gfcwET8nuPUi0CaByJOHGGo=
X-Gm-Gg: ASbGncusnau/ESsUQqTzqZUDNEOvZ+cm3dmiTfXFyIvuncfPXzMo8XRGeznX2ZHVKlJ
 lNGudxT7FiBsgjz87ms9gKqU2nvsKgCRmeA8giZQFCtyt8oFwpZv5dQWj/vNMfbybqYAnTbnqT0
 n5DFvpEmspIo/1LLM8Y1TPkS0K
X-Google-Smtp-Source: AGHT+IGa2ATWEnPtBZKrovC/2tQXOIHQaYNh/KXGz4WWHKDhRqKyDzgdS0ONK7AXu9tKvknpMnQpqfeFIU5BV3Y+5xU=
X-Received: by 2002:a17:906:1718:b0:ac7:391b:e684 with SMTP id
 a640c23a62f3a-ac7391beac4mr794735366b.58.1743453835197; Mon, 31 Mar 2025
 13:43:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250310-dmem-cgroups-v1-0-2984c1bc9312@kernel.org>
 <f5fdc666-dd72-4a4f-9270-b539a3179382@amd.com>
 <20250310-eccentric-wonderful-puffin-ddbb26@houat>
In-Reply-To: <20250310-eccentric-wonderful-puffin-ddbb26@houat>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 1 Apr 2025 06:43:43 +1000
X-Gm-Features: AQ5f1Jo63dx6IuKsG5SoyFqmX486Pcaveqb15lGzyp5QvSc5pKKZ1U2dlNV04bE
Message-ID: <CAPM=9tzkLXOz=-3eujUbbjMHunR+_5JZ4oQaqNmbrWWF9WZJ0w@mail.gmail.com>
Subject: Re: [PATCH RFC 00/12] dma: Enable dmem cgroup tracking
To: Maxime Ripard <mripard@kernel.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Tomasz Figa <tfiga@chromium.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Ben Woodard <woodard@redhat.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
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

On Tue, 11 Mar 2025 at 00:26, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Mon, Mar 10, 2025 at 03:16:53PM +0100, Christian K=C3=B6nig wrote:
> > [Adding Ben since we are currently in the middle of a discussion
> > regarding exactly that problem]
> >
> > Just for my understanding before I deep dive into the code: This uses
> > a separate dmem cgroup and does not account against memcg, don't it?
>
> Yes. The main rationale being that it doesn't always make sense to
> register against memcg: a lot of devices are going to allocate from
> dedicated chunks of memory that are either carved out from the main
> memory allocator, or not under Linux supervision at all.
>
> And if there's no way to make it consistent across drivers, it's not the
> right tool.
>

While I agree on that, if a user can cause a device driver to allocate
memory that is also memory that memcg accounts, then we have to
interface with memcg to account that memory.

The pathological case would be a single application wanting to use 90%
of RAM for device allocations, freeing it all, then using 90% of RAM
for normal usage. How to create a policy that would allow that with
dmem and memcg is difficult, since if you say you can do 90% on both
then the user can easily OOM the system.

Dave.
> Maxime
