Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E2F892D3A
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:43:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D936910E49F;
	Sat, 30 Mar 2024 20:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JB6V0xvl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8524110E045
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:43:32 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-33ececeb19eso1746382f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831411; x=1712436211; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gkvgtJfZLFYPx9yFQ6Zl+mYWhCt2xCc9NZAo+ZUMPsg=;
 b=JB6V0xvltW8Sp9Yrw5dEgfrHQvUwAM3bBpfhmgE717HMOmsLaxznsWtHts5wLKjXvP
 2XIp/kUrBsrIiVAKHv6i1tDXpOJcZxGjFN95yi4eZeQXcuIBOk/ciRy4ACYMyxDdGtH0
 BqInRPiPIkUhD3GqkI5sI9hTzP1pAfTW292n4eZR0c3YRJlfsO4WRjYI84yYHdXYAe9j
 OhVeQT4nD1nBO2DeWQQBqYunDEaBHR8gLhkk54pyjXzKs9uZ31FlA4+pfmKdjCXHJPsN
 jfhqOmeUt3G5JXtoaSY3zca393GOPFLUWdYAtAD2Y8Y992YUOUmR6nOfnw9PQ1IqNCsf
 DY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831411; x=1712436211;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gkvgtJfZLFYPx9yFQ6Zl+mYWhCt2xCc9NZAo+ZUMPsg=;
 b=gIjyW7pxmKzxQwkZG1eypqZcqE8BX38D0fWS4z9sP7ZdkTwmhrlE327L7BxE9qlvMl
 Dfp/f/9H9g434AnesX/yXyvkOurFYhjDucYIxjhZd2CmmjwLL+2YUtADbQA/19gtIREp
 kZff1+BtuHtWVD2vQYD7mU+NHq6CviZW3VSxgh8NL2/LPQEkKgi5Jg5T/C/Q6z2rzWWq
 zAQJ2Tev1H8A6tzMVP9PskbJFI/rdL+3aycYD9DjSr6T6bfdAig6RKBP+sL7psMmL6gm
 8ZydjN4sBP6BfLKKlrG+WFDnpoMh+oZ43alBAJW3wEBAj9REi0ZYQo6HDuLtaem2M4Ki
 PqmA==
X-Gm-Message-State: AOJu0YwG5Xq3JqTTm1ocOaQWEdfWAnofRkrqikt8USByeGvp1f7h9u90
 qVKuCKVGlKc3LzlPeKaGasPq/yxarTgggPqrA+ipi3HruzucqYirPpfsGNo9bZ3YyC1zIkAyfee
 V
X-Google-Smtp-Source: AGHT+IGWOdTkC7o9yGgejAofbZqEmlVeJu8V+2qwkD7lOHPc0dBfgw35/iSYGxJwzZWGT1QRUhFf8A==
X-Received: by 2002:a5d:6a8b:0:b0:341:c000:5f02 with SMTP id
 s11-20020a5d6a8b000000b00341c0005f02mr3680932wru.7.1711831410817; 
 Sat, 30 Mar 2024 13:43:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:43:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:13 +0100
Subject: [PATCH 02/11] drm/mediatek: ccorr: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-2-fd5c4b8d633e@linaro.org>
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
 bh=4HTnieqsHHDdbgAvPLUTi22tPknvvwpSzFloyS9LJ90=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHllHnjO2IXgcN6miz8gttSZeT0bPKxGg+MN6
 ZrEhreFAzeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5ZQAKCRDBN2bmhouD
 1zf0D/9oyBUNxb4yW5y+lYjzW+8hIB36xGGFf78Pk2cRxdk4fUZNyvxpadpNLMu0Pt5tVSvGiRA
 vCWgIwn2Y1Q0qaYqio07hjx47/wIUzpMqXiZrXEaFgy/hPcuVh5L9bLBhqK2evNoh1S/foRQUde
 t7Xr5ANtvslUmKkaBnxTMdhKkrxWHm0zwo4gTH9u6Zz8tZAiKPLimKC9cd2o6qTAHZONztgoDMj
 0X2+stZuG5HnDhixW52rogHLxTxGOfRT8IySNI4CShMOutaBORFmo48nVsCKOGs1Y0alef5vqDq
 saQR+JZktEwuqfrPOMYOL2Sd5hUzY2IWVFHBoFyYwnwnaR0f6wo7qkySwkHpVBqYsFCyrhS/fN2
 /mktuahx18Rf+zNlAruZJzoRZwuTl6Vu0E75RheuK0ahrSjV5P+IeIfmlZh9YzWLTuDdwst5BAm
 ijpg2rOpAVtKE4B/E+7+k7XjoYgKQpfA/dMP+YWR27kd/F4oEpjxcoeryrSEsPKPwK/19zrwzk0
 A6gHlTT4k+98Z49dJhkOgmHqAfbMoMceaLv1jwSzlVJ8iCHIoHu08hsmz3kTcAD6rZgor6Wa2W0
 ZtBPqX7oPOHeaI8XN2WZ5/DIrzq+NqCI5FLDYv/+6N4rFi0i+AoOc7M60jCvG3HPue2Cfkt7PuB
 WRWLu2iUpD5fhRQ==
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
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 465cddce0d32..ff56c20d4e21 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -214,7 +214,6 @@ struct platform_driver mtk_disp_ccorr_driver = {
 	.remove_new	= mtk_disp_ccorr_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ccorr",
-		.owner	= THIS_MODULE,
 		.of_match_table = mtk_disp_ccorr_driver_dt_match,
 	},
 };

-- 
2.34.1

