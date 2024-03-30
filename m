Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD5A892D39
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C3C10E49C;
	Sat, 30 Mar 2024 20:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GgcwpO7C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBAA010E4FB
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:43:38 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3416a975840so2330546f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831416; x=1712436216; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QWJmDtW45HEJ3u7PqTsUPbyNK5NNAsCg2Vc2E8WL+CM=;
 b=GgcwpO7CftV5IhbYpAL5j5J8lCcLJ68CRsbb+724/5atJvBhSsNGt+pk2TkoyM7AWr
 kHu31Nnz5E0EGXbXOZwzkZVgnRQC15V6IMvtJ8elA3Pa7a4UItwlPYIPjCVglLIxL7Ya
 l2mTJFEE2Iq/yprYYbOoN9tsbHtTt3mgR+EfUMauqMjnQBEJHGxK6eaUW0F9C+Q5DBD0
 TjuZdr8vXN0K5UUUxOX7pWV9XqyOordoeanEm6cVjNcieK3DO5yNZHEY19QGr6JS2u0E
 JEaQqlCNTw7kpwKcPURXo9wEcXAM++s/005d3EOJu9YeH7yxDM2Tq8OJVrUZwfTh0Ivn
 6AVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831416; x=1712436216;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QWJmDtW45HEJ3u7PqTsUPbyNK5NNAsCg2Vc2E8WL+CM=;
 b=dya+xh2/fCe9FDmA/vQOk6ZtPNEF3Rslvq5W5CaxkzEuc+sB354vc2WMn4lpew2PdI
 IoT5t5vB8TrjZTwRV9PKolKcZk5mSYO7fzG7yHA3SGyYe4a5v7wKtgPzKp5JjLM2ybFp
 AqdAFBGCHHzxtaxz8pz3R9rWGs5X+QUtnYD+VTGFtL31UB8pD7ut64hAWBcLQZTdjPxp
 cV8YhYiqDO0dlm3XEweY1t3W2YtYcUgmKT5+DqNnagBu47UdVhlfoKppHDFRqmuoxjOb
 gIKgjF6CS+/VRQreIp7+d8WGVpZONouKMzWYjsNdAG9IWfXBr7HqZC6fjRgz68ZYD40a
 m40g==
X-Gm-Message-State: AOJu0YyiUTiaYWvVkC0e4sicPfGZkCybbQBGjq5Q3nDkTcVW3ofN9peK
 ri+5nkzQzGrbfeuOjdEKYOB/KitXCS8QOjH7VdyD0EAgWvGaiSKsJ9vwJ97/nCE=
X-Google-Smtp-Source: AGHT+IG+hFfASnhq0/mKQq/p18W4G3oaCfPiHAHV8QkPFTQ+2T8akxT/w8IqahTgANQV4BXyYuOElQ==
X-Received: by 2002:a5d:5f8e:0:b0:33b:87fb:7106 with SMTP id
 dr14-20020a5d5f8e000000b0033b87fb7106mr4541576wrb.55.1711831416697; 
 Sat, 30 Mar 2024 13:43:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:43:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:17 +0100
Subject: [PATCH 06/11] drm/mediatek: ovl: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-6-fd5c4b8d633e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=839;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=v30/7g6LlGP3tVcCZHt2tO6SJcJFhbx0VZHT/xHvl3g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlpH/nOsD9iDkauUFajwnyggNRWK7nl4QHHO
 o9wKXLw0N+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5aQAKCRDBN2bmhouD
 10pyD/4gXiChI6eF/nqOH/ByxwmwE0S1I82agd65uR4+66SlR5/x8yjVJbZMPxbRVdKFW34oGWu
 7zQx78eDNJUdj46hPevBL9YyxLU0DDJBKIO3lGnBvA6qTdFSnZDgFll0udt/PYkxrspnFtHi4cF
 /a+Qzmbqq1EJ2+/28ISHGz1d4XAnQiSAgiz+4QKGonnvawsC4aU2349Sfy8Qz4tfCrceFDzGTCd
 BEOYpQIoFflOxMVHckm30bU2OYWEqgM/juyXtBSUu4pFXpTRUwg6Op3yVf5bP1Mdq5CWliPQ5EZ
 FdxhOs04zmesoB8zUgwCWtvsXPTHhpwUi83dPXcn7W9CQjFGoEvENiBIh4e6n3sdixZn918En+p
 ZM4YAh7nTJWmSY65NhgmyoQYR4J6F2asn8OAGcg5fsbbXr4nU5MiicXLdd52A7k4VQYOrtj7zH9
 6VuAr2NoToeiNKO7Hp66WYuTNrF8OwgAO5YheqWsZiNqcNXIfPwbNx/1AXFyOKz2LoKqDMMzfC5
 ujOy7SKcKH4vpeUd4362htI7DjffLSta+CzOpI8wPOneKTkqJONlmJUA6/nzgugyXzaEAkB+/nu
 Tolz6MHQRTuT5FaBr2Ehg55v/aDb6Nqtmn4G7QFoUgO3KimXRvOQ64eZfqFY6adVlfAcMBDSAyy
 W5TouLFV3wQn9Yw==
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
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 2bffe4245466..c754dcab716c 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -659,7 +659,6 @@ struct platform_driver mtk_disp_ovl_driver = {
 	.remove_new	= mtk_disp_ovl_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ovl",
-		.owner	= THIS_MODULE,
 		.of_match_table = mtk_disp_ovl_driver_dt_match,
 	},
 };

-- 
2.34.1

