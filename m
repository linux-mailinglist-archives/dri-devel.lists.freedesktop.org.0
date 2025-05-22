Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 747CDAC1D91
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 09:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD90A10E1EA;
	Fri, 23 May 2025 07:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZnAn9q2F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FED810E0F7
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 22:20:36 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-476f4e9cf92so64578421cf.3
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 15:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747952430; x=1748557230; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5UQYzm0ZJraz8sXKO0wiUzEndPZK9OYi59VPMyNIk0w=;
 b=ZnAn9q2FFr9JrZny13NXcHI5a/coVFpqHL8UW0UWO7yoRc8W0sYzLFDdWKawMzqIAL
 SUk5QQiP+RhX2h6Epys3l1Q9oLXsZwswBLZOxE5U4JHmkBnH5K042X3mWTQ/b98J5xEB
 Pz473nVZ3NMQLs1NNarbhaD2DDosrZ16+xQE+nzdY/WQmRqGVmA6DwSu24ar7X2WSvPY
 77xyghCiSrpLsbgB0NxJkA4swCd0nTTCUkVNg0ElC1oYw2I+yzJuzLckvMbsjkPXGxCL
 rvpxYUmk4b3MTa5OPYcRbT3HLzOKH7BzcDy+CC+qiBNKpScClpsJcJ5SWL4QHy6wWhOG
 uubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747952430; x=1748557230;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5UQYzm0ZJraz8sXKO0wiUzEndPZK9OYi59VPMyNIk0w=;
 b=SFjvjb7jmZXktWHQRJkDJygEOCYe70mHVBAmRXcCnAabXP8P2pTAt59z7IeCc3JToP
 sTuuuo893cdOLEKSgpIuQISFQeBY1o5SPQ3JM7WGeZoJ8+2MehPmKuc6jo/rcbPIVMVo
 UjU1vHmTPe0hP3g1w4d9x/dpxDxF4jz94xCFkufnDPMcdQgGfTEbyn4m7J+vmhbGAK+M
 XwLlgJElugZS+g7/nKUu2yt90Xq0Xlm0RKQmVCsimYA5w8MQxvT4JzQwfXsifD10b0IR
 cD6QK4fAjBtznFLUMVK2IgBGTN8pgd/fYzOF2DTayMtsSsKytHclc1cJ/GtaMs+kRnn2
 81MQ==
X-Gm-Message-State: AOJu0Yw2n0w7iWyWZGD8kcaLCtzM3Pcc2L8mraVUVQLwxlFZgRxtGhVm
 L5oT90IikZ6gMWa5GrAFWOhB5PYkgvtteVk/l+xK8M/e/PJOp64ENvdu5G2+yr7903g=
X-Gm-Gg: ASbGncuL+NVrPhfr6y6JCXVNHT4v94aNEQDKeD4pW/Bz/eMsvRnjYFmmHKWq3kEUe9O
 c6/UDejr2KIPQfNQqNJkQ1KXIy5lkmQH4AttcSy70oOkh52gCDk1FsnBUekMSbzOzZMoSsqHw/b
 CgsFoiqTgBwkUrPiBbJDxfFYNdnAxwF0x9hWJvu96THjLrAAtjLZALLLA0q427u4PYX68RH1FAc
 pyUZUps+UWKCtEt/QEEv985tBR49gtmJKBl9lt+lq7CB8jm3xgvBpl1vqkwpJGQJu9T/JdHk2E0
 24Ir+Qfi0Mvg1WNqwrQCUY+bvlS0jNR2Af8t9ojdHsvDYtFIey2IGxwkIeIjAZH53g==
X-Google-Smtp-Source: AGHT+IEGKhSwA1k4ZU8DE7NGlukAyFisFUtMYh2J09r/PQ37dVzjG4nN82sPMWZr0i6vtMJ9GqccaA==
X-Received: by 2002:ac8:5d53:0:b0:494:b258:abbf with SMTP id
 d75a77b69052e-49e1f89fe0cmr10113391cf.52.1747952430059; 
 Thu, 22 May 2025 15:20:30 -0700 (PDT)
Received: from [10.0.0.88] ([2607:fea8:bad7:5400:1d7c:4b6f:e2f5:660b])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae4ff75esm103652241cf.59.2025.05.22.15.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 15:20:29 -0700 (PDT)
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Thu, 22 May 2025 18:20:27 -0400
Subject: [PATCH] drm: add overview diagram for drm stack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-drm-doc-updates-v1-1-d1efd54740bd@gmail.com>
X-B4-Tracking: v=1; b=H4sIACqjL2gC/x3MPQqAMAxA4atIZgM12iJeRRzEpJrBH1oVoXh3i
 +M3vJcgSlCJ0BUJgtwadd8yqrKAaRm3WVA5G8iQNZYIOazI+4TXweMpEWvXOu+4aSsiyNURxOv
 zH/vhfT/Z6DzIYQAAAA==
X-Change-ID: 20250522-drm-doc-updates-3686f6d48122
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747952429; l=2433;
 i=abdulrasaqolawani@gmail.com; s=20250522; h=from:subject:message-id;
 bh=ZYhfgkctRlGBztjQSjU09xCbZ+lb0KOYsCwJ4dRgW7Y=;
 b=qc/IsRH9KqrApyEmH1EEjMxejZ10GrXbPhCG8fcGAi5w8QfBZ/qRLRDFu0LKoSPXggn+mXjHQ
 tL3gJRwbyAxBn7/1bgSi6DfRkVtOm5UsGXRuLGQHbhjqaHwIO+aBriA
X-Developer-Key: i=abdulrasaqolawani@gmail.com; a=ed25519;
 pk=LCvBseqd+rEj8B1vNEnSSfNcqQwMsfWx1DGDT1LYddo=
X-Mailman-Approved-At: Fri, 23 May 2025 07:21:45 +0000
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

---
Signed-off-by: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
---
 Documentation/gpu/introduction.rst | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 3cd0c8860b949408ed570d3f9384edd5f03df002..91bb0efc96d69921a122c5265b1431fa18110a7a 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -14,7 +14,43 @@ including the TTM memory manager, output configuration and mode setting,
 and the new vblank internals, in addition to all the regular features
 found in current kernels.
 
-[Insert diagram of typical DRM stack here]
+Overview of the Linux DRM Architecture
+-----------------------------------------------
++-----------------------------+
+|     User-space Apps         |
+| (Games, Browsers, ML, etc.) |
++-----------------------------+
+              |
+              v
++---------------------------------------+
+|    Graphics APIs   |   Compute APIs   |
+|  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
++---------------------------------------+
+          |                   |
+          v                   v
++---------------------+  +-----------------------+
+|  User-space Driver  |  |    Compute Runtime    |
+|  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
++---------------------+  +-----------------------+
+          |                   |
+          +--------+----------+
+                   |
+                   v
+        +-----------------------+
+        |   libdrm (DRM API)    |
+        +-----------------------+
+                   |
+                   v
++-------------------------------------------+
+|     Kernel DRM/KMS Driver (i915, amdgpu,  |
+|     nouveau, etc.)                        |
++-------------------------------------------+
+        |                       |
+        v                       v
++----------------+     +-------------------+
+| GPU Display HW |     | GPU Compute Units |
++----------------+     +-------------------+
+
 
 Style Guidelines
 ================

---
base-commit: 4d07f5440d7afee27dada528aaf5230e760531cb
change-id: 20250522-drm-doc-updates-3686f6d48122

Best regards,
-- 
Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>

