Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33D0ABC67C
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C788710E4C3;
	Mon, 19 May 2025 17:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="c1636hOW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E37710E4B7;
 Mon, 19 May 2025 17:58:54 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-231f5a7baa2so21669425ad.0; 
 Mon, 19 May 2025 10:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677533; x=1748282333; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oIwfIWvXBx6mekDHf0vT/9qUv4fpUfLK8aMEarZbbCM=;
 b=c1636hOW6ee8gyvVWskm+qLeCe3SwZ9GNA4bh1v0L+6pVjWdvx8D4Yhwowt5N/Cuq8
 SjxJ+oRV9byP2s3vsXWJEBpskY95U9PoZfgKHHPYNNk7y4BHo7sAcQGY0K4BG2MfpXfK
 zIJUibLZRVZJKTmEOdyOiVFiAdc6fRCi9cWEnXYzrIylImogGo0RiONko11+AZX9xLZw
 xkuLtbK8lTZkwoyIvJFZnp1DAv2S74pBFWheidhROblBxBezqmsbxnxFhEq6RXnYE/KK
 D6MyNVG7coTjVyWa7oqxTYcycIqxr7I5QeZAgr1fSnhPYSiI2mB+kA5eE6ZuKYnPbsPU
 Zubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677533; x=1748282333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oIwfIWvXBx6mekDHf0vT/9qUv4fpUfLK8aMEarZbbCM=;
 b=YvuRXxNiqzJc0I06Wh5DiiRw28BfnTD2PfabtRnB+BSxP+MaQnSQbT+PBWnbO1ANr4
 m2k7P6uDbg9ra7E9qExGc0cctDjul23ddkMWIZrb1zVPf3X0Vh5bJIF8+uLDSL5iH8eG
 4xnPrnqxW7jphsnJ0b1PmLfcWKk8pe/hHzNLIjxVVYbSR+vfKwF/z0ZETY6GJt4bn+7w
 j5iJC3/pxuumvbMEiWXpx+o97Z5YA4doOkLFF74CB7UGHSh4lRhHqO09qL1TyBmK9Eee
 GtFjJ6MvtYet6HdpdmDho9kd4+ibcqGgrM6OcFc78veQQd6kUUQnbKXKEI3Kq4PMdrY8
 Yy1w==
X-Gm-Message-State: AOJu0YwxOsc39LGVu5CZ5klECiUGKkKyehYVaFhrtwYtqO9vKGZbGl8S
 vqqUmh7Y0Iu0oBwgt8lcYyCQg2tr6EONW1PC7EFDG7VrFF9LoGUUo5aY5Fs7IA==
X-Gm-Gg: ASbGncs3RFKcZe0z0ihPTFH6QggdTKxGnDMSAqisf/bubNHuPOyXa7qdFIaBh42c49u
 c1933qsoOwvSEOE5F+AWNu+k0W5eHtExP1BqdThSTGhBqkh9ceb+//FAs/avzEvZivryMN8Jj/u
 sC1/LtVAPZogEoC/UkiX2DnJH5aDL7OqltEqU4cRGZ/Q29Rv0FBvVkntyit0NuELBDM59huziVr
 RHdKTWV/JlZlrQ0ZW3nHkzNbsg6acsb5zZORLs/yn2WVWSOv5sbEZ39zoHhYCqMtCCy8cImFFhU
 O/JNpq3MD9tx8nSJ11pFRrr/7DyPHs4u9a4Kj34r0+bscwBEOKKbbdf6j91RuzmglwZiYPZVQzh
 C2MBRTXM7SHne6v3fM8NKke7FXw==
X-Google-Smtp-Source: AGHT+IGfHK87+UE6VTN287V0vY7+k/TNhX8IQ3w/Y0PFM/77BawdCwWPSjEqLHc3oa7QBi1AS6OLAA==
X-Received: by 2002:a17:903:32ce:b0:220:ca39:d453 with SMTP id
 d9443c01a7336-231d43a3e56mr178577335ad.17.1747677533475; 
 Mon, 19 May 2025 10:58:53 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4afec8dsm62997475ad.92.2025.05.19.10.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:58:52 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 39/40] drm/msm: use trylock for debugfs
Date: Mon, 19 May 2025 10:57:36 -0700
Message-ID: <20250519175755.13037-27-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175755.13037-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
 <20250519175755.13037-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

This resolves a potential deadlock vs msm_gem_vm_close().  Otherwise for
_NO_SHARE buffers msm_gem_describe() could be trying to acquire the
shared vm resv, while already holding priv->obj_lock.  But _vm_close()
might drop the last reference to a GEM obj while already holding the vm
resv, and msm_gem_free_object() needs to grab priv->obj_lock, a locking
inversion.

OTOH this is only for debugfs and it isn't critical if we undercount by
skipping a locked obj.  So just use trylock() and move along if we can't
get the lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index bdc99aff3130..f10de8915ecb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -922,7 +922,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
-	msm_gem_lock(obj);
+	if (!msm_gem_trylock(obj))
+		return;
 
 	stats->all.count++;
 	stats->all.size += obj->size;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 1e9ef09741eb..733a458cea9e 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -280,6 +280,12 @@ msm_gem_lock(struct drm_gem_object *obj)
 	dma_resv_lock(obj->resv, NULL);
 }
 
+static inline bool __must_check
+msm_gem_trylock(struct drm_gem_object *obj)
+{
+	return dma_resv_trylock(obj->resv);
+}
+
 static inline int
 msm_gem_lock_interruptible(struct drm_gem_object *obj)
 {
-- 
2.49.0

