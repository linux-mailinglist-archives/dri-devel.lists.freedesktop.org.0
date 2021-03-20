Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A810342FA5
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 22:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47F7F6E0E7;
	Sat, 20 Mar 2021 21:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6E26E0E7
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 21:18:36 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id o5so6705783qkb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 14:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eW9CLPE8dtw7JzUG1BTnbHhfZGWuTtjFDhmBxQP6eUs=;
 b=oJI9nJzB69Aa8YIQ2keAyDToFkzIgChBEqReqhYSus+mfZfBnXX1TXubIvCi4XOTO1
 77o1O9z7bMBDFkPGltfRFs3FhoOlJ0uka/QZvYvOxaZgKcWlE6RecmbMg7x7C5hFyWqB
 VsyZ3cYwT/68uICMrGMuL0an/cjwIrC+R1ELsAXH/yoecI+zYX0oRgrYpLGY3nCspcxQ
 E5sEHFBzNT+LvqttN09BQJ0WNXLw4N3HMGA5qLS4dS/bDCgErmREg8aNm2xzWF2zsaT8
 cGysUoSFcil59EpHGk3BtGFeMMoRdtKIQDznpKFmldhXDs+KlaqiXSw8GMxzB7Mx5C4X
 mm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eW9CLPE8dtw7JzUG1BTnbHhfZGWuTtjFDhmBxQP6eUs=;
 b=P5b/w72Q2iu4aUydtcauSsvtXNmnbRrh73jFf0uAd19uNLUfgBNifFBTfaKFgmyPtk
 96CGAHSi35k8TB3EDHMvp+DucTu6bL9Eqiwgb6lfJkfNGC1jqDHu4ak7Yy798q7LdPRj
 tsosHl8/sw49gHN/77fKOPHv7qDYcFkicY3sWvriPMzV3CXHqKOn7/H0LCKmGLQq/8fw
 xKeqSRDGSxHdEDjkkoG3bROgQ7ZZLWdsLMFW2KMDC6L4pKoQt//BNZ6S3y1B6Newx9Zj
 PePjjQN4WP2DPBg2Ox8OTb7hnrR5UcTqx8RJH/1rGlCOFBK13KKdIGEewEYqpKrzgTve
 CtfQ==
X-Gm-Message-State: AOAM532xVQf5mlYt4lDZX+sKZAyTY/kjiJ4w4yFpOSqwSo5kBufa8DCG
 VAnoZCtVe4T2wntzBblZfNE=
X-Google-Smtp-Source: ABdhPJw4pHIkaWnH2Q9mj7fDLSlRthADMyqtLAmzflt1CSaQWrcX1kAZPuP65ibqTJ0FhIphEjh24g==
X-Received: by 2002:a05:620a:1277:: with SMTP id
 b23mr4255955qkl.457.1616275115448; 
 Sat, 20 Mar 2021 14:18:35 -0700 (PDT)
Received: from localhost.localdomain ([138.199.13.205])
 by smtp.gmail.com with ESMTPSA id s6sm7452644qke.44.2021.03.20.14.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Mar 2021 14:18:34 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Fix a typo
Date: Sun, 21 Mar 2021 02:46:17 +0530
Message-Id: <20210320211617.30746-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/particuar/particular/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_so.c b/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
index 7369dd86d3a9..6cd38e407145 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
@@ -33,7 +33,7 @@
  * The currently only reason we need to keep track of views is that if we
  * destroy a hardware surface, all views pointing to it must also be destroyed,
  * otherwise the device will error.
- * So in particuar if a surface is evicted, we must destroy all views pointing
+ * So in particular if a surface is evicted, we must destroy all views pointing
  * to it, and all context bindings of that view. Similarly we must restore
  * the view bindings, views and surfaces pointed to by the views when a
  * context is referenced in the command stream.
--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
