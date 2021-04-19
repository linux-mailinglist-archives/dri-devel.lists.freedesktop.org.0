Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60BCA363C96
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 09:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE56D89935;
	Mon, 19 Apr 2021 07:33:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BC489654
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 07:33:06 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 i21-20020a05600c3555b029012eae2af5d4so7976708wmq.4
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 00:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=emj6t0YnQ8kfODwk6pGcM/emMJNNvWG7eis4Ne6JndY=;
 b=ZL4CqRjEM25VfPQ91mxKikXxoGFcWs5V1j8nRUuzj1LuXfZwD+rcZUBC19BuehGTtr
 /jXy3BDxC93xAAtPnfoY7UsF8/c2ygJ0ei15efmQ+vjFGTGg2ACxp+az8DUBkHj7U24B
 GevTlMbtm7rIUrN8ZdbmTcpNEiOR9SjfNVenUwqN8KQ/ltddApEwLrfpImQtrwGTJEjh
 fngb4LerqOOcvGPNxq2mf+fSitFXKbwuOE3JDgaacF3qJo7f1rtRrPOKEesDuNdCQsfq
 sjlnBAD2LbnjH7BxcsTQcSgMZOFur10IOlnEqJr5nvt2x06fGuynWHVz/7X0Fwpk+SVC
 ISLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=emj6t0YnQ8kfODwk6pGcM/emMJNNvWG7eis4Ne6JndY=;
 b=q1b9hwe59xWefWRImYz70pJcsIXSbbCmWj+MxJAG1Z/JYUQWQBzqTxA+kR7amkCBG0
 DS9s1Ermjv+RJVL/RguMaTKWThq3DKia13sVwkyHRM/acKDDZCuUNZdKnyytDVX+wfJg
 hk2Vjl7tgrkFW7DClO4Vpe1vuNDzNDAQwiKqm8WVBBNTTVxBApi0KfgBUGr7Vx2OBR1U
 Bc3QdFyADPjHO1aZUbdxJDoqouqGZSMWWb0n0zYevuBpU/YUV9EbGA9w1BtuOopMvIuj
 TxzbW+T9vzB+AGlo/YhyVonXYkwGoXSztbVOBiNZeQZYIj/qZ0IB4V4Wh6SzTZMcXaIq
 dn2w==
X-Gm-Message-State: AOAM531SnquC0Ccx+O5OWJHBS/pUasl6MLF4toYi4AUXIyCC5LXTDUBe
 7/bFjH+mygKVTTDXFnmO4vxX0Q==
X-Google-Smtp-Source: ABdhPJzGQL1OhlR8+hi1vO6S/bHuXkKUrxWtipf9az5y2tpodd03GfcTaLLiX/r6QDId8mHxWWHkQw==
X-Received: by 2002:a1c:7d92:: with SMTP id y140mr20099187wmc.41.1618817585523; 
 Mon, 19 Apr 2021 00:33:05 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id
 y125sm5492311wmy.34.2021.04.19.00.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 00:33:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com
Subject: [PATCH v3 5/5] gpu/drm: mediatek: hdmi: add MT8167 configuration
Date: Mon, 19 Apr 2021 09:32:44 +0200
Message-Id: <20210419073244.2678688-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419073244.2678688-1-narmstrong@baylibre.com>
References: <20210419073244.2678688-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=1cCt+CaaWnX35LcUAeqH/AEy6pDlaztP4tTWRAOEW/o=;
 m=teArBpVk0i7hN2a9Z6e7zXDAZkWNF5zds9OXrfPJoB0=;
 p=K8BqlJdCG5wZ6jJdNp1bjexbIQG0ke7ZpzDma32UUOk=;
 g=6cc1cbbc495832f0509ff603f4cf0aef4bc07664
X-Patch-Sig: m=pgp; i=narmstrong@baylibre.com; s=0xA4CFF8AE;
 b=iQIzBAABCgAdFiEEPVPGJshWBf4d9CyLd9zb2sjISdEFAmB9MgwACgkQd9zb2sjISdEMxxAAwQG
 a+P54dAPqlMY8zUbqvNt5ka/vcf7mcAprjgN/KlWL1AGezCSgcDrg14v3AenQoy0qGmKNTOWWXNgy
 KUDxzxqqLMN8026Rbu9qA7UYiXBATnDffnboSbdDIp1pq9BNmPxcXh3TxJaY4hhellGfM/mayJOEM
 ShU8TTCZNqloDOMVg70ASdsuanBjdHAvdnuej0NkHyzRyExEXen3COBwjIR3XfxQOeTk2a1SKk1ZI
 ODSa0Z/WrffKry0RNauAowcFc1HEMWJOA/WOzpy5XhkNhYUgXOGUkE9mP46T0FBqk/rPEPlNLRm8g
 tngkf1Q0yr7pnW6EIsO5n7UeYMDz8d2oxXzjyu96SVYyhyu9FvA616lLwSuSRNj3WcS49t/aEYXe0
 yLcdRpQrsYCcEJXv4CmL+2DM6CG9CvIcfDkB8BomaihadIG9o71Y623796hJw/N5QzCli31vz3+xO
 HmARnkiHXlLrCHCuEhgHauJcbR2qtsrUPB7uagYIR5GjSFDfr9MOfTohL6/sPjWEUFHznhilRdd+1
 j2LapJBSbUHjoIiGiPDw5xfzhYeZP/MFKaFQqb4Zyk/OBgeAJTTgLYByTyez5xIcTTc0SJ7m1mQYt
 jbm09ErtlMy9clPUBh0c9ZiMu/j/oo6Z0LH9Rfu5P27shuGK4WybCEhfHVkBAU24=
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MT8167 SoC have a hard limit on the maximal supported HDMI TMDS clock,
and is not validated and supported for HDMI modes out of HDMI CEA modes,
so add a configuration entry linked to the MT8167 compatible.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index bc50d97f2553..c1651a83700d 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1787,10 +1787,18 @@ static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
 };
 
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
+	.max_mode_clock = 148500,
+	.cea_modes_only = true,
+};
+
 static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-hdmi",
 	  .data = &mtk_hdmi_conf_mt2701,
 	},
+	{ .compatible = "mediatek,mt8167-hdmi",
+	  .data = &mtk_hdmi_conf_mt8167,
+	},
 	{ .compatible = "mediatek,mt8173-hdmi",
 	},
 	{}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
