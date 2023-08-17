Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CB077FC58
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 18:49:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B807C10E097;
	Thu, 17 Aug 2023 16:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91D810E097
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 16:49:04 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6887b3613e4so2113312b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 09:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1692290944; x=1692895744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gP/+HX8tff5J7C1dVpOFmStGY34cS59+ah5Jqhr0qQ4=;
 b=HanMEXUDwyG1Ey2rPH3QP5JdIubd+ihoyATb0QBayRB/ONa5VMdVHpRhU9WoTypSy7
 Ta3y8sF8WJrowBXiNZH6rT1fQgcZuF/h0VpHyQ3uYzlCJlvakO84AZ2z1c7iN7albAcP
 2IAVJpLqJyUY6/V3KsXzvdsYzFfZGp0FzRD3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692290944; x=1692895744;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gP/+HX8tff5J7C1dVpOFmStGY34cS59+ah5Jqhr0qQ4=;
 b=XJf7gxhs0qy3ppmB/ixnNwtYQxVnEiiKR0DATiKdxrYKrNi+Q5XwkRmSlrsZxvnK3y
 JOxTaT4VI2j49gXII2oooXnlHbfzGwpaK0wYyoA0LTCXfw0ZbJrnC/wnfJoEduvHcS49
 ZWDIrXq0nrFP1NzZHymH6kE1GY7NalN+YWUcZmReaxFjpTbA/ZNs1P6SZPvUzWXeroY4
 jUqx3FljiKUYvxiUueFC2+LhuK/KMXGzW1glEPFFNfgEtvTpxSFv4sNNqp+7sAXSZlJX
 rBzcQRjLnIYXFcJ18FU8WzwnAciquIhCCf+iaha615RsXS4Jc/XwKD07L8uvnoOyqgJ3
 9jFA==
X-Gm-Message-State: AOJu0YzrLBErPM5PNj67gcok+mR6pvJhBMT6tdHRW6n2Mwy95xQLfPLM
 VGrt+EN+uqGex8WIzRkkDd6+sAs9m0l7Gt7FP7fAp12O
X-Google-Smtp-Source: AGHT+IG5HtCnsJr+Qd3MkrklMr6FAcaFlWe6RUsfkPHTrmoEIk0vkUIXUn7KSIq/2M4+8rT3kKHLGQ==
X-Received: by 2002:aa7:8890:0:b0:67a:8fc7:1b61 with SMTP id
 z16-20020aa78890000000b0067a8fc71b61mr86709pfe.11.1692290943715; 
 Thu, 17 Aug 2023 09:49:03 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:2d64:9188:a5b0:3e0a])
 by smtp.gmail.com with ESMTPSA id
 e26-20020aa7825a000000b00686dd062207sm13096073pfn.150.2023.08.17.09.49.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 09:49:03 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: Fix kernel-doc typo in desc of output_bus_cfg in
 drm_bridge_state
Date: Thu, 17 Aug 2023 09:48:09 -0700
Message-ID: <20230817094808.1.I41b04c3a8305c9f1c17af886c327941c5136ca3b@changeid>
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's an obvious copy-paste error in the description of
output_bus_cfg. Fix it.

Fixes: f32df58acc68 ("drm/bridge: Add the necessary bits to support bus format negotiation")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/drm/drm_atomic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 9a022caacf93..cf8e1220a4ac 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1126,7 +1126,7 @@ struct drm_bridge_state {
 	struct drm_bus_cfg input_bus_cfg;
 
 	/**
-	 * @output_bus_cfg: input bus configuration
+	 * @output_bus_cfg: output bus configuration
 	 */
 	struct drm_bus_cfg output_bus_cfg;
 };
-- 
2.41.0.694.ge786442a9b-goog

