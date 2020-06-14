Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 942331F8FC6
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703606E266;
	Mon, 15 Jun 2020 07:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81A926E029
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 02:40:08 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 49kzG016w3z9vHdS
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 02:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jo7DoENkQ1SE for <dri-devel@lists.freedesktop.org>;
 Sat, 13 Jun 2020 21:40:08 -0500 (CDT)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 49kzFz6ZXZz9vHdB
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 21:40:07 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 49kzFz6ZXZz9vHdB
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 49kzFz6ZXZz9vHdB
Received: by mail-il1-f200.google.com with SMTP id j71so9492212ilg.9
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 19:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cjw2EDUNWQmlGguDj5XMiD/z/+98wuHl/U5yK7YcmK8=;
 b=ns2HOH+9IxAgXPEwDFxUkuvCgvyKbVXx7DkZfncXFoBThyQnWFmpyp7tbMmE2iCgl3
 S8oBix/jeQEYV76MhfEOxw8aDjKpcQVZns4CH4CJG+wGRn1agUmbDRQSXkSBoanvB3Uu
 ZNI13YKN2eqm+598/batBVlAu1fWzLevA6ZitBI7dygE4QWFsHoep7G62Am6OiqYAKRf
 M1LjrdBSv7cYkk+/1CruR6B5i2dAqUIgDtWGBH/L/PtG7L8D3j8WH22EB32u00mNdfnv
 Ykyo0/1PgeM0OC1stJsny8PhrYzxaiZT/v5SMml1qqLOEZYdJe4ofRraXBsAPbpS7Wus
 nJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cjw2EDUNWQmlGguDj5XMiD/z/+98wuHl/U5yK7YcmK8=;
 b=qfYprWkvrVZ/Ca+7gHs+uAMkg5NDjXg/m5BKf3MviTMPNn0Zeaq4/zss6FLXl1QMOu
 vvK8DuSOSiLRJufXzaeiEhjNPbbD3EeKXX2L5plXEt7LTCWerdu6Gsc2WY65D/WLRpa5
 tjcl2UVjhp0feTG7p9Vad9pWYK2DgstUnvHjnkwP0rv6+LxA2qk9sWE/E/m5fCNkAsVN
 vDePnHkk6qDxZM+uX/PZgPIrt9rYsK/ByX9Pll7jsBlNEutX1ZnygRLbiWAJQoXSn8mv
 Cw0D4vcBckIrIPHxnqq0QY7Uf60qjh/rTxaEYZ2ToHvCowzp1x48T+alWrgowNmAZKfD
 glbA==
X-Gm-Message-State: AOAM530fdV+1dlT0oJmHYnSnoI3nkazg7LQgheKZVoBEG4A3GB0Qo2hm
 /ZxPpJdHJLudL4c83HFf0uR1wroJ0JNyxelW8ORKcwHWd/UTypCHsOnGGNrT9+tFveAdnUygBhr
 N8neuBH1Qa2of/xGVGpAb1T+xA2bt0Mkg
X-Received: by 2002:a92:4852:: with SMTP id v79mr19760141ila.172.1592102407585; 
 Sat, 13 Jun 2020 19:40:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLYZiX+rxdPmvbSe+AhVS/yXl4ftp+Ygbnt1X+F2sUaj6fwZpleI680VBHOfDvc36fjxCtPg==
X-Received: by 2002:a92:4852:: with SMTP id v79mr19760129ila.172.1592102407398; 
 Sat, 13 Jun 2020 19:40:07 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:49fa:9c47:e40b:9c40])
 by smtp.gmail.com with ESMTPSA id c85sm5869099ilg.41.2020.06.13.19.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 19:40:07 -0700 (PDT)
From: Aditya Pakki <pakki001@umn.edu>
To: pakki001@umn.edu
Subject: [PATCH] drm/bridge: fix reference count leaks due to
 pm_runtime_get_sync()
Date: Sat, 13 Jun 2020 21:40:05 -0500
Message-Id: <20200614024005.125578-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, wu000273@umn.edu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On calling pm_runtime_get_sync() the reference count of the device
is incremented. In case of failure, decrement the
reference count before returning the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/gpu/drm/bridge/cdns-dsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cdns-dsi.c b/drivers/gpu/drm/bridge/cdns-dsi.c
index 69c3892caee5..583cb8547106 100644
--- a/drivers/gpu/drm/bridge/cdns-dsi.c
+++ b/drivers/gpu/drm/bridge/cdns-dsi.c
@@ -788,8 +788,10 @@ static void cdns_dsi_bridge_enable(struct drm_bridge *bridge)
 	u32 tmp, reg_wakeup, div;
 	int nlanes;
 
-	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0))
+	if (WARN_ON(pm_runtime_get_sync(dsi->base.dev) < 0)) {
+		pm_runtime_put(dsi->base.dev);
 		return;
+	}
 
 	mode = &bridge->encoder->crtc->state->adjusted_mode;
 	nlanes = output->dev->lanes;
@@ -1028,8 +1030,10 @@ static ssize_t cdns_dsi_transfer(struct mipi_dsi_host *host,
 	int ret, i, tx_len, rx_len;
 
 	ret = pm_runtime_get_sync(host->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put(host->dev);
 		return ret;
+	}
 
 	cdns_dsi_init_link(dsi);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
