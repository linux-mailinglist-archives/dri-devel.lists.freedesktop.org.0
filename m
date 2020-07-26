Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9088E22DFD8
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1FDD89F4A;
	Sun, 26 Jul 2020 15:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204D989F89;
 Sun, 26 Jul 2020 11:14:35 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id c2so4218277edx.8;
 Sun, 26 Jul 2020 04:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=odkhAQTvRYESHiHGqpDynQYqs+08K37ujfoJpgK5xW8=;
 b=BWil68KsIDDYAqe6oxpdO98IqNFBgoGjsgfFXzj8jCJqWoxTYil9KyuW2hk9Oagmh+
 oupi2RpWAhncyOn5ZT2QO+EOjeB7+WOFsaeNYI6f8T+yx3bl5NS4THB/dzqhQ6XFlfMd
 LzEU5kPx67MURKnXl6VWifwP268jMDacRsl8cl2b0NN80oTan+vvxeCYdEGgxOKmnDpt
 D1neRCuEV/0KHdojYzJ5Im/T161KvIJ525H5ahZNI1AKrEBAPtPsSj3Ldjamf/kKUZ3z
 dzCh3SKPEvHA3jkQ1zjlRpYyW1p7nxYPskBkgZBB/0F0vG4JASY1REaA5XBy+F+iv0Oe
 PXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=odkhAQTvRYESHiHGqpDynQYqs+08K37ujfoJpgK5xW8=;
 b=MOcbtgwV5jktQ9CaEr85jhxdCynYCb3xTQrlgxov4M/thMxOSmyoRMPjyGdCKlceLr
 HO8IGmbrWMlq/7o0bx1t3bCeQ6KNK4AywoxRTnQpomA/OED6uEfvje+jgYYNf5Hl34yi
 hBMkevIdjpjG/5jHgEcnrLglQXt5EgOrW0IV2pLJ5Uy5bPmUjghg/nlq6hDW/s4tS9/O
 fGhbxIr+P0t6whnI5jAztYKKA+e9n9ymMnTXrE8G7uUuLqBm97qsusIZz3MlRtFIU8pm
 XlQ1OXGfsiHaTUQAtgRcZOSilXBPDps17lFVyv5wgX57kBr48Ob4bmnD833E9EBYs1z0
 7//A==
X-Gm-Message-State: AOAM531R7ub6fAfWzTXuyISyJJlQlNgztJys18GkD4VLUmqrPvAIEbt5
 P6G9ANs+wNogZlpMojdh0Vs=
X-Google-Smtp-Source: ABdhPJzm8S6QvxC7Jm7ur4kYYxIFDeXo8r8iCerJChS7geyPJpEr9L0UPhbdcwFKI2tl0oyxsMbwxw==
X-Received: by 2002:aa7:d654:: with SMTP id v20mr6147049edr.314.1595762073743; 
 Sun, 26 Jul 2020 04:14:33 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl.
 [83.6.167.207])
 by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 04:14:33 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: konradybcio@gmail.com
Subject: [PATCH 7/9] drm/msm/mdp5: Add MDP5 configuration for SDM636/660
Date: Sun, 26 Jul 2020 13:12:04 +0200
Message-Id: <20200726111215.22361-8-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200726111215.22361-1-konradybcio@gmail.com>
References: <20200726111215.22361-1-konradybcio@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:45 +0000
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
Cc: Krzysztof Wilczynski <kw@linux.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-clk@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, martin.botka1@gmail.com,
 Andy Gross <agross@kernel.org>, Brian Masney <masneyb@onstation.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Xiaozhe Shi <xiaozhes@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, Ben Dooks <ben.dooks@codethink.co.uk>,
 Felipe Balbi <balbi@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Harigovindan P <harigovi@codeaurora.org>, linux-kernel@vger.kernel.org,
 zhengbin <zhengbin13@huawei.com>, Manu Gautam <mgautam@codeaurora.org>,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This commit adds support for the MDP5 IP on Snapdragon
