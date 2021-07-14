Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8043C8A22
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 19:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868636E45D;
	Wed, 14 Jul 2021 17:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8301B6E45D;
 Wed, 14 Jul 2021 17:51:49 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id w1so2421961ilg.10;
 Wed, 14 Jul 2021 10:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kmHsDnFQwSbOnRKSJ1vga0OhlV8P3CEw6FanKWDIy40=;
 b=H5XKgKLd+5dNWlW4hslIS9sT6Tl0O9uPJSZG6JlbzSbTp8sfCUAcF5hTY17SdgAg16
 UAjvuNJNKhlyj0b/AR6YrMwu7au1Kby9I15cpkByXiIz0+LgYoSe8QUwBjHov22V4c2Y
 lh8yWDoqVh/G31tKpZnHRkhfB4cAHDIa1tD9aSW4TMsv6EuyNWCzOppPQMhnU4Ex9SAy
 +HDu+F2WMF0uZlbj8/lBgFAlf1eGrD+scMsHvmKmqKmI91W7qpieVZUvJBqCuoA82rps
 j++6fkbjU/il82DYJZZ7zy1y/f45uZImCEgiLqWj1l1fppHeff/BGcKpvzcfwmZGWyHa
 kN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kmHsDnFQwSbOnRKSJ1vga0OhlV8P3CEw6FanKWDIy40=;
 b=jhY1O26PAbOz2tgnTLLmZyoDEQunVOiu9uATJmMAFLkjQ7CCFAFhBOIKUfAeUsq7In
 MALxKnI1x6x40ZHNMfl17mo6VqpqVxP6aBJL77mcvATrhr0EFRuCflRyat1jt2+pAmHC
 09t5WXejW3dhEgzAYE2QDGech8jXhN9a/F9whljxYOKwS2jJupvBKegHJhyZv8ALPbTA
 87gKHPFqEMmWgywAv4BZ1NjyHgDOKUtZGKjZZpYhPc73A2UkcN2ZFs1CCLAhzv+fMZNN
 NQW9JRPYWsVUPchLir5BcUTQImXKIdj7h72I9B/HgzHIvZeW5lNRbIuNeCv7kfRg8a3J
 zXDw==
X-Gm-Message-State: AOAM530vJzQS7IzWPDnOxLR0bG5dG14JzIfhSi42eaVP02L4xtHrdqe8
 bC0F9Sr4NWFEqJag4fLmOIM=
X-Google-Smtp-Source: ABdhPJwnFyiXb5DSNrcbdKnFIwb4qm5Xoi6BJ/1l3+bhS1x2qHPAYTt/JDpQ17FPwFLGkzaswqqP1A==
X-Received: by 2002:a92:3207:: with SMTP id z7mr7507025ile.288.1626285109045; 
 Wed, 14 Jul 2021 10:51:49 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id b16sm706518ioh.5.2021.07.14.10.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 10:51:48 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.a.wang@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/5] drm/print: fixup spelling in a comment
Date: Wed, 14 Jul 2021 11:51:34 -0600
Message-Id: <20210714175138.319514-2-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210714175138.319514-1-jim.cromie@gmail.com>
References: <20210714175138.319514-1-jim.cromie@gmail.com>
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
Cc: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

s/prink/printk/ - no functional changes

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 9b66be54dd16..15a089a87c22 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -327,7 +327,7 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
 /*
  * struct device based logging
  *
- * Prefer drm_device based logging over device or prink based logging.
+ * Prefer drm_device based logging over device or printk based logging.
  */
 
 __printf(3, 4)
-- 
2.31.1

