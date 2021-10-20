Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627B7434669
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 10:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C347A6E220;
	Wed, 20 Oct 2021 08:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EB56E220;
 Wed, 20 Oct 2021 08:04:58 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id m21so21767833pgu.13;
 Wed, 20 Oct 2021 01:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mjmRjhDPlXfraFDWaI835gx21hrF9HvWdixel7/6qiY=;
 b=ZJFJaNNRd8PuSCE7kAX2UWj/y+omgtyGj4Dp47MuJ0HupbjAOnWsezYd6Rd4Og+4Hp
 VDUsNxHuAJu4JdIN3GfUnGk7okzNKYPDR8K+wLBIEMeUOGtdEKNndDUKstbLFXUamj4K
 ClJ9i3EHqgcbcRIU+V6/nm5aabx00nX1/Of52iU0BqgpwxpcTaZWnK1BXEGGlSB1fvyx
 lJ6xNzYRYOKMXaoBm+c4W5sc/iNEZh0oiOp3rNpfuft5kTg++HzlWIyNGdJZe4USdbwy
 vYJVaamnD2YbueFmHBsB9HXxV4u+diOyZRg+x/ljO8bBn69oOmM01TdEODL8vrzqTnuE
 QeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mjmRjhDPlXfraFDWaI835gx21hrF9HvWdixel7/6qiY=;
 b=fPs9tY9gBuxuW5xCZPcgskS/9Cp2QqQXIsPXi4vpuC3iYJbLPwVB1G+q+Ek4/2h3yQ
 j77q5v/57i+TIm/6F401OsPJYex+1VDt2XvserhG4ltI782I2Ko7iTsTwVeFJEptZJT9
 V9ujvx8YCZopyXXtLNNtB94Pb9ezyZkcLyAEGaFN/HhnmFahi8g601kbN/iU8Xy7PbjJ
 Ex/gDwWsNLFYY9w6fsUg8fnWFVwnsTYZZjLtT/zqPcx8Gvgy9IesF28cO5uEKXuHAHWd
 5/ZZSGx2rUFuxxElPMMyi3+ylXWz5PbEZy3kDQLvBaOHG4Nj9oUt/iOrGuzI2QQoOK/w
 epfg==
X-Gm-Message-State: AOAM5330KKHBAcwnsB3CC6vE9ROhIdFz6GFxu0NrCGHnPge6WuB1Q+oY
 0SDiHXFi9jmjPhGxXBJYE1Q=
X-Google-Smtp-Source: ABdhPJwGqLGQ2yAkHfBoHcZZo71yOpOVfy0K270UPJQdPGwQtGqO8K22PKI0HvmSUr8m/LeTEf0CaQ==
X-Received: by 2002:a63:4622:: with SMTP id t34mr31948887pga.293.1634717097926; 
 Wed, 20 Oct 2021 01:04:57 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id w125sm1584366pfc.66.2021.10.20.01.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 01:04:57 -0700 (PDT)
From: Ran Jianping <cgel.zte@gmail.com>
X-Google-Original-From: Ran Jianping <ran.jianping@zte.com.cn>
To: matthew.auld@intel.com
Cc: airlied@linux.ie, cgel.zte@gmail.com, chris@chris-wilson.co.uk,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, ran.jianping@zte.com.cn,
 rodrigo.vivi@intel.com, thomas.hellstrom@linux.intel.com, zealci@zte.com.cn
Subject: drm/i915: remove duplicate include in mock_region.c
Date: Wed, 20 Oct 2021 08:04:01 +0000
Message-Id: <20211020080401.1037442-1-ran.jianping@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <130dcbfd-ee6d-0d9a-602f-1aaca1229099@intel.com>
References: <130dcbfd-ee6d-0d9a-602f-1aaca1229099@intel.com>
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

From: ran jianping <ran.jianping@zte.com.cn>

'drm/ttm/ttm_placement.h' included in
'drivers/gpu/drm/i915/selftests/mock_region.c' is duplicated.
It is also included on the 9 line.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ran jianping <ran.jianping@zte.com.cn>
---
 drivers/gpu/drm/i915/selftests/mock_region.c | 2 --
 1 file changed, 2 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
index efa86dffe3c6..b6747b3eeac5 100644
--- a/drivers/gpu/drm/i915/selftests/mock_region.c
+++ b/drivers/gpu/drm/i915/selftests/mock_region.c
@@ -6,7 +6,5 @@
 #include <drm/ttm/ttm_placement.h>
 #include <linux/scatterlist.h>
 
-#include <drm/ttm/ttm_placement.h>
- 
 #include "gem/i915_gem_region.h"
 #include "intel_memory_region.h"
-- 
2.25.1

