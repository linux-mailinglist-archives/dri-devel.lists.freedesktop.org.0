Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A72AC5BC8B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 08:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDEA510E22C;
	Fri, 14 Nov 2025 07:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Fy2Jv0eu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F14010E22C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 07:29:13 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-29568d93e87so15248895ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 23:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763105352; x=1763710152; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kzzNGkIPBNfCZbuB51lswR3YhvM1a2cVVjsR4F4kbrA=;
 b=Fy2Jv0euQtjOTGmMDsz3nqBzYDcLSP/U3KNJf2mFAHqius9Jr6h9FzXQN0fkcpxwgr
 Jm887YACVk4YhnO54cfVHmehQuts2D4YHX/GLUaT0JxKo1nx+SX28Q2B4l0mlnBiHcjY
 dXvwrIRziwxyKD5J63u/X+KEHJv3Q5gFyJMzptwv08yLoR2a7sgwprzb5Ac4hKH1ft1f
 kVwhs9NfmvWVciVEGdzsSLPxirWkS1iSr7jXhXGEdKdHxdYDgenCiaDOzod48xZc2rPi
 8dVaPfYzWhE1HakRea0DB64BxezsFA07IXebjm+Ww4uBo6WE8rRqOFjgcqQMkQvKUhyU
 B5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763105352; x=1763710152;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzzNGkIPBNfCZbuB51lswR3YhvM1a2cVVjsR4F4kbrA=;
 b=amznV+b/2Bof5oLHx11Knub6pWmCbPOrTmk2K3qkk/NCtHz+ycSUDctTmIgTwT+w5c
 +kPPR52J+h0Dps2ZRxiN97MOC+UBqMPpKXEoo8bIKdesyQEj+q1cfbdquPen7ahoDtEL
 Jq5HrdahW94j+GpAjar6Qs2jggT009kpj6R8Yftc93Z/2Rt+cSKDAXF4QiaJhfXoZOFT
 ra97ZWfqufCiZ3Y3n7mX77jSTH85Kq7WZM6DYTdoffq4QiFTcVPy+BTfnde5hBSCU2UD
 muNOYoAwTvYUo3YFliEJinR4Ngj2UtCz2PoyyCvmoJa19Hd55UaqhnDNXu6qm8vwaDUu
 C6+g==
X-Gm-Message-State: AOJu0Yx0wviE+NbGdw5qjvCAuBvHxguBSmfeu3j8Iv1EvMdzL3mzMGce
 PhFKOdiiaViRBh9tBDsJSCNdKPshJfbn37HWWdK4vuhm2ICtr36OIzcc
X-Gm-Gg: ASbGncsETKZHp2i36+F4pFFtG20K0jvhi8nSNq2ITs4yywtB4pqjc2FuF8L5k8pj46B
 1a6/xxBZQop5J3odiHhRHBCP1QGgbW0vHORLX81hEh16kE6UphAYbhL5/F6GzBcfXVa9Yonj2L6
 ZKaPXC63z+C4pCP09ja0YERBc401N0YZCstUFMGz57lCpnPRRJLDAdVJNbEV4ADsSCwk4xiJ0sk
 AOaoyjbRINyb/HtJpvat7AizK4AcgZ/83L/gKxyeF/Kd7tYhaNTb0V5lB7BNCUEcdMc0YbHJe/l
 hdSi8Lr790YWZSn/Fk+CHxoaknDCMcyRWgFKs6So9e3HLURxyw7uVRhWLc2t/bXNF3HPbvJLpOB
 94soX8qdMU1xSeW2QvOnyOD63bS8ukMXvozVRuqfc0CutPtp17/LTJLoLp3j/wOkhiERQLgAeRD
 ZN2B/5L3YwFJChLAmc
X-Google-Smtp-Source: AGHT+IHYUBvTtoYS8sMrf21V5+MzRAdhbnqo/4Ug5U8lMT+BusTgSByArlp3FyuPqd8z0ruHdvfx3A==
X-Received: by 2002:a17:903:41c7:b0:298:1013:9d11 with SMTP id
 d9443c01a7336-2986a75288bmr22560545ad.43.1763105352368; 
 Thu, 13 Nov 2025 23:29:12 -0800 (PST)
Received: from crl-3.node2.local ([125.63.65.162])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2ccbb7sm45578875ad.107.2025.11.13.23.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 23:29:11 -0800 (PST)
From: Kriish Sharma <kriish.sharma2006@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkp@intel.com, Kriish Sharma <kriish.sharma2006@gmail.com>
Subject: [PATCH] drm: Fix missing kernel-doc parameter descriptions in
 drm_gem_shmem_init()
Date: Fri, 14 Nov 2025 07:27:29 +0000
Message-Id: <20251114072729.2604822-1-kriish.sharma2006@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The kernel test robot reported missing parameter documentation in
drm_gem_shmem_init(), triggering warnings during documentation builds:

WARNING: ./drivers/gpu/drm/drm_gem_shmem_helper.c:104 function parameter 'shmem' not described in 'drm_gem_shmem_init'
WARNING: ./drivers/gpu/drm/drm_gem_shmem_helper.c:104 function parameter 'size' not described in 'drm_gem_shmem_init'

Add missing @shmem and @size descriptions to fix the kernel-doc issues
and ensure the documentation is complete

Fixes: e3f4bdaf2c5b ("drm/gem/shmem: Extract drm_gem_shmem_init() from drm_gem_shmem_create()")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202508040518.ZISc9nPg-lkp@intel.com
Signed-off-by: Kriish Sharma <kriish.sharma2006@gmail.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index dc94a27710e5..1d1e8add99c9 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -96,7 +96,8 @@ static int __drm_gem_shmem_init(struct drm_device *dev, struct drm_gem_shmem_obj
 /**
  * drm_gem_shmem_init - Initialize an allocated object.
  * @dev: DRM device
- * @obj: The allocated shmem GEM object.
+ * @shmem: shmem GEM object
+ * @size: Size of the object to initialize
  *
  * Returns:
  * 0 on success, or a negative error code on failure.
-- 
2.34.1

