Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE26203023
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 09:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C338A6E239;
	Mon, 22 Jun 2020 07:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17C289E8C
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 22:28:05 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id t74so8516165lff.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 15:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YGMVc7fYIskRhRxhgb+o8TAVuUeppcTSMbztCWrU0FY=;
 b=XHUShlUyPVq6qda8TU0xvOi8y2O9qsu0OR5kZtu2ADHQW4UmcHOkVG7+0R3wzTFYpH
 k/VCTFtLYqfo0TlPctn7IS/Q9Tg5CIyrN4GAGoI5d5Oh+mUDgWkCrLjnXJyC1SRuNhTY
 XZTXHhQJER/TUvPJtwP92g56QbRHuViCmbjQBIXRfUDzY3FQC5hPCluIP28Dlz7/Oa0/
 os3SaBzqwKWUXf/L3uEryuRIWyxGc2rr8t1c7O4rjoRZPbS87aowsbd/NzOb43eKI7Qn
 N8GQVlhLbAOCwIrKR2rkL0czj4VRCGV5+PhvZ1fEtev635KVbOR+QqvSX2y1tAdW1AAp
 PqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YGMVc7fYIskRhRxhgb+o8TAVuUeppcTSMbztCWrU0FY=;
 b=ixH4NeiIk//qKizZAi6Ex6pQdrOFCxdaX2kyJGyIrd9kSTn614j7q8dohs9fUDrOGi
 07+TEF8rAxaLpi/iGe/I/oXoPJ3K8eLYRzfXTdjEiZsWqYp+vmdToru9f+sYf3fU1UZV
 IjPF70Jw07mFK6xVCz3qE5vE+KjR9eMW6Q2PcYHAM5Iy+bDJSvmpSh3d1JW8fm8NncPP
 sq5zte++eSGnKyF5d1UO4hjAW7Y1fiQCDNXgmB7p8YR/fvl24hylTC8LxuBwsreSkS/G
 MUSJnXsvO2bn+zRJxWQI+JZQ0A/iAlVHgRmSKrsnC8cM2eyrZfMvhe8TCKNuqPiu7p1h
 VUHg==
X-Gm-Message-State: AOAM533KsDjY5RKQx5gtX6M96Z03il/Qilf1+bowrlT9rzgnoN//f8qF
 pPk8dO7Nqq8sWEbTrxu6Gsc=
X-Google-Smtp-Source: ABdhPJzDyKEijm/9WLODmqHtoi1wGcYSZF1ETm3VkOk7VWhQgi4MgfCFWtWz/0PrAWYB4ocjZrQynQ==
X-Received: by 2002:a19:e93:: with SMTP id 141mr8072563lfo.107.1592778484128; 
 Sun, 21 Jun 2020 15:28:04 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id 11sm2361295lju.118.2020.06.21.15.28.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2020 15:28:03 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 1/2] drm/panel-simple: Correct EDT ET057090DHU connector
 type
Date: Mon, 22 Jun 2020 01:27:41 +0300
Message-Id: <20200621222742.25695-2-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200621222742.25695-1-digetx@gmail.com>
References: <20200621222742.25695-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Jun 2020 07:07:47 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The EDT ET057090DHU panel has a DPI connector and not LVDS. This patch
corrects the panel's description.

Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Fixes: 94f07917ebe8 ("drm/panel-simple: Add missing connector type for some panels")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index ea6973d5cf54..87edd2bdf09a 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1588,7 +1588,7 @@ static const struct panel_desc edt_et057090dhu = {
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
-	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
 static const struct drm_display_mode edt_etm0700g0dh6_mode = {
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
