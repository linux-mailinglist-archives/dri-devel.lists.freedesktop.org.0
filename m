Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EE632B844
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3496E975;
	Wed,  3 Mar 2021 13:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CBB6E975
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:21 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id d15so8499984wrv.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oOctN99VtPEuQxbAuDG+BL97SKhd9D03A4O1vAmIt6Y=;
 b=x6AS3LdRZBrN0y7y9+yjdOVvm8tDGN/HEUOtMVjCZPG+CFbIJ5nhNd18RoubmKm5nk
 QJrQ0u0DEhDPBCi/46gCWz5HvChhh3OpU8U/72idR18uOEYM9B25aUTkk2xjPzt5O6E8
 y8xKk4QSRoGHmDGoQ0mj3IGsZoC4Zk+XhA9K6297bFOE27mhdEHeYx8av+etATMockOE
 xQBM2XqCPIbKdFQCvNfyw8mihI+Zlclsiv7/h3+FqOEEMVIaecA0WmUxksKdztL68oll
 b1doidTR/jl8lEl+3PZuWLX7sAqCTX4sjSe9fZTsJAcB+FMVnAyy1uaQ3ZuRlOKrwh3f
 10tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oOctN99VtPEuQxbAuDG+BL97SKhd9D03A4O1vAmIt6Y=;
 b=rMPkbH13NknNQFNNr3QJObdHmFxHSAwDLFVE9L5YwneCdSTafyFHL9mfja7qYtmjUl
 ZuanbY10zg9APdfYapcBNu5hZq0ITVjG4h2aPiPCjo/5zfMYofn8s3KiizhNBc4oNEWz
 7hwh2u7dudyBB6kmB1W5nRfmFMmrqPzYYIBP7YIRXkw3j+fkMM6RHajHNKyghLhE4gms
 ny15ZQgLdUYjeePZavjMbig/CBUcvXP4d/CjPfrG1sPEoHFHK4h40+9+UfM9FFE1yMMT
 Z+EPJ3qlr9O3WokroD2m8mPJtGiTF5/z7XyJjbFJY6dLWMsFN+cZaJEn34FOGglY8e8o
 +i4A==
X-Gm-Message-State: AOAM533VXQxJ/w/LhhHs6OXpzSI59TPuHz+HF23iF9uvJEBme1dkVp+B
 y5pyJjxEO5EhUH+gDkrtUybbVnZdasCsxA==
X-Google-Smtp-Source: ABdhPJzWAhPL4kiG7yhb50nxJvSoEjvKFJhiIu9Cydmb4z7sldATR7YLT0R/RJMGixwEdXh1m6ZH3w==
X-Received: by 2002:a5d:4a0e:: with SMTP id m14mr27417003wrq.73.1614779060225; 
 Wed, 03 Mar 2021 05:44:20 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:19 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 44/53] drm/vmwgfx/vmwgfx_cmdbuf: Fix misnaming of 'headers'
 should be plural
Date: Wed,  3 Mar 2021 13:43:10 +0000
Message-Id: <20210303134319.3160762-45-lee.jones@linaro.org>
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

 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c:137: warning: Function parameter or member 'headers' not described in 'vmw_cmdbuf_man'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181601.3432599-2-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
index 3158924ffa852..2e23e537cdf52 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
@@ -89,7 +89,7 @@ struct vmw_cmdbuf_context {
  * @max_hw_submitted: Max number of in-flight command buffers the device can
  * handle. Immutable.
  * @lock: Spinlock protecting command submission queues.
- * @header: Pool of DMA memory for device command buffer headers.
+ * @headers: Pool of DMA memory for device command buffer headers.
  * Internal protection.
  * @dheaders: Pool of DMA memory for device command buffer headers with trailing
  * space for inline data. Internal protection.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
