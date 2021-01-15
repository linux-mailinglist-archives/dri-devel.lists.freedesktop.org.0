Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC092F839E
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0F76E48D;
	Fri, 15 Jan 2021 18:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BFC6E4C1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:16:10 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id k10so8219322wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CRnDlHVa12JoDS+1Cu3+Ec4HFRbAYSztolaDSiDve+E=;
 b=e7F9l+/dUV6ABxBCDtb/BidpEhKGM4UyqXYYkGDUNjAhYHxnuY9f3ElU0sjsZtNelV
 x/yJl6ti64qxc2h+OnEbh2MwY8KBYmeJZKU2yuyfvID0Yx8V2d/uBWhGXmYMDnmhmys9
 6UYpMRgXvHThOA49/yJSUvpYCLe0wk3zbUQuvpSPknEt9y/sQjN98kjXlrLp64GlqGpG
 7KMt6pJP/fyQkFaUKSl6k5RN94/I+jEnP4VsteeAk6fpsjH49xwIfPJABsJyaZ4YN4iv
 ZKfmjn/l98cpku1bSU5Kz7MEKHFBEw/hAVSZN1IAA7Fepu0nwoScJdvHIfXlFviqWmG1
 B/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CRnDlHVa12JoDS+1Cu3+Ec4HFRbAYSztolaDSiDve+E=;
 b=ZBt9Ivbf12SjCpyO0W7FUZIBEJX17hf/6MG4FoFv5srPWDb07Ai2YXpzMotBe7oebc
 SrBeip1j5NwjwohWLpiy507bmTNYy07UYharno5uUAEItvUjn9YJVuO49lX7ap2yi0iT
 RN5FOv+efo/w22acfVGIJ4d4RlqV6USmOWfNjef8BkK7FpvG0R09RlPsnBnzNw7XiHut
 qFtjGSmWBrZfhc941bLiXnUUVHSvolyMiDOv3SnaVzdYYo1thfQfyiAvBYZbVdHdoBh1
 2i/CrRZfpsQoA9cWTVRrXoEb7XuVZn99UruaW2Egl+Y6IYzywXZyLmj5oGUfAD2K8fH0
 9CxQ==
X-Gm-Message-State: AOAM5314/S7R+udozJ3jhqMg0TYIa3ilQSi55CJNgzMDKpvr645fA63M
 ixWTv104fuvHlVorI0rreD0lFw==
X-Google-Smtp-Source: ABdhPJwIyOV6NzKrLV231nC6Q0q+ZFXfNYtZgTm4tQRyqu2f2dD4dK1RNYIlr9iv2Ic1kMUN2xmJXQ==
X-Received: by 2002:a1c:4b10:: with SMTP id y16mr10129104wma.73.1610734568698; 
 Fri, 15 Jan 2021 10:16:08 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id b133sm14405979wme.33.2021.01.15.10.16.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:16:08 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/29] drm/vmwgfx/vmwgfx_cotable: Fix a couple of simple
 documentation problems
Date: Fri, 15 Jan 2021 18:15:34 +0000
Message-Id: <20210115181601.3432599-3-lee.jones@linaro.org>
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

 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c:72: warning: Function parameter or member 'unbind_func' not described in 'vmw_cotable_info'
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c:308: warning: Function parameter or member 'val_buf' not described in 'vmw_cotable_unbind'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
index ba658fa9cf6c6..42321b9c8129f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
@@ -63,6 +63,7 @@ struct vmw_cotable {
  * @min_initial_entries: Min number of initial intries at cotable allocation
  * for this cotable type.
  * @size: Size of each entry.
+ * @unbind_func: Unbind call-back function.
  */
 struct vmw_cotable_info {
 	u32 min_initial_entries;
@@ -297,7 +298,7 @@ int vmw_cotable_scrub(struct vmw_resource *res, bool readback)
  *
  * @res: Pointer to the cotable resource.
  * @readback: Whether to read back cotable data to the backup buffer.
- * val_buf: Pointer to a struct ttm_validate_buffer prepared by the caller
+ * @val_buf: Pointer to a struct ttm_validate_buffer prepared by the caller
  * for convenience / fencing.
  *
  * Unbinds the cotable from the device and fences the backup buffer.
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
