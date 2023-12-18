Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A398817A74
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FF210E3F1;
	Mon, 18 Dec 2023 18:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0329710E2A1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:52:23 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-50e2786e71fso2994043e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 10:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702925542; x=1703530342; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DCQzgc7HZIXkjhrSZNLJQoxchuiI/YLWggopgdNCG/w=;
 b=Iz4vSDRZzE8JXpYiwRNCFpbvg2z5R/U/elBbgnjk/6y2OS1eJUhq6cB7Slfllqr5NV
 KncOBQ3J/G6T9UteoMjQC714vTFPAViaL918z8UHYsKzs2X7TCwiMZDWjIyBFlRplrR2
 OyErVX3HILqubV6VkQkywjgsRB5zCNXSXtevSCnril5v4L3oXaS23hdOYUmg3ySeryMD
 qzF6vFVqubUZX5pX8umv/UfJnULuPDj6nJSKjM93EHNEswMLd8DCm5DlI84k4dO5ACwD
 EQY7o08AFWE+dFbBIy8ar3IsEN3sAQZST+nPnnRwjAc3lQJFUJeHOIOUkB+cFtg1EjNb
 GfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702925542; x=1703530342;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DCQzgc7HZIXkjhrSZNLJQoxchuiI/YLWggopgdNCG/w=;
 b=GRaNDBcr8f/QlzdxAOsnjoh2Zj10/OF9h4o2Y9thEoXWKPz42WkHClof154p9jZgSW
 Ix15UyrgHWOiwj6sAFRP6mnDq7CaheJbsfCXebGvPAcFFHUXrWsNqk1ccSc/92ZsIKsy
 /3SPwoxe5HHuXTPfsiGB67awFk2JTOtUKLGcaAobAnbwSGB2SIPcQyqRmV2JTF9N9jlf
 HVNgTfbpzOX44/xH/oqPm2ddZtXQCr7Yj5Fkug+ncW8XIEBQ6zPa7v2ezSF4danDNUYC
 G8Dd8xji4dRBAr4dzI5Tjyvn5Ebig7PfjNuHaQDO18dB1+1j3oGXuClqoKizBWGhdThf
 Ev4Q==
X-Gm-Message-State: AOJu0Yxeiq4ziCXe1tYEJjJhSEsXGm+Xcc86YtRSiKpuAfPCdCd/j7BF
 8rmG9soRNuZOQYBxrL1opZrA++Y8NT4=
X-Google-Smtp-Source: AGHT+IE0dLdHYhpXc1l9yUsJLLTeyu7fPpLWHCXq007NrPDn70yB+TVn+T7YKt5u3Yd3coevCH6ExA==
X-Received: by 2002:a17:906:da08:b0:a19:a19a:eadf with SMTP id
 fi8-20020a170906da0800b00a19a19aeadfmr7048806ejb.152.1702914547563; 
 Mon, 18 Dec 2023 07:49:07 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 v19-20020a170906489300b00a236378a43fsm654118ejq.62.2023.12.18.07.49.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 07:49:07 -0800 (PST)
Message-ID: <410b116b-cb63-7ba7-3689-4f0832ab5796@gmail.com>
Date: Mon, 18 Dec 2023 16:49:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v2 2/2] drm/rockchip: rk3066_hdmi: drop custom fill_modes hook
To: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com
References: <f86ec29f-194a-800d-0aaf-9e16e551b37d@gmail.com>
Content-Language: en-US
In-Reply-To: <f86ec29f-194a-800d-0aaf-9e16e551b37d@gmail.com>
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
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 mripard@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CRTC size validation for the display controller has been added with
Commit 8e140cb60270 ("drm/rockchip: vop: limit maximum resolution to
hardware capabilities"), so we can drop the custom fill_modes hook.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 0dac6d133767..6dadd753985c 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -501,18 +501,6 @@ rk3066_hdmi_connector_best_encoder(struct drm_connector *connector)
 	return &hdmi->encoder.encoder;
 }

-static int
-rk3066_hdmi_probe_single_connector_modes(struct drm_connector *connector,
-					 uint32_t maxX, uint32_t maxY)
-{
-	if (maxX > 1920)
-		maxX = 1920;
-	if (maxY > 1080)
-		maxY = 1080;
-
-	return drm_helper_probe_single_connector_modes(connector, maxX, maxY);
-}
-
 static void rk3066_hdmi_connector_destroy(struct drm_connector *connector)
 {
 	drm_connector_unregister(connector);
@@ -520,7 +508,7 @@ static void rk3066_hdmi_connector_destroy(struct drm_connector *connector)
 }

 static const struct drm_connector_funcs rk3066_hdmi_connector_funcs = {
-	.fill_modes = rk3066_hdmi_probe_single_connector_modes,
+	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = rk3066_hdmi_connector_detect,
 	.destroy = rk3066_hdmi_connector_destroy,
 	.reset = drm_atomic_helper_connector_reset,
--
2.39.2

