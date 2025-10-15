Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90864BE03D8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 20:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637AF10E8BE;
	Wed, 15 Oct 2025 18:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cjMg++TZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAC0710E82A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 15:26:11 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2907948c1d2so30199505ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 08:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760541971; x=1761146771; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7O0CpM0/C7Le3z3rkyQRvc1X6MxZb/suwRe01ONJGns=;
 b=cjMg++TZCSdD4iKSy60m6Jie5LXX0ghaSOsQGmdlVocTxXq0BU6SjQfXOETgA652lm
 ErxRoyh/ExjWKDVBHw63qIQZjwy0PPN8DAJzVL3ZZJXQShmRLXYnj+LaGEpH50Jmt0xd
 1G5HsHaOf+tGWWaU2l1ZpUfRD5SZKDPKHKLxvNzCs0bC3LAegaja/OXBD7y87LfJ1k4z
 l5t1l9Nebt6k2HxyD/iRXH70VbAa1AG/XOXjiMjR5lFI/H08HHDU3OOlUlbkF4FmYS9i
 jNLSFtTtSFqh0FZSe4Xk3EFYAxltyKowueu4MR12bxuIrFESwARqtO/0nSEti9GZKz/6
 YrMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760541971; x=1761146771;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7O0CpM0/C7Le3z3rkyQRvc1X6MxZb/suwRe01ONJGns=;
 b=WAE7aUH8RRd3RGUBtBXfWf250ke5+FZREfMo22B9rRkVPOvr2xE6By+zO9JgbVSdcy
 bHxapeWOJI5utbUEwlP/QR/7iRw7MRkY/4RV1OOoDE0k4AqEvSRWtUnCO23o1Lfi9CzL
 cKpUzn34wfKaEXKPUUzTHDXLU3gce7JWgNk88BiSsWB96cczVJobwaSYxugf1d76+0xo
 nNEWR4cRn9T8DVqjJWQMon80Re/32+jop/3uZt8alilNtNkUZf+HtT2Lbb3DKcjLcR2f
 iSwakEy+8ygWs6SDRDnBS9MBVyg++s3yKqNOWqlFqLAFPEeGYvZJPasHRBNdgKkA7hg3
 6IiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBur6bRsHIqs2aETuEKEmrR3qKCFB4g/IvACK5LInj84eFRJ9qSR/hKY86NT9/F6KPKwM9DjFSkcM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/HgpJobnKyUWuurNjq+BpR+GEc6tEeKmYfQolOEGbpFRRdcCO
 BaTV9F8hZAf8BLGd9unoyLXU6716S9t9GeKD/lsBVpqZTMvy9z4yu4xI
X-Gm-Gg: ASbGncutZLxw40dguPprh/b6ANIcodqq/itNyVMa4I4mz4WMxYkb9rpcrNHTUHebsot
 phsBxxaSR3vdLgc5JLH8RcFD98hhumdIOtvfG8cEbASI/vDadig/QocgA+Tk+xSwp+vpenucBxF
 R6TP5qcXaCAkuuDwNq+KG2gRmWrA5tCxSw9xIPw1yB8d19X9ZPUrQhHR/s6rxvXeyCey09iUn1y
 eqvmGFRj0CHnn6NyUeRaNmhqCT69CidlsrjXrWbqxnfhTSBPWItkn1LFoGHJ6WMC2vDCMzEc9Rf
 ffoOXlvtPcyHfIbddnK0qLFYQvxLYGqCUs0I500xQEKfcbIaaFEq5rosRN/wdMESZ9HuY9Jl0BL
 aWAGN8zf7rwT4LCLr9Lm4EoTF7Abe9EGf+MATW3Ww5qGefEU=
X-Google-Smtp-Source: AGHT+IHPNdtXsGrKiyWshln4Wfw606m9LZSh9VEYZ8OFWOsKMEwpo9QsS2xbGC5lMHJGNcWMCYwM8g==
X-Received: by 2002:a17:902:cf11:b0:269:7c21:f3f8 with SMTP id
 d9443c01a7336-290272b498fmr337396675ad.39.1760541970803; 
 Wed, 15 Oct 2025 08:26:10 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29034f05c2dsm200607325ad.73.2025.10.15.08.26.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 08:26:10 -0700 (PDT)
From: Ankan Biswas <spyjetfayed@gmail.com>
To: bbrezillon@kernel.org, himal.prasad.ghimiray@intel.com, dakr@kernel.org,
 matt.coster@imgtec.com, robin.clark@oss.qualcomm.com,
 matthew.brost@intel.com, aliceryhl@google.com,
 thomas.hellstrom@linux.intel.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch, skhan@linuxfoundation.org, khalid@kernel.org,
 david.hunter.linux@gmail.com, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Ankan Biswas <spyjetfayed@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v3] drm/gpuvm: Fix kernel-doc warning for drm_gpuvm_map_req.map
Date: Wed, 15 Oct 2025 20:50:57 +0530
Message-ID: <20251015152543.24368-1-spyjetfayed@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 15 Oct 2025 18:46:05 +0000
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

The kernel-doc for struct drm_gpuvm_map_req.map was added as '@op_map'
instead of '@map', leading to this warning during htmldocs build:

WARNING: include/drm/drm_gpuvm.h:1083 struct member 'map' not described in 'drm_gpuvm_map_req'

Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20250821133539.03aa298e@canb.auug.org.au/
Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
---
Changes in v3:
-  Addled Closes tag in log

Changes in v2:
- typos fixed 'map_ops' -> '@op_map', 'map' -> '@map'

 include/drm/drm_gpuvm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 8890ded1d907..476990e761f8 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -1078,7 +1078,7 @@ struct drm_gpuva_ops {
  */
 struct drm_gpuvm_map_req {
 	/**
-	 * @op_map: struct drm_gpuva_op_map
+	 * @map: struct drm_gpuva_op_map
 	 */
 	struct drm_gpuva_op_map map;
 };
-- 
2.51.0

