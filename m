Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E48892D3E
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1129D10E5AC;
	Sat, 30 Mar 2024 20:43:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="snvgPpng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C8010E045
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:43:33 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-341cf77b86bso2033266f8f.2
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831412; x=1712436212; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0emvF/cLhXuWiqzlLx7GJV12jM/n36nJMZKi2m5TQa0=;
 b=snvgPpngkaqd1YAXywKce31DumAD2b7Dj8B4E/kFScql8qTnYz3H+jb9gOUVUA+21U
 V2G3tNhasRJ8To9gQRs9yA97kWT6FSkymYtjr3cC/XN4/k/yqDSvsy9RuHZt+cHLVKGo
 xylfSMF7dlRah1+jQzV8f6rGHbmp9mMxIluYcrPQKNmq1jHt7ldvipzPHCIIUtJAeRSC
 aKxHIH5wP6hH5iSTqKB0kAiLm5XVBHf/BKNZ+EubCy8AliISKVH7gemWT72nIsC7LhvE
 XDVxdBKOnX2QzWvQFBVilOi2pcEbKdcdEV9fpSkUMTdmUBkVxGJQ4R2ytdgyiROJPqhf
 CVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831412; x=1712436212;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0emvF/cLhXuWiqzlLx7GJV12jM/n36nJMZKi2m5TQa0=;
 b=BDHIZ7Z/zXCmdsri8mFqxoMFMwJ2BlwIYn+6mO+Xg+8XLwRhSzzI5jNLDqLZEP8/Pd
 VltJChmfgFkZVFQK5E7KNXVZwMyVDaXv2BoWlw+V3qlZk1hxRt2waMg7/WZWgZNMoQRm
 UHJ6uCr/DzHCKR2Zlyc36v8B6svZqwaUe7ShR3wn0Cvzk3CRmKAMp2nBqq+E0Nm28Xy9
 4NnyBSl/aIl9e2SUOgT2R6iTp6f2xf5ws+nQum6xkYr47LRNQ/7NFopB64h7AZ0wRIVf
 dZrmf5jw/k4i2C09HkOqyvRhkU8Uy1Zl0QmRJoDV7ADfsWcwgYpDlddkBHeLtYM2uCD3
 wxDg==
X-Gm-Message-State: AOJu0Yyhu60eIaJZRcAlTXm3rWJ8piziX8yCflL9nFJWbYMx4QcwvhE+
 2NdY4RkbvdttqZOGU9Hhv+thDdvdldOb9Mky+zDMciwsQSLFdrg3XvSGxn8k4x1nUizGgyuargO
 e
X-Google-Smtp-Source: AGHT+IFkGqAbKXnEB2y8QAY0Zo3dFiMkav7aBNaw2zsKLOXyCOq5nMycSsl9SDGCHPDFBAqf4p0WrQ==
X-Received: by 2002:a5d:4a08:0:b0:33e:c539:977d with SMTP id
 m8-20020a5d4a08000000b0033ec539977dmr3478175wrq.22.1711831412348; 
 Sat, 30 Mar 2024 13:43:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:43:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:14 +0100
Subject: [PATCH 03/11] drm/mediatek: color: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-3-fd5c4b8d633e@linaro.org>
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
 bh=GRHvmMpjGaimoM6mb70wpxBieg+Y2V7L3kfHMvFyhf8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlmQX028BWFMF7uYbxxXKUF/44ZixRru4Atg
 GlhsSuXrtyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5ZgAKCRDBN2bmhouD
 13ehD/9Hd4ygwzrjIvHIIwXY8PJt8UReasJZDJHAagJiHw+xkF0t5Ec1gIny/0GNd/jke3znzZN
 I1KVY31Tppzsk+l0aMsK+Dqta5He7KERwdfWpZorLx/4OYmLuGji/q3X1pK5PmOEbBYz5a26Fc1
 QCpM6bpUJxn3a1hDJguxb3d9RDlss1xVKWi4SXvFFXEt+wRIK+IaPspPQ4X5fgWSi559skINnZy
 UNFwl9mTeDv9bWydib0pGgaR0BdqlWtPx6mAuLrDlFl08HEE3XmuQyR6SrxFokIlF7rFZx3LXPQ
 ecDqvoSUd+PHla9esGDUFZMK4hFsasW08AC4ZGL9gCCTWR4/wLrsuO+SgBr6kmM/ElZCqulyTnD
 hFInPjuF0IoeO4cLeR+ChknPft/mZYylGRmcKJMfqjVKMsWKklDhYDYQ+yplNNzbGGu/Gwh910M
 j+MDAZElVS4b7Y6+aTkFh5+1HBIOnrQGFacFhvwSHHyWalr5vzHAxXTiMaN9NhzssJFH8N5p4Nc
 JaraB4apf1q3MkxiX9OrrrEJpdYJBCaGEQ3KTLWs0LgB0M+mIcXIa1F+IMMJZrm5UXr55vRM8Te
 G25+SaIwsLjDVI6nOtbSK1DGVUlpifEXp7x0yKNVGgEGUrY5ZI1dVIpWfD/1XnMJzRCZywRG7jG
 6oT/e40ZzEUHaaQ==
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
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 78ea99f1444f..b3117a1a6535 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -164,7 +164,6 @@ struct platform_driver mtk_disp_color_driver = {
 	.remove_new	= mtk_disp_color_remove,
 	.driver		= {
 		.name	= "mediatek-disp-color",
-		.owner	= THIS_MODULE,
 		.of_match_table = mtk_disp_color_driver_dt_match,
 	},
 };

-- 
2.34.1

