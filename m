Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8F522DFE0
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8343289F5F;
	Sun, 26 Jul 2020 15:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736FE89E9B;
 Sun, 26 Jul 2020 11:14:11 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id h28so10072845edz.0;
 Sun, 26 Jul 2020 04:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LUfFfp9zNtMJeMOSyzmVf43tvY2MECImRif7MwVvOZU=;
 b=flI8fWplXeV4NqYt+NbEwfj6/P3nVa9YaeYrW7eNtfbviem/4HL5Inm0sQX/LU+wKu
 0EYMdvebZh9dh5VD0rEyMt13w/pU1oTvM8vCitMStOgAyl6YV6vbhbIGgtwyESO8mAYl
 BWGvAy0X92bxhfnFtBGMPzTJCVAydVjHWdk9mM7NepqofVqGRExYpoGWDz4Ijj9ukxss
 qeycSB33yVv2WWKCbv6TCh+AjydwDITQ3HRW7zbmC2cWNF3c1ligrz0H7F6m0682o7f8
 YRuhLNd+quOdIMZHNEF6720oEbEKchLgYltiAfv3C0O+aSQcoW6XHb/fumE7Gt8+NOfE
 6HOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LUfFfp9zNtMJeMOSyzmVf43tvY2MECImRif7MwVvOZU=;
 b=q5PnibpXyHN3AorxmNKysRq8V6brCblpPIE4B8fMy0fBg5aUB2cXukRrzdwnezV5ZC
 PBaPnD74AJheVCLAmeTJcLzQE6zDqe7OMhSKFO33RSxlZEtMvdp0aBh6UxRfJ2xTnWNS
 Hh4d/+LukUw00lMMHjGr2QOUHjA3cb/CmzgHgX1+7eFl3wrP/56slSeAgHYO1mwHylnV
 y5Z8p556iEUIr/cPI8NkzuU9AvhKLQv3AMZwEU2k8mRzzCcSAlnZkQ/0wKlyt4RhBhv/
 AtLb/CsGsZJgxdFQhBqHcMAzR0+bwYEepS6Sj2idYdC0sOEw0RtLVzQHxB3/LGapiZiK
 OcpA==
X-Gm-Message-State: AOAM533LtycSL5WtMCux1/pBORxsJUzJzSP+ksKMqujlTuIelhlPLgjL
 YZwjnOv6r94lI4yMFMDNKWk=
X-Google-Smtp-Source: ABdhPJw5Eyc80VzfIucZdXtXwLwr8WKxsrf9o44YaVyHILn/zuotPfHFiHAb5I1Q8FGys+Yp0R07GQ==
X-Received: by 2002:a50:ed89:: with SMTP id h9mr4636525edr.331.1595762050104; 
 Sun, 26 Jul 2020 04:14:10 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl.
 [83.6.167.207])
 by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 04:14:09 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: konradybcio@gmail.com
Subject: [PATCH 5/9] drm/msm/mdp5: Add MDP5 configuration for SDM630
Date: Sun, 26 Jul 2020 13:12:02 +0200
Message-Id: <20200726111215.22361-6-konradybcio@gmail.com>
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
630. The configuration is different from SDM660's, as
the latter one has two DSI outputs.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 93 ++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
index 25a13a2a57a9..2e02de8a7e41 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
@@ -910,6 +910,98 @@ static const struct mdp5_cfg_hw msm8998_config = {
 	.max_clk = 412500000,
 };
 
+static const struct mdp5_cfg_hw sdm630_config = {
+	.name = "sdm630",
+	.mdp = {
+		.count = 1,
+		.caps = MDP_CAP_CDM |
+			MDP_CAP_SRC_SPLIT |
+			0,
+	},
+	.ctl = {
+		.count = 5,
+		.base = { 0x01000, 0x01200, 0x01400, 0x01600, 0x01800 },
+		.flush_hw_mask = 0xf4ffffff,
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
+		.count = 2,
+		.base = { 0x44000, 0x46000 },
+		.instances = {
+				{ .id = 0, .pp = 0, .dspp = 0,
+				  .caps = MDP_LM_CAP_DISPLAY |
+					  MDP_LM_CAP_PAIR, },
+				{ .id = 1, .pp = 1, .dspp = -1,
+				  .caps = MDP_LM_CAP_WB, },
+				},
+		.nb_stages = 8,
+		.max_width = 2048,
+		.max_height = 0xFFFF,
+	},
+	.dspp = {
+		.count = 1,
+		.base = { 0x54000 },
+	},
+	.ad = {
+		.count = 2,
+		.base = { 0x78000, 0x78800 },
+	},
+	.pp = {
+		.count = 3,
+		.base = { 0x70000, 0x71000, 0x72000 },
+	},
+	.cdm = {
+		.count = 1,
+		.base = { 0x79200 },
+	},
+	.intf = {
+		.base = { 0x6a000, 0x6a800 },
+		.connect = {
+			[0] = INTF_DISABLED,
+			[1] = INTF_DSI,
+		},
+	},
+	.max_clk = 412500000,
+};
+
 static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 	{ .revision = 0, .config = { .hw = &msm8x74v1_config } },
 	{ .revision = 2, .config = { .hw = &msm8x74v2_config } },
@@ -924,6 +1016,7 @@ static const struct mdp5_cfg_handler cfg_handlers_v1[] = {
 
 static const struct mdp5_cfg_handler cfg_handlers_v3[] = {
 	{ .revision = 0, .config = { .hw = &msm8998_config } },
+	{ .revision = 3, .config = { .hw = &sdm630_config } },
 };
 
 static struct mdp5_cfg_platform *mdp5_get_config(struct platform_device *dev);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
