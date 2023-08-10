Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3920777531
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 11:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D58510E4B0;
	Thu, 10 Aug 2023 09:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1414E10E4F8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 09:59:49 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99c353a395cso107032566b.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 02:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691661587; x=1692266387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3DbDWowkXJ8CHoc7ekr/xcmqd0aQK/hBwEyNws4eo4A=;
 b=FRtbVwoaVQmMXLXQX7NiR9VPkxE8/CTA05oDWglzBF4EESK+CRTCXeb2GSkn/eisUs
 BEdAsPmPDvXfJChjh8bmL5lcOK9nDnVFqkoG20ZRrBzcPCbd7Aeg2u8CQ0EMrOo4rSeX
 beiT9IgqlsIsd16gBM2ZG/g5k88bK6WqXfEWm70M/MVoVSK2PQ+chx/P98/gU7YGJGsb
 xcAl9HJ5JQksN36n6f1nPC0MbQABivhE6aX5EexDyHRWYkv3mQUQtizO8cZIwsV4CcsL
 D2UheqD2FNQWBNrPI7UOubxmDCmQFkyh6AaWPY6mw//UcV782mdG/7m4dvzO4/aqtBWR
 43JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691661587; x=1692266387;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3DbDWowkXJ8CHoc7ekr/xcmqd0aQK/hBwEyNws4eo4A=;
 b=MyU1S92TWbu80e1xNYjbnoxnNI+5fMla8briwJdRNQjn+0haDk0PM1MnkuHx0Y2FjS
 sQdJ1H+jx+zdGIMfQBjlovKOXyHKZdRWLty7yapne8AtoR22LLS5ikq7ciiju2cRjPP4
 v1WKGmhD/6GBOPdRvJZb4LDZESrcN7cv0IWH0DnoUDnn+yZcda91kjNlTZlHZzuX1Cm0
 plKZCrnnu/zMoVbeCABpcpQgQnf+FLaGGHQRLjAq9NIA8FELmz6XrNzM1z2oTJmhKYZQ
 33QaYLeYCbNt2NcBkpVLgFpcCQXgSZB5ei2GJFmiVIqYDoZQK6rI9BAgDh8t02Jw9L4f
 IASQ==
X-Gm-Message-State: AOJu0YyZfY4WIp0tsh9nT5dTHkbEyDf536IOc7h+k/I2w1MZdFMLx6AZ
 JoIaOGyI7kpYpG28nDj+bir882A3gQcqJN/CzaXmuQ==
X-Google-Smtp-Source: AGHT+IFadznnKin1G3h7chRKcx6AsNDRLqsGXsvhVAb+I5BficeEjg/qSB9kBj0IybuULnXYxHHDmw==
X-Received: by 2002:a7b:cc85:0:b0:3fe:173e:4a53 with SMTP id
 p5-20020a7bcc85000000b003fe173e4a53mr1551533wma.0.1691661566553; 
 Thu, 10 Aug 2023 02:59:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113]) by smtp.gmail.com with ESMTPSA id
 v1-20020adff681000000b00313e2abfb8dsm1610969wrp.92.2023.08.10.02.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Aug 2023 02:59:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lima@lists.freedesktop.org
Subject: [PATCH 1/2] drm/bridge: adv7511: fix Wvoid-pointer-to-enum-cast
 warning
Date: Thu, 10 Aug 2023 11:59:22 +0200
Message-Id: <20230810095923.123388-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'type' is an enum, thus cast of pointer on 64-bit compile test with W=1
causes:

  adv7511_drv.c:1214:19: error: cast to smaller integer type 'enum adv7511_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 2611afd2c1c1..0e284f379602 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1211,7 +1211,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 	adv7511->status = connector_status_disconnected;
 
 	if (dev->of_node)
-		adv7511->type = (enum adv7511_type)of_device_get_match_data(dev);
+		adv7511->type = (uintptr_t)of_device_get_match_data(dev);
 	else
 		adv7511->type = id->driver_data;
 
-- 
2.34.1

