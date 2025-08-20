Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB4BB2DEF0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 16:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7408A10E755;
	Wed, 20 Aug 2025 14:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fnyI4/Ws";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E6710E752
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 14:17:52 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-afdf4bb0e5cso11576166b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 07:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755699471; x=1756304271; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JYDyb1l+byMOiaJzKn+UnmmghGQhvpVn03tecEee7KM=;
 b=fnyI4/Ws1dlrZhusDcWqYvR+KuBOmeckaNEEpnA4+dk0o134j0D9QDuNrgfiRuey5/
 4UD10sWWthQ94GyCyfOXfuGTFqrH6CJJqYD1BQaHsicI2Xe2r7ujTattqCG39q+fgZ3U
 bQm2jjVB5UDj8RjVqWjzmfdVBEDTfdo0S9EtzhL0Z9oNHZyO86Hacq21qLNBeSsYUfgL
 2JdbsP32M28/lTQf7odDnxSLSDYINZuB9cPxni9n90li/4F4bs/7g8qhY1wCZZoLoatw
 gNjnKyiFDBUiUifEbOMXTUC5pNm2qI04So23VIay/tzd+Oq3k1k4nExgDu3Tczksk3sB
 p/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755699471; x=1756304271;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JYDyb1l+byMOiaJzKn+UnmmghGQhvpVn03tecEee7KM=;
 b=n1V2RP3LSJB0/dF+MfHBnyrn0Gc2r1T71iYHrNvhdNKWl+zmF2PJjGMepI5waPKuuW
 jUnJMgvnuAX3Q8sg2XdUmyBeq7idd9i+JrmTiqhaJCjIXKPhJTZ08MKussvR1GIr16of
 +cw5Bl853mxC+vwL/aj0TiraliZmiumNOzmBbxuuFJjRQh9Rm0wBrMNAi7fpCbol7vt1
 C42TfeAiTIUl3jHpwNR3MrdsRcr1XHV8SI3YGiFFhtTIFQjq/SzBEJT58ckwBySDx6IL
 5AtiUu8/JpGB5wAOiYf+3D7UihJ+USc3HNT0QAqHH/UikLrwMDfvRsEdw8w3vHNvdrNp
 zcVw==
X-Gm-Message-State: AOJu0YxRbAygWhx9Bhsnsynf3h7MxECo4DEIazlvPpZqkyZlwg+dcS07
 PLzcjHv3e456yKoB0lI+MpWedTBtgBe1Y/sAkbRu02vMVvii3+x+7w+GRK/PbXRf2Oc=
X-Gm-Gg: ASbGncta3IKQdmpk1ri5YkEOOYZm4o2enjcxfO5JcDl+VdcB5/g9+3vFc9zOcI5rJod
 DEtlBhTsZaU2sy+Q5/odL3JKB79bQdQ+MsNdzqjJPSPxgjWBwPlvetrbWQ0uU06bOIxtx42/zsv
 RWWwGqJas3gQ+GaLHkSqc3wjqxtKrKgW5VPZB0nfADyVGtd8a7Df0CWkJdoD8iaywA5NUSfiyQ8
 Na1oWPg2HGuXLQaW7URAon7NfoJjB8lHs7qaS3pn+Tr647zwVc/tcC/deWPpeqhlcqhi7rLvS4p
 M028Hdj+DV/FAmNJpslmnDmWHzq2GRYOhKX0BM7D//uwsD5k+5LfHtxZEWwouUa3XA7rGer6y/8
 sBDv9GJFR61RMJelDufJ8XldmLGnmCURsBomFrR8=
X-Google-Smtp-Source: AGHT+IEmrLUelKKUOono3ov9GvjFbcW6q4Zw0ULLzvLJYEr2I6DZLLZrvFrkswdj/bNZgbWEgb8PUg==
X-Received: by 2002:a17:907:1c12:b0:ae6:c555:8dbb with SMTP id
 a640c23a62f3a-afdf0256674mr142702866b.11.1755699470561; 
 Wed, 20 Aug 2025 07:17:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded4796f3sm186541066b.61.2025.08.20.07.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 07:17:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 20 Aug 2025 16:17:37 +0200
Subject: [PATCH v2 2/3] dt-bindings: display: ti,tdp158: Add missing reg
 constraint
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-dt-bindings-display-v2-2-91e2ccba3d4e@linaro.org>
References: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
In-Reply-To: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "H. Nikolaus Schaller" <hns@goldelico.com>, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=990;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=AkV3VRQfJAkPuyGMV3zApyjndBmAsTYMa/X+l+hz0eY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopdkHTLdBz/9upwUfV9iV1nnV0fegXMDVGScJS
 +323M0dU0aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKXZBwAKCRDBN2bmhouD
 12rlEACGX4EZLaWfGRRN8ipoGBIacbdpDdtXYFRu0zv6iVQbYo/Um8r7PYFUZQM/dehtOi6wewV
 Q7+E7dUwXKMF3wuZGjwQ0m2nXcHr7i8EXzrKcN27rlX5w/2qp2+9GMlwsZJp8YgMsUVs78qZ3dx
 f71D/9101SWQN6XQU/m5OF2Ar4lzohcm2vb4Lkl4nSf0j2t/oxG27/aZFBDvrRxFFFKS4HwCii1
 yxrYrkwvvrTjXvTxsawafd6ESN5uWS3lsAEBkFc/1SaarnsKPmznKyyapyv2hiX6OqeYEmdgvj9
 32QnIY2KF39R5Y5eq/950VSdt078I36aG1vljAwfAPg0bnHx4zjksF3ToHCEGfaBhffoonrjPPE
 GA91+7wy1+262Ue8Dp70IEfYnPDB8byAmj2rZOTwQ7/uiZK2BkS/vXAHqm5FFXersWKWhhVgdAZ
 7i8Vdf8NMJiwABhUKwH1HgqLLqtT+JvY/JDOLDDm6XJLwpbQMRHD5SqA1E6aMq6zgfPhU9hdLLj
 i60X6KTKsgXASFkbZfNR5zwJGyZLaOQWwsIR4EO86n7d4HYFJpHdIM/Z2F68KTezqAIJKi55v6P
 /e2J9tF+gLqLSjo2KD93r2bVnlCFTlBwzOpGT7rJlzdNy6w/4/zWTu/20KJaORbwEOX5apcLqy4
 ydTdZieF1pfoKyw==
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

Device can be used over I2C bus, so it documents 'reg' property, however
it misses to constrain it to actual I2C address.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
index 1c522f72c4bae3313930b5c76dd04dde1aef5151..721da44054e19ff04fe9d8c1dc31a9168e8f79f5 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml
@@ -17,6 +17,7 @@ properties:
 # The reg property is required if and only if the device is connected
 # to an I2C bus. In pin strap mode, reg must not be specified.
   reg:
+    maxItems: 1
     description: I2C address of the device
 
 # Pin 36 = Operation Enable / Reset Pin

-- 
2.48.1

