Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7091C7DF41C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 14:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFC110E8BE;
	Thu,  2 Nov 2023 13:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FAD10E8C0
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 13:42:35 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so1581900a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Nov 2023 06:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698932554; x=1699537354; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mtT6nxgsYYS4sdsaY7t86FYZfBLOlduBaZpsVAIl6mA=;
 b=CWVw5LO5tBjaLQ890K5paiPpMq0k8O8d6CuF0Rzs9GX7QvjDwprsKJSuUkBuqn+uGj
 TyLKWNOcR4HZVa6mpApJ16UB06Xkc/xcucnSJnX3efl6yE6sFWkeIzAzgrduJhILmc8o
 zw/pb5Kvw96BGl7i51qx80QDC7Nubq0xqgbDQ5NFw6BwJ0eIpk/ljjWO58AwYW/AiG4e
 AFktWCGAvEanuCmTudfRGocR9zhRqStdI86LKbXyG76icVDN7Fye9QvTxNfiS4ciXZ1B
 Q5i1GSw4qgXQxzrSIm75tvJF/r5Hd9EIMucvuyLfYCX0VfZplYZ3VqJGNUABALlfZtbB
 JqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698932554; x=1699537354;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mtT6nxgsYYS4sdsaY7t86FYZfBLOlduBaZpsVAIl6mA=;
 b=Se+9jO916GaUKUC6ARHrfpc8GfywvCaBSn3c1NfOzRaGUQMsNB/X18JSQ6cPk4vzUu
 9DLtS6aX4khf2P8rf7OGtXWJNetuMiTo/JX3lvbXs5OgGqJEH9ZZYGyWPDRAJZohIing
 8tRLuK4JTAEt1Pj3QJ1N1/VTGnsMcfweOQAetVyNgF77YHKYKpX0cyUTuzJ9lLG1SSWM
 TdCa2WNQY73ZedgWYC7iPeM04/M9NfqD15fN4j+fDI1p4Grg8XCyWrDdTxZvh5bUAHeU
 EObYkqqVIyiZv/uQy1Qbf1nuG17FH/TZKTq5X/lm8xjKLbxxdi7qsMiRzYeVtYiqYEF1
 9ABA==
X-Gm-Message-State: AOJu0Yxe79Htn/C0y0Pu326XP6b0ZvTpbuNpBHZXx+YqbUeThtjuziuu
 Fknmxy7bnO3pKwJqXwA1lTc=
X-Google-Smtp-Source: AGHT+IGhrHVKX8Mcwu1ULzEU38/CACnkgTDqYLqxetznwQ5sVClFv+wxqUtm2VH+CqBwnOqPQHgfDw==
X-Received: by 2002:a05:6402:2029:b0:53d:a7d9:5149 with SMTP id
 ay9-20020a056402202900b0053da7d95149mr14483614edb.6.1698932554131; 
 Thu, 02 Nov 2023 06:42:34 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a50d583000000b0053e89721d4esm2378618edi.68.2023.11.02.06.42.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Nov 2023 06:42:33 -0700 (PDT)
Message-ID: <813a0e30-a61d-7fc9-9ca6-11bf9c6fbe52@gmail.com>
Date: Thu, 2 Nov 2023 14:42:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1 4/4] drm/rockchip: rk3066_hdmi: Remove unused drm device
 pointer
To: hjc@rock-chips.com, heiko@sntech.de
References: <cda574be-4f33-b66d-eb14-92c2b31d241e@gmail.com>
Content-Language: en-US
In-Reply-To: <cda574be-4f33-b66d-eb14-92c2b31d241e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_dev field in the rk3066_hdmi struct stores a pointer to the DRM
device but is never used anywhere in the driver. Let's remove it.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 drivers/gpu/drm/rockchip/rk3066_hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index f2b1b2faa096..c51520ec58d2 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -38,7 +38,6 @@ struct rk3066_hdmi_i2c {

 struct rk3066_hdmi {
 	struct device *dev;
-	struct drm_device *drm_dev;
 	struct regmap *grf_regmap;
 	int irq;
 	struct clk *hclk;
@@ -734,7 +733,6 @@ static int rk3066_hdmi_bind(struct device *dev, struct device *master,
 		return -ENOMEM;

 	hdmi->dev = dev;
-	hdmi->drm_dev = drm;
 	hdmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hdmi->regs))
 		return PTR_ERR(hdmi->regs);
--
2.39.2

