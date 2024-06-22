Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D9F9136DF
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 01:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C7110E520;
	Sat, 22 Jun 2024 23:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SJzW6edH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCE310E518;
 Sat, 22 Jun 2024 23:25:59 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4217c7eb6b4so27655775e9.2; 
 Sat, 22 Jun 2024 16:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719098758; x=1719703558; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PNu7xeRP88jipeI6HHfobP1Qgyw76oR5Po2K0A0gOkc=;
 b=SJzW6edHYsGyRT84mguI39nUrNrf0nSMZ9dTDTvFf3+/Ot7deQc+udxkC67xoxoKWP
 t64lTs6tn2sxdj8U3Oau/6UAnG4ml9Z2SNTMQ4ZJacGFRljge+2rY3spMg1Q2dFg5WRu
 /eNrXWwHqAMPd/JDvu7PACE77/rxoMxGRKp6Rt3JGv4ZsZiNKjhA3yxWet2v5XdA39fE
 X421daShxtDcmBGs/Wyokhb05PPtbC5d2dEGUPdNtEWCI1feGLX12QwwxfEbya011nA6
 SQAB89AEAJbDA+5v9ymtpspzazT/c8/nEIXT7VCnf3hjnVewIQH5zQTNd1PEaMZ3cmIm
 ohcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719098758; x=1719703558;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PNu7xeRP88jipeI6HHfobP1Qgyw76oR5Po2K0A0gOkc=;
 b=mo4w2BBcNRYBNywr24+s6l8oQAJ+GwyxflB6nnusyTpwyvurTpg5skH/OK9zbhVieU
 GNvHQ3KdClEW1EHZm9m2zTuMQyP9mLhPf655LaXYeyaUbg/oWWu4WtJZsc6aZ/vy7pZn
 ekBNb9I+dCAzIkCGATREvTuWPX8I3cTEVetqB6D9cHq+gclnWs5CMIF6PRdUVQAAJ45d
 RQfpX55RGhWiT9J2MCSqefU0N9TlY2P+krPHGmu4CckbEw5o43g9o6tTJrgv4oU1pMOB
 RfNwrQIHHRe3SXKFy8WSLCpoYHnh1yMyUyUJjZlP4F4LY9dJrex825YhSMLFMiuYuWTU
 En8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwj1E2+kEIDeMae5yGZYQda09XyV0l7fPyfK574nR1yThf2vdDhWnh61p8p9ipyKInUR+nDZcSuNKxYQNh8QoWzTik9hooC3yVwl1ripCvaf00HbcMq8dFzcLNsCuUdp3+U+ua8GASfu/qQPZu4Ugq
X-Gm-Message-State: AOJu0YwoN7gqqGT25RXeyCPutOQ4G3GjVbKmO1lAyJTe1W0d26EOcTey
 AMNzBqBpStZ78PtiZoTi0MylASdc8QsZrn6HG+yZZRAsJ6gqlQh2
X-Google-Smtp-Source: AGHT+IH46DHY7jFQjqPPtgD7FXczy15ke69mR2FvCy0K0rrmLqtmKJ4cNCM9ziz8EjvCFharm4qOvQ==
X-Received: by 2002:a05:600c:68c:b0:421:de31:81 with SMTP id
 5b1f17b1804b1-4248cc35d9cmr5842505e9.24.1719098757615; 
 Sat, 22 Jun 2024 16:25:57 -0700 (PDT)
Received: from [192.168.1.90]
 (20014C4E18129200DEAEE2020304A5A2.dsl.pool.telekom.hu.
 [2001:4c4e:1812:9200:deae:e202:304:a5a2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d2190desm120301875e9.48.2024.06.22.16.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 16:25:57 -0700 (PDT)
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <trabarni@gmail.com>
Date: Sun, 23 Jun 2024 01:25:52 +0200
Subject: [PATCH 2/4] drm/msm/mdp5: Add MDP5 configuration for MSM8937
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-dsi-v1-2-4ab560eb5bd9@gmail.com>
References: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
In-Reply-To: <20240623-dsi-v1-0-4ab560eb5bd9@gmail.com>
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
 Daniil Titov <daniilt971@gmail.com>
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
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 89 ++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index c5179e4c393c..6413c0d3e237 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -1011,6 +1011,94 @@ static const struct mdp5_cfg_hw msm8917_config = {
 	.max_clk = 320000000,
 };
 
+static const struct mdp5_cfg_hw msm8937_config = {
+	.name = "msm8937",
+	.mdp = {
+		.count = 1,
+		.caps = MDP_CAP_CDM |
+			MDP_CAP_SRC_SPLIT,
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
@@ -1325,6 +1413,7 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 9, .config = { .hw = &msm8x94_config } },
 	{ .revision = 7, .config = { .hw = &msm8x96_config } },
 	{ .revision = 11, .config = { .hw = &msm8x76_config } },
+	{ .revision = 14, .config = { .hw = &msm8937_config } },
 	{ .revision = 15, .config = { .hw = &msm8917_config } },
 	{ .revision = 16, .config = { .hw = &msm8x53_config } },
 };

-- 
2.45.2

