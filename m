Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C2F20FB56
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 20:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F2316E071;
	Tue, 30 Jun 2020 18:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAC26E071
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 18:06:00 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f5so7786302ljj.10
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 11:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3M2RE/mUJuq9AnpGfXFkX/i/ib/JeKNbzwrCUtVmZVY=;
 b=OJhogIsHuACSZLyfr7GoI743Sc4jrnoQZZ1DvAWum4cMoVMUxlePQ+ljFLdExlaeib
 9kolFLKeemAttuaSwefo6D+7or6J7Kg1Lgceb89CUQYrnwuMMqazgNpL7XxgMJ88ouKO
 Kbr65M+PEQcLSUq/7pUHVFHsPvAEYx411hu8k+7pJNs3d33pKRLCuT39e3c6F9sL81+f
 zq8iNeIc0qKltuUPhQPW4LVl4lW5gBd7oWjWviR51nN8IKpum3Falykqkhg/ZFu1WGWu
 j2Z3Y3HJYGXg4SmnBh5LBTit8U8GnZvz6R5LlFBzE/EKjtTzdbyXm0NRyVKplaPgHecb
 o9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3M2RE/mUJuq9AnpGfXFkX/i/ib/JeKNbzwrCUtVmZVY=;
 b=ffO93dSOdbd8DwSxRnUEZsDzlv2rVLEANunG8xQ/skMaX9cM3CEYuGi/fD3+hrUHx5
 R7jCNOXXyekMomAvIWqhKZ+Mr+lgje9ci1vgf1bjD1y27HJUwqsxMJXIM9Q4gXiowN4j
 vKqgnXrN5T2Tx25sW1aASkHt1oa9Nslxtm4OlmuCN5b+HQp6jr5+SYNTBzGEpwQAAYCR
 /kQk5k5nO+e+KgBEnTfK+Q1t6yJZWs2pCteAfnGrN62yizdxSKULCqhg+bWPzBySgYzy
 L3uuMF5U/dT/T+Ai8efaaXLLDJpXRTJriJIzqsEZHJuV8wL7YIMbgsIJNuO7gijEAPGw
 YsTw==
X-Gm-Message-State: AOAM5317uzN2614MyrTTTTsAM3HPdkj04nFKM+50UPYdN6372PAh8qwo
 W7VI96VJJzSxQGZSqU0UkPUXSyk3qEM=
X-Google-Smtp-Source: ABdhPJzIELg1q8Tixiw8f/S8HRpuVy7Ce8WiDPpu6YB7R/ZkvLik4bM7AgvI3sOJ9EXOsabR7pgzlw==
X-Received: by 2002:a2e:9707:: with SMTP id r7mr3705764lji.203.1593540358416; 
 Tue, 30 Jun 2020 11:05:58 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:ddb6:1d37:ac40:1f27])
 by smtp.gmail.com with ESMTPSA id c14sm948208ljj.112.2020.06.30.11.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 11:05:57 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 3/7] drm/panel: raydium-rm67191: drop use of legacy
 drm_bus_flags
Date: Tue, 30 Jun 2020 20:05:41 +0200
Message-Id: <20200630180545.1132217-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200630180545.1132217-1-sam@ravnborg.org>
References: <20200630180545.1132217-1-sam@ravnborg.org>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Robert Chiras <robert.chiras@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the non-legacy drm_bus_flag _SAMPLE_ member.
No functional change.

Note:
DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE = DRM_BUS_FLAG_PIXDATA_NEGEDGE

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-raydium-rm67191.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67191.c b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
index d001c52e0ca9..57ff2b1f6361 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67191.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67191.c
@@ -192,7 +192,7 @@ static const u32 rad_bus_formats[] = {
 };
 
 static const u32 rad_bus_flags = DRM_BUS_FLAG_DE_LOW |
-				 DRM_BUS_FLAG_PIXDATA_NEGEDGE;
+				 DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE;
 
 struct rad_panel {
 	struct drm_panel panel;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
