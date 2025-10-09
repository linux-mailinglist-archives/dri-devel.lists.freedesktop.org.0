Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B524DBCB36D
	for <lists+dri-devel@lfdr.de>; Fri, 10 Oct 2025 01:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E93D10EB37;
	Thu,  9 Oct 2025 23:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E3P1K2xx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7E810EB36
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 23:39:50 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-46e37d10f3eso10794465e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Oct 2025 16:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760053189; x=1760657989; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OpLyNX9fRh+6ZSUeqgLPaV8NCrY8WnY93VlPM/N7oK8=;
 b=E3P1K2xxVKxge7hfM1OTpH3Hqujk8lpdSs5Nbrw+jaUDJAhrzWxkFLTNYoCPymMbsV
 zhjkIbbIOJervDveVR+lFq6t57D//xxYY45n2PEto1fzko1EKXTuEkLjurMli6yINKYp
 FF4arZqLoxsqTZaCI9mhYHti1gcvo+F3aXq2tueRg3X7tA8JQmGjVgfntNyVRzMtO6P/
 0NCraWuOAf2KQku8WAcBfSglw1nc7zuEiFEE/DnnVlOzW+it7L+PQPpdfswdvECF+HZP
 nfHqlBVMZltu+vIv9lpvRaTpM94rZAOITspVIxis1XxGc6tbKRrj5y8iTmd6s+56GA9v
 DvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760053189; x=1760657989;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OpLyNX9fRh+6ZSUeqgLPaV8NCrY8WnY93VlPM/N7oK8=;
 b=SaT5duvICBwoFYBp5f2BuimxJCs9SE9fvuGJ5sewnT+OYdmSxR5/oUkAjDzNeLMfe3
 OUGSaGajczn03kY/hJ3K1ac4JtoxmeHd647XE4U52AePTr2HdsP6zQd3QCOlUyAjguqa
 ceAutztycfoQQ0N/iDf0LveDxn2V0BNRIryjIqqk7ArgNbCOvED7kolor46GpqnIn6cQ
 pb7O+wX24t+msx4KNZs5msXM1cj7AVzeMhW//0J1AWCjSbIeOu1GD/hfWegpDg0UYBWZ
 J+f+OKdW3abByoL0vDEf1WL5cfjuuXAQJ7Koui+0i4oOxWM/yRPdWGPFBEmptMgyP8ol
 6/bg==
X-Gm-Message-State: AOJu0Yxl263Lx/ZW8VO7THGxcTIM14FG/wAM0kjwzbhbBpmjNG8ty2Vg
 TLDKM8Ihk7TTC/hqKphbz9Jqs3zD9ChHh4g7c7WiB8IjcyaXLWafWeeB
X-Gm-Gg: ASbGnctZ1Aka6jwZ5e1NF4Oj11UVMeW22cafMeKGVjrXCKpzexVHq0Y2KIzK4gKWBOu
 5Co1qpes8ckA4LVuSdA8VWIEO1djsj7EFHkQngRAiFf7+JmIUkN06NJ0n60CTu7k6iwLVaA8HVV
 PxJ9MQgBwudcA1o/9J/W8aosdAL0sZJcFzLh0znVvyGcB8ndm52pOtFpbSGGLo/4KszkOBTl5CY
 4q2bAZbvQNeuouu7GSZ7wPpAqvyEF6+CQIqchT6PhrZTbxPOS3rv8NbgemWD+/nx0/7tiEn+CKN
 9M8csc63UlJkagIGMxB5/MOL6HvJ97+F+d7bU3xhrTVXSxzdMloI+F89wKgn3NJiJclkKAJybtt
 rbO+/0p1NHCn7D3x1syu2iXS0dHPXiJS4NUh7eTc7Q959L8+ONis1
X-Google-Smtp-Source: AGHT+IGJYw11rDLltJwLvCnQW4izSML6BKxvrZuXRvJXZRf+jWWFVqJr/ShHNVK1a4VjhZ4lvPbVMg==
X-Received: by 2002:a05:600c:1395:b0:46e:27fb:17f0 with SMTP id
 5b1f17b1804b1-46fa9aa204cmr65438775e9.9.1760053188697; 
 Thu, 09 Oct 2025 16:39:48 -0700 (PDT)
Received: from fedora ([41.45.27.42]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3e3206sm46066075e9.4.2025.10.09.16.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 16:39:48 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH 5/5] drm/nouveau/drm: Bump the driver version to 1.4.1 to
 report new features
Date: Fri, 10 Oct 2025 02:38:37 +0300
Message-ID: <20251009233837.10283-6-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
References: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The HW can only do compression on large and huge pages, and enabling it on
4K pages leads to a MMU fault. Compression also needs kernel support for
handling the compressed kinds and managing the compression tags.

This increments the nouveau version number which allows NVK to enable it
only when the kernel actually supports both features and avoid breaking
the system if a newer mesa version is paired with an older kernel version.

For the associated userspace MR, please see !36450:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36450

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 55abc510067b..e5de4367e2cc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -10,7 +10,7 @@
 
 #define DRIVER_MAJOR		1
 #define DRIVER_MINOR		4
-#define DRIVER_PATCHLEVEL	0
+#define DRIVER_PATCHLEVEL	1
 
 /*
  * 1.1.1:
@@ -35,6 +35,8 @@
  *        programs that get directly linked with NVKM.
  * 1.3.1:
  *      - implemented limited ABI16/NVIF interop
+ * 1.4.1:
+ *      - add variable page sizes and compression for Turing+
  */
 
 #include <linux/notifier.h>
-- 
2.51.0

