Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 371FDB48D2C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823DA10E4F2;
	Mon,  8 Sep 2025 12:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="JXwWERrY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4BF10E4F3
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:16:20 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-76e6cbb991aso3656204b3a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 05:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1757333780; x=1757938580;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3dThyWjbFAsz9j1SgyLPDQD4xfJC9BA0CDZ4xhkziqc=;
 b=JXwWERrY0xSr1cm5Z8iX7AQvDSGEyxxqo/21lMZphoJUvX/aKiJOrTWPac4UdA09aj
 CRjTvEJZ64wDVfvuAV/kml8mOBmbNosvfaNoOyUtQFUsK5rIbMrf4F6WhPCgnQfHOEOF
 O9N5uspM6qbnU9WjNjPbB2+FNzQJpt6yDuOXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757333780; x=1757938580;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3dThyWjbFAsz9j1SgyLPDQD4xfJC9BA0CDZ4xhkziqc=;
 b=JNVYfMVL6oRXQ6DHP7lsoA26I9qwVN5vACyWXfDS4pR7h6VpAXLr48d7v9vOyWgtJ6
 RTHjB6+XtbpDnuSeRjZ3JFfyPVg6dWk32Zp0cNWuYwAPg5z77lCt0Ms9LmRp8v48wl9g
 LGesITAT7rPyBf4UpD5GDBfmdK4xfneCjigheW9g8YgJ0BI5eCzlXK2Wru85nDqJySEB
 kTSC4UEPCS5QTLtTgnIiqQxsSFo8IAqdJN6mHhw9KxTHSo9mTSIOBsYy4Ksl+slNQGxi
 +W/Uzic4uo27tsdUVfZA/cww5SVOZjCnzzfaAA4MiV2B3+p5f5ojcZgQTZZ25aeK0EUS
 Gk9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuFIuJD0guOFRTyjI3NYQg0MZ/mQUa/q5pU1K3b3A8e3AWjU9Jl6Zb8iZRyUlmHLekzkukqXYf9HA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw33BFtuNrHJ7DJMSdXL5GNl/CJw1nAeGILoLfJnM8Njl+cI0P/
 TIPQHjVAYsQQnOmTtvgko11Mv+YIH+ddK5KLYqunbm8DDM8I9UFUgosUQBBXWzwR/Y+piGTZ1lK
 b7qR8WiDlaw==
X-Gm-Gg: ASbGnctHDErLDWHZWxDGRZtY5i2M8+UNUbQs7eJEJnGYNURImABT2W/mJOwavzCDk+0
 ZMz6Cohss6zC9Yxrkp32OnSLa70kgRM9Mmd8kkDQ+jy8VDjSbOeibjNCzAmdYx5fa7f11mSLn5t
 eTdMNs3i49Cown8d1dOr3vR3s/hu7JIsofoJne0cgPELrm1L2uj6JB0MjZH++oS98ooZt8pADOR
 reZQ9DCVaJiuGpJ89eNbhPgQy4t+foQDDJHBjfpKbysKXj0bEhkSkLrkH4H+6FM6x7iVZnsKJeA
 n3p1+Trz7SmYzBGV4+DmjHwEi/IoEWH9OnWQDsDzOqyRlOX16mELZ8xXYKAUEqeSKMrnDdE894Z
 UUG2CXMkTTrEaFUM4knYgHSuFfUeTRtN5Fm9SX72mVDQ=
X-Google-Smtp-Source: AGHT+IFx2lgoEhexSHKjV2ITkkprtdgb9CNXfr9aFy2Om5ILkrmex6QELuJSDwFf+bXGl0m57HjCXA==
X-Received: by 2002:a05:6a20:491e:b0:254:c182:3efd with SMTP id
 adf61e73a8af0-254c182443amr7479495637.21.1757333780298; 
 Mon, 08 Sep 2025 05:16:20 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:943d::1709])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-772306a1870sm28345188b3a.75.2025.09.08.05.16.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 05:16:19 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 9/9 v4] drm/i915: Remove todo and comments about struct_mutex
Date: Mon,  8 Sep 2025 09:15:17 -0400
Message-ID: <20250908131518.36625-10-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
References: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/i915.rst |  7 -------
 Documentation/gpu/todo.rst | 25 -------------------------
 2 files changed, 32 deletions(-)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 72932fa31b8d..eba09c3ddce4 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -358,8 +358,6 @@ Locking Guidelines
 #. All locking rules and interface contracts with cross-driver interfaces
    (dma-buf, dma_fence) need to be followed.
 
-#. No struct_mutex anywhere in the code
-
 #. dma_resv will be the outermost lock (when needed) and ww_acquire_ctx
    is to be hoisted at highest level and passed down within i915_gem_ctx
    in the call chain
@@ -367,11 +365,6 @@ Locking Guidelines
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
index 92db80793bba..b5f58b4274b1 100644
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

