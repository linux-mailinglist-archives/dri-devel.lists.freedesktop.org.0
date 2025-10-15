Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5546BBDBF5E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 03:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6098F10E6C6;
	Wed, 15 Oct 2025 01:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y0pnQNgV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204E810E6C6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 01:12:22 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-57a8b00108fso1098580e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 18:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760490740; x=1761095540; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VRM97CWlsOT8ZJdTMoTW/+GjecPCqzJ3uGuQi6pJdPs=;
 b=Y0pnQNgVq63U79lxfO8gVVYTtt0p4cjDBuXA2N9w4Zv5RSrRprBB96wp/XKizP3s1s
 7gJgkhMeP+qTqUY1AwuE3Xl7WG3eat3mCjA3sVDWXl5loel10T8jp2VrX//A0f2oqDfl
 cv/yU5XppEbygNJVcHz9SkQ/TzJ5pBxfOZO7Xmx9b0SpV7poct4DKpk7HxButsCtV6Ug
 dlOg++8NdEZAjgugetz/vjCbZ9H15/KAXE/PG1nG/Fw5G4+rfB/LmL4UJrXuXivyUs0r
 EYtpWc5KHlvWCQElDtE2Vp33TQmFounqlKXRfn6EihjHmUaHV/3gn20yQ9PQePISDYZH
 zy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760490740; x=1761095540;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VRM97CWlsOT8ZJdTMoTW/+GjecPCqzJ3uGuQi6pJdPs=;
 b=i66ezT7y/FaAtkPStOMbhOWopYl4MIrFL16l+zAECl56PwX6lAfEpK86M4lOq1Wo3H
 G5S+1TCmLx7XEksNA/JmBCR+JbRZ8DhcGXe3dGhzsBapZYHTPcW12n+sInfd5vjASww3
 EaXZRLMVLKLzQqycxSR7BUyLywnCCSD0ylolXVNQFUz84qGZAZtYglwrkqlG3ISX/tB8
 G4NRFSWHNo2pNJMLZmVHKkg2Zg2msVI+IV43+hUIhvIIncaZhXIKoVfLtW0DwwDAf0ub
 dM3ZBuLd4yQXzeosv3v88VJubfhn4e6h6mWt+dJDHJmxjD8Z55KzMrrJ2RCOioers+Hr
 InVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQM1xdN357C4mxFnQtWYlDXoALEHJ/6bbrvAUZZ4nuY7Szr1lBzmun4i2Q2RTc+MlIycI/y0o3TfE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsOOUkiWRNrrotbgDvVktZIzp2VTdP6YTLIK78TBnDaFdkLTHu
 GWQRt0UUFM3bJfENxqywB/i9J8f5z1s+vhyqOwJK9OU5jcedH+tt7sxs7IL5oHGW3MHNo5iPYtj
 SXYdOdK0WoWIuUHEtXMGOuyQM7rA6Bag=
X-Gm-Gg: ASbGncspKD8EsG8DhbiHquHvt6ICHhzxsvE/the/E/AN4tzOFTqUs5MF/RBQkE4Qt5X
 RTmtObWDlMX+sdAEVOeMP3QMnj9oKjEN7wB4Av9VQo7vzT9sk1Yq9m/8tfGSmK2WjCilj53ikTT
 LMVE8iA7FONk2xqrq6AyVSRJ2Gyuk0ktfzBusMiUTRuanQQCrDNi/JyVKte8pS4C+U0soMg/mef
 ATP0+C/rcGHcZUPF9L0jnIoLyANOX4jE0SpOQ==
X-Google-Smtp-Source: AGHT+IH/YU1kpB0Wn/4zP9l5pqChZfQXv1sm3d4LmsjcWXKZ0Ktc3UNXw8IIJzlfWpkxIJ+KKbvjrd6UrdDNej2f8Fk=
X-Received: by 2002:a05:6512:23e9:b0:586:15ea:53c8 with SMTP id
 2adb3069b0e04-591c8faf0b0mr151534e87.2.1760490739902; Tue, 14 Oct 2025
 18:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
 <20251014083230.1181072-3-zhaoyang.huang@unisoc.com>
 <87953097-a105-4775-88a5-9b3a676ff139@amd.com>
 <CAGWkznGN7W-txq_G+xpZ6DtH_1DNorYc=CxqUjebo7qfB4Sxsw@mail.gmail.com>
 <ecba7133-699c-4f3e-927c-bad5bd4c36a3@amd.com>
 <20251014171003.57bbfd63@mordecai.tesarici.cz>
 <97da9924-9489-4d30-a858-8ee5c87bc031@amd.com>
