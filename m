Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AADCABB28D4
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 07:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0365210E77C;
	Thu,  2 Oct 2025 05:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k++W77yA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E188110E028
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Oct 2025 02:57:43 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-782e93932ffso590314b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Oct 2025 19:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759373863; x=1759978663; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J82Z56xOWTI27M4LZYheLiy5OIEEBunWj+Vbpah8nWE=;
 b=k++W77yAOjLXe59lLWLPJQaVgnHItem3CKwF+kLMLGJe9AMttpnW80G1QebQCgTBhQ
 fM8jYpuVveN8oLUJzKOF4MhL3oKI8ZVSyBdWt9iXNlI9FtfQ7B+i/vvEFxajKq2i63fB
 iSjyT0PeSIKk1iVkZ2zcF7jUjhr0SJyZJEltx3Mpl46xBvy2ZN3Cydokv7DFxUDs8Keg
 dOvvBIJ/YM0kVQPOk9yZN4TZsTQ6FnvUwTFQn4+uEoxdyMhx/8Mey3EJSurF18+R7qDA
 Ci7PeGonL50KkeJgLIT8Bqjg2AhvQfhYre0Wqy+Wp3s4hw4hWNDeL1ib2YDoTC4W8R/T
 eI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759373863; x=1759978663;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J82Z56xOWTI27M4LZYheLiy5OIEEBunWj+Vbpah8nWE=;
 b=u3koqleTo2XfqKu8u0qrvHl8hSYbfh8J2aB4MZVJX94a8U1397Vj6ZHqI7V0QT+maF
 VOV78t6r8GFC+dDMeTNADtG4thTxJPD3ovR/tJ9bFiuy2ZnhtLZ9fbeNXvWkTkTHC84n
 F0s+d5cRMd+7uSGjPBmT5EoS3Z9qL/iZSq0dLpvvI8AnDmYKLb8dQEPDLXikUJTvV813
 kFE2IMicQFlfaByGgdzNHhI1EFz4HLAjlNNdUG1Fi0CGR6HJScIHuvBfdCC+MXj+0b8r
 VGsRrKKUEI9yx25BJedO8lYrssLbK8jV2IAD/q2nG0CLt5hz547064CZXzUCg8iyKHHp
 XqQw==
X-Gm-Message-State: AOJu0Yxvm5PDk8w8yEyORHBeXPISRRRn0jeGBNcQsK3pvkk8PyVqgsLZ
 RJl+eBp5wxfIwtKTtrgD77ROqCGonQe+FAJTJZB4tk811xEVpUOe6ckn
X-Gm-Gg: ASbGncup2/2WCmpb4k60Og0ay6TkErhpXHN6I9ITkzg9ht3Zxw8aMGYrTYUwpLxVqSc
 MH/8KhzAb0yDfbIPwXJFsyJKWvOo4KelGgdkF6Ug04T6HZIjbInW9+nZaJ00SLev2TPRLxxcvKH
 KaCoIZsjGFW9YDc9bgiT2r7qCprQ6udhILqR56p8gk8Ze4fBGtmgHMWSMKaXwvA03aWW1S82DJ7
 oR/yfalw9E7vRr3zx1IwFy2NkcvIkeiuqUloBbJEVpFrCh2/XOvqsSUqXcjmdRdrJnj6E5mQ/2Z
 PUH6XG2+PNl80xn834RJ/+wkkmROiNPzSKFpBlSd9N+tnCTGekOPM1GSm03YIghJiiUgOSYfcew
 K7y4tVCF4M6MqUDpP4hTxDKBmA5fWKHBcPoFB3HqqfPqPhFATEYc57qJYoBz24L4gVvnD8lFhvt
 wrlA==
X-Google-Smtp-Source: AGHT+IELr6NndrKlAnm5EF8uU1znjKk+zekuloU2u1bUXPL0pBVBvgbb8LT9E38aM9+bGWXS6JGmgw==
X-Received: by 2002:a05:6a21:32aa:b0:2cb:5f15:ebf3 with SMTP id
 adf61e73a8af0-321e7e3f5dcmr7711795637.44.1759373863298; 
 Wed, 01 Oct 2025 19:57:43 -0700 (PDT)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:2327:e4d:63c9:c38d])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b6099f73537sm849839a12.43.2025.10.01.19.57.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 19:57:42 -0700 (PDT)
From: Chintan Patel <chintanlike@gmail.com>
To: maarten.lankhorst@linux.intel.com, maxime.ripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com,
 Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v2] drm/vblank: downgrade vblank wait timeout from WARN to
 debug
Date: Wed,  1 Oct 2025 19:57:23 -0700
Message-ID: <20251002025723.9430-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Oct 2025 05:43:07 +0000
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

When wait_event_timeout() in drm_wait_one_vblank() times out, the
current WARN can cause unnecessary kernel panics in environments
with panic_on_warn set (e.g. CI, fuzzing). These timeouts can happen
under scheduler pressure or from invalid userspace calls, so they are
not always a kernel bug.

Replace the WARN with drm_dbg_kms() messages that provide useful
context (last and current vblank counters) without crashing the
system. Developers can still enable drm.debug to diagnose genuine
problems.

Reported-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=147ba789658184f0ce04
Tested-by: syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com

Signed-off-by: Chintan Patel <chintanlike@gmail.com>

v2:
 - Drop unnecessary in-code comment (suggested by Thomas Zimmermann)
 - Remove else branch, only log timeout case
---
 drivers/gpu/drm/drm_vblank.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 46f59883183d..a94570668cba 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1289,7 +1289,7 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 {
 	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
 	int ret;
-	u64 last;
+	u64 last, curr;
 
 	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
 		return;
@@ -1305,7 +1305,12 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 				 last != drm_vblank_count(dev, pipe),
 				 msecs_to_jiffies(100));
 
-	drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
+	curr = drm_vblank_count(dev, pipe);
+
+	if (ret == 0) {
+		drm_dbg_kms(dev, "WAIT_VBLANK: timeout crtc=%d, last=%llu, curr=%llu\n",
+			pipe, last, curr);
+	}
 
 	drm_vblank_put(dev, pipe);
 }
-- 
2.43.0

