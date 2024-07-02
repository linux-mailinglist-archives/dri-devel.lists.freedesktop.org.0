Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4D6924AAC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D929210E706;
	Tue,  2 Jul 2024 21:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JXk5JRGf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464CD10E705;
 Tue,  2 Jul 2024 21:59:19 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-7f64f66fdd7so60635539f.0; 
 Tue, 02 Jul 2024 14:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957558; x=1720562358; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MstXp7FK88BMTd8JHXdyfJJm9pHe+R2QRKpv7nuxLhw=;
 b=JXk5JRGfz/XUghx2gX4ZYw7n5Y9coripDpjDfFe4VLICxHru/GLAHYUBKdVNQWsidF
 ER/mfsBRQ/EHCReKHNPLxbgJBWb/yco1g6/UQtp0aNzOi7A+wV4iURznA/GTTsL17sAM
 SGnSsUKEdxp5bX2WYc5e+eJriZP1MNFVaU9BrMY2l3LFmN9/yOpjX7rX3lUxEL+Kukwt
 ae36vnRGMss7UyzleyQoVMVErcAca2n9IrR6Vg2nrDNsA5zGre3106+xJxe6LdG5Vpca
 Oh3QO8jaQJBpj6I2xWwPVF8LHaHeOmImpSbHJtSd8UxNibfFuOlI6LpwaJFfpNkEd1uD
 40eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957558; x=1720562358;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MstXp7FK88BMTd8JHXdyfJJm9pHe+R2QRKpv7nuxLhw=;
 b=JvVRwFE2kRilEiJMwI1JrJ8jPnIB3EBlJ5FgdqrxHD3TEiMdmELj80+QwwN2QBA77q
 lRvsIqozBkJxiHlrPBxkELE9nr0fyMwaYao8moMCH4G9106oWO1tdhZpmx4I5NO1YWGQ
 jleXdnNcYDpOLUjkGg2zuDy1Z4r3MZMHe+63Ey2J0VxquoyRgrLaic6GfuCO0mqvNgTU
 6i5XrR4LuXn2/u1plbp65FSomOFo/NgIRH3nNS1/l3UWt32cLTDMSWjSEvR//jm9vORL
 69Rp15GeZeR355SazcnpBlvLKVL42yMyzLbToTnuT3ZIY6ffLwyv06KCmyfv1aM8uX+h
 2kMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1lOX/tk87fra0XnzazZ9Gs9uB9cIcLK/rcm28ZE98M3IbP9Ba1FeTe7oI1mZCK02jPleu8EXptxqyDAyyRMEidITTUhtn9OhuFvLSuM6lZlWAhT9cX4vLUiD9Id6qRzmYKArh7Mc1QRPsM7PXpIuwRqEZqOLh57pEkw/wWgyKtHdvbPEQLwGT0MFQx4ugtUQsijvzTNvY/hiSLmOixtReMVqopgUXcDI3plBLf5FTejaZ6/M=
X-Gm-Message-State: AOJu0Yz/bntEzjDGuezthNAW54deHFFgCRYtSaUILt1CLz7xIzn66Jhg
 1r0B1mQFnP1m1+gMeF9uQNeyIsM+CytbARGy0HxyLfcmStI3CKlZ
X-Google-Smtp-Source: AGHT+IFcIORp9H/J73OiEqri32U4KgwsO40eee8n6IPtXvMuMDoj2ETHViN1dw0w41V6S4LRy3BoYA==
X-Received: by 2002:a05:6602:1d15:b0:7f6:5c30:3717 with SMTP id
 ca18e2360f4ac-7f65c303a28mr121899839f.5.1719957558467; 
 Tue, 02 Jul 2024 14:59:18 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:18 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 44/53] drm-dyndbg: add DRM_CLASSMAP_USE to gma500 driver
Date: Tue,  2 Jul 2024 15:57:46 -0600
Message-ID: <20240702215804.2201271-57-jim.cromie@gmail.com>
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

The gma500 has 126 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 8b64f61ffaf9..5e03ac7ff433 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -39,6 +39,8 @@
 static const struct drm_driver driver;
 static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * The table below contains a mapping of the PCI vendor ID and the PCI Device ID
  * to the different groups of PowerVR 5-series chip designs
-- 
2.45.2

