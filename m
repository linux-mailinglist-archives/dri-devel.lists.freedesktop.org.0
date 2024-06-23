Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7479137EF
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 07:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0995610E17E;
	Sun, 23 Jun 2024 05:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZAxYfscL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DE210E030
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 05:40:21 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so4000804e87.1
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719121220; x=1719726020; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=hbJUOmvW24quAtGM4HEWCKTnos6XbtfhPM+nK5+e2Tw=;
 b=ZAxYfscLnp+utpqJpWCXt6Wg3ld0yk4Fg2bn+Fl01fYindYOib7hcv6mXpV8BGZOhP
 3mgJGuBeg1XQAxv/HGmRj6/cnSXEbjtCBajSUIFqXlex1pf8HSvgYqKa+aCpbTfHQoZI
 ntnmJYbDEIAuYBPaf6+E91wQQA2pN1onLKSV3H3WXOdvh2fZbUA3NOI748Tntijpg3eb
 f1UIQ85gX6BZ+PRalZm+xeMhoYKZXBn7NO9AplFqSBS67B4dtraugSPbMAZ3L0rBUhMo
 q+C/7dzwTqjqMXqVUxqEOqSkdRElNUqD3koYIAH0ouWjV7uZj0z1AGJomwlhQ0l9guvn
 IBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719121220; x=1719726020;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hbJUOmvW24quAtGM4HEWCKTnos6XbtfhPM+nK5+e2Tw=;
 b=hK/uKc7FDOaKN2QtB9JQB7YYkEaiA1zmj1FPNQ4cRvv3oMGwEntNvZYyBW/2Ul8Dnu
 cvGxcYWJETCmvBCVFE/sQOWoX5lqtOjDYWRMrs9HnebF54Y714OdhyRfAhc8LW/lne/F
 tLA4tdMkhOZN4nWW2KIyNjfn3GzuWx7sph8PXIynVH9IhoVNAWy4WHn2WgnOWomGEs9p
 RjWudyrfHeb/2dVPgVKqC5PPdwj31riIGtYaLla1GgckjpXGlElimuk/jzJWyK9ghFnb
 mdKgId0Losg8x2YORwS8XqvxNJWYPx0prLnap1W6hdUo6lyCKs8kUy8nkLIj8pC37EDj
 2llg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCVvRDftbRhcOnTe2SgVbHwO9LNfLAITmxA7GIaYCUCfffCPg1qJ/yCep02v+Kffq9i4Vyojclqm6jo8w/i95XUSX0yoVj1cSEZuCl66a1
X-Gm-Message-State: AOJu0Yz+igmy+6uW2B6tolXeiu6Ex5q9loAva6ZdPjnkTVtXrRoosUpT
 +qTkkib74AEbrU67tV62S1SpocyrLwfKFRSI5E7PeEEoNHS9oqjduZEk6y3/eKw=
X-Google-Smtp-Source: AGHT+IFhjib/1suTVLnNKOG4CvpqSohWo8V1ebgg4ZYt51DXitjlM8EQ+GXNkC1wy0zWx1GrQbZ0kA==
X-Received: by 2002:a05:6512:348c:b0:52c:86d7:fa62 with SMTP id
 2adb3069b0e04-52ce061b1femr1263685e87.23.1719121220118; 
 Sat, 22 Jun 2024 22:40:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63bcd32sm659696e87.65.2024.06.22.22.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 22:40:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 08:40:13 +0300
Subject: [PATCH v2 2/2] drm/connector: automatically set immutable flag for
 max_bpc property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-2-8590d44912ce@linaro.org>
References: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
In-Reply-To: <20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Ogj1qgSBFy5LiaMGrph8HSRVcootU6FeEO747BTFj9E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd7VC9k3OnQtTnxxxl8WBd8EP07ZwSvEfxe83x
 9mlVUBtvXWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZne1QgAKCRCLPIo+Aiko
 1ZulB/9VGOjTN5uHSczSZCl5LY1tDsEZ8ElrPoAzIIMyxJpYuHzDj1DEP2L3SeTXmv3wCOuwzTc
 6bNUkw9AdXzeLJ/IGR/Xk+V/XA9lDA5rBPuJkdSCdWaHur06DeHT8KOxFv7G0NLTl6T5MU7yptb
 wQGBL+gk8cC92DjyVWJdKinJm5xjogNa/2cR8nHAa2PjDuQVFDRfgLs9rWbq4srehFPnwVIxIUa
 oxspq1UPaQ+j1MCtZHSzIdBfaVt8ZCP+d7c8ygH59JccJ/3jw1oACd1hGJMXkpneuj7uqb5DblK
 9wKM9mnJISq4t243XjfYVTg4SbCN4fWKN4q+6IxUytONLpQj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the introduction of the HDMI Connector framework the driver might
end up creating the max_bpc property with min = max = 8. IGT insists
that such properties carry the 'immutable' flag. Automatically set the
flag if the driver asks for the max_bpc property with min == max.

Fixes: aadb3e16b8f3 ("drm/connector: hdmi: Add output BPC to the connector state")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_connector.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index ab6ab7ff7ea8..33847fd63628 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2610,7 +2610,12 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 
 	prop = connector->max_bpc_property;
 	if (!prop) {
-		prop = drm_property_create_range(dev, 0, "max bpc", min, max);
+		u32 flags = 0;
+
+		if (min == max)
+			flags |= DRM_MODE_PROP_IMMUTABLE;
+
+		prop = drm_property_create_range(dev, flags, "max bpc", min, max);
 		if (!prop)
 			return -ENOMEM;
 

-- 
2.39.2

