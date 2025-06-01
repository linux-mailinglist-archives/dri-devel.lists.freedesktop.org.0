Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE928ACA090
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 00:18:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C7A610E138;
	Sun,  1 Jun 2025 22:18:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aVIQT5+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BFDF10E138
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Jun 2025 22:18:52 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id
 af79cd13be357-7d09d4c8543so365351285a.1
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Jun 2025 15:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748816331; x=1749421131; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ASuAMgM5DsTFJTj9WldWE2aobhWhSAfKBSNCSHlRwfs=;
 b=aVIQT5+NDpvpqjUL5aiLRlNxm9H664RfjlUPqjzcp7h3d6jb8LxXIMkvOrJ1PIwV0z
 lPlMY6uYx8TzAjVxXe940w9svNrWoeZFj3P6XK78Ua0HFZsIMd+ohgDkJ83c2XCVK8NA
 mZihBd70n90I61iRZn1UMP7UMzR+EHthiFZz2JLaxZe3bggkr/PYg68R4AbK4PvSsJdI
 UqHL3ROqGpGtrFvcJhFTD35PVOjVYNFYXD07+OQBsQ/HQLdBWJ0pl7WPJjJJuvBSEJmu
 PYRrXboLlfUzZJqmAoqf3PzkKbMyuXcsz8TpHgWexi/AKL4G3EfVueTlj8h6GPCs1zii
 Fpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748816331; x=1749421131;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ASuAMgM5DsTFJTj9WldWE2aobhWhSAfKBSNCSHlRwfs=;
 b=rc3+6Bg9MvzLTnq87d39WIE/qggFrA5raWOjvxgNvDPM77O5EOCqwie/TdsRrAMs/7
 swKtadsrkVhglpgTOEJQ0HhPvYV+1By7dEeLkWaqg4RdIroUFT6SpJZDcjbeEU+2dUgb
 afKCs9mwpq6CI9uW8vP246t00MAXfwJcqVHaOUCnvI3KTWWoNAF0QrM31l2pXjtfUqQ/
 z6VTdaS5bXYtpklM4sRf01i1vbd/wet2mEgWKxXA03oKKVjuq4Kn09AxZ0U7vdXz4LTa
 9wVA3SH3vur9HbjPE+rzAYewmTy83g0jFqWIoT/D+sIQUOir/I7vJmXAvkFL14f7AoA3
 qzsQ==
X-Gm-Message-State: AOJu0Yyq83kmKy6zSdzROHdQ2kZebAvEerymmCzM+qHylkcre0DRTrvV
 u18D+A17O8zv5l2KylaZt5ptU7+/DmAySAujeNmW17aHXCvCJR8BL/dT1s5M3vzGDq0=
X-Gm-Gg: ASbGncsQsAPuWTbcL01HZ5MjI+xcKH0Gv0sEDEtpf9HoaPtSzBqzb3CYEyf/5bjPjNR
 XARBDBRMaUqeeJI6r6gG+fsGxTD11Y2PtLKlRo5rbHb2SFI7/fY0S6iIX5cMzMA0K3YSpcpZ8fV
 VrmdP8IMzlzwxWGtZi/XbqZKtyZF/iPJd5nyixxGrBLZoOZmouLE7aDyewuriE/Zjlksca0X9Iw
 UBLpUge6zPjaXpLrKbc8KDmdiaVTIv4+wG+yNMAQdSM4GNT8ZKf8vYcFfI5w5oDFbjleNjbmqDA
 HFmjDZxvkZsfIPnCt+7BCWSFAOgm6wZlEF1cYvVl2e0PWIMmXI+uwX4m43EcWmXdRA==
X-Google-Smtp-Source: AGHT+IFvrmdqb1Jbez/1pqAFUzOD1aoANA/UWpASTj5vWXRE59vvCBBQj7T26GKh6jtI6UAtH/NggQ==
X-Received: by 2002:a05:620a:458b:b0:7c5:65ab:5002 with SMTP id
 af79cd13be357-7d0eaccf947mr1097655685a.49.1748816331192; 
 Sun, 01 Jun 2025 15:18:51 -0700 (PDT)
