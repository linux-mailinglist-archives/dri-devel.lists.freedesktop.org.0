Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F9615D394
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 09:13:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D596E544;
	Fri, 14 Feb 2020 08:13:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A726E544
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 08:13:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id a6so9581635wme.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 00:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KrKw9honv00Gv8PUmJW+4mJo3k/0Qys+gOsebcCfF3M=;
 b=IX2UBSpq1ijj5Y60vXHR/kdmzhsOietgGnxiq1gYG4nzdE6hJ/f05q2wQeWyDKFGQi
 NbP4zV2N/O8hI2f7LxyznqyKHwopIS1aXW191cAZLNd+V6e636ho7u1kTkMVEFtb8gXc
 tbM8X6JBUIE3Hy3gX6VeDa4XZFhIL0Nn86fOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KrKw9honv00Gv8PUmJW+4mJo3k/0Qys+gOsebcCfF3M=;
 b=TuDnceFeZarWML2hdS5y7rAWvclXTUgyFa2/Tg6RCSBkDyAu6rQoiFMcelUNGKxchP
 dXnsu0gwxYJ9aw58UvnrhuN+MHxQ5CGMWGygAyN1EY2Sc7EX+k/1A1/z3pPE59o0Z0Rs
 hoov1DnjptfgLOgucPxMMHR3szJz+sVQugPk5xoGKWJQ9yyofRfFXnSxtzsqQqDUIHLD
 ErJKTGlCvS6a9ftawAyambTXN7XxvuvS5yeBEbXX41Wq0GzHSn7qAMp8plQu6nF2E7+o
 feOznXnmgueF3Vdtheim4u6s1svBuUbo72Sh7UEobsD4/43TwdlSExtKYLYOmNk3AJzJ
 zhow==
X-Gm-Message-State: APjAAAV4l2h4EiAxl/Htr4HT53SeQHRmJnml6ZI5Arr9bw94PhMOeOru
 Aw8iTSAtuS3RgigCzX71mFeYNu6GTQQ=
X-Google-Smtp-Source: APXvYqwgBlhz6TgJgw3WBLM+g4Rs5LWptPoKrq4nGEPSDiZ6cvJTbnX9RLc/6mwecYS0f8LkUeCC3w==
X-Received: by 2002:a7b:c386:: with SMTP id s6mr3167407wmj.105.1581668026253; 
 Fri, 14 Feb 2020 00:13:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q130sm6878847wme.19.2020.02.14.00.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 00:13:45 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/atomic-helper: fix kerneldoc
Date: Fri, 14 Feb 2020 09:13:40 +0100
Message-Id: <20200214081340.2772853-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just a tiny copypasta mistake.

Fixes: 751465913f04 ("drm/bridge: Add a drm_bridge_state object")
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 33141d2cdad4..8fce6a115dfe 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -635,7 +635,6 @@ EXPORT_SYMBOL(__drm_atomic_helper_bridge_reset);
  * drm_atomic_helper_bridge_reset() - Allocate and initialize a bridge state
  *				      to its default
  * @bridge: the bridge this state refers to
- * @state: bridge state to initialize
  *
  * Allocates the bridge state and initializes it to default values. This helper
  * is meant to be used as a bridge &drm_bridge_funcs.atomic_reset hook for
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
