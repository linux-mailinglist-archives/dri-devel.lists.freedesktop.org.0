Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6953CA0A9D6
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 14:47:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2A110E30B;
	Sun, 12 Jan 2025 13:47:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="axFLEGq9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A84C310E30B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 13:47:13 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5d3e5c225aaso703835a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 05:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736689632; x=1737294432; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RBnsV3mFkJmXnRbQqOXQC7xiyTGmF2RqY1RW5wKJo0U=;
 b=axFLEGq9CIIjS2GzhoJ9aSN9qXXQ1e78kme77IWTFGLgpQFuBIIXPsSiBEO1YwGLul
 SeF8Hmyhx3IiEQOXtg7PB93kDjDlnk7amFT4UPbowMkhebH79/tjqkpU4TfMEesuxx34
 OreyYrJLrCtaguDEDwG25itWn/laLGURcKd6kLSVFRUrhxH0kp3igRSVtEPIXWpyY9Zc
 ze/fpkhxJBNftdWG/4cCXWGhWUKaiirpwUFgTGqtnQdvXYi+R0NJw1uu4y2k9lQ2qMYP
 ptsZqEhIC0EbNpGhSvf/n1MNTKVeNDhMp0m/FzmQzt5B5XO5JcUzr+CT1sWO/C5N655I
 Roxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736689632; x=1737294432;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RBnsV3mFkJmXnRbQqOXQC7xiyTGmF2RqY1RW5wKJo0U=;
 b=b6GS13auFFHGWSgfhzSWnwyDKx1ky2WevH4Q8c1zEtaoBe1TJK+IoYuYbRJXR4LRTa
 kO5pAtu+OsC9EJfTiFBjVa15rSrsHLSCNSDLxSkjTwdu88I1NHW6dy+rxZvVIen3P03Y
 y4V7EQIW3qgMSCDK6XkPFce7qqDrKBobQOcrlsD8/WNSLndIeXzUOqFxnIVbEUDVTdyn
 29ao/HpxymYfUj+mRFudk1VKBrSZHkum6nzwDk0TZoCAK2sdqMQP61E0sYcYtAmHDaWE
 ADIEBH8XrZAkQzFj0x/jJPH69J9geB9Bk+RNJHrSlqEHjY+as+TMQnDr/Sj9rUGug8KB
 k3Cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9crzIpvNxXORj4oU0ulH7NiXGosMuAE8K0TQverIKYePJFkZ92SslqU1KjeYag/LTPPShIV97GsA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR3O/amoGypQiXVI14u3BYPLdlFvrqeO5GdP47Gy3VcmW258QB
 Ok863Gl1OUOfAp+dSKu+Xr/XMrO0LOM2taozwvODHQ11wS2eZ88bhd9X6z5xHIqcuV15+pKuR7x
 P
X-Gm-Gg: ASbGnct/YBrmCI1kKbNqSFs4i2qtcqcs4Zalrvm5zhuPzmnWIsLgOKgF0/AKprgaJR5
 RpqU7Tv99hFtIuWfGRtD1R056RrAlJQNzIu/17hNCT7BLy0lJIW11KFweCxlOZeCMU2MO1A+fWo
 ih8aHEg+RuwGl9iWEuBnT/itLxmT0+F7XzadQaJsfT4X5giB/Dj4seGFQogT8FNikHv9G/xG9Gy
 3NT2+PGcpoxhqFpSuu9j+FPZqHt/Oc3TWo4+LauMWDVPDHdWlgByuCcmY7BMSM+O9L+TOs=
X-Google-Smtp-Source: AGHT+IE5jjxbpuHLDjgHBaaKsQqbYx5oIutu5BOQFvdU7mITc2KX+nB9WMaHa1nRj5jMwrSpxOe8VQ==
X-Received: by 2002:a17:906:c10f:b0:aa6:9631:9237 with SMTP id
 a640c23a62f3a-ab2ab6cd374mr674812366b.10.1736689631988; 
 Sun, 12 Jan 2025 05:47:11 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c9060c00sm374899866b.41.2025.01.12.05.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2025 05:47:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] drm/mediatek/hdmi: Use
 syscon_regmap_lookup_by_phandle_args
Date: Sun, 12 Jan 2025 14:47:07 +0100
Message-ID: <20250112134708.46100-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() combined with getting the syscon
argument.  Except simpler code this annotates within one line that given
phandle has arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index ca82bc829cb9..4b0eb7dc25d8 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1458,15 +1458,11 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
 	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
 	 * registers it contains.
 	 */
-	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
-	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1,
-					 &hdmi->sys_offset);
-	if (IS_ERR(regmap))
-		ret = PTR_ERR(regmap);
-	if (ret) {
-		dev_err(dev,
-			"Failed to get system configuration registers: %d\n",
-			ret);
+	regmap = syscon_regmap_lookup_by_phandle_args(np, "mediatek,syscon-hdmi",
+						      1, &hdmi->sys_offset);
+	if (IS_ERR(regmap)) {
+		ret = dev_err_probe(dev, PTR_ERR(regmap),
+				    "Failed to get system configuration registers\n");
 		goto put_device;
 	}
 	hdmi->sys_regmap = regmap;
-- 
2.43.0

