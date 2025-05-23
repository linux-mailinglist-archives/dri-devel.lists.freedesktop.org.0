Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3354DAC2C1F
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 01:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAEA810E869;
	Fri, 23 May 2025 23:25:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LwuaUGTj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447B510E097
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 19:52:34 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id
 d75a77b69052e-476f4e9cf92so1641631cf.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 12:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748029953; x=1748634753; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nrabLxj8R0+gWSgXlOCfum1YIagrx7v3OcNYJ2wlWMQ=;
 b=LwuaUGTjMK6P1otQUrb/Bj+PvcgnJyUs27eXNNJp7Vh3uoCvu6fT8lHoxey26P5C9J
 wsNmRQcjCS2VlVdebFZ2SETcmligHjATxSxNG5Rgv/QshZl7xkElm6b/r3Ik5PNtdAzZ
 /pMdgcURfani/AznU0RCGbumfpLZ036TILMmyn96iNbz+BJqZdHNUb00TWnjb+0aneK/
 qJvqLH1OBoebHBzZJBDSz13jsM+eSbu025W+zN2ENX2BL1O4IL+2ou4DEWYm4hLtK1QH
 y3Sj5w6kNHo0sKoryC53rBuPEuoNV3jqDx/7bJ7NjNb4GG6DyVfdzuOkELpeNY4EdQDT
 AJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748029953; x=1748634753;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nrabLxj8R0+gWSgXlOCfum1YIagrx7v3OcNYJ2wlWMQ=;
 b=eaB38XfHgMaVMBgTUX125JORTzKa7lBsQkIfl8XckXzMe2GIyh1Z7KYDj2GjY8QJuv
 /Sl7d1PjDJv077KqggGgmq2WC3KGPm6h3Xc5h1mfOafx2PmlPcPRKwJVd6DNaMGuNhwa
 7pOXnrpGYvSaMWOvl6FrCwTN/gFT4WEnIm+BUVgvYK9ZlISteZMZBx3yffILBK6gsMdK
 qMqohruSckX6XYY4FlDr7Tz+XsbTXSXERUJAdjdN3og3QpjSTSsSaPKK7j+OcmA6Z1Oo
 C0ZSjjLswS/Mx94MzaUaEpmX3f9U3VQqQRQHoo2+ZoCsT1sf9BUYNh14XVLUeI8XuAeo
 CD6Q==
X-Gm-Message-State: AOJu0Yy0iiGebfuanpFlfXe/vYTmEYcJ9oI1MARrsqm70UMrsVczc/cp
 SRpbQUbsF04CO+vnMVkMUYoN8CV/+gz0jsMvsel+VzHtMOTFu1N1n/hc
X-Gm-Gg: ASbGnctHVtIDnfazTJ9VfYxSS/PPTyUi3Ht/2SJP2RD+Jk2YW3+2gRTYaB7y9SDKXmj
 u8SWZzPykrKEV2RiMrHreN9ZFGHiUmmpdxm4a1aJlg+MX0DsmyGh20PecSWIZcyse6gsPGln6J7
 OVzvkUF/nAPcmsqh9X2JNG5XQpX7VF5yY2LQnFWcDXz2o23sLdLnQv0PLSNE5AFnzp0Ln4CWpPW
 mWKxLqdVVz0tMnveo4L3uplClPoGrgFTAy4HStaR4hq00mCczWY8EaIJbRGWvmeg0haL1O2/jpd
 7PDzIIuXWXYJFskzvi7IPoe181zzTY/Vx15rDWaaqgBtbTMdGS3MBEtMad81yvey/Q==
X-Google-Smtp-Source: AGHT+IHH0XRRoych4f6+KUaQ0fb+Mv8leaDYEmMTiTyLzMWDwUNEVCbrlUB98Jt4Nl8dDJzI/MYlnw==
X-Received: by 2002:a05:622a:1e0c:b0:48a:c90f:ce6f with SMTP id
 d75a77b69052e-49f46250cdamr9680311cf.4.1748029953273; 
 Fri, 23 May 2025 12:52:33 -0700 (PDT)
Received: from [10.0.0.88] ([2607:fea8:bad7:5400:a4e6:39bc:5bd6:cf8f])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae4fd718sm117133001cf.53.2025.05.23.12.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 12:52:32 -0700 (PDT)
From: Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>
Date: Fri, 23 May 2025 15:52:25 -0400
Subject: [PATCH v2 1/2] drm: add overview diagram for drm stack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-drm-doc-updates-v2-1-e517df152cf6@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748029951; l=2194;
 i=abdulrasaqolawani@gmail.com; s=20250522; h=from:subject:message-id;
 bh=B7ivfgJeKG6ORpMwQ6TTvaIfeyjPMtOvKMOcVgmHwy4=;
 b=qZlRVluYXxiLnxUM+U1LYVofi0MtRbN6PU6B4qsz+sqHVTMjWeu1QbYrt4R8LDBoUY/gzGH39
 hqrge9M3qLTDOnYpaHhjThT8fcXPMXGv0BnW005xAw94fD98yqyGe6X
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

Add an overview diagram of Linux DRM architecture for
graphics and compute to introduction.rst
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

-- 
2.43.0

