Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED65B3DA93
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B8B10E372;
	Mon,  1 Sep 2025 07:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fcEjlSS1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB57010E00B
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 14:15:34 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-248ff68356aso16051745ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Aug 2025 07:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756649734; x=1757254534; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HT2tnFXLGodr/Ol/iLDsu6bZVkZa/3lt411uDOwsk1A=;
 b=fcEjlSS1S/wlmmfK3Dg8fGb7fYCKd+v+1zrz27AhI6AkblJKSSNk7snf80x6IS483D
 JXUFXMeSEL1ez2uBZI/Q7H1xzZQ+Vuy0N4DnoDrKjmi3UU0mtP1LoXHs8OFjKflq1BnW
 ZeOD2b50w7MbhTdNFZR0z59z8KLSu/ikjo8yKmg1qWC2ajzBujc2jQjIoZh4s2K2/sFq
 5aqbaYxu7y1q152YebFvytpJZ8VjRYVYgjE3Qz9EzDWJzLBDTWnA+t+emhcdIwZ/2NZ6
 vjCSnCQIRIYPDvMGrZrfyNQCjwz9cp7WRb2J+kDI/f/wXs1hcIgNc2rSaXjPbbbCmeeU
 2ITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756649734; x=1757254534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HT2tnFXLGodr/Ol/iLDsu6bZVkZa/3lt411uDOwsk1A=;
 b=LenoC+e1JDkNyMP8zbeiJeRMze/7tT01LSHKRlGPhfBxziBoHhKIgp4qzUVOJdh65+
 CKW/c51ZXVN8seJKz0BlLdhg0usT3KxgZwAYIrtHC0882GxhoPS/UIzpe9e7OcsdmV5I
 YgqHjdz30e9ouM7ZLEae08t6sSkPTCcfBIovENnKCaWMw5YGkip0rw9Ne021a3gqttPO
 BwiKW1jqP9CJrCJbAYzsRXOAKjmSbjVeSoSNkyf1bCtnavcMemcDPAk7QVpPMyES73yX
 UvWbkmbwP3OmM8Y3XBpBhV0tFOJiadnQ3Bcu4x5OcSxAEDdl58bK8u3VmVAs1Ik3maJD
 +QZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/0KJhW6bA6Fe0LQ+CFviyoU9HQ/3bpii7vz7x/ZNY6M66yBHC25tlE8fUZrIcOCOJJVq1TAbwjLk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKIbRWVLS2YssMWI8r5ZojC3ItVRaDvxETLIQVIpJxXca4w4ne
 4mMiq3bbPGjBaW+6jCOddETFxA9YC6Nrld50dsYodygd43DwVzGyIv05
X-Gm-Gg: ASbGncvVdIsdpMltSTOYkFPI0k4d6ccF4klscqTSyfjfztcmsK7UVNUV0kY78sEeK7N
 O8RbREUE4JtXgt/dwZ6kIzGUre8HooEWafwl6yT1ioadP8EZDROVk2NUBIStrI4aH1hgpedjj/Z
 olGZYZJ4dZNKUoO9tzpp5NfBfTv/im/lyR3GUPHMObw4hSelXiC6hsIMuIQ/XrK0rUv3ky3kLA4
 zLZ5GT1IyjjpuTxOLvaT2LtGS8M2uiC5Y5HVWuXb11f2WpzXEts2CbV/HhGr90fMOHKtGv6i+Sv
 feH/eBSo4y2cN3s6Jf3/TmZmWg/53AcZocVZx4XpWhsjifrTwNqGdsB6sVdPpYjNCUNBYLCOR3d
 tj5mldrcDrCXhd42VH5IFfL0OBjrZ9pmKJoDfZOeFIUrMViQ=
X-Google-Smtp-Source: AGHT+IFw+ZIS2MKM3bdCIDJ7UFL5l11P9sSsVyLYU1HFxQeGPNi2j5pi/ybo/wZjl06HLWYrWCy3Tg==
X-Received: by 2002:a17:902:f708:b0:24a:acb7:a1a4 with SMTP id
 d9443c01a7336-24aacb7a5f7mr32595525ad.9.1756649734163; 
 Sun, 31 Aug 2025 07:15:34 -0700 (PDT)
Received: from mohin.lan ([152.57.1.136]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-249065a3b67sm78031815ad.120.2025.08.31.07.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Aug 2025 07:15:33 -0700 (PDT)
From: mohin24khertz@gmail.com
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: airlied@gmail.com, simona@ffwll.ch, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, Mohin Nadaf <mohin24khertz@gmail.com>
Subject: [PATCH] docs: gpu: fix spelling error in drm-uapi.rst
Date: Sun, 31 Aug 2025 19:45:22 +0530
Message-Id: <20250831141522.7813-1-mohin24khertz@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 01 Sep 2025 07:02:45 +0000
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

From: Mohin Nadaf <mohin24khertz@gmail.com>

Fix typo 'unpriviledged' -> 'unprivileged' in DRM UAPI
documentation describing error codes for operations
requiring elevated privileges.

Signed-off-by: Mohin Nadaf <mohin24khertz@gmail.com>
---
 Documentation/gpu/drm-uapi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 843facf01b2d..7435664a1ffe 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -535,7 +535,7 @@ ENOSPC:
 EPERM/EACCES:
         Returned for an operation that is valid, but needs more privileges.
         E.g. root-only or much more common, DRM master-only operations return
-        this when called by unpriviledged clients. There's no clear
+        this when called by unprivileged clients. There's no clear
         difference between EACCES and EPERM.
 
 ENODEV:
-- 
2.34.1

