Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 707C01C241C
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 10:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E996EDE4;
	Sat,  2 May 2020 08:34:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8626E060;
 Fri,  1 May 2020 20:52:10 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h9so2638323wrt.0;
 Fri, 01 May 2020 13:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=12JtCUsbZ+yUp2HpWHpScZpztaTEOKrSxTmHGBuq0XI=;
 b=XMuJ3VRSMmnxdQVoGSNb165xKuSdEDNoIVP8pSrhPxgU2KM3Bda13/Sw7sYV3xvxol
 xhWfZoSmsGD3+sG/0sETAj0feAM8YqB+NP/hvL7PatsMIuAmmu8gyBoKZT946NpmQqyO
 oiEiV6WVC3feL2jw7/xo5YyCKM1CbmUr5y+QMOuciVsv5ii/5xjw0C6v9KcK+eMJY3Hd
 x+fecNm5e74MZsAzGrQbokYAxVsZFwrC9l70JSrXs1+0lH9+RM6pMWBx6LrUv3oi9Y/U
 p4h0wYYQDpGZBzDaEEX8cqWYiXYN41kcZwGgz1UIhghAfi9PIF6TxUesOfwjV4C14MiX
 IzMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=12JtCUsbZ+yUp2HpWHpScZpztaTEOKrSxTmHGBuq0XI=;
 b=oUwH3t9gHb8xuTAbf+2/qYoxNgB4P2o1s2rjTHtsxjstDF+PQruzUuz6aDNLuc/UTv
 KVPVS0Pyum+8/Jhp0ZvQ1E8/yub1naqY7bvQhv/BV0RKAnzLA4lK/v2QOZ4al5rrjIPr
 r+fCVAJXyuH5mkHWUitnC2gyoXvsg0qFeBMyWEqiM5sOA6dSbWtN614uEWpa28Au2KqO
 ZRuF2/ROFHVWWpVIeZl1S90ccs14MBAEliWuhkfMujZyYwVG9OVS2JTf2YM0S+Y07KoJ
 FvIhH73rCOrdUR5Cxkjdc8j0Cn6sAoujzrtwgRpPJU+QzhkhMMsd//FPxaom0D7MJ52B
 +gew==
X-Gm-Message-State: AGi0PuajRl1c8XohFcgvhM5Vf/hkTf1Ez5JmAL/KocS5Wrs3dIK+yE52
 EU0PaL5yPwq6ilSgtE1zKq8=
X-Google-Smtp-Source: APiQypLaF6TJ5hD+rLSGyVSptxrYBa9qeOx0rfL//IoFc6ei2aWIAaO6eINfl9t4+h1vHw3nSOB9YQ==
X-Received: by 2002:a5d:4248:: with SMTP id s8mr5841751wrr.216.1588366329072; 
 Fri, 01 May 2020 13:52:09 -0700 (PDT)
Received: from localhost.localdomain (abag125.neoplus.adsl.tpnet.pl.
 [83.6.170.125])
 by smtp.googlemail.com with ESMTPSA id d143sm1065098wmd.16.2020.05.01.13.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 13:52:08 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: skrzynka@konradybcio.pl
Subject: [PATCH] drivers: gpu: drm: Add MDP5 configuration for MSM8x36 and its
 derivatives, such as MSM8939.
Date: Fri,  1 May 2020 22:51:59 +0200
Message-Id: <20200501205201.149804-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 02 May 2020 08:34:27 +0000
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
Cc: freedreno@lists.freedesktop.org, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konradybcio@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhengbin <zhengbin13@huawei.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Thomas Gleixner <tglx@linutronix.de>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 70 ++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index e3c4c250238b7..1c7de7d6870cf 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -342,6 +342,75 @@ static const struct mdp5_cfg_hw msm8x16_config = {
 	.max_clk = 320000000,
 };
 
+static const struct mdp5_cfg_hw msm8x36_config = {
+	.name = "msm8x36",
+	.mdp = {
+		.count = 1,
+		.base = { 0x0 },
+		.caps = MDP_CAP_SMP |
+			0,
+	},
+	.smp = {
+		.mmb_count = 8,
+		.mmb_size = 10240,
+		.clients = {
+			[SSPP_VIG0] = 1, [SSPP_DMA0] = 4,
+			[SSPP_RGB0] = 7, [SSPP_RGB1] = 8,
+		},
+	},
+	.ctl = {
+		.count = 3,
+		.base = { 0x01000, 0x01200, 0x01400 },
+		.flush_hw_mask = 0x4003ffff,
+	},
+	.pipe_vig = {
+		.count = 1,
+		.base = { 0x04000 },
+		.caps = MDP_PIPE_CAP_HFLIP | MDP_PIPE_CAP_VFLIP |
+				MDP_PIPE_CAP_SCALE | MDP_PIPE_CAP_CSC |
+				MDP_PIPE_CAP_DECIMATION,
+	},
+	.pipe_rgb = {
+		.count = 2,
+		.base = { 0x14000, 0x16000 },
+		.caps = MDP_PIPE_CAP_HFLIP | MDP_PIPE_CAP_VFLIP |
+				MDP_PIPE_CAP_DECIMATION,
+	},
+	.pipe_dma = {
+		.count = 1,
+		.base = { 0x24000 },
+		.caps = MDP_PIPE_CAP_HFLIP | MDP_PIPE_CAP_VFLIP,
+	},
+	.lm = {
+		.count = 1,
+		.base = { 0x44000 },
+		.instances = {
+				{ .id = 0, .pp = 0, .dspp = 0,
+				  .caps = MDP_LM_CAP_DISPLAY, },
+				},
+		.nb_stages = 8,
+		.max_width = 2048,
+		.max_height = 0xFFFF,
+	},
+	.pp = {
+		.count = 1,
+		.base = { 0x70000 },
+	},
+
+	.dspp = {
+		.count = 1,
+		.base = { 0x54000 },
+	},
+	.intf = {
+		.base = { 0x00000, 0x6a800, 0x6b000 },
+		.connect = {
+			[0] = INTF_DISABLED,
+			[1] = INTF_DSI,
+			[2] = INTF_DSI,
+		},
+	},
+	.max_clk = 366670000,
+};
 static const struct mdp5_cfg_hw msm8x94_config = {
 	.name = "msm8x94",
 	.mdp = {
@@ -840,6 +909,7 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 2, .config = { .hw = &msm8x74v2_config } },
 	{ .revision = 3, .config = { .hw = &apq8084_config } },
 	{ .revision = 6, .config = { .hw = &msm8x16_config } },
+	{ .revision = 8, .config = { .hw = &msm8x36_config } },
 	{ .revision = 9, .config = { .hw = &msm8x94_config } },
 	{ .revision = 7, .config = { .hw = &msm8x96_config } },
 	{ .revision = 11, .config = { .hw = &msm8x76_config } },
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
