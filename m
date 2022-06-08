Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAE5542FD0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F1B10FB12;
	Wed,  8 Jun 2022 12:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 439AE10FB0A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:38 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id u23so32923819lfc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TJk/SikG5/vA45QkNSVMmjHsA7wDjKxXh9SBvVTqBUw=;
 b=sV7t8YmUJotbqhmny0KXLae01QlXJrO1YBHx77u9k3QFfh+3zqvPItyBJyaS1FSv7n
 zofVscq7IFaRIt37QtUg3Xah/S/2x5BMa7bt5TIsFxMVg3v9WsuE2gmGUQrKz7jfteZb
 LxpkyVpOdjs1wgqiib7kPuH29KShJYz1qzWB7qr2fDY4oCeeLt8Y7J1TC32OqBr5sik4
 LvHn0NljE/1m1OCvzbP68KOKpqvV5Tgoy35yGPZUblvdRh8i6Jifb6O0do8lrkwasnEZ
 /J8MC/UF9y286BcUe0J/rS4twQRemKlVO/7pONjdufzYWOzlIMMGgkSppW52k6Crup6/
 hAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TJk/SikG5/vA45QkNSVMmjHsA7wDjKxXh9SBvVTqBUw=;
 b=LGu5lBzG1M7/vT8bj2r4qbneRfgNsAqaAFWGNU6PXBmDol83ItNURYMkt47zTtKXTW
 mLLKDTIJjXQms3S8iWBZX5Z99dvpy2guaIEZQkItC/g562ZxpeH4LZKhuIgQtu2Md9s2
 2jratMRIiE+a24ktZB7k9QGUfMBO9cwkfucD6ezt1EFUp75PkTjITZTZJjR+Ov5cb1Mc
 /rghZSqVkQ8ExG8HyLsML3gFS7E4DEjoziZeI3czIyxOOAajuIWYtPlL4YSVdtjaQGG9
 49CjaXGQx4ck+Zo4eL+8qjS5SZ7hACRwutRFrGOMKtRpL6O5n7x0f4Tz+UQMAwQ8tMsM
 EBMA==
X-Gm-Message-State: AOAM5330c1CECM9bpOe22k5in7Tu4nm7rX+MIY+as4ghpF7bA3p0rUKc
 ZYkMMvDXR0D/OLgDMpDXoedIPw==
X-Google-Smtp-Source: ABdhPJwLAAPw1s0RFNSdQ2kbvtrB/PHpfA5nUjCe4dgJOTxGw02vXyxc47pFvRGLPzW0518hV1Di7g==
X-Received: by 2002:a05:6512:15a9:b0:479:56e2:6f1b with SMTP id
 bp41-20020a05651215a900b0047956e26f1bmr7015597lfb.219.1654690057808; 
 Wed, 08 Jun 2022 05:07:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 12/12] drm/msm/hdmi-phy: populate 8x60 HDMI PHY requirements
Date: Wed,  8 Jun 2022 15:07:23 +0300
Message-Id: <20220608120723.2987843-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Declare that 8x60 HDMI PHY uses the core-vdda regulator and slave_iface
clock (this is the same config as is used by the 8960).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
index 95f2928cb2cb..1d97640d8c24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
@@ -122,8 +122,20 @@ static void hdmi_phy_8x60_powerdown(struct hdmi_phy *phy)
 		       HDMI_8x60_PHY_REG2_PD_DESER);
 }
 
+static const char * const hdmi_phy_8x60_reg_names[] = {
+	"core-vdda",
+};
+
+static const char * const hdmi_phy_8x60_clk_names[] = {
+	"slave_iface",
+};
+
 const struct hdmi_phy_cfg msm_hdmi_phy_8x60_cfg = {
 	.type = MSM_HDMI_PHY_8x60,
 	.powerup = hdmi_phy_8x60_powerup,
 	.powerdown = hdmi_phy_8x60_powerdown,
+	.reg_names = hdmi_phy_8x60_reg_names,
+	.num_regs = ARRAY_SIZE(hdmi_phy_8x60_reg_names),
+	.clk_names = hdmi_phy_8x60_clk_names,
+	.num_clks = ARRAY_SIZE(hdmi_phy_8x60_clk_names),
 };
-- 
2.35.1

