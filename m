Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C33BD7E76CD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 02:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71E210E40D;
	Fri, 10 Nov 2023 01:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0539010E40D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Nov 2023 01:48:02 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c6efcef4eeso19308401fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 17:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601;
 t=1699580881; x=1700185681; darn=lists.freedesktop.org; 
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oDNpb1kX9Q5D1FTRF5Xg6UxOao23a7KP3eBk4wJ9fv4=;
 b=ngfmBzcEYQOVoMABTbdOkq0EnB3yyyTaPfyqb+DnbKMEE7vkM9dRP4/2vx9t16pys8
 zLWUm19bgh9IiIB+3liXsTptKoLzERnmTFFWmv1EJngJoWbL4JQP6ZdVGLJcEFzthA+U
 34Pov6B7uMnQKfvaoolvoidYnVRyMftj7+kHUFlXdIetYyeFL5vom/Cx40Suoyc2qwWP
 Z1qDW26VvHP2Dro14tbN3BpFxyJn/1i18y89uffiPf75dfaxrpyRuftdvKXYXyw9w1Ho
 CPROujOit4S4JkTdgZ0FdA2v7+jET42QjoRr+bKxc/teq4O4bS5ctQ8mkmdCJRSqIHdU
 4hyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699580881; x=1700185681;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oDNpb1kX9Q5D1FTRF5Xg6UxOao23a7KP3eBk4wJ9fv4=;
 b=vQinSTd9P+8ITecfSKHr6W+L1Odvu2/h9Q1rw4zh3T6+XhWpCIWfc2QkjAiESxamlG
 /0kx0FS4gTnbUfLvNceo39TpWKdp+ZY3bQ+3qmfIGEwEANXQWZvtIUlDP6WTu7C3lGmG
 qPpoBS2aJJLujA1MXUGqtCySaTYoGFEQYIWiOszUb6PB26DxnFsyVju2IeFo7ZyXBEi8
 vsDlK6t2IJP34125kRTt8nhE+Uqge9pteIFESf2cj0bPV0tHejbARrm5V6NvXDtOrRY6
 nxJQZ9WOtBeLo7Ghbdm7jodyWHcyvUHs3ccRzqAotK2bjbXzel1Vm0FDeg6aX3QS2EDw
 OJCQ==
X-Gm-Message-State: AOJu0YyZh0icbnP3wTqfTBUsc+BkhA4plhbGiQMSneYVHxiKXTAfJ+Nt
 XSf1aAPUon90PCWExMf7vAu5jlLTFH4thrXpGE16xw==
X-Google-Smtp-Source: AGHT+IFel1gF3HXOACsl8uqOdCsIzF+skqC7mt7yCheTpwqwZm0u7PaCIFh91+0ILvSIZNfz1lrAug==
X-Received: by 2002:a2e:780c:0:b0:2c5:2d02:ed14 with SMTP id
 t12-20020a2e780c000000b002c52d02ed14mr5689253ljc.23.1699580880559; 
 Thu, 09 Nov 2023 17:48:00 -0800 (PST)
Received: from ubuntu.huaqin.com ([63.221.192.42])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a1c7703000000b004083729fc14sm3610396wmi.20.2023.11.09.17.47.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 17:48:00 -0800 (PST)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND] drm/panel: starry-2081101qfh032011-53g: Fine tune
 the panel power sequence
Date: Fri, 10 Nov 2023 09:47:49 +0800
Message-Id: <20231110014749.10094-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
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
Cc: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>,
 neil.armstrong@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 quic_jesszhan@quicinc.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the "starry, 2081101qfh032011-53g" panel, it is stipulated in the
panel spec that MIPI needs to keep the LP11 state before the
lcm_reset pin is pulled high.

Fixes: 6069b66cd962 ("drm/panel: support for STARRY 2081101QFH032011-53G MIPI-DSI panel")
Signed-off-by: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 4f370bc6dca8..4ed8c2e28d37 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -1765,6 +1765,7 @@ static const struct panel_desc starry_qfh032011_53g_desc = {
 	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
 		      MIPI_DSI_MODE_LPM,
 	.init_cmds = starry_qfh032011_53g_init_cmd,
+	.lp11_before_reset = true,
 };
 
 static const struct drm_display_mode starry_himax83102_j02_default_mode = {
-- 
2.17.1

