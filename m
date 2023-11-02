Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 857B07DF418
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 14:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BBC10E8BC;
	Thu,  2 Nov 2023 13:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB34410E8BC
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 13:42:07 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so1580959a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 06:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698932526; x=1699537326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=lK/vWnmM0KVaM6vCg3VvvClqSJH14OWzepShm2ndJ8I=;
 b=SiBZoPZI8+eQc+EqWJH3bkGGj1S6xdCLuV0rkS12qNHx79eqFQwybxTVhulv0cKS5q
 Saks8pulRwzUA0JrFu7e8tkUk6LKlbDyu7VNDng1K3llX6fjZaHn/nPdJYJDM4GN+J+W
 5r8tOADni29i29edOzdSzQxT9D8LrenjByr1VxgUlrHrnCTjFRt3jJq9UoG8fQa+373o
 ifHygL3DsxmYEosabUCmIsrbQg2iubv66HlSONNVQvRmika4mSxpp4JiVxbEe/48D4o5
 FbddHywbhGhxSwtWSZ7nNBv7Y1yeVqgsaFCdzO7Ga2rbP8AI48dfdo0D/IKw7K4D6EY7
 JQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698932526; x=1699537326;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lK/vWnmM0KVaM6vCg3VvvClqSJH14OWzepShm2ndJ8I=;
 b=YYRdLKo5tauiqO2AZ6qGwcOCJvXIeLXnu3mlZccGzt++45bxgM4i09VpICM9IL3oJB
 DJrC5pTmHhnGqHy7I9FM38cYfB+DoUO5Az+KMojTdeU1/SZvLWUIoyZsWQVckczu2OzT
 HVfgVvaX4xBgZaTGuDp0mU82ExVqnP9vCsb/dKWOdaSbtpOgksshcZpzBGXHa2pgcq8/
 QNyMw0ZdK7vbn+flxCtviP41KessqiJIA5x89LlBSl+DyRoZGPJxdPZVGEq7mf1g9gL+
 3tG2D7nAubQsGnA6x1E7eGGSfrciLd6zRjGEkOyoJm3qZ2rhMJTX2T+1hrYlvgv0muUD
 VetQ==
X-Gm-Message-State: AOJu0YwDcQWtWksbwjIeQWYay+unbEXqHaVSkSQt4Tv5AyBAlnFgZ06Z
 DDD8PHoGGAkIdf6CM50kuao=
X-Google-Smtp-Source: AGHT+IGV7tL5vnuqy+ywj5JlmDgSzOHEisn1VYUrvxqfFveF+L1CIsGQpPMLlZCZMZDql2U/Dza06A==
X-Received: by 2002:a50:9544:0:b0:543:595a:8280 with SMTP id
 v4-20020a509544000000b00543595a8280mr7749934eda.37.1698932526017; 
 Thu, 02 Nov 2023 06:42:06 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 q32-20020a05640224a000b0054130b1bc77sm2347915eda.51.2023.11.02.06.42.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 06:42:05 -0700 (PDT)
Message-ID: <034c3446-d619-f4c3-3aaa-ab51dc19d07f@gmail.com>
Date: Thu, 2 Nov 2023 14:42:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 2/4] drm/rockchip: rk3066_hdmi: Switch encoder hooks to
 atomic
To: hjc@rock-chips.com, heiko@sntech.de
References: <cda574be-4f33-b66d-eb14-92c2b31d241e@gmail.com>
Content-Language: en-US
In-Reply-To: <cda574be-4f33-b66d-eb14-92c2b31d241e@gmail.com>
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
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The rk3066_hdmi encoder still uses the non atomic variants
of enable and disable. Convert to their atomic equivalents.
In atomic mode there is no need to save the adjusted mode,
so remove the mode_set function.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 35 +++++++++++++-------------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 5c269081c691..0e7aae341960 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -55,7 +55,6 @@ struct rk3066_hdmi {
 	unsigned int tmdsclk;

 	struct hdmi_data_info hdmi_data;
-	struct drm_display_mode previous_mode;
 };

 static struct rk3066_hdmi *encoder_to_rk3066_hdmi(struct drm_encoder *encoder)
@@ -387,21 +386,21 @@ static int rk3066_hdmi_setup(struct rk3066_hdmi *hdmi,
 	return 0;
 }

-static void
-rk3066_hdmi_encoder_mode_set(struct drm_encoder *encoder,
-			     struct drm_display_mode *mode,
-			     struct drm_display_mode *adj_mode)
+static void rk3066_hdmi_encoder_enable(struct drm_encoder *encoder,
+				       struct drm_atomic_state *state)
 {
 	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	int mux, val;

-	/* Store the display mode for plugin/DPMS poweron events. */
-	drm_mode_copy(&hdmi->previous_mode, adj_mode);
-}
+	conn_state = drm_atomic_get_new_connector_state(state, &hdmi->connector);
+	if (WARN_ON(!conn_state))
+		return;

-static void rk3066_hdmi_encoder_enable(struct drm_encoder *encoder)
-{
-	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);
-	int mux, val;
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return;

 	mux = drm_of_encoder_active_endpoint_id(hdmi->dev->of_node, encoder);
 	if (mux)
@@ -414,10 +413,11 @@ static void rk3066_hdmi_encoder_enable(struct drm_encoder *encoder)
 	DRM_DEV_DEBUG(hdmi->dev, "hdmi encoder enable select: vop%s\n",
 		      (mux) ? "1" : "0");

-	rk3066_hdmi_setup(hdmi, &hdmi->previous_mode);
+	rk3066_hdmi_setup(hdmi, &crtc_state->adjusted_mode);
 }

-static void rk3066_hdmi_encoder_disable(struct drm_encoder *encoder)
+static void rk3066_hdmi_encoder_disable(struct drm_encoder *encoder,
+					struct drm_atomic_state *state)
 {
 	struct rk3066_hdmi *hdmi = encoder_to_rk3066_hdmi(encoder);

@@ -449,10 +449,9 @@ rk3066_hdmi_encoder_atomic_check(struct drm_encoder *encoder,

 static const
 struct drm_encoder_helper_funcs rk3066_hdmi_encoder_helper_funcs = {
-	.enable       = rk3066_hdmi_encoder_enable,
-	.disable      = rk3066_hdmi_encoder_disable,
-	.mode_set     = rk3066_hdmi_encoder_mode_set,
-	.atomic_check = rk3066_hdmi_encoder_atomic_check,
+	.atomic_check   = rk3066_hdmi_encoder_atomic_check,
+	.atomic_enable  = rk3066_hdmi_encoder_enable,
+	.atomic_disable = rk3066_hdmi_encoder_disable,
 };

 static enum drm_connector_status
--
2.39.2

