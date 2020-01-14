Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BFA13BAED
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 09:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EDA6E898;
	Wed, 15 Jan 2020 08:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98056E329;
 Tue, 14 Jan 2020 09:51:49 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so12936824wmb.0;
 Tue, 14 Jan 2020 01:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aLEvn2Ayn70H2DlRMlH4wB1n/2RUWp9de4kG51hAiWM=;
 b=DzvBpaMP2qYCHMd+YfBzSn4MzVls4/yRDNRs0v+kJgeiL0gnvr8IBkkUKOvtRaF9Y5
 uJSstZ3c2fs8IrsqiJYZvScd4oDnoayzLFFLZfDORJw3qNfEXMwDVKyO5b+1NFUUligK
 MXrhv0oecFfvijVvcWXM9sGMsaqHbk7hwog0rQ3S7opEmZOCOj0EclL9s8XJJ1vxl7+R
 9ubHRzDEenBvDO4zBdc0ld7y+ij7ZlfB6ka41iQc0Q/cq4rrLl3KvJ3geB9l81aVf/IH
 dAe6SYVza6RKbm1ejOAaTGSK0z2cI2l52hSjx/fFDKh/NVu6EFVvV1EaWL/GVgJlyMsJ
 DaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aLEvn2Ayn70H2DlRMlH4wB1n/2RUWp9de4kG51hAiWM=;
 b=TLOLC6XGkZFejbsmsKVbcGdp5dSPyXNw1CTy3XwDo468vlzu1pMxqHatBNFDyyvxaC
 AAeZ5hHlKyuNLrNFlDpsI6+lCGkY4VH8EfMvVgX3RFxqAUh8QBC9MXVzpDmXpQ5eQf1J
 tFqCm2plijCzVMIgILjAj2PyldoW0Mh7q/MCFR1+XLxjS6f84OT+IJ3d/Q4A57rZomih
 Hci/uu7QgUxysENp22o8XRGLF2pfaSw/9i7LNseM0PBm8Pto7fCeY09pFjMrPDOBD5Iq
 3yHRLSOGBddoqK+GhNQvr648bk3tltNXrBwLEwXMx9t+rExrlMciz2m+Y8ZB8NexGDJ3
 rzgg==
X-Gm-Message-State: APjAAAVRBcK+vvQarkt4zZrz8xdMPdUkx1YZUg2KGbH6xCYZqxmdz5Jx
 Te+mC6aTEaFLxEka3181s6foO+AJYug=
X-Google-Smtp-Source: APXvYqwyWuWTAyJH+tuEviOhQCKon0vWYXH2VG6re00JGO2LD1smug8lZ717yxjmjfCvfNIGKuuEzQ==
X-Received: by 2002:a1c:e108:: with SMTP id y8mr25411938wmg.147.1578995508532; 
 Tue, 14 Jan 2020 01:51:48 -0800 (PST)
Received: from localhost.localdomain ([154.70.37.104])
 by smtp.googlemail.com with ESMTPSA id y20sm17454881wmi.25.2020.01.14.01.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 01:51:48 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 0/5] drm/i915: conversion to new drm logging macros.
Date: Tue, 14 Jan 2020 12:51:02 +0300
Message-Id: <20200114095107.21197-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Jan 2020 08:27:50 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series continues the conversion to the new struct drm_device based
logging macros in drm/i915. These patches were mostly achieved using
coccinelle:
@rule1@
identifier fn, T;
@@

fn(struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
)
...+>
}

@rule2@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
)
...+>
}

Wambui Karuga (5):
  drm/i915/atomic: use new logging macros for debug
  drm/i915/audio: convert to new drm logging macros.
  drm/i915/bios: convert to new drm logging macros.
  drm/i915/bw: convert to new drm_device based logging macros.
  drm/i915/cdclk: use new drm logging macros.

 drivers/gpu/drm/i915/display/intel_atomic_plane.c |   9 +-
 drivers/gpu/drm/i915/display/intel_audio.c    |  71 ++--
 drivers/gpu/drm/i915/display/intel_bios.c     | 357 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_bw.c       |  29 +-
 drivers/gpu/drm/i915/display/intel_cdclk.c    | 109 +++---
 5 files changed, 337 insertions(+), 238 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
