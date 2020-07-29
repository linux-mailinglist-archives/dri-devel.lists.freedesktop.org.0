Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8051231BD2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jul 2020 11:09:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703596E49C;
	Wed, 29 Jul 2020 09:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C856E49C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 09:09:25 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id d2so6973683lfj.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jul 2020 02:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7zup99TLcIgRJ9NV90EZiYa28tA8CgJqDxfrvBGx6Lw=;
 b=txK7UeP2lKnEmnN/Hbi1qPR3NA8UNah4slyPsCvAhtDIJP29fbig3z9uBLwBsyaLh2
 lW0ntDUV/QneT4Md+3SxsTwJm9fFRKI3e3zAT/pZJLljQtVzD6+5yCfqKzeMQYI7aXL4
 7Nu2WRkp51bnrXMJRjrOTlscT0cFIZ98ggvPPRp1J9KNfdcOHA/s32ZTVvqshNCn5LKw
 l9w4ORS43cSPO0aIuoS4jdJY7HUG1O7WZWOSKOIRoQP3Bu4Lp1iK8Nnq2YV1lMnGwhd1
 9988Ck/jtwsOuLCjJlaJzkwNOnoOxrTxd3ENL2XeT+a3UOEm/quM5KJo4HMFxpg5SXNw
 XHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7zup99TLcIgRJ9NV90EZiYa28tA8CgJqDxfrvBGx6Lw=;
 b=sLPGKqv/6ogcelKoXsos+oBWibDHqyNuhLLdReRtBoaPOD0c5nsk9p17pn7+70o7p2
 ZgdArM9ll44k4YMSKgw1WlCfQ6xor6IMrw070Y8a0kDI1SoBCOjwBm3otRdOj4ZkNFk6
 bVXvUXIkWr6aqew8uYpFlDlvwEP8BGx44q767gbpCGrlcNExReoxPhKX4qiHTNgYC73T
 O8ROp0uBkYtqqkyB4i3MD8rHbfVBVPfSJtpJ/1JdI9kzCRhxAjdrmW34BY7dPiP+q9RJ
 M/mSkA7k8UN+alwHhc1VIRcR4lexLXDUDhw/7Nwn8tNe2D7mWck9+SVxX8D5Jfnz0S1M
 BC7Q==
X-Gm-Message-State: AOAM531oGnKAdK3Yq1I08jU2CjGwDCE8H9frFrCEvOa4UPWkJNAmoKeD
 kI+9ZIzBxbefw8R8b2KW5mKmUtB/FkkKFQ==
X-Google-Smtp-Source: ABdhPJzVqhNlUZeUgeBMJB6+TZdwLOVuvNBK4S/10fE5grUVz3Uu0swtSg0g3D68qVyncMl0xE26mw==
X-Received: by 2002:a19:f105:: with SMTP id p5mr1826764lfh.118.1596013759846; 
 Wed, 29 Jul 2020 02:09:19 -0700 (PDT)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id x205sm313589lfa.96.2020.07.29.02.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 02:09:19 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Subject: [PATCH 1/2 v2] drm/mcde: Rename flow function
Date: Wed, 29 Jul 2020 11:09:14 +0200
Message-Id: <20200729090915.252730-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
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
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function mcde_display_send_one_frame() has a historical
name that stems from being implemented when the driver
only supported single frame updates.

Rename it mcde_start_flow() so that it reflects the current
usage.

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Collect Stephan's review tag.
---
 drivers/gpu/drm/mcde/mcde_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 4d2290f88edb..363fa5ca4b45 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -968,7 +968,7 @@ static void mcde_display_disable(struct drm_simple_display_pipe *pipe)
 	dev_info(drm->dev, "MCDE display is disabled\n");
 }
 
-static void mcde_display_send_one_frame(struct mcde *mcde)
+static void mcde_start_flow(struct mcde *mcde)
 {
 	/* Request a TE ACK */
 	if (mcde->te_sync)
@@ -1066,7 +1066,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 			 * is not active yet.
 			 */
 			if (mcde->flow_active == 0)
-				mcde_display_send_one_frame(mcde);
+				mcde_start_flow(mcde);
 		}
 		dev_info_once(mcde->dev, "sent first display update\n");
 	} else {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
