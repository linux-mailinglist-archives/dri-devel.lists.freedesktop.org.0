Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFE67025EC
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 09:18:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD1E10E149;
	Mon, 15 May 2023 07:18:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A3A10E07A
 for <dri-devel@lists.freedesktop.org>; Sat, 13 May 2023 10:12:27 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-64384c6797eso8718274b3a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 13 May 2023 03:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683972746; x=1686564746;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PHwu0DxgpIB80pv88TW8Dso6+AGWiv24hvrqwgEqHjA=;
 b=XVyTmzTf5rXbhKsCjh1WtQSbdmKYJyxcLQwGxd5+RMKcFhBIbGT8LDCBvwcniA25vZ
 DsHGro07Iv0PH8SXMduU+5cxeY4CuLd0ijDYzGMZ0r4aFVqRnPSnbLiKKWXuTIgOBk/D
 QuPV94WV/noyDx12wkg8kXkNOqI5BnupMuzz8/tTxlwh7VAO/fyfWABZfzOLYFgXRxoF
 YUq+u/Sj9WX6SRNljUgyJ+rs+iyFmed0qrVyzEL4MrAtHeHfZl9IfW1zwy16UA/u1ZZS
 Sm2JXn410KcREP7cv19yXDkW0kw8mkY/EEU+D3hwIp8z04zWcbrp/VmJPPSJafKYqWcN
 pT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683972746; x=1686564746;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PHwu0DxgpIB80pv88TW8Dso6+AGWiv24hvrqwgEqHjA=;
 b=giQFHJKa7nb11PJ5ODgi1sn/O/Tzp2DQ/BS7mCjc4gr7ne6wtKjRh/zUQt9tj+pLFR
 MDZSIbmX+2gQ8uZgafZICLqFRGEhlDsG30gcuOwFUEczbhgxEHC3QFVC13h0GXshAfec
 NCjKn0PgrR/Byc4Lekz8jaZ1AHV3mMgUCPT+12vsvMHWd2xKPQkBqzj9YDaLBW4RhpGM
 5SuCAu8Zx3UtAy8Ojr68ILTWv1KchBiK8M+ePhZB252wrjBy1UpkzbHzPO4kZ6nYeRrh
 rwjFvAn4slPBPEruc2pm9Ex4ILVZB1AEW7aGjs+pp2/Zk9lgCyJ37NhCwqt25A5xEfGp
 cGgQ==
X-Gm-Message-State: AC+VfDyuhFn8ZuMv8If4Q1SKtx2KQtdR5v0Ms46If7++ppK0RPPzaFzC
 yPkuMpMOw+IzUMoKyrRxkck=
X-Google-Smtp-Source: ACHHUZ7Xtl06MmK5GFgU1BKJpGGf3ZGDlO1Oejf6LXr526hxRYdZpANf6qKDQKVkuyQcrRwLKDUcmQ==
X-Received: by 2002:a05:6a00:1ad1:b0:648:fcfa:cc14 with SMTP id
 f17-20020a056a001ad100b00648fcfacc14mr13599419pfv.21.1683972746164; 
 Sat, 13 May 2023 03:12:26 -0700 (PDT)
Received: from yoga ([2400:1f00:13:e6d6:5993:330d:5f44:6315])
 by smtp.gmail.com with ESMTPSA id
 19-20020aa79213000000b00640df8c536csm8681463pfo.12.2023.05.13.03.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 May 2023 03:12:25 -0700 (PDT)
Date: Sat, 13 May 2023 15:42:17 +0530
From: Anup Sharma <anupnewsmail@gmail.com>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: drm: bridge: No need to set device_driver owner
Message-ID: <ZF9igb/nvL6GRBsq@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Mon, 15 May 2023 07:18:38 +0000
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
Cc: anupnewsmail@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need to exclusively set the .owner member of the struct
device_driver when defining the platform_driver struct. The Linux core
takes care of setting the .owner member as part of the call to
module_platform_driver() helper function.

Issue identified using the platform_no_drv_owner.cocci Coccinelle
semantic patch as:
drivers/gpu/drm/bridge/samsung-dsim.c:1957:6-11: No need to set .owner here.
The core will do it.

No functional changes are intended.

Signed-off-by: Anup Sharma <anupnewsmail@gmail.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index e0a402a85787..10dc3315e69e 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1954,7 +1954,6 @@ static struct platform_driver samsung_dsim_driver = {
 	.remove = samsung_dsim_remove,
 	.driver = {
 		   .name = "samsung-dsim",
-		   .owner = THIS_MODULE,
 		   .pm = &samsung_dsim_pm_ops,
 		   .of_match_table = samsung_dsim_of_match,
 	},
-- 
2.34.1

