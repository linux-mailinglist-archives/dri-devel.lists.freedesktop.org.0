Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E2ABE03CF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 20:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60CAC10E8BA;
	Wed, 15 Oct 2025 18:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m8igxqMe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB3C10E3A2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 11:18:55 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-781997d195aso4640711b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 04:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760527135; x=1761131935; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W2vnTLcw57Y069vTGfiFWbSfImvEmfVAFfbmVAA9rgo=;
 b=m8igxqMenF9AwxUz2eb7luz6wFOazlecsh5MiskkgoSK8GXEfRAIDWtIX+Weu4VCs6
 bMlOZ3yHTijsjKGGZXaw2w9FFP7QJ74xzMpP3r9psXP25nFqI1rcytEud1Cb0GudIqc1
 RG0ErJ5RPI1h4tOLmVTj+HDDjNJZVGCh6xllHi8XH0T3dZkxDXHb5PVfHey0DciNqX2f
 6xYNgww+T/EiCWD4E5ojQ1/iNO1EtFWp5oMXfH7xZx34LeN55LEr2nJiKwbNQS1P3QGn
 Usc51jRknD2sP7cTgLGTZZJNFXamwTNX//5xRCw3BgP7dIcl3VSGE1rLcxpZ3dVnx5nf
 PAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760527135; x=1761131935;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W2vnTLcw57Y069vTGfiFWbSfImvEmfVAFfbmVAA9rgo=;
 b=bGOPlp2n0qe2+Q5qc/UQCqvNO3a5vQMGoAuik0SD5PdscJ3FLJ4JQZXxL8n7vhCDT3
 fDi7TDSn8C6naUOYznYBrsYrdxhMrE4FlYmsPpM3R+lwadnUYpnvZ33T8xq+tyOWS26u
 hH5qZxes8MksTP+FOUyhskw+O2PPC6SejYG44Mt8KL5yj7p2tYrfgHJ0kuNrzper28eY
 z5PqoXONzXmC7r1sjEn42Euy7iou7kGlpmkCDSsftvdSUogDYMCn4HULx0ADrJwh7v/L
 zQ1aRo5ZXZ4ri9KSTA7SmiXecg2KZ0HZdrx/DP0kp1dG0i8U8z3HkJIXM1DV7NVxV4Qy
 Mp9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQhwVJT90Lrv9oTufko2rjcD7Jr05tc20FxMouTet6r2Y6gOAipMo8kT3kVp/cdGbTpV205fA/SPQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxaA3b30TPehnegnV4cMwBfax/uC/9YX2wvLIVQsgQT0dQcINk
 6h8biXsOil1MxkSwlONqC8ZaItIFvXl9H6by0jd6gBgsnfrV+JWfxTaU
X-Gm-Gg: ASbGncvSkNUbNwtAOYSAVHGcBVWGMUj2v0TMTu3zgNv3cfRuLV3bxX+8CvZ0YmUGZWU
 hyPqR3nWyVFndKUxsBkEw3wbAzcSAH7luUX6lzWWS0Hb7R/C83nBeK/rqal2PPF9idTWM5D3ILE
 vpQsRJKMWY3z4HONEAPWCD0dGqPOctlJ5vlekx2PoYIUMHEaTrndzYNk/bA9xEZ/O26LK8ubWzJ
 7gwKytpH8zly0cUQ1rbFTEZR+hJL3aQCpJrvQkHsI+aCP+XSWppQocw8Vs94lGX49UJ/JM7jsTL
 Jgc+gcT135juyzRow4Dlp457H5pb9EYT0wH07i3h9DKYX+iXz8d92N2n2EHgA8DThI58euwBpx1
 /ZXKedgyNulEDTapLU3WrITO1MEXk6FSJ4cW3R8109TftaoeKxUyl5FdEbA==
X-Google-Smtp-Source: AGHT+IFxanje2UwITyO7JhKP4HwVngGwSfVPKTDvSZY8WDRIMIBK8NNPGmeF09cgQwzpalXD/vgd7A==
X-Received: by 2002:a05:6a00:4b01:b0:77f:1550:f3c9 with SMTP id
 d2e1a72fcca58-793859f34b3mr35946413b3a.12.1760527134951; 
 Wed, 15 Oct 2025 04:18:54 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992d09aa20sm18322631b3a.39.2025.10.15.04.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Oct 2025 04:18:54 -0700 (PDT)
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
Subject: [PATCH] drm/gpuvm: Fix kernel-doc warning for drm_gpuvm_map_req.map
Date: Wed, 15 Oct 2025 16:47:08 +0530
Message-ID: <20251015111828.18944-1-spyjetfayed@gmail.com>
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

The kernel-doc for struct drm_gpuvm_map_req.map was added as 'map_ops'
instead of 'map', leading to this warning during htmldocs build:

WARNING: include/drm/drm_gpuvm.h:1083 struct member 'map' not described in 'drm_gpuvm_map_req'

Fixes: 000a45dce7ad ("drm/gpuvm: Pass map arguments through a struct")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
---
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

