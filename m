Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6304B8EB7
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 18:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7224B10E692;
	Wed, 16 Feb 2022 17:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB33810E692
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 17:00:25 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k1so4513912wrd.8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 09:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=85fOMykAiY7JDic7VgGviEqXv70DsVjV5eUzKH2VIuI=;
 b=P896e70Hn1ZiSwsxIXZmhWSoc9TuNDe6etu5R/N5V5RPCERCYHa+AQLMcvYm428Ae8
 94C0osO38fFDipqIWWCaxfu5qdrM5wg/uysxe+iZuzYNZtYW++jUT3g1+ZRqb/SNAl46
 J4E8zS/NFEKqMte6mUVRp7sHJRVskmDkwx8RiACY2yvHBQaqT6kUC8XNran5fDwLQJXo
 M8iMPZ9khpFxldIEtI11NJaSeu9KF2ZpdG7eCVbsxJT2S8wMFwpmU37EX17qq90Aq8tj
 1dAdDV3D+wwOw6IYlPsHsDNthFKkY5FMqvZFoI3kGXWLaKRvKELzoeIBc4LfU3VaNdR+
 v98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=85fOMykAiY7JDic7VgGviEqXv70DsVjV5eUzKH2VIuI=;
 b=UEqtslT7C+3TlqCVMBasYmSiJFTwLxieSlNv8jhpuI5m6+55C6wXz4KQb9bXzNd82V
 sSKgvf/s4PNie640x0KkTppgSuWFGeJpxQj6vOvMfgA28C1G+WdXOzjqY6eMzdu5tQ70
 a/i2gO2AbfLY5jSwNzbNCKEo47GhQ38rgOwpIvxUBg0g6aw0gkhHTn75SB8GpzWqjhtP
 HFjNRUC3HNAuX99EkcEyKfTyudShrNhtBlIbKl3LBdrACTIgWtfC01Va73rEhHyOHO8Q
 FFp2yfXouNLQLORMGFRFUejmAa0LBWH7qJ6gW+CWE8//xBzLl9FxlIBldSd60iBLhxzp
 vrsA==
X-Gm-Message-State: AOAM533LG38w4odqEoyr4oReq0CKbQJGMZ4ClaENcS5mTuZZAiUhWeQR
 n8AuwlPFvxDqaISnqfyONcUdyA==
X-Google-Smtp-Source: ABdhPJxCRpiX0ub70vTN4WNvfKDX+XnS+l2eKV3TV6vP4IHC3oOpEEwo9D3lGbU/xH38DJTOYe3NCQ==
X-Received: by 2002:a5d:67d0:0:b0:1e3:2f7d:ec0f with SMTP id
 n16-20020a5d67d0000000b001e32f7dec0fmr2946091wrw.672.1645030824219; 
 Wed, 16 Feb 2022 09:00:24 -0800 (PST)
Received: from dave-VirtualBox.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id g8sm24059322wrd.9.2022.02.16.09.00.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Feb 2022 09:00:23 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/bridge: Document the expected behaviour of DSI host
 controllers
Date: Wed, 16 Feb 2022 16:59:44 +0000
Message-Id: <85d0a4dbbe6c8ad7bc3fdd8ce719f6d418ce095e.1645029005.git.dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
In-Reply-To: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, andrzej.hajda@gmail.com,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The exact behaviour of DSI host controllers is not specified,
therefore define it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/gpu/drm-kms-helpers.rst |  7 +++++++
 drivers/gpu/drm/drm_bridge.c          | 38 +++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index c3ce91eecbc1..362afdb867c6 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -185,6 +185,13 @@ Bridge Helper Reference
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
index 7c24e8340efa..14c2ee9e0328 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -152,6 +152,44 @@
  * situation when probing.
  */
 
+/**
+ * DOC: dsi bridge operations
+ *
+ * DSI host interfaces are expected to be implemented as bridges rather than
+ * encoders, however there are a few aspects of their operation that need to
+ * be defined in order to provide a consistent interface.
+ *
+ * A DSI host should keep the PHY powered down until the pre_enable op is
+ * called. All lanes should be in an idle state (not LP-11) up to this point.
+ * pre_enable should initialise the PHY, set the data lanes to LP-11, and the
+ * clock lane to either LP-11 or HS dependent on the mode_flag
+ * MIPI_DSI_CLOCK_NON_CONTINUOUS.
+ *
+ * Ordinarily the downstream bridge DSI peripheral pre_enable will have been
+ * called before the DSI host. If the DSI peripheral requires LP-11 and/or
+ * the clock lane to be in HS mode prior to pre_enable, then it can set the
+ * DRM_BRIDGE_OP_UPSTREAM_FIRST flag to request the pre_enable (and
+ * post_disable) order to be altered to enable the DSI host first.
+ *
+ * Either the CRTC being enabled, or the DSI host enable op should switch the
+ * host to actively transmitting video on the data lanes.
+ *
+ * The reverse also applies. The DSI host disable op or stopping the CRTC should
+ * stop transmitting video, and the data lanes should return to the LP-11 state.
+ * The DSI host post_disable op should disable the PHY.
+ * If the DRM_BRIDGE_OP_UPSTREAM_FIRST flag is set, then the DSI peripheral's
+ * bridge post_disable will be called before the DSI host's post_disable.
+ *
+ * Whilst it is valid to call host_transfer prior to pre_enable or after
+ * post_disable, the exact state of the lanes is undefined at this point. The
+ * DSI host should initialise the interface, transmit the data, and then disable
+ * the interface again.
+ *
+ * Ultra Low Power State (ULPS) is not explicitly supported by DRM. If
+ * implemented, it therefore needs to be either handled entirely within the DSI
+ * Host driver.
+ */
+
 static DEFINE_MUTEX(bridge_lock);
 static LIST_HEAD(bridge_list);
 
-- 
2.7.4

