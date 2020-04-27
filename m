Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB2D1B99AA
	for <lists+dri-devel@lfdr.de>; Mon, 27 Apr 2020 10:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81FC189FA9;
	Mon, 27 Apr 2020 08:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BAE889FC8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 08:19:04 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j3so16558817ljg.8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 01:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kIuVBt97T5UczkNuF9X+lkh6xTeNv+7Pk07BQ4VWNXw=;
 b=ogN9nME0rmrlQewxQUx8bjhBhZwHwkyNI1+ZssHlM6LHCT03fzoucJBy+bxB21ygkl
 bxXuOpPQU/TRJbpQEgO2mK5+a07pbFUCL5guS/zYUL111dZo09+MxSBJSlO9ECkSxjqE
 zkOJWnhIgEgrTkxSW8DSSgayOJ8sTUCBBEfZ/pAT0Q56injXIWfrN4pHAmWjAXReRGi0
 HwT2ryVQxKgVgo7XDr/PrwBWLNhDXA5lHYEh2KNJE7UCTVgFcTlC4GbzaRwXDpHlVEsO
 LlrqgdurtOUAXp9H8V4SPVEVjrWmT8OgAF+W7wK/OvaennZT2OVUkeg+5IU0TydzhqOV
 /ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kIuVBt97T5UczkNuF9X+lkh6xTeNv+7Pk07BQ4VWNXw=;
 b=LTy+qW6VnoonDwMbGts3f9XdTw382fTzfiPwnR0z/xBkTWX/aEklbpnbqiL5QjbB0/
 DR0fn20v7WtJQ6vqIilXFMxckWkkw8F6hsWCTEFOCqe1KOv6JZUJ3udvq3eKvZxMBaA9
 Gjuyw/clyt+1lU79N874EJHhxPrMnUpdO30Ng/v/MSOSwEbt4hG7pw9o60ItXQVh2K3l
 vhvQv/L5UlS0R1a6+X9o2bw152HiD9+opaHseRy0s/sDxRjqzw8R2yZpN8MedTgUh2gp
 KLnnxaiJIbJ7d1HjTrZymaqCTezgorNSY5+yu2L/6AWxHkZj/7LYZWa9YAuexht+4vKn
 2rxw==
X-Gm-Message-State: AGi0PuYz2RqsqpdOjyLp0FV1QVhEJ5EPsEoDAfM2BK9YJaGF+OZmVWxF
 EsEfTqqWbRgB7dg46TonKZK82ikS
X-Google-Smtp-Source: APiQypKkiyy8d0BP1g6L2jbuXbn/k5R2cZIiGstHUVINddIom6GhXAwXREs0Cq2MBDKVQBymwEvYlA==
X-Received: by 2002:a2e:b5d2:: with SMTP id g18mr13680570ljn.51.1587975542513; 
 Mon, 27 Apr 2020 01:19:02 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 c20sm9846301ljk.59.2020.04.27.01.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 01:19:01 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 01/21] drm/panel: add connector type to boe,
 hv070wsa-100 panel
Date: Mon, 27 Apr 2020 10:18:30 +0200
Message-Id: <20200427081850.17512-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200427081850.17512-1-sam@ravnborg.org>
References: <20200427081850.17512-1-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Jonas Karlman <jonas@kwiboo.se>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The boe,hv070wsa-100 panel is a LVDS panel.
Fix connector type to reflect this.

With this change users of this panel do not have to specify the
connector type.

v2:
  - Add .bus_format (Laurent)
  - Add .bus_flags

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/panel/panel-simple.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 5e56c68fbd3e..80388706057e 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1128,6 +1128,9 @@ static const struct panel_desc boe_hv070wsa = {
 		.width = 154,
 		.height = 90,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_NEGEDGE,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
 static const struct drm_display_mode boe_nv101wxmn51_modes[] = {
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
