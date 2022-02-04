Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EF14A9256
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 03:37:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BC910E9B6;
	Fri,  4 Feb 2022 02:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D3610E9B1
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Feb 2022 02:36:57 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id s16so3855690pgs.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 18:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4fvgDP0TYA9Uqj5YBQvKBYTNhHlt3ZEDwRBizbD22wQ=;
 b=jhz0XailvBor/LX2Yz5XHonjexoUmussH+CEZZuTvmefJULpgg9mKoLxdKEhmgMb0U
 whxizg5ROUhedEYv3RtW4MUXeYtSuln4QigVN4zVVUTVv0LM4JrL0Pv/qMLZSrhJ6BLy
 Kb9nmvaZ+fVuC03o65rE8apnro5ClGj96h/PdwSgkSnBkYt8j34oJsPqeh0NO+nMfMix
 zbOLyet2WUrhXINJfAjp8NQ7CS3MhyAF4ldg1U24kYdV+kLxhncZeZiciBMUlKx/Bkku
 Fx/KwkUqY1qVasI24hb8hAPeSpt308h6QJg1CVWcnYFimvD42a3tqIhx3IpNUVU0YWDY
 CgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4fvgDP0TYA9Uqj5YBQvKBYTNhHlt3ZEDwRBizbD22wQ=;
 b=Ioug9MImtunLCfPN3XZzRj1yqsMwswOsII4MjbBr8vGa2N1Mz7bV9WrKYq70Jkv341
 CPRdlXciwF03jqH3zpSPyjrBT/yBbP0uIvDSR7A6URik0Stm0XZsfkGbdhh+YalEXwk9
 M4QmYMq1jhoBWAeozM9rasX+P1mpjQZq9e9aZ8Ft5aBHe/QAU5MbTfwGRrYvXTzHsXyS
 +aswnJTFJeHpOvWAyS7wLz3rJRYr2NVWESiwdg/TZTkOzk7HxFpFQNKle0SSIP/ysR5u
 kQpbfA6cXF2K9YbUke4cy008922CD33bc+TyX9w/d6D1zZgNVFk5HWTLkx+ff5hkllTQ
 hhJQ==
X-Gm-Message-State: AOAM531MhEgb+cSY3IxC2w1evm7K8ohQfP6SZgS6lswwghqwVRmQcT/A
 ZC1KcSPOC03kr6v562h4vZUsevWOCxNQq9og
X-Google-Smtp-Source: ABdhPJxne2+hw31JZKM79eXKyu3bQhK0EUUnkvnzqUXoHRlqHJqV1qL+JhRQg8WAl9TOlQ5lSf/MLA==
X-Received: by 2002:a63:ed10:: with SMTP id d16mr756931pgi.17.1643942217191;
 Thu, 03 Feb 2022 18:36:57 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id p21sm351507pfh.89.2022.02.03.18.36.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 18:36:56 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/sprd: remove allow_fb_modifiers setting
Date: Fri,  4 Feb 2022 11:36:35 +0900
Message-Id: <20220204023635.15496-1-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
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
Cc: kernel test robot <lkp@intel.com>, Kevin Tang <kevin3.tang@gmail.com>,
 David Airlie <airlied@linux.ie>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 Baolin Wang <baolin.wang7@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Tomohito Esaki <etom@igel.co.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove allow_fb_modifiers setting in this driver. The allow_fb_modifiers
flag was removed.

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
Fixes: 3d082157a242 ("drm: remove allow_fb_modifiers")
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/sprd/sprd_drm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
index a077e2d4d721..54c851bccf5b 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.c
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -43,7 +43,6 @@ static void sprd_drm_mode_config_init(struct drm_device *drm)
 	drm->mode_config.min_height = 0;
 	drm->mode_config.max_width = 8192;
 	drm->mode_config.max_height = 8192;
-	drm->mode_config.allow_fb_modifiers = true;
 
 	drm->mode_config.funcs = &sprd_drm_mode_config_funcs;
 	drm->mode_config.helper_private = &sprd_drm_mode_config_helper;
-- 
2.17.1

