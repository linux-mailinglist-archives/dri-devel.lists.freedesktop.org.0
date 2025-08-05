Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE60B1B6AE
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 16:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D3710E478;
	Tue,  5 Aug 2025 14:39:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="C0AsDbPr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13C510E478
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 14:39:26 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-76bfabdbef5so2317728b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Aug 2025 07:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754404766; x=1755009566;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qdVZXCiIO7ug31YUFClpvZqUEX350zwu/Pv3sCY6zPA=;
 b=C0AsDbPrlMWmg19+nldXlTkTiUqh+hkSEVv1juWTcFYZ/+fGRhzrsd3nzi7pbDE3uN
 K0eMWYfhepUi9DDsZafLSf5lsWol54TPbJgQOWev72Ic1GLFMKPvKGLbJefFvG2kJQdq
 0jGsBocQSGQsvFFYI41zvUvqwHklZ/vk/FtvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754404766; x=1755009566;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qdVZXCiIO7ug31YUFClpvZqUEX350zwu/Pv3sCY6zPA=;
 b=YLJNZiOvnVDJiOek5PadAQSOfJKQQeanVWehTZhMBM/TYiADi4xS1cF0BeMamHionz
 vpjHyv3OKf1NSzbpDMsUl4/Fyw6JlKZ/ErPUkCZ376v27latQfs6VKLoFwg0y1y6AGZ5
 QBJbr6SXr5yeY6TQ99hKGkyo75IVLArFr+ubu0AsWfDhL+9cuocQ1W80duA9qaWgezZC
 tAKyYbRqP6HLX9SZCKY79aSCTl/wIGpVUK82KPb7AUBrnXz6bJwR497J0ob17BC98Qnl
 +zFJ4NDNpHGJjpZkMeVO0LmBZ6Bs9tmaMx8c55w7A7ZChyZiUZbu/UUyEz04iSh9CNU9
 hcPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/o3ji5D6zI9163I7Cb9TmcvIiNFB1rb2qwSp4aLUZzR0EQjlBC7m8jqcDUAGryG+M8PdJ0AVXFXw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIAfPTdCptWmjeGt0jOcsJb5gk+FdrGS5xnxki76V0Ym3ndgtt
 ErD7mBcviWd/qZstFW+uzBltbXanPHX3fGDUojtddMcPw6+x8GT1TswahkPj35if2uA=
X-Gm-Gg: ASbGncuxq8Y5+yz1BZvmAkm0elw8s615TV/z900N7KZY0Ka+LHMHzgU2EQhrRb6GOxQ
 Da2S8ikRz4CmCcDsk46ZEEtlIB1WF7mVKPRzuvS0yQimLYtXmdFYya538gpZgL57MOnLIWY9M8e
 YCF6XIPw91TWTXcZXVoj1Yt54LlzrwCGsrXz0IpnahP3a2FfhQKqWv1oNqzLoDmtpp2tWqswPcc
 gFK4xlEamR2fDUbYScbALFaWANgsfz1wpSOaXO69YoNxqIq7iZNG4Ijhg3xgdW8vH2Sekk15QbA
 1BeRkd3QlU497wc2Sk+6JrfrDPJ7Tw3hvSg2RCHQsZB8RbNbQy4A4wOYTLUHIycIRp2bTAy9/Uo
 qCJnyQCCu3qv85apWJZG4Plw20/xO6tmW
X-Google-Smtp-Source: AGHT+IFS5qPoqNEui+Z8+SDbcPC53GXm05RMSKQnq+9XNn0hHJsTCS+ZSy9epP1qV6UhFLp2idOvUQ==
X-Received: by 2002:a05:6a00:804:b0:76a:d724:d6fe with SMTP id
 d2e1a72fcca58-76bec4c1f5dmr15501224b3a.11.1754404765895; 
 Tue, 05 Aug 2025 07:39:25 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bf1c6d5dcsm7899757b3a.74.2025.08.05.07.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 07:39:25 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 0/9] drm/i915: Remove legacy struct_mutex usage
Date: Tue,  5 Aug 2025 11:38:55 -0300
Message-ID: <20250805143908.32343-1-luiz.mello@estudante.ufscar.br>
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


Luiz Otavio Mello (9):
  drm/i915: Move struct_mutex to drm_i915_private
  drm/i915: Remove struct_mutex in i915_irq.c
  drm/i915: Change mutex initialization in intel_guc_log
  drm/i915: Replace struct_mutex with guc_lock in intel_guc_log
  drm/i915: Change comments about legacy struct_mutex 1/3
  drm/i915: Change comments about legacy struct_mutex 2/3
  drm/i915: Change comments about legacy struct_mutex 3/3
  drm/i915: Remove unused struct_mutex from drm_i915_private
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
 drivers/gpu/drm/i915/i915_drv.h               |  3 +--
 drivers/gpu/drm/i915/i915_gem.c               |  3 +--
 drivers/gpu/drm/i915/i915_irq.c               |  6 -----
 include/drm/drm_device.h                      | 10 --------
 15 files changed, 30 insertions(+), 72 deletions(-)

-- 
2.50.1

