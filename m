Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5528AC4928
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 09:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D2C10E3B8;
	Tue, 27 May 2025 07:17:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OtNzMEgb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBCE510E3B8
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 07:17:46 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-6faa60c983fso17068556d6.2
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 00:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748330265; x=1748935065; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lX1E9djvoqZC/1p7fFQRBXo8UbYPgCN+lFFXs6U2lVU=;
 b=OtNzMEgbCeByUcJp6XoY49vqgJ3uEqkOSRGq7kt8bomSKLftDt3T9CAalULWlx8jA+
 HUvp+XOTDIt/3MP8ACtTnZZe5XSTfqTrTMhm/cKgfjxMEaaqnXRcgl68JfGDc7+Aizx0
 cQH93kF9/Fym2QW3OyG79p1RMUbNif+pq1UfhheUbTr5ZqBJvgEMPdAkTKR/pMX+96Ye
 FHv5PGQtBMQiUVVci/bxFDYNVFov20XrnHhcKCtcPo7sINxSdyyeLaIU61McVn5eifcJ
 PqBCVgmQwg9IJnvONtsKqg/yyVktNU1vwymlob+HnVPl35q4iBM74GuipMADGuVZrxqC
 z8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748330265; x=1748935065;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lX1E9djvoqZC/1p7fFQRBXo8UbYPgCN+lFFXs6U2lVU=;
 b=oXySQ0b1kdTPrGtjPU/X4q8AHeBFhAdVoUhbCRYy4AiLI+PxqEm5SpAhcMaUMSqCTD
 XJPM+tZ9sTtPqUFz3YcgH1igUBR2IhLH1U89Ppr+e+nwAeVLkSf9Nol5f5T/Qh/S0/l5
 QqEC8md9ubvyF8DV8uKpwRGqDuAjGDghH5UEX4fFZ1f++wFEDcOvTludct+tT80tXK0+
 YmbuVlcjQTHFxM6HF91mHeIS4yRImIs7YmU0nMIqMVKoECnfSbkV9QpEmLUb/E+kdb9S
 RaCd1dIsruMCO8p9BCb0aadWNrc3teVbV+Xs0Nig5B4gfGHMyVx6JSFjke+kbKaB2Iz+
 R4TA==
X-Gm-Message-State: AOJu0Yx46zvMbLgVRDYHwE60RgfnImD5jRJ5XWTukTzqUAbERihf5KC8
 m9GSoEKigaJbWvqCX9FR+jbSpXiU/alQkdNQx04PexSPhclShUWS2021
X-Gm-Gg: ASbGnctjhE8ml4Niq+M/CPFFGiexLM/eAz3AmuS8FkxSLNfxkTF5CnBzWs3xXoj21UN
 1a83b4Rq5FM8BcCDJHpvDOADk0TxXjNBbhbCl/bzoVhax+NJq/aZ0hEenueAuPuG5zyjaCyWObq
 rQ8JhLBTWywXwmAQ/grEVEquOXARIKeNUmft+CqRwdI0HrPeBk4Wjs3StZJB4W8AIHfXDGuFxrj
 giZNDqLgjXbeyrtBvqnlIrlbyQ9EROE8wjdBs4ZikT5BJ26jRzBN6UyWhBTI9gEmRWzJFy2IY0C
 uXOY/C80+YbcKQBCmUMPp43BwLK7V7TyNLWjBAqJCmxHZj8ISYGumh4PpDyQkbISCA==
X-Google-Smtp-Source: AGHT+IHCDSzd/TvfiLGBna/mEsbX0p3R29SQo842HETWpSNPG7weloGHdW6i0AXc7ZLVKDsMECqMDg==
X-Received: by 2002:a05:6214:401b:b0:6ed:1da2:afac with SMTP id
 6a1803df08f44-6fa9d2d78aamr219074276d6.32.1748330265127; 
 Tue, 27 May 2025 00:17:45 -0700 (PDT)
Received: from [10.0.0.88] ([2607:fea8:bad7:5400:6696:203b:ed6a:dd21])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f951b8e012sm89951266d6.26.2025.05.27.00.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 00:17:44 -0700 (PDT)
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Tue, 27 May 2025 03:17:43 -0400
Subject: [PATCH v3] drm: add overview diagram for drm stack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-drm-doc-updates-v3-1-58e97a831d03@gmail.com>
X-B4-Tracking: v=1; b=H4sIABZnNWgC/3WNwQqDMBAFf0Vy7pZkNVF66n+UHmw20UA1ktjQI
 v57oyeh9DgPZt7CognORHYpFhZMctH5MUN5Kpju27Ez4CgzQ46SS0SgMAB5Da+J2tlEKFWjrKK
 qEYgsW1Mw1r334u2euXdx9uGzHySxrf9bSYAAEsaSrOqKP+jaDa17nrUf2NZKePTLXx+Bg5GiJ
 iskaquO/rquX5C81ZTuAAAA
X-Change-ID: 20250522-drm-doc-updates-3686f6d48122
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748330264; l=3233;
 i=abdulrasaqolawani@gmail.com; s=20250522; h=from:subject:message-id;
 bh=N5M4+8n1PmoUW9waCKKJ4IbGWWLrQGiPXsfkC7Aswag=;
 b=WlwY1CtivbbI4bn0ylIuUav0HGEaPMCoZw/i/K5Js3gh3NFVPPgWDMsnSQ8ALn8soU71W2t22
 NptewLvG38lA7r+1kW8jjc21VS3kysrtjKC+8KuhXkpjjzpzArVU0cS
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

revert promotion of overview diagram title to that
of previous commit in introduction.rst

Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
---
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

