Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA32F4DA0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 15:51:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93BF96EA6B;
	Wed, 13 Jan 2021 14:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B5AA6EA64
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 14:50:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 3so1854229wmg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jan 2021 06:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9xOmpZJSJcGjkWdwzXh/1wdxHxk1qdbTp529iSzZw+A=;
 b=MymSG+nXTdHHBzQGPOze7DAAa+ej555u1BcqPgKwDdULmCR+9lifj/RBMgwbwLjlyt
 elvEBNHzvmvW/yms4fg79Qi5WzxgrFr7YClQKZgIpcNwnQ6ljdR5HdRdcTX3fA10rdIO
 aO30H/7nbBKrI5hxOWH6sSs6sEMtOANO1pinWzByh2d2GV3m/EpoTjowTDqX+0kZ8xaX
 liF75WImH8LTXSQqNUBp9HlqfewIAHFYh7spBcCRwDuq6cWAwda7+vnAqeuvQNX58v7P
 03COI9tjDj1PG/ZMJxlUk7Sxq24UPa6mvTMs6nk8c9qwdcBQeIG7i50znWEf+3nSQ5RB
 JzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9xOmpZJSJcGjkWdwzXh/1wdxHxk1qdbTp529iSzZw+A=;
 b=jKVuVopLCL3udHgA3+xINnolXvglvSG182iR4eZucMKfUf11y6neoNobjOweJZ3Ly/
 KOILGB6soaRAv0DXXcl06smpvn92JO/m4IinTgOblXzBO6d7bmuUyWZ1rK6KN2lg86CG
 zNPDN9traY56KRAfprM8J+q8b/qwfYXmuNZ4mxiD9z4/iS9ktDAusQEnjXjmcwHjfrt+
 GWd9acoBs15yEY/eWAiLCQfdYDqyrtWCil3qOGtl9UI2ZDHGCFQXvLjklSNwK/b43Jlf
 qtagPeao0BXkYNT1rekI2YDerWI/4cjyLisCyvifxFAVdGjUxxO4xIGF4wlKy18JzPvq
 Mbag==
X-Gm-Message-State: AOAM532IGYqlYY+hfGyNQySbP0HgDuhKQFJfoiBqmm49BCqNOxekvgF2
 T6g5g8I/eKVyfIL+PPBmCu6MGA==
X-Google-Smtp-Source: ABdhPJy1eR+KY9VjvEkheIzVcqWp7XoiAxVirwoH+ntCmyxPC42Czfx3zHGSaOqSDxojIeI3efM6eQ==
X-Received: by 2002:a05:600c:29cc:: with SMTP id
 s12mr1724821wmd.180.1610549453390; 
 Wed, 13 Jan 2021 06:50:53 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t188sm3273433wmf.9.2021.01.13.06.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 06:50:52 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 28/31] video: fbdev: cirrusfb: Add description for 'info' and
 correct spelling of 'regbase'
Date: Wed, 13 Jan 2021 14:50:06 +0000
Message-Id: <20210113145009.1272040-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210113145009.1272040-1-lee.jones@linaro.org>
References: <20210113145009.1272040-1-lee.jones@linaro.org>
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
Cc: linux-fbdev@vger.kernel.org, Jeff Garzik <jgarzik@pobox.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/video/fbdev/cirrusfb.c:2815: warning: Function parameter or member 'info' not described in 'cirrusfb_dbg_print_regs'
 drivers/video/fbdev/cirrusfb.c:2815: warning: Function parameter or member 'regbase' not described in 'cirrusfb_dbg_print_regs'
 drivers/video/fbdev/cirrusfb.c:2815: warning: Excess function parameter 'base' description in 'cirrusfb_dbg_print_regs'
 drivers/video/fbdev/cirrusfb.c:2859: warning: Function parameter or member 'info' not described in 'cirrusfb_dbg_reg_dump'
 drivers/video/fbdev/cirrusfb.c:2859: warning: Function parameter or member 'regbase' not described in 'cirrusfb_dbg_reg_dump'
 drivers/video/fbdev/cirrusfb.c:2859: warning: Excess function parameter 'base' description in 'cirrusfb_dbg_reg_dump'

Cc: Jeff Garzik <jgarzik@pobox.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/cirrusfb.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index f05160fa34da9..bb2cc753c1cf5 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -2800,7 +2800,8 @@ static void bestclock(long freq, int *nom, int *den, int *div)
 
 /**
  * cirrusfb_dbg_print_regs
- * @base: If using newmmio, the newmmio base address, otherwise %NULL
+ * @info: frame buffer info structure
+ * @regbase: If using newmmio, the newmmio base address, otherwise %NULL
  * @reg_class: type of registers to read: %CRT, or %SEQ
  *
  * DESCRIPTION:
@@ -2847,7 +2848,8 @@ static void cirrusfb_dbg_print_regs(struct fb_info *info,
 
 /**
  * cirrusfb_dbg_reg_dump
- * @base: If using newmmio, the newmmio base address, otherwise %NULL
+ * @info: frame buffer info structure
+ * @regbase: If using newmmio, the newmmio base address, otherwise %NULL
  *
  * DESCRIPTION:
  * Dumps a list of interesting VGA and CIRRUSFB registers.  If @base is %NULL,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
