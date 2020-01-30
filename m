Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 616DB14E962
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F5E66FAA9;
	Fri, 31 Jan 2020 08:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B5F6E593;
 Thu, 30 Jan 2020 08:32:37 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id m10so5885520wmc.0;
 Thu, 30 Jan 2020 00:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yE4btNB8EfxUzZqxFyA6oEbNKF4HFpMWZ+vsvZanBPg=;
 b=HNe7I55/5rRr8SyjTzJHXRpJUL6dRGWfNb+HRWVWLxMpgDX4FqSKzzcjy7STlolkxD
 pu5tpHr4B4jrLwlMcSIPtSNS6cGHqinsfJj65smxjqChnCCkdcNSeut9HxYhi4izOnN1
 6LWOG+pdV7MtOZ3wWyKLE9HHzrvk4nVeWqSHzsdRoVs8rESQG/BOGY03sbQpAQGy6Ibs
 6VWDYVI7GQ8Cnh0ug2O4FsimWhdHq4ki5xG7SYyeCos/GopA7+7rSXQGDmIDYUzsS597
 oJKd8PU/tJWmQrUoJOr0qUQpzjy7LnnG8DaBxrtZm/IucmR+n/prYUZGJY9YE3/6+4u8
 y43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yE4btNB8EfxUzZqxFyA6oEbNKF4HFpMWZ+vsvZanBPg=;
 b=nzJa/f46QYMKnBAFrJAa5cklPfugIFUvvKJolT2XtlEFUGCak15X+9Q8gS8t6yY7Y0
 aJKBpyJFfe3nytcrHEMsF+gb9r1Y3sHY4oIq4gSeKMUmYTiNFBA7Xx5tdJjxh4pBMboP
 QK+FAAPKdAA15gjzgce12N2C4DQXI6EgQ5K4j9lyn5H9aOWXPVRrydDUc/jMh2jKqLkw
 3o34rvdPEijiHaGBh39WJV2PMB45XsjkT0dyVlhESZCdJpLo0/0OJQEaIFNfcl9SEFpF
 z6i4aI9ku3RWgFN/ffBlEmpoXD8Na7KPdVCFG4QPUIFPVDii6LmIwZGoQiVRsWUzzUci
 vrRA==
X-Gm-Message-State: APjAAAUhMaTaBPRtL1halqkLrzbV5KEMyOUoTDE0ajZYM9Mel1EJptYB
 gWguTuRBoPpL4LVrvkkv3e0=
X-Google-Smtp-Source: APXvYqxy3AIofHVFPr2m//HDYIzmTD2loozf5TIXJg9FJJMqCPnU14ZPgW3fLcWsMJwM9OQUjcRL5A==
X-Received: by 2002:a7b:ce98:: with SMTP id q24mr3995609wmj.41.1580373155616; 
 Thu, 30 Jan 2020 00:32:35 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i11sm6363678wrs.10.2020.01.30.00.32.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 00:32:34 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 00/12] drm/i915/display: conversion to drm_device based
 logging macros
Date: Thu, 30 Jan 2020 11:32:17 +0300
Message-Id: <20200130083229.12889-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jan 2020 08:04:00 +0000
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

This series continues the conversion of the printk based logging macros
to the new struct drm_device based logging macros in the drm/i915/display
folder.
This series was achieved using the following coccinelle script
that transforms based on the existence of a struct drm_i915_private
instance in the function:
@@
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
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

@@
identifier fn, T;
@@

fn(...,struct drm_i915_private *T,...) {
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
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}


Wambui Karuga (12):
  drm/i915/vlv_dsi_pll: conversion to struct drm_device logging macros.
  drm/i915/vlv_dsi: conversion to drm_device based logging macros.
  drm/i915/vga: conversion to drm_device based logging macros.
  drm/i915/vdsc: convert to struct drm_device based logging macros.
  drm/i915/tv: automatic conversion to drm_device based logging macros.
  drm/i915/tc: automatic conversion to drm_device based logging macros.
  drm/i915/sprite: automatic conversion to drm_device based logging
    macros
  drm/i915/sdvo: automatic conversion to drm_device based logging
    macros.
  drm/i915/quirks: automatic conversion to drm_device based logging
    macros.
  drm/i915/psr: automatic conversion to drm_device based logging macros.
  drm/i915/pipe_crc: automatic conversion to drm_device based logging
    macros.
  drm/i915/panel: automatic conversion to drm_device based logging
    macros.

 drivers/gpu/drm/i915/display/intel_panel.c    | 100 ++++++++------
 drivers/gpu/drm/i915/display/intel_pipe_crc.c |   7 +-
 drivers/gpu/drm/i915/display/intel_psr.c      | 128 +++++++++++-------
 drivers/gpu/drm/i915/display/intel_quirks.c   |  10 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |  29 ++--
 drivers/gpu/drm/i915/display/intel_sprite.c   |  60 ++++----
 drivers/gpu/drm/i915/display/intel_tc.c       |  33 +++--
 drivers/gpu/drm/i915/display/intel_tv.c       |  26 ++--
 drivers/gpu/drm/i915/display/intel_vdsc.c     |  28 ++--
 drivers/gpu/drm/i915/display/intel_vga.c      |   7 +-
 drivers/gpu/drm/i915/display/vlv_dsi.c        |  80 ++++++-----
 drivers/gpu/drm/i915/display/vlv_dsi_pll.c    |  47 ++++---
 12 files changed, 322 insertions(+), 233 deletions(-)

-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
