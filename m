Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D55B2153FE5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155036FA0A;
	Thu,  6 Feb 2020 08:17:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930E36E471;
 Thu,  6 Feb 2020 08:00:22 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id q9so5160276wmj.5;
 Thu, 06 Feb 2020 00:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=717ULV5tMYcnWVLJbk7js732Mzexo+MAur4TgOs8iIw=;
 b=RQq/hvOxg+pdxsZrU6a4uLbE3Nm58Fg4acFNoy2v7DeWygEJ5MZ92vQwxU3d/QtAlJ
 iBLg4kUa4Qqxsy4+OAGJySeBn0qlR6sVEHEM99VPZerFKTOkTQEJ5ll5nsRQygtT7nHl
 9TBNCcznM3+PEDvQfrX5AK0XtRNOYmxsRJgETI6WGdn/YMkf2yZj2SIUzcnFRPidkFCt
 8HhO721ODV62CQtL+HNEgYhmLbi3pknj2kLA6CK3wuinrXaKdTOZISHhhRyFHajaB9J4
 MBbjzeOFCdGWKS8Udq1dtGrn2WK/6nh2N3eRSzA9gyjan76GHkfPRYeDrZVY/63Ow7bh
 L1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=717ULV5tMYcnWVLJbk7js732Mzexo+MAur4TgOs8iIw=;
 b=ldhkmvDwYj3V83DxmMAokpslDdSJs8dSPEikrhOThoINR5+jkMlsfZHgfbjS4LZLq/
 Q418vAhn7Q3iETq/QypnwdShUyme92XjXhqfPtKlJqC1nO4mV3zBnDN+iO05cC8EzSXE
 kBj3nIgqYiQV3vFkHKp8t1SsS0RS/L/aC+xys5OPnLYsmZRaEYTs0/aJ4H16wGb9du/p
 JhNL3hE+aG3kmVrvxsVktC5RnkXxvmqFnmZl2cseFIwk8l4arQPEfmnDiEuQHm5zRJiT
 S93pKEF9A1h4opXuAhxKyMYcUoQUCg12yyTxjkZ08owCp+kHgfi3U5kXU3JId0VKSqGB
 b5dg==
X-Gm-Message-State: APjAAAUaqjy/DnObSif43HfpUkfsFMYUTuscNI53dTHZhgIS8N5LjnNg
 i3QC/hVPbPCUCfMtHo5MLYE=
X-Google-Smtp-Source: APXvYqy31m7uWMPcQysBuNC6ZxTGwNajoatTfBj26GqLtCkvmbOzXNXHblk4KB9ZVDipy+qoJzlvdQ==
X-Received: by 2002:a1c:1b42:: with SMTP id b63mr2965332wmb.16.1580976021126; 
 Thu, 06 Feb 2020 00:00:21 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id u8sm2635132wmm.15.2020.02.06.00.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 00:00:20 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 00/12] drm/i915/display: convert to drm_device based
 logging macros.
Date: Thu,  6 Feb 2020 11:00:01 +0300
Message-Id: <20200206080014.13759-1-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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

This patchset continues the conversion of the printk based drm logging
macros in drm/i915 to use the struct drm_device based logging macros.
This series was done both using coccinelle and manually.

v2: rebase onto drm-tip to fix conflicts with new changes in drm/i915.

Wambui Karuga (12):
  drm/i915/dp: convert to struct drm_device based logging macros.
  drm/i915/dp_link_training: convert to drm_device based logging macros.
  drm/i915/atomic: conversion to drm_device based logging macros.
  drm/i915/color: conversion to drm_device based logging macros.
  drm/i915/crt: automatic conversion to drm_device based logging macros.
  drm/i915/dp_aux_backlight: convert to drm_device based logging macros.
  drm/i915/dpll_mgr: convert to drm_device based logging macros.
  drm/i915/combo_phy: convert to struct drm_device logging macros.
  drm/i915/dp_mst: convert to drm_device based logging macros.
  drm/i915/dsi_vbt: convert to drm_device based logging macros.
  drm/i915/hdmi: convert to struct drm_device based logging macros.
  drm/i915/dpio_phy: convert to drm_device based logging macros.

 drivers/gpu/drm/i915/display/intel_atomic.c   |  23 +-
 drivers/gpu/drm/i915/display/intel_color.c    |   3 +-
 .../gpu/drm/i915/display/intel_combo_phy.c    |  23 +-
 drivers/gpu/drm/i915/display/intel_crt.c      |  49 ++-
 drivers/gpu/drm/i915/display/intel_dp.c       | 320 +++++++++++-------
 .../drm/i915/display/intel_dp_aux_backlight.c |  72 ++--
 .../drm/i915/display/intel_dp_link_training.c |  75 ++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  30 +-
 drivers/gpu/drm/i915/display/intel_dpio_phy.c |  28 +-
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 254 ++++++++------
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c  | 162 +++++----
 drivers/gpu/drm/i915/display/intel_hdmi.c     | 193 +++++++----
 12 files changed, 754 insertions(+), 478 deletions(-)

-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
