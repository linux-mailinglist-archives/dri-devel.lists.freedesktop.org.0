Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 155C3892D40
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58B5D10E5AA;
	Sat, 30 Mar 2024 20:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K9mD8/4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B1110E49C
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:43:35 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-33ecb04e018so2223655f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831414; x=1712436214; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=s2SriLcn9TJO3LgQJx20T2AIgEEtOSgbbLiOwdTXH8A=;
 b=K9mD8/4+krAAygG7qht3nYSCINVJZPZzcx/XdzgpuGl+2rAtQ4Mx485ypBf1z1w+rb
 9YGW9XHoYES4pp0S+hSALkRdrPCgoHxKF9/UMrM79E9FBrooE5GT0kQoYxYtsrw/y3uN
 BdyPb3Urex8mKCHWfujvsIJN/peXGNNEXfODfR111eXv5KQfC3BaZ8Hb8jXU4rGbPx0t
 BN/b82eDPtmBzd4vSUHSJA4CcbQeSk5gXWZ0Y7RlqoMGv9cDMPTGJx3cxHvTXJbDnD87
 166bnCB8kY6nrN0eyHorusC0Lhtg7oou6hmS4g2A/MA4ZCAxRkgR25f4RcDajsmmZnK4
 xSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831414; x=1712436214;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s2SriLcn9TJO3LgQJx20T2AIgEEtOSgbbLiOwdTXH8A=;
 b=rguqe/C8xCNg66i4pmv0Wq9fP0W8ra0r0EiiwjB/wn/GvFC1x2+xu/QHFaFdHSgmpl
 EvAi8kfrgU8vYMOKzcaBKGZR1lfpI/lF9zmV4lhQbouMxE8MHk+Qb8Jl8MVbCvxXs1ZY
 /Vo8IasquRKzIORzWfCYRGkhoVhVHFu6OS2v8/gBQRtYZRtKUU8yEMEOHou4vIoVdRsF
 4nv3sQoEw3QR6oJdmXsn2po1lRmbwCSmp9KAOKhuVYkiie0mpMG8OzMqvPntdJFzzvPM
 FY6cJC0YggN1p/6+vhUMUCOh6dz/dT6szWBtA3oUo6+WjMXFTV5ROj8rDMv/3bdi4fVg
 rzUw==
X-Gm-Message-State: AOJu0YzrAxXtvh4RC+OFTpPhKyXMmLPMFGGZmiAVJDQlpd8Bn6hQ/Auv
 JBxju9v9tdvc9KRolZ1y7K88k3XlGj+J0M8U4SN7jLYGQP/6sTTVoG1UeYHjISI=
X-Google-Smtp-Source: AGHT+IFvLt93H7dQNeEDZguMmmS4FNRGep53208CGmKxPVfo+bNUGLha89NjiS6FAQW3YrbqOBbHaw==
X-Received: by 2002:a5d:6188:0:b0:341:9a78:c008 with SMTP id
 j8-20020a5d6188000000b003419a78c008mr4014410wru.49.1711831413830; 
 Sat, 30 Mar 2024 13:43:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:43:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:15 +0100
Subject: [PATCH 04/11] drm/mediatek: gamma: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-4-fd5c4b8d633e@linaro.org>
References: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=857;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=fEKPyt5MKP0ErlDj1eUkq/Xkd/ayVcNlQIh45H48Y8g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlngBYZ9rPEtMEx31DNrPcnol9e/jXK/FMCZ
 lDKDZ5jf7mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5ZwAKCRDBN2bmhouD
 17gKD/9p5cCATU5vVXAAZCgUsG7dmcij8oCywqqHS3x1Qq0cqPf7gr0Zd/kpFMF1DdMssMO0dYX
 XK7W92I8IUSdDg22IuZWSH8ktqIHU1QzMdorcsI3oiZjH+6qojx5ap/zSkLg10eMaPFhuoCmQBP
 ds8yx6F1mVZKXmONhr5F1u+1P085CKvcOP02uc66hD0CFKL6yXENg87oZBt/dOVdcCBH0fKv7Hz
 InfN+dHnfxDrJYpHtgdeMgmJWcwcACXLkwTGy7TlO9mk5B+kuXdRWKOV9S37FnmU59Lp1Cro/bB
 mb/P6G+cwMdrwhTWf/lZ49Xpz36va0+Ddsc9/g4c1pwgmJtxg6jPyYTR9Oo4uf8MJ5QB1NEBZiX
 Rk2wDpM/nOzZ07aA+EF12Ij3jc+gcE4XWeq2kKkaDWIRZSAxB3hy9lVhSvMlQtAAcXa0KIX7GY7
 n0GxR5pdUlG9W59F7jKWb6epcbyTJFJ0eIORf2OC+UTxQtHmKBFcotReUBCMrKthgTkoymYiJIQ
 hG2DXYW9URO39vmMcIq/VK+wXSLn2i+5qYKEu3KCzSGG6vxU516hb3SLLe7JIQA2/4oAuKCSxmN
 0yIc8n+hOk313lvKKpKcYIVRR7aWzFLKid9WLShyO785eU/AlKBTQE9ptt2jQlK8vKJ+2kmpolU
 HQb4rLJV/rv9dIg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index c1bc8b00d938..572f0716a0f1 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -334,7 +334,6 @@ struct platform_driver mtk_disp_gamma_driver = {
 	.remove_new	= mtk_disp_gamma_remove,
 	.driver		= {
 		.name	= "mediatek-disp-gamma",
-		.owner	= THIS_MODULE,
 		.of_match_table = mtk_disp_gamma_driver_dt_match,
 	},
 };

-- 
2.34.1

