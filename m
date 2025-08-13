Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F24B24B0D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 15:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D19810E715;
	Wed, 13 Aug 2025 13:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="ikprN/2E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2E710E021
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 13:50:53 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id
 41be03b00d2f7-b429db71b3dso4725627a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 06:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1755093053; x=1755697853;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o9QpCg6SOxitgtuC4/wfeZriEuxgyfcHAsMI7G1kjac=;
 b=ikprN/2E+2T5g3/yVkhYB9LOAe+UWBWBWAObu5qfiPB4jPXFW3xHyIyI5twSnZ6zRD
 b+gNHgAfKCI4ny4J22VfsceS+7Qz5h+cDdhI3Xt5bllFycp8YS7oxuGAuYmtS0//+mA4
 t0+uS2Pcys4VcJISZjXqT+jwZdYX85+X1P7Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755093053; x=1755697853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o9QpCg6SOxitgtuC4/wfeZriEuxgyfcHAsMI7G1kjac=;
 b=AZpZ3rQeF8aO8xi0MS+6+I1RQky/4cixP7ZcO/l/7c/F6imt2v+sbyW2cYyLTQk45P
 EvAnY8WYkcruHlziFR5KkFQ5UIpD+/QGOOUiRt1ILJkUMTpmmVt9Q0j8slmY+aufZHWF
 StDowGzFAfLvlZNIggWGiBb/zD+nW2JihEum38ZDwdLfa0Zl5xmGs2wuubm3MDYgxq8y
 dNx3BMPwjVRbDd3/JBSQ/uu4UDieADYasNIO5x+WvbKA/lGwQaZwj7uGjfyqC9BhBz0m
 Faezm6w0lGhceivWkNdnekmZQeOFEKf9CzuRlgx03l+dG7ivzAn7cpBi7OSPefrsnEN7
 W0rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPA1dnXrqgOD2f8Z7tYLp34WmftEQSIlNI6GomXNQ6R+RWsz35EDT/I2wZUUU8uzjch/dDPz5akdw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIw1kmQaEFRXzEvu3RRO8gvNy13lQXX9nOP4nbgEyEI0ydTT4b
 dFffp/mF9xbZKtYoLn00OMedzk7o1KpnVcGhf0cRGyOvY/Cl9hEL4kMf7pR4oHHhha8=
X-Gm-Gg: ASbGncsQVB3R54v5Ecc+n1wxojlLp5ZAZvge61zB8wGX0bD4Ph7fNH8UmKlNG4UkhKt
 KCzg90LC5a05yWh3M22LGlTSdW1P9Mj3LxV/6fXzX1TUZOhuABD5nkmOS5wLvq99x+9bx45BHkv
 Qi8kaLs8UEnLiwbsieIFepZO0pWsFBWOynwe3MM4CkUtwf0Sc4LT84AldKtO9xyMLVsotzIm+Cn
 O9ZWihKY3mMQNHdGms1urMINLiArSbw0yq4m+If1O0SpuJwtFTs+I/SZKY5n8at4bMWC+QGkLMI
 0Xq405aIUPg1j3mxo0HBDKfnB3HVUPSq/CaA7qZko5EXmPRGHJlcdY2K9a9fjbaJAcH+mhWcpUg
 E3qn5YfKx5cbkfBS0z8LUEgWuaeIw24wN
X-Google-Smtp-Source: AGHT+IFOL/f2Pi8YdUDIexGQTTrc7uv9+BlJFeIXVxDVySCr/wPEa7YKtcTOyt37n011Rj3YjkX20A==
X-Received: by 2002:a17:902:c401:b0:240:2281:bd0e with SMTP id
 d9443c01a7336-2430d08b1a3mr51566435ad.2.1755093052624; 
 Wed, 13 Aug 2025 06:50:52 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1709])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aaf855sm326965955ad.168.2025.08.13.06.50.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Aug 2025 06:50:52 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 0/9 v3] drm/i915: Remove legacy struct_mutex usage
Date: Wed, 13 Aug 2025 10:50:24 -0300
Message-ID: <20250813135035.144762-1-luiz.mello@estudante.ufscar.br>
X-Mailer: git-send-email 2.50.1
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

This patch series completes the long-standing effort to eliminate usage
of the legacy struct_mutex from i915 driver.

Historically, struct_mutex was used to serialize access to global driver
state across the DRM subsystem. Over time, it has been gradually
replaced by more fine-grained and localized locking mechanism. The i915
driver was the last remaining user of this lock, and even there, its
usage had become redundant or outdated.

Specifically, the mutex was only still used in two places: i915_irq.c
and intel_guc_log.c. In both cases, the lock could either be removed or
replaced with a more appropriate lock.

This series performs the following steps:

* Moves struct_mutex from drm_device to drm_i915_private, since i915 was
  its only remaining user.
* Removes or replaces all remaining uses of struct_mutex in i915 driver.
* Updates or removes comments referring to struct_mutex to prevent
  future confusion.
* Deletes the lock entirely from the i915 driver once no longer in use.
* Cleans up the corresponding TODO entry in Documentation/gpu/todo.rst
  and comments about struct_mutex in Documentation/gpu/i915.rst.

Some additional notes:

* In intel_guc_log.c, a missing destructor for a lock was identified.
  Since the series introduces a new lock in that area, this issue was
  addressed first, to the two locks do not lack memory in kernel.

* Comments referencing struct_mutex were spread across various parts of
  i915 codebase. To improve clarity, they were cleaned up across three
  separate patches.

The only remianig reference to struct_mutex is in a comment in
i915_gem_execbuffer.c, inside the eb_relocate_vma() function. It was
kept because the intended locking mechanism for that case is unclear.

Changes since v1:
* Rebased onto latest drm-tip as requested for CI compatibility
* No changes to code/content

Changes since v2:
* Rebased onto tip/drm-tip
* Correct code formatting

Luiz Otavio Mello (9):
  drm/i915: Move struct_mutex to drm_i915_private
  drm/i915: Remove struct_mutex in i915_irq.c
  drm/i915: Change mutex initialization in intel_guc_log
  drm/i915: Replace struct_mutex in intel_guc_log
  drm/i915/gem: Clean-up outdated struct_mutex comments
  drm/i915/display: Remove outdated struct_mutex comments
  drm/i915: Clean-up outdated struct_mutex comments
  drm/i915: Drop unused struct_mutex from drm_i915_private
  drm/i915: Remove todo and comments about struct_mutex

 Documentation/gpu/i915.rst                    |  7 ------
 Documentation/gpu/todo.rst                    | 25 -------------------
 drivers/gpu/drm/drm_drv.c                     |  2 --
 drivers/gpu/drm/i915/display/intel_fbc.c      |  6 +----
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  4 +--
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  4 +--
 drivers/gpu/drm/i915/gem/i915_gem_wait.c      |  8 +++---
 drivers/gpu/drm/i915/gt/intel_reset_types.h   |  2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    | 12 ++++++---
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |  8 ++++++
 drivers/gpu/drm/i915/i915_drv.h               | 14 +++++++++--
 drivers/gpu/drm/i915/i915_gem.c               |  3 +--
 drivers/gpu/drm/i915/i915_irq.c               |  6 -----
 include/drm/drm_device.h                      | 10 --------
 15 files changed, 41 insertions(+), 72 deletions(-)

-- 
2.50.1

