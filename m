Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED1EB87827
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 02:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC28B10E912;
	Fri, 19 Sep 2025 00:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KaIjp/fO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A33110E912
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 00:37:06 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-26685d63201so15161805ad.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 17:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758242226; x=1758847026; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F0dTovYaKB4gfJ0CY/rrU0WVNio86cuPsjO5eFpelmI=;
 b=KaIjp/fOr+6fwnSxPKMql0I2pB4P7BujpE2pDcd2ffGaOecYbs6SgkPEflo73A4lJP
 vuQ0inh08plgWJ2CLGczBcLOTvQBcXoqZtsabQT2NH5fWs5WrmjujFXv7QP8S2UCb96l
 ysUtsfsiLtK0MUhQSo2PRzWWNhTE7NC80E57Q0ms3MmzdRkm4L+HeOuQKIip4lITQOYu
 wEhZYRV1CRht5LrhE4cpeB1E2U+DPg7T/UQdvR2ijApm3H+kCdJ++pOaT9XAf6/vSxua
 xhYkWlzfeL/0H/hmySXDCj3/LL10F5NYpOpR//S/f8gEHUJrx16No/PHf2yWRbP1sZ6r
 ut7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758242226; x=1758847026;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F0dTovYaKB4gfJ0CY/rrU0WVNio86cuPsjO5eFpelmI=;
 b=BSQs5cUPhlGZNqUfrFM3b7qTNdpsGn2HrKQAcjz9xyrTIQw+zCq214pdLuPbuu1Ymu
 zdYY9WOf+eRHfJBOnZt5IxB8HR0u5jWRCb7PauEB77OiyDR5sr5EmAxqTNwXQlwhjt3z
 XzX77IpQfMN/b+4sgQX2hRsgJKj2ulrGLAgTuw8YWAAb61c6FYGsVzRQP8qsIZCM6lzU
 OQKWPQ4jKHiIMPyWS2Uz76XnEapYiwRAfm9Nsd5QNP1KesIqbNJi65X1YUoOKxSXX3Jw
 CFYFxXWzztu5CvqYxEbSkqlrwimJl1NljvdE+NNTFKNZ7gk1LsoTXYavSGGSVpgxajWW
 lWfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwRJeijI8nqcW7U1gYKMnm0a+mpw89THRm/zbHYcxF4vouZKG6tjPUcL9x6QnoKM13obGuEOMdFDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIhFzjB/p05lfLWD8rnbk2NEUn6vxgoeCQ0xcg4iSDTtjeEX48
 /0RfkCuC5RCrtXwJQ5XfM/v7MgzrHkuPF2lG4tXMdJz743Z9vjnqSpjz
X-Gm-Gg: ASbGncvNPwbsQoool+l6+feL8xqyFH5KEjv6UdJKrGVKJKl2OVpX4dLDYt10R/GboMw
 B6CCe6HGfcB081SMjJiXf96eOC+YRqlyemMLLeJXquDIWz1/eumCDPyp6/xd8cBCNYFGc5EGQP+
 /hvuOisGxYpdkzJYWCpsJcjAlHXQLoPBDzynrGPWWpF6A+jGc/NDBpAnvt8WuruCgHlxBum0pCy
 J9Vue+ObI2N3DP5kMxAfGnsTVQ+tb8c5kb2IujgXX421cB3WYdogUTe3o/UV/sumaqVo/T2KOAK
 u/f47DzLg2hfyFEiirAsgWzYD9X5bnMQl9WvDF6/3Nm6Xdve76H50W70MVI4vaoi3Ah71PGc8Le
 R0cTZSDw3xPFW4tU7EA7HBg==
X-Google-Smtp-Source: AGHT+IEi681zBzTSG9Ssyj4xkWOW3OUSPbm/eC1b/ybWYhB5MYLrxE49bm1sZeX5rT7wDfvU6s02qg==
X-Received: by 2002:a17:903:1a27:b0:264:70e9:dcb1 with SMTP id
 d9443c01a7336-269ba5464c0mr18768295ad.56.1758242225932; 
 Thu, 18 Sep 2025 17:37:05 -0700 (PDT)
