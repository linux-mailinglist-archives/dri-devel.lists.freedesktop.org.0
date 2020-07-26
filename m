Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3422DFDC
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B987489F31;
	Sun, 26 Jul 2020 15:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2705189CD8;
 Sun, 26 Jul 2020 11:13:24 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id rk21so14259152ejb.2;
 Sun, 26 Jul 2020 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BUGL4K4heQV6cmWFDUkEFsQC/BUMFqKxR1twxpkuadg=;
 b=taV75JWQaoJ7pMv1TUWW7Vq74WconS+Ccozkcy/34AEDVBpwGVTg8p2NAzDc4G9l7l
 rt3Z5OHHnc0L3ECrMybxSfVyk2PJcIfGw9Ok0PI6ysV/L1s7btZjwIRNC58H1mCr7WzL
 WtzqFCKdH5DyauKsm+9TZhnXK53UbEd824ElAJOrP4Bpk+DQFkdY4QOJLIwhfImAEQuf
 Un5tBaV9x/rASEaAC0ue4O7lrYlJQyvtudYClaH/LaX5m2mzNU7Dz76WCZQ8cteyuDIv
 YYrVTSZIPJHlWQrYMPCzOFQa7+mDsrWgN1BuNeKYpaqF4i9Q3AtUbRyMuwbWSXk5ZrxK
 lrug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BUGL4K4heQV6cmWFDUkEFsQC/BUMFqKxR1twxpkuadg=;
 b=UKcovRcF7GvijCnTiBC/XL/bjywGpnAe1Hjo7JjuSJIQGJuAZiEEWtDX/t0QZq89Bd
 FcyElWcp0Sxt29WL0Xtt9QZBbsUeFURuC/wDQiknwS43oizn7HG+qGbIUVv18MCLi0wS
 xXg0hgrwJJhPPVnG7uxjdsnJXTbJSA+mMcDFDpuVNqtG/Yt90NAVFEPaezkGnNLajwdt
 687XySmYLDDh3ZO745Ks1i27oPumOh0H2fM8Jr4YP/dSStvoEXGj0YY2ddvRzFc0oB4f
 R4REPJcB8cl7GU78y9zRvFDxUAXwkseP5JXIO1qkKGMCnkdvwUJVu6uLIp2gtPC/p+vQ
 49VA==
X-Gm-Message-State: AOAM532xSX52lAYOgA4GA1MTIZ++fxli3zRyyNiDP9qXk/qc7u08UOTu
 w/g/c8XhUYg4+ntTKcy+D1w=
X-Google-Smtp-Source: ABdhPJywAuHNjAKzXrb3d7aNlvcztBkTAT7o7wcs6YXMsHMu+ieSvIK/OoAGboYJyc9rP1jU1Caz6g==
X-Received: by 2002:a17:906:7a16:: with SMTP id
 d22mr2892892ejo.478.1595762002780; 
 Sun, 26 Jul 2020 04:13:22 -0700 (PDT)
Received: from localhost.localdomain (abad207.neoplus.adsl.tpnet.pl.
 [83.6.167.207])
 by smtp.googlemail.com with ESMTPSA id d23sm4696253ejj.74.2020.07.26.04.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 04:13:22 -0700 (PDT)
From: Konrad Dybcio <konradybcio@gmail.com>
To: konradybcio@gmail.com
Subject: [PATCH 1/9] clk: qcom: gcc-sdm660: Add missing modem reset
Date: Sun, 26 Jul 2020 13:11:58 +0200
Message-Id: <20200726111215.22361-2-konradybcio@gmail.com>
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

This will be required in order to support the
modem upstream.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 drivers/clk/qcom/gcc-sdm660.c               | 1 +
 include/dt-bindings/clock/qcom,gcc-sdm660.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index bf5730832ef3..a85283786278 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -2402,6 +2402,7 @@ static const struct qcom_reset_map gcc_sdm660_resets[] = {
 	[GCC_USB_20_BCR] = { 0x2f000 },
 	[GCC_USB_30_BCR] = { 0xf000 },
 	[GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x6a000 },
+	[GCC_MSS_RESTART] = { 0x79000 },
 };
 
 static const struct regmap_config gcc_sdm660_regmap_config = {
diff --git a/include/dt-bindings/clock/qcom,gcc-sdm660.h b/include/dt-bindings/clock/qcom,gcc-sdm660.h
index 468302282913..df8a6f3d367e 100644
--- a/include/dt-bindings/clock/qcom,gcc-sdm660.h
+++ b/include/dt-bindings/clock/qcom,gcc-sdm660.h
@@ -152,5 +152,6 @@
 #define GCC_USB_20_BCR                  6
 #define GCC_USB_30_BCR			7
 #define GCC_USB_PHY_CFG_AHB2PHY_BCR	8
+#define GCC_MSS_RESTART			9
 
 #endif
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
