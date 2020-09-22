Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C537E2752A4
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E593389EA6;
	Wed, 23 Sep 2020 07:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B5689452
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 20:31:27 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t10so18532699wrv.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 13:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/ACUgjSRhezgf6ut/YNpIRBfmecqG58PBv3yXYOEimo=;
 b=vVA6LLgG8jwWQguQZR4gVTXEp160a50BMNzyRiQUhwEHIgxAB3qPPlwvXKmyIOLqe4
 EWMSpiGjRuH22WiVKvFPxKzQE7p86aevN4bPO+wsC8YTKf3Qkrtcpg1rrrghvnvCU5rC
 BntTw3iKjTUEZHEfM1+dN0dfr2lx6kHCh89CMV20OYneUhftADpnifhJlZtu3K/GyJ+o
 TSPDXnTKUJhRtACorada1t6yRQtVHeIBd9mvGGiYLXqvd3ooDC2XZcW03Dkpu9EGolM5
 iTFZ2sj8Pfn0QZ6u0BcsxLjcSnyY+BCINk/6Gk9S9wqH28+HL9VuBfUqmcQwTf+yrj92
 EN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ACUgjSRhezgf6ut/YNpIRBfmecqG58PBv3yXYOEimo=;
 b=Mv7YxH0gvX2yTnrkuZmTWClQswwcGkp+14zqEHEUFmmG8y90xQQUsajaeyibsSO7QI
 oE16q/L37x2UOwiBIBWvUoZP3plKuzZvLKr25/qeUg7A9tYjrXBbftduOCgIYJG+uqMZ
 BW6scWu3ZMBqMuHRs7GIU3wD/CPaiYnrHCglKt6dSe1jXvtRE2hR8laBt2YYK7aII+ev
 VV39AjcVayJLpGteLF3BMfmK6GOBfT8KUf42gv7ZBDQNdjU2GV33NKHLyJBJwz3d+g+H
 cb1AkKPJBOJzppK435VLcpExqA6IIerqrtpryPpVugo9K38v8ge7/FmWOuWFRriHKPyU
 Ohag==
X-Gm-Message-State: AOAM530TitFmba2KR127ueN0N5AlWhf5TS2pg2/sceg5YbJfcdIdWWlT
 Y+n4jfCDXKc3qRtJV+HSLPxmjjhD1zy7Ug==
X-Google-Smtp-Source: ABdhPJwMq1POLzNAD4zYPSd4peQ88XtIsnbU+Onjj8ugiHJj2wP7WLd6U6NDUDY46Zv9Szf68UPXRQ==
X-Received: by 2002:adf:f544:: with SMTP id j4mr7176078wrp.74.1600806686189;
 Tue, 22 Sep 2020 13:31:26 -0700 (PDT)
Received: from localhost.localdomain ([170.253.46.69])
 by smtp.gmail.com with ESMTPSA id r14sm27256849wrn.56.2020.09.22.13.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 13:31:25 -0700 (PDT)
From: Vicente Bergas <vicencb@gmail.com>
To: Doug Anderson <dianders@chromium.org>, crj <algea.cao@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v2 3/3] drm: rockchip: hdmi: add higher pixel clock frequencies
Date: Tue, 22 Sep 2020 22:31:07 +0200
Message-Id: <20200922203107.2932-4-vicencb@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922203107.2932-1-vicencb@gmail.com>
References: <20200922203107.2932-1-vicencb@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:20 +0000
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
Cc: Vicente Bergas <vicencb@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In order to support video resolutions beyond FHD more bandwidth is needed.
The new entry values have been taken from u-boot:
https://gitlab.denx.de/u-boot/u-boot/-/blob/ba2a0cbb053951ed6d36161989d38da724696b4d/drivers/video/rockchip/rk_hdmi.c#L63

Signed-off-by: Vicente Bergas <vicencb@gmail.com>
Tested-by: Vicente Bergas <vicencb@gmail.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 87a9198f7494..db4a946f92aa 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -148,6 +148,10 @@ static const struct dw_hdmi_mpll_config rockchip_mpll_cfg[] = {
 			{ 0x214c, 0x0003},
 			{ 0x4064, 0x0003}
 		},
+	}, {
+		272000000, {
+			{ 0x0040, 0x0003},
+		},
 	}, {
 		~0UL, {
 			{ 0x00a0, 0x000a },
@@ -173,6 +177,8 @@ static const struct dw_hdmi_curr_ctrl rockchip_cur_ctr[] = {
 		146250000, { 0x0038, 0x0038, 0x0038 },
 	}, {
 		148500000, { 0x0000, 0x0038, 0x0038 },
+	}, {
+		272000000, { 0x0000,                },
 	}, {
 		~0UL,      { 0x0000, 0x0000, 0x0000},
 	}
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
