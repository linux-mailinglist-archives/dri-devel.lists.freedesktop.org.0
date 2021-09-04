Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 293E54008C5
	for <lists+dri-devel@lfdr.de>; Sat,  4 Sep 2021 02:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0586E8ED;
	Sat,  4 Sep 2021 00:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B3D6E8EA;
 Sat,  4 Sep 2021 00:40:01 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id c5so510210plz.2;
 Fri, 03 Sep 2021 17:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FI6R42Oo7MX5/xkTwAAMjl52Mc/0wUr0Fx+yPEL+Ji4=;
 b=P9p3I1iFOOqZHomjJ9vNMefUT3hZPzD+F1bNrOIYlplXPkvXNDcsEoyzTJIVAmJ35Y
 0rkjEw3jIJ562VBGidsZBdYFLb+XXXwWHfP4361rOcoFkfXJlccu6Oa3StlZZpt8UB3p
 RMeJs65RYXCbGcJ9FCY+9HyR8PojZBDka55C1UZ9rYWMF3GUYyXqiBqOFxjLDEwwr1Pt
 s85jHd6VurdxdjV9hbU5CoLvTBeJI79gIHfkKkC9t7c8rptQ4B/9hqjUJgLc0CkQ7nQY
 IYyLlGH5GENe7taBtOG5A0IXy2YH8nbyCN6a+STlteI8sxyU1mv5PnWuHxgGuCtiClCx
 gtgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FI6R42Oo7MX5/xkTwAAMjl52Mc/0wUr0Fx+yPEL+Ji4=;
 b=nMUCv6uShQrbKcxiRafSqeSNhKiAQqETKFPB8GmZ6py3ugvHmwfFPYKW4GmVZQgQUD
 gXopDATVDAnQRl7SJBCZ/Qi0oilTEPjo2c8dB0/J4ob1E7Nr3qJMKlAX7j3IJ0jtbW1/
 h4/eY7yesjLf8C+3hnpvs0QUJvHgO7ZIZe3Fi1i2gPGBQskITDGXCPj1flOyPcYJbaI0
 6hBaQijNLTH4AQLWefxMk4Oh4HUc60zobPM64w/l1vaClNi6tbUQ6mx51q9mLAOt5JBa
 u3Uq3lf3jNktfTJqlaDBtn43XXdqknviKPolSC/9RNsx3b8TnhCh0ERbB7V7r4FggD5h
 oZbw==
X-Gm-Message-State: AOAM533x20fTlGBi6FsIKynD6mQZF3WwH0n6zl1I1u2R+E9nmiSlJMg+
 n4a5t2RE448K2DNnTDjJy5A=
X-Google-Smtp-Source: ABdhPJzz1rwyz2vh+Ezx9pYFTMx4kmC/xaZ4SlrqqT6MjtyqC6xvt8h0O3Dz2Zp+MEjlpU0HVoMEtw==
X-Received: by 2002:a17:90b:33c6:: with SMTP id
 lk6mr1588157pjb.203.1630716000885; 
 Fri, 03 Sep 2021 17:40:00 -0700 (PDT)
Received: from skynet-linux.local ([136.185.149.81])
 by smtp.googlemail.com with ESMTPSA id o2sm487823pgu.76.2021.09.03.17.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 17:40:00 -0700 (PDT)
From: Sireesh Kodali <sireeshkodali1@gmail.com>
To: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: Vladimir Lypak <vladimir.lypak@gmail.com>,
 Sireesh Kodali <sireeshkodali1@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 James Willcox <jwillcox@squareup.com>,
 freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 3/3] drm/msm/mdp5: Add configuration for MDP v1.16
Date: Sat,  4 Sep 2021 06:09:17 +0530
Message-Id: <20210904003919.36575-1-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903170844.35694-1-sireeshkodali1@gmail.com>
References: <20210903170844.35694-1-sireeshkodali1@gmail.com>
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

From: Vladimir Lypak <vladimir.lypak@gmail.com>

MDP version v1.16 is almost identical to v1.15 with most significant
difference being presence of second DSI interface. MDP v1.16 is found on
SoCs such as MSM8x53, SDM450, SDM632 (All with Adreno 506).

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 89 ++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 9741544ffc35..0d28c8ff4009 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -752,6 +752,94 @@ const struct mdp5_cfg_hw msm8x76_config = {
 	.max_clk = 360000000,
 };
 
+static const struct mdp5_cfg_hw msm8x53_config = {
+	.name = "msm8x53",
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
+		.count = 3,
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
+		.base = { 0x6a000, 0x6a800, 0x6b000 },
+		.connect = {
+			[0] = INTF_DISABLED,
+			[1] = INTF_DSI,
+			[2] = INTF_DSI,
+		},
+	},
+	.max_clk = 400000000,
+};
+
 static const struct mdp5_cfg_hw msm8917_config = {
 	.name = "msm8917",
 	.mdp = {
@@ -1151,6 +1239,7 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 7, .config = { .hw = &msm8x96_config } },
 	{ .revision = 11, .config = { .hw = &msm8x76_config } },
 	{ .revision = 15, .config = { .hw = &msm8917_config } },
+	{ .revision = 16, .config = { .hw = &msm8x53_config } },
 };
 
 static const struct mdp5_cfg_handler cfg_handlers_v3[] = {
-- 
2.33.0

