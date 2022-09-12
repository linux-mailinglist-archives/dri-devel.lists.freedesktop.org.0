Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2671D5B5384
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 07:30:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210E610E586;
	Mon, 12 Sep 2022 05:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9B910E0CE;
 Mon, 12 Sep 2022 05:29:10 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id k9so3983733ils.12;
 Sun, 11 Sep 2022 22:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=RsTMiP9rOdYWd/CJgD5lf62E3pBpPHn3iKvnTstCS5k=;
 b=W9eQyswY9d9anzLo9n6+2UK5jd3zMCdtrygDAwAMSM7s0OU1949CgrWCW8nXchSyiL
 Rog3WeOHPKLi6deSZZsGF6nKh2qwU427KlJN3lgjMNhMhEA207r8rQIWQMlJAmvRiuQq
 zMWFezmy7K7fs/TLe6IvtHaUnMRiNKtiTq84uBmku0pVplN+YeWuv5BK6Zv8wx3Ii8Aw
 oyz/EnibqRPHntszYzw90+D5NTdmo/PcbaVPw6zgiZT5VnjiJa7WL43/vlBm5Kglnbsj
 k2uDPVf6h0P/D1ZZv02s6Gu/jJWVdpMqlAXICXVv59sh0KVnzWtAFdhLIcXQ1FGPUOV2
 JWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=RsTMiP9rOdYWd/CJgD5lf62E3pBpPHn3iKvnTstCS5k=;
 b=hFX8iktU3ZH/iQJymYFxQOYdLq79G+coMrYPZ3Ns4JLns3g/ugrxlxH4Kw63zxWA+w
 Ee+wduG+chMFevqGilPiw51rY62kZLFn5sIESywvwugoAML+eygtmtLLWrIah1jUHZbv
 aDC6NY6sedqKwCzjoUqpHxATGnts6kNLH9lTaq+FL8BHaufFnqKtcUb9lWp3YK8AvIqm
 SyDGKphASFvyhdVvDNvT4WAY/9VeVpO7MP1wjOOLyf4/7eboQ31XCyIpr0twuykCniZ5
 +n/9wZZIs6nVcYRLV+N/rIeU0kWtwopBwh1k2kVCSvJCqlJrLLrgUSqSZRIBYK7QWzID
 ED2A==
X-Gm-Message-State: ACgBeo3jHz+pvuN8+Op0HyppK4/LYALbZCiLTUXhE0LEEC5OMarSjhHI
 WVFjIX38kILI4D1wXxahWQs=
X-Google-Smtp-Source: AA6agR5KpMxoafFECoggp6f+wIRK77w1QiltMXIK40Ocyg037/uILmvU26N7K21NwVRWoJyGf7uoPQ==
X-Received: by 2002:a92:6912:0:b0:2ea:fa2e:462d with SMTP id
 e18-20020a926912000000b002eafa2e462dmr9379940ilc.155.1662960550217; 
 Sun, 11 Sep 2022 22:29:10 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 q16-20020a056e02079000b002eb75fb01dbsm3006057ils.28.2022.09.11.22.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 22:29:09 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/9] drm-print.h: include dyndbg header
Date: Sun, 11 Sep 2022 23:28:48 -0600
Message-Id: <20220912052852.1123868-6-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912052852.1123868-1-jim.cromie@gmail.com>
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
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

lkp robot told me:

  >> drivers/gpu/drm/drm_ioc32.c:989:2:
  error: call to undeclared function '_dynamic_func_call_cls';
  ISO C99 and later do not support implicit function declarations
  [-Wimplicit-function-declaration]

           DRM_DEBUG("comm=\"%s\", pid=%d, dev=0x%lx, auth=%d, %s\n",

Since that macro is defined in drm_print.h, and under DRM_USE_DYN*=y
configs, invokes dyndbg-factory macros, include dynamic_debug.h from
there too, so that those configs have the definitions of all the
macros in the callchain.

This is done as a separate patch mostly to see how lkp sorts it.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/drm/drm_print.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
index 2d2cef76b5c1..f8bb3e7158c6 100644
--- a/include/drm/drm_print.h
+++ b/include/drm/drm_print.h
@@ -31,6 +31,7 @@
 #include <linux/seq_file.h>
 #include <linux/device.h>
 #include <linux/debugfs.h>
+#include <linux/dynamic_debug.h>
 
 #include <drm/drm.h>
 
-- 
2.37.3

