Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF39B305C8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6433710E9FE;
	Thu, 21 Aug 2025 20:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="MFs2yI9A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D2010E9F6
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:36:45 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e93498d436dso1478624276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1755808604; x=1756413404;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=083PuN2wICwWm8iwB5WBlP6qyKXLyqdZEBdZ0ztp8l8=;
 b=MFs2yI9AZENVcr7Al2iJIS3+m3asPUJ8KbJYvijkJprVF8BJpVyYXNeZ+2QSpDn3M1
 Fjy+e5tMs9FiJVi6vcf+heqyM4ksTTVNuywJ3oKxvwjgY3rvyIFAs1n+R4JbGkIeoCgZ
 zUE9mETHL8l3Za4F10bqAsx+epeSRB4RQC0bI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755808604; x=1756413404;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=083PuN2wICwWm8iwB5WBlP6qyKXLyqdZEBdZ0ztp8l8=;
 b=DeDwHL8wgh7rMflHBGfvnukUZEhGSYVKmp0WQ7qcq/fi589UCXDRGX8nnbZn0eIZYz
 6kpOFHK4OT/VmuG2jM0gS+gz8wNsJTyLo9El8u28DgCv87foHKJSqRxpPsmSO1NE4acV
 giOoxcawI3ForRvEIJ+8mWAUG338dHvQVRe7d65+Hn0sQnXS7Y9RMcgH1OmaX3Vl0+Vi
 51/iuH/whTW63xtkFZgnSE4BKZU/NhF3e9QH/HKSTnHEJFR1k1TKKyPdgsg18swkZJnj
 2t5qOvsM58MYArKhux10ztmw/gDtVGUkujke76Q7PNKhjvZSuqWy3rodqlqkGbxj0HcQ
 0L0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbihk0VvT6yIokHqDV4lVe+UUHr1xPBCwuS1eDwGPbHIcfuZEBXklxpYUDpRsGbD8aWXO3QB9OXzQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz3mH/YyhbwHdGavBDeFaDV/sV6f9rWWFzHGvuP+FCSq5KjmI/
 sqaHATdvVbXI65yxq7ZlYxw24i1C7z3//SaeH0a301T5Wbm+xHpEBhkHRyng1EjQw7dI0HGKhPN
 NF4Tr7INksJ2Ho9s1+zHfMC9ILY1dp82z6ghsVZfv7Q==
X-Gm-Gg: ASbGncubEDuYkRGnm5dAbWqafCT+7kzQy5fLMc5Ug0KfMEyaT3tqdS88QRLipkuwrSJ
 QmL5yLn65YNPZ2zjPrWSeQqoJMxSVqdl3TU4o3JftIatmJxhRoatSTrGOEoZzXv9aOaKc0GQXHK
 FZFtyjEO1llbIO0mbK10sMSdAJ5NJD9UhWlEoAHn7ZjrAKQ+bfYg76rAduZvwgvHTeKUd/pJqg6
 tsOKs5gezbsui83tFVhZ9honGk=
X-Google-Smtp-Source: AGHT+IHnF0lVhm+1Tun1UWlMLnnSk/jF/jUOt69DP22IOjEUNxjHdHqCJTIRGjm6XM6hiUq/Axp7jnIGuYc/D1Y8ZZI=
X-Received: by 2002:a05:6902:4381:b0:e94:dea:b80b with SMTP id
 3f1490d57ef6-e951c365621mr715984276.40.1755808604080; Thu, 21 Aug 2025
 13:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-32-david@redhat.com>
 <CAHk-=wjGzyGPgqKDNXM6_2Puf7OJ+DQAXMg5NgtSASN8De1roQ@mail.gmail.com>
 <2926d7d9-b44e-40c0-b05d-8c42e99c511d@redhat.com>
In-Reply-To: <2926d7d9-b44e-40c0-b05d-8c42e99c511d@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Aug 2025 16:36:32 -0400
X-Gm-Features: Ac12FXz8i_O0Dca-zCdGNOyRYVeCyfB9Z0ucQ3KoLazk0PNM2PIB2a_qe1sXKks
Message-ID: <CAADWXX81Y3ny6WvDN8EeYvBPa2qy10PKhWfZpj=VBcqczL6npg@mail.gmail.com>
Subject: Re: [PATCH RFC 31/35] crypto: remove nth_page() usage within SG entry
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>,
 Alexander Potapenko <glider@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, 
 Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 iommu@lists.linux.dev, io-uring@vger.kernel.org, 
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, 
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-arm-kernel@axis.com, 
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org, 
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, 
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, 
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, 
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
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

Oh, an your reply was an invalid email and ended up in my spam-box:

  From: David Hildenbrand <david@redhat.com>

but you apparently didn't use the redhat mail system, so the DKIM signing fails

       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE)
header.from=redhat.com

and it gets marked as spam.

I think you may have gone through smtp.kernel.org, but then you need
to use your kernel.org email address to get the DKIM right.

          Linus
