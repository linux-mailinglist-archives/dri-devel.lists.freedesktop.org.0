Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 883FD372C32
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 16:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1276EB15;
	Tue,  4 May 2021 14:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0536EB15
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 14:39:17 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id m124so1804804pgm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 07:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fJxUztk87HDlZdXytL1WDKfEHMztqMj95QbnZpVdIm8=;
 b=LXY7otbqzp7kKh/WGFZ2KREYsyxMjV+ElUKfdrO2x79Hqa3npPows9h2lsddQzIuH7
 ch//Xg+YKtwOVuI+LjH2KlgILE1GwyJSZ4YDx5SSeFddlp9AjxXwlDS0SaypGA/IsMBV
 LbXWj8uKfYK6vf1k1Cj+JYv3agBtKNMf9Kd9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fJxUztk87HDlZdXytL1WDKfEHMztqMj95QbnZpVdIm8=;
 b=DX5cS3uHrU4QN8NHzcDfptKK2smv7iP2zJASEuTGa7NH0SPXK+3+T4BlqeSLtmR0xr
 4wz4y+yMdP33IOQsbFZGhdbKmaFZ9hgfCHzcSpagboqeumXGXOOGGqF05v2XjJ6PccGo
 gLim9Lhjmwhh/PhzOQ0YUWSXVzA4KsxKww7gG+PQzLZVFbJPLILuuX5rT4yBd6KKjODX
 87Wl361kRAAad0ls4AwDtDVzhzWTxIFuDqpxhpCSpwFdlv7+XdtEgJi5nqu8YNSGFxiZ
 hoazU46xshJwTCCEVvAOh9PRVZU8DInaYzH1p81Rc9dfBvCJa7COIkausbFo/lTf4woO
 5Dzw==
X-Gm-Message-State: AOAM533YY4eEtVHWq7DZyQWEpndV7QgBUGHNh7gtvW7zAqQMEGQ5XUu5
 pasVgf6QpnASUHIWMskptCvJYg==
X-Google-Smtp-Source: ABdhPJw7Jmt/AjPrttnmGcoLR0aC0LG87RUcyje7PjcMVtIZ+7a1Xg0Vhkc7A8l0u/emqKYNa4+E7g==
X-Received: by 2002:a62:3892:0:b029:250:4fac:7e30 with SMTP id
 f140-20020a6238920000b02902504fac7e30mr24502740pfa.81.1620139157421; 
 Tue, 04 May 2021 07:39:17 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:a592:ac50:b17b:5c43])
 by smtp.gmail.com with ESMTPSA id c6sm3948908pjs.11.2021.05.04.07.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 07:39:17 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH] drm/bridge: ti-sn65dsi86: Remove __exit from GPIO sub-driver
 remove helper
Date: Tue,  4 May 2021 07:38:54 -0700
Message-Id: <20210504073845.1.Ibf4194f4252846edaa0c6a6c7b86588f75ad5529@changeid>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
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
Cc: dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 kernel test robot <lkp@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Robert Foss <robert.foss@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ti_sn_gpio_unregister() is not just called from the remove path
but also from the error handling of the init path. That means it can't
have the __exit annotation.

Fixes: bf73537f411b ("drm/bridge: ti-sn65dsi86: Break GPIO and MIPI-to-eDP bridge into sub-drivers")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index db027528febd..bb0a0e1c6341 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1251,7 +1251,7 @@ static int __init ti_sn_gpio_register(void)
 	return auxiliary_driver_register(&ti_sn_gpio_driver);
 }
 
-static void __exit ti_sn_gpio_unregister(void)
+static void ti_sn_gpio_unregister(void)
 {
 	auxiliary_driver_unregister(&ti_sn_gpio_driver);
 }
-- 
2.31.1.527.g47e6f16901-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
