Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C59139E80A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 22:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748476E9F6;
	Mon,  7 Jun 2021 20:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488576E9F6
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 20:08:03 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id r16so4734450ljk.9
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 13:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R/aSEseny+t4skNYeNp5Q/7qLv7ntl+DczO74CeA9u0=;
 b=mJ5RMqSNfv8CRhhy3IvBDHt3GvF32ri3Q6Fyz4VszmaGfp07SQBWbF9j2U/VxCAwII
 wi4AVP3g6Pm0nhqumM0WfuHcYLsvze/VsKIZGG2ukDgFvQV1MxsB5H3vkRgPEswdJewP
 8qAtmWH/q7cmLhYlWgkDxDTV+fq8DzVWqNzfHxzpKKcJzLj6Q5DD0XWd6exHGHboW1lR
 +atupy1ULl4ypR83ZMpp7EkofGelEzk/napseuAokj5NEfSVjlyNCiwcjf5qhG6ybL9w
 AODi54L7fwnXWlTcw5tWfXCiBLHamSvROmAEuNrYukzm0gTEDZBLRDojaOofOgsYZfHh
 jNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R/aSEseny+t4skNYeNp5Q/7qLv7ntl+DczO74CeA9u0=;
 b=R7sap2FcZJPa9Gua1bAGDdj4N+Q0f3qmPCfDVxXJwzoz6+VPLJ9ObcS3+Jww/EdBK9
 Uw4FtCuHZLopfeUJCOWa77i+sIGY7oUBRv7FlG7Orfux1MqFl9mkAdvTtpwaF2Zki4Rq
 IAv0tivlK15vu2NIFboIT+/hArqyEiRGP27dm4PqGijOKkjq6qYuWioruVu1xUcLceBs
 VJRKS7v0pdUqKsdGeFUPf3GyK/JoXSUOMqyes7cy0Cb03YH04D5PyMBq46e8I2bMKBdJ
 7wYMWqB9Qeh9dTBkROJnSjKPD1hco9fwnokJfYwhZzI1uAp+sEX0vXRUolSSe91GD8PU
 z3yw==
X-Gm-Message-State: AOAM532ZWtL5f7VhBfLBPGy+1yc7WASGAK+R/cpZBCDNEYBzzdXmPOUZ
 fQM8WtLrWcOjKYw2MRnukhHpSQ==
X-Google-Smtp-Source: ABdhPJzf2NMyyV8LmPjdH8FRYFPbBOQCW1kvD5rB4s7lnF2SYdhU+Uo4t5agw4fIgLhX/0/5IdgBLw==
X-Received: by 2002:a05:651c:210a:: with SMTP id
 a10mr15911071ljq.429.1623096481679; 
 Mon, 07 Jun 2021 13:08:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id g16sm1249315ljn.103.2021.06.07.13.08.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 13:08:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm: panel: simple: specify bpc for
 powertip_ph800480t013_idf02
Date: Mon,  7 Jun 2021 23:08:00 +0300
Message-Id: <20210607200800.2147207-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Specify bpc value for the powertip_ph800480t013_idf02 panel to stop drm
code from complaining about unexpected bpc value (0).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4e2dad314c79..e273bc2ab6b1 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3317,6 +3317,7 @@ static const struct drm_display_mode powertip_ph800480t013_idf02_mode = {
 static const struct panel_desc powertip_ph800480t013_idf02  = {
 	.modes = &powertip_ph800480t013_idf02_mode,
 	.num_modes = 1,
+	.bpc = 8,
 	.size = {
 		.width = 152,
 		.height = 91,
-- 
2.30.2

