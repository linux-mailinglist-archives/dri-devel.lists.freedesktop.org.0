Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2231213FE3
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 21:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E806B6EBAB;
	Fri,  3 Jul 2020 19:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF3A6EBAB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 19:24:28 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id t9so19074716lfl.5
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 12:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WOEfCwKuizYX3a4QPepXPk/wA2p4A47g4u9D3PirCBM=;
 b=sW8d7aVOiHC8/6Ecj6+0gXYCIUBai9yFj2nEqQB5KCdjSumshoLkewJ51yGLmmFVTp
 VAUKKPRp4h+HJiZ2dfd3Vl30DLhUfZ1tIxfJq+bnwEjlQ+EIr1ZPUpyGwvkFiPdi0sAM
 jsFD6LACOyUVY/AG0rdGkHQOMSQiSozQkOivjHYdLzXaT//tgy9xBARFcS8+tIZ9OOyq
 TozECv1JXtOLIdVjFhmrYJCTVAdNp+8S6ugQB37OnSMbj4MRJIdtpj7EZLhDas2z0ulA
 jB3q2Ia7VdukzKwD6ugpyF+gO7KTDtJgRteK8GeV7VdsGlqn0c5Ww9zeC3J3xlUrE77y
 hB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WOEfCwKuizYX3a4QPepXPk/wA2p4A47g4u9D3PirCBM=;
 b=BF2Vkpaj2UNdduj5kn3OYisAsp2lX4FH/CFBMub6wG8vAsXIVIVXaXBNrkfmLK9Rb3
 qrd7Rr3HxKm9vZdOgq3pIZe0AA+lsojbzxmEfafrAi+ooP/qkhVxwnNia+2HKEbGZACG
 +KtmEZDrKZ3Re6hUIbUC+6EASAPwRxpZjemPapVyBzaRQ+zL81fLr1Ub8gb5KvK+o4VZ
 NSaJW4Z7PG7rC/nZBtwCOHcBrPuU0wOJJDutvdc8j2lN0ywIaEZHITKmtTWVSOmcHRxv
 xqCXnIyio3wdBQrK1zNI4ray0he6HeeP0ba3YHLQqtFSzEtkpDfqowo81NmuueJRvHyH
 vhoA==
X-Gm-Message-State: AOAM530eG/smfLjgbt+K2BB32Rakbq+ifQCLQNgwba362QFeD3yjgigQ
 kKFBxnv8XVYhFWcEza13rhY94lhQLww=
X-Google-Smtp-Source: ABdhPJyvSUxT+dFL1Ae9Jw0GKs0HUhr/kbNzCuf7jLhAXTKtFqDp4L8YT+ViayThA46H+j42sVVjhw==
X-Received: by 2002:ac2:46f0:: with SMTP id q16mr23100613lfo.51.1593804266502; 
 Fri, 03 Jul 2020 12:24:26 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id y26sm4411791ljm.46.2020.07.03.12.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 12:24:26 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 01/21] drm/panel: add connector type to boe,
 hv070wsa-100 panel
Date: Fri,  3 Jul 2020 21:23:57 +0200
Message-Id: <20200703192417.372164-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703192417.372164-1-sam@ravnborg.org>
References: <20200703192417.372164-1-sam@ravnborg.org>
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
 Sam Ravnborg <sam@ravnborg.org>, kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The boe,hv070wsa-100 panel is a LVDS panel.
Fix connector type to reflect this.

With this change users of this panel do not have to specify the
connector type.

v3:
  - Drop PIXDATA bus_flag, not relevant

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
index 4f0ec5e5b0aa..7b5d212215e0 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1188,6 +1188,9 @@ static const struct panel_desc boe_hv070wsa = {
 		.width = 154,
 		.height = 90,
 	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
 static const struct drm_display_mode boe_nv101wxmn51_modes[] = {
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
