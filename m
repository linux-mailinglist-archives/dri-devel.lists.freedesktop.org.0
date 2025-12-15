Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A99BCBECC4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 16:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703A010E6EE;
	Mon, 15 Dec 2025 15:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SABtyM3k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B937F10E6ED
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 15:58:14 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso16182075e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 07:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765814293; x=1766419093; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J1Fqs4gkhlm9HacWvv6Nl3LN/FruXH1vnc3nJyMT+NI=;
 b=SABtyM3kLRPBm3ETL50LQX6SLa53PeKJsIUPD4GBh4k89uxIM2pCtqPAtxYo1l9x5J
 cYqk3vmuTn5JsN8W77XpQ14GDrb3vB65cnwqABQc25m8OhAILvB4AaUFiEzYv3/1ILHl
 /kZ8w/yyvN99f9oc0RSO+BfSqu82bHIhTRYpZ5HZ3gwZ5AP9joL3C0dBFhr24w173P/z
 Yiqv4xE3OXYbrQPtLcp3d6/80vM1OGcbHVPwv5eMUlrIMo0Nf965anx0B/PMuNihprNz
 j4l5NS1E4dH1kleG3sYiaR1SUQxCAb42RTmo2PorSeTqCJBSljjT/T4q5Gzpsqtn8VZw
 /Jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765814293; x=1766419093;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J1Fqs4gkhlm9HacWvv6Nl3LN/FruXH1vnc3nJyMT+NI=;
 b=XvPDnY/yuc4YUV4l2Cd/qohOzLdriKD5ioUsBiCB45/MkPAWiBNZYFnnRblg7+r7WP
 lUPQFaFymPH+k7ZHJXGhWSj2tavW+MWOChegTrZEh9W/VciswWwGQnm87ow3YflMq6jd
 kFs6tSPEFeeD55PwuxhKZyzPcIBw9dLBF47gCdyhA7IFy5Fbf6gc9u3WqrY8qzGollFM
 mxk5GYbKEfVy60HngPLz2kVUw435g+kw3HUHkO9kZcmWHEC5nkAA4rBKbfsvhzwDoKb8
 X9UElWQgXe1h4AgwGFR4KhFMSeWeKhb5wZ2lpHxx9L9ERqTMp2+zAFZiXfxLyqu4YC46
 988Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoGKo7K+KcVaVes8qaXyfsvH4WH0yLn0FIcygEb/pDiEe4LSxNSfumfcK4T650DmL4LIT4Iy1xe6Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7m/sdAPM3uj8e0GYpShz4uumtLKQLvLci0xcV8PbkLztGLBNC
 vYwzuyg2B9/s+Tc6/9xhJHWtctY9zQ/8NX4eObPaklKnpOwLnaYa+srJ
X-Gm-Gg: AY/fxX7k5mJtj+7iObtI1ooPnQLBOmL5lxF3rhaIQiE5tJTav2XC0DSFxB7lFmIuq60
 oIO3Ew/+hwQexWYe0Npwxjct+vXtpk7dIrYj1TNGCPOZ/lQMy90mEzL5RDRuFE8yFoB2toPA2yc
 dlJieANLuXo4MDWImehyUx+c4U7xB67yJt2mqa5lNuakSbKqHTw0dVACPK+K1v5sYxV7LDpp/1t
 Ccv9DAicqlqHg4nY5DlruA1KdoDzPL6Mv56DPbSL66Cx8/nCcCH/zY2JM6m+bp9p7tVHkYwUU9r
 jLltbL3TEJYRq3l9HJSpLXBy0hpOzYOcv8m532595Xk0JpX372Z5VUpP3zadVIe/bQ2V2n13zXa
 +X4FgjPw41vTLxLtx3pZaFybAqoZHXN1IkyI0z6GjGnOLDI6Z5wT+lyl5P+caHjIvfMo8Dtt6Mf
 Eiln7kZh8454cjG7vrmsr9F0+68PksV7KHj5tUeUr218FHpa57mX92kA==
X-Google-Smtp-Source: AGHT+IGMVgIhuKcVBb92cS2zOyKL0niLxMLFcAQ59Q2GrSDsIf5GQWuh/rUzbLpSm7T2OqLF9CUksw==
X-Received: by 2002:a05:600d:13:b0:471:9da:5248 with SMTP id
 5b1f17b1804b1-47a9327dc50mr92637315e9.26.1765814292949; 
 Mon, 15 Dec 2025 07:58:12 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.238.173])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f3a1be5sm70209665e9.1.2025.12.15.07.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 07:58:12 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v7 0/3] drm/sitronix/st7920: Add support for the ST7920
 controller
Date: Mon, 15 Dec 2025 16:57:53 +0100
Message-Id: <20251215-st7920-v7-0-36771009ec01@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XPTW7DIBAF4KtErEs1zPBjuuo9qi6GAAlSE0cms
 lpFvnuxF3bqLh/iew8eoqahpCreDg8xpLHU0l9bcC8HcTzz9ZRkiS0LBDTQgZX17jyCTI4DEwb
 iYEW7fBtSLt9L0cdny+dS7/3ws/SOaj79VzEqCdJqDoZJZ8/wfrpw+Xo99hcxV4y4MQ9+ZdiYB
 p915yEHk/eMVqbgaY1mljsfrbGZgfZMPzFSK9ONkUGvcgfOBtwzszGF25pZ/pYiG7QuktkzuzF
 UuDI7PzISWGew7f1Zm6bpF8oFp42vAQAA
X-Change-ID: 20250806-st7920-e7aba32b3ab6
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Changes in v7:
- Fix Makefile typo and checkpatch --strict warnings.
- Update header paths and add missing includes.
- Remove unused DRIVER_DATE.
- Link to v6: https://lore.kernel.org/r/20251212-st7920-v6-0-4d3067528072@gmail.com

Changes in v6:
- Initialize spi7920_error structure.
- Call drm_dev_exit() when appropriate.
- Link to v5: https://lore.kernel.org/r/20251126-st7920-v5-0-64eda5267d35@gmail.com

Changes in v5:
- Remove unused device variant structures and hard-code display
  resolution.
- Fix GPIO reset logic to correctly handle logical levels.
- Use kzalloc() instead of kmemdup() for atomic state duplication.
- Refactor atomic update to integrate cpu access with the damage loop.
- Rename macros to avoid the reserved DRM_ prefix.
- Use DRM logging helpers instead of generic device logging.
- Link to v4: https://lore.kernel.org/r/20251031-st7920-v4-0-35291f8076b2@gmail.com

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
 drivers/gpu/drm/sitronix/st7920.c                  | 867 +++++++++++++++++++++
 5 files changed, 943 insertions(+)
---
base-commit: c571cb70e1ed43ee543c70151e61a001ab2eefa2
change-id: 20250806-st7920-e7aba32b3ab6

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

