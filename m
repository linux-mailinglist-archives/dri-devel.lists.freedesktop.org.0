Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A055C5A21D7
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 09:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A6AA10E6D0;
	Fri, 26 Aug 2022 07:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E5310E6D0;
 Fri, 26 Aug 2022 07:28:27 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 r14-20020a17090a4dce00b001faa76931beso7288800pjl.1; 
 Fri, 26 Aug 2022 00:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=jTAWiNo/omAtLMeXfYZgyB0/HAK6wszJreXqF/7S7wI=;
 b=Mw00zfqC4T6VEtu20Rp2a+r5W186flt11PrO5MBPkuC9AKIvsEodr58v8llZfl2bcB
 Ez9huPudWeNGj1CXK90QSezqvUwejBlxia2MO7ZEg5tFc+yPyKNrrXnPZZ372asAA06o
 qfcOuFH2a7wCvxa5H78Y829Xlz7lftna7JXGqQR1Y/r94x3tJGTa+FODRpHCXoTl4Ek/
 K/V3SgnxNr/TvRxmw5h/oddjS6JWNn5H27l78eLbhfs2O29FwgFMHQHHXc/yFamb+qrf
 lT9q249MRU9opuU9/j5QUiUUIlInjxdJWSibgsrbYstcKCAeQX98M6a25iRJV999JWGq
 0l4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=jTAWiNo/omAtLMeXfYZgyB0/HAK6wszJreXqF/7S7wI=;
 b=c3HZ+xcINIhBZxqpHOJIPMhh/Zv2UvyDgeHLxkHJJweytLMV+h4rk2GHMaUAQu6OzX
 jJah0JlHKiBCf5bzbC9G11TNO/hU7jWZ5/WFm41BRYVkerZclv56qUYkTHo0wChDFvoW
 nTHRliB3Mql4IZpMOIO3fcjxZ7Y1hoFVAvoeWYuw8FBRA95/xTjhBYTo+Q/pameZSStq
 9pcI74oMt1TJwms6wI6fpoEZe3ksLmR9H3IiuNNgndJt78eEzVsi6pQqaf74KNsBiQom
 /Lf+btNSje2LtHy5jg2RJaFTnDq58d5lxDPwNPJ8DZJi9kN+An5TGNN6pRAbOjm4FSB+
 IXoA==
X-Gm-Message-State: ACgBeo1PxxiWh81r2bjrahRGr8Y7/g1enueyIMaauoPysIibZvOJOWjQ
 8lJQ7AbVJhwQ6Gkz8N8egaA=
X-Google-Smtp-Source: AA6agR4deiMjaahtMRHx2xJWavsJbeXhXn9hPdI2v0yMOGZpprcfeXeHoJiPulIpm1tqBOm1x4+G7A==
X-Received: by 2002:a17:902:db05:b0:172:f759:f989 with SMTP id
 m5-20020a170902db0500b00172f759f989mr2660471plx.58.1661498907566; 
 Fri, 26 Aug 2022 00:28:27 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a17090a3b0600b001fae01779c8sm941014pjc.7.2022.08.26.00.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 00:28:27 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: robdclark@gmail.com
Subject: [PATCH linux-next] drm/msm/dsi: Remove the unneeded result variable
Date: Fri, 26 Aug 2022 07:28:21 +0000
Message-Id: <20220826072821.253150-1-ye.xingchen@zte.com.cn>
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
Cc: freedreno@lists.freedesktop.org, dianders@chromium.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, vkoul@kernel.org, laurent.pinchart@ideasonboard.com,
 ye xingchen <ye.xingchen@zte.com.cn>, dmitry.baryshkov@linaro.org,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value msm_dsi_phy_enable() directly instead of storing it in
another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index cb84d185d73a..0b516a04945f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -141,14 +141,11 @@ static int enable_phy(struct msm_dsi *msm_dsi,
 		      struct msm_dsi_phy_shared_timings *shared_timings)
 {
 	struct msm_dsi_phy_clk_request clk_req;
-	int ret;
 	bool is_bonded_dsi = IS_BONDED_DSI();
 
 	msm_dsi_host_get_phy_clk_req(msm_dsi->host, &clk_req, is_bonded_dsi);
 
-	ret = msm_dsi_phy_enable(msm_dsi->phy, &clk_req, shared_timings);
-
-	return ret;
+	return msm_dsi_phy_enable(msm_dsi->phy, &clk_req, shared_timings);
 }
 
 static int
-- 
2.25.1
