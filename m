Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5353A7528D1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1055610E76E;
	Thu, 13 Jul 2023 16:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BD610E759;
 Thu, 13 Jul 2023 16:37:07 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3460aee1d57so3901265ab.0; 
 Thu, 13 Jul 2023 09:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689266226; x=1691858226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tc9Brh2W3dPQvcqCOoVpte1ruNYD5JWFtpqITlawe8U=;
 b=VsfyQKiLjbzKK/SahsmLfJl8Z5jeUynfr0CGupnuqwUvhXarUNFxb4dr2w1hr+uGyT
 s7PuO6sZxBKzI85rB0M97T7GRy4O6xyqTT5e7Fw9ikPjgU4ipxt1Qz9iHBFfW/yDOTRl
 ckLv3sT5eUP2QZTIZrP9F5b6dhLZPm/ABHMG6573blneUR6G0Ye+wsj1MMCbZJxoKxC4
 LqY7RLUKs9KWXWuIay4vywY5Z8jeU42vhb1vepjVcJWtPe5cQMDZbWwAVVBQJXHQW9gv
 1RhkzAb/nIU6ZLKkOg3TePjFGtilKseYtyWY2vBL01JW7jw68B9zDC+7Ipfqxd2mYpL4
 J9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689266226; x=1691858226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tc9Brh2W3dPQvcqCOoVpte1ruNYD5JWFtpqITlawe8U=;
 b=l6BkqHjSMi4v36Zf5jQD146QNNcgE24DXUjr4h94viXtU4M8uBMxjlOMtLoquiN0Kd
 BZmI9bSJIQzupIoSsQpbrQjqn8iPGezJL6flLREsd1QK9qyLExJMmMuReigGTMhI9Q7s
 Xc8qiM4KHX5su7TXetkR49jBTRe7YLPM1U9k1p/O1x4bgHHBT0E5KMNilRsGr3pOLyaK
 38qccTAwjGkVwTMxgVbqd2rtyR0Tp8iyRWhlbDZ6iZ762awBtTp/wEfGGuh32XKM07id
 ho0tlgJ5vSRL7tT9IS97XzgfGQtwr9SygIoYes1l2OYK4JjSPknoiGHG3pn1i9qz8jDb
 udQg==
X-Gm-Message-State: ABy/qLbTpJI/+pBy8bTPSqYgxvAwN9QobWtO8DQrku2D/MHYWmXAFuVq
 DncDfHsZUKJswXzUbc6TFM4=
X-Google-Smtp-Source: APBJJlGn4S2QMrp8rhNUQHiN1GoLViDKjpqnclnnpU6cHFyPYGabENfbMJ6YJUwugrBgI/SFhRuenw==
X-Received: by 2002:a92:cd0d:0:b0:346:28e:ebf with SMTP id
 z13-20020a92cd0d000000b00346028e0ebfmr2059677iln.2.1689266226260; 
 Thu, 13 Jul 2023 09:37:06 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 s7-20020a92d907000000b00345950d7e94sm2147571iln.20.2023.07.13.09.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:37:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 20/21] config TEST_DYNAMIC_DEBUG default m
Date: Thu, 13 Jul 2023 10:36:25 -0600
Message-ID: <20230713163626.31338-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713163626.31338-1-jim.cromie@gmail.com>
References: <20230713163626.31338-1-jim.cromie@gmail.com>
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
Cc: jani.nikula@intel.com, gregkh@linuxfoundation.org, seanpaul@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/Kconfig.debug | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index d4fbbcc395d2..82d11ac63758 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2696,13 +2696,14 @@ config TEST_STATIC_KEYS
 
 config TEST_DYNAMIC_DEBUG
 	tristate "Build test-dynamic-debug module"
+	default m
 	depends on DYNAMIC_DEBUG || DYNAMIC_DEBUG_CORE
 	help
 	  This module works/demo's the dyndbg's classmap API, by
 	  creating 2 classes: a DISJOINT classmap (like DRM.debug)
 	  and a LEVELS/VERBOSE classmap (where 2>1).
 
-	  If unsure, say N.
+	  If unsure, say N.  If bored/curious, say M
 
 config TEST_KMOD
 	tristate "kmod stress tester"
-- 
2.41.0

