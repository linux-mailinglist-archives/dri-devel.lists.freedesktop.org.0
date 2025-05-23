Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE22CAC2747
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 18:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1507210E833;
	Fri, 23 May 2025 16:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W2yYi5Fm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C417210E833
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 16:15:42 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-30e8f4dbb72so164456a91.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 09:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748016942; x=1748621742; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ls243XxE58XUFIhUPSeMMfbElJjdBNkZybvfZFLuLmk=;
 b=W2yYi5FmkvDV65YtVSdru8/O5u3mamcAwcEQ3LtRD4RVLg9OcnfuPzsxqS4U/6Rvp6
 UP/a5vVsDfltFKrKL1gujv6GNGH9Tq26AJ+LpSPJZtzsLaKXkqkjwkOs8rC8t85728OZ
 205HDZBwqykWHn3QASvnOmCMaYlLdhcTrWQLZiY6EbH9DwM6HNr8+OzW4EXFetSHFQl9
 8kt6hGegUIGGVQyL01Cb2I85RisO/1q62l3nGNCVyC/YfBScCSLHZS0k8zymsxlgJppM
 aVEOHR76HW2UT4ZozLU0lejJ1LlEX0a9UIf2JADkQ4KC3SQMqO8zYwZQ1VViQlxPlnsa
 Ma2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748016942; x=1748621742;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ls243XxE58XUFIhUPSeMMfbElJjdBNkZybvfZFLuLmk=;
 b=cKnHEcJ+0yl3fqXdqMGkLjQYjPVaX6Z8UYuXhVeFdFjYvKEc7yuAqvQmBb+RidrY0z
 nemogzAr+CXetA3iVi/RUpyeOU96Ct1daJyE8RNMnQF8itoWdQwm9n7+9vVRthmHTIO8
 rvVjZhXUhR7ZhZO3oyhCICoVouWzL5501F3oj1ZFna2wO2EcemzYfxR4nkuvNa8/mUZN
 UPx3975Z5VwSeH/+f0bUkrQuGgOOYsysqAKc2QuxMRMydqtd1zoxZLcmBn4K/1US9We/
 5cskDL8CaofIj6BDmrk2ErcF8KKMx1nt+NSwpN+WKv7X8AFIzypFzQed5mz1VDUVrrZ2
 EFwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBRcuJFsfw2N5qHNpfsezblHH3+PS80hEHsVKaZ2W8N6EgkEDB+Cznz8Ccv/jdfnNXWRVHILEPSPU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwY7c4fptTUWKWwEN1uDW2waZOCjUaz0HXfmnIhu+7U5Q8WPBlF
 ui2Pj8sG9fNh21JeKKpkKgb+BFLEzgLuDGm6UZnVIf18xd5ZK6hnhBMs
X-Gm-Gg: ASbGnct+HEZB3qaSdzwQzFFjRTm8k/Vf1mQZ5EkdzBvqj/EH6MqeW8f8jertaSvkQT4
 yx6ppgFAGcD4NxZoM7eN7kLYEGG17IiRO0c79JTFOQvCzaauGdBVbqoKkZKNczxQ72wI1B8tKHo
 0w6Gc51oI5kvQZk9xq6kx7EHbkerf7D+KGxwVlKKpvSqZCWPtOaOJcEsfmtssTxweSbhZFEuhE/
 jl/ir34iQlSrtxCV5JEVy54ZA8YT4Av7I56uQr7/IddqPxFzQ6y8MIhRV/Ls5+H6hRcEdzxdI8o
 kCRyxuFm+5Yb+THCuetfaX2/XEUL9xkNSQ6P/0szZw8gcdulIBPHuyoTD1+OtlqGMnZwqSwPjla
 U/aXBDrt+kZZmzm4RC9HFo8L5GXF4Rg==
X-Google-Smtp-Source: AGHT+IFm/aBR27COrCfUEG1WEEW/VaW4o7v7eFIsjnnSJARIe9dfY945CATNH/PdlGnGpUKKevkX5Q==
X-Received: by 2002:a17:90b:54d0:b0:305:2d68:8d57 with SMTP id
 98e67ed59e1d1-30e830ca02bmr37165622a91.5.1748016942269; 
 Fri, 23 May 2025 09:15:42 -0700 (PDT)
Received: from localhost.localdomain (c-67-160-120-253.hsd1.wa.comcast.net.
 [67.160.120.253]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30f365d46ffsm7526565a91.25.2025.05.23.09.15.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 09:15:42 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: simona@ffwll.ch, deller@gmx.de, haiyangz@microsoft.com, kys@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, akpm@linux-foundation.org
Cc: weh@microsoft.com, tzimmermann@suse.de, hch@lst.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH v3 0/4] fbdev: Add deferred I/O support for contiguous kernel
 memory framebuffers
Date: Fri, 23 May 2025 09:15:18 -0700
Message-Id: <20250523161522.409504-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Reply-To: mhklinux@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Kelley <mhklinux@outlook.com>

Current deferred I/O code works only for framebuffer memory that is
allocated with vmalloc(). The code assumes that the underlying page
refcount can be used by the mm subsystem to manage each framebuffer
page's lifecycle, which is consistent with vmalloc'ed memory, but not
with contiguous kernel memory from alloc_pages() or similar. When used
with contiguous kernel memory, current deferred I/O code eventually
causes the memory free lists to be scrambled, and a kernel panic ensues.
The problem is seen with the hyperv_fb driver when mmap'ing the
framebuffer into user space, as that driver uses alloc_pages() for the
framebuffer in some configurations. This patch set fixes the problem
by supporting contiguous kernel memory framebuffers with deferred I/O.

Patch 1 exports a 'mm' subsystem function needed by Patch 3.

Pathc 2 defines the FBINFO_KMEMFB flag for use by Patches 3 and 4.

Patch 3 is the changes to the fbdev deferred I/O code. More details
are in the commit message of Patch 3.

Patch 4 updates the hyperv_fb driver to use the new functionality
from Patch 3.

Michael Kelley (4):
  mm: Export vmf_insert_mixed_mkwrite()
  fbdev: Add flag indicating framebuffer is allocated from kernel memory
  fbdev/deferred-io: Support contiguous kernel memory framebuffers
  fbdev: hyperv_fb: Fix mmap of framebuffers allocated using
    alloc_pages()

 drivers/video/fbdev/core/fb_defio.c | 128 +++++++++++++++++++++++-----
 drivers/video/fbdev/hyperv_fb.c     |   1 +
 include/linux/fb.h                  |   1 +
 mm/memory.c                         |   1 +
 4 files changed, 111 insertions(+), 20 deletions(-)

-- 
2.25.1

