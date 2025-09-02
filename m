Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF34B4782D
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4071F10E42D;
	Sat,  6 Sep 2025 22:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m7rMnX4R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB6F10E5BC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:53:24 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-77256e75eacso1682474b3a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 23:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756796004; x=1757400804; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n8L3h0fY9m0/QQwH+0igEz7ROkcJh1IoEWIXBgUPEvg=;
 b=m7rMnX4RE5IaQCSftTFREuKLwGd8l1O8xIpxh33jfGAKPK1eUGsejT9ZuULrF2+o/E
 rLtBfVfNu8kFH65CFdFSov8bfy8tB8VI0i1DzBA3KukFiHbn7WbODsuhpNxnxkSP8xtO
 D0ISFkSKHFPjDDsFxV+jElMVlwJHsrPHYlmN8Fo927on/lqYCPPa4eF+OfAUKZOcai3q
 Srkm12zF2f6pylgGkesKnZvBiSAcqZ1rc8BJU/YW1Yn14nAYskMI1WS1v8mhLF+T5/4d
 gnz4gr5eNpeasuo5XO7oiyzHV4KeJM3m3yVWsrsYTfvI5WXSzN8nWja84z8janrBrDYx
 PQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756796004; x=1757400804;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n8L3h0fY9m0/QQwH+0igEz7ROkcJh1IoEWIXBgUPEvg=;
 b=Fu/KLvk59nrozfL7Ky307WplcLWsILKTE+19cKpug3nlD6d2KVzW4l/y+2Umwa4Qz9
 uF2fRttEAfQ1apvBC39ssqlBreXlIy1jxtCKBsp0w6CQDwVkhKGMvNBYIm48nqWno/J2
 JaIUBnokcg2tpTInC71cNZUFecvR/JbLAKkZUX+7gjEOQvTAxXCXiZbkWmfBJrzRPfGc
 bPX354i1jOMXeEEakxH/y2I+5+JfSe1UoYhlFFLA5RclxJPqv6qaq+AKkzToW9f+w7o5
 UjEedCVGNf3EpmT+QStgBdog5jmlMAxm5asRZmH1w0vDRU1Z6Hl642/W4emqMTEnBLJt
 GUQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVITG86spNhaa6D0qkmp9zEoiOMrG+q7ZHvDhVHWR2/sPhrLzEse884bguOsotIzJZ6kNmziK1KSyE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+J38dhXHUNSxHt5Gsmd2RhNTemXv0iS1AxWv8bjIapzTtfAtp
 ELbWmXGNL+agOWqpqCZpJqcrF/ZpNnh6xcVUdcFhyZHsC7HWDHlnPiqc
X-Gm-Gg: ASbGncu6N8eoUdRDAN1KuJ7wjti1OULsqv/8uKQpdlFl4mxExw/EhoyDNLrev1fI7VJ
 ERZ98SST072FxlRQlHFKW42LuMMrdSiZFLndLS43BU/7OeatOvvx2yyGiD8KeEQTeV3nKTfnzNT
 ou8VbY2hPW1loZvCBThCyx8Mxfk8WiPP6LHaX/LWr3aRyteK7FSXr1xpbG/NWP8YQ+GgpON+OfD
 yoMvZ03pbmZZixNwEE1vxPajLBPI2i3DcfxRiWJMI97/h/IS2HT6L/kwx2bUnIHJeh6lwfxmvmt
 aXCFstiUklX2d/zNNe4/i4RxM4KlyjtITa15QqVKI9OkseqsWqTYood90WnxnVTDVZEyCBhQGUE
 Vc7KEUm7vsb9rCKqRONVuN8z0tkLQx82SjqrLR+fboSR4EJ4XPpY=
X-Google-Smtp-Source: AGHT+IHvBM1zgMPL/lGGPLbmfWf+OkqvgeYJS8nXhpxD8ghD9Yl03F3VqPgBKx2Mt6pprTqIftO/yw==
X-Received: by 2002:a05:6a20:3944:b0:243:b411:ae41 with SMTP id
 adf61e73a8af0-243d6f09c1fmr15720875637.32.1756796004244; 
 Mon, 01 Sep 2025 23:53:24 -0700 (PDT)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-327e8d3d635sm12312558a91.1.2025.09.01.23.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 23:53:23 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Subject: [PATCH v5 0/3] Add support for Mayqueen Pixpaper e-ink panel
Date: Tue, 02 Sep 2025 14:53:17 +0800
Message-Id: <20250902-drm-v5-0-d77c678c4ae3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAF2UtmgC/13MwQ6CMAzG8VcxOzvTlpWBJ9/DeFi2oktEzDBEY
 3h3JxxEjv+mv++teklRerXfvFWSIfaxu+Xg7Ub5i7udRceQWxEQg4VKh9TqEghDAxY5WJU/70m
 a+JxWjqfcl9g/uvSaRgf8Xv/9gBq0YWBuggu+codz6+J157tWff1AC4NmNpQNB3QkSLYu/doUC
 0M4myIbwdIXXsRSWayN+ZkKeDYmm9qIEw/IdRWWZhzHDy/DS0EyAQAA
X-Change-ID: 20250708-drm-6021df0715d7
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Wig Cheng <onlywig@gmail.com>, LiangCheng Wang <zaq14760@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756796000; l=4874;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=cVrq8S7OsCD2q4s3MgrJ/bVufPCakQkhjJvo1bN8dMY=;
 b=RbM62ThyOvXOey7QFVEMVqQncbF77hNDrjoGJHiazNUD3ypzrOpqZh1MLf9N27j6BxaBZzPo7
 6J37hEO5kTAAVlDuvFeHYVZbUhEjmcUxjd6ed7falQaolcnmB/iQ0EK
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=5IaLhzvMqasgGPT47dsa8HEpfb0/Dv2BZC0TzSLj6E0=
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

