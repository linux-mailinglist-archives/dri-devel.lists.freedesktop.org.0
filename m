Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E40474F24
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 01:25:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FC910E120;
	Wed, 15 Dec 2021 00:25:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0D710E120
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 00:25:31 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 nh10-20020a17090b364a00b001a69adad5ebso17557767pjb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 16:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4ie0cKAirDGTix4AW5nZqMbHaJVqohc1+9LbHt6dRbI=;
 b=dz3Isn3hHbXtldJlHtULb4EgoDF3TbUumHn2zXWWLmoyrP+FkeRsYQ6t9/GYbRto0A
 K8f2n9TZFD0XPEJPJoFmk/XvYtZA2sZYlM0mPo/+Wfb/ozXrEwMbFMk+MaT6vnLECrD0
 yt6cviMyl9M8tcNGJB8YU4ClRna/Jn0QxnF3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4ie0cKAirDGTix4AW5nZqMbHaJVqohc1+9LbHt6dRbI=;
 b=fWsTmr2J+TBSdsGDjmkkXcCF8NE1U1ZHF0NJc29cKXfQqJd3p0O0p8oTEVuzom30ti
 l5cXnbx6IbUp4xIhLIOETVGrbFGQvt6Hf0TYIbihoGAvOp3aZmeuTx9/5nSgQDaFilTM
 W7VLkYnHHODM7H0get5/Jk0qDeRl9+AjI6YBQ3bONN31Qb6l9Lwwwj77X10mXT1OH5H3
 gKgnoPKDSCkq5t+DvgZxfj9KbcNp297VNvned67H0sEsFMuGRFIknoeWxEvJg1ZsHrUb
 g8PYrpD/b6MoXMx1ODOm/yIp7MOY1xJtLW7q/Kvj/oEWcXhs9VOyEChESqmOQymMbIDD
 /BBA==
X-Gm-Message-State: AOAM533TMR/WkrTNyTY8uqvwXtkLTMHLzcaId2G4XUDY6eM3yg2+RT7Y
 S9UL3bezs+tLC6HE1c2zDU85uw==
X-Google-Smtp-Source: ABdhPJzET/clzh0hfclzzLyeMJC9G8FDCShSbvTUlZJUNyUiAvtMglTpvWsrWh/WnV82H9rwfIuSew==
X-Received: by 2002:a17:902:7c02:b0:148:a2f7:9d6d with SMTP id
 x2-20020a1709027c0200b00148a2f79d6dmr1942525pll.140.1639527931578; 
 Tue, 14 Dec 2021 16:25:31 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:46aa:90e5:f847:f509])
 by smtp.gmail.com with ESMTPSA id k18sm228347pfc.155.2021.12.14.16.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 16:25:31 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Set max register for regmap
Date: Tue, 14 Dec 2021 16:25:29 -0800
Message-Id: <20211215002529.382383-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
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
Cc: Rob Clark <robdclark@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the maximum register to 0xff so we can dump the registers for this
device in debugfs.

Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
Cc: Rob Clark <robdclark@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6154bed0af5b..83d06c16d4d7 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -188,6 +188,7 @@ static const struct regmap_config ti_sn65dsi86_regmap_config = {
 	.val_bits = 8,
 	.volatile_table = &ti_sn_bridge_volatile_table,
 	.cache_type = REGCACHE_NONE,
+	.max_register = 0xFF,
 };
 
 static void ti_sn65dsi86_write_u16(struct ti_sn65dsi86 *pdata,

base-commit: 136057256686de39cc3a07c2e39ef6bc43003ff6
-- 
https://chromeos.dev

