Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABACA79463
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE0D10E8AF;
	Wed,  2 Apr 2025 17:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i9iDpHaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEAD10E8B3;
 Wed,  2 Apr 2025 17:43:04 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-3d6d84923c8so446585ab.0; 
 Wed, 02 Apr 2025 10:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615783; x=1744220583; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v1ua5S//H69kDLjZ/ereYDRSGWaurp/ZUyrfcdHp8ig=;
 b=i9iDpHaMbiEm9Cl5tECbUBZcAR4vozFOSnmk5IlP74hcQ/hL44qTn2A1AxrEc45Pk0
 +vFrjrV/rVBXw03SNRuFuCzCCzEl+PPuTDU9vbToGCmqbPkBf89m9M0IT1d2uzYSDrnn
 NtqYl97woPAmUje/vpQLPhmAzQd4IxzBYTOz056xoxnt8pXyYHIYoJO1ZwT/LahLZ1QB
 femEKfYPU7Tr4UGlIBeoURvEEX3OHsNz3cRV7hCrkuWJcDvGZJ08v0TCD6HVtT8tIsGy
 3pOrn90YdHjYR1zUD7+8NaYBV60ssBmYjtwwfOwTOY4p36mupZxRzxT96PWQEWhZ4YSV
 vrqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615783; x=1744220583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v1ua5S//H69kDLjZ/ereYDRSGWaurp/ZUyrfcdHp8ig=;
 b=vpsPJSqFiAeYkw1QtPEcVlKoXzr5kyPsWa+N+sBX2q71OQ8I6U3Afwt5OOwubPNpay
 MFlQvmYN+CUz33XlVPQEGz+Xq6dc5W9RjpYHk9p+BBLY3FVRIpTnecxyrbk2V5epqmn+
 /D2DPFHxiwhbWtlpcTAaZSx2zFoQNiW17P7/HYaB0IUVJ8nPAjlikptXCI0sg/SqpxmB
 aUCGu3uvayZhd00HbWbkW1oh6But57GMsunTJuk5Csd0AixHXiNyTPBIYJrkWdn81Q3C
 qxSJ9LWzKR5FsMj4TurOWoHeCqpA+vHQ1Qo3ARCanQi25q87vL2rHSRxpCz3lqUMYGXs
 eejg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFgxTG7TmgutSpIpCytx8KujLX4PVFDwvlt8Y1ndhkX9dNhyCh++LoJJ/0QiTPLDFClN0v6odOPLKYjA7FYw==@lists.freedesktop.org,
 AJvYcCV/F4nf08/rOBguFthh6SSq+082dBV0swwmizQDstnLPvCreNvZYsL0wxclzQb7IUpWEBdyyin6@lists.freedesktop.org,
 AJvYcCV455/RbubEXcbJlWrGmU1tzf8Qf+4hSzx/WUY4fXDlNmqjBmDLZzDbK11gjMTRoTyjpkMqquw8cLBG@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKAVSOtXYaaksCmT05mjwA6O7mDnbaOapUPYnHmVx5z/ZWOvx1
 IFIw7lf8iDLbPbR+ov47yfFWDVSZBJS+EM+D/kktFFUKB6/zRg5+
X-Gm-Gg: ASbGnct98/lkycU9ygFbx7n7EFzpjsA2hI3XOVa2442ZXmsIyYlK8fQEfopCqM/RJ/v
 vAQpq+q06pWsisy1wP5EJeigO+F0YRnKBiy8sx29FhSykhKwehNenqZswmnnQPYottvFof8Z7gJ
 TcZKgmLuGLvl09cVDItpC++PaDBbrOvriqfQBbzPvpTzidS5ssCG0bHLhkZ9Bajicc76eT9O5iI
 u87+LCi//xc7i+squz5x7p75fkRkxbN7CWW0EgsaqfM9efmVv821A7cNITi3YrQWSIKIAjRBAwn
 4ZaRP3+YIgdYYUYkrWKXzGGzi6wwweXhmJ/no2wFqHeo+ck9jkGEKn/SHQD1ZUq2UktP7xgYKsM
 ZJg==
X-Google-Smtp-Source: AGHT+IFNbSL/mGRZnpcJ5fpN82ueS3a1gUICe3xx8i7wsRjblgimnfxJciryAt1b8LRjBn5RrhWasA==
X-Received: by 2002:a05:6e02:12cf:b0:3d5:8937:f419 with SMTP id
 e9e14a558f8ab-3d5e093c0e0mr170520315ab.13.1743615783315; 
 Wed, 02 Apr 2025 10:43:03 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:43:03 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 51/54] drm-dyndbg: add DRM_CLASSMAP_USE to the qxl driver
Date: Wed,  2 Apr 2025 11:41:53 -0600
Message-ID: <20250402174156.1246171-52-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

The qxl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index 417061ae59eb..c18577a3153d 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -66,6 +66,8 @@ module_param_named(modeset, qxl_modeset, int, 0400);
 MODULE_PARM_DESC(num_heads, "Number of virtual crtcs to expose (default 4)");
 module_param_named(num_heads, qxl_num_crtc, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct drm_driver qxl_driver;
 static struct pci_driver qxl_pci_driver;
 
-- 
2.49.0

