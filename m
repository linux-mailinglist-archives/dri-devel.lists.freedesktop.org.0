Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A584AB48D16
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 14:15:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC2110E4DC;
	Mon,  8 Sep 2025 12:15:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="ksu2QDhs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C25110E4DC
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 12:15:32 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-329e47dfa3eso3837129a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Sep 2025 05:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1757333732; x=1757938532;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ia+hUZJmf8zZI+6M/t/ltEWDdM46PEHluVyll3CzdAc=;
 b=ksu2QDhsVh7TBWPE4QF5+FZ26mPLSdm/lFv+WDD+pfWC0wayibkZROrWo1nVq85hAU
 uVQQNynwwJLoBwIfyJSh8PC83TMGjrCas90UekWEmSdfF6avaLHH/puxj9ncDydNXAE4
 9dW3FjM83moOnvCD9Vtbp9U2OlSjQB+cNHbGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757333732; x=1757938532;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ia+hUZJmf8zZI+6M/t/ltEWDdM46PEHluVyll3CzdAc=;
 b=wrCUv0jKlsb1FrI3BipQRlkxk8lUm+0K45GNeibvXfrK1bHplcReSC1dBHT7IxYhEh
 q9fgDCKopJ8+nPpS127skMwwVSFav4UUmr+mPwNaizyj+HnnsydknG4rKC/XtjLhNcKC
 W7WM3TuTKgr+ehH36D6d/6bvu3r4/8NwXe4FWOQv6+IAs41nWbZ/vuV9XIqHZfGOxaqC
 4ebpIxJWsMX0DrC2ij51J9Mn1fesFhhOJPluaU+W9DW786azfX4vmOuWqjl20GJpdk5C
 s5WFb2dH7NrcnGEM82tIYnoSs09WF7hlznmDwNIUxvLTVhgREP9w4LdZJH9UtyzRP4Rc
 ILig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwLwqWXHjNQuYzKOzJIfVuNfQY0VmysUn829XSq9pmK6ep9hl8noUygL2tqXVnceDqBYqUJqKSByE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFLIQZUe+k/7eEIxR0nKtHIi7s8aBLviyiP4faMoStGxzQ+hDu
 vKBBGr9TtQhicq48ANC72SfsNTxwrXsuhbdU3rtMLfMWwhtiIvGfVbSC3KYr6GzzzA0=
X-Gm-Gg: ASbGncsYIG86t2zk13VoGh4qP+Te29KQtGVaarkvpy9JzAGyBO+b8bG9iIZ+VkdhtLk
 nrC2eKvwI+Z3S4Kk3skfrIl3t4ZniO5ti8wqjEJC2RRBXMOxhYNAKqUgSi/HDzoeOFsFsMfqcDT
 jlA+7ZyU0i2E9ISKpbbC90LKAzWOxjhBA7JChptfL5L/tE3P1/eNhXRk1LhtZwBhF70jEBD9hdr
 OISmhPz5tOrz1jObsbDll4HF8mO8Tq6Xy7SQrW6MjOcpYSsVeulC37M+OuaNUAMzcsXMiCrWLKA
 qH/le5DC4qg5dANHFq/cuyXNAiwWtv0iC3n8hiDlrtk1oLbNLacPgQoa/jRAIPW6/3Hhbyok8RH
 wFUFNg87cVjiyCbq3hUU1iSPfs+TVWz76AWB+1Fqnk/U=
X-Google-Smtp-Source: AGHT+IHWQhozhXLN2meL9w+JEoU34rofGsCii6kWqAWU/UOMV2gqycJDmTFFq6m+MamT1Bm7R0YdaQ==
X-Received: by 2002:a17:90b:3812:b0:329:87b8:9fc6 with SMTP id
 98e67ed59e1d1-32d43f2b307mr11492435a91.16.1757333731665; 
 Mon, 08 Sep 2025 05:15:31 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:943d::1709])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-772306a1870sm28345188b3a.75.2025.09.08.05.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 05:15:31 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, simona@ffwll.ch, airlied@gmail.com,
 tursulin@ursulin.net
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 0/9 v4] drm/i915: Remove legacy struct_mutex usage
Date: Mon,  8 Sep 2025 09:15:08 -0400
Message-ID: <20250908131518.36625-1-luiz.mello@estudante.ufscar.br>
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

Changes since v3:
* In patch 8, the previous version only removed the mutex_init and 
mutex_destroy calls, but left the struct_mutex variable itself behind.
This revision fixes that by fully removing struct_mutex.

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

