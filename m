Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8D2B8C5CE
	for <lists+dri-devel@lfdr.de>; Sat, 20 Sep 2025 12:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A3510E27D;
	Sat, 20 Sep 2025 10:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mX/JPF6v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED75B10E0BA
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Sep 2025 09:46:15 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso1398291f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Sep 2025 02:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758361574; x=1758966374; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A9AmXy4+QY1EUkh+fpSVOr355frd/pBEAbEoqii3KVA=;
 b=mX/JPF6vYmjGQuFX12CEWh5/BsHq9gq/6FjHTibw3WuDZlHBU2j/rB265QoyRlSh3a
 0shUNUMWaRqm+RN29HcgsB61TWprNv+iwYg4IBU+LlhO2KjmdFpq0CfF0n5DWrJspo1R
 ACp9IAwckuG1lUUCcrqz+LaiBZzYofBF6vWsE9HTQiSdTOeKiavANQpNH00F4Y/I7+Jt
 a6bzwXZ/YvLAr0ozatx1Ajs5s3s6AViZq34I9503AauTzHzcRxwlxAVG+BxFL27vbPEi
 1x+24LZTIRZaMgsxmdgDVmtNVKzQ22qva9i1BBW+NKEF8+ssUce+MkCUHwlXPhbyUKpM
 Y4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758361574; x=1758966374;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A9AmXy4+QY1EUkh+fpSVOr355frd/pBEAbEoqii3KVA=;
 b=YtZrc2HBcdd9JSc+FgzF71l2QxsIW52V/Sbui3CLf21p/13tw/+P714Pqxh/aadWsb
 MFJbuJpohMB7eR/z2qQVty0NswvpdQMwqxsuANyTrGTtfiHvvngre3aKFwUE7Fta2sLI
 o6Qhrfk32rJiPyqvMAk4QKmuxZjmV+J2BGrGtdF/JCoMnKfFyaYZ3Q0p0IvW9xhXWJp4
 QHmflUWx5U2diz+qTtIkvEaqricMV2XIONINHCJZ8PvYNUA/z/M3cUWpxWX54PpUqqxI
 WWe6JpE+Lv1txrLQpQUMyHlgce9ulUJ6K9wBwofTSslkUKw9btj90jwCPrCZro9/R2P+
 s4VQ==
X-Gm-Message-State: AOJu0Yz5Fx5+7Pd725S484MXebLhKKhRcwFv1IhikjEg5i+HadrunHKB
 aSCHv9A1rA/iDGsRTzurPbgjS/BWsstRPBYVw31HmGeZ8hjsrtrBb/cV
X-Gm-Gg: ASbGnctnYJIsoMZ49PEWGLFjTa9stopeCVNmT4YxwGdBggVYYlCBKK7VI9olYsZLm3i
 oAQWMibwbUyHuaKjmlHvMB1nZfuyA41G0jx+HpWfHEKCftBZfWMoFcbow3/eRgk5V80jfEQf/4A
 3enzSUzSbgjzlMfHV2Fjxkl96MUC8oacjR3M3D/btfm0aHQdOYl68nWWAWpmQkVw/Nv1elK7X7y
 dqfFx7BwPKPEZEVnv13/sEXa8Zb1IlSmxcz12+IgTbiCPFCA2t+1SRXsZlmSZ8dhQxRBgc4U5L8
 r9h1vu1iZi7cVjSqfcEyoKDTuBrU/HCNKSpRyQd7XHyWc4MKdIwHAOHFuq/c4rgYjks1b5UWWEZ
 Z3b82ULZIcY0Xyz/4V5t0exn7cnHTAJJRAO5VaLFL/DtJs6kXUwjxskRRY2553lx/
X-Google-Smtp-Source: AGHT+IEatF3KG2Gj7cdp5qI2sAlIkCwMm4RWqlOem2CllBesxAwlDjeW1w8yej2F7QTtoxZSOOR6Jw==
X-Received: by 2002:a05:6000:2282:b0:3eb:5ff:cb2e with SMTP id
 ffacd0b85a97d-3ee83cabcc7mr4746585f8f.29.1758361573978; 
 Sat, 20 Sep 2025 02:46:13 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([5.225.139.156])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613eb27f25sm163883615e9.23.2025.09.20.02.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 02:46:13 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Subject: [PATCH v2 0/5] drm/solomon: Code improvements and DRM helper adoption
Date: Sat, 20 Sep 2025 11:45:40 +0200
Message-Id: <20250920-improve-ssd130x-v2-0-77721e87ae08@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMR3zmgC/3WNQQqDMBBFryKzbkoStThd9R7FhYkTHahGkhIsk
 rs3dd/le/DfPyBSYIpwrw4IlDiyXwvoSwV2HtaJBI+FQUvdSlRa8LIFn0jEOKpa7sI0renQuea
 GNZTVFsjxfhaffeGZ49uHz3mQ1M/+byUlpDAW6w5p1Ij0mJaBX1frF+hzzl/GT9cHrgAAAA==
X-Change-ID: 20250912-improve-ssd130x-b45b89ff4693
To: Javier Martinez Canillas <javierm@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Sat, 20 Sep 2025 10:49:23 +0000
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

This patch series improves the Solomon SSD130x DRM driver by adopting
existing DRM helpers, improving code clarity, and following kernel
coding standards.

* Patch #1 moves DRM GEM framebuffer CPU access calls to make critical
  sections more visible and maintainable.
* Patch #2 replaces WARN_ON with drm_WARN_ON_ONCE to prevent log spam.
* Patch #3 adopts drm_crtc_helper_mode_valid_fixed() for mode
  validation.
* Patch #4 adopts drm_connector_helper_get_modes_fixed() for mode
  management.
* Patch #5 enforces one assignment per line per kernel coding style.

These improvements reduce code duplication by leveraging existing DRM
infrastructure and enhance code readability without changing
functionality.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
Changes in v2:
- Use a goto label to ensure drm_dev_exit() is called in the error path
  of drm_gem_fb_begin_cpu_access().
- Link to v1: https://lore.kernel.org/r/20250912-improve-ssd130x-v1-0-bc9389ed299e@gmail.com

---
Iker Pedrosa (5):
      drm/solomon: Move calls to drm_gem_fb_end_cpu*()
      drm/solomon: Use drm_WARN_ON_ONCE instead of WARN_ON
      drm/solomon: Simplify mode_valid() using DRM helper
      drm/solomon: Simplify get_modes() using DRM helper
      drm/solomon: Enforce one assignment per line

 drivers/gpu/drm/solomon/ssd130x.c | 80 ++++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 48 deletions(-)
---
base-commit: c571cb70e1ed43ee543c70151e61a001ab2eefa2
change-id: 20250912-improve-ssd130x-b45b89ff4693

Best regards,
-- 
Iker Pedrosa <ikerpedrosam@gmail.com>

