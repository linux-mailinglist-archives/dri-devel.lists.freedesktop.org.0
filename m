Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3B6133CC2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CBC66E184;
	Wed,  8 Jan 2020 08:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F526E0D1;
 Tue,  7 Jan 2020 15:13:40 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id d73so19340689wmd.1;
 Tue, 07 Jan 2020 07:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iQTaLBi6j7EgaoJz5qobsvGq1YHqHDB8qwtSQ4J8zF0=;
 b=atcxLIBg/X241bRTSOHHcqILNV70RVqHeLsTcSB3LmtonMWDV2RLzh6oPntcbyyojo
 hCJuZa6/DhXqTmWwQc8/EnqRuieFNMMoo8kaK0y+mKkxDDNQTUyo57zRrm9WR+NSfF6e
 vil0ho48k0k1QVC6wksg7Lu2rrlr636d4pC+4nRO7Emq/HLrtQ9GygmpriJRfrr9Fw7q
 u4kY81Uq5Cxr7eZw5qNQhymAut3xV0Sn83p0BFZjwuzLvbSj1Lyl4xfE358CUxlvigSa
 a/39Qr9hnxiDANkqIYDW4usgpWei98Hh4h2TMnOwTbA+0/Bbu8ttvNDHsfAfHSwBB002
 NfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iQTaLBi6j7EgaoJz5qobsvGq1YHqHDB8qwtSQ4J8zF0=;
 b=OvQjnK6oE4lTbaAouSGwABvVLZbBiFQCYakTTKzoN4m7YZK75WXKu05X2wEJRf8qmj
 KzCcAxW9HUEN/AAxa17NGQTRpv+jLSyCqnWtbvj916muNDK6OCyPlVDb1rLV/QuQ7dON
 CCLD+hoLO8IZuZXUstaTw8HTT8HE3J44RMgrUUGjfVz6Rww3B8mAT/d0c99D33dWRfHn
 rXoVSRft/AF3sNy/Qa+EwxV1XigYY8fT4B3eke3/oxmL9mG4Su4o7MEMiW37pTOux3kO
 cpQP2FQcAtZpzd5hcp89yPDQ/qxx9Gv3zj77mLKOw4qb39mEQk9UtbeJDhqiVTEzD7Br
 d9Tg==
X-Gm-Message-State: APjAAAUUrcoUjh4WUAQZiGwlHTn1E1LAuRJtm+qZc9z/XtP8moa/Nz/U
 yr9yVWS02sD/aZzDT7eOAGY=
X-Google-Smtp-Source: APXvYqyOqZvqLcqbZ32d6g02T/B0eS7dqxb9+bjRh/TuMWGi6Kd0t/LvRAzX44WDosZS2jY4MML7tw==
X-Received: by 2002:a05:600c:2046:: with SMTP id
 p6mr41252316wmg.110.1578410019088; 
 Tue, 07 Jan 2020 07:13:39 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id c4sm27076664wml.7.2020.01.07.07.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 07:13:38 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 0/5] drm/i915: conversion to new drm logging macros.
Date: Tue,  7 Jan 2020 18:13:28 +0300
Message-Id: <cover.1578409433.git.wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: intel-gfx@lists.freedesktop.org, seanpaul@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series begins the conversion to using the new struct drm_device
based logging macros in drm/i915.

Wambui Karuga (5):
  drm/i915: convert to using the drm_dbg_kms() macro.
  drm/i915: use new struct drm_device logging macros.
  drm/i915: use new struct drm_device based logging macros.
  drm/i915: convert to using new struct drm_device logging macros
  drm/i915: use new struct drm_device based macros.

 drivers/gpu/drm/i915/intel_pch.c         |  46 +--
 drivers/gpu/drm/i915/intel_pm.c          | 351 +++++++++++++----------
 drivers/gpu/drm/i915/intel_region_lmem.c |  10 +-
 drivers/gpu/drm/i915/intel_sideband.c    |  29 +-
 drivers/gpu/drm/i915/intel_uncore.c      |  25 +-
 5 files changed, 254 insertions(+), 207 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
