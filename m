Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EC8924AAF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CAC10E711;
	Tue,  2 Jul 2024 21:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BCa6XYIH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1941210E70E;
 Tue,  2 Jul 2024 21:59:23 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id
 ca18e2360f4ac-7f6309e9f29so165206239f.0; 
 Tue, 02 Jul 2024 14:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957562; x=1720562362; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6+Eqreo55RWzciyFbwYCY+bKp2K8wKhzwrrhakb4uDM=;
 b=BCa6XYIHJT3FG/3v2S/eFXtn93NG6iPFUHDay164cYxqzWGwJ8EPT5LtrfCeIZp8Fj
 pMtVaftq77TtWAJzPeYOU9sMQRR420o+MD+Al45xXVZqN3sl6wHOFrB57fz7LoxcfDRi
 /5NvbENt2fxl2O5THDBst4okn2RB/0Sd580Rk9GQqJ8lDedn5vfb/mtZA6STyld7Du2o
 oBXFAZ/+zvKyS85zMKgjgTe0Tf8Zh8AlOiZkGFlcuGVgPO7E+qBYN0YVMy9SRw4i/B7h
 NSZi3Fw4JUPXdjLsJGd2CV4inHQE1347rWJzcPMW1X9BpPMSShqIILPNuQFftUCGD5mG
 EffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957562; x=1720562362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6+Eqreo55RWzciyFbwYCY+bKp2K8wKhzwrrhakb4uDM=;
 b=ZBtE+LbykqC/48gt52iMcLZRMSw8bdLlHmYHytq3ob2ni7shK7K+6/qOwbRhjXWoRL
 fFehdw/b7WaWrjrrIVlB9oPInj3vHAO2UAP/YKegCrC4MPq3yc77cWroidQw8x1icL4u
 F+Fles3aR973lRhl29WA/vHirt1dyntFeA6OG4kaf8FfHmqKkeHVIDUP5vkldsvzbh+u
 PENnxT5SCjGRjndSLDXsmksEd/34Nuo8rdVBM0ZDlnG3vouXxhJtj6UVYBkm5T7R4yl6
 GS9K6GXx24XA2OzIjxa10Zfnc7T0VfIkb/HR0NLVEatWIrMS1nJA6io522FD7qbprE3S
 nZMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjdY6ovGLLpiyNcrMouk5yjwxMPog+jSPxwiPtUwT745DjKyMAAP1PhHJSYqjmN8QSivvUWHGj5L/M6Gb56R4pw8KIvIaS+7/2ThKB0lFKoscGDbgmzxXvIp5CzMabwx2hH9nwxGvxZVwHTAlekZ8F0eZ/tH3/lBtFVD0x44nflJkhkQrtqYRnno5Pf5bfrIY4zKYrNoLa+694bvBx9QtP9Oxih6RP1eeOf2JZxa0cQ93DlBw=
X-Gm-Message-State: AOJu0Yz6ry9gqXI+e13pLuxp1MfHiW3jwZqcNJrRhIn5+X5c+UI80edx
 q9p66sCXdZhH+rlKSJsYN9is5N/rlSJ0MOkcrIAgfEBCnJnvfmDy
X-Google-Smtp-Source: AGHT+IFbVFUYm+0pu0T514FItDcAvbDhzBeP2fYzyyuJhvxQn5GvEZPQBzd7j+fZ1Xji8n6rJpg1qQ==
X-Received: by 2002:a6b:cf18:0:b0:7eb:7f2e:5b41 with SMTP id
 ca18e2360f4ac-7f62ee196dcmr1130557639f.9.1719957562323; 
 Tue, 02 Jul 2024 14:59:22 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 45/53] drm-dyndbg: add DRM_CLASSMAP_USE to radeon
Date: Tue,  2 Jul 2024 15:57:48 -0600
Message-ID: <20240702215804.2201271-59-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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

radeon has some DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg about its use of
the class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 7bf08164140e..d22308328c76 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -247,6 +247,8 @@ int radeon_cik_support = 1;
 MODULE_PARM_DESC(cik_support, "CIK support (1 = enabled (default), 0 = disabled)");
 module_param_named(cik_support, radeon_cik_support, int, 0444);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct pci_device_id pciidlist[] = {
 	radeon_PCI_IDS
 };
-- 
2.45.2

