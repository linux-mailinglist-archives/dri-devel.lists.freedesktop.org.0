Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F4239B495F1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 18:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D53D10E575;
	Mon,  8 Sep 2025 16:47:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.b="aRSmTrDx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D8610E573;
 Mon,  8 Sep 2025 16:47:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C55A3601EE;
 Mon,  8 Sep 2025 16:47:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4BCC4CEFA;
 Mon,  8 Sep 2025 16:47:30 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="aRSmTrDx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1757350043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHuXjtnGIwA8Zzr3bT7RPQh03xIe4TvMRJ0gk9Qtcas=;
 b=aRSmTrDxIs6NpeGo93fkReDvlHN1nyKT78wEVvyAxjkAXAC2k2c3mxuz/bJ82L8IZW1yN6
 pwkX2HXRtMpvSadVNNy+vTEk636HAjXuttfeyulU58v4gROvgN5dbku8+cv8xe9AeoEtRt
 vJnlgruF24VRNpNpSmzpwMaYauNKy6E=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 13974e7e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Mon, 8 Sep 2025 16:47:22 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-7452b1964f3so4285125a34.1; 
 Mon, 08 Sep 2025 09:47:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUihZPT4IMHaSCWvycfDQoWENgYSoSA9jYxdmFRMRzjZkVfZ8qCPjqAREAeG3K7GOwuasE9+t6NN8o5@lists.freedesktop.org,
 AJvYcCXnTmFrjkfaLSeiNqSTOuUhN6yGSi9CuMbnft31kwirPvmLWPcoFJaZ58aDFp90b/DP/Vcryzj36AQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWH7Jab0CcdQLwsZeU67iIILpSp9furg8+coIY5l7Q2MMMd0Ym
 ULu2MXe8zzunSQ+GYGuH5Y5haxLvLD0+P8ubl8sRNYe4CqsonbgvYN+AUa1BkdSmUO5pyCNmuy4
 G9NMOIg9xqZXVv4K7DJaUaPA2f66+RQc=
X-Google-Smtp-Source: AGHT+IG1lksSpt4e4b7wpOLuoBOgU4CtzIVFITSYKRy7vIMNnTgG60R226zI8so9rVaf/KD14awSBHuCM8l64s4kZfU=
X-Received: by 2002:a05:6808:2e4b:b0:438:37eb:62b2 with SMTP id
 5614622812f47-43b29b952ffmr4287499b6e.44.1757350039548; Mon, 08 Sep 2025
 09:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250821200701.1329277-1-david@redhat.com>
 <20250821200701.1329277-6-david@redhat.com>
In-Reply-To: <20250821200701.1329277-6-david@redhat.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 8 Sep 2025 18:47:08 +0200
X-Gmail-Original-Message-ID: <CAHmME9pO-g4qUUsbF+XZqcPcwfP3-N7AxR+MX6G73adc2-NAkA@mail.gmail.com>
X-Gm-Features: AS18NWDayNVnEOpkO7Cmy5o2hUWkz6cio8gfE7ZsOxyaASSZD8l09i-KslFVPvE
Message-ID: <CAHmME9pO-g4qUUsbF+XZqcPcwfP3-N7AxR+MX6G73adc2-NAkA@mail.gmail.com>
Subject: Re: [PATCH RFC 05/35] wireguard: selftests: remove
 CONFIG_SPARSEMEM_VMEMMAP=y from qemu kernel config
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, 
 Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev, 
 io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
 Jens Axboe <axboe@kernel.dk>, 
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, 
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com, 
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

Applied, thanks.
