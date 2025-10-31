Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A60C23FF2
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 10:05:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD7C10EAD7;
	Fri, 31 Oct 2025 09:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KXOm5lkt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE5310EAD7
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 09:05:38 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso24862335e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 02:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761901537; x=1762506337; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3aqRGwqwN2V4mYhgwOypNmslGulZldQn28Px6r89nRA=;
 b=KXOm5lktNPlT2IbFSbp3ARbXcPxwDap8/x85x8Jt3LDZdgFdTx9fQ8KrxZsr7zV5oD
 FwC/94xrLPgsqwdrQLxFBQLhGsmwZ0DWWPx2W7C5RBzMuoZ8/AfRi+XQ4Qhw0PKTdBOh
 k8YTs9NQIRAllSvO3LXY4SVFBlVXaQLMyFZ8FoaexJz1VtgewSiFshDgPtxoVdFCAt7j
 HIU5ponmOeWUMmxI+LiVQY4+zGOXtqjIT6f5wT2kdeiNndQMcPFlHAJL4lH2TWruDJWD
 +q10Mlcppda3TipqELKH9/uELT88zEHlOmCWBRyWdm6h6SN8JCYAo8duXngk99kwUGgp
 2Mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761901537; x=1762506337;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3aqRGwqwN2V4mYhgwOypNmslGulZldQn28Px6r89nRA=;
 b=qe+vifHN36/N9wscMqun8KPXCn8jyxH+9RwMwcWfUvZtwdOpH3MAM9BR321T8fYVLY
 +4rBLozL45TAuNL2/yt8AecMBNFZCEJlu+OIoBFA9tLLpbaku9ddpedY+mqteijk7fmS
 99tQqclg5RwZIYjFqC2MmPXJeckc+QAusow40AGa57ptN40ZD9MFbocugUNItfGYdIXa
 Bbl1ymOYUKW8xRmys+hwvrZpHD7CgVak7JURpon+pSflivVqptqyZZ+SEBrE3GMMdDu8
 fqjTYfeJXh+frkwLExabywW0d9+UnO3LbeCs/wjPSw8+fEQBdp6Hj8RTXfAOew2cVpvY
 sdXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUqN9+hJHppq70dM67JBAmfD1Xl20TimhlzBQLCToCtqUjI3/CfoJemGe/+2UiVFGZzLdODCEqWuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/spfB3fQ39Cs/bt7V/9MCvgQX6VOrWKK4eDJu8eTv34bEqM31
 xeQ/N//jrzxJuBhWjYWATF8bjkvTLd0bN3993SpTQC8CqENPBh6tc/I3
X-Gm-Gg: ASbGnctRVzUH68Oktu0665Jfa2B/yvaJhoQB9BVneHL2zCWCFYPubdb6hBR+RTOY91v
 HW1XwoGO9j+ItUUXqMRLVGcJShXCmnUEmHhCus1pI85cVrX4cxwoFXPO9AUdcd+bna6Kb1UHMBT
 foaOV6Hg60kSdm7uxaL6paZHVmcpnjbYELiG1/anJkDXrQjYMAbbKIY70mxyf3E8l6za2TikDph
 AV5lqGRsDccRVRm4GW/pWfr/GvVSQIulF2LoKktVLgCeXUZBFxayXarksXJAJFjX+cCO2+SX6Os
 bHsNxQmmHUaZw6gbpDltsjHY6RnSpjprKi9IblincCV0JCq01vohwURN4y1/HsQ0Z2xrYtLyeu5
 QkBU4yEnc/eFEL8+7xyO89x4LytIN1SCgR3jIwy8UwP8G3/keYbiFaQaXbe9/3c79i6q+LGUS0h
 np+6qcRd6AhOVxILXDuXG+z3k8IHsgRTqmieF7Sh1NYw==
X-Google-Smtp-Source: AGHT+IFg1FhvXQeYmxAmP+Nfhgs6XrXefcP9LhQ7WeeLTenWM5h6u0BVP7s24vUtB2NJSszwvaVfhw==
X-Received: by 2002:a05:6000:2f83:b0:427:a27:3a6c with SMTP id
 ffacd0b85a97d-429bd6d69aamr1761935f8f.63.1761901536640; 
 Fri, 31 Oct 2025 02:05:36 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.139.156])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289adaf8sm93454475e9.7.2025.10.31.02.05.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 02:05:36 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v4 0/3] drm/sitronix/st7920: Add support for the ST7920
 controller
