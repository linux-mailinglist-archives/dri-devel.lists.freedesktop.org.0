Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A306B5F11
	for <lists+dri-devel@lfdr.de>; Sat, 11 Mar 2023 18:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5AA10E197;
	Sat, 11 Mar 2023 17:36:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FB210E197
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 17:36:01 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id r15so5857153edq.11
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Mar 2023 09:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678556160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WcwlP/C06RxeVDsbVu82hAXbDbgdlPaZxHqgbrTaPqw=;
 b=Su/aYm+ZTxhdwla05jEevJ0f632jx/+dGtBRD+0Pb43ZuIKPJgecesaOqP19HlE0n/
 CbD0VYIm2qkEIWdET2R0C/xF3qwUigy4t+LM3J9Jcm3Mamykk8l0bFVkt043+mfvwm/8
 PbGjjwzlL6ZxlRLjMh0WPeYcdqWUykD+A6aj8fknMYz/IDGqQpeln8x7O/oPgMAx4F1T
 +ZJdJM1o5Ae8Ub6LGp6v+Q1L7gvYk8bLwj9YOfqeVD67jFGhzj9l4f/ESzIn8vfbvYBM
 e5C/vfyD6YZi5a1rIgjKtrkrhpVZJeUA2CmRyH1v8bEv60nj3Rc14DBVcxGxnQ//tDXV
 jKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678556160;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WcwlP/C06RxeVDsbVu82hAXbDbgdlPaZxHqgbrTaPqw=;
 b=n+WrRggxLM3UQMu3BqrxdItlizu5Po/xzufI0lu0TnSe8+0kVP0ozDvEWyGq8vV0Nb
 lZkIrZzp0ajUNO7J8DaKs4XOGKBMPv+DYUgmPvWLHoTiGjOokwDEUX3oR/RyfQT3aY77
 G837dwxIO784pjo0LsEy+9VwWr9P4d+rPg0EVD6mZCT5OllOUjd26o9EFrKQXfVco2NL
 A3c7cAOJYg3fkV0X5n08V3dOKryt0o8mIhYvQxnsDoqMqwbXnjwuTOvy8NKzrCrgpPYC
 szKX61jFeNA6DHuPvZalmnQDnh4CcSbIS1VOfy/36pquPlVNT1B+PEDuaFpXns97azw8
 d0pQ==
X-Gm-Message-State: AO0yUKVzGRQ2mZW31HqpK1/SwUxb4IX+G+LHSA7YQlbYSxSebSANDfvb
 RDjEpKH38XZzeAEwLgnrthOZlg==
X-Google-Smtp-Source: AK7set8m+DcbGrpKkaEu8cJcaWS/KDSEJAux+7j8RvWSGAfhO28fTqKPTee8W0ZBoQU26tCiqYNizA==
X-Received: by 2002:a05:6402:31e8:b0:4fb:31f1:425 with SMTP id
 dy8-20020a05640231e800b004fb31f10425mr654075edb.33.1678556160364; 
 Sat, 11 Mar 2023 09:36:00 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:6927:e94d:fc63:9d6e])
 by smtp.gmail.com with ESMTPSA id
 o26-20020a1709061b1a00b009240a577b38sm245423ejg.14.2023.03.11.09.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Mar 2023 09:36:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] backlight: lp855x: mark OF related data as maybe unused
Date: Sat, 11 Mar 2023 18:35:55 +0100
Message-Id: <20230311173556.263086-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver can be compile tested with !CONFIG_OF making certain data
unused:

  drivers/video/backlight/lp855x_bl.c:551:34: error: ‘lp855x_dt_ids’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/video/backlight/lp855x_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/backlight/lp855x_bl.c b/drivers/video/backlight/lp855x_bl.c
index 81012bf29baf..a57c9ef3b1cc 100644
--- a/drivers/video/backlight/lp855x_bl.c
+++ b/drivers/video/backlight/lp855x_bl.c
@@ -548,7 +548,7 @@ static void lp855x_remove(struct i2c_client *cl)
 	sysfs_remove_group(&lp->dev->kobj, &lp855x_attr_group);
 }
 
-static const struct of_device_id lp855x_dt_ids[] = {
+static const struct of_device_id lp855x_dt_ids[] __maybe_unused = {
 	{ .compatible = "ti,lp8550", },
 	{ .compatible = "ti,lp8551", },
 	{ .compatible = "ti,lp8552", },
-- 
2.34.1

