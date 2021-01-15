Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6DB2F83BB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:17:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B331B6E503;
	Fri, 15 Jan 2021 18:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C696E4F4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:46 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a9so6755724wrt.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uVp68mdiDdBXS5aeK/400FDUtXHrGa18qKz0SHB/q8Y=;
 b=FZ8N+MseSySo4v1ZYJtrG+RSruEOZbWyzJ1DhpH1v0o9O26kSKf9zYaVCXBCYmJ+EC
 VoxYOA5ngWznxOD7xhM2a0Pkaizwwul9w7Rfjcea5PZaJm1aoa0R4crh+20jESbp1kdK
 umz/oOgofPJ5OhfLo6ROYuKEi8ubJWt7mD7CclpQig1hod1srd6KCwkwIc7FESEoj9il
 zDkA2g6rDRYYmoOHUF5t8Lvf5nek8ri3xn0b2lRsszC/PWDWrDpS9axdl2fnukKBGjXd
 5BhHxJV9fsMGGK2Pu3BvSUx0NH1avx4aYo88U1gblimRQ9gQnqZLnM3IMbWIRhg4VHl7
 KkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uVp68mdiDdBXS5aeK/400FDUtXHrGa18qKz0SHB/q8Y=;
 b=QzGg7Uqg4RpD2GFqLKdZdbYIGN4fetfmv89kG/Xbg8qROUw4g3qoGO23sUYsRPFqGB
 bgBseVuL9xD8vGp/0Kckgdz7kFRUCkmOWhkt1iAYk4DPEBoOv6bsGmS0zlHC+kPkoKnK
 N8MZ5GwSZHVrN+2tvAW8k7R8ekg51w7ohsV06a7S7LzFAdUI0odTlGUvasxLxiWXPbVz
 Rwfawqqv/CGG8hjXbp41GQQMhhIkAdmlIfzxNkb86xBksB6SgEN4dghiGE0xw43s2quK
 lBKgAoDIgzMyN6f8kR0xnpKgceo/oai2e9myrqXUqmWM6FIE+X07hylNyQYPvUumHWZp
 1ttA==
X-Gm-Message-State: AOAM532AmjmT35VdIxO3bb6jTCESGP0k+iG4DVTHbgXOH5zkYqJl6Aci
 xalTivk3ky0QOkxD+cnJwHqxDA==
X-Google-Smtp-Source: ABdhPJwrZlGGrGjAf3GMC7apd31gRe5Dhy4mYcG3vGI74Rt7B8oSthJtP0F4vFDP74WcZg3XO1aKvg==
X-Received: by 2002:a5d:4fcf:: with SMTP id h15mr14103236wrw.323.1610734604791; 
 Fri, 15 Jan 2021 10:16:44 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:43 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 28/29] drm/nouveau/nouveau_ioc32: Demote kernel-doc abuse to
 standard comment block
Date: Fri, 15 Jan 2021 18:16:00 +0000
Message-Id: <20210115181601.3432599-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'filp' not described in 'nouveau_compat_ioctl'
 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'cmd' not described in 'nouveau_compat_ioctl'
 drivers/gpu/drm/nouveau/nouveau_ioc32.c:52: warning: Function parameter or member 'arg' not described in 'nouveau_compat_ioctl'

Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/nouveau/nouveau_ioc32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ioc32.c b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
index 8ddf9b2325a42..2af3615c5205c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ioc32.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ioc32.c
@@ -38,7 +38,7 @@
 
 #include "nouveau_ioctl.h"
 
-/**
+/*
  * Called whenever a 32-bit process running under a 64-bit kernel
  * performs an ioctl on /dev/dri/card<n>.
  *
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
