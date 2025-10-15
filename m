Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63895BDCA46
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 07:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614C410E263;
	Wed, 15 Oct 2025 05:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wo2dK6l2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB9810E263
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 05:53:11 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-3777b4660d1so63861fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 22:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760507590; x=1761112390; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kFLT62ixVQldJQ7fYkTdCMI80L5ybOIFkFHbPj9dyUI=;
 b=Wo2dK6l2a0nhef9emfJM2+z4ucIRlf2t+43ZvOMTFtvOZmZlvUbxjICjIqQWVE0uUN
 lhuNhWG5ITf69S/O68710mYEikjPuQYafkhKoZz4QAhWSLa2wFq2xOG5hJ7CUBJwMZaX
 z0p3BMSWf89staAJ/odkoYHN5w0xeQrjeIpstOMUh9xLyhlbEzwak1I+mydi89XD+CtU
 aSwvR8UlAU1HImuW2ZZ8c21QK4flDm8vHEniFT3BSqwzMDzbIbAi/J6Ftb9IzoSRry+W
 omcIHYwJ4OWu7WfS+oQBvvuXGLd0A3/Z3k6hQvBJYTgt3tQvGdZRmPk0cUsb0wBdzVVw
 eL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760507590; x=1761112390;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kFLT62ixVQldJQ7fYkTdCMI80L5ybOIFkFHbPj9dyUI=;
 b=by45J5TX+wcgTyQS7pA1YCIxgdnvySE8n/Lgr2XG++MeFCGf2yOu7ORzsPLsBwTd6e
 tz0QL6eajSE2U8PNJKXADjEiQNPruUhgH8d56CDSedk7iViFyOFVnHl7lukZM3/YDJFZ
 q2e9raY9cLnzui0b/Kw/bI+q70ZEzV5zfqR/u+tyKwwd0YmMTmMv+46anNjX+PlVtjj1
 2J0S8Pa4ZpJ9tZMCpxB82kfmR/WAHxW+t/JTIYbnXvNRhpdUEINrlVyHauUy87rLcYKU
 vR4XN5wl7riagGZaJbUkqT4Ed23mb/WcAFcmnLe4oJkk8dt5Yb7agnORqYqx5swHaey6
 OCaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn3mlh8RtLWzXEivYHSv3sjH0AaX7VBW4NaFwTcYR9TT4kkFBbMnVbLeDApi1XXnHPNJ+KVVdtJUA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQ9pbb3XwT2GRSJXqiRare815Tv2P08b4rQU0rpcN4QnEeLK1j
 ziOGir6v+ktlCFZKhuGUeh3bxoDZnTGdfQDH3omWxloIj0fKTKp5Yf/uv4JxIwPKFElws19w4GP
 4mkFjHrtxdkG7qG954X2hnv/nnL1zIOY=
X-Gm-Gg: ASbGncv44uhlqtVk3pwRPD7XujQPo9tfPad+1BpkQEWuJZb3zNO5h7fvCW0uqBTQgpX
 m/VjCpGUADp+ODnavAjk2hCcAYJuzY6M/aotnCj3tXk8OyD/vlrpUWWCIphAJZLvlkI0qUWO5xd
 qDfXsMnumICw65WefM918fE3QYz+pX14FVKMktBq1uJHgeRd2hLxYnCctKl+hcQBYzda41D4Udh
 WiOGloyvYS7sexun7Az0oDbUy8=
X-Google-Smtp-Source: AGHT+IFLUphpgOZG5QCNUsC60fCVIMlNWQyaFYF7MclW2rvaBp7nodjf6JgXjXmvHO9NPEejKXvxuliDGWMWkHx4m3I=
X-Received: by 2002:a2e:bea4:0:b0:36d:501:76bc with SMTP id
 38308e7fff4ca-37609c975f0mr40445141fa.2.1760507589531; Tue, 14 Oct 2025
 22:53:09 -0700 (PDT)
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
In-Reply-To: <aO8TKQN6ifOSMRSC@casper.infradead.org>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Wed, 15 Oct 2025 13:52:57 +0800
X-Gm-Features: AS18NWBOWQWzhWDzp18HSEEZyxB5KfY1PDfoAz_DuZJ3dbHjn7xlZV-pDkl9jw0
Message-ID: <CAGWkznFG2_WGmLRmHnjV-49iTX0mrt9jxQBzZYK=K9U7eKJD0g@mail.gmail.com>
Subject: Re: [PATCH 2/2] driver: dma-buf: use alloc_pages_bulk_list for
 order-0 allocation
To: Matthew Wilcox <willy@infradead.org>
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Suren Baghdasaryan <surenb@google.com>, Petr Tesarik <ptesarik@suse.com>, 
 "zhaoyang.huang" <zhaoyang.huang@unisoc.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, Mel Gorman <mgorman@techsingularity.net>,
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

On Wed, Oct 15, 2025 at 11:21=E2=80=AFAM Matthew Wilcox <willy@infradead.or=
g> wrote:
>
> On Wed, Oct 15, 2025 at 09:12:07AM +0800, Zhaoyang Huang wrote:
> > > Could be that we need to make this behavior conditional, but somebody=
 would need to come up with some really good arguments to justify the compl=
exity.
> > ok, should we use CONFIG_DMA_BUF_BULK_ALLOCATION or a variable
> > controlled by sysfs interface?
>
> No.  Explain what you're trying to solve, because you haven't yet.
Dma-buf works as a memory allocation backend could loop thousands of
times alloc_pages for allocating order-0 pages to fulfill the dozens
MB demand, this commit would like to replace the loop by once
alloc_pages_bulk. Whereas, alloc_pages_bulk_array perhaps introduces
extra memory allocation along with direct-reclaim which could be more
expensive than iterating the list. so call back the API
alloc_pages_bulk_list as well
