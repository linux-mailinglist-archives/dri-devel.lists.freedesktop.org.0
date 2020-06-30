Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 412B820FB59
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 20:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A89BF6E0B7;
	Tue, 30 Jun 2020 18:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A166E0B9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 18:06:05 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h19so23650275ljg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 11:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5g6HODAk2DBCjnx5JZW7GXPuVyTGvlIbzdH4kaUb6CI=;
 b=PxWUebACOzinV/cvM6lW1SF0YUIkfr1a4B58o2PFn8QBmlkmuvV0ZR4YM3StUCt+Ld
 j6PxZmb640gyby5YgLB8A71e2Xp2LBYDH+3QP+czWDKCF83IJ649I7HMQchipKWWVKky
 X5t51uz70Ai3JJ0A7CKpb7pTDG2j/0ysvlDbkiToNqCcanMuDYYK6EjdmcTNkNL+ibka
 +6NCwFMQ8/ysEXwcPvUwZ8U/4cEYTxQ5A9qtA+EuoNfystDhPH67fBonnN0noPyEF981
 nRLqsSLHIr74+eYDTogIurQICLyBEjM3tN+fsRQgmicF6SzIdP7w/pbomP2nPj+eqgMK
 nryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=5g6HODAk2DBCjnx5JZW7GXPuVyTGvlIbzdH4kaUb6CI=;
 b=qXIC4yZlZVz+vxy1rJdVb4giCNvRNBP8LJK7LqCDSCee29+z8MAR2E2h6knN+BsZ7r
 a8eHn4UdeOgz0h6fgmbiLtJH8zxFeQbjCQM0LX4mKlQ5Esw+bZA/sB0+iHHfEvZ8s539
 LcNnJDGHYYQkhbYIjZPfP4C4u+6yK+BOIuR3MbRf8Pcpy4emKO7ynM2SbTYBdpqkqzQd
 tmwxv6NEw6O0eqpBVPAKqCb+WJF61qMtNi5HIBheSDMrvH+8BAmgIv2sUAq2kTpC8bEm
 gvXafs4eIw1hJ5XNKihs8wOim8B6YyJEowiwnit7BN9XTdJirAQApx1QT4DLpk8pG91O
 r6Ng==
X-Gm-Message-State: AOAM533QhgpOBUjaWTRO2M2va/oxBnirY7jrml8H/wHMbb8uqVnAee0R
 /hJmpKL/tsvQDb9SVn5cjpIksfuFNi8=
X-Google-Smtp-Source: ABdhPJxpnrlLiH0gqoBgTf9HrxAUtr1iVRVxyB+sI+hRFha/hA6MkyjLbUjLAbwSTwRwRW77s+0NwQ==
X-Received: by 2002:a2e:9e87:: with SMTP id f7mr11640148ljk.44.1593540363238; 
 Tue, 30 Jun 2020 11:06:03 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:ddb6:1d37:ac40:1f27])
 by smtp.gmail.com with ESMTPSA id c14sm948208ljj.112.2020.06.30.11.06.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 11:06:02 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 6/7] drm/drm_connector: drop legacy drm_bus_flags values
Date: Tue, 30 Jun 2020 20:05:44 +0200
Message-Id: <20200630180545.1132217-7-sam@ravnborg.org>
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

Drop the now unused legacy drm_bus_flags values.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/drm/drm_connector.h | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 6a451b86c454..7dc804488ccd 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -323,8 +323,6 @@ struct drm_monitor_range_info {
  *
  * @DRM_BUS_FLAG_DE_LOW:		The Data Enable signal is active low
  * @DRM_BUS_FLAG_DE_HIGH:		The Data Enable signal is active high
- * @DRM_BUS_FLAG_PIXDATA_POSEDGE:	Legacy value, do not use
- * @DRM_BUS_FLAG_PIXDATA_NEGEDGE:	Legacy value, do not use
  * @DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE:	Data is driven on the rising edge of
  *					the pixel clock
  * @DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE:	Data is driven on the falling edge of
@@ -335,8 +333,6 @@ struct drm_monitor_range_info {
  *					the pixel clock
  * @DRM_BUS_FLAG_DATA_MSB_TO_LSB:	Data is transmitted MSB to LSB on the bus
  * @DRM_BUS_FLAG_DATA_LSB_TO_MSB:	Data is transmitted LSB to MSB on the bus
- * @DRM_BUS_FLAG_SYNC_POSEDGE:		Legacy value, do not use
- * @DRM_BUS_FLAG_SYNC_NEGEDGE:		Legacy value, do not use
  * @DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE:	Sync signals are driven on the rising
  *					edge of the pixel clock
  * @DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE:	Sync signals are driven on the falling
@@ -351,20 +347,16 @@ struct drm_monitor_range_info {
 enum drm_bus_flags {
 	DRM_BUS_FLAG_DE_LOW = BIT(0),
 	DRM_BUS_FLAG_DE_HIGH = BIT(1),
-	DRM_BUS_FLAG_PIXDATA_POSEDGE = BIT(2),
-	DRM_BUS_FLAG_PIXDATA_NEGEDGE = BIT(3),
-	DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE = DRM_BUS_FLAG_PIXDATA_POSEDGE,
-	DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE = DRM_BUS_FLAG_PIXDATA_NEGEDGE,
-	DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE = DRM_BUS_FLAG_PIXDATA_NEGEDGE,
-	DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE = DRM_BUS_FLAG_PIXDATA_POSEDGE,
+	DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE = BIT(2),
+	DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE = BIT(3),
+	DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE = DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+	DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
 	DRM_BUS_FLAG_DATA_MSB_TO_LSB = BIT(4),
 	DRM_BUS_FLAG_DATA_LSB_TO_MSB = BIT(5),
-	DRM_BUS_FLAG_SYNC_POSEDGE = BIT(6),
-	DRM_BUS_FLAG_SYNC_NEGEDGE = BIT(7),
-	DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE = DRM_BUS_FLAG_SYNC_POSEDGE,
-	DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE = DRM_BUS_FLAG_SYNC_NEGEDGE,
-	DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE = DRM_BUS_FLAG_SYNC_NEGEDGE,
-	DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE = DRM_BUS_FLAG_SYNC_POSEDGE,
+	DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE = BIT(6),
+	DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE = BIT(7),
+	DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE = DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE,
+	DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE = DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
 	DRM_BUS_FLAG_SHARP_SIGNALS = BIT(8),
 };
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
