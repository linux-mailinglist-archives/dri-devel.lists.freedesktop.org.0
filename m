Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E0F8B6299
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 21:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE22910FFB1;
	Mon, 29 Apr 2024 19:40:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hXUGmLaW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E032410FF4F;
 Mon, 29 Apr 2024 19:39:45 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7d9480d96bdso272423139f.1; 
 Mon, 29 Apr 2024 12:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714419585; x=1715024385; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nJYPCWLWtk5u9OuODPiVoHDlhD50vJ4NXaKLOLuEW/c=;
 b=hXUGmLaWJ4ylcYS6iNbGV7zXP78WT8a5zRSqb/1o+0Hree6JYfNyDwxZdGyCtUopep
 2rtPv6xsZZ22II+oGWD2gZwG88OlEf/vcexnBkgC9af/Prl09N1fqF4l7DkgblpIY0lw
 2xMmTEuJ+1nXgbIZDYnjJZ0Jgm85oj1Hq5xneU8R7OJHlXQsYuK0LCTKHIcZYOrcNutS
 6cz24poVylHQDS76v5O69voo4mzGtl92QvuS8B+Dkzs/GbFAQ6di2SygjaiAr1trXPbC
 9Jha0CQcY0BkAIg/bSlbBWEA8PHpeVhTw5bZSwc1+WODkCb/MK0tC3mXZdDwMmS+iKVH
 A1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714419585; x=1715024385;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nJYPCWLWtk5u9OuODPiVoHDlhD50vJ4NXaKLOLuEW/c=;
 b=SQZ5sEO+eUVBlluQ+rFS2uyk/OhnYlRSRttyzzkMURoWhZK0Z6um7uZMZfs19B/Plm
 bgTNAmocTZVBtyrASbf2qRc3KY4/wlUuVEAGseyN20e06qJ3lWbx1/g50x3WvUCZ+AuO
 czAXCa2lhWte7UgmnoZgYtjfc5AWING79LDFaL+ywU7+Yn2+xcZLjBUrF+A8MvZNpyeE
 ZxxXpXnKB92vrTfBw5VKCvQ1GGbKlyebD+4fncwD03hQTezPPU5fde6oxS/z5jc/3DGu
 cDP9EWAY9eNpSsBlcj2+Hmb7qd/AkpcqudHfv1bOqIwFa7nRYTwpaKgHnpF8wbh3fJ3o
 9FxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsud6FgNExKWz1Gf4OEd5AE3K5PFas4GfH1DVnTZYlnAa76a8Xt5Ywcau3fyElLmq3I8SQjRT9Oc+wVFq6OCscxFJHtmHtnN94bTO8ayfa/P5C5iQmbB4KE6ck2fkBIMmuUjgm3ZYBLwzFIQ36/LPzPqFtQ8/WO96CZLVbEcn0Wf7QC3pW7dJlCxQKajFJZq27okZJCDaBnUIgjScEphh+wJST+C8h9Zh7F5lG9siRdAK+rS8=
X-Gm-Message-State: AOJu0YxUrrtj6vldNCgLkFjX8n2VA4m9+R8N9aT2pmtorbJiargo2YmS
 iJVYdLbRTvCKoWaCXCqIPkTnu3BDyhpILAT1q6jRFnAIABf7ELZh
X-Google-Smtp-Source: AGHT+IHjOhQgOCcXtw7/jegYglzMKIrb6oRCN1PRx9oGSN8qw5xCJw9DpglxKehiLtweVV/J2JilLg==
X-Received: by 2002:a5e:9742:0:b0:7de:da61:7a3a with SMTP id
 h2-20020a5e9742000000b007deda617a3amr906777ioq.20.1714419585057; 
 Mon, 29 Apr 2024 12:39:45 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 y16-20020a056602165000b007de9f92dc57sm2325105iow.16.2024.04.29.12.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Apr 2024 12:39:44 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ukaszb@chromium.org, linux-doc@vger.kernel.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 34/35] drm: restore CONFIG_DRM_USE_DYNAMIC_DEBUG un-BROKEN
Date: Mon, 29 Apr 2024 13:39:20 -0600
Message-ID: <20240429193921.66648-15-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240429193921.66648-1-jim.cromie@gmail.com>
References: <20240429193921.66648-1-jim.cromie@gmail.com>
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

Time for some quality CI

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 5a0c476361c3..b2ea73ae48f0 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -54,8 +54,7 @@ config DRM_DEBUG_MM
 
 config DRM_USE_DYNAMIC_DEBUG
 	bool "use dynamic debug to implement drm.debug"
-	default n
-	depends on BROKEN
+	default y
 	depends on DRM
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	depends on JUMP_LABEL
-- 
2.44.0

