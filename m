Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A7FB30584
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E0110E3AC;
	Thu, 21 Aug 2025 20:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EE72sOfX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8021E10E3AC
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:31:31 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-4b109919a09so17884391cf.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1755808290; x=1756413090;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6aeG3+zXNcZH2d1Z1/su6zkQOg7Uc4j3Xw+oqie+iPw=;
 b=EE72sOfXOqchDuTOn6JyvSooWezGquh2ae2V7hVRGOPd7lj55MXInfxLPn79S1eJ9g
 vDOkmbsrsc5+kZhDTLJlfCF8+qbM73KUvFnvXabNI/zl+LYG+V6/ZdGqZ1Nd/nQGMVWz
 JOVTGlHZmZYtwVMKAYoqLsvOMjO3foid+8L5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755808290; x=1756413090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6aeG3+zXNcZH2d1Z1/su6zkQOg7Uc4j3Xw+oqie+iPw=;
 b=fqHNpC2kj+w5W6Sgz9kXgpvpesPpG0pqLqslJh+XG4MR3DA6IRWqfrQHSYTsZx6HI0
 A1nHOOGcJziBHXU4W7B2APmwyyeZMtuPjt2mpnaCh2V+AACFczHbWrFbz9yYwpy5Vc/6
 v7XNAfu8oCZD57hP99gSNfcnKeSJmRWkf9gO8hEsBk7DfK8Q6Cdci+PQ8cA5c1mVHJsK
 z9iQITVH7OrA+3ZdzlVri9QhBarrteVEtPz+PnxqgotuTqGOKY2nuy2R9pTwjBp7m1ve
 jcgeo1UjVsF7QR7oxg+44iwzo7JgegRL7Pf7KIh49w2qJreVAIXMxcjioaFasBfF0IZA
 GlwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqBLOBfR+57MnTJQ+7C+JzcbNKF7cvhWMTBkBoOh/ds3nWjH+GHWwQNfKeOgnCPzyJWTtTx6k4dR0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6aoBWn/n0ab2dtMksOxjOy5hb9GX/fZsteDPPh6PeC4+aAPM0
 neFloevOgPKIqK0KNOnGsAd8yHFpOTgv9vje0K92xjLpsSQMbk5N3FPYTHIx1ChCUw620hxcMRr
 AovxjB4U=
X-Gm-Gg: ASbGncsn6tltvhiAA9dVTZp8HVGTccUkmBDYZtQtF8pHL/hjCBKJgeQlK9yYbUQbd22
 /pkvG0UNuGTwQ3XS9bj1ArzurQgoOEubCk/osU5PyWTJ83hDUtLVQ4eJ0olTf7K7T+QkN5VbOTx
 IqnVxWuUqnEI6lCpiRs9ymPyJdBqhGfCm8DN8KoVu1I/FlzIvh4eaYsbRUkAYU4+2qOkxnlGtq6
 kJNEREr5w68F7JqeCG2TrQpWseCeuX/+L6iUHskee1nPH1eVufc4BIku2qQSEpLInw/4rMCMRm+
 Qx/fqBn3BR17mItVd97kpi7b4uwdOf6e4/F+5PPLo86QkJFpYymHnw7TzvELj9FFCaVHimTKR37
 Grgp5zrIHkdw/i0gUzU5kg6Cyi/mEafcZWjLMGhWt7pIYLi3tsv5OoeNQ5LOlbvQvWd1sxZQIEB
 zT
X-Google-Smtp-Source: AGHT+IFZoqE+9JdOF5ww/AojgK7lXsXME2R+tkRczy7pnn9cRjZo8N8RQ3OmSCZDYjGeX3Ae689lCw==
X-Received: by 2002:ac8:6f1a:0:b0:4af:15e5:e84 with SMTP id
 d75a77b69052e-4b2aab3b2bemr8028001cf.42.1755808289979; 
 Thu, 21 Aug 2025 13:31:29 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com.
 [209.85.222.174]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b11dc5a17csm107661631cf.13.2025.08.21.13.31.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:31:29 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-7e8706a6863so172299885a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:31:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUADWnEtq46LXlc1onelTTUH3kRP2peMdugZGkNKHuwHGNd5bzdUtCVm962l+vfRdxez2T9e5mXrK8=@lists.freedesktop.org
X-Received: by 2002:a05:6122:1ad2:b0:53c:896e:2870 with SMTP id
 71dfb90a1353d-53c8a40b923mr212315e0c.12.1755807884664; Thu, 21 Aug 2025
 13:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-32-david@redhat.com>
In-Reply-To: <20250821200701.1329277-32-david@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Aug 2025 16:24:23 -0400
X-Gmail-Original-Message-ID: <CAHk-=wjGzyGPgqKDNXM6_2Puf7OJ+DQAXMg5NgtSASN8De1roQ@mail.gmail.com>
X-Gm-Features: Ac12FXxaZhwn04a0gbwY6rjh9UGLxnRlGOG0Jy0WjRbVAG0UxLDqNy0Wydj0GQk
Message-ID: <CAHk-=wjGzyGPgqKDNXM6_2Puf7OJ+DQAXMg5NgtSASN8De1roQ@mail.gmail.com>
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

On Thu, 21 Aug 2025 at 16:08, David Hildenbrand <david@redhat.com> wrote:
>
> -       page = nth_page(page, offset >> PAGE_SHIFT);
> +       page += offset / PAGE_SIZE;

Please keep the " >> PAGE_SHIFT" form.

Is "offset" unsigned? Yes it is, But I had to look at the source code
to make sure, because it wasn't locally obvious from the patch. And
I'd rather we keep a pattern that is "safe", in that it doesn't
generate strange code if the value might be a 's64' (eg loff_t) on
32-bit architectures.

Because doing a 64-bit shift on x86-32 is like three cycles. Doing a
64-bit signed division by a simple constant is something like ten
strange instructions even if the end result is only 32-bit.

And again - not the case *here*, but just a general "let's keep to one
pattern", and the shift pattern is simply the better choice.

             Linus
