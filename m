Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25D1CB855B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 09:56:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3489A10E34C;
	Fri, 12 Dec 2025 08:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mRekXSP9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5504810E34C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 08:56:44 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-42e33956e76so472507f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 00:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765529803; x=1766134603; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lqc8EwKA/JJN/VhrbE0YGzJvjvxBNq94BX+UyNRbmrw=;
 b=mRekXSP9CHu4RS2K13PGMN9bixBVUU7m7YXeWejCacu1P+uq2Tjove7eEmuGWSj+1S
 osZ30UXcT6sc09T0wQES4PgpNq4xFDiBS8VzMUd7hCvmkks7JeBC0KVYwXaiz1h0xDoN
 A6BxVW2/r5OPs0uanUEhGm+bmJMiKRHGjHkU8IpAXjfnT7o45L+coMM9ood1sDUtG3fa
 JYn+xvstfJah6QGsjnWzDkj+PyF1euuJvAp3juTg1mesabFdix3QDLPNJZeTt2xNT6UV
 UJJ9SKJ5pHK3lNg3yuimX4JBhnxDImbgQLfLsRTRVqZ3zJEdW6+ASU20RpPT8DD8g+51
 uWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765529803; x=1766134603;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Lqc8EwKA/JJN/VhrbE0YGzJvjvxBNq94BX+UyNRbmrw=;
 b=RbbxqIWR8MVSAxs2/Yq/j6tWBJn2QBnlFn3bER45LicOtVyU7IQQ/tTsNbTOO7OBqN
 LkvGjKik5ZiS8qiHTI+9MywRetwy1kfTP4ZVfx16EfRwJ43PdYX6QT3//mCOosc0MZIh
 4gVUQC2ye/9icCsKsu7F8zFyYU8qUSfGR5fn+7EkPl+nDyp4AczFaPA8Y4TLXLpW4WW0
 RoDXz5W6YIyvg7XZ0dQdmeT2q4C2E1e57vpHJ+udGkT58R+EjF2TMgdGDVmRWlhXgzB3
 zW8uvuTn5W/2aWbeupHLVNcJjxuCGki3Z3237aM/STooW8Cc1ei0at9WzEMZz9okXsXI
 XvKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtEePWgt+8lt16u3XwXIQemE7DJ472yUG9+3vLFPinHWdilMUiDbwm8DLUH50jPq/OMmzoAXD4dUU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwKvgUrT2saWbLwVWbuRsyPSUA4M1LNCzliaUHTHDNr2Q2iRcV/
 CKyMFjXhc/5gikTTvaGf+QFwOV9cOsLqrihpRFhoGs7J5Ky6lop3SOIC
X-Gm-Gg: AY/fxX4yXyUX2ZmHp+lEaP6WItPhCLAEE3MJ0XAH55Fd5U6hqnaNN0rMPzP0OPqcBAg
 GPhl8lb7ByrQusnwtJEjbETjyZIyknhu4CotM7Vcf1doKic0F5yUNs/cjy8McDt1Z1PPB9aCbdY
 Pf+kfAzyoBvudR7qCH66j8EZtMb62ueIAASCAVJVXV8XW+4EWbtH/ME9pEmaja7L+EniF+9aMOM
 hZfA/2cz9hDo2q3H9Y+02ALKxJcDa9T5C0d7eQmNb9SgExM3Q2riHAHYPM+Q0STyYUkboEPokow
 3QNqFNECRuCN1lh2Ep+gmbEGgJ7BYlNYKpeQ/2u7A28IosPq1dVK7wMkwX90Xj7TuFDxu+11mmY
 8Kp/eGCseqUie0117PK3y+1rtmnHXfgSCxXFnbBfwQ42CL+9MXqyfV4OfWt9SOA3A19pdiyfBNf
 rtEVE93pWDGBezW3v+5Dhzudx08AjT5XUG7fGsularHsb1a70=
X-Google-Smtp-Source: AGHT+IEL9bvnBJjJsM+/EURopC9+hpKakZ/RbDSwMtZ0R5TZS7Y0WhaB/tevm1jDyxfpkbSEtjOW/g==
X-Received: by 2002:a05:6000:2601:b0:42f:8816:a508 with SMTP id
 ffacd0b85a97d-42fb48e7989mr1446259f8f.61.1765529802486; 
 Fri, 12 Dec 2025 00:56:42 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([89.7.8.79])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8a09fbesm10501696f8f.0.2025.12.12.00.56.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 00:56:42 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v6 0/3] drm/sitronix/st7920: Add support for the ST7920
 controller
Date: Fri, 12 Dec 2025 09:56:07 +0100
Message-Id: <20251212-st7920-v6-0-4d3067528072@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XPwWrDMAwG4FcpPs9Dliwn3mnvMXaQG7s1rM2IS
 9goefc5OSQhO/5C3y/0VCUOORb1dnqqIY655P5eg3s5qfNV7peoc1ezQkCGFpwuj8Yj6NhIEMJ
 AEpyqy99DTPlnKfr4rPmay6Mffpfe0czTfxWj0aCdlcBCNnmB98tN8tfrub+puWLEjXnwK8PKL
 PhkWw8pcDoyWpmB3TWaWWp959glAToyu2NkVmYrI0ZvUguNC3hkvDGD2zVefoudMLqmI96zaZr
 +AP0eUHV4AQAA
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
 drivers/gpu/drm/sitronix/st7920.c                  | 868 +++++++++++++++++++++
 5 files changed, 944 insertions(+)
---
base-commit: c571cb70e1ed43ee543c70151e61a001ab2eefa2
change-id: 20250806-st7920-e7aba32b3ab6

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

