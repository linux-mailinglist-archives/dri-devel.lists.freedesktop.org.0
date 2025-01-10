Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C46A091FE
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 14:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EB810F0BB;
	Fri, 10 Jan 2025 13:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="3He8OYJq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9576410E505
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 13:31:26 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43618283d48so15599095e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 05:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736515885; x=1737120685;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Z//BQnV3/BLX4Mqa0cv4eDxMczGWbcxFqozmONQlohE=;
 b=3He8OYJqksydy99VHxK1/ZB2Jmuuy0C9f8u4KzUzuQMlOdmtqkm8fo8HODj6VCMb4i
 IyXhuqjaGBAvZZd9RzdxseRxkC4iQd/+/FegZCnlJ/v66/tPPIFWM/1/mfG9zsleDWdt
 0OWAFO9meXWsCXQ01AEwLxBjGznEdv7mR13twioPlPl4WyfNz98HRN/HlJHFasgLYgsL
 HDRuZ8B74J/SD6PluElPh4BBigzr8s2v9uWWA9rx8tucaRuiWnS/XwrtTeMK4O/X0XRd
 6lEJIvy0sFoszEpL8s8jbtsy0E4HgqjDmg1ZbR4zhI7ZQL/Mx4pxGL0dG6evLPiTlyy2
 dbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736515885; x=1737120685;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z//BQnV3/BLX4Mqa0cv4eDxMczGWbcxFqozmONQlohE=;
 b=sT9Ut5Y/gvDgR5FtV4ez7nudJ3EFJQVNSem+RKQfw8lFz7So8QyNtC5G7GgOpG9K+e
 02gESLEQJt1NXdw8xx/dNMBqrQvVSOKd3bEIUCxyToO4xcO7hlzgUUW+W5ks0L5UltHw
 ALaoX1UagoC5j48zb4LmA6HhF+Ue0GLp8amMKLEpL/c2+IivIoizw1h6CjoZ2Iw3/OSR
 22QY56Hd8nTtZp9UX/T5f3yYeCNmzAC14uxKC8Qh+2RchEG8vnjFJsduW52RlKIfGD7P
 7dxRCbOylCGgvUoT0puaAJCDwuF4F1n1uhVtlxNSjb1GM/SaRy9hRgTcON01MVdfkaJE
 iRIw==
X-Gm-Message-State: AOJu0YyOoJJrCBTDU7c8DvQA4EoAm7BjfmepyE/CGJY0EvN4wubU5irs
 vOKmgZ/omTGCIMYakp/juQZMxJewxB/9utbwBav5u+y7OXJk3hmCN9019XClhQQ=
X-Gm-Gg: ASbGncsS4uedle6j79Njz6b0S2XnuNq+cnN/cL/SBbhKQWTg7dRTaGD3XC2+lB8kOkA
 DTkaJ9jSuUsfEDi+Vx9a7GqoXkjRfsBjf5u7cUCoMJTxobk8el3UT6eLzS4v/dtEuwCx9NzeLlh
 JUVn1BUkUxDrKufKnXifPT9IQ+5n4V2+7ucYTuIxjez9Vt1yQV+8sG8od/XR4PzkKL1u7qO04GY
 XPlrWZd67xYCRNqAdX6DYcX59DWm1d2PjC/i+ws/P0xN9Jd/TEL3NSEEJJp
X-Google-Smtp-Source: AGHT+IFx2GC2yPIa0jo0uLSF3wUAfCDb+jHxkY/Jz5/qgDxr5WT9ZW2q5ZSeDjEs2iELnpyG7PPdYw==
X-Received: by 2002:a5d:64ad:0:b0:385:e67d:9e0 with SMTP id
 ffacd0b85a97d-38a8730d521mr9053765f8f.29.1736515885138; 
 Fri, 10 Jan 2025 05:31:25 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:2555:edac:4d05:947d])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38c990sm4598193f8f.56.2025.01.10.05.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 05:31:24 -0800 (PST)
From: amergnat@baylibre.com
Date: Fri, 10 Jan 2025 14:31:13 +0100
Subject: [PATCH v7 3/6] drm/mediatek: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v7-3-6703f3e26831@baylibre.com>
References: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
In-Reply-To: <20231023-display-support-v7-0-6703f3e26831@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBngSEn6dIUV44F8BjerVW+RaDvB4bQEz+FY+SuSLdC
 zThnaqCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ4EhJwAKCRArRkmdfjHURR7ND/
 9QHUK4fkSZ0JuFIq8kAo9pXcFTRKLN5YRBM6U51ybQaouZrB7uPYUqkPmuHlzNymD7+e1nPAhsjsVA
 fa2fNmQiGduEJhPZZJVQWDOfwizbo7Blgzat5TE946k6xnyscmUl/86A0IcU0T2CaqDN+64RIXbeOh
 tVe4RUUzBFDtrxcOiNUkPTYW6ZeM5t4fyx/Yl+aLItJrrTBsmyne18s3duvddS/5eF/XysLTuDedLN
 JmTG/tFPeUsnaZZkNrkKNvmtvc3bqKKDt+pfcVBsxVlNxcBnw7lSw2L9IHZ1J+So44qRXKJyYitGsP
 epvfvPsHkswsK5VO+hr/K5kHczfxohSGIukWZSJ75GqYqKSM4jDUZWAKo/vQAWfuWG+F206/Jda+wi
 +Gx2TrbfaX2VSSGVtXJc3Va/GDFWFcxA1k3CRdfMklYYmhMLT98eLpSYxY6xT/zXWFHXFSOHtttUkX
 b8vIYKwbVIPi+AO6YUFa5pbFPGeM6z2As/FwyE82JReMRPZpCiVwqro5fZYs8RIZbSYAwZBxMlajcI
 9oZln4Ep0IanTgFreC5xAChZmTxAT07/WJ+Q589eASkEAsPACxQDYDC2vZkUnsYt9Sd6pROxh9P8xf
 RxXuegHE62J2LoezUNJ+7KLyzCwJ1wKDwgFcfeY6c2pPfREbqG+DhICutwKA==
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

