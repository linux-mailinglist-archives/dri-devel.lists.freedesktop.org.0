Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16792BBED82
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 19:49:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A6AF10E0FE;
	Mon,  6 Oct 2025 17:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L9UdeXvD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05AAF10E0FE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 17:49:11 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-46e34bd8eb2so59829075e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 10:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759772949; x=1760377749; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OwPjYDue993F4kdSpEJug+JsTugVch4hbG5zN8v6Sko=;
 b=L9UdeXvDQD7pN3gPRCr1Z9WHbQUteX+voKgZnbVi3cLu9f/sP4485Mi8Y8NnKUJMfL
 F4kvWs66QFGifIO98mjKyjnPmgInXtOI70wyO60QhqVvg36f/6Rf6UBoQRujTEOZQfFw
 vLi6akT4pMeWeCymfGLqcaGrTHmy8Foz4qqxhCfA2WWKe84Ea4pAlA3SI1fBpG2XeddH
 SWwbIhRM843Yx48aYK1RW8UwvZAe6cwCbB+HwhmFJQNnelVOa2tPyzwN+FeHbL4+4Fei
 wn64EES5YqJ7XsNoeefDr0Xvd2S69emKtY+jD6L+N7h6ujJ2tsedfhMtSQfHzpnbKWqw
 m3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759772949; x=1760377749;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OwPjYDue993F4kdSpEJug+JsTugVch4hbG5zN8v6Sko=;
 b=bLRquu66jtIcyHGn6d3qMtBMQ1JJRhKISDAa8C8MhL8HlpDSTXuL8mZCGfpV5szg85
 yPOsKdbmF21ZHhX7GuxxMdHjEStkEikD9UBSgDYQeaLwRz85GgQgTehTty1z33owicK9
 A5KyzFZe9x9347mfV/vkhCob86WpiwSumjRjXh0FSAY/nm/77WGfV5ifSv0BJeUzG5mh
 Ugur2+v+TXsBlkd1FfUtAKq7rSqflvMd8DJvQIPykOh7i/9tgt6PFosQxvt32+te5f3P
 CbWqZaLgosmOGQGGtp6oq16SCZCcmkf/wUdV8TXwSuifsjIF03q5O8Dp7geQ+eL1H5om
 aXUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGU/r+BkFNvMrjBJugjpG8pSR/fjZ5FhPcwhUHC+aVqRg6/kZQJs2SarcqEV9ipGbAT6jGOh4JYLM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSX26vWCY15qArfxNrLCz1l+XQB5HyZfJPyU9Hm3nYCXEQ8FFr
 6D68D47i9ReEmTAG17aQPdw0K6++/q4o0bEyWHk4n9EJXLSjJxLWWsug
X-Gm-Gg: ASbGncs832IFsiEXF0aPp80dIvvlkQQeKqLBHb1QtHq2jikkXDM7r1x25xOuL4ai/bE
 zeZoFGS1xfBCnWmHhr2MTipFk4tEsaFoYKxW+2hRcjf6Sa7HX+zZrppR6Ms2QhoFzzxgxcY7Kc2
 r3IDGlRrZGwtBok6+zqqp54YwK/TCNmAK7VsZGPe5sFOfngNZy6YiWZloBlkJ78a1vNjIQlXG91
 xYVWycPXLN3VCfxVxioARfXfiX9yNVo8jGxOFbbhaA1MFfgv7hlhBQgyG7XVW5I2Kg+bwckbpot
 l8SRYp7CgPwyjpkazSZxMDjI6Yn52g+0vHTQZfoYQWreVI6SuOI+qlmMBgXHqQKj1LLxXJ9GZt6
 qBAsE32y0SeHKbC7xYi5ZS2dk5YskjcfoFsJfhxmFT1guA1Ax/aYUmoh7C3Mtr6+RXau8K+y/fQ
 +16FvIAbWhLp4gThz51qZ94TVRvov2dB2PAg==
X-Google-Smtp-Source: AGHT+IGoQmqa08yh2oAWYFi0h/YVWQM5hhY6UDRLPAIKA3rUms7L/IUnK3x7/0LeBb8VrVVo34J77Q==
X-Received: by 2002:a05:600c:46d1:b0:46e:4c02:c2f9 with SMTP id
 5b1f17b1804b1-46e71157990mr93102665e9.36.1759772949081; 
 Mon, 06 Oct 2025 10:49:09 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.139.156])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e723431f5sm165583805e9.2.2025.10.06.10.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 10:49:08 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v3 0/3] drm/sitronix/st7920: Add support for the ST7920
 controller
Date: Mon, 06 Oct 2025 19:48:52 +0200
Message-Id: <20251006-st7920-v3-0-4f89d656fa03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAQB5GgC/2WMyw7CIBBFf6VhLWYK9IEr/8O4GCq0k9hioCGap
 v8u7UJNXJ6be87Cog1kIzsVCws2USQ/ZZCHgnUDTr3ldMvMBIgKWqh5nBstgNsGDUphJJqa5fM
 jWEfPPXS5Zh4ozj689m4qt/UvkUoOvFZoKpTKaYRzPyLdj50f2ZZI4qtp0B9NZE2BdqrV4Ezlf
 rV1Xd/Krf2s0wAAAA==
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

 .../bindings/display/sitronix,st7920.yaml          |  50 ++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/sitronix/Kconfig                   |  10 +
 drivers/gpu/drm/sitronix/Makefile                  |   1 +
 drivers/gpu/drm/sitronix/st7920.c                  | 892 +++++++++++++++++++++
 5 files changed, 960 insertions(+)
---
base-commit: c571cb70e1ed43ee543c70151e61a001ab2eefa2
change-id: 20250806-st7920-e7aba32b3ab6

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

