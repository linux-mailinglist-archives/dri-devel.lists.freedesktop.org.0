Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23672AAE18D
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC79B10E7F6;
	Wed,  7 May 2025 13:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JXy6UP2a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D05AC10E7FF
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 13:54:52 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-43cf257158fso38969645e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 06:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746626091; x=1747230891; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LWqR37aI5twwZSWILXuoPG0kdPMC1+eZgCLJxtlievw=;
 b=JXy6UP2astnbhT6/X6RJZIyvh4PFgstlDyfK+mkyGsM8/j2HJtvTWJEO4KCdZ9EXbZ
 Bn6nAqNKMjMKQ2p+ujz1+cj+SQpprICwHuqaL9MRdQqnlDV3PSsBylxMoUmpWiPeH3yy
 2jIcIDG42SmybeM2jMjvbUBj/tjolGdxk7X/oRDHaZZDloy86rZSX75myvkCIrVArnPV
 A7o6FFdcJRznZzNh+blxCg6Mj8lgXjFwNczTAwuNcGQyzZ/heMKYm1ez51wF223YAilZ
 7W2vefyPuqujBeGXnXoQYdlHKgS0iRpbDcR6rhDE26xANGlVKopOS7wen/4ystgxPl/u
 DJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746626091; x=1747230891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LWqR37aI5twwZSWILXuoPG0kdPMC1+eZgCLJxtlievw=;
 b=df833ZJPnEuawJXJ9ELHV5ptP1JLYT1abgLgCzxDsGq96xgWLMrk67z4Yi26rIcWis
 nuglDgsNCK8hMWwt1Yd0pANcKj/k8DZdKZNPcfiJE9WJtIf9faHwsWNL8RwVtSXPryRF
 44QhBVk9DmqSbR11lbiog7tfDz88vgEr63h2ydz+Uk+ERtw8xNULSfuiiNK4sorCXUws
 Idi7+fHrIrfJ+yIN4LY1wyT8WSIRTU167RCNTX1XizM/scL9w1+snrl51ic8pihmoyjb
 k4IVm4N//Ni8XmnTZP7db+NgPahhT1i47AIoUFyJj9yvH4cPNRqMewX2ynHLFcJ/U6N4
 KDug==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUBWD+4LFr1KS5ddJOhZ8MbGGPA721GZKyCFWx/cGX3Vjpzjmn72WnPxAnlJ/JiStgpVAoXLFWH3E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw06Ql5Eb3L+eg0wGeI8TVaoufBcga+ecZ4HCDu+SPtlxtcyH4y
 7+zj20/kmnkF8oB+314r19JtkTvRoT9ctPYxcVmQ5LbByoHRlaE5
X-Gm-Gg: ASbGncs0emx5R/h8ASakXmRvzjYcdnslg/sufglXKNoaAvZpw/n1D1F/S/knTDyELx7
 H/7zQI6DAqwhQGphx9doaaFraAfGgK/Dp87AOBaVavZn8lPyZobsaGLaoTFchroTnZtM4UcvMF+
 NpxFdx6NGZnyT8B4fgS7O4NYmsuLR05lZsICcwoWP9TMpNjYmIFZfjTnvtGBZ5WdBbKnb4Bn8qd
 Oep1YBw/JtFWdXf3zNTxCdtnyeXpD1SBEyccACxxJ7mlWCP9iORldhJDbC+5R6XSfqMtkuYa/jH
 7vgm3+uugFfqH8gZGVTh0+cSz6k5FdeIl9y+EfLAtoIm/Jd9wHkX
X-Google-Smtp-Source: AGHT+IFyVtHmGEduXkwjzUmI++R00Dm3LiRIVnkrJLxWB8zjNqD0zZuy+Z6OQjmVFKKegfPZ2AaplQ==
X-Received: by 2002:a05:600c:4454:b0:440:54ef:dfdc with SMTP id
 5b1f17b1804b1-441d44c27d0mr25577365e9.8.1746626090964; 
 Wed, 07 May 2025 06:54:50 -0700 (PDT)
Received: from fedora.. ([94.73.35.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 06:54:50 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v5 13/16] drm/vkms: Remove completed task from the TODO list
Date: Wed,  7 May 2025 15:54:28 +0200
Message-ID: <20250507135431.53907-14-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507135431.53907-1-jose.exposito89@gmail.com>
References: <20250507135431.53907-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Remove the configfs related TODO items from the "Runtime Configuration"
section.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 Documentation/gpu/vkms.rst | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 74126d2e32e4..c551241fe873 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -222,21 +222,14 @@ Runtime Configuration
 ---------------------
 
 We want to be able to reconfigure vkms instance without having to reload the
-module. Use/Test-cases:
+module through configfs. Use/Test-cases:
 
 - Hotplug/hotremove connectors on the fly (to be able to test DP MST handling
   of compositors).
 
-- Configure planes/crtcs/connectors (we'd need some code to have more than 1 of
-  them first).
-
 - Change output configuration: Plug/unplug screens, change EDID, allow changing
   the refresh rate.
 
-The currently proposed solution is to expose vkms configuration through
-configfs. All existing module options should be supported through configfs
-too.
-
 Writeback support
 -----------------
 
-- 
2.49.0

