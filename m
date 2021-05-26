Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729F93912D9
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361C56EC57;
	Wed, 26 May 2021 08:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E506EC3D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:47:59 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 f6-20020a1c1f060000b0290175ca89f698so15003741wmf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S4QyaYMBoYLFq2bECv9NcJDq+15DdDgMC7JcY/MSiHQ=;
 b=fXxjutAewkRO+ZLRFdPFIkDYQiq3FT1tAjQZAeRDdOi4gzVrCmRz0EfHowF5wmGIU9
 76vEzlODufv7/xzX4bFcjjaMBHWtnsp2o7aAGyOFJ7MydqdwBDVUs/dLiJTM3EtuT8Em
 nCwY5anBY4yFKKFiGHIQ9c3tybiUDbB/7KSUXRf2hhUT6fuzjMgqPvpLKUdwhnU3RJT2
 UIYYzMdHkXpCOU3/HF600gA0TktxLAoTIs5uifm8CpVMWcIDlV1SHWjVczPC3CLkGneU
 bWE8SoL5WsEyX7ERCKdOySnTVc4ZibSovBC0Ww3mEgyzqxw5IE//bQNsh+Am+8zkHAp6
 Wygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S4QyaYMBoYLFq2bECv9NcJDq+15DdDgMC7JcY/MSiHQ=;
 b=NVTSqXz7KngAGO/0rtBbtCP3SYMCMXyQ5a/Du+m8tX8aYzrOShZxc6YdjcewdqtJx4
 nH1jVua3CCqyxfWjm9fY+nWsxmaH2/kBcK3Jf0J0EOCLtnaGKOPWD6D8Mokuw84soj4f
 o6x5mJHhbdclKLWe/2Usv4vZmHPIyBXlAyhSX3jOxhC2iZnzWHaVXrKe4hm7m5yySfzm
 SbenMOJAc8Uv3v/tp5oeE6txeKTkYZMmlmIqr+4fkEkvTqlXtVpROEGnq1F+uwFYGe33
 e9J+MatatJ6EwX5VrB7NANoSq1bzfV/ZuROhpybaHvYDCFUZFHpjm0L6dKiZvoos1ftl
 7CaA==
X-Gm-Message-State: AOAM531Eyq17eNy+PHk2SWaDbRP/3gd3VjUAw6hOCIB9jVBBQP0fsZBY
 KmBot4rCxbV+8sBfKtbwyWvnBQ==
X-Google-Smtp-Source: ABdhPJz0R2q9qd/5Z7jEN9eSA7NhHE1G25V1HtYeDCHeYnc83zadalbGt3yZ6CpynG6ngnVoAJwk4w==
X-Received: by 2002:a7b:c446:: with SMTP id l6mr2225001wmi.75.1622018878547;
 Wed, 26 May 2021 01:47:58 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:58 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 27/34] drm/ttm/ttm_tt: Demote non-conformant kernel-doc header
Date: Wed, 26 May 2021 09:47:19 +0100
Message-Id: <20210526084726.552052-28-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/ttm/ttm_tt.c:398: warning: Function parameter or member 'num_pages' not described in 'ttm_tt_mgr_init'
 drivers/gpu/drm/ttm/ttm_tt.c:398: warning: Function parameter or member 'num_dma32_pages' not described in 'ttm_tt_mgr_init'

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 539e0232cb3b4..682c840c9a517 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -415,7 +415,7 @@ DEFINE_SHOW_ATTRIBUTE(ttm_tt_debugfs_shrink);
 #endif
 
 
-/**
+/*
  * ttm_tt_mgr_init - register with the MM shrinker
  *
  * Register with the MM shrinker for swapping out BOs.
-- 
2.31.1

