Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC20933139
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:01:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ED710E872;
	Tue, 16 Jul 2024 19:01:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SW0yTHSn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED4E10E839;
 Tue, 16 Jul 2024 18:59:13 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-8036ce6631bso5970839f.1; 
 Tue, 16 Jul 2024 11:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156352; x=1721761152; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+4FIF/HbRAgi1F45UWnC13uNax9+Z9AZXMw7KimFe8Y=;
 b=SW0yTHSnEUFIMD7Ld05Ewk0j75J4uXBBkT0AhCbdcYfX5Lxje1SFy611BtG5LAub2w
 hewMmn7qPkOZaYfrbCjwRrwKfWjEJ26gDNCOLqL1mUNlBplYhIwGgXIbe2/ksCtQTXL1
 A+Adrd1NDYHVyatZrXz7FhlnD+Rs0JsU2ylDZZSCqehM9ZaUruYlK/6WuydgI9wuoj8z
 jiVCwZtamvQCq6hyD5ouJQLphfyg0G+bTGZp1TDRoWwYgoAY25HnPsmS2oo2lBIIVX6U
 +3i5cBbMUaqpMTCh6l6bHQUNgskofBNdCa0BNGuQZApUTrCu5wU6a8mfQcyZIxdMiulH
 UMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156352; x=1721761152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+4FIF/HbRAgi1F45UWnC13uNax9+Z9AZXMw7KimFe8Y=;
 b=CZEZhI06ctuu4qa6rdTRa1tIfNpSmyUOHunnWdfj3Di8WbUUG1u4Cheo6c98M6JBlq
 lRxjAESbLxe5KMQHg5rXjfCn5t1BBGs38Xoppa/9VwYQTxFGcArrwwm4+DoDe7JwwFS7
 Jtmix7Bu//c4vkz2mC59UFmbEalQnP0Voj8ZsfOULx2VDmgc0MqdXkmEH0mMEO9JwiDZ
 Fc2pVRJxctactD5YUHwUZtErmv9ZxjviMD/y4xVZRhrdBsRomvtlL5NHDDfBSFpkcMt5
 QqHzwbLn7vMwcPJ3183pfcNVXkZuWgoGR4BQUyfPYWfqCJYjGnUl2sjHIjKjqe2MODlW
 +ivw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWxaS05XYS9i35wjtyHToKhjK/qfGC6F+6FzVi4lsw1z8PLEBH2KD/6TgvYNsP4Zq5n2VZso/YpLtulNXneUCQKn3iGCFVBcg6X+jrcgycFi36rJZNyU0S6vt6Db9xZcyLwr2fVj2Td5Zx/6dp5YTxXLBJj3ALU7dxazXfbwlr0g/jJ/xk/tIddeNmDJ5Wxfq7sQQrGtgfuPzn5STLBV58NlA8UixaMWBEozeD4+Nzw+LgRPQ=
X-Gm-Message-State: AOJu0YyvKU9vLWieOB4wf+0yuXfr3uKdyr6lSDbNQljQIg/2Dbu8pWeg
 n3w463MuWO3I9a34wJOLXfFd1vAvlV013ib4Qtif6JPPRPlhzqZc
X-Google-Smtp-Source: AGHT+IGZMA5Wv6HVLe5IZ1iRd2dcUnxU5c1yurtEkdS2lNPSvZcznoMoprI5GhjJCIIceYNE78q/rQ==
X-Received: by 2002:a05:6602:3ce:b0:7fb:790c:a317 with SMTP id
 ca18e2360f4ac-816c32c9ademr48017039f.6.1721156352545; 
 Tue, 16 Jul 2024 11:59:12 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:12 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: ukaszb@chromium.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9-resend 37/54] drm-print: workaround unused variable
 compiler meh
Date: Tue, 16 Jul 2024 12:57:49 -0600
Message-ID: <20240716185806.1572048-38-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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

With CONFIG_DRM_USE_DYNAMIC_DEBUG=y, I'm getting an unused variable
warning/error on 'category', though the usage follows immediately, in
drm_debug_enabled().

This drops the local var and refs the field directly in the
macro-call, which avoids the warning.  For static-key optimized
dyndbg, the macro doesn't actually check the category, since the
static-key patches in the proper state.  This is also likely why the
auto var appears to be unused by the compiler.

commit 9fd6f61a297e ("drm/print: add drm_dbg_printer() for drm device specific printer")
CC: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_print.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
index c7455f2076b4..0980210a5146 100644
--- a/drivers/gpu/drm/drm_print.c
+++ b/drivers/gpu/drm/drm_print.c
@@ -183,11 +183,10 @@ void __drm_printfn_dbg(struct drm_printer *p, struct va_format *vaf)
 {
 	const struct drm_device *drm = p->arg;
 	const struct device *dev = drm ? drm->dev : NULL;
-	enum drm_debug_category category = p->category;
 	const char *prefix = p->prefix ?: "";
 	const char *prefix_pad = p->prefix ? " " : "";
 
-	if (!__drm_debug_enabled(category))
+	if (!__drm_debug_enabled(p->category))
 		return;
 
 	/* Note: __builtin_return_address(0) is useless here. */
-- 
2.45.2

