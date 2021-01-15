Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012432F83A0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABAB6E4C4;
	Fri, 15 Jan 2021 18:16:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6706E4B7
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:11 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q18so10226728wrn.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JlEOg7Zszo3ldqPVK/e9O2X0GMgkDBvEfp3oSty5OZg=;
 b=ti7uQ0hCTPPxB9beBVtUZ4SzOifYKrXMyvwtnJOZCMb3piPKWkCgRTtMToHUtDW4m3
 4WXWjh1OaQVCg+r/ZvpIYeHfusCUkZUj7brQ8Z6i2KqCDkvkgefT3VSB4cfgBpnT9l7d
 fZTtBeOOXIaCL+tnKJYqVgYdIQvNtf8WdZhYmuDlPcWgAM/BTOSLyk2cNPYPGa7p5IOE
 fqT1nQGdfJIi7q3R1OCk+kzBt61lMtJXPbziIht+qigatuOJfxVVF+URzLNJeHhozO3g
 mocvqhE4OctWN5LLKk+smzy//CbEyENiGJN2PJnimVwPeKAr1Ufu/v7i+akBwSaVbbGI
 8FYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JlEOg7Zszo3ldqPVK/e9O2X0GMgkDBvEfp3oSty5OZg=;
 b=hHtfrYiq1k5jv1KIeUt2eL94xv3ZVx2do9HzJrTCxuXKZBHZXL8DgLLn9OwvQ2Bgq3
 Hm1Qh0gcrhXveJMmSYjW0S9R03saB77c3JrugDk2bCJQw1Ccl/v80KkZmHO6mHaTeSzp
 WOW2dbCHLKLhB1hyZOKNIMlmtxR7NU3m8Pajoku0GJNaccEfEysdD1OjaSpdwCKeWMhY
 HuJjY5ozJUpS08hAVnm4sepucy5ymbiYeX/7sQ5e0qCSPzbVSLulKuK76AROB3x+Mb4f
 RFhyn6wk1v1eDGysUXKyBT51O23+gyRsvVySttPaXp0bl+M9TAevdx7CKBz3ftSL8x43
 46fg==
X-Gm-Message-State: AOAM532xU3CzHMkysJhg0SQkeQd4pa4qcBwyknkNwq1JNLdNjyS5XD5l
 tOTxLj6H9M6C7bexqQ9t528SGg==
X-Google-Smtp-Source: ABdhPJyn4QddbfxLAegv+OX8NnX4aenp5m0W9RYEo8aeaDslhCWzAZbZOuRU1WhBNg3JBgAGTD1cCQ==
X-Received: by 2002:adf:8285:: with SMTP id 5mr14062860wrc.289.1610734570384; 
 Fri, 15 Jan 2021 10:16:10 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:09 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 03/29] drm/vmwgfx/vmwgfx_so: Add description for 'vmw_view's
 'rcu' member
Date: Fri, 15 Jan 2021 18:15:35 +0000
Message-Id: <20210115181601.3432599-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181601.3432599-1-lee.jones@linaro.org>
References: <20210115181601.3432599-1-lee.jones@linaro.org>
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
