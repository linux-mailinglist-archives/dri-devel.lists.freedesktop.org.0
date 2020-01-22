Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F172614571E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 14:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9264A6F520;
	Wed, 22 Jan 2020 13:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461616F4AB;
 Wed, 22 Jan 2020 11:08:51 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f129so6723487wmf.2;
 Wed, 22 Jan 2020 03:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/QxijJMYTIJinF8V9bOrqtS4KGLiuqhnFZl4QbyPRY=;
 b=C9jZRoXsUwcqjPQhcoVmI2ElcZew/wsjk3az+5v3copiv8k+v2XIz7toq4RQqSugln
 HhwF3g4wsZe9/R0l0T8VGCCaj1asImY+eskODMV8T7GJhP+ZsmiEvprqlA/vq4IYGKKR
 uOrIFQ0L+he9J72oyZdsaTP7T8YHFewSl8rQXAB9I0iY3QUXoPiTwMIksz+qRznPiJ2e
 WON3VdUuJ1kPjVAvUdZg2riMMtdC3sCRoGJCgQ1zFcIRW92A045ZIC1ssmJvVj46pH+t
 s4iEuVTdSziqcPM8Z01mpu40mIqKpNdxzR3S4lRdot3S9s4juNyN7tuSQKF3A+CfTQ77
 YsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V/QxijJMYTIJinF8V9bOrqtS4KGLiuqhnFZl4QbyPRY=;
 b=tCoXItO30zpyD72pnoR/1lqVzEqT4Uc5oq4tKVpq1mTYaNEERepjgyIb2mqhNi2C9n
 as4ss5u6Ag63uwp6WR5QbF5SXkXJHqW7ppzL486x1CUfWWZIx4hPkQMKT9tLCsRbegnR
 djzUQQORd0GxfGANH+pfEbg9VXBR8quAF64/Kmw2SsqY7DVtkhvdWWtHY2xP4OkC++Mb
 L7TYg/c90vB87QrHHTiPKxr0H9wqqEaUca8CAAPkh+WRYzRuMUYF2iJM+WiYUyDr9PL1
 RH6IJFxv0GCv1K641SGS/uyAcaBqYZwUx73mVlxBN/xqcxj4FFFlIbqLQf+Zbo1FKTrg
 7zrA==
X-Gm-Message-State: APjAAAXygO2XIPaelmsLg6FSi6YrmYSp9pXJgwWyM9p9kVuEG5GMxg6O
 PJTv/pXzCDdVQN7cwEKyfLM=
X-Google-Smtp-Source: APXvYqw/hNW4vnUyHCYO86uMFLlBAX3aXktEgSX5uf+c6AQoCxCtN0YNtab8ZCu2YtE4WzbcKOM8qQ==
X-Received: by 2002:a05:600c:30a:: with SMTP id
 q10mr2446398wmd.84.1579691329918; 
 Wed, 22 Jan 2020 03:08:49 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id l3sm52454380wrt.29.2020.01.22.03.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 03:08:49 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 0/6] conversion to struct drm_device logging macros.
Date: Wed, 22 Jan 2020 14:08:38 +0300
Message-Id: <20200122110844.2022-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 22 Jan 2020 13:52:23 +0000
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

This series continues the ongoing conversion to the new struct
drm_device based logging macros for debug in i915.

v2: address merge conflict in i915/display/intel_dp.c due to newer
changes in file.

Wambui Karuga (6):
  drm/i915/dsi: conversion to struct drm_device log macros
  drm/i915/ddi: convert to struct drm_device log macros.
  drm/i915/power: convert to struct drm_device macros in
    display/intel_display_power.c
  drm/i915/dp: conversion to struct drm_device logging macros.
  drm/i915/opregion: conversion to struct drm_device logging macros.
  drm/i915/hdcp: conversion to struct drm_device based logging macros

 drivers/gpu/drm/i915/display/icl_dsi.c        |  82 ++--
 drivers/gpu/drm/i915/display/intel_ddi.c      |  98 +++--
 .../drm/i915/display/intel_display_power.c    | 177 +++++----
 drivers/gpu/drm/i915/display/intel_dp.c       | 357 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 138 ++++---
 drivers/gpu/drm/i915/display/intel_opregion.c | 134 ++++---
 6 files changed, 576 insertions(+), 410 deletions(-)

-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
