Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2FD32B833
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43196E8E5;
	Wed,  3 Mar 2021 13:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8CF6E8FF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:02 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e10so23495879wro.12
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XZmI3Pr1jHFtcMrfTt6XXf4g0zv3hzYPvnP4OKNbsog=;
 b=yV5tYX7sM66C63eujllHcaOJ32XhnRuSYM/2ysLql2AqOw+0JFFtYrW1BeMOOIHrZ8
 2UxRh0GBKyBo386hNVibHh13wK44EFoEUJTGtQTp9oqSnU7fby17L706jr/Wf3ztNjYM
 e0evuYs/GWXlUByzjSYua4Tix9Hu9A1wpB1z9zkkMtLkCPj9GJB0U3Y9GzJg0G0GTUFv
 zY2ExaVCmrwe0zXYkSET4B5WBIYN3G8+2iTBnc/2WURR17wbrq2tlLA6QGo9PzSCUQka
 8MsbRoPLLrgWQvdGQr6UxayoAfr/mFvceRlGPzYb4pD9Hkm/WG0C4bvaPHLmwj9wJS3F
 I1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XZmI3Pr1jHFtcMrfTt6XXf4g0zv3hzYPvnP4OKNbsog=;
 b=khznAqnNHLpXRlelG7atBk84IKSP8NwzSAkVaAcLHXCZTqq2KV3xPR0vIYT/fNtBn1
 ZMUAH77HhcRi9fjKBATbmN8Ya5RKMGlzAK2NfQb9mcuElgdC6nIuhHhz9M4PNsvx18XM
 LeRVzAMHo0jpLVir2RG3HtVsAdGMkedeKtrp/I12EjS36scocK9OAgVw4gVCvKYC0j19
 K+6wJqKmE1+z4C44kbz2epEQJbTR7i8KCKoCaddHETslgPbr0t7hdYRnEf0bRQAoPfjN
 n5r2pesofhd/+1zjS4KXPgBWj+iF8rCGNmZbOuqWZJcMjrEqcvCh246tONPsUGPj0DOd
 5cSg==
X-Gm-Message-State: AOAM5337gCgqx3St2D0AeSnN12wP9v0j6UtNtXl6Cyn6L9bo1RAZxRgt
 IrLY5UbAQnrjMm9vFOOaJWGNfA==
X-Google-Smtp-Source: ABdhPJzL6t/K2FE9rWW+xuELLulwr2MIoNYvIh8upvVA3qbwZ8TmosW+CD13NqnCN6jab6u9DAhE9w==
X-Received: by 2002:adf:a1ce:: with SMTP id v14mr27677100wrv.228.1614779040787; 
 Wed, 03 Mar 2021 05:44:00 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:00 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 27/53] drm/vmwgfx/vmwgfx_ioctl: Provide missing '@' sign
 required by kernel-doc
Date: Wed,  3 Mar 2021 13:42:53 +0000
Message-Id: <20210303134319.3160762-28-lee.jones@linaro.org>
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

 In file included from drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c:30:
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c:448: warning: Function parameter or member 'offset' not described in 'vmw_fops_read'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181313.3431493-10-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
index 80af8772b8c24..b36032964b2fe 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ioctl.c
@@ -437,7 +437,7 @@ __poll_t vmw_fops_poll(struct file *filp, struct poll_table_struct *wait)
  * @filp: See the linux fops read documentation.
  * @buffer: See the linux fops read documentation.
  * @count: See the linux fops read documentation.
- * offset: See the linux fops read documentation.
+ * @offset: See the linux fops read documentation.
  *
  * Wrapper around the drm_read function that makes sure the device is
  * processing the fifo if drm_read decides to wait.
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
