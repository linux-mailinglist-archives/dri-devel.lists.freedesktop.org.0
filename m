Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D101A07380
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 11:39:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76FF10ED58;
	Thu,  9 Jan 2025 10:39:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nmzimryg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A641F10ED56
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 10:39:02 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3862d161947so375036f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 02:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736419081; x=1737023881;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Z//BQnV3/BLX4Mqa0cv4eDxMczGWbcxFqozmONQlohE=;
 b=nmzimrygrhOSFBMwn8gR2omK4SGIQ2lUeB+8uyq+eYjnmqGYWzb+NvpgXW1Otjs/nI
 Lc+v9u0WGdcPgjBXGfsmwhGOxTEnnQ2e8E7Em4qzycEiWomJAlQBrR5zrlUhmnyLohGQ
 Y97/YbDysQtTVDvwZ2E+f4VUkNcmb8rB4EVa+SIrqchwV7ITO/Jl1Wgzjs0bA3i4/lIA
 majeEpRR1LOR6+UtO00NWa6/EqN73RD0e/sOW2GxtAMsHyp7Y8I/JUPZzpd0xpQ9VbhI
 oX31H+pLY+h8dE4XwvmXtxUtrFiOxrkSh5tl6IvsaQv/1cgXGXT0O5fexZM7ogNYuDyy
 seJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736419081; x=1737023881;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z//BQnV3/BLX4Mqa0cv4eDxMczGWbcxFqozmONQlohE=;
 b=vl0wQnQGfpoHOSGruVx/jwMB3gr5X4c+zXrhBUjy+KfwnQ5rAL0wwhc2IJwR429bMb
 LVnDV0BWXDtwmTTqe3xG668u4pAEvB0p/EHLYH5kw+fAAgZshm62yWGU2QldKSNBwjib
 StdncNMWOVftiuFguWBKTA9pR/Y100bne/CluGUYVO6icHpj+rBC8v+yBn++TE7pq94x
 iAXGWiuXYAx0dwqAFMbw7oMJpLMNIYyyHzwWJ7ge9iN85kOl7K1HEfyU9fS8oSGDrYjK
 V/TiNtv0vlrob42rnDPaCbkxQYZDbIkI3Zo8Ip/fqbCu6jXsp4dU3AxAaUmDzxHXNGra
 GbSg==
X-Gm-Message-State: AOJu0YwSdny2Lt/OsCIMAUozz6ekSECfS6zA/rsHn38DvsCW2HB1dHER
 afr9yYWtMM8i5cJyejvh1OXW2JSuI1pZpjH8BuxN+qvQzTEUgulw7bjUtZu4DtI=
X-Gm-Gg: ASbGncvhNQvXk2827A36vL2BlP+nBSjAb81j+ynIvTF14Vu/zAF9Wlizv99ALxujzGf
 KJMuFLK61HIiDWAk+VDBRmoO7CbugItXh3B/mKBtdtm+1puNW5UyQqNyAxw5DkJ5W8jE+8L2Jkg
 T1Ned6Qry5YW2D9zsvOk8bmikKyNp4crGpIlWHOCUw5E9WAZug+vMJzDEA4q6KoLHxSaup1f6oK
 c2FOYZN97sjuHSfFaXP1gb5QV5Govw4/n9TnO73Ozdk/USh/NiP2MaSY6w=
X-Google-Smtp-Source: AGHT+IFCYv4uf2yFMNDeWwu8dxDCALmnbFIR9ZT4+Lxq9xNx5WM2hH8pnTeOj9g7LOIfFfGA1HWa3g==
X-Received: by 2002:a5d:6d09:0:b0:386:1c13:30d5 with SMTP id
 ffacd0b85a97d-38a872f6ebfmr5116576f8f.7.1736419081275; 
 Thu, 09 Jan 2025 02:38:01 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-436e9dc8826sm16428195e9.11.2025.01.09.02.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 02:38:00 -0800 (PST)
From: amergnat@baylibre.com
Date: Thu, 09 Jan 2025 11:37:56 +0100
Subject: [PATCH v6 3/6] drm/mediatek: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v6-3-c6af4f34f4d8@baylibre.com>
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
In-Reply-To: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf6cDp6kGOPVCiEv8hl9KLU8i+wGPmqu2FquHDK5H
 Q2R0yViJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3+nAwAKCRArRkmdfjHURc8XEA
 Cu3Qoq4Wqg3WdgXcnvmUQIYev871ySwkgvnV7At88mMQ+GkL66NFNsB4PSred1m+OtwjUlWXQe0ryv
 SGBXNcYk4OPx5tyI8k2cJIGhIlQQNxAdQ0gG5CIntqQ6Q5OeliwrbiIm7kekFMGlRBeHMSE88+Fjs9
 BtxhIUR7SoG/WRJCiuaPp1V+NZu0akJj9bmUb+BbRjtcnYzZDapTE3nVYP7JcuI6sVHGTM2KLKnGkT
 gxPGwTXWvM87+FNMlCHcOGxmuIsYzt3Ug3X07f/pPlA5p1HLiIUKnBmyEel1Qh3f578e/bc96J3B4z
 Sz6YAbXC5d4wlRvQIkggqXZAgpYjuJXh0pcXJyQ4x39eF484WQjmKvvN100KMbpVX3anhTXG82vHr0
 VGb/u2fh0BgIzC2cpTbr/Mh60SGd8YiLWpeEdefIZANN0Z4eA1d+qKkQF+MGNIRZWlvVoMQpsalqFD
 1XyoCmR52dau4RmPhyUZ53FyhI3+1mh9FujyIwXqH7x5EhAn5lmmCPthg+Fysw2uU+vZWV4AZxzu/Y
 xEVF6zf+m0E3Go6wioVEbC9bq+FOr+5WQPqQmTRS0L8C8gGxXEgRnr6/6enaWGE7+nGdnIuOGCe734
 i4fZcUhVa5gefRq9qlSz6xBlUTS1Ra82yv1i4o8bKF+ukc1tLLU0fkbK2IpQ==
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

