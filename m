Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 695C65BD2CE
	for <lists+dri-devel@lfdr.de>; Mon, 19 Sep 2022 19:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3402510E04C;
	Mon, 19 Sep 2022 16:59:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8951510E076
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 16:59:46 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id a41so145766edf.4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Sep 2022 09:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date;
 bh=VIAi0nNwF0EQ4Ycv099voA35UIwgAD/zCbxE9L3eFBQ=;
 b=R+qQPnPqizqQy0t3jkiLKwfr4K4/dgarwPfFttzlNb43E4o78izHqlKaHUTtF5L0aX
 U2rW7VDjsEC3GyuX7FFwe1iKr1B4FC7xjZcFh06+y0ryXl2F/GrkLLm1obnIhZPXlqL7
 hPJoE+3Rb00pJAWDNwRcizomgd5BsFP4RIF3WmuztmNQRO3lPH435EjKkezKb6JjjiFm
 +D7J3psGA0bhm1mdY2z/1oZ4WG2QYmi+YfIloXmbs1HtYN7LY1dMPOfFPG5+1SH3EjLd
 6WQPNGdX5ebzgk8mDgJXkf0TTio5UuUFR8R/cQCrHXJKjw3iFhqEji1Adg9w2agMIAih
 tkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=VIAi0nNwF0EQ4Ycv099voA35UIwgAD/zCbxE9L3eFBQ=;
 b=PIlPZPUlW5ggRSx5T3+bW00YxhEUPvfCHTSOLr/cojrKafO8zqb8HMes52RSkHhn3e
 8IcVpP+gqilPxsQoR9gsWOc8yBY8Pzemcl7PFvy2eBW+j950OGUU90iOJmzWyjKVA2V/
 n8HR6VIYEVPTReVzS7j0vg1dXSIJ/6BTQNELcV7ZWdeT2FQ188/ut5upIBLV6LSC0Ho7
 yLKvpgKultr9oMZSAaqSZCPf8uGazc774dpmMZBAh3eQb9ApYN/SWIUOYnJzbNXmuwX8
 HaBbJcXPULBboRwE2CAeIqF8U8+LqqK/huAngMgQNkNVEcwJ3EphrwKz0IVG1J5QvNor
 utEA==
X-Gm-Message-State: ACrzQf33j+7U8rTc+awwBHG18xcbHhNP+07NTFuaGHaa9H4lNTdqsftM
 WYTgCRCsTRQmaSmPfRZWGl6WCQ==
X-Google-Smtp-Source: AMsMyM4FWcGqIb04fz++aRLharY4kKuVTi0otIV+l0WpEp9ORTAl2Z/yp1vEqg/lPBMW1Gcd0sxy3w==
X-Received: by 2002:aa7:c585:0:b0:453:e1c6:7dc6 with SMTP id
 g5-20020aa7c585000000b00453e1c67dc6mr6810316edq.245.1663606785020; 
 Mon, 19 Sep 2022 09:59:45 -0700 (PDT)
Received: from [127.0.0.1]
 (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net.
 [2a02:8440:6340:f287:3074:96af:9642:3])
 by smtp.gmail.com with ESMTPSA id
 cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.09.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 09:59:44 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:55:59 +0200
Subject: [PATCH v1 01/17] dt-bindings: clk: mediatek: Add MT8195 DPI clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-1-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 David Airlie <airlied@linux.ie>, 
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.10.0-dev
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
Cc: devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Pablo Sun <pablo.sun@mediatek.com>

Expand dt-bindings slot for VDOSYS1 of MT8195.
This clock is required by the DPI1 hardware
and is a downstream of the HDMI pixel clock.

Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

diff --git a/include/dt-bindings/clock/mt8195-clk.h b/include/dt-bindings/clock/mt8195-clk.h
index 95cf812a0b37..d70d017ad69c 100644
--- a/include/dt-bindings/clock/mt8195-clk.h
+++ b/include/dt-bindings/clock/mt8195-clk.h
@@ -859,6 +859,8 @@
 #define CLK_VDO1_DPINTF				47
 #define CLK_VDO1_DISP_MONITOR_DPINTF		48
 #define CLK_VDO1_26M_SLOW			49
-#define CLK_VDO1_NR_CLK				50
+#define CLK_VDO1_DPI1_HDMI			50
+#define CLK_VDO1_NR_CLK				51
+
 
 #endif /* _DT_BINDINGS_CLK_MT8195_H */

-- 
b4 0.10.0-dev