Date: Fri, 31 Oct 2025 10:05:16 +0100
Message-Id: <20251031-st7920-v4-0-35291f8076b2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMx7BGkC/2XNTQ6CMBCG4auQrq0Z+gd15T2Miym00ETAtIRoC
 He3sECiy2/S5+1Mog3eRnLJZhLs5KMf+jTEKSNVi31jqa/TJgyYhBIUjWOhGVBboEHODEejSHr
 8DNb51xa63dNufRyH8N66U75e/xJTToEqgUYiF04jXJsO/eNcDR1ZExP7Mg16ZywxAdqJUoMz0
 v0yvrMcDr/xlblS10oqh8CPbFmWD3fCG4MKAQAA
X-Change-ID: 20250806-st7920-e7aba32b3ab6
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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

This patch-series adds support for the Sitronix ST7920 controller, which
is a monochrome dot-matrix graphical LCD controller that has SPI and
parallel interfaces.

The st7920 driver only has support for SPI so displays using other
transport protocols are currently not supported.

* Patch #1 adds the driver.
* Patch #2 adds the DT binding schema.
* Patch #3 adds the MAINTAINERS information.

---
Changes in v4:
- Added definitions for the VDD power supply and the XRESET GPIO line,
  which were identified as minimum requirements from the datasheet.
- The error handling strategy has been refactored to propagate an
  error-tracking struct from the caller.
- The atomic enable/disable logic has been correctly moved from
  drm_encoder_helper_funcs to drm_crtc_helper_funcs, as the
  functionality is bound to the CRTC.
- Added drm_dev_enter() and drm_dev_exit() calls to the atomic_enable
  and atomic_disable helpers to correctly manage the device's runtime
  power state.
- Renamed macro definitions to match the correct terminology.
- Link to v3: https://lore.kernel.org/r/20251006-st7920-v3-0-4f89d656fa03@gmail.com

Changes in v3:
- Reorganize the patch documenting compatible (DT bindings) before their
  use.
- Drop reduntant information from DT bindings.
- Use a goto label to ensure drm_dev_exit() is called in the error path
  of drm_gem_fb_begin_cpu_access().
- Link to v2: https://lore.kernel.org/r/20250909-st7920-v2-0-409f4890fb5f@gmail.com

Changes in v2:
- Refactor SPI communication:
  * Internalize error handling and delays within the st7920_spi_write()
    helper.
  * Split the main SPI write function into smaller, command-specific
    helpers for clarity.
- Improve DRM/KMS logic:
  * Relocate CPU access calls (drm_gem_fb...) to the atomic_update hook.
  * Use standard DRM helpers (drm_crtc_helper_mode_valid_fixed and
    drm_connector_helper_get_modes_fixed) for mode validation and
    creation.
- General code cleanup:
  * Remove dead code related to ST7920_FAMILY.
  * Replace WARN_ON() with drm_WARN_ON_ONCE().
  * Ensure single variable assignments per line.
- Fix probe initialization order:
  * Move spi_set_drvdata() and st7920_init() to occur before device
    registration.
- Devicetree:
  * Update bindings to address feedback from review (e.g., reference
    common SPI properties).
- MAINTAINERS:
  * Add a proper commit message to the patch.
- Link to v1: https://lore.kernel.org/r/20250806-st7920-v1-0-64ab5a34f9a0@gmail.com
---

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>

---
Iker Pedrosa (3):
      dt-bindings: display: sitronix,st7920: Add DT schema
      drm: Add driver for Sitronix ST7920 LCD displays
      MAINTAINERS: Add entry for Sitronix ST7920 driver

 .../bindings/display/sitronix,st7920.yaml          |  58 ++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/sitronix/Kconfig                   |  10 +
 drivers/gpu/drm/sitronix/Makefile                  |   1 +
 drivers/gpu/drm/sitronix/st7920.c                  | 905 +++++++++++++++++++++
 5 files changed, 981 insertions(+)
---
base-commit: c571cb70e1ed43ee543c70151e61a001ab2eefa2
change-id: 20250806-st7920-e7aba32b3ab6

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

