Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB34577B76
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 08:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8758FA9D4E;
	Mon, 18 Jul 2022 06:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E71A9CE2;
 Mon, 18 Jul 2022 06:38:50 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id d4so5549846ilc.8;
 Sun, 17 Jul 2022 23:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pbfKjW8s+yNblg/2VqulB1BrQZpCCy3wi5VbG9v1p9Y=;
 b=QOj/ip4QduY99K5+0N6BwKZcMk9msE0SGoTjqXARq+LWFxr6/0bzuaAq/fTXPcfgsL
 lyDmaEtB0JuvmvlQ3zr01MXAbeKDsfjogGM9KZI6FamF7thaIZAYEUJ8thxtpO5U6mKB
 Hn1n9T1ePbUiRFzYiPZpfDlMf5f72C33mzCA3VTNFNvUrrtBaaQwJxxfLQTIOQufNwWd
 1vMtXfkwa/RpyAdQKoAyRA0MowG7dKJOknG7QcDzyeUVspW7z2Oocueq9rGspg0LM9re
 ntR/GnRpxzezcqXVod9+iEacWBm9bZZA+eiwQBQ6xoWAsSTxEOdmupmzEjlj1ZEGVtjO
 hxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pbfKjW8s+yNblg/2VqulB1BrQZpCCy3wi5VbG9v1p9Y=;
 b=7wtro2Ujvf76zalirYr4KzIezQA9/xN17rRtiEi9OKJIAq8qjwW6dE6OC21X+sCgwU
 +nKU8f+QyK/sgYD808TRlVZe0Gn2Krhffu5Ar/xVq+8Woy4xucR/U5ivMuMtBq3gp4Im
 k749gcQcPBQH0mq2soLO8QPp58Tqa1bD2DTeJAW5HUsMpNv/UUwvxVUtla5jnn0qAYcq
 17CfxZvt0m7r8CCCwGUf8mToMp5bmQ6sfbWMftjHuXRFXWglzLb8/mOx5zRkCJcYjUq2
 Cs/+kSG7xPP0TdxeGgmgiLvzhKsTPC/wF4+C7RL6p4KEWXjMTC4bUehHHHt117GozX5H
 wWYg==
X-Gm-Message-State: AJIora9q9czGR1xIiR5E8dmRv7uOGzcC/2B8Ic06FWEpNgcLW/qdVmWX
 NfAm7Ftp/DBmWpZXPWvPA6s=
X-Google-Smtp-Source: AGRyM1tx0yp4KSHzPyYHxnLdlzPSkyd1rVu+bV6AGVvQK9o2oS6/so1HEdIv1j9Y0schHyfmZruDjw==
X-Received: by 2002:a05:6e02:b21:b0:2dc:6d2d:5a61 with SMTP id
 e1-20020a056e020b2100b002dc6d2d5a61mr13218223ilu.273.1658126329652; 
 Sun, 17 Jul 2022 23:38:49 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 o12-20020a92a80c000000b002dcd35bb030sm2342604ilh.74.2022.07.17.23.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jul 2022 23:38:49 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Subject: [PATCH v3 25/41] drm-print: include dyndbg header indirectly
Date: Mon, 18 Jul 2022 00:36:10 -0600
Message-Id: <20220718063641.9179-27-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718063641.9179-1-jim.cromie@gmail.com>
References: <20220718063641.9179-1-jim.cromie@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

lkp robot told me:

  >> drivers/gpu/drm/drm_ioc32.c:989:2:
  error: call to undeclared function '_dynamic_func_call_cls';
  ISO C99 and later do not support implicit function declarations
  [-Wimplicit-function-declaration]

           DRM_DEBUG("comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, %s\n",

Since that macro is defined in drm_print.h, include <dynamic_debug.h>
there too, so that any uses have the definitions of all the macros in
the callchain.

This is done as a separate patch mostly to see how lkp sorts it;
I'll probably squash it with HEAD~1

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 3aa5e9ea26f4..dfdd81c3287c 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -31,6 +31,7 @@
 #include <linux/seq_file.h>
 #include <linux/device.h>
 #include <linux/debugfs.h>
+#include <linux/dynamic_debug.h>
 
 #include <drm/drm.h>
 
-- 
2.36.1

