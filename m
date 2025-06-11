Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35A5AD4859
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 04:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1400A10E336;
	Wed, 11 Jun 2025 02:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N+PfmuH2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E252F10E336;
 Wed, 11 Jun 2025 02:08:37 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-234fcadde3eso71842035ad.0; 
 Tue, 10 Jun 2025 19:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749607717; x=1750212517; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/GTJ1pJR4xwooAL1I5nvRW+Wju9UFrsbmTKQ9hJqRj4=;
 b=N+PfmuH25foeswgnLn0pV9WwRq31CuprXHD2tq9N6V1OdZGhShVhSYkkXLyPVWY9S3
 afWrwL2pTefczH984B35qNBCg46kxUQZawh4TUCWKqDbx2nHTMamNrg+qQ1IImefVHgw
 MbGi75e7RYJhr0uP6ocrwbxBsatfp/nzXyUh/KEg+GtEBYc/NqH7nqGbxF8UsYfVbtoA
 xdSkzr9C/fwu1X6GIbmG8rcE3WJ91ePacWOClmmjB6xTBQyCbQH3xSKGpWTqpv4VJU2f
 9E7gCUhjKVVZfT4rwchZmIJMZmKdOiPVQoQW316iJ3HcQ+OJfy7UzgwIYl5XzZS+P7Y7
 QDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749607717; x=1750212517;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/GTJ1pJR4xwooAL1I5nvRW+Wju9UFrsbmTKQ9hJqRj4=;
 b=i4BQvvtFArxbZNq+yUNxf/mJXKlJ8xdJSrmPldBSWG3vwqXu0HAb1nJaqYMZj7tAsG
 vQD/Q6UtH87rr+87KxIMWmp7ZWqzZLpkg24SPDQYec/pRspb1fUn+DnhiHYFBCN60JIZ
 e6UvfXEBCLu4fWoVzTgSU3n+DR4CpHDpSNdju2/dm9DMQ0+zHr6gOLRjOBa0TuqjRfaf
 XH4SeV3dbdtDiC0vPx/K9wYSzqybIrHHeXHsxwIIcJ95YMP2TyxYakVwDEAVgAJpqObM
 mxyWZCuhaSEuyNcref8UoSmd9nFMUfFWaeq5xgK+PErl8M5jG+6Z9gSf6KETLV93rNVk
 hawQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5yk5bOh43IAWBZhhYrg1vNaW0zvIBE51wJ5jCraLZH+fs2hvYZsW63o8pNysUFqlnlF5g33Pxqg==@lists.freedesktop.org,
 AJvYcCXjxLXNmTZzlsMr6pLDWpatYbyiwXs0Qwo5YVBiSDeoh0/VOYEBFJdRFkgcg6Tx9lnswkFYh+JPMGY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywm+itEZ43GmZvHH4Iu03x12qyd+fXuBnF19DicY2ENfW91oRMZ
 83cmbGY3DQ2Bfysp4pchVBVMJOtRUuRZsyr67K5XfmYNhPNjxei/50DF
X-Gm-Gg: ASbGnctZHhRwEbTbI+4tSAly4jjK+K6j7s3RtbRc/SfOrmas/5NXzhWxdhqN/IeaQ+e
 S/+Bg/s7YDGupHW3B9T4/rG546aJo2CIo51uOFzRm0K0K/KFyU7Jp+0pnVXDUeKRugoe63DwTr+
 7EuNC9s37X3mq612OGsq8mbpCcYehWezHzHJ96imewzQD2FD3NMP4oPMAc5YeZa9zXuR/G325ZV
 gp+M3IRVMeoYOPlg4KKkcT1m3+WqIK3a9pCfKBiveK1rS6k9Jb+Pc5n6BXGbAN254/d8R+HsI3u
 kNWm17nJKVVqMEQ9hEde0JrVDka/1mmiFxJ97DB5X53SQoz0H2NuMmq1LhgVgW5rkZYxmQ4N
X-Google-Smtp-Source: AGHT+IGUrcqA3hrwumHbP3z+19RPkhfMytlxOzMA0qc6w05gOhIJ4Jk1wBXyEFe80IP2WwukQ5L/Ug==
X-Received: by 2002:a17:902:c94d:b0:235:668:fb00 with SMTP id
 d9443c01a7336-23641b25d36mr17985605ad.46.1749607717145; 
 Tue, 10 Jun 2025 19:08:37 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-236030789b3sm77086055ad.26.2025.06.10.19.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 19:08:36 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 201CE420AA82; Wed, 11 Jun 2025 09:08:34 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Nouveau <nouveau@lists.freedesktop.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Randy Dunlap <rdunlap@infradead.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2] Documentation: nouveau: Update GSP message queue
 kernel-doc reference
Date: Wed, 11 Jun 2025 09:08:06 +0700
Message-ID: <20250611020805.22418-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1724; i=bagasdotme@gmail.com;
 h=from:subject; bh=xqmLTSSMJRGvXYb5vPd6fT5kvFP6HfljFoZuxEiyQTc=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBkeTwIjH37Td/ofe82l6vluzhTfT05V7lmdR/vs2dpvf
 HnRvHRqRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACaiH8DIsPO7SYSCaFTK30OR
 IQGsxcFfvVjmKgcFK0rembiy7o3TXEaGvd+/3zt7v/fImituP2bPmKXyrfB9Y9yFskuvU67d36p
 2lQEA
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp;
 fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
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

GSP message queue docs has been moved following RPC handling split in
8a8b1ec5261f20 ("drm/nouveau/gsp: split rpc handling out on its own"),
before GSP-RM implementation is versioned in c472d828348caf
("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/").
However, the kernel-doc reference in nouveau docs is left behind, which
triggers htmldocs warnings:

ERROR: Cannot find file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
WARNING: No kernel-doc for file ./drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

Update the reference.

Fixes: c472d828348c ("drm/nouveau/gsp: move subdev/engine impls to subdev/gsp/rm/r535/")
Fixes: 8a8b1ec5261f ("drm/nouveau/gsp: split rpc handling out on its own")
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
Changes since v1 [1]:

  - Correct GSP kernel-doc reference file (Randy)

[1]: https://lore.kernel.org/linux-doc/20250610065258.41467-1-bagasdotme@gmail.com/

 Documentation/gpu/nouveau.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/nouveau.rst b/Documentation/gpu/nouveau.rst
index b8c801e0068cb0..cab2e81013bc5f 100644
--- a/Documentation/gpu/nouveau.rst
+++ b/Documentation/gpu/nouveau.rst
@@ -25,7 +25,7 @@ providing a consistent API to upper layers of the driver stack.
 GSP Support
 ------------------------
 
-.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+.. kernel-doc:: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c
    :doc: GSP message queue element
 
 .. kernel-doc:: drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
An old man doll... just what I always wanted! - Clara

