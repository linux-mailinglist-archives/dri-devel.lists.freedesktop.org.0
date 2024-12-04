Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 249FE9E3F95
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 17:27:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D76D10E4F5;
	Wed,  4 Dec 2024 16:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="G26Cl7I6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8066C10E4F5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 16:27:02 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-434a9f9a225so60225e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 08:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1733329621; x=1733934421;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G9G1+IA4HE6z5Jl984QuG0eTi6gYVIS+JAIiJpGUT64=;
 b=G26Cl7I6u11qdJ22A0ssOZJM2kJIb+FzIBv8JdtkpJ8Oywk73TmKuSUgfypbsUSKiy
 BQcm3ayzCKxzItiyzmujxd3blbm2mJS/gxrQ6tgUoI+oDEA4r5aifGyeY2AvJHCzCLPi
 1FPQU3W/XAmYRllUJdAcHhph7nLKOXJXwcy5kD5djfgutHxvx66frgTLxGFfH0nOikWb
 Hp9iH9h6B4GAkRps63F++fCNk8WMOX864czuBWOsa0l/gonbQmISGpTpG+fRfFp2DcMO
 mBxhhltWRuywuJ+GXNDQ2Ee6VPUlcTp6Q78B9HXSkAtROYx1l13foseT8/xGTrjcxJuJ
 pgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733329621; x=1733934421;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G9G1+IA4HE6z5Jl984QuG0eTi6gYVIS+JAIiJpGUT64=;
 b=Ejj7j2g5qaWamEt+NCQEJWZuaHPWoWUfU/nZUolW0qbXFbllkr8qsOOn6hlhusBwBn
 xs0udFDWah+y0T1E4B3ECdjyzXpa0J2/8bqaI39xDchCiXDw64kct5Q3PJ8/K5mjaQfi
 R3zHqDp0B1BjQt8aO+LFuCfzJF9o8oKf2KKLyez0bIj8CL0dPDqhk4HZbtSFd8kZs/sl
 +csuzP35A9EXbyJKjGSkW0gk4OG7bw6lA44k5HJzWCKpqPHD3VCGhy8UXo3SqM3mnE9b
 sqBoUExhtg5XJuyi/haxZ2Jo+algSsLyVa6E6qxT6HzTu93xKzx+AvxwaCJVs8rOAxrM
 jkoA==
X-Gm-Message-State: AOJu0YwnSzBSqdGrTaODxSmAvuZrmCQ0kUzBEerlZwViSKTIpR3Zh5IA
 GsJRU6TKKtal6XgCo3F+DXxqVjr5KOqugtC2IPIV52FHwb7GvUQI4DjR1WK+kQ==
X-Gm-Gg: ASbGncuwHUMUItLuRqSdELnxj8MnkqLA2wN7QVyV+PpDAETrSjVa9OflMVB3Z+rtdiz
 DjZEjNM2a7pGFy+MH0nDPU6J1HbNlEM4ApNtXI6FMQD/Po//xaf5OBd01QgmuyoAxgE+iK2EyKP
 GI60HcyP+zuIEj/JlfG1WVK6eXGZcJGvBbjKvSb8gnUA8ukl4by1zsp07Mqx8LRqEkJKaA22KMw
 si7Deo6CJwrDpxD8BXnj1oycPBP6ubKd57Bog==
X-Google-Smtp-Source: AGHT+IG9U1RkmAjCsaZkbHJvJ5nu4yp+BcYJp90LiOTeDBKduQ1hWfRCwdTnNEzAhSGitcQ4jLpnsQ==
X-Received: by 2002:a05:600c:138c:b0:434:9d76:5031 with SMTP id
 5b1f17b1804b1-434d52a1a87mr1200475e9.1.1733329620387; 
 Wed, 04 Dec 2024 08:27:00 -0800 (PST)
Received: from localhost ([2a00:79e0:9d:4:4606:5fa1:8ade:6950])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385dd99504csm16808066f8f.85.2024.12.04.08.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 08:26:59 -0800 (PST)
From: Jann Horn <jannh@google.com>
Date: Wed, 04 Dec 2024 17:26:19 +0100
Subject: [PATCH v2 1/3] udmabuf: fix racy memfd sealing check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-udmabuf-fixes-v2-1-23887289de1c@google.com>
References: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
In-Reply-To: <20241204-udmabuf-fixes-v2-0-23887289de1c@google.com>
To: Gerd Hoffmann <kraxel@redhat.com>, 
 Vivek Kasireddy <vivek.kasireddy@intel.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>, John Stultz <jstultz@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Jann Horn <jannh@google.com>, Julian Orth <ju.orth@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733329589; l=1788;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=Tb4zTg8gwUbDaogCnGrqjqwGKOpD1jahUvTB+lbqtzQ=;
 b=x0rM9Iqs4R9cqZm4OwMo3VWit21K6SeS2leyIeQreRfqXoZoMTJdgc0TRz3BeylxDekXItOM6
 v3yPm+oXfdYAGerYEcgb+A8uMYKhMtEJ8Hr0uOzDDVLWGCHtKOz9Wou
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=
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

The current check_memfd_seals() is racy: Since we first do
check_memfd_seals() and then udmabuf_pin_folios() without holding any
relevant lock across both, F_SEAL_WRITE can be set in between.
This is problematic because we can end up holding pins to pages in a
write-sealed memfd.

Fix it using the inode lock, that's probably the easiest way.
In the future, we might want to consider moving this logic into memfd,
especially if anyone else wants to use memfd_pin_folios().

Reported-by: Julian Orth <ju.orth@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219106
Closes: https://lore.kernel.org/r/CAG48ez0w8HrFEZtJkfmkVKFDhE5aP7nz=obrimeTgpD+StkV9w@mail.gmail.com
Fixes: fbb0de795078 ("Add udmabuf misc device")
Cc: stable@vger.kernel.org
Signed-off-by: Jann Horn <jannh@google.com>
---
 drivers/dma-buf/udmabuf.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 8ce1f074c2d32a0a9f59ff7184359e37d56548c6..c1d8c2766d6d36fc5fe1b3d73057f6e01ec6678f 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -436,14 +436,19 @@ static long udmabuf_create(struct miscdevice *device,
 			goto err;
 		}
 
+		/*
+		 * Take the inode lock to protect against concurrent
+		 * memfd_add_seals(), which takes this lock in write mode.
+		 */
+		inode_lock_shared(file_inode(memfd));
 		ret = check_memfd_seals(memfd);
-		if (ret < 0) {
-			fput(memfd);
-			goto err;
-		}
+		if (ret)
+			goto out_unlock;
 
 		ret = udmabuf_pin_folios(ubuf, memfd, list[i].offset,
 					 list[i].size, folios);
+out_unlock:
+		inode_unlock_shared(file_inode(memfd));
 		fput(memfd);
 		if (ret)
 			goto err;

-- 
2.47.0.338.g60cca15819-goog

