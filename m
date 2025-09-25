Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF30BA030E
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 17:17:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F38610E965;
	Thu, 25 Sep 2025 15:17:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mm8/xLjz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9702110E964
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 15:17:25 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-57a292a3a4bso1254236e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 08:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758813444; x=1759418244; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
 b=mm8/xLjzMO9pOifx5NQlQHHpo/JFjeZziAKxinuVTwrRlh1Rqb+mxFSeMnE1hmVO0o
 4VVBfj258d44dJevgq3Ku5VBucPsJcG9rmC3ledd+K9aY3x3lMecvzNBsQtJPSVnE5Ti
 OqLDxbkcf8Ocub0FuwczrW2dikSvj04hx4ochioY/HzrJCWzEeZBIXK4FSl+BKpRxGTy
 zW6a4YoQq/Kp71e7TFDohhP9UJ8GNOgngeN0Bd+kUQDcbK6W9T1xkC54hUReSp+xpbxR
 0dTkEeWZejcXFZ2LcEpQedDheWIRGuEfIuslpjOMpvj9Leew6dB6o55bpWO3lZ0Of6e5
 AJ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758813444; x=1759418244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
 b=Kc/f5KTBIAgvwF9vvfmUtl4/dXyp33fXk4ewon+lUbSyPlKZeopsN5OWBlhoJrIT5+
 Zjcyk/uBntE85EVDqm2lL33OHcY+/O9dN3+lF+UHZm1ql6AjgdSdO1JGwqD60R2eJWai
 6B0sBBWrbq0fmnxpE2kvpFMq9fdd+L21vvFissbRH8z8+/mAchVtlATcAAG5+DdNflLG
 DuzYvNMPHNIMzBr2x243zIn6PzcXOkipUlaymFzAbPQMTrPeEYgJkI6S4Exf9t95T8Be
 lqL/AhOp76qlfsoVwRyjQzfBfdRJVS47aFO9gfwBTUt3MuwzaAP4mF93ms48/DBrsrs+
 7B6Q==
X-Gm-Message-State: AOJu0Yw9T9jPqnV8uHqkdZM5dG06SCyIscwFNmQVhuqMRT8+Y0ZwO71X
 JY6XcgzAdKUqYU9Fc8rTCtEIx97URwty2bGhPieP+FM1nldt2gM8BliT
X-Gm-Gg: ASbGncuEWj6IiT7I17JAfvBxVIFMCQ7PQjtB61G1mntdSqLHgpVdM+aHw0z/lhvUtfF
 WrdLQ0l/TJKQfeW3EF2Cb9cCbz5lbVrq9AX/qWTb6oe45C5IaNbPy+0gblfE33qW7QYabdM7mN2
 PB+dgN8zDgztKzkcAHEHAWoiTo9BWft+n0Akp0p2V5GHGaUOvQJDBkG2AmClCUnFnahHYCiDAH/
 qTjc9m4QfcYZPnY2SWiPPfK9xhaYJw1X99+w6Ie3B+3hTGJXCMsAC89ZScOHYU1uavmuFR/FLJg
 MQj1epuCPay8m2ivqkJCDcYeCxSsTB5WUeIz29v+UpASMf/5pAI9YZfXxuLuz0XubC4AdPUYMxr
 kOGcAwygdjWH5zw==
X-Google-Smtp-Source: AGHT+IGmndnr7Gh0aHTSxGSLl1Clt2mwmPdyke+G1kRc2c45XCUN1RqNAuzwlMAkSvKsRinuBceSbQ==
X-Received: by 2002:a05:6512:684:b0:578:f613:ed9c with SMTP id
 2adb3069b0e04-582d39b6b06mr1182270e87.43.1758813443698; 
 Thu, 25 Sep 2025 08:17:23 -0700 (PDT)
Received: from xeon.. ([188.163.112.70]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430496sm870084e87.27.2025.09.25.08.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 08:17:23 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v3 07/22] staging: media: tegra-video: vi: add flip controls
 only if no source controls are provided
Date: Thu, 25 Sep 2025 18:16:33 +0300
Message-ID: <20250925151648.79510-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250925151648.79510-1-clamor95@gmail.com>
References: <20250925151648.79510-1-clamor95@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Because the current Tegra video driver is video-centric, it exposes all
controls via /dev/video. If both the camera sensor and the VI provide
hflip and vflip, the driver will fail because only one control is allowed.
To address this, hflip and vflip should be added from the SoC only if the
camera sensor doesn't provide those controls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 856b7c18b551..90473729b546 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.48.1

