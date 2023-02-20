Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B167F69F9AD
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 18:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB3310E2D4;
	Wed, 22 Feb 2023 17:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 400 seconds by postgrey-1.36 at gabe;
 Mon, 20 Feb 2023 17:25:49 UTC
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD3110E137
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 17:25:49 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5A6EE3F20F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 17:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1676913546;
 bh=KsFWVKyUTisvLWEBfJHuAqZZOIzRC+wakmOYPwQrXVU=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=FZMzSoeecI91UrA5teqL8d4x6aQbaIiXb6laVlwqHzRU2vioww5CHpvnaQ1oCEGKW
 iXE+W5kkIjMnKl8MVSgEP3w3QFUeAf9c7InTtYY3YWJkBgn3Vw4CbEMS5ehn3Lvmsj
 rb/FVr3bQjgJYmenUJSsIbfZ3XUu7GjmYi+U6hMMTd8zIAya4IHoGKx1plBsMNSX4f
 gYIkyr98FT/4P4jzHnO1jBIrAy48XS19llrrwFAyh5DFGRjkZXcNHfVLo92Db7rLBB
 c11hHySKzRqHfsOBwwttQHUNNA+qNWELKjfCxam3h3/9FE6OD8mCXPt9dBuuMSUm+Z
 lg8EcUMXwMzSg==
Received: by mail-ed1-f70.google.com with SMTP id
 k12-20020a50c8cc000000b004accf30f6d3so2519954edh.14
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 09:19:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KsFWVKyUTisvLWEBfJHuAqZZOIzRC+wakmOYPwQrXVU=;
 b=ZFhF0j+GxT0Ylg8YR0qPCqbu4oeWGtM1pS6BVAj6HQqRw4KlWXW6z9RmvA6uL/g7TQ
 LIvY0KClR+eislNGa8XhEhvnVrgh8yEiVuiwWOotuC7/AWTQ/qIXM8HXzLIi5aE/Dnmt
 v3TEn0jYUleGxoPDCmBWE+v4agnk4mzRG3ElLjaWoLFzcEQwQ85guOdMnmKFYjzm8vCs
 HBQ9YM+AeW63SCBW1E9meMyHnrdaR8rF2P9cW+8togNsUqmUIeN5L+RebCQ8ViP4SwDa
 xAjPelHkJKLz6il8jI/HnXkAqprlNXzN1kxI/z0UI4uVRlD81Br1hAVXWGLW32CKhyPJ
 Gkvg==
X-Gm-Message-State: AO0yUKUzgtK0W2X80E30dHn7bzuFRGs5x6guCqIdJUlcCl2lneFzsnfB
 l7SThOwt9EXeWmrBi3sfYTT/AivxshyJgvz+nHzMshq8UjvFs+FvO1gWnAAgq9bpytaW2/SMaWe
 CMQl587Sa4N0YBrHzueRijMWZo3bsBFeSP7OsO43C/pSL8A==
X-Received: by 2002:a05:6402:1151:b0:4ac:beba:dc87 with SMTP id
 g17-20020a056402115100b004acbebadc87mr1075435edw.0.1676913546121; 
 Mon, 20 Feb 2023 09:19:06 -0800 (PST)
X-Google-Smtp-Source: AK7set8Oj7a1xx8jk5ISCHq4+eehJqR5ZQt/ZuPqDE6BQzrZixfjYgaHw5I/qT7NHOl5lv7OxFJ56Q==
X-Received: by 2002:a05:6402:1151:b0:4ac:beba:dc87 with SMTP id
 g17-20020a056402115100b004acbebadc87mr1075416edw.0.1676913545790; 
 Mon, 20 Feb 2023 09:19:05 -0800 (PST)
Received: from localhost.localdomain
 (host-79-44-179-55.retail.telecomitalia.it. [79.44.179.55])
 by smtp.gmail.com with ESMTPSA id
 ee51-20020a056402293300b004aef6454d6dsm1984489edb.37.2023.02.20.09.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 09:19:05 -0800 (PST)
From: Andrea Righi <andrea.righi@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/i915/sseu: fix max_subslices array-index-out-of-bounds
 access
Date: Mon, 20 Feb 2023 18:18:58 +0100
Message-Id: <20230220171858.131416-1-andrea.righi@canonical.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Feb 2023 17:09:36 +0000
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
Cc: intel-gfx@lists.freedesktop.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It seems that commit bc3c5e0809ae ("drm/i915/sseu: Don't try to store EU
mask internally in UAPI format") exposed a potential out-of-bounds
access, reported by UBSAN as following on a laptop with a gen 11 i915
card:

  UBSAN: array-index-out-of-bounds in drivers/gpu/drm/i915/gt/intel_sseu.c:65:27
  index 6 is out of range for type 'u16 [6]'
  CPU: 2 PID: 165 Comm: systemd-udevd Not tainted 6.2.0-9-generic #9-Ubuntu
  Hardware name: Dell Inc. XPS 13 9300/077Y9N, BIOS 1.11.0 03/22/2022
  Call Trace:
   <TASK>
   show_stack+0x4e/0x61
   dump_stack_lvl+0x4a/0x6f
   dump_stack+0x10/0x18
   ubsan_epilogue+0x9/0x3a
   __ubsan_handle_out_of_bounds.cold+0x42/0x47
   gen11_compute_sseu_info+0x121/0x130 [i915]
   intel_sseu_info_init+0x15d/0x2b0 [i915]
   intel_gt_init_mmio+0x23/0x40 [i915]
   i915_driver_mmio_probe+0x129/0x400 [i915]
   ? intel_gt_probe_all+0x91/0x2e0 [i915]
   i915_driver_probe+0xe1/0x3f0 [i915]
   ? drm_privacy_screen_get+0x16d/0x190 [drm]
   ? acpi_dev_found+0x64/0x80
   i915_pci_probe+0xac/0x1b0 [i915]
   ...

According to the definition of sseu_dev_info, eu_mask->hsw is limited to
a maximum of GEN_MAX_SS_PER_HSW_SLICE (6) sub-slices, but
gen11_sseu_info_init() can potentially set 8 sub-slices, in the
!IS_JSL_EHL(gt->i915) case.

Fix this by reserving up to 8 slots for max_subslices in the eu_mask
struct.

Reported-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 drivers/gpu/drm/i915/gt/intel_sseu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_sseu.h b/drivers/gpu/drm/i915/gt/intel_sseu.h
index aa87d3832d60..d7e8c374f153 100644
--- a/drivers/gpu/drm/i915/gt/intel_sseu.h
+++ b/drivers/gpu/drm/i915/gt/intel_sseu.h
@@ -27,7 +27,7 @@ struct drm_printer;
  * is only relevant to pre-Xe_HP platforms (Xe_HP and beyond use the
  * I915_MAX_SS_FUSE_BITS value below).
  */
-#define GEN_MAX_SS_PER_HSW_SLICE	6
+#define GEN_MAX_SS_PER_HSW_SLICE	8
 
 /*
  * Maximum number of 32-bit registers used by hardware to express the
-- 
2.38.1

