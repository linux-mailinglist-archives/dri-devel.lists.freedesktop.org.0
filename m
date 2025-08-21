Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02342B3036A
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 22:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E42010E3B5;
	Thu, 21 Aug 2025 20:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bXrZmPeh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EFD10E3BC
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 20:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1755806843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iU84NUWejaBSUFBs/T0/O04YrYLlq1RcxZMywEFGjU0=;
 b=bXrZmPehYJDBOtI/hYSV3Tx7nBcN/iN0z8iYigjBFp69tS8F0dO+ewoK6msuz6k5zEHtOU
 76Wdpk2jLgXSDCHIS7dldUMZfjpGBekEKB/s5AW9Z74LxiWeJdM2e5zfWIaRNQO6JzuO1C
 uhm1gEc5RxWdjnA08MZllTSsupy3VvA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-y-IYeMWtP7iAm-CgYP49eg-1; Thu, 21 Aug 2025 16:07:20 -0400
X-MC-Unique: y-IYeMWtP7iAm-CgYP49eg-1
X-Mimecast-MFC-AGG-ID: y-IYeMWtP7iAm-CgYP49eg_1755806839
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45a1b05b15eso10515285e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 13:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755806839; x=1756411639;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iU84NUWejaBSUFBs/T0/O04YrYLlq1RcxZMywEFGjU0=;
 b=j9wVa9VNJ3pe9j0oRqA/bC21lqkuuqWaGZPCknukfEchx/Jc4rVVPm9FadJLYeSGb0
 8Ta8oj0QCW9SSCGtlYZ5s7DRrsmrRGGTTvBvvG8oX4x39FJZXQZFi2eEyWfEXhvU4Wrz
 h7+YP0HAbUmK+mQ5J3HlfqEX588HThU+PrEOMj+TH01C3SP1kYrVqpVrJKFOmEmJoj+i
 xHax8u/w07JSlvTOMQYQrsKJrpTr6WCTINmCG/1F1rfB3b8k/lpFjB3H+/BaTdFZwxrZ
 E0RTIsBte0SMPatzBvSe3Bdllr6ujbsIrBCBdzlHLBfr4U77F3by8hxVzK+oHAhfsfJy
 jOMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDYJHruuGV+tctY2MsI2C3lUk6wQOh+2xSBrsJmIPnPoDiTz1h5Zlt8AszkRUHYHhEGFvVk15Ayzk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjJPS6CpUnnRpK3F8mopFT/L3yy1CIAJt3j8js6DmZijrpkv4v
 RkcPUAqWdYZVs3SnfwJsV5aJpChQjT2K+SkDQnaYsuWAE8WkruZZmKezSUhN0oElwMCKmlhkqDp
 ptJqPPto+bxaNmkRcKvegxV748yAjp7uS4DEZ95EN9FHkuO+S4FrbPhcQHS73HkqQl4Ri7w==
X-Gm-Gg: ASbGncu7F/Bcz21LJ+qRWUiGi3gEGcn386vky+RlIeq3uxb8lQY3BeZ1VyuJINUnjhv
 bQSNyoY8WP1MEMU6GBrF+0b0eDBBJF+mt3VDVDx/wBvnh7/dyZ0xTUicyRUm08lsDNNR7TAMIiw
 dsKWa2xxY3OVTtFkguG0Bi1FuSOqIjTLghQ9MnwtZMxqoB4IWezZ7TN8q3R0imqoRBpiHtR0FJk
 Ge6M9oxIhbqqJDkvyY/rcqJnMoozNimHPxno6PzicVX98FLghaNcfX+cgE35VqIm9XZzMf3o0Mp
 /OP5qfJEipJ6bd9Jy5rX6ZK4KAR0LukVWW2o6oVeTW5NrSWFWTsXXddPgIsmziIkn5wzJNBWQ8J
 r+qwsAmO6J44V/awCKl4IMA==
X-Received: by 2002:a05:600c:1f95:b0:459:db80:c2ce with SMTP id
 5b1f17b1804b1-45b51799428mr2845345e9.7.1755806838944; 
 Thu, 21 Aug 2025 13:07:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMhnqxttMNkrL8PAxIX9Mfq64uKkvY2MjzJ39LtAH2Yg7PxwVl8kOZ6CXLaaMF5rYTxrWwyA==
X-Received: by 2002:a05:600c:1f95:b0:459:db80:c2ce with SMTP id
 5b1f17b1804b1-45b51799428mr2845125e9.7.1755806838506; 
 Thu, 21 Aug 2025 13:07:18 -0700 (PDT)
Received: from localhost
 (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de.
 [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b50dea2b9sm8988005e9.15.2025.08.21.13.07.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 13:07:18 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 04/35] x86/Kconfig: drop superfluous "select
 SPARSEMEM_VMEMMAP"
Date: Thu, 21 Aug 2025 22:06:30 +0200
Message-ID: <20250821200701.1329277-5-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DSWiMep1cRKFeq26ESUhw1mj62kkJryvx82cgnJWPkM_1755806839
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

Now handled by the core automatically once SPARSEMEM_VMEMMAP_ENABLE
is selected.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 58d890fe2100e..e431d1c06fecd 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1552,7 +1552,6 @@ config ARCH_SPARSEMEM_ENABLE
 	def_bool y
 	select SPARSEMEM_STATIC if X86_32
 	select SPARSEMEM_VMEMMAP_ENABLE if X86_64
-	select SPARSEMEM_VMEMMAP if X86_64
 
 config ARCH_SPARSEMEM_DEFAULT
 	def_bool X86_64 || (NUMA && X86_32)
-- 
2.50.1

