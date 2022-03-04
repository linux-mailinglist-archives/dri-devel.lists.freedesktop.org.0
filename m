Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2EC4CD788
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 16:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10ACB10FEBA;
	Fri,  4 Mar 2022 15:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D8F110FF0A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 15:18:51 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u10so11536793wra.9
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Mar 2022 07:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :in-reply-to:references;
 bh=/kLVO2mBjUg6ZEMThkrlP90TKZ1i1rq899x9t4LqlHM=;
 b=YALkyOAgCyJenPehbHsY90BofCy7G+amhHgULqRd/Ya1Hh8x8u7a9EppgJ4p/YNU/D
 nRuYTUWj3rnIBnuKO2+a6Kz/905FgrK08w/aKOcN9aRbB6lGZr3auUbLBEzqngMpNJOW
 9+0ISLqQUTiphuL5d8b2CKgp6jLZpU0NB7CkCOJ3T/wfOFp5HU7DTMoiD1avKpAqLTT8
 9OZ196Jz/mA50PiVKVTYxfvmForez6/pYJhMgU9l0wB5iirXmCuWuNDSvpyl6yoHgOBs
 DOC6255ugbau+MFveWfr9Z7ARAwwfCYSPFaKwcKvskVCWVQRcaaS9zhMW600Bq0h/VLA
 OiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=/kLVO2mBjUg6ZEMThkrlP90TKZ1i1rq899x9t4LqlHM=;
 b=elRYZSG408Z7LZu9errMe2NwrIAOGAQDeinqjd9djSzlNSexGLaVwmE7MZhklGO/UA
 /utH7IAdXAywPQi9i16ys5INYO/X3KuzuJ6TYhvsLg/Akt9NVpgvLvcrMNJ3mvkrny37
 s5JO8aNcEWWemMwghJvRWd/ZM84jGAnE4bTWMXNyY89tI/cRojgr11W6qla1mr1SyvhC
 sTvmB3I9EhOL4/yqBV+7AHZ/i8pH/WPMJtz1DRribH96O1sN2iFkvWlyKfHU6WVKEMv6
 3XG2uwHjZu6iEqssIW5RSJv9D0GNWSIC7DN+bdO6f2zIFcBH2IVsDVVZ2/2GXie7kSW7
 +3nw==
X-Gm-Message-State: AOAM5331rAuqlUytS46rlQ3D3vxb4l9n8A3SWwXwmI1K+pUzJf1WHOMb
 7Q3t2Etxw5Z6JILeNoglcXQwAA==
X-Google-Smtp-Source: ABdhPJxUvSN8wQ2WYUsQkxnb2Z8PYEhtCZSsHl89UOevi9ytxpI3iSl9byguTIFTfFug3ItOOu9OEg==
X-Received: by 2002:adf:902c:0:b0:1f0:4a72:feff with SMTP id
 h41-20020adf902c000000b001f04a72feffmr7481618wrh.190.1646407129660; 
 Fri, 04 Mar 2022 07:18:49 -0800 (PST)
Received: from dave-VirtualBox.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 r13-20020a5d498d000000b001f0587248c4sm4409711wrq.3.2022.03.04.07.18.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Mar 2022 07:18:48 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH V2 4/4] drm/bridge: Document the expected behaviour of DSI
 host controllers
Date: Fri,  4 Mar 2022 15:17:59 +0000
Message-Id: <41b8b82299dfa30962f98adc2fc43c1787df5598.1646406653.git.dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
In-Reply-To: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/gpu/drm-kms-helpers.rst |  7 +++++++
 drivers/gpu/drm/drm_bridge.c          | 39 +++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

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
index 70b513f5ce0d..32def1be682a 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -152,6 +152,45 @@
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
+ * &pre_enable_upstream_first flag to request the pre_enable (and
+ * post_disable) order to be altered to enable the DSI host first.
+ *
+ * Either the CRTC being enabled, or the DSI host enable operation should switch
+ * the host to actively transmitting video on the data lanes.
+ *
+ * The reverse also applies. The DSI host disable operation or stopping the CRTC
+ * should stop transmitting video, and the data lanes should return to the LP-11
+ * state. The DSI host &post_disable operation should disable the PHY.
+ * If the &pre_enable_upstream_first flag is set, then the DSI peripheral's
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
2.7.4

