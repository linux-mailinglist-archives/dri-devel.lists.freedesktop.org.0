Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FC6BB28C2
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 07:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85A910E76C;
	Thu,  2 Oct 2025 05:43:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dv3SGk/Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4824710E02B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 03:32:56 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-27a6c3f482dso52868515ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 20:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759289576; x=1759894376; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+zmtX/z0UVEmGLTI9JLK1Wpr0yiIFaGTMqhMoT9rSZ4=;
 b=Dv3SGk/Z/P6ZpXL+9Lp3HRgrUH/3TT5ta80xeJQ5x3ih9XDA8MXvBV/d8ImFVUT/oS
 KQ8MLEQvEzne00IYjk2po/+lindnkwlb8ZS/5h+l0mpHkmZLWgaSNshsadzehWBmE1bZ
 rIVLqV9xiQIN+6D9ZtPdbjoZ7cjnUtxX+ZSG6IRsPQVCK9h3SIdp80epooF3zD+b7Un/
 rGFY2iSZAjKMCFZNuDgM+aBdokq8ns9ZdIhWF0HGuTIb0exOM1VEG20CW7xhvVXkb0Pj
 f7trY+yXWrbWVJfwjo2E59pggMG4gzFZYATl613vYBTQXciAoyySBDJHE7iKe1oZDW6s
 kSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759289576; x=1759894376;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+zmtX/z0UVEmGLTI9JLK1Wpr0yiIFaGTMqhMoT9rSZ4=;
 b=qHrSziIHpq7dpw1sN4ZzUgUJ7Z/yXdHCRYpoI865Sebo/ZZUm9nX4tHL1X5IEnUh9W
 LvzSxybmXa9ElaXdg/o6DRYzmsEs7Jdq2PU0T+eZaBCuYxyetu+gK988hL045d1U6oky
 egK4xKSif41/kYAUJwzZregFLxeIFKcAgLdMxCeENNTH82MFxsc5hXkGPLl1QPG2l6FO
 TkP62jWPc8dKcFhLjGHO1LTcy7KVAK3wuQBgx7fdOBEdcMvwVblR/x2JX+JR/KTsKLpH
 JXRRtwJIlLGk0XrTsKHrBKM/DiYgc0/AR0g+WqvaqTX1qxIh7oXnbuYDze4dphn6JQm/
 G+sA==
X-Gm-Message-State: AOJu0YwKVztpeP3VY1mBJ0WY1wv+6dTG0kuriAuZDeEaPrhnxCyc9i/t
 6SMhZX4mwsJOWiBO1mKIa1TZIxvfybetDIKj3cfEL+1RToocJLEySv4B2RT5U40+1oA=
X-Gm-Gg: ASbGncvs+Nj3041zVFvhUT3Bh6zUW2Cg3Q4gkt3wgerGPKeaZXnmCHO83ZYfbe7r4qy
 PvmRdTmBTQv3pp7QPB1WZ9RUkd9bo1s2Ig0mZ1tAuh5qJmmivLWkGd1YZmwz/kt9St+5LAcVo99
 yqFLOtalpPV7BDyt7cMEIGU14PhvRZlPRDbqARTvB/zx2/bZ56yGmsI2+kFKf0WHWqKgT42zxfz
 z39JbU0cgSuWSSIKeguploP9muWVjeIIfsLcAhwj5f/VJmXD5jDOqaye4bRSnj73sJBDz2atw9c
 Pe5aJoFH2EawVSg9EUd6M8OCICr6Yo25WFN0YplF73f0OKUoK6cizNMURrv0VTrjyAFkrtJNxl5
 VnrmxMygVju1+9SWqT4Wh4zDlHaFCO4lcxsdMtAFGLk1OtPvsworPdpeHR5j4Qj39D1qLrOGs61
 EYYcM=
X-Google-Smtp-Source: AGHT+IFh4lfvADahzYY4PAf0OUbyhSPyHVh2B7BkYasgXfxdz06FSyxf7Qxl3gA703DMACpJB9hmJg==
X-Received: by 2002:a17:903:2a88:b0:254:70cb:5b36 with SMTP id
 d9443c01a7336-28e7f27db88mr20732215ad.8.1759289575705; 
 Tue, 30 Sep 2025 20:32:55 -0700 (PDT)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:3746:506c:1567:3ec2])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed66cf6e7sm174291535ad.2.2025.09.30.20.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Sep 2025 20:32:54 -0700 (PDT)
From: Chintan Patel <chintanlike@gmail.com>
To: maarten.lankhorst@linux.intel.com, maxime.ripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 syzbot+147ba789658184f0ce04@syzkaller.appspotmail.com,
 Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH] drm/vblank: downgrade vblank wait timeout from WARN to debug
Date: Tue, 30 Sep 2025 20:32:12 -0700
Message-ID: <20251001033212.25423-1-chintanlike@gmail.com>
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
---
 drivers/gpu/drm/drm_vblank.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 46f59883183d..c8dd9d4be26c 100644
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
@@ -1305,7 +1305,20 @@ void drm_wait_one_vblank(struct drm_device *dev, unsigned int pipe)
 				 last != drm_vblank_count(dev, pipe),
 				 msecs_to_jiffies(100));
 
-	drm_WARN(dev, ret == 0, "vblank wait timed out on crtc %i\n", pipe);
+	curr = drm_vblank_count(dev, pipe);
+
+	if (ret == 0) {
+		/*
+		 * Avoid spamming WARNs for timeouts which can be caused by
+		 * heavy scheduling pressure or invalid userspace calls (fuzzing).
+		 * Use debug message instead.
+		 */
+		drm_dbg_kms(dev, "WAIT_VBLANK: timeout crtc=%d, last=%llu, curr=%llu\n",
+			pipe, last, curr);
+	} else {
+		drm_dbg_kms(dev, "WAIT_VBLANK: completed crtc=%d, last=%llu, curr=%llu\n",
+			pipe, last, curr);
+		}
 
 	drm_vblank_put(dev, pipe);
 }
-- 
2.43.0

