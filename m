Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C802642EE4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 18:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39B410E26D;
	Mon,  5 Dec 2022 17:34:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A8510E26C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 17:33:52 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id o5so19764356wrm.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 09:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tJEwg+HGFHgbbDHyNHMMw1IwQlAdl2r5yFKGdkId1Z4=;
 b=MehxKT5Obo3Sk65ES/RTmIkfnCHQKynRfkAi8eNxE5+WES/+jnmVf0TMgzM2vtkmas
 4NeBnU83Z/rksywEQFPnhz3ox5NL+NTGJv+SyhvYl1vTRID0R896XjJ3AdWjFuRf2GWk
 JPNIMRHU3iF46hY9jBoncfOkzAIQgqYO5AvAgLYaya14iUObKGvni6H+tCT5ihvZCleo
 x62qTrHH24BT/TBf2CqQwylX00y91OSo+3N+Xmq9QvslUVYimBCwwEa8tl8O2w3x6BmU
 jCXkBhuVwNJEzXKUUYVqoFwr2XpWa0DtWQxg0LznVebxSao2DKoMAvFJAAClkgdFUxvv
 HuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tJEwg+HGFHgbbDHyNHMMw1IwQlAdl2r5yFKGdkId1Z4=;
 b=z9fy/R91Ynmncn4C686qRbLluEArqJSxJyiHRyJbkFHVhXVlHemOPzKSYTzRc+Zi3F
 xUvDqIRmkRabMYNTN3O3dFu41L20Aku1eeSiEgyI7x/uEBCuEa/Sh2mNU3md7q6AAyFS
 MI0cHIc0hwcv2OfxqypJ3BjilYufqo28Tzmu3nkKKRlFxIJBBx3R4qa+d+oiCqvi6rwg
 d4I1gW353VUvnT1oO7KTG2g1HWG90WQaAy899+uhl1vjAt+Ou5bCrL7ZTrSmiNw338ZL
 U4PT61gnGRnnvTrHB0x7gnGaZylDKcIFoNgyaDyH5WGmJ+zZHdZtXPhKplGc/gOPzPoD
 t8qw==
X-Gm-Message-State: ANoB5pmR7WDGMcrxlq3aJWzAuCGtZmijrjVPPEiqkQ9MgKfG8/sz8KPr
 LlU37zy6OF9JNH0fUL8YSs344A==
X-Google-Smtp-Source: AA0mqf454IqzP6YvX8azvCLrb2AIq2nBAGFDooTsedq6mSUI36F3tXYI5JmthByRmmKulby4tIP1Aw==
X-Received: by 2002:adf:e2cd:0:b0:236:68aa:8da9 with SMTP id
 d13-20020adfe2cd000000b0023668aa8da9mr48450836wrj.442.1670261631413; 
 Mon, 05 Dec 2022 09:33:51 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 v15-20020a5d6b0f000000b002421ed1d8c8sm14524245wrw.103.2022.12.05.09.33.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 09:33:51 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 6/6] drm/bridge: Document the expected behaviour of DSI
 host controllers
Date: Mon,  5 Dec 2022 17:33:28 +0000
Message-Id: <20221205173328.1395350-7-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205173328.1395350-1-dave.stevenson@raspberrypi.com>
References: <20221205173328.1395350-1-dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, andrzej.hajda@gmail.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The exact behaviour of DSI host controllers is not specified,
therefore define it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/gpu/drm-kms-helpers.rst |  7 +++++
 drivers/gpu/drm/drm_bridge.c          | 39 +++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index a4860ffd6e86..b8ab05e42dbb 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -188,6 +188,13 @@ Bridge Helper Reference
 .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
    :export:
 
+MIPI-DSI bridge operation
+-------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
+   :doc: dsi bridge operations
+
+
 Bridge Connector Helper Reference
 ---------------------------------
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 5f40c83b1b42..c3d69af02e79 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -153,6 +153,45 @@
  * situation when probing.
  */
 
+/**
+ * DOC: dsi bridge operations
+ *
+ * DSI host interfaces are expected to be implemented as bridges rather than
+ * encoders, however there are a few aspects of their operation that need to
+ * be defined in order to provide a consistent interface.
+ *
+ * A DSI host should keep the PHY powered down until the pre_enable operation is
+ * called. All lanes are in an undefined idle state up to this point, and it
+ * must not be assumed that it is LP-11.
+ * pre_enable should initialise the PHY, set the data lanes to LP-11, and the
+ * clock lane to either LP-11 or HS depending on the mode_flag
+ * %MIPI_DSI_CLOCK_NON_CONTINUOUS.
+ *
+ * Ordinarily the downstream bridge DSI peripheral pre_enable will have been
+ * called before the DSI host. If the DSI peripheral requires LP-11 and/or
+ * the clock lane to be in HS mode prior to pre_enable, then it can set the
+ * &pre_enable_prev_first flag to request the pre_enable (and
+ * post_disable) order to be altered to enable the DSI host first.
+ *
+ * Either the CRTC being enabled, or the DSI host enable operation should switch
+ * the host to actively transmitting video on the data lanes.
+ *
+ * The reverse also applies. The DSI host disable operation or stopping the CRTC
+ * should stop transmitting video, and the data lanes should return to the LP-11
+ * state. The DSI host &post_disable operation should disable the PHY.
+ * If the &pre_enable_prev_first flag is set, then the DSI peripheral's
+ * bridge &post_disable will be called before the DSI host's post_disable.
+ *
+ * Whilst it is valid to call &host_transfer prior to pre_enable or after
+ * post_disable, the exact state of the lanes is undefined at this point. The
+ * DSI host should initialise the interface, transmit the data, and then disable
+ * the interface again.
+ *
+ * Ultra Low Power State (ULPS) is not explicitly supported by DRM. If
+ * implemented, it therefore needs to be handled entirely within the DSI Host
+ * driver.
+ */
+
 static DEFINE_MUTEX(bridge_lock);
 static LIST_HEAD(bridge_list);
 
-- 
2.34.1

