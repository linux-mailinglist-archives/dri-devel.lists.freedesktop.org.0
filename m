Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C812FAA69A1
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 06:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D9910E8AC;
	Fri,  2 May 2025 04:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dqNQZKB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F181610E8A9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 04:05:37 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-22423adf751so18593895ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 May 2025 21:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746158737; x=1746763537; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GNk2zZpC65xRherJZoi8fazJtKf8aShkVrAnPTjrn2Y=;
 b=dqNQZKB1QZXExGY99/hzw5T/dfua+fgX3FqShz2SMUF53kkGAdAb+Ski/riBmwx06L
 z9DyCRsNwytGEu4Q4ioSusCXgHsZ8Nqks5U/6Z67tdz5EXge5ZbYUzWbe7XczuW3ON52
 pB4aihJ5wyHudfW5pQoSw880QGUx/pvDzLWdeOMcyX4GKMUbRXz6CzU3wWT9HZ4WBKJL
 UIQbEY8yo8/bTyvt87NxGF2zDU67eoinAiBJQthhb1e+GD6PvOVkJdrAzXQ9+lLWOuSw
 wrXksCuCYzi2a5+VQ31tJOmzz1Kam5R3MukCZKQ5FWMmCxomx5bzEuk26JVnAq+2vbJR
 XYDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746158737; x=1746763537;
 h=content-transfer-encoding:mime-version:reply-to:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GNk2zZpC65xRherJZoi8fazJtKf8aShkVrAnPTjrn2Y=;
 b=hScv0sw7+0Z5iqSSR5Xnm+RcFhZYfLZCI/VMqwYNYJOYgnMP97IXMfx/+/eDIlpFrd
 nftQMiHgNct8lwShMKLYCxv5QeT5bfZj37K8j2tzatxWehxFPc11uBm0/EIzAmJnAmXc
 PDsomEM4Db0uKILqJK1Arna6rXg7qDWsCHPEvVLoJfWTVjZSUdviJGOpFZHO3Ze7S6IB
 5ZQ34cbuOZYmPosyQgxMNlKiTvekpfjGx/as/8SaUbt7BMJy7hmMW0Mh0rt2jP5DVaXz
 H+kHK+ZhOsiLXAGJFejHRrdyWZQRG0IycR30M7sN2K+epPeFuT/RPNx4f3bLCQ5nJFPY
 v4Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsot8XKgGWkPO92o+fsAWQybGwhyFesrAP7xSBSn8MytjaWLqZy9KxC6sYR+Tc83J0jW+7jVMpges=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy93E3uHh7EGz+vRDqW8BAP5H5rqa8bnDH57b6ZmoeSQlQgGBAb
 96T+oLMGyZSOxi/U8ixsGwQQNas+saC3Sfs2TR9z3I/RZhmJqO1n
X-Gm-Gg: ASbGncuzBj3kWRyBYHx/IE1pvJTDlsiP0p58k3yRfgfHpPajbdH4QKOeN0sayNzpD3w
 rc7RrWcodrBSXmYBH2g1Ui+ao9r6c7n6k2EXGoaCEpYZE0MZ7VE/sfPmgsHMMghLzN+WwiwCAZc
 6LwMbTRLilNOAjr5F2MhBWTWwMNa+hqIkc4EqQWJ1In3HZbMu95aEGi6wB2Bl/WylMohQD/3RPH
 WqQJVuNem7y3uvOP+lMAFfa5i29FdDSbvnZMGSbBouUYkahDrGP9GN07IPlRo7XvVKRGYlqd5n3
 tsMMpNmijaOm6BuLDKNIs1t9V4F+v2I4WJtbj84VHzM6P/aYYRxXaC3mTN3eyQp0TCJtaEehUHv
 9wlcqpl791pKdyaCV1qY=
X-Google-Smtp-Source: AGHT+IHj4Tzm6nKdcO1N5Fay8la+VC6hlU5iu6zD3k8sB96/zhwVRurosFkLDRNOZP+yc+Pg/6Qmxg==
X-Received: by 2002:a17:902:da90:b0:224:c47:cbd with SMTP id
 d9443c01a7336-22e102363f5mr23127825ad.0.1746158737314; 
 Thu, 01 May 2025 21:05:37 -0700 (PDT)
Received: from localhost.localdomain (c-67-160-120-253.hsd1.wa.comcast.net.
 [67.160.120.253]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e108fb836sm4510635ad.141.2025.05.01.21.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 May 2025 21:05:36 -0700 (PDT)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: simona@ffwll.ch, deller@gmx.de, haiyangz@microsoft.com, kys@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, akpm@linux-foundation.org
Cc: weh@microsoft.com, tzimmermann@suse.de, hch@lst.de,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH v2 3/3] fbdev: hyperv_fb: Fix mmap of framebuffers allocated
 using alloc_pages()
Date: Thu,  1 May 2025 21:05:25 -0700
Message-Id: <20250502040525.822075-4-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250502040525.822075-1-mhklinux@outlook.com>
References: <20250502040525.822075-1-mhklinux@outlook.com>
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
Reply-To: mhklinux@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Kelley <mhklinux@outlook.com>

Framebuffer memory allocated using alloc_pages() was added to hyperv_fb in
commit 3a6fb6c4255c ("video: hyperv: hyperv_fb: Use physical memory for fb
on HyperV Gen 1 VMs.") in kernel version 5.6. But mmap'ing such
framebuffers into user space has never worked due to limitations in the
kind of memory that fbdev deferred I/O works with. As a result of the
limitation, hyperv_fb's usage results in memory free lists becoming corrupt
and Linux eventually panics.

With support for framebuffers allocated using alloc_pages() recently added
to fbdev deferred I/O, fix the problem by setting the flag telling fbdev
deferred I/O to use the new support.

Fixes: 3a6fb6c4255c ("video: hyperv: hyperv_fb: Use physical memory for fb on HyperV Gen 1 VMs.")
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/video/fbdev/hyperv_fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index 75338ffc703f..1698221f857e 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1020,6 +1020,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 			info->fix.smem_len = screen_fb_size;
 			info->screen_base = par->mmio_vp;
 			info->screen_size = screen_fb_size;
+			info->flags |= FBINFO_KMEMFB;
 
 			par->need_docopy = false;
 			goto getmem_done;
-- 
2.25.1

