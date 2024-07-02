Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856C3924ABB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C1710E715;
	Tue,  2 Jul 2024 21:59:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CiCrDpo3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6765F10E70C;
 Tue,  2 Jul 2024 21:59:29 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id
 ca18e2360f4ac-7f3cd802729so172629739f.1; 
 Tue, 02 Jul 2024 14:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957568; x=1720562368; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oC5iipR2BEVxGSl/++A4yY4qqMQYODae2mcnPNjxpHM=;
 b=CiCrDpo3BqPM9ru84OeEF3MTDWHhzPMCNVM4LIKFF44r1jCoR5DBNHxnlZW2HGCMlw
 FxsHqcpn7hp+oRQBEKMhOdxthqTcXd5m07FLjquiizD66+CxnLDwb8wiop8QOAFqrKKT
 RxJi8npxcyFs2n5P1CuV3/JSEi2YmZr/Zhgi1PPsBy1J0UgaCnvtSRWIJnpzQqMCkNhI
 2AYdgy/iH71vmABsrWhq973BRzXdjCywo5xSmMbsAE80tpsPoEfAEsT4ptRgmHTXyT+d
 Jl5y2KDULeeTRLK2IdB0n8fLze44aJQCu6CwoN78NNqRFLHRE1kUmtHGRUyERYKu/LHV
 Pd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957568; x=1720562368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oC5iipR2BEVxGSl/++A4yY4qqMQYODae2mcnPNjxpHM=;
 b=dhPjfw+w+afnsYYWTAT9TKPWRARpWIF1kCyD+9mEmUhDe6K8xvZikynpgJwR0Ud90q
 SWqH4EJczLT6hkVDs7CNHDAvpi7suYNGKduvdWMi8Hp51qyyWM1dl99zFqnFhGBc8O/L
 EPaAJpCpg5ZsJormglIQrC9UzWTOCk4KefosXE+s5As/ZDYIqpC5bbSUwcWMVXn4jcLy
 XwrV1esW4fckGyBTT6YD/uVaOF0pUwGaxYME7IJ+UA2KXQfCQJBtAt5nwxIgaP4lcISr
 fGrfDSxykNMQmopw0nnOo3VCqB+FiBbvblKgeuQO5ltmb/7VmSwVi872n8BtKe4vRTrB
 AT/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUF1n+mHZf12zpKuQv1iyDx9jK4YI/ZvsC4IxMxLcEXfIAIu5/DBlQ2Pou13i474iRyWAHWIY8LEubnFQ4/1DgPVvlyiCuqYLV8nu9UpuGwuKUB789UckLQ+4qdZMEHnWO6lOUYekLPhFh9wVVAupBGk6d1GrnxePZHvnVGBzdLhoClzEFD+6v6eakrqvyAiB9Bo2R3EDZR7ithTTQhUDsyLtZo7kHSZHGEg+I6+OKejwCJmj0=
X-Gm-Message-State: AOJu0YzqVejsXKu1XJGaxEjM4N5pkQyX+svYJlN7sGSJ+jz9PRGNMc3Q
 W/MBsRDF2DnDh3QVo1m4LE/+mgJIejOd5+Q64WinAOMATS7/SOXM
X-Google-Smtp-Source: AGHT+IGxhTOcr4ji5IFiskQTbP7XplIk6SNXi5lLsntoYpdRCPZ1vof9lF5GiOngaUP5FSepVU/KWA==
X-Received: by 2002:a6b:5113:0:b0:7f4:861a:5e5f with SMTP id
 ca18e2360f4ac-7f62eea3032mr999757239f.20.1719957568654; 
 Tue, 02 Jul 2024 14:59:28 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:28 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 48/52] drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
Date: Tue,  2 Jul 2024 15:57:54 -0600
Message-ID: <20240702215804.2201271-65-jim.cromie@gmail.com>
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

