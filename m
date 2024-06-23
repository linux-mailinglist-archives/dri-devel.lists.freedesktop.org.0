Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DE2913E19
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 22:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7611F10E30E;
	Sun, 23 Jun 2024 20:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="E3otxra+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5B710E011;
 Sun, 23 Jun 2024 20:30:45 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-35f090093d8so2541270f8f.0; 
 Sun, 23 Jun 2024 13:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719174644; x=1719779444; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WcQwj4t9zR+7uYrgBkNTvxKkblY1AhgJTZPnMnuWT20=;
 b=E3otxra+Mo93CE3r9YZo+N8t1+F8uyrcSp/LCM9Z4Ajszo+7TY4D5O12ifcfrQ/YvT
 jVLNs7Z7p2fAKq6Amy/0yd0ZL37cA19wo8JNXN4lsg0aD52l6wCHoTY/Kp4YGdtbM9kp
 PJrM+jewTitiUyCkwYGV3Wcf0fJi1+Jq9GihsLLCJ9JQapoHJbT5Hppg0H8g0uCMy1Zo
 EYCek4csLRPMVz+Y/9ilFAyox++GzgJkxYMXsIsFA6rvKNlJPXBzNS+zhtT0IUHxTwi5
 ZG0S7cZT01hRxfjeQI5WB2yGGol872z+EvmFlzb8QUSN4Bn7LTWP66euctAmZrgMgjyP
 /Elg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719174644; x=1719779444;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WcQwj4t9zR+7uYrgBkNTvxKkblY1AhgJTZPnMnuWT20=;
 b=jXsYd0Oi7lxVflSe93O6pCCJldywxBNjz0mYFBGuoiz74799AEhcY76nBMkRdVG/Eh
 4LB8cXI4pEk8ASuPr3IFqnUosrD/3/7ugfqNnzy5vR7Lb5PaACk9hHAio60cZYX/Q6OW
 aVmlRLD9Vg0M2UXPJpBZQ2vWd/vUp8AGVP1XS18x68c7GTqxw+Bd4CtjRx8VgBu53o1f
 mlxIIo1adHxNOpD1KE1B5xHdoQx7yaogmolGmilbXK3AHMaQrFut2h9FHf+BY2sbAS7u
 AaRsMjWtEXg7kejqC7HVQnbZ484NPMA00Ty3DoqCD1c0mMzsWDpq7VRsm4+UxDZzIbR1
 Irjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7sNoqamcr0Qs6ZXq95sZ/jePurnIN1GCueK7QHF5OogQLC/Xz826VW4vy7GLu1cpIrqbiWSXSqeco1Ah3wAPUhi6eFYvIVaVkEKhl+EbL29Js5NRsrwnyve9BdebLq0iQtJR7Bi6ej7kO8mwLVIa8
X-Gm-Message-State: AOJu0YzdPMF7CRHmqEpedr5ZGitSejHVx+XxUQNh6qFRencUWkKIee16
 nMersv5WuMTW51yypt1MujudGmpAkSJC3pTpjITYORV7pNx+eWTFTg0Uw+xQav8=
X-Google-Smtp-Source: AGHT+IGQquz5k2BVLGaucgi4cKq8o9F9G60dY1wEBUIUTqJaF6oBnYohr7FR/h/6RtTQnKBlHZ0zVA==
X-Received: by 2002:a05:6000:1f83:b0:366:f496:c0c2 with SMTP id
 ffacd0b85a97d-366f496c101mr220821f8f.6.1719174644185; 
 Sun, 23 Jun 2024 13:30:44 -0700 (PDT)
Received: from [192.168.1.130] (BC2492F3.dsl.pool.telekom.hu. [188.36.146.243])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366389b8ad2sm8088599f8f.33.2024.06.23.13.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 13:30:43 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 22:30:37 +0200
Subject: [PATCH v2 2/4] drm/msm/mdp5: Add MDP5 configuration for MSM8937
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-dsi-v2-2-a0ca70fb4846@gmail.com>
References: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
In-Reply-To: <20240623-dsi-v2-0-a0ca70fb4846@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>, 
 phone-devel@vger.kernel.org, Daniil Titov <daniilt971@gmail.com>
X-Mailer: b4 0.14.0
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

From: Daniil Titov <daniilt971@gmail.com>

Add the mdp5_cfg_hw entry for MDP5 version v1.14 found on msm8937.

Signed-off-by: Daniil Titov <daniilt971@gmail.com>
Signed-off-by: Barnabás Czémán <trabarni@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 88 ++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index c5179e4c393c..fac8e276da52 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -1011,6 +1011,93 @@ static const struct mdp5_cfg_hw msm8917_config = {
 	.max_clk = 320000000,
 };
 
+static const struct mdp5_cfg_hw msm8937_config = {
+	.name = "msm8937",
+	.mdp = {
+		.count = 1,
+		.caps = MDP_CAP_CDM,
+	},
+	.ctl = {
+		.count = 3,
+		.base = { 0x01000, 0x01200, 0x01400 },
+		.flush_hw_mask = 0xffffffff,
+	},
+	.pipe_vig = {
+		.count = 1,
+		.base = { 0x04000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SCALE	|
+			MDP_PIPE_CAP_CSC	|
+			MDP_PIPE_CAP_DECIMATION	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			0,
+	},
+	.pipe_rgb = {
+		.count = 2,
+		.base = { 0x14000, 0x16000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_DECIMATION	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			0,
+	},
+	.pipe_dma = {
+		.count = 1,
+		.base = { 0x24000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			0,
+	},
+	.pipe_cursor = {
+		.count = 1,
+		.base = { 0x34000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			MDP_PIPE_CAP_CURSOR	|
+			0,
+	},
+
+	.lm = {
+		.count = 2,
+		.base = { 0x44000, 0x45000 },
+		.instances = {
+				{ .id = 0, .pp = 0, .dspp = 0,
+				  .caps = MDP_LM_CAP_DISPLAY |
+					  MDP_LM_CAP_PAIR },
+				{ .id = 1, .pp = 1, .dspp = -1,
+				  .caps = MDP_LM_CAP_DISPLAY },
+			     },
+		.nb_stages = 5,
+		.max_width = 2048,
+		.max_height = 0xFFFF,
+	},
+	.dspp = {
+		.count = 1,
+		.base = { 0x54000 },
+
+	},
+	.pp = {
+		.count = 2,
+		.base = { 0x70000, 0x70800 },
+	},
+	.cdm = {
+		.count = 1,
+		.base = { 0x79200 },
+	},
+	.intf = {
+		.base = { 0x00000, 0x6a800, 0x6b000 },
+		.connect = {
+			[0] = INTF_DISABLED,
+			[1] = INTF_DSI,
+			[2] = INTF_DSI,
+		},
+	},
+	.max_clk = 320000000,
+};
+
 static const struct mdp5_cfg_hw msm8998_config = {
 	.name = "msm8998",
 	.mdp = {
@@ -1325,6 +1412,7 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 9, .config = { .hw = &msm8x94_config } },
 	{ .revision = 7, .config = { .hw = &msm8x96_config } },
 	{ .revision = 11, .config = { .hw = &msm8x76_config } },
+	{ .revision = 14, .config = { .hw = &msm8937_config } },
 	{ .revision = 15, .config = { .hw = &msm8917_config } },
 	{ .revision = 16, .config = { .hw = &msm8x53_config } },
 };

-- 
2.45.2