Received: from [10.0.0.88] ([2607:fea8:bad7:5400:5458:c6fd:17d9:9820])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7d09a1951casm536030285a.68.2025.06.01.15.18.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 15:18:49 -0700 (PDT)
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Sun, 01 Jun 2025 18:18:47 -0400
Subject: [PATCH v4] drm: add overview diagram for drm stack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250601-drm-doc-updates-v4-1-e7c46821e009@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMbRPGgC/3XNwQ6CMBAE0F8hPbum3VJAT/6H8YDsFpqIkBaJh
 vDvFk5E4nEmeTOTCOwdB3FOJuF5dMF1zxjSQyKqpnzWDI5iFijRSIMI5FugroJXT+XAAXRWZDa
 jtFCIIqres3XvdfF6i7lxYej8Zz0Y1dL+3xoVKCDFlkyap/JOl7ot3eNYda1Ytkbcer33CBLYq
 JysMljZ7Nfrrc/3Xsd/U/ApLwutSOqtn+f5CyLdqyguAQAA
X-Change-ID: 20250522-drm-doc-updates-3686f6d48122
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748816329; l=3417;
 i=abdulrasaqolawani@gmail.com; s=20250522; h=from:subject:message-id;
 bh=q5bj5dHeAF0jw1D9B79SOZIYQ/2vhai+oYehV5QXNxk=;
 b=sjsMrBAa7gu2PoEDTIe+RBXPWGT4CuRLEafyGtWYHvOlDONiQzwpYYmo5l0FI/+XGq+fkjsus
 pSEv0WevVJoBsq2PwUBQZtAeEHuTadQ3flbJV7IY2822TGRCzWuLpqn
X-Developer-Key: i=abdulrasaqolawani@gmail.com; a=ed25519;
 pk=LCvBseqd+rEj8B1vNEnSSfNcqQwMsfWx1DGDT1LYddo=
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

Add an overview diagram of Linux DRM architecture for
graphics and compute to introduction.rst

Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
---
Changes in v4:
- Ensure patch description describe diff adding overview diagram.
- Link to v3: https://lore.kernel.org/r/20250527-drm-doc-updates-v3-1-58e97a831d03@gmail.com

Changes in v3:
- revert the promotion of the overview diagram header
- Link to v2: https://lore.kernel.org/r/20250523-drm-doc-updates-v2-0-e517df152cf6@gmail.com

Changes in v2:
- Update the overview diagram to display correctly by putting in a literal block.
- Also update the overview section diagram to a higher order.
- Ensured docs are successfully rendering by building for htmldocs and pdfdocs.
- Rendered pages are okay on html and pdf.
- Link to v1: https://lore.kernel.org/r/20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com
---
 Documentation/gpu/introduction.rst | 40 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 3cd0c8860b949408ed570d3f9384edd5f03df002..a8d3f953a470180b395ec52a45d0f3f4561424e0 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -14,7 +14,45 @@ including the TTM memory manager, output configuration and mode setting,
 and the new vblank internals, in addition to all the regular features
 found in current kernels.
 
-[Insert diagram of typical DRM stack here]
+Overview of the Linux DRM Architecture
+--------------------------------------
+::
+
+        +-----------------------------+
+        |     User-space Apps         |
+        | (Games, Browsers, ML, etc.) |
+        +-----------------------------+
+                      |
+                      v
+        +---------------------------------------+
+        |    Graphics APIs   |   Compute APIs   |
+        |  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
+        +---------------------------------------+
+                |                   |
+                v                   v
+        +---------------------+  +-----------------------+
+        |  User-space Driver  |  |    Compute Runtime    |
+        |  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
+        +---------------------+  +-----------------------+
+                |                   |
+                +--------+----------+
+                         |
+                         v
+                +-----------------------+
+                |   libdrm (DRM API)    |
+                +-----------------------+
+                          |
+                          v
+        +-------------------------------------------+
+        |     Kernel DRM/KMS Driver (i915, amdgpu,  |
+        |     nouveau, etc.)                        |
+        +-------------------------------------------+
+                |                       |
+                v                       v
+        +----------------+     +-------------------+
+        | GPU Display HW |     | GPU Compute Units |
+        +----------------+     +-------------------+
+
 
 Style Guidelines
 ================

---
base-commit: 4d07f5440d7afee27dada528aaf5230e760531cb
change-id: 20250522-drm-doc-updates-3686f6d48122

Best regards,
-- 
Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>

