Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 126D4B1DC2A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 19:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BFC10E486;
	Thu,  7 Aug 2025 17:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=estudante.ufscar.br header.i=@estudante.ufscar.br header.b="E06iYcOv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF4D10E486
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 17:02:22 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-b3bcb168fd5so867672a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Aug 2025 10:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=estudante.ufscar.br; s=google; t=1754586141; x=1755190941;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZaO9Fe6fVJs4lLHm6b8LVPI5toPK6qa+tQOYhilxiBk=;
 b=E06iYcOvpIBiyEUbVktmNvyKijyiHXELRnofu75B+VZNvwtbwYLdN7Gu+IU66/rklr
 3PsITOdkNXXf3NazO/XtFw1yvCJh+rDiyRmAVvQzrBlcMOwLifnkQ4KszRhss0efjHDB
 mljmdVZtIYY6eIVzrNkZNmJwPU/cuECv2ID6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754586141; x=1755190941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZaO9Fe6fVJs4lLHm6b8LVPI5toPK6qa+tQOYhilxiBk=;
 b=QZRojAfmNsb4VFNd2T4ffMrLsll8b+bG8ENB0iO06ufOxgVdbmkClkjS+SJJ6kgEAS
 EL/rHUKOMSTxzL8wprj0MDlUenZ2nUUDnWFlW9vAKaS6qFcxX4nlkmQ1rWskLFqbdcYe
 5aeSaDC8A9rRTe9IguUCDxVRPd5Doa16zlujO1OJQaa3oLpJXEkRrW3WtjJUdmEHTYXo
 BgehKU5vKVWfmpJ/S1aGVzyOuDQ0BHsw2rakAWfYNjECPMXv/lOxfemlstJ5C5XHVcV7
 I2wJnnRO+KJVa97daOIeSkEPHJIjDj5JJgQRj9k8hv0tPjFYnn1flZrYBNg4cHDazfZk
 SXkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTcwo/spxKPXNwI/jLgeqxbCgXXbFKeprkvxaIV89RPDeLBzcAi0V6Ndu+HRKVhLnMvYp2OmhhclE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybUvxX1IhzSTHC+ireA+a45La7A0xBItVn8z6gIiKZ1qsThK9B
 SQZ0V932NqbXJhXs5tHp0Ji30KFCoZNQkgIMpdChhZUZxf+ruf5MZJ9ptE8yrauZ0fU=
X-Gm-Gg: ASbGncvO9TbjpWNPluuH0VCr3J02U/jaKG7P8SRRzvwM0vtYKHaxRLSNY3q5ZLDa7qt
 mDox7hlcQ6eN9Ysja3R4ZtwL5Re81JlIfNVRPmE5H8U87ot5sexfm5oEGi1lTMyp3ZtqjtpSiJL
 AMx6reirQsQCBLtYTkmpyLWl/9oi6lQlK+D55uaURJ1Ob/g5l+To/7M8SVzpK5XERXK+AN5dsfi
 qdUn84GsoR8oaZwKoYfH2iUx5SH4IJKrjEeR+A10gHNvKce9Bz9ftB2etb759yrk1+2PMSZRg/G
 hNP2gsHVK58xrQbA4qWzWRKbPsyE+A1eiGHf7KnwvlO6MdBloE60XtqepLBbUC5ECNTWLubSU0J
 qP+1UC61vgMcsL+F1x9FW8aU2ISd5DdyL
X-Google-Smtp-Source: AGHT+IFK+ZezH+hvk9aAkXC9uQ/QHddEWIeRLOs9MEcStK4KpXlwSxFOJpVgYZH9jxVivwBafuE3HA==
X-Received: by 2002:a17:903:1a68:b0:235:779:edfa with SMTP id
 d9443c01a7336-242a0b3e4c6mr145222125ad.32.1754586141143; 
 Thu, 07 Aug 2025 10:02:21 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:8ac9::1a55])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef7c30sm188804875ad.37.2025.08.07.10.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 10:02:20 -0700 (PDT)
From: Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
To: rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, jani.nikula@linux.intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, Luiz Otavio Mello <luiz.mello@estudante.ufscar.br>
Subject: [PATCH 0/9 v2] drm/i915: Remove legacy struct_mutex usage
Date: Thu,  7 Aug 2025 14:01:59 -0300
Message-ID: <20250807170212.285385-1-luiz.mello@estudante.ufscar.br>
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

Luiz Otavio Mello (9):
  drm/i915: Move struct_mutex to drm_i915_private
  drm/i915: Remove struct_mutex in i915_irq.c
  drm/i915: Change mutex initialization in intel_guc_log
  drm/i915: Replace struct_mutex with guc_lock in intel_guc_log
  drm/i915: change comments about legacy struct_mutex 1/3
  drm/i915: change comments about legacy struct_mutex 2/3
  drm/i915: change comments about legacy struct_mutex 3/3
  Remove unused struct_mutex from drm_i915_private
  Remove todo and comments about struct_mutex

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
 drivers/gpu/drm/i915/i915_drv.h               |  6 +++--
 drivers/gpu/drm/i915/i915_gem.c               |  3 +--
 drivers/gpu/drm/i915/i915_irq.c               |  6 -----
 include/drm/drm_device.h                      | 10 --------
 15 files changed, 33 insertions(+), 72 deletions(-)

-- 
2.50.1

