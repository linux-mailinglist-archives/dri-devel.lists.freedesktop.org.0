Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9FE924ABF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD4610E719;
	Tue,  2 Jul 2024 21:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DJZbmr/u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB8510E719;
 Tue,  2 Jul 2024 21:59:31 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id
 ca18e2360f4ac-7eb5dd9f994so174442239f.2; 
 Tue, 02 Jul 2024 14:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957570; x=1720562370; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oC5iipR2BEVxGSl/++A4yY4qqMQYODae2mcnPNjxpHM=;
 b=DJZbmr/uFhsPWxLp5cGq1pJIx3mefNR5d33G6U7RMznspgFJtb6AmYM/8sfaM7Vy5/
 lYXbL0ZzvT4eWI9QitA2W+LT+15dhiO1yLJJS7iWtniykA+WAEiNAWW3olEwgImkHCvl
 D3mtKRzqj859Mfec9Qi0r3dxG3aTgkFYZYi0gmAowL2L6ZYZXjpJClKi2DPZVJZrXolk
 MG2kDxD7MYo/q9zWdMXRF5QZ7PL36HOuC/MRL/X1jkiIxarprVVf9a59LTZh/ANRxNB4
 rgWvazvpSZ4c2C1EBAwYXdewbQP8rlZNYAxo/A4BVMPOAD4yKIJv+FHhZXn7j1DuHdAB
 xsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957570; x=1720562370;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oC5iipR2BEVxGSl/++A4yY4qqMQYODae2mcnPNjxpHM=;
 b=bqhSgxOHbgnsUgoEKL9cvSeoIK02DVpfMqp9gPt2UHm2I55Pcz27d/BjcJcm2+HA6U
 o7p/la7uCUmegNWZpPGyolBtrJ3fbNvRxub1UAm/WxPbM3g5y9zH48RDNQBssCLTVbDR
 g4KqdpsPrhSaNvV1A9vzVoSWK039Nm+nCtueup5G6+2sDudIN9cdSZ4JCC4h2BZgw+Ou
 2FKt+cbraokUbM9m2mT5V1two50uBPgHgrK6fGOUgmenH0Od4FPDTHDIHsCeeP9YAwD2
 SgrNXuYemfE8Je/t/hcF4tpETIUZd060aWIEOo4ecEhQXbP/txCqGtBJZUO7+HoriGw0
 40jA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPPs3PxKIWlEymZkPY7P4XhiqTXD0WJoL1aY5RmS/VHmPE5Ulm4T6D88hYF6v7ThWBgTUUd/zGF6Q+kfFrOjDmZlG1ybbqjE07LGV2CD+0v4gYxJehm5BjFWsqQCFsQ6tbRFFl6CuvZrUwhaFIeKIiuBrXTMmyTNZaGV+RAgwbuZY2r9K0egJyx2hpmSFR5RjmZ5Jcce9c/qSgzlBObeSxLGMZ+s47dtFcE/PQKysnhdKwSog=
X-Gm-Message-State: AOJu0YyhqvAy91PT4MyW/+0U9VygUl0wFUPmujJ3CaPBLyJ8mR8nA9p/
 KpT4ijMi62pPPVT0/PRz5eiqtTutq4o8HrRrhK59tBUD8lVI1Eum
X-Google-Smtp-Source: AGHT+IG3KnjeWk+tAUHTPovE025jwoX/P1iby1t4AUaiPLy6INftMDEvgITc5Zor5sYmFDRxWWvjqA==
X-Received: by 2002:a5d:8408:0:b0:7eb:d640:267 with SMTP id
 ca18e2360f4ac-7f62ed4df02mr1061790439f.0.1719957570618; 
 Tue, 02 Jul 2024 14:59:30 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:30 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 49/53] drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
Date: Tue,  2 Jul 2024 15:57:56 -0600
Message-ID: <20240702215804.2201271-67-jim.cromie@gmail.com>
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

The mgag200 driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 573dbe256aa8..88c5e24cc894 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -25,6 +25,8 @@ static int mgag200_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2)
 {
 	struct device *dev = &pdev->dev;
-- 
2.45.2

