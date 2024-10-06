Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AC8991D8F
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 11:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDEA10E10B;
	Sun,  6 Oct 2024 09:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ikI8Z7cT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAA510E035
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 07:15:57 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2e0a950e2f2so2898969a91.2
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 00:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728198957; x=1728803757; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EY5p4xlsAqQOcxvqm9u7nE7mDZrPMRJXe9re+U3pcIg=;
 b=ikI8Z7cTPygpoYSmREB4M6vw9T7w4SSMU4GhU0etXTRYHfBmtWLO5jyyLo1jWJ2wFz
 CU2hz1KSj4e/z8mMmdgqSoaD0Aq68zj+0uRyFrypPxRK6PmMSXK+mASMEE3P4Bv6qkxC
 GFRbFnp8u2Z+/XkLzEFdkn5+AGXcvluGPVxWKhhdel+VqC3rNaXlY88m+m9sZq+c9N+Y
 rBmEtbujPltgmmkDNHxtSmYFMFLybd6b2L/0SUldlcgaaGy5pHmov3HFeDsR2maCPWhO
 EdmRZefmFdjuBJnGsTYZMQpMjziR+rV1xJm5Crcto4Lgf0XBODP6Xc8wQwVJk0Ort6dZ
 IR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728198957; x=1728803757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EY5p4xlsAqQOcxvqm9u7nE7mDZrPMRJXe9re+U3pcIg=;
 b=XRSCxCPeKnUH+mWShPOa3NE9PWxpW25ReZ0QHUQYfwA5I3GXKrmbTHaYJRpbov+pc4
 e3NOGGyosQMpY3OjOr1S+Xe2vRKx9aTY6BNX6qIbPuxL/HFlknkTtieeJegqsHze/cm4
 ZZdO8BdVkjSGP5fy4HD6+SahdMwvYLmO7dhkrGqt1vLPAYexKHiAABCNyJ+5tIo9uGRV
 shsN/+laY9QmC3EnWM3bYF4EvkiwpqG7uYBLlsBWYLUpVwpguWhUMpxwIdM3V5zjjNAZ
 qDViIjDRzy5i6HXsZucY6pwRd2xa1tfVq2OBmrJ/BKkotQfg0/uFEbEFANf5ubuDkyf6
 UVKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0gJ5dv+EUVIu4njemSwBoC2ZPw2h6x8mbbB14ydLjm6diYSTIzJaGTzmKbnN6z4DwfZyNg/r1G3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmhP0u1e6m9p0bpT5P4te4CtGxmr/8rsBxOJHg8988/5kXzvdo
 q/lePlcHuQIDudOA+f6QXiIRaGHf/nZBArNGMZfM/RnA8NtbR/k0
X-Google-Smtp-Source: AGHT+IHfxiCQnGgXw6gWSyy7mb50GfJveRtEjxaOuoIhvi/t6X26Ke+95wPLjiBS3eg+nZBeW/KzDA==
X-Received: by 2002:a17:90b:b0c:b0:2e0:99bc:6907 with SMTP id
 98e67ed59e1d1-2e1e6229e93mr9356389a91.15.1728198956928; 
 Sun, 06 Oct 2024 00:15:56 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.lan
 ([2409:40c0:230:2966:8a2:4c2e:bb52:a9af])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e20aeb7db0sm2943600a91.15.2024.10.06.00.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 00:15:55 -0700 (PDT)
From: SurajSonawane2415 <surajsonawane0215@gmail.com>
To: adaplas@gmail.com,
	deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 SurajSonawane2415 <surajsonawane0215@gmail.com>
Subject: [PATCH] video: fix inconsistent indentation warning
Date: Sun,  6 Oct 2024 12:45:14 +0530
Message-Id: <20241006071514.5577-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 06 Oct 2024 09:55:26 +0000
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

Fix the indentation to ensure consistent code style and improve
readability, and to fix this warning:
drivers/video/fbdev/nvidia/nv_hw.c:1512 NVLoadStateExt() warn:
inconsistent indenting

Signed-off-by: SurajSonawane2415 <surajsonawane0215@gmail.com>
---
 drivers/video/fbdev/nvidia/nv_hw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/nvidia/nv_hw.c b/drivers/video/fbdev/nvidia/nv_hw.c
index 9b0a324bb..75afaa07e 100644
--- a/drivers/video/fbdev/nvidia/nv_hw.c
+++ b/drivers/video/fbdev/nvidia/nv_hw.c
@@ -1509,10 +1509,10 @@ void NVLoadStateExt(struct nvidia_par *par, RIVA_HW_STATE * state)
 	NV_WR32(par->PFIFO, 0x0495 * 4, 0x00000001);
 	NV_WR32(par->PFIFO, 0x0140 * 4, 0x00000001);
 
-    if (!state) {
-	    par->CurrentState = NULL;
-	    return;
-    }
+	if (!state) {
+		par->CurrentState = NULL;
+		return;
+	}
 
 	if (par->Architecture >= NV_ARCH_10) {
 		if (par->twoHeads) {
-- 
2.34.1

