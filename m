Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2382D62646D
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 23:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF89610E8DE;
	Fri, 11 Nov 2022 22:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF7CC10E1D8;
 Fri, 11 Nov 2022 22:17:27 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id q5so3151058ilt.13;
 Fri, 11 Nov 2022 14:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B2uIhj+1kniLl98rxc2zGhFR3/ukaY2ppmVrEhlaB1M=;
 b=eplYE5X6uNXmUiYQeBqfuI/BDxP9+t/E/ns/FxNcmLmjgfFnpJuJkKQJ0UmFT3qrs/
 AwUE8VkjNjy9Vf85VXwHgfbS4fvL44x5SDItJFyqmnF5Jth0zUmgu2phi2/gQc2lQHG9
 s1KqgxBf3KkIEnrK9RsBlDhO3BR+LDp+Gycfa+/sha6Ox54KfOMMC8et3UBKuiREJL/E
 G9yvyErEP55T9w80uST+yv4ZdFV+waY/fCwV32PMwgxagO0HxDrsjzyVBuMZMFkuMUH+
 su4Z70L+aqjJ426bfG5pHPxpgaBp2fp25DIc7yaSctwfmKGXticmkvwuoQWbFfwKLZQt
 9liA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B2uIhj+1kniLl98rxc2zGhFR3/ukaY2ppmVrEhlaB1M=;
 b=oZisYjmIJxNWFTBUttHfjjQYR5x79zQuVAUr5LhSy4V9XaJa7M5Y8OkKH/4HXc/Kg+
 kQrujLgWo2jMTqIG1SKtAPMvnKBbEvoKjH5amfdY717a/aEIqd6GtFy2rakZ0ahXuUSJ
 +sYj9Nz29Gkdf/Twxky8F+6VshoFxBUEiBdQUyhEKcEkX5jADcu4JYy62B039C8npOjx
 ++GCOpydO8XLrHmz7iiOfbMNsR1ibshopHWiokLtZLadsN+MwhnAKmFNMpVLkfhJkm5s
 xJ4viveVyfzcp4W/4cdJgRuEI0imTEMSiXUVCRWs2FTUHLEX6Q6KzxI1ElhdSR3ClHfL
 LSZg==
X-Gm-Message-State: ANoB5pkH2DZIMeN2S655AxtisU2A57hMn2jbU95qGznW+EK5EhDKz70Z
 a7iWj/IJKfhZw1vEGUEho5o=
X-Google-Smtp-Source: AA0mqf43Ej/2CvnoWy3aMeGYEZ2N6lV6eGpN+JDr5q1wxFnhlWtCr9BpR5BpvvdZgpLI0N+dBNEyBQ==
X-Received: by 2002:a05:6e02:1c03:b0:2fa:52cd:80eb with SMTP id
 l3-20020a056e021c0300b002fa52cd80ebmr1943790ilh.236.1668205047214; 
 Fri, 11 Nov 2022 14:17:27 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 c5-20020a928e05000000b002f611806ae9sm1113457ild.60.2022.11.11.14.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Nov 2022 14:17:26 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] drm_print: fixup improve stale comment
Date: Fri, 11 Nov 2022 15:17:10 -0700
Message-Id: <20221111221715.563020-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111221715.563020-1-jim.cromie@gmail.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <20221111221715.563020-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk, seanpaul@chromium.org,
 joe@perches.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cited commit uses stale macro name, fix this.  And improve the explanation.

When DRM_USE_DYNAMIC_DEBUG=y, DECLARE_DYNDBG_CLASSMAP() does the
mapping of DRM_UT_* onto BITs in drm.debug.  While this is still using
the drm_debug_category enum to do the mapping, its doing so somewhat
indirectly, with the ordered set of DRM_UT_* enum-vals.  This requires
that the macro args: DRM_UT_* list must be kept in sync.

fixes: f158936b60a7 (drm: POC drm on dyndbg - use in core, 2 helpers, 3 drivers.)
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
. emphasize ABI non-change despite enum val change - Jani
---
 include/drm/drm_print.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index a44fb7ef257f..06deb58d5af4 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -276,7 +276,10 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
  *
  */
 enum drm_debug_category {
-	/* These names must match those in DYNAMIC_DEBUG_CLASSBITS */
+	/*
+	 * Keep DECLARE_DYNDBG_CLASSMAP args in sync with changes
+	 * here, the values define BIT()s in drm.debug, so are ABI.
+	 */
 	/**
 	 * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
 	 * drm_memory.c, ...
-- 
2.38.1

