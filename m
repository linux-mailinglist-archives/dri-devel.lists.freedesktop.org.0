Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0D525552F
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E466E31D;
	Fri, 28 Aug 2020 07:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982CB6E491
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 08:27:58 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id k15so2919674pfc.12
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Fa/FRN51AnrOkZk0OKVdqIlVG6v9Zi3yinifrNAr+80=;
 b=lAgktEuIy34dp/IL4VO/nhPacZQjx7ZS/GCyeGhWta/d87/ZuyFrJyuXa5+XCeh8aY
 giY1uJQmPaVIllgUBTD6aq/USKvSqcZGHnGxGcxvokWkSD4TuR8D1y49FwOxq+wWyi2q
 T1wjNwRavC055dQg7/3fgRc+4sA7pltoprZBfNLqLcGHCSTg90myRn3shmZ3x39tVkMA
 LJybGFW6Yh6VSUMXP/ZRUZ7zxNA789r3+Yz4/lrOl+caDEmQRa6XhkI8vzPjfVTqvePr
 +m1ZYaHcAviJ8AvaOPaPbGNVYSgdggBMw0EbqPSk8FDdkMDQysmARMCWFiGfQWuHkoiL
 DUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Fa/FRN51AnrOkZk0OKVdqIlVG6v9Zi3yinifrNAr+80=;
 b=UgsMOGpQ+4LC5wum2N1vWlNUue7P3RhZvmGhQzkT+kooSk2gVhbL6O3MRPyKKTjJ3R
 CN5Y4qYr/BpO96Xnopgi6r+caw6eK/mzIfVhkpctHOC30wlbTE8WhlDQdPnq3UNW1PKo
 J2e2uUHqzmfwGU7wS/DWBPSV6JhhmIEAymqcenJ2/eGg8JwT67oUcW+3Fw2fuRumwjlX
 n65sQQEchMkuaYHvyKbmgBIkPRFJjuxDrG3NcIgl279+Ww6tMbBRJRNNe6uWbyySYzlo
 d6ZcaBDFwODpmQOI0v+162Fj2FTu2brTBNfNkTRaxV/mvDDLU8cFCJBz3AIP6BDi6LTK
 qQQg==
X-Gm-Message-State: AOAM531vmLt3GbqUCBBTdDZHI00TAX9VOon5W7MKnGJbh8GNqH4S6FYt
 yrTRPCh3zMq2UehyomRSjRY=
X-Google-Smtp-Source: ABdhPJw0wpighmqc7EmYHrVUF+WfEIiNTI/2BA3wK7bI2s3bMt5o33dbBjrJNfbucH+HlrS3SadA7A==
X-Received: by 2002:a63:4e56:: with SMTP id o22mr13163940pgl.381.1598516878036; 
 Thu, 27 Aug 2020 01:27:58 -0700 (PDT)
Received: from localhost.localdomain ([117.192.156.236])
 by smtp.gmail.com with ESMTPSA id ft11sm1443967pjb.13.2020.08.27.01.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 01:27:57 -0700 (PDT)
From: Vinay Simha BN <simhavcs@gmail.com>
To: 
Subject: [PATCH] drm/bridge/tc358775: Fix semicolon
Date: Thu, 27 Aug 2020 13:56:57 +0530
Message-Id: <1598516817-8240-1-git-send-email-simhavcs@gmail.com>
X-Mailer: git-send-email 2.1.2
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Vinay Simha BN <simhavcs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove unneded semicolon

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Vinay Simha BN <simhavcs@gmail.com>
---
 drivers/gpu/drm/bridge/tc358775.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index d951cdc..2272adc 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -485,7 +485,7 @@ static void tc_bridge_enable(struct drm_bridge *bridge)
 		val |= TC358775_LVCFG_PCLKDIV(DIVIDE_BY_6);
 	} else {
 		val |= TC358775_LVCFG_PCLKDIV(DIVIDE_BY_3);
-	};
+	}
 	d2l_write(tc->i2c, LVCFG, val);
 }
 
-- 
2.1.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
