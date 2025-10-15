Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A22BDDA8D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 11:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFEC10E3AB;
	Wed, 15 Oct 2025 09:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YGROxAC4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B293A10E3AB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 09:14:23 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-37777f72838so625841fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 02:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760519662; x=1761124462; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kNter1wl1oLLlJYevVTo4vpc2F0Z/0nnhZY0eR5fUuY=;
 b=YGROxAC4nWYr+chMx76kHdbDPoHwu7AnursfoE/Xz2OmqPGpb+rVT0/hV+kY1u6A3Q
 zEgPq7zj/V/vHw8JFn2VWYei7YbVxmPftU4NXuuBTITBn7bulkUSYoCfs3gBPUOFVPXD
 x4lMvnZg3ZuEokZVldz1U7FSN62WGznHnHOLHu4Os+/B8p13G/VpfJvnHsdlYXOiTTmf
 PFH61w18sqoh8zrdktoJmYJ7KT+vfnsR3XHiViqCGyua7DBGokZTn5hOuYFse3UNk3p7
 sUC5PEi82SIC6DXZdsoEVT6Jgo3JajAZPlv3O3iZT4mOUmiXEcM4eZVENXUGMbRrfVjJ
 5/Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760519662; x=1761124462;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kNter1wl1oLLlJYevVTo4vpc2F0Z/0nnhZY0eR5fUuY=;
 b=aboBFcMh0ULnjJ1hdRDvOfjShovqdUg+lCXGaQcQOMBVhYJS8LtpyMTA1kllFyCCtK
 f8pJKPyxR+gZ8gFpAgk2F8J+AFuO/H35sdtVINdrNLc3UcoADPM5UPsIExScMV1Sv0f2
 Rxj29w33zSD4edWtnXwvaSrQqvCleyFhLVhNpT3xtLdCuJNjS7aq0hl7Pqo3tDH/nTeK
 40C1zGcexHev9pWsXHl53R+/sQ1VZr3b4q79rVoTywlqAOt2yS/uqKDl8iUaL7wdTS8y
 QOwBa7GzBDTZMhcJrnvuI9PXcGSjkTwMMun8ciysoZ9xG2S5tlXTYx1/RI199Hpjhq5b
 RdGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYtGQX/+C4RcpzWvLy5nrI7oq+R9HqcAgKyXjPOwqo01fQQDGSqDoAKWZuORAKIoWPE+EG4ihN0T8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5g+1wQ06Sd67IYfFMCDZOLcwF4ujgCbE3ZpEAMSHxcxnni5Dv
 q+ipGphn6gheYb9K8Md7fHQ63gc8dwPPDp9+mbA3Y/Acs2jaXtdCZnhBLhs4fLMkihPdE73Kd7C
 ka/qMx2X8fNfWPmpH1DgfvKtgfYRGf54=
X-Gm-Gg: ASbGnctR5QvIplNNP+cwUlRiaBw/k2kCaZGAKgPRg4Sm/2/40Scpfja7yP4IX9FIl7f
 lIkbiTEF9WqPGESNWAGQOJw/3+U5QwbtjNBkye0IddguuK9IVxUaL9f3STS2tLN1tIPyw5LY5Cr
 f8Gf3HST547fheFzMKmrHDllAHC0ArCohbVES1Qc2mlXf5obbkGm5t6mqIS+h0q5QAcSUqt0aus
 Sjq54nqh2qL8g7NED4uj69F4zPoImb01XU7ew==
