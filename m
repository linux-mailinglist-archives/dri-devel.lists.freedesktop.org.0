Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CBD38AD6C
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A7B884FD;
	Thu, 20 May 2021 12:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85306F428
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:13 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id z17so17370827wrq.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dzEKHJu7OFwu6XLDUaDLxDd4w/v+Udk50uYERKk06w8=;
 b=akXNjOoWI+hd9MtdjEd3PDOoyWFJFQqHYHLes7Q/ANFm6XOCR8E5Cujfd2BlPcBXCJ
 C3YQiJErJHlF0iiCtQSDwYs4ICfqx8+8BRPLBFZnIoPK3c0o/YXhMgTid38JyROYm/Vo
 teMr/RuOODaLYuS6h3C46IBLgzrTnsodcGqrjjrXvOrTzmRU6NoLhk6W3BhXiVTACjp8
 jyK92zW0AYM7tqwKFCElGatYODSlzWHsVPJIox4VcBOVAKulRUxCE1MhQwL16a6CszDD
 7yoZj+SHj4mtjkv1Id4QNGOSta7CCCLMZ9DdAYN154UEh2+GSkR27h/PMlGz9jv3heXo
 P0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dzEKHJu7OFwu6XLDUaDLxDd4w/v+Udk50uYERKk06w8=;
 b=ZEZ9YeW7bDghRI2158+Pez3+h/0BSUfNi49NAKoV6kxgo1lfJYcTZSBSH+fLnC1Pmn
 /Zo1E3YShueEVo0SavcXJ3OFMBErwGW5o0roCL2NyqcGsCqeKh0PZShvgeIOzutKrjNs
 Hnrb1qbheCVNq7snAsoyC+nACyIpWhPp4UxJ7RigWGDdYNY8Ly0qRk2mes/Y6ECgcweT
 fuuw+q/YWXEOCkJYxnDZLiMB9/8tGKS98kj30BC07knrygSFrX5B0K2FX2XAp4zdMPlg
 3eyLOqMBEs0YExbn6VdlyCJ44GjnAbxtjJ+ePw95lxng1KrUsc1Pw4ym74F+AJA741fV
 qj5g==
X-Gm-Message-State: AOAM532E2ECGuK+5wyBfr59N0vZn16JoOOsD+grWziWJbOyeOMuKAI6O
 sz9k2TDwvqN2oz3eCKwar9CVAQ==
X-Google-Smtp-Source: ABdhPJxIY7yv+rgs4XU+BqyHdRbSGkXegiiRFWqmNpb2diUp8p6mFeKESLGtV9djEkTEbXFrm/ADbQ==
X-Received: by 2002:a5d:4408:: with SMTP id z8mr4009264wrq.2.1621512192604;
 Thu, 20 May 2021 05:03:12 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:12 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 20/38] drm/radeon/radeon_vm: Fix function naming disparities
Date: Thu, 20 May 2021 13:02:30 +0100
Message-Id: <20210520120248.3464013-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/radeon_vm.c:61: warning: expecting prototype for radeon_vm_num_pde(). Prototype was for radeon_vm_num_pdes() instead
 drivers/gpu/drm/radeon/radeon_vm.c:642: warning: expecting prototype for radeon_vm_update_pdes(). Prototype was for radeon_vm_update_page_directory() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/radeon/radeon_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
index 2dc9c9f98049b..36a38adaaea96 100644
--- a/drivers/gpu/drm/radeon/radeon_vm.c
+++ b/drivers/gpu/drm/radeon/radeon_vm.c
@@ -51,7 +51,7 @@
  */
 
 /**
- * radeon_vm_num_pde - return the number of page directory entries
+ * radeon_vm_num_pdes - return the number of page directory entries
  *
  * @rdev: radeon_device pointer
  *
@@ -626,7 +626,7 @@ static uint32_t radeon_vm_page_flags(uint32_t flags)
 }
 
 /**
- * radeon_vm_update_pdes - make sure that page directory is valid
+ * radeon_vm_update_page_directory - make sure that page directory is valid
  *
  * @rdev: radeon_device pointer
  * @vm: requested vm
-- 
2.31.1

