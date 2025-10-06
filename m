Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 167CFBBF141
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 21:14:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A6D10E451;
	Mon,  6 Oct 2025 19:14:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NGh7/ltj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0977C10E451
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 19:14:29 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so3663780f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 12:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759778067; x=1760382867; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cMtkl73qHUTB2Otzy8qJpuGWoZM+8mVXxqiE2cfrzu8=;
 b=NGh7/ltj+buJbMpAbflGtzSQp61aAFtTMRSuaoNbkjNtU0w+sCjo4ccXNfjBGSTgGz
 zjvKtwh0N/Z4pyR2EyA/3Vgt8A37JOFAH5+gI5pcPhIMLUwsr8MqSWzmrVFTaRqhg9km
 KCAAkl0MjQKXaH7uXoCf15j7dEMN39DkJchNyr/mmUXwlDX5jUFd2TR65ukg0QkYtol4
 SRScyBRcZxoJySBw+w8LBTy8nbE+HFkh81BhUGr4mTT+PYiO1zKYmeRtNhImduxvJj4w
 4JC5IiH6AJDDd/gsRUsyeD4rDywhW87DwH6CG/fMBmDE3ro9TG1bWi1pZ4pFWzlC8ZP2
 8wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759778067; x=1760382867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cMtkl73qHUTB2Otzy8qJpuGWoZM+8mVXxqiE2cfrzu8=;
 b=o0ybsf+HmPGu0F8uU81Yg9UD8EZWSmQHNHzGmm3DAcRv52NVwszh2rNB/HEL0EbRlJ
 ha/U3f9LoiaZKdTkha/azFxMo2irQ4PsQkCFEeiVrmLjst7g17srqU7webZouFkg1yWP
 7gQq83mJcbV+5CbjigFWzUqdkkDqC3tYiIFUpJISafAi5knWlyIWbrw0yYGYgUff4k2I
 2EtRh41mk0s80q/+TyAqkdvMn4qIUFk3GeyF5s0T5CgBoa4kA6FS8WWXgSdWtZVvwCSw
 ypIO3UCLqa+Zyvf3Nono7wXn89JIR3Q4bdZlHFgBiqXaDFDya7NqFUA3KAx+j4MjqSqg
 KSyA==
X-Gm-Message-State: AOJu0YwVDrUTOX9pV0HFjTcYz2Hp9tWhXyx45DLCHpZxc55aClQwNT48
 0QzflHYAT4KddzjU1k7uTc0+dk1K0JLRDEt46x8EtvUEPr7x+pWdXHp1
X-Gm-Gg: ASbGncv86DGpbotSleUJpRaIoHMK6PYJoBVrKALdHoMRBtuhDx9xZPufVDbAuIShMbW
 e8HqtKFzsC6DOlLikEeB1ar5XdyV2VMDpbg/fdOCRHupJBiv4PHXKLjZ1ssGaZGX11B9xM9B8wk
 wPhvttAgZyE+I+WV8uYKhkS8GagL18QGbK7W6b8e3dN2ibvHVI8UqEYK3EsnhGbBKUzcaxaq9Ww
 gOx4SdFiBTRrX0Z030qUFXhAhhqe8vEIjB6taUxrcS2w2hepyWUHZLAS4vDL1Q/Zwgg3Cai8Nqz
 +ztasCmd2H+0bPLmpDWnLctcOq/gJzPZMshgFpvDdXQVZCUu0tbE/C2aDDucbuqnsref0iqWSD3
 uMlCFFHwtqznEjB3gTRXXCBZJEPkguftLqaIa13T1/mf1igRxZ+7GV9UCgw==
X-Google-Smtp-Source: AGHT+IHibl08k4JzpelLWXkVQvkZeAeMW83AzZ6iy5srSLOqcaI281FxHivtIMxMcy0ldDFLMpiz0Q==
X-Received: by 2002:a05:6000:2dc3:b0:3ec:b899:bc39 with SMTP id
 ffacd0b85a97d-425671aaf41mr8629761f8f.58.1759778067482; 
 Mon, 06 Oct 2025 12:14:27 -0700 (PDT)
Received: from fedora ([154.182.208.105]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4256866060fsm16646435f8f.14.2025.10.06.12.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Oct 2025 12:14:27 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org
Subject: [PATCH 5/5] drm/nouveau/drm: Bump the driver version to 1.4.1 to
 report new features
Date: Mon,  6 Oct 2025 22:13:28 +0300
Message-ID: <20251006191329.277485-6-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251006191329.277485-1-mohamedahmedegypt2001@gmail.com>
References: <20251006191329.277485-1-mohamedahmedegypt2001@gmail.com>
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

This is so that NVK can enable compression for kernels that support it and
avoid cases where an older kernel would MMU fault when a newer mesa would
try to use compression.

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 55abc510067b..9983dc57efc5 100644
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
+ *		- add variable page sizes and compression for Turing+
  */
 
 #include <linux/notifier.h>
-- 
2.51.0

