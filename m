Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE477F9263
	for <lists+dri-devel@lfdr.de>; Sun, 26 Nov 2023 11:56:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF6610E0EE;
	Sun, 26 Nov 2023 10:56:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E7510E0EE
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 10:56:40 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a02cc476581so431999966b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Nov 2023 02:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700996199; x=1701600999; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=I3GW50siPE3V/OZVTf7EbN7pnDFJwfRoAQudNo2WQ48=;
 b=IuNNmb0BqpeaADG0ZcNEM1XQQgJKsCID3/nEQBa++ED+jA8alqzKtyMexqOXYGRE5g
 AeKST+hDyKoByXI+BZ8rx8HqYWyCUPZrT8XOGVoseEyypVdaGtzH13h6ZzygWjkrACuP
 Ct3cq/M94LsRnwr6J0QG7H4lmkozefG6dYaOgb5PW2GPjqoRo/XNjoAASXfBoN0MB9bi
 CGZ2woUy2HoEeUe6+uhQLjB3HGJgJ/5peb3rlmFYjXri3QBPmvtyCHYl+22VEdXNi3dm
 vxeFB9VbSgm0F60LQua8fcPyUZ/bGxwiRvzfQ4oxKvi26PAWPa5pf6LJVEJaFnxwU+dF
 1VFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700996199; x=1701600999;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I3GW50siPE3V/OZVTf7EbN7pnDFJwfRoAQudNo2WQ48=;
 b=ELiY8YKg5lGRO3iNJOayasot1+spG9oiG+X4cnrMBGQV+tIDggsSBUuECSaUd077Pl
 iq/8EJCl7dW0i9WEtbc7HTDTo0PWrrt7aI3NkYyFY5fyfkMKZW6FafT0TAvXilqyDJYJ
 FKGDSz6yA7OqWffKESAMXRnGr56w+Em4JP7Y1tEvCjxZqsmg9duQ/jn1W+fyl4ZM5fU1
 aUWXxJrX16YbFJ0b3z/1htjwsHp9yMuExDhrUf7ZOwY0TQ6/TWM+Zm6b6hdwJNmf980j
 lxYewPr+nWHaCgYipssRutQ5EAO5BjYPBpNbRMWUzGZIx0N0t4/ZrtW8vCEmeHEsy83K
 3LRw==
X-Gm-Message-State: AOJu0YxkpBd8ShG59zDZln0GY3Ns8EWZNz6QiF+C0al5DNWQPLDTsqjb
 8NbZwOoEtkaoLfJLR72FuX8=
X-Google-Smtp-Source: AGHT+IHyK6mjmTRZ1o7XFvGUgHdwO4eWCrwMMAGqlF4KESwgSObaJJInGnzGUjM2H/elSkwoTRxo2g==
X-Received: by 2002:a17:906:209e:b0:a0a:f9af:c159 with SMTP id
 30-20020a170906209e00b00a0af9afc159mr3795403ejq.25.1700996198924; 
 Sun, 26 Nov 2023 02:56:38 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 r21-20020a170906351500b00a0bd234566bsm1763175eja.143.2023.11.26.02.56.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Nov 2023 02:56:38 -0800 (PST)
Message-ID: <eef4e548-0b5f-4ae5-725e-1cf706322a14@gmail.com>
Date: Sun, 26 Nov 2023 11:56:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 2/3] drm/rockchip: inno_hdmi: Switch encoder hooks to atomic
To: hjc@rock-chips.com, heiko@sntech.de
References: <2601b669-c570-f39d-8cf9-bff56c939912@gmail.com>
Content-Language: en-US
In-Reply-To: <2601b669-c570-f39d-8cf9-bff56c939912@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, mripard@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The inno_hdmi encoder still uses the non atomic variants
of enable and disable. Convert to their atomic equivalents.
In atomic mode there is no need to save the adjusted mode,
so remove the mode_set function.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---

Changed V1:
  Combined patches
  Include drm_atomic.h
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 46 ++++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index cc48cbf85f31..535cca30c256 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -5,6 +5,13 @@
  *    Yakir Yang <ykk@rock-chips.com>
  */

+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_simple_kms_helper.h>
+
 #include <linux/irq.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -16,12 +23,6 @@
 #include <linux/mutex.h>
 #include <linux/platform_device.h>

-#include <drm/drm_atomic_helper.h>
-#include <drm/drm_edid.h>
-#include <drm/drm_of.h>
-#include <drm/drm_probe_helper.h>
-#include <drm/drm_simple_kms_helper.h>
-
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_vop.h"

@@ -62,7 +63,6 @@ struct inno_hdmi {
 	unsigned int tmds_rate;

 	struct hdmi_data_info	hdmi_data;
-	struct drm_display_mode previous_mode;
 };

 static struct inno_hdmi *encoder_to_inno_hdmi(struct drm_encoder *encoder)
@@ -491,26 +491,27 @@ static int inno_hdmi_setup(struct inno_hdmi *hdmi,
 	return 0;
 }

-static void inno_hdmi_encoder_mode_set(struct drm_encoder *encoder,
-				       struct drm_display_mode *mode,
-				       struct drm_display_mode *adj_mode)
+static void inno_hdmi_encoder_enable(struct drm_encoder *encoder,
+				     struct drm_atomic_state *state)
 {
 	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;

-	inno_hdmi_setup(hdmi, adj_mode);
+	conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
+	if (WARN_ON(!conn_state))
+		return;

-	/* Store the display mode for plugin/DPMS poweron events */
-	drm_mode_copy(&hdmi->previous_mode, adj_mode);
-}
-
-static void inno_hdmi_encoder_enable(struct drm_encoder *encoder)
-{
-	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return;

+	inno_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
 	inno_hdmi_set_pwr_mode(hdmi, NORMAL);
 }

-static void inno_hdmi_encoder_disable(struct drm_encoder *encoder)
+static void inno_hdmi_encoder_disable(struct drm_encoder *encoder,
+				      struct drm_atomic_state *state)
 {
 	struct inno_hdmi *hdmi = encoder_to_inno_hdmi(encoder);

@@ -531,10 +532,9 @@ inno_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 }

 static struct drm_encoder_helper_funcs inno_hdmi_encoder_helper_funcs = {
-	.enable     = inno_hdmi_encoder_enable,
-	.disable    = inno_hdmi_encoder_disable,
-	.mode_set   = inno_hdmi_encoder_mode_set,
-	.atomic_check = inno_hdmi_encoder_atomic_check,
+	.atomic_check	= inno_hdmi_encoder_atomic_check,
+	.atomic_enable	= inno_hdmi_encoder_enable,
+	.atomic_disable	= inno_hdmi_encoder_disable,
 };

 static enum drm_connector_status
--
2.39.2

