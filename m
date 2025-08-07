Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B81EB1DC45
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 19:03:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF84F10E89F;
	Thu,  7 Aug 2025 17:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="KFrpzTu4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED68D10E89F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 17:03:55 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-240763b322fso14220385ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 10:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754586235; x=1755191035;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WxXd9B8DBGX08WocawXYp5lIIUd7K+GPqtNigAOdZ8Q=;
 b=KFrpzTu46Lb7yF+OMzOmD+OS7ntrwnnXD4KZ+RSfRNToSgU/hIHtJegYw/ky0drixO
 4y4UopbO8DAjEePRj/JfVi73zjBLKqZR/S1td5URAKGWF9zhv5V3G6aoGAPVwNpNNzRB
 gxcZLfvD5498B00ntpdUQYnBujlA0srh2Ps08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754586235; x=1755191035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WxXd9B8DBGX08WocawXYp5lIIUd7K+GPqtNigAOdZ8Q=;
 b=NH3T3fIJ7oI6YaZWi7EqzHV4ytgr60M0fCq1fvlgxZF7BB8/PjStOdq1PAcbABrh7d
 L6z9d5Dr1U9uhTI3jMvLDyeMKVl+YzM+XfVdy/wg0RjcdQhCzOuBAnhlNhbLQ+6v6/jm
 g6g6uiWF4KySzoh26Ju7UX3/SWLShzmPqAyzBNks7h9q31WMVymV++tQC2SFZg8kpQfs
 1dj1Sfq4bMpb66S0jxQRGUw0vj/C5jP/VGy0Rj/9NAoX+DGMaASQWfqaslrCl9yEZfAn
 RkcytzFMenRzH999kveYFU+Qse7HkEq3akvLPVHjOBL/RskYKnIdGux3mR7TCH1BSq3u
 QeVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5fTpP5iA/lvMm4ao8AedwufQhCpqS7OQ06BZDnpxgtssQ3vCJuQM7xoR89OO3zXUDM+cscebj2Dg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsJhQ3OALKODmpkkgf0FD7oEU2fOx7FZg3PfOH/OAocPxR2iQM
 fcWY/6YxBIaAbjwyfbdv871J5Et7opGc/WSECLqX3ewSwe3YOHfeAvXlnLTF9CzFtJ0=
X-Gm-Gg: ASbGnctasD/vJoxRvas353TpBV4KEy5zxS0J5tAh4uYMjq6ZT0GwcGGm/YHxK+EFEx+
 MtjR/6/wX0I09Npw9vj26Ka4aOVN3xwzBBGEq6ARW25RXBeYqdJ3j6K9xpWSz0L8IWN+EzqX7bS
 SpTewBjh6yhoBauu7+S37a6Lc+LRelQqefaXmlgKuk/CdGhW+FRxdnJ8wDJYW9sBow/Ag0TMLBb
 kObveVXMkBiXHueHodB1s6rtGI3kiUh9zu+1UXiuww4Wn7cFIGwIRP5gL9LbP4dPn5ExAjg6qqD
 6InL//c7gBMAYhNgrM0cVUVc/fBjC0lC78cwJjtpeJUzbWpXSDFrvx2PByYQL0zmbo1qrSPC3L2
 Gt6wEQNSHeLmBLoEIfXf68giHt+uVGvQO
X-Google-Smtp-Source: AGHT+IHkzAkToxY5MWjggsb1AI28F6iPRYgIStSdlNZ/9T2C0i5cJqp+6NJ0z973X/9fZYTtVs5qhw==
X-Received: by 2002:a17:903:2a83:b0:240:70d4:85d9 with SMTP id
 d9443c01a7336-2429edeedc7mr103746375ad.0.1754586234931; 
 Thu, 07 Aug 2025 10:03:54 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef7c30sm188804875ad.37.2025.08.07.10.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 10:03:54 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 9/9 v2] drm/i915: Remove todo and comments about struct_mutex
Date: Thu,  7 Aug 2025 14:02:08 -0300
Message-ID: <20250807170212.285385-10-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
References: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
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