This patch series adds support for the Mayqueen Pixpaper e-ink display panel,
controlled via SPI.

The series includes:
- A new vendor-prefix entry for "mayqueen"
- Device tree binding documentation for the Pixpaper panel
- A DRM tiny driver implementation for the Pixpaper panel
- A MAINTAINERS entry for the Pixpaper DRM driver and binding

The panel supports 122x250 resolution with XRGB8888 format and uses SPI,
along with GPIO lines for reset, busy, and data/command control.

The driver has been tested on:
- Raspberry Pi 2 Model B
with Linux kernel 6.16.

---
Changes in v5:
- Integrated pixpaper-regs.h into pixpaper.c
- Added "L: dri-devel@lists.freedesktop.org" in MAINTAINERS
- Renamed helper to pixpaper_wait_for_panel()
- Fixed endianness with __le32 + le32_to_cpu()
- Replaced drm_err() with drm_err_once()
- Simplified connector get_modes() via drm_connector_helper_get_modes_fixed()
- Dropped manual drm_mode_validate_size() check
- Moved resolution validation to CRTC mode_valid()

- Link to v4: https://lore.kernel.org/r/20250805-drm-v4-0-94eaec01598d@gmail.com

Changes in v4:
- Applied BIT() macro for all register bit definitions (per checkpatch)
- Fixed alignment and indentation based on checkpatch suggestions
- Removed unnecessary blank lines after braces
- Fixed universal plane init() call indentation
- Link to v3: https://lore.kernel.org/r/20250721-drm-v3-0-e16c3cee7263@gmail.com

Changes in v3:
- MAINTAINERS
    - Added pixpaper-regs.h

- Kconfig
    - Rename config symbol to DRM_PIXPAPER (drop TINYDRM_ prefix).
    - Reordered Kconfig select lines alphabetically.

- Code structure & style
    - Fix include order: move <linux/> headers above <drm/> headers.
    - Removed forward declarations; placed static functions next to usage
    - Switched logging to drm_err()/drm_warn()/drm_dbg() (legacy DRM_ERROR/WARN removed)
    - Remove dev_info() statements.
    - Switched encoder type to DRM_MODE_ENCODER_NONE
    - Moved pixpaper_panel_hw_init() from atomic_enable() to probe() to avoid redundant hardware init.
    - Use helper to_pixpaper_panel() instead of container_of() on crtc.

- Robustness
    - Added timeout + warning in pixpaper_wait_busy() to ensure robustness if BUSY line gets stuck.
    - Introduced struct pixpaper_error_ctx to propagate SPI/GPIO errors

- Clean‑ups
    - Removed drm_plane_enable_fb_damage_clips() (full‑frame updates)
    - Removed noisy info prints; kept drm_dbg() only where helpful
    - Consolidated all magic register values/commands into new
      pixpaper-regs.h with datasheet‑aligned naming

- Memory helpers
    - Driver now uses GEM SHMEM helpers; GEM DMA helpers dropped
      (panel has no bus‑mastering DMA)

- Functionality fixes
    - Rewrote pack_pixels_to_byte() to correctly handle 4-color (B/W/R/Y) layout
      based on expected panel color encoding

- DRM callback safety
    - Add missing drm_dev_enter()/drm_dev_exit() in callbacks.

- Tags added
    - Reviewed-by: Rob Herring <robh@kernel.org> (from v1)
    - Acked-by: Rob Herring <robh@kernel.org> (from v1)
    - Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (from v2)

- Link to v2: https://lore.kernel.org/r/20250714-drm-v2-0-5d1a2e12796c@gmail.com

Changes in v2:
- Reordered patches so that DT bindings come before the driver (suggested by Rob Herring)
- Fixed sparse warning: removed duplicate `.reset` initializer in `pixpaper_plane_funcs`
- Fixed checkpatch issues reported by Media CI:
  - Removed unnecessary blank line before closing brace
  - Moved opening parentheses up to function call lines (e.g., `DRM_WARN(...)`)
  - Fixed alignment of conditionals
  - Fixed `dev_warn(` and `drm_universal_plane_init(` formatting
- Thanks to Rob Herring for ack on vendor-prefix patch
- Link to v1: https://lore.kernel.org/r/20250708-drm-v1-0-45055fdadc8a@gmail.com

Thanks to all reviewers for feedback across earlier versions.

Best regards,
LiangCheng Wang
<zaq14760@gmail.com>

---
LiangCheng Wang (2):
      dt-bindings: display: Add Mayqueen Pixpaper e-ink panel
      drm: tiny: Add support for Mayqueen Pixpaper e-ink panel

Wig Cheng (1):
      dt-bindings: vendor-prefixes: Add Mayqueen name

 .../bindings/display/mayqueen,pixpaper.yaml        |   63 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 MAINTAINERS                                        |    7 +
 drivers/gpu/drm/tiny/Kconfig                       |   15 +
 drivers/gpu/drm/tiny/Makefile                      |    1 +
 drivers/gpu/drm/tiny/pixpaper.c                    | 1171 ++++++++++++++++++++
 6 files changed, 1259 insertions(+)
---
base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
change-id: 20250708-drm-6021df0715d7

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

