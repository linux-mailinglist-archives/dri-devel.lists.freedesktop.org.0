Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 791CF58B1F6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 23:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44137A1A61;
	Fri,  5 Aug 2022 21:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183979FD56;
 Fri,  5 Aug 2022 21:54:50 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id i84so2859268ioa.6;
 Fri, 05 Aug 2022 14:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=38b4ptDDIvz2ddGSj5VKmEi/zh+RmsO1/UedvwI7WxU=;
 b=DtJrrTM0KeU+8b/viLC94jltyJcFE60mrEuVXYQV1o++JUn4Ob+xUZE0y5y7tVW3cB
 CbDi305LuxsU/K6tMe6B4AeLFT8aZhIvbuOGpEQYwmHa/VPMdPh+0b1Mmb7tbhnslq2l
 NxbSbsWCdcYZG9PT7jg9bgZ8gupfdCfvM49RioZ+yd/sGMGxWUK+ug9RkciRZFCt2An8
 nOBJMTq5Phw0oEkmUR/XOzwHkyWv89v62jV+rD7vQ7c/UgmiJofYtxToWqYxXFTyquF/
 59XiNq51Cf8UJiRb8IVQTDeiThvAFqbOJIrBr/oIN+HTOE6f39AVY64wFDRW8WffWdoh
 uEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=38b4ptDDIvz2ddGSj5VKmEi/zh+RmsO1/UedvwI7WxU=;
 b=sefu2f0LSWzM4MSpYZHivLYmfr3bICt4Eb4Q18x6brjkjetFhz8wqkzOCKU7GPLHx8
 kjAFifr3cKFEkWBxLQM8VgH42NxJ2GoMn0w6eF0ybHfyFjWmKWEYwwFMOtDo14NbQlRI
 b5WNkQp9dBQ7+zxuKxG8hULKeXij0xRrBvLfQF913rapjOaJoF+2F+26Hq3CZ4oq0Rth
 QzBB+gm66SyjWeiWFh4bZvkhLNqQmE7ob62hA9z64TtYeCcwaStel4ec+UbjamF7CShK
 +nVRMXsej+3epNGw5ujaMw6fhjPI9gi8TImEXYeDlAHc2ld9IimNyOXgdHSUg0W2ckUS
 oXDQ==
X-Gm-Message-State: ACgBeo25PJwj24yf5tUwN1g8Njo77bPrCn2pssepTVrPPA0/v3kBIvCS
 +PH+s5i1irVq3jYpwz0zWdI=
X-Google-Smtp-Source: AA6agR621XKXrLQiWUu1/0axmxkoh81epfEoghE2k1YD0aYPKC9SfRWprmpI0qGAoNtVO0ewMEUPPQ==
X-Received: by 2002:a6b:c3c3:0:b0:67f:f487:987e with SMTP id
 t186-20020a6bc3c3000000b0067ff487987emr3625137iof.0.1659736489639; 
 Fri, 05 Aug 2022 14:54:49 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056602044c00b0067c09fd0b53sm1765532iov.21.2022.08.05.14.54.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Aug 2022 14:54:49 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 26/33] drm-print.h: include dyndbg header
Date: Fri,  5 Aug 2022 15:53:48 -0600
Message-Id: <20220805215355.3509287-27-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220805215355.3509287-1-jim.cromie@gmail.com>
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org
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
2.37.1

