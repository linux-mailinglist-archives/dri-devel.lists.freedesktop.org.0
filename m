Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CACE1A6AD99
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14E2610E6AF;
	Thu, 20 Mar 2025 18:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jDs3ND5F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA8510E68C;
 Thu, 20 Mar 2025 18:53:44 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-85b43b60b6bso41411139f.0; 
 Thu, 20 Mar 2025 11:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496824; x=1743101624; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TtBnrd8yWB3oKPUJX24gJEUHr1Wu50+TDt3ZzWgKjdc=;
 b=jDs3ND5F441XqeVSB6OPOIflzBSDv8wzl4HOe7Wag/ZfcuxGVquQ77ooJR/pVjpBhf
 +kmtufu1AnPZ7QTtqaq/1HVBM9f7iTRZe5J26lRvuRBAirZYK1hyIwx+1KKyCyTa0Oex
 s+K7KPxE6+1EOf1WxNz+21mEa9ZBg3CqYmh9EQylksre7izdHht4M4A+Bp2YT8zoc9SO
 ORV2VPZ082BFoPyqszwG0P+i05uNcQWxbS6NpwpTbJ2u455KZDGMuekmEGgBXOwPXdjz
 /RTYdXK66y6Gs+0aWcb8ZBkWgKJT76HCGJBW36nXwMfFHZ0jSnnWAZSRP3elxyBYy+mX
 3ibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496824; x=1743101624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TtBnrd8yWB3oKPUJX24gJEUHr1Wu50+TDt3ZzWgKjdc=;
 b=BZOh4KLR31X6hufvJNx8XzYTC78gzBfpD36prhHh8SXtvRory7n3FmKHCepUt4puvh
 ShCSNqyJG0YiWjHCorGxXK7iPu+FTzlvBSqHUoY43c750hsDUkespLyZn8/EiIzI5EDf
 f4yfhfc+C2WyZJwFDYfYMvtC/dgFVMXzkUtrrb0tUAHtBfsy7YFwSYFksOQWB6KoNII3
 MZ92IqUQZ17O1RgObSMtS6hmpgyowPhzZ9NhtcKxE7kYT07c8O57fdvOGEThVuy/C2W8
 uFfAXKmvJGEHZ/XuEOtix41B6YAgd6EUIfdRPnIplxtzEldgO0s7ba8aYLxnDCAeEMNv
 59AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7FqmqxItr/Duly2J1cu8yVrhndFyBV1CO3G4xquEnpPlPPIe3UwIA6GeUajcaywSYqWYWhfWN4bsP@lists.freedesktop.org,
 AJvYcCUzSVFzbmFuKAr5m+QLQamHaegzPNBWWcPFzuxuwHSk5d4jBhEAz5WgyaXKQL2HAHQghYTlB8onFjWM@lists.freedesktop.org,
 AJvYcCVTpOEoXdOdzcBPTDupVlTreCHsIA4UzyEOJu5svL1KdN3EfDdQ7J9SjZUNq5gLMd8pAwk+m0WwtnrPD1xyBW6aUQ==@lists.freedesktop.org,
 AJvYcCVYBG38gWXbM/j/PoIuccn1vbsteEy2ahQr1FpLWB6DHssDqmcJNdH70FAnQ4Zyvtt0RiI9Nj6D7/RpuRTHdQ==@lists.freedesktop.org,
 AJvYcCWrQ6ErT3tX+LmYMwbJeia8d20w18cM/jkSRwcXgo6iDdAZGpgjD9aW/h9MS9goa5PhBRwrwH1P@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp9hT1vncKWwjpclPn2z/BfYnSgPoRIlfXjNY9zht0DU3AzLB4
 lv8xhIr/d974X28eRndwvYlAzkou370LHxHMt5E6mVgNhO5gjGu/
X-Gm-Gg: ASbGncuMuYy8I81MAwPTt5RSG17cDs6Ax3raMBpUsOWl0xrltd9AsNMxNot7EL3VeEJ
 2P9qQzg21Pys4Qoja885Fd0e0CcpBTA1GaGpzOnzvBrI4+3GgeB72EAKZCWB/p5dhqsel1N3jFk
 wGMTRmmAhw9ZL9EpUX4/hqoZNUEQAjJ5OJ/JlNwElGTumn6pDtCyoXKjG0jsXWvy+KSmbTRnwk2
 wjZYAeNkeC+A5YM3xM25/QY+myj8YjjpiRKy2/Ydo+x5RMnNhg7DxTNlP4hQDTlenW7WVULphWF
 0aJ/0IJ1NpjT1TPxfUM6dh0X5KUyPApY3xn5kLLIJOC3Vy50WaC2iTDBxTQhr2meGgPgd0yDHU/
 quk9Vx6cDz/3f
X-Google-Smtp-Source: AGHT+IHFvyQVRbturEwDcbCPHLoZwk+VN5bfdFvOWI+5XsTyYwxQd9MOexegAMxgJSGfLg+Eu4mK1w==
X-Received: by 2002:a05:6602:72e:b0:85e:16e9:5e8d with SMTP id
 ca18e2360f4ac-85e1f0179afmr538360939f.7.1742496824100; 
 Thu, 20 Mar 2025 11:53:44 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:43 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 35/59] drm: use correct ccflags-y spelling
Date: Thu, 20 Mar 2025 12:52:13 -0600
Message-ID: <20250320185238.447458-36-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
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

Incorrectly spelled CFLAGS- failed to add -DDYNAMIC_DEBUG_MODULE,
which disabled dynamic-debug in modules built with:

CONFIG_DYNAMIC_DEBUG=n		# 1
CONFIG_DYNAMIC_DEBUG_CORE=y	# 2
CONFIG_DRM_USE_DYNAMIC_DEBUG=y	# 3

NB: this adds the flag (when 3) more often than strictly needed;
modules built with CONFIG_DYNAMIC_DEBUG=y (!1) don't need the flag.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 19fb370fbc56..704f94efc804 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 # Unconditionally enable W=1 warnings locally
 # --- begin copy-paste W=1 warnings from scripts/Makefile.extrawarn
-- 
2.49.0

