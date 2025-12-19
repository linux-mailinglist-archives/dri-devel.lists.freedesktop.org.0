Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5179CD0EE4
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 17:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40DA810F04A;
	Fri, 19 Dec 2025 16:41:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="M+FrMxmv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7BF10F040
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 16:41:21 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b734fcbf1e3so356485766b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 08:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1766162480; x=1766767280; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uWMS63VZAWh+LwVHiFL3RZByyF+lbmglu9thz5C4XBk=;
 b=M+FrMxmvXpFWChuvXZ5aodxCjUehv4mQRQDhh25lllI/jzVaVQcc6QTFQn8Ckmw6qV
 1qncuCvVSRDASKzTKhdB2w/iwJ4EILWTiPHcTJpDqam/WDtg0T18KP23ZFSmABiDswx4
 qiGZYDpAilWTkuFcm7ucMqFkGxiQdUwtxyl4dLDJPUDjht6PXMCj7Qxgc6EfAAx8UrT5
 mpkESj7KQU7Amq2LORqUHmTTriVdkPV5J8Z50jpjgL/ngq5ZTIfxyZywxifoSzQUsrrd
 9g+fFZEFQEaxTYEZ7YT5EEUXGiHvslVTR7m8LA4ipuWQebGjjoNUGiytqOgLqtQ1xwer
 aPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766162480; x=1766767280;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=uWMS63VZAWh+LwVHiFL3RZByyF+lbmglu9thz5C4XBk=;
 b=PDZYDaFGwjewKBUfcKUuz1eNjqip+fk7ctOy7KoVHPOHSZEl8eMhcGKWQ5rAk/9CYx
 V63pQR3uVmIcPDRB2G1cnF5WEiP86Fmbqecz8UfZgxOhTBa1dAmET/awlJtVA/sx4CnV
 T5CniBBRxqOHsckwwYzV2srVNoB0bGhFxNA2Ea0Iv+0VNf1id5bcP41LJfRvIhbJLua1
 l1eIiFQIaNfnvv3XDlPYU8XgWSd0pkZUtKkZMYx4VgQwuMX50ThzRj3Gh5TFIzwtG1ZQ
 dWAj2j1IpNvwDMld9Y1b2Ps7tSn9dAJAzqJQLyqPulJcIp+5jWy+hpYpGF1uMN/wrwgC
 Od8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPsOcofmy+IUrNNvPiDJGWgWdsCKXn72cPnVNNsiN39pOkg7VbfAvX3SPampfiV7EtmnCbi649mkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrPdWSNNpDZAVd8gS2Pfzg0vuOcgpKB8qFOPTdlcwQU4UqNkli
 HPhoNn2OL7L052OXqKG1fGgyFzK+rX6UxONv+X8o81QIKM/cIAOJb4cbEk0LKQaCU98=
X-Gm-Gg: AY/fxX4+iwPaPFMuEyjz4/3KJ7kGMvHPQeXc0r8s9xpOsmeyBwL77Py0kAWErYVXuXr
 ZnsbNSz4Tjp8MeaCEJA4h89FVGeiiGvhpeEVHROEM37W75dxpvglj/8Vp6RZe4L48OGlrY7YXcN
 S9Uf3tQi0CLmhzNiSt4MQf7e8IccCrpRv4VoWGJYSS2qeSCrfBrXYHUCJZkUJi/sbNIODK/Yxy1
 RbRvsv6tsFgPd28swY9UrHGV6ynVIxXWWtbErJa5/1L73WdvHJAN5h5EqQ7u0xkd9yzxe1aD/1t
 d6zFzDwWve+Sv3zGkfS9Niv0hBHJzCHjTrSpeIqDIDCRFYBEKOwBZIOXruK1M3EuTH01sPpKnCL
 i1lGTp8An7r5eBXlbteFkBhMzs9arzBdOqp9tVl3UEg2fUAunwpNHsS8kM/wpMDA/c6WYZr/Hho
 NVLRIGoxcZO56/EBZGRG3oZxvjQ0wWoEcD7AwArIVJSurDd/jedjgNUVLZSCW0m3Sb/kM8XUgcS
 XKlR7SpYiS4dAqC8fFknxbw9S48kCnjxaY=
X-Google-Smtp-Source: AGHT+IFeBLx34o/uuAUMdH45ClT+LNyEz+ShlvD87iHmO/mzLZ8v0c7+jV3dTjNrwelR4FlFcBNZ7w==
X-Received: by 2002:a17:906:fd81:b0:b77:18a0:3c8b with SMTP id
 a640c23a62f3a-b8036f0a48bmr315593566b.1.1766162480371; 
 Fri, 19 Dec 2025 08:41:20 -0800 (PST)
Received: from [192.168.178.182]
 (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:3b89:c600:71a4:84f:6409:1447])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f4ef1fsm270073866b.64.2025.12.19.08.41.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Dec 2025 08:41:19 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 19 Dec 2025 17:41:08 +0100
Subject: [PATCH RFC 2/6] drm/msm/dsi: add support for DSI-PHY on Milos
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-milos-mdss-v1-2-4537a916bdf9@fairphone.com>
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
In-Reply-To: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766162477; l=2966;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ohNmR27RG7BPFcETLws/RzDvloxNbzu49qmgmsyHzbg=;
 b=u8kMZZ5XCdBAQqVc75EEYESeLgtSwulD/FZN1Nv9WKgIfHtzElwwgfCg8ePkE2aG/YwOFsu88
 +7CWnoGudYNBpfHSe96RbCE5NSbFfaFoIDAKT4j6P4V8E4RsRpxpuIQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
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

Add DSI PHY support for the Milos platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 24 ++++++++++++++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4ea681130dba..0ac5029d3eb4 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -571,6 +571,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_5nm_8350_cfgs },
 	{ .compatible = "qcom,sm8450-dsi-phy-5nm",
 	  .data = &dsi_phy_5nm_8450_cfgs },
+	{ .compatible = "qcom,milos-dsi-phy-4nm",
+	  .data = &dsi_phy_4nm_milos_cfgs },
 	{ .compatible = "qcom,sm8550-dsi-phy-4nm",
 	  .data = &dsi_phy_4nm_8550_cfgs },
 	{ .compatible = "qcom,sm8650-dsi-phy-4nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index 3cbf08231492..011bee593199 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -61,6 +61,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8775p_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_4nm_milos_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index c5e1d2016bcc..6ca45e5c2cc0 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1436,6 +1436,30 @@ const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs = {
 	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
 };
 
+const struct msm_dsi_phy_cfg dsi_phy_4nm_milos_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_98000uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	// FIXME not sure about these rate values
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0xae95000 },
+	.num_dsi_phy = 1,
+	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
+};
+
 const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
 	.has_phy_lane = true,
 	.regulator_data = dsi_phy_7nm_98400uA_regulators,

-- 
2.52.0

