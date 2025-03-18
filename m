Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A0EA6681C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 05:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB3610E082;
	Tue, 18 Mar 2025 04:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cthbTKsM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 869D410E082
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 04:13:19 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2235189adaeso87673415ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 21:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742271196; x=1742875996; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oW5RGZBsAsxOiN0J4s9yrYTbdtJ8eIVDFBUiSb/g7VQ=;
 b=cthbTKsMY2r3GCBpM1/yukQl1Tn/4/X8Ca3rEFVGDZcZ+nEVVJtkyKauwn+xqeKCaY
 VQp75Lc3aIqjbYOkjhMhx3GhGRfKspHubcQehfbWmhICGDPwwnxYXbSZbTuASEuL1MJy
 QVvsHYPXgsPgp2a80Hx1q2K6AUsPlWXPyYeSfZhx+0os3gkQ7LrGybxd1vcUlWMnAgXY
 3dc3cAyJaUV1EWkDU+kZhrh1MwzsSS2UuXORwSjc3ZIpHqEbljfDSiz86AfnFiX3kjH0
 ahTMN1EIA+LLBmeeB0eeQXTd7okUS4vpA8qQuSrFXSn4qnD65SpfZ0LnmRXLtZyZ0fjX
 5m+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742271196; x=1742875996;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oW5RGZBsAsxOiN0J4s9yrYTbdtJ8eIVDFBUiSb/g7VQ=;
 b=MjMFpj6af698gbj55DIHdlWXAlcfqvNV9pJmYEeVCCsZseLp+p44WzRtQBKdY98dsi
 g2ZLAGD4bZdkV6LCUrQyDKGYARsk3l3wjsEjdy/KDxraHApJAGBHbMgygUusSeU2rT0V
 Yw7gzVNf/xf9myF3SJ/Oy3RJvroUBhV/glkgf8IukUXoDAEHutbfsRnKQMPU3ZBA5444
 C8IOt6RBPLbQn4vBZimZyXqQtzB9ZmqPZnTTfpXMA9AAMMg7JtZjkha43DoYZ9rh4zko
 lVWhzp2/J9/Lgtrj4JP5VJASM5pnT80FjRvD5HnVSd1zae9/DT20CxpvbtAR+qME8lXo
 5vEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVLWJolDTBFyDqowCR/LIZ5QQnKJyL0HEkY49Uec5QRlkhaAxRs4ZA0h2so77M5n+BeSNRyeUB7pw0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywo3SadIJYFadeeoECchXXp87queqg5Ehla32UwjIrR6m4sKCJ4
 YtIrZPZyu1ZqQ9YoX7OvWKecrjcJm35EhhJtS3yG8RyK9AuCXOzo
X-Gm-Gg: ASbGnctQnfhTnVCHEI0WX8NDlCvYBpuRBY2TDQVisOghaeNW0v7QM9hDgQoS6bf1jUz
 ea5cXODOwPucQPZB7AGREJxbFE9DzZXw/G6E+jL/8aLY5NsWk8LskR42h2/2uuoKL/T4Tjj2jD0
 NJh2jJvInzyE/Oq0HaPQjNYwOECWr84/+HgRwmYH7VbVIZa2VaqUyCJGTKjhqgrlmjGIOdTH7QB
 zx4V4W6BsXd3IprY0EvnjC/JeTe4WxsVTsBN8njoWiOAFa+wpZerkqzZFnlQXpqe1QzIwlVW3Yn
 xyJZNfwYbuEKwNq7vob/8+kMAGsLPckvlF9ngT0t1Q4W
X-Google-Smtp-Source: AGHT+IGPmpk4oIUqmS4CZZDYTqHSJT6W7E3MXJzNmcqtOfI14NXzO1fkk9NNspJ1OnJYLNP7FHPj0w==
X-Received: by 2002:a17:902:f70c:b0:21f:1348:10e6 with SMTP id
 d9443c01a7336-2262cad0236mr33092535ad.13.1742271195760; 
 Mon, 17 Mar 2025 21:13:15 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-226325521ffsm3417935ad.22.2025.03.17.21.13.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 21:13:14 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 1A8214235AE6; Tue, 18 Mar 2025 11:13:11 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] Documentation: vgaarbiter: Fix grammar
Date: Tue, 18 Mar 2025 11:12:50 +0700
Message-ID: <20250318041249.20786-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2476; i=bagasdotme@gmail.com;
 h=from:subject; bh=TMk7woRvm74Jgrml6gtFyOKWr5koYQjbV4e6YMnEz6c=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDOk3Pu1q73GafMVezkOvgkFb5gLHZJFa+RJj11sPv3afP
 Vs/M9C6o5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABNRYmX4nyqX6fXCjfPmbDZx
 YbnJTTYrZvUnzWKc8trv29+eyeei2xj+Cq/Qn3do3qf8l3xNrJ/zvus6vrm6ssAspnTj59/f/7G
 J8QMA
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

From: Pranav Tyagi <pranav.tyagi03@gmail.com>

Correct grammar issues:

- Fix "co-exist" subject-verb agreement
- Correct plural form of "server" in context of more than one legacy
  devices
- Use passive mood for intro sentence of libpciaccess section

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
Link: https://lore.kernel.org/r/20250220164946.18007-1-pranav.tyagi03@gmail.com
[Bagas: massage commit message]
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---

I have to carry the original patch [1] because DRM maintainers doesn't seem
to apply that AFAIK. Jon, would you like to apply this patch before the
merge window in case DRM people don't apply this either?

This patch is based on docs-next as gitlab.freedesktop.org is in migration
maintenance.

[1]: https://lore.kernel.org/linux-doc/20250220164946.18007-1-pranav.tyagi03@gmail.com/

 Documentation/gpu/vgaarbiter.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/gpu/vgaarbiter.rst b/Documentation/gpu/vgaarbiter.rst
index bde3c0afb0590f..d1e953712cc293 100644
--- a/Documentation/gpu/vgaarbiter.rst
+++ b/Documentation/gpu/vgaarbiter.rst
@@ -11,9 +11,9 @@ Section 7, Legacy Devices.
 
 The Resource Access Control (RAC) module inside the X server [0] existed for
 the legacy VGA arbitration task (besides other bus management tasks) when more
-than one legacy device co-exists on the same machine. But the problem happens
+than one legacy device co-exist on the same machine. But the problem happens
 when these devices are trying to be accessed by different userspace clients
-(e.g. two server in parallel). Their address assignments conflict. Moreover,
+(e.g. two servers in parallel). Their address assignments conflict. Moreover,
 ideally, being a userspace application, it is not the role of the X server to
 control bus resources. Therefore an arbitration scheme outside of the X server
 is needed to control the sharing of these resources. This document introduces
@@ -106,7 +106,7 @@ In-kernel interface
 libpciaccess
 ------------
 
-To use the vga arbiter char device it was implemented an API inside the
+To use the vga arbiter char device, an API was implemented inside the
 libpciaccess library. One field was added to struct pci_device (each device
 on the system)::
 

base-commit: 5b8f85d081da449ab35e4bd009d7c00afaab2fab
-- 
An old man doll... just what I always wanted! - Clara

