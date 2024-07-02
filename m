Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F19E924AAA
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D8710E6FF;
	Tue,  2 Jul 2024 21:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KI0sYsjY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ABA010E6FD;
 Tue,  2 Jul 2024 21:59:18 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id
 ca18e2360f4ac-7f3cd802729so172626539f.1; 
 Tue, 02 Jul 2024 14:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957557; x=1720562357; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MstXp7FK88BMTd8JHXdyfJJm9pHe+R2QRKpv7nuxLhw=;
 b=KI0sYsjYxjSaQU7HmgL/S6xTEH+5x0hzZWFVbXfkOjNmDvodJpoHpJ1LTfNlx4Ka8e
 0RJGQsWtAzI9W2erMliHDlQSxU7foY4Jqce/7Gaj9IAwIUH41YK5c2Ia75xXu+R0+83O
 1srKOA7BhOQFzWR/xgcxIriIBFzZwY8PhIJ1QVn+lM2dYRhqKluUnrEpw+GFks669IJ1
 DatVrFYCVcMJnRj/s5BeyL5zU3R4CVA40zTCvfmbS6dk5BKT9QDbq9p8CfBnDWQyEt/t
 r/kxsdekP5S2al6ulv+wmrWjPKBBfwsHz+IZq6Tv4trrpunMGC9+fQHZtC3GcRj1faeW
 wtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957557; x=1720562357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MstXp7FK88BMTd8JHXdyfJJm9pHe+R2QRKpv7nuxLhw=;
 b=B3OUkltR5Q1skXoBpjQ5BCqomOdFoyTkuoJKbfMg0dI7kYMWJPcN+fpM8UZMXyIGRN
 N4mv3OZd6KcTdvGS7nhjIlnLya8Uc9WXs1NXh+5n05D72bZwyJqhHiClJAkvuUSFAUms
 wAd7s7so1sMzYxkf0RlL9Bkb7vbBMRlgdz57EPIzPXkVbx/ZTyGDFDvSzuTvTFz/fdKa
 VVs6ULjf7EPayaI3eT9R5VMoLHRh+2hYPRzSo8BJPb99yXvKgMQSwGmZ/CyplgUY61Ii
 nThkoXEzXJOyGeKCRI7Vg+mSN5GUWrCdLQ4+KnY9kYTw93OcUC7F+Hsy47mWVLSExDBs
 hIHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoJ4jpZg1/qt4oVB5J4JSUeBTKr/MwvXhbCB4coxppCn89yuf4ulLB0Z99MoUsZUYV8NzRR1bc+3+9sjiqk6G/XCgasgZUoFVC5wU/CnVxv0mVnQR7HA0WNVH9UZPP22+Kc//TU+JrgB7aywFlcsKnrWgCaG8sHuysYcb762wd9BIgui0aDxlfBpJsAeOxwnsvmF0gkfDH8CJBVabOLIwRKMN/7hIVOVTArOQ+iyJ9cfQWByQ=
X-Gm-Message-State: AOJu0YxgE0VLzH/Tg0LPnV85mqqdP4eiMAM0d8BWY+5WKQm8ZdBxDijY
 odaXQhi/y4DIzwsodS8maek242hRs51kh2428N5lNTmpraGR0qD4
X-Google-Smtp-Source: AGHT+IFELzazdv52SOJ609vTMnouJkmTMMLQschX/DEhQZmc7e+NLKxBenDxq+yCZxxLRM+vTht15w==
X-Received: by 2002:a6b:6106:0:b0:7f6:2e72:e81b with SMTP id
 ca18e2360f4ac-7f62ee168f6mr1110126639f.4.1719957557504; 
 Tue, 02 Jul 2024 14:59:17 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:17 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 43/52] drm-dyndbg: add DRM_CLASSMAP_USE to gma500 driver
Date: Tue,  2 Jul 2024 15:57:45 -0600
Message-ID: <20240702215804.2201271-56-jim.cromie@gmail.com>
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

