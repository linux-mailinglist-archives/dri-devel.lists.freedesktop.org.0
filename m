Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A8432B846
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E5BB6E984;
	Wed,  3 Mar 2021 13:44:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8923B6E97B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:23 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v15so23748849wrx.4
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TQZLwiGbcenEghtj8sEs+9poNaFVOCqZR7K7Xf38sg8=;
 b=n3k/mYhgTVnHgN7Ksfu7aElbcegmINNz9xrSIIvHZH18JgTBt11GqX7B0Y+I4LRWWA
 EwFoC9NUaYXdvKsaBubKCaIiZflXprHJfSsViCJHiSsOHixKTZFbYB5rh525AeiAVHSR
 36oWRWiloNGWsDa+rxNY/prI4gFRA+mKYqo5blvhxgoS0Bwlkw+OxP/9BHEsGOK6qlW7
 2LevQxx2Hk2c4vpJMepQpKQluHx3bvehHuffE9AL8WW2npB+naUskSkyeNGhA6WzSYAb
 Wa/xGxB1YZZ/W9nog6dOoDUdh8T1vKKGix0mPXr2JcLCIgpr0GfPRiF0eS2xi0osra1Q
 FamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TQZLwiGbcenEghtj8sEs+9poNaFVOCqZR7K7Xf38sg8=;
 b=s65P+TkWPw+l0/Ab0EV1bHg4P6RTv77wIVNUjGVT52BaPD8CYwcFEcAglpr2EMGCTE
 Ut8rsXWiEFYtMYROLqXdji6j9lv4l9yNhzPQ6G8ADkJZ1fl+V3df9zHRL2H3GAupp6mF
 NCvz91gz8LLUwDu6xkdH614w2YPa4HE6WYpqfDermvUaBHTcvGWmKNmOI/kMMg758f9J
 WlukB6q8MtCK4ckxzdKHI0nC/oZV3AaasMAycb4/PWmogFL/NPyxPViGLvEkB761JxcP
 5buPccdJFnt48M8D6Agiu2EZxC6ydXWVxc0WCPT8zw1Utumx4yrNzSRz0t2WrzLhvX4s
 pXJg==
X-Gm-Message-State: AOAM530NoG7BgXQ+ioQFtSyy/ey2LkHAMGoR8i1rTiihY0e5nMHrb0D3
 pRDx3Na8dQmBrlGjGbSRb3WMYQ==
X-Google-Smtp-Source: ABdhPJxF6VT4N2VE6MuYcxHrcHSbjMveLyChxN9mxuaLwDgciE9MnDOkdOw+Vb/W9TF7+FsO2DOypg==
X-Received: by 2002:a5d:6d0c:: with SMTP id e12mr26592738wrq.136.1614779062329; 
 Wed, 03 Mar 2021 05:44:22 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:21 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 46/53] drm/vmwgfx/vmwgfx_so: Add description for 'vmw_view's
 'rcu' member
Date: Wed,  3 Mar 2021 13:43:12 +0000
Message-Id: <20210303134319.3160762-47-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_so.c:73: warning: Function parameter or member 'rcu' not described in 'vmw_view'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181601.3432599-4-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_so.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_so.c b/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
index 7369dd86d3a9c..2877c7b43bd78 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_so.c
@@ -42,6 +42,7 @@
 /**
  * struct vmw_view - view metadata
  *
+ * @rcu: RCU callback head
  * @res: The struct vmw_resource we derive from
  * @ctx: Non-refcounted pointer to the context this view belongs to.
  * @srf: Refcounted pointer to the surface pointed to by this view.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
