Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A0998A2AB
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5748F10E42F;
	Mon, 30 Sep 2024 12:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fmHpal07";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFA410E431;
 Mon, 30 Sep 2024 12:37:16 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-42cb1e623d1so40073435e9.0; 
 Mon, 30 Sep 2024 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699834; x=1728304634; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iIz4XxD/MXWvSuHKaNsZDh3MppYU6Ey9Ren8dN/1Nnw=;
 b=fmHpal07DOMQRT2xAEzEP6v0bFRzV9zALy7wzCzoNRLq02WNrJoApgGRuWWkr3dTxN
 2RleyCmxmCKhRhXZsHZUgtGFKFIPTRwtV8CQlQgxrb9TnCSYJQvYBcqM9uCb7qdFS3Hv
 m6Amdk4EBw7jM7uueO5ls1nIoj5Tn2mCsJWqcYUKvQnrquY+6auxIxqM/aQ5ao/RBC4+
 2d2MIE0OGOfHQZGTGLonqzSGigMGE3kG11CtezMrsAdfnDv4cEsopnGQYbdidlxmsYO5
 nVQBO/0t6x/M/V2vbk/LVRqHMH9l/QxbNDub8EGCL0w54BpYDP/UtxJUIDMRPSp+lrTy
 38NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699834; x=1728304634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iIz4XxD/MXWvSuHKaNsZDh3MppYU6Ey9Ren8dN/1Nnw=;
 b=E06ZY1Ur5mDcQZtEzT4VmCzJB8kjx9YsWRR2GHWcAUqz2V26UhoP2JKdVOeH1Arj8Y
 OsS51BUrWzIHFQInyyDgJxxb5MN4ZcCvsldYDhyoV7BIMgBYsa3t/3VSpLsD7SJX0q4j
 uRglwnvo5KsKKtlYH5gf71nYyIbvjpWm3LVHj36q/6k5+d1+8oY7yWfDeCQMs93iHq5W
 E3I+Kv6d4yzB7Znrw8Otf7q8PBnCbgRh/AA8RycrrcVPA/GvW70i2ofmhLSTbHakUrKE
 eEZ5sozWqQIKJB13dhkn1h9AhzqNjuu74ySOk2F8Ev5KqQnMIr5Jd4tQqKiHkkbwXkVI
 Sndw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlijcM5bCODhRppzWYEIdodVKcj7z6S+R+efIffIbqvMj2KB4Ymfu2vhfiA52IoIaqz1S6p3Cxc9Qg@lists.freedesktop.org,
 AJvYcCWzX8O0htvmHRF8pku1ZD/kO8iF4B3E6NrS+Pn5HhuVqqZR5cmwmWylCQP/wR3d8fbwBqWGwoRzSQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzE6E/r3nk2Y8LrSFVbxYcHN24PMwtmWOeOidqY41hTAgmwQx3l
 c2VEbb4nG3YajYHP2a/CzyMp0FFIloNUULygyTV+7ucDQbrBBhNH
X-Google-Smtp-Source: AGHT+IHLebdUj03VIWRmjVk+jZmmDpfIAH8/fQg7ILqXr2avcVfhMeGRYFMjONtxE6BzkKSMTbFFfw==
X-Received: by 2002:a05:600c:1549:b0:42c:a574:6360 with SMTP id
 5b1f17b1804b1-42f584a1d5cmr91192685e9.29.1727699834409; 
 Mon, 30 Sep 2024 05:37:14 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:13 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 04/19] drm/lib: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:15 +0200
Message-ID: <20240930123702.803617-5-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/lib/drm_random.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lib/drm_random.h b/drivers/gpu/drm/lib/drm_random.h
index 5543bf0474bc..9f827260a89d 100644
--- a/drivers/gpu/drm/lib/drm_random.h
+++ b/drivers/gpu/drm/lib/drm_random.h
@@ -6,7 +6,7 @@
  * be transposed to lib/ at the earliest convenience.
  */
 
-#include <linux/random.h>
+#include <linux/prandom.h>
 
 #define DRM_RND_STATE_INITIALIZER(seed__) ({				\
 	struct rnd_state state__;					\
-- 
2.46.2