In-Reply-To: <97da9924-9489-4d30-a858-8ee5c87bc031@amd.com>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Wed, 15 Oct 2025 09:12:07 +0800
X-Gm-Features: AS18NWDwKUa99eX_upbZCKKbzQIUyuG-r_RZ364dCpA2z_s2W1WiiM3YMGbpa3o
Message-ID: <CAGWkznGnmb=8GgcrfDvY2REHdRZYVXZy=F3thXhK0FaSoiK7tw@mail.gmail.com>
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Suren Baghdasaryan <surenb@google.com>
Cc: Petr Tesarik <ptesarik@suse.com>,
 "zhaoyang.huang" <zhaoyang.huang@unisoc.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Mel Gorman <mgorman@techsingularity.net>,
 Vlastimil Babka <vbabka@suse.cz>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, steve.kang@unisoc.com
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

On Tue, Oct 14, 2025 at 11:52=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 14.10.25 17:10, Petr Tesarik wrote:
> > On Tue, 14 Oct 2025 15:04:14 +0200
> > Christian K=C3=B6nig <christian.koenig@amd.com> wrote:
> >
> >> On 14.10.25 14:44, Zhaoyang Huang wrote:
> >>> On Tue, Oct 14, 2025 at 7:59=E2=80=AFPM Christian K=C3=B6nig
> >>> <christian.koenig@amd.com> wrote:
> >>>>
> >>>> On 14.10.25 10:32, zhaoyang.huang wrote:
> >>>>> From: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
> >>>>>
> >>>>> The size of once dma-buf allocation could be dozens MB or much more
> >>>>> which introduce a loop of allocating several thousands of order-0 p=
ages.
> >>>>> Furthermore, the concurrent allocation could have dma-buf allocatio=
n enter
> >>>>> direct-reclaim during the loop. This commit would like to eliminate=
 the
> >>>>> above two affections by introducing alloc_pages_bulk_list in dma-bu=
f's
> >>>>> order-0 allocation. This patch is proved to be conditionally helpfu=
l
> >>>>> in 18MB allocation as decreasing the time from 24604us to 6555us an=
d no
> >>>>> harm when bulk allocation can't be done(fallback to single page
> >>>>> allocation)
> >>>>
> >>>> Well that sounds like an absolutely horrible idea.
> >>>>
> >>>> See the handling of allocating only from specific order is *exactly*=
 there to avoid the behavior of bulk allocation.
> >>>>
> >>>> What you seem to do with this patch here is to add on top of the beh=
avior to avoid allocating large chunks from the buddy the behavior to alloc=
ate large chunks from the buddy because that is faster.
> >>> emm, this patch doesn't change order-8 and order-4's allocation
> >>> behaviour but just to replace the loop of order-0 allocations into
> >>> once bulk allocation in the fallback way. What is your concern about
> >>> this?
> >>
> >> As far as I know the bulk allocation favors splitting large pages into=
 smaller ones instead of allocating smaller pages first. That's where the p=
erformance benefit comes from.
> >>
> >> But that is exactly what we try to avoid here by allocating only certa=
in order of pages.
> >
> > This is a good question, actually. Yes, bulk alloc will split large
> > pages if there are insufficient pages on the pcp free list. But islates=
t
> > dma-buf indeed trying to avoid it, or is it merely using an inefficient
> > API? And does it need the extra speed? Even if it leads to increased
> > fragmentation?
>
> DMA-buf-heaps is completly intentionally trying rather hard to avoid spli=
tting large pages. That's why you have the distinction between HIGH_ORDER_G=
FP and LOW_ORDER_GFP as well.
Could you please check the alloc_pages_bulk_noprof in the patch 1/2 of
this series. According to my understanding, it try to get the order-0
page from pcplist firstly and then fallback to normal
alloc_pages(order-0) as same as what current dma-buf do. That is to
say no extra large pages splitting introduced by this commit.
>
> Keep in mind that this is mostly used on embedded system with only small =
amounts of memory.
Actually, dma-buf is the main consumer for driver's memory allocation
in the android world(multimedia, camera, npu etc) which could use even
half of the system RAM with dozens MB for once allocation.
>
> Not entering direct reclaim and instead preferring to split large pages u=
ntil they are used up is an absolutely no-go for most use cases as far as I=
 can see.
Yes. This behaviour would NOT be changed under this commit.
>
> Could be that we need to make this behavior conditional, but somebody wou=
ld need to come up with some really good arguments to justify the complexit=
y.
ok, should we use CONFIG_DMA_BUF_BULK_ALLOCATION or a variable
controlled by sysfs interface?
>
> Regards,
> Christian.
>
> >
> > Petr T
>
