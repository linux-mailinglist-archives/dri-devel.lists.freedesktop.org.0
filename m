Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 553F3765A20
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 19:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3295310E1DC;
	Thu, 27 Jul 2023 17:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02DE10E1DC
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 17:24:48 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fbb281eec6so2146410e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 10:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690478687; x=1691083487;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cfAY1TAAVVSE5RYq1eJrVRqRcG4OMnAyQ2e2q78Puok=;
 b=zJOrvtns8Z2vb3m15iyxyxIsZv5J/01emj8duHWsqdLISx1XyUCiKkLYJuz4B3BITs
 8W2xFEjr0N+wHHeZ85Z9LMgO6NDz6+FyFl9E7RTrBYUyTkpXnEbwm24tqhKJbA674rTT
 PIeTwVhXyLUNFyRr37fgRgP+DESvRVnDkJDU1ghOe0b0F9k6iZrtILxmQqKEdEj4lVZz
 fEEr37gzChxM3wmdOGZqY+lNBcUolBV3y5gCeD3+lVzQOYVlTL1i/mZJz4VNuWwuc1N6
 br94S/ieY75evK7oLYhMlU8IiTT470veMZ9p2ocWGe0+ISM5LrAJUw06ApyJeQOSnako
 ENLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690478687; x=1691083487;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cfAY1TAAVVSE5RYq1eJrVRqRcG4OMnAyQ2e2q78Puok=;
 b=HRL5uxgubTfut5xu+ubFGZdO7Ch3Oq/kLMOZX9qsEeBo9VkG8kXmg9y91+6n0YZTUJ
 gU/p10XtxH64vDnN8frBOfHUGPnF+dPQ8C0Vv4OJ9EklELS6L/8N3ST+OmcZbzT2xiz+
 kCHxqgnHPCXEmuPFYXrYN+wj2D0zk5Oe9EU8XYryMLke3oRrH455zP4jb5r4QdHKoVoj
 pi+Jx0XEZKwyTAcVcrQL2J85K27mGOoQ/z8pWxb0L3fna72fuiGWhkab50kCwrIPfOeH
 i/T6V+j4PKuBaSR48XYhbcZhPm2844vnR7wsBG2HmJ9bQDN1gM9j26P3St9+tWPWYf3M
 AuvQ==
X-Gm-Message-State: ABy/qLbAu2oua8Yp56hAtrsnedTtUOhinetiuZXspfJlLwfwPHChAWBE
 8m/lhkmxZ/rVwMLQa5vYe3hQWQ==
X-Google-Smtp-Source: APBJJlHEqLtPhJ9YU9jzvL9DPx1acbxY7QDp2LU3wNoBkGODp1JilwG++mcShrJL13Z7BJdDQSvaaw==
X-Received: by 2002:a19:d61a:0:b0:4f8:6a29:b59b with SMTP id
 n26-20020a19d61a000000b004f86a29b59bmr2017612lfg.64.1690478686898; 
 Thu, 27 Jul 2023 10:24:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a19f00f000000b004fdfd4c1fcesm397305lfc.36.2023.07.27.10.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 10:24:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: panel: simple: specify bpc for
 powertip_ph800480t013_idf02
Date: Thu, 27 Jul 2023 20:24:45 +0300
Message-Id: <20230727172445.1548834-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Specify bpc value for the powertip_ph800480t013_idf02 panel to stop drm
code from complaining about unexpected bpc value (0).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a247a0e7c799..4c4c24ab4d12 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3207,6 +3207,7 @@ static const struct drm_display_mode powertip_ph800480t013_idf02_mode = {
 static const struct panel_desc powertip_ph800480t013_idf02  = {
 	.modes = &powertip_ph800480t013_idf02_mode,
 	.num_modes = 1,
+	.bpc = 8,
 	.size = {
 		.width = 152,
 		.height = 91,
-- 
2.39.2