Received: from archie.me ([103.124.138.155]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32eaa46da99sm4203712a91.1.2025.09.18.17.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 17:37:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
 id 64A8D4227239; Fri, 19 Sep 2025 07:37:00 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Framebuffer <linux-fbdev@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Helge Deller <deller@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Teddy Wang <teddy.wang@siliconmotion.com>,
 Bernie Thompson <bernie@plugable.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arvind Sankar <nivedita@alum.mit.edu>
Subject: [PATCH 3/3] Documentation: fb: Split toctree
Date: Fri, 19 Sep 2025 07:36:40 +0700
Message-ID: <20250919003640.14867-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250919003640.14867-1-bagasdotme@gmail.com>
References: <20250919003640.14867-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1785; i=bagasdotme@gmail.com;
 h=from:subject; bh=G2Hu4yMRkujPDb60hG3BM8GKc4qdmUGfbLLUukXTBW8=;
 b=owGbwMvMwCX2bWenZ2ig32LG02pJDBlnlrSr3Zj+wsvph7LOdPl4pzZmxqII9c1r8pdlhSvbH
 akoj3DvKGVhEONikBVTZJmUyNd0epeRyIX2tY4wc1iZQIYwcHEKwESK3BgZGvYccrr55/DPTTMC
 FyRdqDO54N+3dn0HX/7cwzsu/mPklmb4H32l8YTDnhfPQubOiPBesWBT9v6n/psdXoaI/eL/X8e
 kxQ4A
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

Framebuffer docs toctree consists of driver-independent docs
(e.g. API docs) and driver-specific docs. The latter has much
more entries.

Group the docs into separate toctrees.

Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/fb/index.rst | 80 +++++++++++++++++++++-----------------
 1 file changed, 45 insertions(+), 35 deletions(-)

diff --git a/Documentation/fb/index.rst b/Documentation/fb/index.rst
index 33e3c49f885695..e2f7488b6e2e42 100644
--- a/Documentation/fb/index.rst
+++ b/Documentation/fb/index.rst
@@ -4,42 +4,52 @@
 Frame Buffer
 ============
 
-.. toctree::
-    :maxdepth: 1
+General information
+===================
 
-    api
-    arkfb
-    aty128fb
-    cirrusfb
-    cmap_xfbdev
-    deferred_io
-    efifb
-    ep93xx-fb
-    fbcon
-    framebuffer
-    gxfb
-    intel810
-    internals
-    lxfb
-    matroxfb
-    metronomefb
-    modedb
-    pvr2fb
-    pxafb
-    s3fb
-    sa1100fb
-    sh7760fb
-    sisfb
-    sm501
-    sm712fb
-    sstfb
-    tgafb
-    tridentfb
-    udlfb
-    uvesafb
-    vesafb
-    viafb
-    vt8623fb
+.. toctree::
+   :maxdepth: 1
+
+   api
+   cmap_xfbdev
+   deferred_io
+   fbcon
+   framebuffer
+   internals
+   modedb
+
+Driver documentation
+====================
+
+.. toctree::
+   :maxdepth: 1
+
+   arkfb
+   aty128fb
+   cirrusfb
+   efifb
+   ep93xx-fb
+   gxfb
+   intel810
+   lxfb
+   matroxfb
+   metronomefb
+   pvr2fb
+   pxafb
+   s3fb
+   sa1100fb
+   sh7760fb
+   sisfb
+   sm501
+   sm712fb
+   sstfb
+   tgafb
+   tridentfb
+   udlfb
+   uvesafb
+   vesafb
+   viafb
+   vt8623fb
 
 .. only::  subproject and html
 
-- 
An old man doll... just what I always wanted! - Clara

