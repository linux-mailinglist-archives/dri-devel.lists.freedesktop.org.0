Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A21EB1B6C2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 16:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B25810E6A3;
	Tue,  5 Aug 2025 14:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="JpyC9h32";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998E810E6A2
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 14:40:31 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-76bed310fa1so2588979b3a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 07:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754404831; x=1755009631;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vkf1GCmjvA7ZUzJkkGOKsxb2wo0GT0xtYS7KUQa6OWA=;
 b=JpyC9h32oCD6/OPbSnBhQrPUtZZh8kuXDCmNv7Fv/ZdDezPlHuqr30Wz6SLnYFG1og
 sBEHGN2rMEgdpxZgZcWsBmuu510Ti0TC40gC8mLRpwCIhCER8rmT0yrrLOG8S9usQ4B2
 li+GJwDj4787XRhARGQc8oyl90yv2Aslkt/6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754404831; x=1755009631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vkf1GCmjvA7ZUzJkkGOKsxb2wo0GT0xtYS7KUQa6OWA=;
 b=cxFgy9VPc+6QJa7XA4LcNBnRZM61WPpKBAU5pQSoY381pbXOg/Ir4/Md4SDwFISbn4
 SKKLoOKImrtmU5W028yNauLExteL1sr0eFO5RwIY8uC/QH5Sk+ckAUbNwf5RnBPtAI+K
 Dqw8Dh0w46+bz696NKQuu68w5OYSpVpW+liTCHjquiL6ywhbcWlKd0v88QlRQc8Mysnr
 SG643W5PhrWp0VbG51Vj9XjCkISMvb/qbejKs+rgshMiNvSi3S+mNfIJonr9p6erHlBF
 cctrc+znbvmyQCxfHASEkBu0J9kxOOrJO8Tc43gqwI1OO6rGaeetVyGKbytFXCRiUbVR
 A8KA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWkXce3Zo7q4mletQnDrMtq+gXu3sifU8RZf4CADQaXm9CPbI5pbEHvUQe4FHjzJMm6NVJFmVkqcwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXkvEXPGkXQ+ckjBIc0IMcsg6/tRB6D+nwiCjMaFvWXBrhZmZe
 ulu5dtdSNVjU57r/605TVbyZHl02wXnoiFPdXG65KJLP+HdxwxQ7JKwQBlQPU707K+k=
X-Gm-Gg: ASbGncsJL95T4uZhTA0uUzVD8TS5qcW318+prWf784dWavVaXAzpV79zp7Z8VgUD1Zn
 mA/nmD8Wf1jxH0rW+k1lIRdXE9rEkM2xTtsrxw/JG+C51mzcRuJa4imIvF7JFjOE+UkD210ir1t
 76ed9ZFl/EF4ZZUpwgpGXV7503GKFvohMJ78W3puS1QpHuaDlYJVBMr1NQ0Hy7v7ITLY8f12zm0
 /vLjnpQMnHz55tOWddAh+0dopMqpBu10Hpk7utelKkdMz2uAyaDCCi4epiWr2JsxInWVDU1wyVM
 Kvb+y1B/J4nlShUKBmUaCzvRXgLygsvD1DvQdq0mM4GkguTcP/v1KYWPl755ZlQCGxzpPUOBOD8
 iXQe2hiCbnotyhwjNgzjxyHQ2zVxUuitG
X-Google-Smtp-Source: AGHT+IF0RwvmhRKAp8YRNzje9XBNHR/ZfEzyr/psSN5hODlw4/dzMItDKHBATpxgBROPqc4abmC8mQ==
X-Received: by 2002:a05:6a00:2394:b0:76b:f73a:4457 with SMTP id
 d2e1a72fcca58-76bf73a44d5mr14783816b3a.6.1754404831017; 
 Tue, 05 Aug 2025 07:40:31 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bf1c6d5dcsm7899757b3a.74.2025.08.05.07.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 07:40:30 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 9/9] drm/i915: Remove todo and comments about struct_mutex
Date: Tue,  5 Aug 2025 11:39:04 -0300
Message-ID: <20250805143908.32343-10-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805143908.32343-1-luiz.mello@estudante.ufscar.br>
References: <20250805143908.32343-1-luiz.mello@estudante.ufscar.br>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch completes the removal of struct_mutex from the driver.

Remove the related TODO item, as the transition away from struct_mutex
is now complete.

Also clean up references to struct_mutex in i915.rst to avoid outdated
documentation.

Signed-off-by: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
---
 Documentation/gpu/i915.rst |  7 -------
 Documentation/gpu/todo.rst | 25 -------------------------
 2 files changed, 32 deletions(-)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 7a469df675d8..ce0bb1a7af1f 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -352,8 +352,6 @@ Locking Guidelines
 #. All locking rules and interface contracts with cross-driver interfaces
    (dma-buf, dma_fence) need to be followed.
 
-#. No struct_mutex anywhere in the code
-
 #. dma_resv will be the outermost lock (when needed) and ww_acquire_ctx
    is to be hoisted at highest level and passed down within i915_gem_ctx
    in the call chain
@@ -361,11 +359,6 @@ Locking Guidelines
 #. While holding lru/memory manager (buddy, drm_mm, whatever) locks
    system memory allocations are not allowed
 
-	* Enforce this by priming lockdep (with fs_reclaim). If we
-	  allocate memory while holding these looks we get a rehash
-	  of the shrinker vs. struct_mutex saga, and that would be
-	  real bad.
-
 #. Do not nest different lru/memory manager locks within each other.
    Take them in turn to update memory allocations, relying on the object’s
    dma_resv ww_mutex to serialize against other operations.
diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index c57777a24e03..ff8f4ee32bee 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -173,31 +173,6 @@ Contact: Simona Vetter
 
 Level: Intermediate
 
-Get rid of dev->struct_mutex from GEM drivers
----------------------------------------------
-
-``dev->struct_mutex`` is the Big DRM Lock from legacy days and infested
-everything. Nowadays in modern drivers the only bit where it's mandatory is
-serializing GEM buffer object destruction. Which unfortunately means drivers
-have to keep track of that lock and either call ``unreference`` or
-``unreference_locked`` depending upon context.
-
-Core GEM doesn't have a need for ``struct_mutex`` any more since kernel 4.8,
-and there's a GEM object ``free`` callback for any drivers which are
-entirely ``struct_mutex`` free.
-
-For drivers that need ``struct_mutex`` it should be replaced with a driver-
-private lock. The tricky part is the BO free functions, since those can't
-reliably take that lock any more. Instead state needs to be protected with
-suitable subordinate locks or some cleanup work pushed to a worker thread. For
-performance-critical drivers it might also be better to go with a more
-fine-grained per-buffer object and per-context lockings scheme. Currently only
-the ``msm`` and `i915` drivers use ``struct_mutex``.
-
-Contact: Simona Vetter, respective driver maintainers
-
-Level: Advanced
-
 Move Buffer Object Locking to dma_resv_lock()
 ---------------------------------------------
 
-- 
2.50.1

