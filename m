Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F03D195A620
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 22:51:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6966810E66F;
	Wed, 21 Aug 2024 20:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KB5yWVUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67CD10E658
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 20:21:52 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-201f577d35aso107005ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2024 13:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724271712; x=1724876512; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pdEtI3O/iGeWeBxm8urkX5KxXtMLJvXUlzR+ZSGfwBE=;
 b=KB5yWVUdWXrQONDrctiyjuT8xC3xONAFcGMvvzCdid7lMlo3BWKqSdyofyspOFDUQB
 5QJ0yPIUyNZPz6oMTfcDEazT72Lb69OoPn6o9ffoUnP8ndO4h9OBs1WYSMBzNPdlycWD
 L9fIniROMHTdiP5YK81LwzeSax8RlRV/vEErZU3VFuAq5yRh3aKqySnU2OGGoubWap8G
 7kcs4LdTwlC/5CG1J1/rW3hQ0I4eytdSg4QLXMTqVqAzz+1VAwD0YmSqg+40Y6EJ5K3y
 tu9I86vqMCvz51TbQ3+VtdU39r7FtPFNSs+4Ju8UJ4IxbtZAs74jVYyvkBn0dwW3U4MG
 arQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724271712; x=1724876512;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pdEtI3O/iGeWeBxm8urkX5KxXtMLJvXUlzR+ZSGfwBE=;
 b=m0hMqVhgrbuykVwf0rboSXDKy+BnZUeGAUUO+N6yenIiX2E3EEP3Fia+MLvaARSHiF
 YOGrRyKqLfO+yHi9HN9B9JQQNkAvE3kyzeZcdY/wYRaMVIw/5T9Ufzoc6fawpwx7xaW2
 yATSVe+VQF6TRZQzETNcjJ7ID23KyWSahEjo4iT3IF0QaHuh/drGRmSvTQyc08OpRzGU
 OJD3GKoi1pkLP9/jVDdpBQFkYyRr0zylQNGzeWqWNF/0gz8nRtpe9ensvtKE+cDiFIMM
 LOff96hTHF4vBilviC5YSvNd+VS4iBDcEEiLSMIdN74k/P1rIe9ZO7iuMT16KB9+48oZ
 CaUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaZp6lI2xVTyI/KugoDrQgUpQC3Uu+258QLDWZKmEXpXEntY4UCpWN29NGG4TKIvJmi6oUADIrAuU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTUytgL1YZ0SFbmjXMZyKHSGWHYwTWFcdqVs0sD46S3C22/FyE
 qogCwtqQJ26HSI+4YuquggbR3kLmJQtk5WupZ6iDUuYr9JsaXZYD
X-Google-Smtp-Source: AGHT+IGGgNc2ZGslMC/kIvseelSPc6tnyKCegD1knqA0y2M+DqC1rV3TUQh/vwMStjuMVjBFtb3hIw==
X-Received: by 2002:a05:6a21:7884:b0:1c6:89d3:5a59 with SMTP id
 adf61e73a8af0-1cad9ccf6abmr2400052637.0.1724271711902; 
 Wed, 21 Aug 2024 13:21:51 -0700 (PDT)
Received: from iac.. ([171.76.82.52]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d5eba239f9sm2341503a91.28.2024.08.21.13.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2024 13:21:51 -0700 (PDT)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: maarten.lankhorst@linux.intel.com
Cc: Nihar Chaithanya <niharchaithanya@gmail.com>, skhan@linuxfoundation.org,
 tzimmermann@suse.de, linux-kernel@vger.kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH] include: uapi: drm: drm_mode: fix documentation and coding
 style issue
Date: Thu, 22 Aug 2024 01:50:40 +0530
Message-Id: <20240821202039.63516-1-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 21 Aug 2024 20:51:19 +0000
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

Fix documentation and coding style issue in include/uapi/drm/drm_mode.h.
Changes include:
- Adding description of function parameter.
- Correcting block comment style.

Fix documentation warnings in include/uapi/drm/drm_mode.h encountered
from make htmldocs:
./include/uapi/drm/drm_mode.h:869: warning: Function parameter or struct member 'width' not described in 'drm_plane_size_hint'
./include/uapi/drm/drm_mode.h:869: warning: Function parameter or struct member 'height' not described in 'drm_plane_size_hint'

Fix coding style warning in include/uapi/drm/drm_mode.h reported
by checkpatch.pl:
WARNING: Block comments use a trailing */ on a separate line

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 include/uapi/drm/drm_mode.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index d390011b89b4..bbdba76a5d25 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -147,7 +147,8 @@ extern "C" {
 
 /* Scaling mode options */
 #define DRM_MODE_SCALE_NONE		0 /* Unmodified timing (display or
-					     software can still scale) */
+					   * software can still scale)
+					   */
 #define DRM_MODE_SCALE_FULLSCREEN	1 /* Full screen, ignore aspect */
 #define DRM_MODE_SCALE_CENTER		2 /* Centered, no scaling */
 #define DRM_MODE_SCALE_ASPECT		3 /* Full screen, preserve aspect */
@@ -864,7 +865,9 @@ struct drm_color_lut {
  * array of struct drm_plane_size_hint.
  */
 struct drm_plane_size_hint {
+	/** @width: Width of the plane in pixels. */
 	__u16 width;
+	/** @height: Height of the plane in pixels. */
 	__u16 height;
 };
 
-- 
2.34.1

