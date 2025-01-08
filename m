Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AE8A0632B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 18:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3693E10EC25;
	Wed,  8 Jan 2025 17:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="s0mDyXBH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D0E10E8FF
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 17:17:56 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-304d9a1f198so50202281fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 09:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736356614; x=1736961414;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Z//BQnV3/BLX4Mqa0cv4eDxMczGWbcxFqozmONQlohE=;
 b=s0mDyXBH4Brq54umPDbmXkA8GYApUPinQez/4j85bx2EazVD8owSZb2U3GHwzulieA
 BxtwUg0mXK+jw+wClQpyh2L6jXxJN2upjhrjw08yNjQ3E8RAiAk8kvRMo4z4deNdoORF
 uBnwJ2ZhinMfBCJqItFA4a/lcfhn4UHqd2v0WfycpJXw13jp1zCWHIWjAcsdtOidk5w4
 t3buMG1wbFoH60m3rcvPuSQLgn6++6bhxy1UAUCWW7ludT/S5eJMTFcAzXB1eGEYLkLh
 fr6IFXw1+Wa773qiHIbUJzbihnUXGhsbH1pAldjL4TaIsaH85ZyWEAohdmGf9Uf3W8Pi
 4QUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736356614; x=1736961414;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z//BQnV3/BLX4Mqa0cv4eDxMczGWbcxFqozmONQlohE=;
 b=Axpk5dWyBL/Mm41HCarqHihlo/m2DYDHcmE5mSCxIy+gAKHDCL4kqQfgo2Xa9SQeDH
 K5DX0R+MaZ4oFYDKdqT8UTjHJMmLFRwtYns1bnTKkJ6Tf8SK2+YgjsjuhkI3zFj9UfYr
 YawcpQYmsi5Ea4ce7mTvDog28gSey4Bu4dzr/XkamYL4vC4WR9HRuLcN0J1jCzM9CLAf
 aDoeMGXEtRVXE/KXibbOhBLxy92uRNvEge75N6vYB/qdNro8OixUi4WclY5F6f5sX4pa
 I/Vd/Q/oAKtSGiS4eiAcmXf2KYofbdZfutVMyPzGZO3Z839V7Sw1hjAOZojhBoTTOdT4
 DWeQ==
X-Gm-Message-State: AOJu0YwhAZPBgzndqBt8ANnfpVf1pLx7AQFDTBBiY0zGrGv6zfnMM6HK
 cL420OSTZsCqN5fIUwoJpaKzZPefKQZMlrqhXuylL9Uk2tzwnb2qgtRCq2v5DZXMlA6DeH+DF/5
 FoEE=
X-Gm-Gg: ASbGncvZZpeGiny1gdrmbnhRRbZrIyJ71OHZwmxK6Etfi0y4N4qUmQo1VWpRGqSp529
 oBIRIDDeIsED3BegrthEOTZs3tZUWW0hgwsoTzF9K3eL+kg0isctEC3fL32Qo0E0h+v4UVve3ma
 4MNajmRt6SNUQ7vj5NJOEqTooQOBQ8TA40CjlgfPwM2CaWBusUwvN9gc4hfVl5j6k62QutVMVLV
 t4bJqH2Pa7HowAs1O50MFMaCvDSXKvhe2iXAaWaujJuBpSQgnGKzYUfUnFM
X-Google-Smtp-Source: AGHT+IEzYCyDPtmZet9IESJnJcczVG0Tz2UFufCK02FKKCMdlBUnSYYfqsvJZPILRHP2VNY2oh9nIA==
X-Received: by 2002:a05:600c:3b91:b0:434:a802:e9b2 with SMTP id
 5b1f17b1804b1-436e2696d2amr29002085e9.4.1736352950886; 
 Wed, 08 Jan 2025 08:15:50 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:a6ac:e6d2:88e3:8ea1])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436dd14dfcasm44378105e9.1.2025.01.08.08.15.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 08:15:50 -0800 (PST)
From: amergnat@baylibre.com
Date: Wed, 08 Jan 2025 17:15:45 +0100
Subject: [PATCH v5 3/7] drm/mediatek: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v5-3-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
In-Reply-To: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=wfidoNqLEIpqSK6RG2PAlzWtAyJfTIKDPdldVFKf2ag=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnfqSye5kt3J6GYi+bZ8GcSkKlLUWKEFFC6cY1vbKW
 7FFURcmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ36ksgAKCRArRkmdfjHURdA4D/
 9fiHHB6Wig9ZucEqwujLgch53Y1WqqZBYFfo6+SJTqGQsJJxWsrL06N+Xh2s0Eih4DivhcJD3H3w5E
 vhNiI6SW4lRDX6kTOTkriOjx+f5tsRIBynsVgNOz5fC/roAhy7ImU0A62IX++/X21xaHz9ap56xPDn
 eZgWAgqHrQQlfWbUkOU0C+nl/x7y4a8FPt5WR4zoL5YS+BbNIYycp6+zDrDIbd6DGzGwY6jwY6muVW
 +9OGsqqZ5JPf/dTVMdmzckiZBEwNQ+h6vTaWAgecDiVrYwo9/WwNKKkwUXxFyytLulD7OsT/hrVCGk
 fsAymQJIqWOvIb0W4zQq9hsyQ0AFHW8Ysftb5WoP1ZUbSjRj9MKd7TFqt9m7KNCIyJK5JHkwPvX5gV
 aOOP7KpQmGphVNvHCZyFbqCMZIU+n5wplNAIhO9hVJs65K5ZCWm6vgVASULRYPfiBPUznGAUaKH/t0
 Cri9iX59+4+6nwmIu4pht4zfuyzuwclMd6LPPKx7J+KXJ3hn07Hl1Ov8656J6xqeoF/eNbQTI4gaX1
 Hj3jlTXUX0K9HOeHj8S3RrB/0BBBewC2bx1dmfa8nZErOgUxLsTnuh7y72F5rbVCmrPcZv3vsFsbJ2
 ySpGwkBYjXPGRZZV2QY37k73SRPyon4NdLo/fiuBV9NcOy34ce0V4vezotuw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

From: Fabien Parent <fparent@baylibre.com>

Add DRM support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 0829ceb9967c..5471ef744cc1 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -328,6 +328,10 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.min_height = 1,
 };
 
+static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
+	.mmsys_dev_num = 1,
+};
+
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
 	  .data = &mt2701_mmsys_driver_data},
@@ -355,6 +359,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8195_vdosys0_driver_data},
 	{ .compatible = "mediatek,mt8195-vdosys1",
 	  .data = &mt8195_vdosys1_driver_data},
+	{ .compatible = "mediatek,mt8365-mmsys",
+	  .data = &mt8365_mmsys_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
@@ -751,6 +757,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",

-- 
2.25.1