X-Google-Smtp-Source: AGHT+IHIzIhf1YNCI5C8onxDXaNTHHoiFmiOUpxt66KIf78orh4sRuZHDUQFOMD42XgkZiDlsjMqDxaFdaNS5QPVDow=
X-Received: by 2002:a05:651c:19a2:b0:371:ef15:f19e with SMTP id
 38308e7fff4ca-37609f1b402mr41581191fa.5.1760519661576; Wed, 15 Oct 2025
 02:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251014083230.1181072-1-zhaoyang.huang@unisoc.com>
 <20251014083230.1181072-3-zhaoyang.huang@unisoc.com>
 <87953097-a105-4775-88a5-9b3a676ff139@amd.com>
 <CAGWkznGN7W-txq_G+xpZ6DtH_1DNorYc=CxqUjebo7qfB4Sxsw@mail.gmail.com>
 <ecba7133-699c-4f3e-927c-bad5bd4c36a3@amd.com>
 <20251014171003.57bbfd63@mordecai.tesarici.cz>
 <97da9924-9489-4d30-a858-8ee5c87bc031@amd.com>
 <CAGWkznGnmb=8GgcrfDvY2REHdRZYVXZy=F3thXhK0FaSoiK7tw@mail.gmail.com>
 <aO8TKQN6ifOSMRSC@casper.infradead.org>
 <CAGWkznFG2_WGmLRmHnjV-49iTX0mrt9jxQBzZYK=K9U7eKJD0g@mail.gmail.com>
 <20251015104008.4bcd99e7@mordecai.tesarici.cz>
In-Reply-To: <20251015104008.4bcd99e7@mordecai.tesarici.cz>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Wed, 15 Oct 2025 17:14:10 +0800
X-Gm-Features: AS18NWBFNrpCd7vYazsrAzxjhFltbgGwOyCb8rBQZuWBjfGrYICxBoM7m6ifLQ8
Message-ID: <CAGWkznEkVz8p=Gbc8JC01SLkUHdTPW126z-fsJCZhoOLDSF5vA@mail.gmail.com>
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
To: Petr Tesarik <ptesarik@suse.com>
Cc: Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Suren Baghdasaryan <surenb@google.com>,
 "zhaoyang.huang" <zhaoyang.huang@unisoc.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Mel Gorman <mgorman@techsingularity.net>, Vlastimil Babka <vbabka@suse.cz>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
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

On Wed, Oct 15, 2025 at 4:40=E2=80=AFPM Petr Tesarik <ptesarik@suse.com> wr=
ote:
>
> On Wed, 15 Oct 2025 13:52:57 +0800
> Zhaoyang Huang <huangzhaoyang@gmail.com> wrote:
>
> > On Wed, Oct 15, 2025 at 11:21=E2=80=AFAM Matthew Wilcox <willy@infradea=
d.org> wrote:
> > >
> > > On Wed, Oct 15, 2025 at 09:12:07AM +0800, Zhaoyang Huang wrote:
> > > > > Could be that we need to make this behavior conditional, but some=
body would need to come up with some really good arguments to justify the c=
omplexity.
> > > > ok, should we use CONFIG_DMA_BUF_BULK_ALLOCATION or a variable
> > > > controlled by sysfs interface?
> > >
> > > No.  Explain what you're trying to solve, because you haven't yet.
> > Dma-buf works as a memory allocation backend could loop thousands of
> > times alloc_pages for allocating order-0 pages to fulfill the dozens
> > MB demand, this commit would like to replace the loop by once
> > alloc_pages_bulk. Whereas, alloc_pages_bulk_array perhaps introduces
> > extra memory allocation along with direct-reclaim which could be more
> > expensive than iterating the list. so call back the API
> > alloc_pages_bulk_list as well
>
> This does not quite explain it. IIRC you mentioned allocating 18M as an
> example. The ideal outcome in that case is:
>
> - 16 order-8 compound pages
> - 32 order-4 compound pages
> -> total 48 calls to alloc_pages()
>
> But presumably, that's not what happens, because fragmentation makes
> (some of) those order-8 allocations fail. Since you talk about
> thousands of loop iterations, it looks like even order-4 allocation
> fail in your case. Then I agree there's not much value in trying to
> avoid further fragmentation, and after so many order-0 allocations,
> it's probably also pointless to do memory reclaim.

Thanks for the words

>
> OTOH I can see why the opposite approach is a bad idea in situations
> where fragmentation can be avoided. To make things even worse,
> alloc_pages_bulk() will rather split pages in the preferred zone than
> try allocating from the next best zone.

but the loop of alloc_pages(order-0) could also split high-order pages
one by one on the prefered-zone, right?

>
> To sum it up, Zhaoyang, can you please describe in more detail what
> happens in your scenario and what you believe should happen instead?

My goal is as simple as eliminating the loop of alloc_pages to get
some performance gains.

>
> Petr T
