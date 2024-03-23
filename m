Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E8C887967
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 17:32:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5254A10E4C4;
	Sat, 23 Mar 2024 16:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y2yGiauq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC4010E4C4
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 16:31:57 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id
 e9e14a558f8ab-366c26bd8cbso13723675ab.3
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 09:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711211516; x=1711816316; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+gNAzOlZksAWrrk/Sn0MY4Ibq+h1gY4sUBMqWqGyMMg=;
 b=Y2yGiauqA5obD0Pk8SN7ziGugTyz+cmCCdgkhfp//PSlZUobReKi4Rld3YDDzF/6lH
 nOPyRy0bz9NJrnlOrKDkJgqCCVeiHLkNfHFTsbqlAGudIZrrffZ3JcxoVgW3s5O+RKTw
 yKC/pHlDfxLCxUmEkCsb00w6lbwkeC/TO72YyAK3tT9BAN7z+dKxSHsH8l36eq6w0TQl
 XgAUQmd521fpIBIsl2CQ70mcxZle4Fnkoyno7/XbS00FylkFsFy3z2eK+A7rHrF+ZpTD
 xC8BOpNto+rdVShZa713JmC/ybtD9lzkOZQMpm0xbjh6xrVKSVPs3eXgKPXlebTpRIO9
 mKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711211516; x=1711816316;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+gNAzOlZksAWrrk/Sn0MY4Ibq+h1gY4sUBMqWqGyMMg=;
 b=d2P5bxRSbHjRpI8Pz74iHzrboBtzSGqRF3K3bsaAuUP4sB1aRTka/VeAUHYnM9bAnR
 uDyDkir3m2QGaCymAVuDMPRw4unqFtoVi5OjTRHfHVOb6C+QmZuOUZc8ixamHSEVi4Q9
 APU2VQZTnSqJ9I9Y1Mnra0ZNlazQdB3ccyQymWgVkNfPbjMGQCI5591gUXd7OCOufU4o
 mGdLHL8D+sKDxTXe/MJJSbVdxYz6EzDufX0LsyguYtAboXAHqhcIp06MbQhyYgNyvvaB
 4IYrI+45EwQo/C6zx5FIl0pt1PC0NGz6AWtt40qT8PbpF/xqK71b/4bJKRRdMyzjM70w
 zWpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpBgz9tF5hblTznTJ9SvI1wRx01epDeJseIehgTsVN76o5kvJio3Htn6HlrMyy2xciX8vjpxnfW8CSvhVwohiL9FbMog3d8Y9+7JEbiyuI
X-Gm-Message-State: AOJu0YwaXB1M0E4BdCKbmb/dWoXlvZV1pqrISjz3NrJkFwgZsJzBheWh
 9wvVms0L7qABFY900yXBDuwH9At2JSQv0iCw7OBDJLQTNmxQ0pkK
X-Google-Smtp-Source: AGHT+IHkLe8WthnCTg9DUJIoNT1vufkGawGIt/PJEEGR7qpZOXaS/myb/s/E7Y1IUAeXIdmR9S0dOw==
X-Received: by 2002:a92:ca8d:0:b0:368:85c6:6bd1 with SMTP id
 t13-20020a92ca8d000000b0036885c66bd1mr832046ilo.10.1711211516495; 
 Sat, 23 Mar 2024 09:31:56 -0700 (PDT)
Received: from amogh-desk-mint.Dlink ([119.82.122.244])
 by smtp.gmail.com with ESMTPSA id
 v62-20020a632f41000000b005cf450e91d2sm2970106pgv.52.2024.03.23.09.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Mar 2024 09:31:56 -0700 (PDT)
From: Amogh Cheluvaraj <amogh.linux.kernel.dev@gmail.com>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net,
 javier.carrasco.cruz@gmail.com, skhan@linuxfoundation.org
Cc: Amogh Cheluvaraj <amogh.linux.kernel.dev@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] Fix duplicate C declaration warnings
Date: Sat, 23 Mar 2024 22:01:47 +0530
Message-ID: <20240323163148.23497-1-amogh.linux.kernel.dev@gmail.com>
X-Mailer: git-send-email 2.44.0
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

Fix duplicate C declaration warnings at
Documentation/gpu/drm-kms.rst that was found by
compiling htmldocs

/home/amogh/Linux_Kernel_Workspace/linux-next/Documentation/gpu/drm-
kms:360: ./drivers/gpu/drm/drm_fourcc.c:344: WARNING: Duplicate C
declaration, also defined at gpu/drm-kms:39.
Declaration is '.. c:function:: const struct drm_format_info *
drm_format_info (u32 format)'.
/home/amogh/Linux_Kernel_Workspace/linux-next/Documentation/gpu/drm-
kms:461: ./drivers/gpu/drm/drm_modeset_lock.c:392: WARNING: Duplicate C
declaration, also defined at gpu/drm-kms:49.
Declaration is '.. c:function:: int drm_modeset_lock (struct
drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'.

Signed-off-by: Amogh Cheluvaraj <amogh.linux.kernel.dev@gmail.com>
---

changes in v2
- add warnings found after compilation
- fix grammar in commit description

---
 Documentation/gpu/drm-kms.rst | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 13d3627d8bc0..a4145f391e43 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -357,9 +357,6 @@ Format Functions Reference
 .. kernel-doc:: include/drm/drm_fourcc.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
-   :export:
-
 .. _kms_dumb_buffer_objects:
 
 Dumb Buffer Objects
@@ -458,9 +455,6 @@ KMS Locking
 .. kernel-doc:: include/drm/drm_modeset_lock.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
-   :export:
-
 KMS Properties
 ==============
 
-- 
2.44.0

