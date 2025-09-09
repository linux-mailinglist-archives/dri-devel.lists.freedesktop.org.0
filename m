Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B73B50F54
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 09:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A5210E867;
	Wed, 10 Sep 2025 07:28:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gT/qLLVk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F37710E263
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 16:53:15 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-45cb5e5e71eso30068715e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Sep 2025 09:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757436793; x=1758041593; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dImAwV6zE6y0gbIr2Lmn2XIli/Ka0KuvRpKkEpffFbs=;
 b=gT/qLLVkd6Ojk5P34zEQaWXB2Y80Rft5kkaMmFG4SwQYcTs89/BS4eL4f36uLtBi5N
 Jex7qbxSOU52q2seQ2saP8EzEEDLlIK3UvlBRHdmWundKUe07p6yIbf6SxH3q79lK8pU
 jT9fycwY6XfFzJ9epkyxsbXXfA1HkE3vEbv2rAEu6nkJYgwSnGiKZ7ylJJdM2WFjS4dB
 /PLj6ctooHqRcJNaFKPxqprVHSVzbUhgixuRzoabp9LgxHQTpUtbzXtejmGdQuMpUP50
 8D9akiNrxQvc/7CKCV8ajswnQemzgrwoXWGtDhXpzqrN24vrEbXgl8228eDz9ttI31xu
 7LSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757436793; x=1758041593;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dImAwV6zE6y0gbIr2Lmn2XIli/Ka0KuvRpKkEpffFbs=;
 b=gNJNfY9Dp0C/MoIn1k/iutzzXfpEv+5+OgXBz9fnXwe1/XuB3vtnNkJyAS4IbDHN0Q
 az7K+X0VLU9evQ401MIyRCkmXK3zndLVTHMgdfepaVNzwm62KpWuCoeIBk9+Dh2+pYCc
 +Q+pMW7FVInKl2dTWXyVAPewhOHZs8Kicypg+frmiDI3SXj4htiMW2kxzkBk3sSfv/PQ
 PYTRngK64c/9MfVBi1TmhXnDQ8TmLo1mYEwEEu+0hL8TJxLqqFTXEGm/uvMXJvZaW63B
 Zr4fPXN/Eece0tjXs9n5E+eavE130ReSzfFzIFZxBcO4HNsC0RDVDqQGeOsgbqQXgaB/
 h0MQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1hyLnGGlPe0wWhLh5p+KBWCJAw2i+wHUn3o4PQBMAbwJnOUDROd+6bGKAZG7vRDF2FUEFxXFtZS0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyV7Hx/2jVdaDErXnZk83wOY2h7ZyjWLrjidHbsY8Qka452RALG
 cToLWWPMqiiPGh9f7LhYj+qx2jgBxLsvNlGIIyhe4lyFLWexlxoS1Efl
X-Gm-Gg: ASbGnculwtv4L2n1RIXeenCv8JAG4mClffF7uFfiTgSfrS9stZT7mmkCeah1avBzafa
 ZafrSSc/EIQLZ5FU0tmhAGdrWV5OOMWsNdDBEtfgCNohiLB7SDMATxmu1DPlPQX7PrDjWhtE0NG
 Oq3MwsxQuwpsiwLduGG6UGu9sVfYeecsy/shq4XPONXDdfaW0lVETUy77MPnJpvfLoym5FT63h/
 0fzomqlKmCFY3+ECQThhvYLtsCBznsBt75gtI6jCdJe9lUUvg/OJ03MCbfE273D2C2H101gDzBr
 AA0PHjZghls3jtk9dMoxGPf9cZV2nzrf77T6pi+Wvx4JsjsOGIwB5GzHbASN+ghDNWVOvFI2LvM
 4Sn/GdPZBrVXbNogMeJ4amooJjYFxnTv9NJ//3M+Rrpk4KDUHdK4pcHuUFw2Pwjfd3Z2O6N5VCH
 k=
X-Google-Smtp-Source: AGHT+IE1PWjYpHqZLFNqkgLtImgZj8W1intWEZo/Zow9WV15/zUB7H6mECbHQGK6PDFhhZsFo2M5ww==
X-Received: by 2002:a05:600c:1e8c:b0:45b:47e1:ef6a with SMTP id
 5b1f17b1804b1-45ddded5aaamr108676605e9.37.1757436793129; 
 Tue, 09 Sep 2025 09:53:13 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.138.131])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b9ab7c7dbsm314379085e9.11.2025.09.09.09.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Sep 2025 09:53:12 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v2 0/3] drm/sitronix/st7920: Add support for the ST7920
 controller
Date: Tue, 09 Sep 2025 18:52:42 +0200
Message-Id: <20250909-st7920-v2-0-409f4890fb5f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFpbwGgC/2XMQQ6CMBCF4auQWVszFCjiynsYFlMcYBKhpiWNh
 vTuVrYu/5eXb4fAXjjAtdjBc5Qgbs2hTwUMM60TK3nkBo26wQsaFba206i4JUuVthVZA/n88jz
 K+4Dufe5Zwub853Bj+Vv/iFgqVKYm21BVjx3hbVpInufBLdCnlL4+QICwnAAAAA==
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
X-Mailman-Approved-At: Wed, 10 Sep 2025 07:28:23 +0000
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
      drm: Add driver for Sitronix ST7920 LCD displays
      dt-bindings: display: sitronix,st7920: Add DT schema
      MAINTAINERS: Add entry for Sitronix ST7920 driver

 .../bindings/display/sitronix,st7920.yaml          |  52 ++
 MAINTAINERS                                        |   7 +
 drivers/gpu/drm/sitronix/Kconfig                   |  10 +
 drivers/gpu/drm/sitronix/Makefile                  |   1 +
 drivers/gpu/drm/sitronix/st7920.c                  | 893 +++++++++++++++++++++
 5 files changed, 963 insertions(+)
---
base-commit: c571cb70e1ed43ee543c70151e61a001ab2eefa2
change-id: 20250806-st7920-e7aba32b3ab6

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