636/660.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 105 +++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 2e02de8a7e41..df10c1ac7591 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -1002,6 +1002,110 @@ static const struct mdp5_cfg_hw sdm630_config = {
 	.max_clk = 412500000,
 };
 
+static const struct mdp5_cfg_hw sdm660_config = {
+	.name = "sdm660",
+	.mdp = {
+		.count = 1,
+		.caps = MDP_CAP_DSC |
+			MDP_CAP_CDM |
+			MDP_CAP_SRC_SPLIT |
+			0,
+	},
+	.ctl = {
+		.count = 5,
+		.base = { 0x01000, 0x01200, 0x01400, 0x01600, 0x01800 },
+		.flush_hw_mask = 0xf4ffffff,
+	},
+	.pipe_vig = {
+		.count = 2,
+		.base = { 0x04000, 0x6000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SCALE	|
+			MDP_PIPE_CAP_CSC	|
+			MDP_PIPE_CAP_DECIMATION	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			0,
+	},
+	.pipe_rgb = {
+		.count = 4,
+		.base = { 0x14000, 0x16000, 0x18000, 0x1a000 },
+		.caps = MDP_PIPE_CAP_HFLIP	|
+			MDP_PIPE_CAP_VFLIP	|
+			MDP_PIPE_CAP_SCALE	|
+			MDP_PIPE_CAP_DECIMATION	|
+			MDP_PIPE_CAP_SW_PIX_EXT	|
+			0,
+	},
+	.pipe_dma = {
+		.count = 2, /* driver supports max of 2 currently */
+		.base = { 0x24000, 0x26000, 0x28000 },
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
+		.count = 4,
+		.base = { 0x44000, 0x45000, 0x46000, 0x49000 },
+		.instances = {
+				{ .id = 0, .pp = 0, .dspp = 0,
+				  .caps = MDP_LM_CAP_DISPLAY |
+					  MDP_LM_CAP_PAIR, },
+				{ .id = 1, .pp = 1, .dspp = 1,
+				  .caps = MDP_LM_CAP_DISPLAY, },
+				{ .id = 2, .pp = 2, .dspp = -1,
+				  .caps = MDP_LM_CAP_DISPLAY |
+					  MDP_LM_CAP_PAIR, },
+				{ .id = 3, .pp = 3, .dspp = -1,
+				  .caps = MDP_LM_CAP_WB, },
+				},
+		.nb_stages = 8,
+		.max_width = 2560,
+		.max_height = 0xFFFF,
+	},
+	.dspp = {
+		.count = 2,
+		.base = { 0x54000, 0x56000 },
+	},
+	.ad = {
+		.count = 2,
+		.base = { 0x78000, 0x78800 },
+	},
+	.pp = {
+		.count = 5,
+		.base = { 0x70000, 0x70800, 0x71000, 0x71800, 0x72000 },
+	},
+	.cdm = {
+		.count = 1,
+		.base = { 0x79200 },
+	},
+	.dsc = {
+		.count = 2,
+		.base = { 0x80000, 0x80400 },
+	},
+	.intf = {
+		.base = { 0x6a000, 0x6a800, 0x6b000, 0x6b800 },
+		.connect = {
+			[0] = INTF_DISABLED,
+			[1] = INTF_DSI,
+			[2] = INTF_DSI,
+			[3] = INTF_HDMI,
+		},
+	},
+	.max_clk = 412500000,
+};
+
 static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 0, .config = { .hw = &msm8x74v1_config } },
 	{ .revision = 2, .config = { .hw = &msm8x74v2_config } },
@@ -1016,6 +1120,7 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 
 static const struct mdp5_cfg_handler cfg_handlers_v3[] = {
 	{ .revision = 0, .config = { .hw = &msm8998_config } },
+	{ .revision = 2, .config = { .hw = &sdm660_config } },
 	{ .revision = 3, .config = { .hw = &sdm630_config } },
 };
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
