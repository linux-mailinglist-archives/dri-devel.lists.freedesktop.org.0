Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDAD22DFD2
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1E689EA9;
	Sun, 26 Jul 2020 15:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84E2894DD;
 Sun, 26 Jul 2020 11:13:59 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a8so10070935edy.1;
 Sun, 26 Jul 2020 04:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kblxKnxinnz+/M7vUiTqrcSx1B8yJRoEQmLOic6ozMk=;
 b=WW5fOTnM8Sb/6XwqIAEb27IZfAR1oQnnp0fHyVrgofmjA3fYt80WX3Wn6+IFfpfb0z
 tYsYYFFUdphAsqgGeU7ZR/x35oey0J/AsowhWuFqgN52xrZY0rPY517PJuhnR7V+EGO7
 RUThcesCCqlZJzRNecLPZRmUAnugmKsi4s208jNdk7TutMUxDg3D6t4AY02pgBF4QbcW
 jy+22HWWUejEGkGcJGWHmiHRjaf3FYn6p65o4dCCs8kxccm9sMmo0uM8u7hR/N1yjnUQ
 gXrlLl8fXheqRk6DR/Vo9vAwH5RYD1kMWBc4/AEJnN3oCUYt+UJadF+ajaX72aDElbdY
 7Dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kblxKnxinnz+/M7vUiTqrcSx1B8yJRoEQmLOic6ozMk=;
 b=JauIQwnMslvYTiuCKxmsTiSVgfwjWQRoBmcaTt5/ep5SnomQOhiYtZCrVS7h0cUgCz
 ikpdtmn18TF8vGJskHTcHkOjnh9yuEkYS5TFQF4ZKHHFteTuB7g5nI82gzTIRRERfV41
 zq9Fuz9ofRxOvAoyq4A2+gsznHQax5fle9SuJ5OviQqGtaAL7Rst5MVMmjMUr+pEED4E
 lWmiJFpXrLPRpdZVfUU87EMMLkrKVnZMXYqySHKXG8gpYhzn6uH9K/FctJgYb1MgVBK6
 Ptbmzn7RFhEmmQqS/yuB2GJrJCvqOdillHwyr4sIz4paGruLNZS+YKvhPAO6ttZkLCUD
 Nw+A==
X-Gm-Message-State: AOAM5318wxfU+29lQgWoyZDMyWqND8Vqd6F1itjg5XNT3D0FDhSMmRNa
 H736xUgljSAhDMrgrm71zjc=
X-Google-Smtp-Source: ABdhPJwn8KnXt0Jwp6P4CrpPb9OKxg2T+un1Dn0xfYJ60+M/Ch4V89+fkamHjPtgu6KCOwjVgazHIQ==
X-Received: by 2002:a05:6402:b6c:: with SMTP id
 cb12mr16949597edb.116.1595762038257; 
 Sun, 26 Jul 2020 04:13:58 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl.
 [83.6.167.207])
 by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 04:13:57 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: konradybcio@gmail.com
Subject: [PATCH 4/9] drm/msm/dsi: Add phy configuration for SDM630/636/660
Date: Sun, 26 Jul 2020 13:12:01 +0200
Message-Id: <20200726111215.22361-5-konradybcio@gmail.com>
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

These SoCs make use of the 14nm phy, but at different
addresses than other 14nm units.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 .../devicetree/bindings/display/msm/dsi.txt    |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c          |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c     | 18 ++++++++++++++++++
 4 files changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
index af95586c898f..7884fd7a85c1 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi.txt
+++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
@@ -87,6 +87,7 @@ Required properties:
   * "qcom,dsi-phy-20nm"
   * "qcom,dsi-phy-28nm-8960"
   * "qcom,dsi-phy-14nm"
+  * "qcom,dsi-phy-14nm-660"
   * "qcom,dsi-phy-10nm"
   * "qcom,dsi-phy-10nm-8998"
 - reg: Physical base address and length of the registers of PLL, PHY. Some
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index f509ebd77500..009f5b843dd1 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -499,6 +499,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 #ifdef CONFIG_DRM_MSM_DSI_14NM_PHY
 	{ .compatible = "qcom,dsi-phy-14nm",
 	  .data = &dsi_phy_14nm_cfgs },
+	{ .compatible = "qcom,dsi-phy-14nm-660",
+	  .data = &dsi_phy_14nm_660_cfgs },
 #endif
 #ifdef CONFIG_DRM_MSM_DSI_10NM_PHY
 	{ .compatible = "qcom,dsi-phy-10nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 24b294ed3059..ef8672d7b123 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -45,6 +45,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_28nm_lp_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
 
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index 1594f1422372..519400501bcd 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -161,3 +161,21 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs = {
 	.io_start = { 0x994400, 0x996400 },
 	.num_dsi_phy = 2,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
+	.type = MSM_DSI_PHY_14NM,
+	.src_pll_truthtable = { {false, false}, {true, false} },
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vcca", 17000, 32},
+		},
+	},
+	.ops = {
+		.enable = dsi_14nm_phy_enable,
+		.disable = dsi_14nm_phy_disable,
+		.init = dsi_14nm_phy_init,
+	},
+	.io_start = { 0xc994400, 0xc996000 },
+	.num_dsi_phy = 2,
+};
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
