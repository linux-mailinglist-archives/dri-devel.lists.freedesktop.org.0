Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1547920FB5B
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 20:06:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 788476E091;
	Tue, 30 Jun 2020 18:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE9D16E091
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 18:06:06 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f5so7786701ljj.10
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 11:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zM3QLSVuRc5t11YYc0eyAUVeFlCyX/4HEQGX3Y4hpeE=;
 b=JIPKTxxNNQd/sHhBRMOLoKZbZnwST/Qki9dwivkTLn7b34GpQD6DilHxuoUGwSR46j
 nDl2ktew4cUvXWh+Ik6ASe0E0mGZF5r/htVOcM+H8+jljCO7aIWQSxEQ/Acc2FofjouX
 v44OlNSgGcrjmHJvHf5Gy7menDqQ0YH/D3fYVj35KIin03CNa8mz5EzOJ9KPAhVpQ3Zf
 JAj2vjG8bBBf8NNSUQ3ZrBgOXJbvHmXIQVKoNR/Y8o0waDPh5Bi2SY7jDcDdw6rnRnqL
 EHvMRHR5yCdd6CtyDQwzfRLgDkICF49UadNtAjhIBrCm6gJzzd50a4O7AabM+utBPPNQ
 QM8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zM3QLSVuRc5t11YYc0eyAUVeFlCyX/4HEQGX3Y4hpeE=;
 b=ViUZ2bh1yBBensqyBzUUDufqqLHvL/TqeurgKxDKHyaTZdXtCYhhChmNXx7Vhn5MuU
 uRC9ZF2xgCYlqy/mWOvc8pr2lC63SsgSixjNjAbIBUpXZi58+4XBb/EHWbeptByXpPVB
 9Hqp6T3SMkU1TBSGRm9xlmHu+RbgfhGBrxB/e6/K1tb7yY0QD6XZpS2B7HXk0Yoo0Ulp
 S0AmHTD0+ruEYxE1NiZZMx2SUcKt6BcEdXbqK96yU7Kp41w/0qoIhQPX+oUHJVd7iyba
 aCGVYPthIb6R0gmzqjj00Jtc4iXANVFTjAI+Fg9ZGksZTZlLCwV+sWpgLqF46E9YYiNw
 HEVw==
X-Gm-Message-State: AOAM533dAVCHJr0/WX5I7P8WvU3z1AY03AmLcVarbc9JVCz8356cj3zR
 XwrCzYDLyNhM9mqXBH/uu+oIAhVzVU8=
X-Google-Smtp-Source: ABdhPJxyye6+JFaUrgWkfD0xC/3PGnNRL1Mlvy9ZV5QYt0D+qDei9nFrMk7u+TFxmsaOjnqGslnozg==
X-Received: by 2002:a2e:a410:: with SMTP id p16mr11214849ljn.231.1593540364950; 
 Tue, 30 Jun 2020 11:06:04 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:ddb6:1d37:ac40:1f27])
 by smtp.gmail.com with ESMTPSA id c14sm948208ljj.112.2020.06.30.11.06.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 11:06:04 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v1 7/7] drm/drm_connector: use inline comments for
 drm_bus_flags
Date: Tue, 30 Jun 2020 20:05:45 +0200
Message-Id: <20200630180545.1132217-8-sam@ravnborg.org>
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

Use inline comments for the drm_bus_flags enum.
This makes it easier to add more description comments in the future
should the need arise.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 include/drm/drm_connector.h | 100 +++++++++++++++++++++++++++---------
 1 file changed, 77 insertions(+), 23 deletions(-)

diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 7dc804488ccd..af145608b5ed 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -320,43 +320,97 @@ struct drm_monitor_range_info {
  * opposite edge of the driving edge. Transmitters and receivers may however
  * need to take other signal timings into account to convert between driving
  * and sample edges.
- *
- * @DRM_BUS_FLAG_DE_LOW:		The Data Enable signal is active low
- * @DRM_BUS_FLAG_DE_HIGH:		The Data Enable signal is active high
- * @DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE:	Data is driven on the rising edge of
- *					the pixel clock
- * @DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE:	Data is driven on the falling edge of
- *					the pixel clock
- * @DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE: Data is sampled on the rising edge of
- *					the pixel clock
- * @DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE: Data is sampled on the falling edge of
- *					the pixel clock
- * @DRM_BUS_FLAG_DATA_MSB_TO_LSB:	Data is transmitted MSB to LSB on the bus
- * @DRM_BUS_FLAG_DATA_LSB_TO_MSB:	Data is transmitted LSB to MSB on the bus
- * @DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE:	Sync signals are driven on the rising
- *					edge of the pixel clock
- * @DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE:	Sync signals are driven on the falling
- *					edge of the pixel clock
- * @DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE:	Sync signals are sampled on the rising
- *					edge of the pixel clock
- * @DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE:	Sync signals are sampled on the falling
- *					edge of the pixel clock
- * @DRM_BUS_FLAG_SHARP_SIGNALS:		Set if the Sharp-specific signals
- *					(SPL, CLS, PS, REV) must be used
  */
 enum drm_bus_flags {
+	/**
+	 * @DRM_BUS_FLAG_DE_LOW:
+	 *
+	 * The Data Enable signal is active low
+	 */
 	DRM_BUS_FLAG_DE_LOW = BIT(0),
+
+	/**
+	 * @DRM_BUS_FLAG_DE_HIGH:
+	 *
+	 * The Data Enable signal is active high
+	 */
 	DRM_BUS_FLAG_DE_HIGH = BIT(1),
+
+	/**
+	 * @DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE:
+	 *
+	 * Data is driven on the rising edge of the pixel clock
+	 */
 	DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE = BIT(2),
+
+	/**
+	 * @DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE:
+	 *
+	 * Data is driven on the falling edge of the pixel clock
+	 */
 	DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE = BIT(3),
+
+	/**
+	 * @DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE:
+	 *
+	 * Data is sampled on the rising edge of the pixel clock
+	 */
 	DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE = DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
+
+	/**
+	 * @DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE:
+	 *
+	 * Data is sampled on the falling edge of the pixel clock
+	 */
 	DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE = DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE,
+
+	/**
+	 * @DRM_BUS_FLAG_DATA_MSB_TO_LSB:
+	 *
+	 * Data is transmitted MSB to LSB on the bus
+	 */
 	DRM_BUS_FLAG_DATA_MSB_TO_LSB = BIT(4),
+
+	/**
+	 * @DRM_BUS_FLAG_DATA_LSB_TO_MSB:
+	 *
+	 * Data is transmitted LSB to MSB on the bus
+	 */
 	DRM_BUS_FLAG_DATA_LSB_TO_MSB = BIT(5),
+
+	/**
+	 * @DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE:
+	 *
+	 * Sync signals are driven on the rising edge of the pixel clock
+	 */
 	DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE = BIT(6),
+
+	/**
+	 * @DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE:
+	 *
+	 * Sync signals are driven on the falling edge of the pixel clock
+	 */
 	DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE = BIT(7),
+
+	/**
+	 * @DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE:
+	 *
+	 * Sync signals are sampled on the rising edge of the pixel clock
+	 */
 	DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE = DRM_BUS_FLAG_SYNC_DRIVE_NEGEDGE,
+
+	/**
+	 * @DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE:
+	 *
+	 * Sync signals are sampled on the falling edge of the pixel clock
+	 */
 	DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE = DRM_BUS_FLAG_SYNC_DRIVE_POSEDGE,
+
+	/**
+	 * @DRM_BUS_FLAG_SHARP_SIGNALS:
+	 *
+	 *  Set if the Sharp-specific signals (SPL, CLS, PS, REV) must be used
+	 */
 	DRM_BUS_FLAG_SHARP_SIGNALS = BIT(8),
 };
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
