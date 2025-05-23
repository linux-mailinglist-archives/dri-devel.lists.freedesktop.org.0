Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76EDAC2C23
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 01:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE0510E1EC;
	Fri, 23 May 2025 23:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CxmfY8Hs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F23410E097
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 19:52:35 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-4769b16d4fbso1113631cf.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 12:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748029954; x=1748634754; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WmPCjoSXFBtyUZwjoj/rRSZyZWME/2nkz3kS++4dL0o=;
 b=CxmfY8Hs8mg9emXKVyvkv+HPEpdeAQDU+yq3QQiaRNwOVg4hsDueJRn1dbjzsX4aJO
 Wgzv0UiB9re+zyhIbv6BnCZHD5WpHhiVKnyaGMr2zWWDBi84tNnxd8mZ22oZrnW6YyQR
 YdlKpdZmFCVD3bjZnR/g9pJarpgXWfbaTK4TCEtBVhSzPkDmGJ1NfNeUM+s6BX5OZT5X
 231OvClCJqvwGbs2G9OUeU6SnXVGExERM+/PRvFvqqy9Uga2ueZfzLWX0GOfRUJfhH77
 NcnefZmeZeF3tZhzMDj4qC4gpLe2fx+k809rFEH3MHmuS+BFCQIun3YbaDDUTklAynJ0
 Q16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748029954; x=1748634754;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WmPCjoSXFBtyUZwjoj/rRSZyZWME/2nkz3kS++4dL0o=;
 b=QjcOTLhNSpQABHwyIqm3AGpMfpiYvXHjsJ/Dx/lv1pA8T6fRfL8dsIt2F6YkLcn+DJ
 gBIrn2Z8mdpxEf9jo8tEe/cndEpALdnAilYrsjC1gimN02sIZ+4Sv/+OwySogEA4V0QK
 jeXSBYHSFTiVaulMn+SzOg+kGkqMP4jpBwMwOdA/W/U2E4C7KP7wb781RLT9/zkyRHND
 z0fj1NR2A+4REUCA8lhXJynnugRZHN6r1IyiD2VNlwSPbbueUYlHqnmkkdNBOUVKChox
 X0DYrdYsl8eR0rvhNpoFkfgAk6f3oVSR3QpRx9caDEJWNkorNg4GBC7kQ5S70YBURCI/
 zG6A==
X-Gm-Message-State: AOJu0Ywl5TlGrOXC8kGqJWO9CaQjo1NJGimghcAqU4MH0VGyKCx1dMLm
 eairIbUnGZ+N9hog4S5NQ4AJFM/gAAWDbM3v+7NLrqV/HnhiDtIAn1z+
X-Gm-Gg: ASbGnctTplBcKZOcsXZKinmru3h/rJR/5MAMAXhRZDkZO8784xebXLM6a09XK8bjdI/
 keL4+GeRb37el2JCy8twHPv193n5W9V/LCuKsMtH3RfHSvGmzlhuSk6J128DWb/4MkU4b01v3db
 vqMWt4kUyDHIJ/yKBXtqRYAHnNEJGJodEqhIxVywOblzxK2aw7uvAQWzFNS/NV7K99RXC+p9OmP
 0WOx0hvQUZCJQaPEeM+AM+F8c+rKcpSUXPq1rYPR4L8oqnVEeShf3uxkvRQpEdIUEk+px6y7fd2
 RrSLFUKEy0XD0Lxc7uJSXMVaU6t57E70tN06vOTtiEa6idxrHPAcWxa9aPaud1WYmA==
X-Google-Smtp-Source: AGHT+IHEPwBBepU5BOws+80VBNcZYVDCzQXJTxhWGn+7xzZI195OkqyZLZqqugwwVyfoO0lqkMvQpA==
X-Received: by 2002:a05:622a:4c0e:b0:494:af82:7804 with SMTP id
 d75a77b69052e-49f46e41135mr8653601cf.29.1748029954290; 
 Fri, 23 May 2025 12:52:34 -0700 (PDT)
Received: from [10.0.0.88] ([2607:fea8:bad7:5400:a4e6:39bc:5bd6:cf8f])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae4fd718sm117133001cf.53.2025.05.23.12.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 12:52:33 -0700 (PDT)
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Fri, 23 May 2025 15:52:26 -0400
Subject: [PATCH v2 2/2] drm: add overview diagram for drm stack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-drm-doc-updates-v2-2-e517df152cf6@gmail.com>
References: <20250523-drm-doc-updates-v2-0-e517df152cf6@gmail.com>
In-Reply-To: <20250523-drm-doc-updates-v2-0-e517df152cf6@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748029951; l=3657;
 i=abdulrasaqolawani@gmail.com; s=20250522; h=from:subject:message-id;
 bh=OKaP4B0Xnh5TJoF72fSANLfkmXr2lapzq7QazmotoOE=;
 b=ykqV2SnKCAiSw0h64hCOwcwDzdGjEq6siC0Lx768zLLib1IaPQvCVP0qmBLUThAToYtOoXtU1
 LnvqueGSk+ZAcOyJ06XsiQUpaQMozq9sjVixalqZn/GupAVctm0gERF
X-Developer-Key: i=abdulrasaqolawani@gmail.com; a=ed25519;
 pk=LCvBseqd+rEj8B1vNEnSSfNcqQwMsfWx1DGDT1LYddo=
X-Mailman-Approved-At: Fri, 23 May 2025 23:25:09 +0000
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

Put overview diagram into a literal block
and set its section title to a higher order
---
 Documentation/gpu/introduction.rst | 72 ++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 35 deletions(-)

diff --git a/Documentation/gpu/introduction.rst b/Documentation/gpu/introduction.rst
index 91bb0efc96d69921a122c5265b1431fa18110a7a..2653048ad4bb0ecbc2b676295440442dddbabae6 100644
--- a/Documentation/gpu/introduction.rst
+++ b/Documentation/gpu/introduction.rst
@@ -15,41 +15,43 @@ and the new vblank internals, in addition to all the regular features
 found in current kernels.
 
 Overview of the Linux DRM Architecture
------------------------------------------------
-+-----------------------------+
-|     User-space Apps         |
-| (Games, Browsers, ML, etc.) |
-+-----------------------------+
-              |
-              v
-+---------------------------------------+
-|    Graphics APIs   |   Compute APIs   |
-|  (OpenGL, Vulkan)  |  (OpenCL, CUDA)  |
-+---------------------------------------+
-          |                   |
-          v                   v
-+---------------------+  +-----------------------+
-|  User-space Driver  |  |    Compute Runtime    |
-|  (Mesa, AMD/NVIDIA) |  |  (OpenCL, CUDA, ROCm) |
-+---------------------+  +-----------------------+
-          |                   |
-          +--------+----------+
-                   |
-                   v
-        +-----------------------+
-        |   libdrm (DRM API)    |
-        +-----------------------+
-                   |
-                   v
-+-------------------------------------------+
-|     Kernel DRM/KMS Driver (i915, amdgpu,  |
-|     nouveau, etc.)                        |
-+-------------------------------------------+
-        |                       |
-        v                       v
-+----------------+     +-------------------+
-| GPU Display HW |     | GPU Compute Units |
-+----------------+     +-------------------+
+======================================
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
 
 
 Style Guidelines

-- 
2.43.0

