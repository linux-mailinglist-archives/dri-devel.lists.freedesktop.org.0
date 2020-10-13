Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E580928DA3D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:04:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57AFC6EA08;
	Wed, 14 Oct 2020 07:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338BC6E903
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 17:28:42 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id e18so221070wrw.9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 10:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BlvyC7xO8X+UHJiYhKqKJwROYowmoGRyG38cye9lek4=;
 b=D0TVrEykWlhUm/bhD8ZKE0gqYKXdhzaQPwZnWz2KAvB+bJoSW4qWFnIWLlwPD8HqCV
 07pjsS3ciagYi1TM74PzjqWI/LHA8n4Vmq2SVyVa3BLpXuDL+71kspidJi2ih8Qk1Nnx
 vV5/69FEsmRN85s9O9nXCt/zXoXMfuQYZHQDRYM2h1kdc8BVhudtr40OxORl1pVWBHdo
 Jz8N/i+sFqoHRircz4tWcKo4vXBbCZcpxY3+0byc28QSDoxEqtzXWJaA2Do1uYYWNGks
 6rkMAECv++08P5bTNC6qU3aVYzM2+NnF2RC2mWfhlX1oFGVsit5GA6/PTwhZRBfMi+Jg
 EFew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BlvyC7xO8X+UHJiYhKqKJwROYowmoGRyG38cye9lek4=;
 b=Fra83Cc4okYC7P7CgZmB0Yl9qrSHSrU3UYKxS+1zVsolBmtEk/1AQxfzYYK1j/XVNO
 FfkGRzgOKhTDKu69UcG6g6sm+m5/p5RMJ2LFziWzY/EK00xJq95wE8oPCoMazzkbuylW
 mkcIztBdx8pGSGVOcf09vPXK7mtgXTcFftshB/mUQx1Iw2xHiYFWT65HWhfw8EzplzJ5
 /XjVWFfTK5GfdewNhxvaxI2+XO2CHtRAg6F9ocgLL3paK1oBMSo0+AtlCe3+HHUFcO1w
 wphYqdrNA2LPJqob8d9XWKy5SugAUou/bV+qbAjzIvJh6iSvfnikpQdE9KX/DlPccfxG
 E4sg==
X-Gm-Message-State: AOAM5335dEPOqgu8HNjGvBIupaTEsjnX9OZQ4qGb8qCrnZdqyZhDQ9Cv
 Z0f0n4LhuRvDRflf+Lp++La+vw==
X-Google-Smtp-Source: ABdhPJyqabbY0J2ewYDvY5SXI4bIKi5qYlD68/sg3m435CHU1JYk/TdfVENPchAt/0NsWUmXwDj2Xg==
X-Received: by 2002:adf:80e4:: with SMTP id 91mr795643wrl.223.1602610120882;
 Tue, 13 Oct 2020 10:28:40 -0700 (PDT)
Received: from localhost.localdomain (26.165.185.81.rev.sfr.net.
 [81.185.165.26])
 by smtp.gmail.com with ESMTPSA id c14sm315131wrv.12.2020.10.13.10.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 10:28:40 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/mediatek: mtk_hdmi: add MT8167 support for HDMI
Date: Tue, 13 Oct 2020 19:28:32 +0200
Message-Id: <20201013172832.4055545-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201013172832.4055545-1-fparent@baylibre.com>
References: <20201013172832.4055545-1-fparent@baylibre.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 14 Oct 2020 07:03:59 +0000
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie,
 Fabien Parent <fparent@baylibre.com>, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for HDMI on MT8167. HDMI on MT8167 is similar to
MT8173/MT2701 execpt for the two registers: SYS_CFG1C and SYS_CFG20

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c      | 7 +++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_regs.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index c70f195c21be..7762be5cb446 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1835,9 +1835,16 @@ static struct mtk_hdmi_data mt8173_hdmi_driver_data = {
 	.sys_cfg20 = HDMI_SYS_CFG20,
 };
 
+static struct mtk_hdmi_conf mt8167_hdmi_driver_data = {
+	.sys_cfg1c = MT8167_HDMI_SYS_CFG1C,
+	.sys_cfg20 = MT8167_HDMI_SYS_CFG20,
+};
+
 static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
 	{ .compatible = "mediatek,mt8173-hdmi",
 	  .data = &mt8173_hdmi_driver_data },
+	{ .compatible = "mediatek,mt8167-hdmi",
+	  .data = &mt8167_hdmi_driver_data },
 	{}
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
index 2050ba45b23a..a0f9c367d7aa 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
@@ -195,6 +195,7 @@
 #define GEN_RGB				(0 << 7)
 
 #define HDMI_SYS_CFG1C		0x000
+#define MT8167_HDMI_SYS_CFG1C	0x800
 #define HDMI_ON				BIT(0)
 #define HDMI_RST			BIT(1)
 #define ANLG_ON				BIT(2)
@@ -211,6 +212,7 @@
 #define HTPLG_PIN_SEL_OFF		BIT(30)
 #define AES_EFUSE_ENABLE		BIT(31)
 #define HDMI_SYS_CFG20		0x004
+#define MT8167_HDMI_SYS_CFG20	0x804
 #define DEEP_COLOR_MODE_MASK		(3 << 1)
 #define COLOR_8BIT_MODE			(0 << 1)
 #define COLOR_10BIT_MODE		(1 << 1)
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
