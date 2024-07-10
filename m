Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6CF92D709
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2024 19:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB4B10E29B;
	Wed, 10 Jul 2024 17:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xUW6T/7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A20D10E83D
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 17:05:18 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3679df4cb4cso21611f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2024 10:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720631117; x=1721235917; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/g1Yb1+vfOCpHonxF+Jqbu5p5cwpmV8OmQtPa+jVmyk=;
 b=xUW6T/7atPChn8TJeWOFBHVbJyoBjcyLccKghMIWUwa7fYrZ76nVDHrOvhEaoZ3O4G
 8rQffZ9qi+icqHUS0TOqfYZ+SIQF0si2lXvgvw7ryGIwaivoMnsGk6MMRL2wPaH5mIQH
 G2OYBp4CW2IXbo97PtpUYkjqPO630KvxUa+xHff3WqfCiyVTK3TZxYJK9XIJaCkIWHCh
 ujAjCaUptjE0kT73hHqBscsAed6ETiCO6XFv2c1Lo2mTaKfue8U0QmMmzFVAlq4O5Gaa
 X1IrFoNiLVJ+BWv6ab/BWceukD/zOHc+Wvt5uCKXuzPtave1CcOhIi1Vn0H3BJioTrNF
 aLyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720631117; x=1721235917;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/g1Yb1+vfOCpHonxF+Jqbu5p5cwpmV8OmQtPa+jVmyk=;
 b=l+JH4l7aK79fMGm66/cDIGcY3V/Drz3N9HDn8vnnB9UFrt9lZlWZrfnbTftXepGVxO
 BDBntxWcBfxqn1j7tMADzG7ar1F2J5+IR71Bkb9HOBzkFHTGFMJL+Adw9/nS7zcdQ/OJ
 0mLL5xCKsaJ2PXQ8blzhPFOF4H/ZaoQ/JBcMXiwPHtpTkCWbil9m6nvns6du07mjIkqs
 MxFlGvyUpwRGx9rGS0pG7MR9xe4TKtpxc1SG2z3eQ6RAOHheSVg1FVEc4ArBuY9H66dp
 2ZvwRoNYnP9dSN0h+Xx6PYnxTwWd2yCiprSXdX9gU97bEhkX3lDHfwIkyJ4nHgo2OQ8g
 klkg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1pmwdGwIM3yQT6ifk2qbVHo8xKBtLPYKo5Gbp1OgAhyMGlH0jxYQzq6NTBemzTcaCe1LnySExz8qsYuayFJjQ2bFDp3OsqSLpGc3TflZv
X-Gm-Message-State: AOJu0YyMEtTSuCNgeAP5VAPafQWsLt95ujn3ko8PTqYe3zy37uVDtIfK
 /ksDean8B1nLndQ/heC5mbuMzio0SJ8PtMt7IshwuBUu79loeJdY/9wlO/oPmr0=
X-Google-Smtp-Source: AGHT+IHrRXiCsidR4X+LasiuthOFj9ICKMJe5oQgZWQE5LzqBbT6SBTjtUxtWEVsNWAdJXaa53sXHw==
X-Received: by 2002:adf:e0d0:0:b0:360:8c88:ab82 with SMTP id
 ffacd0b85a97d-367f04de8e6mr260014f8f.30.1720631116954; 
 Wed, 10 Jul 2024 10:05:16 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff1f:b240:65e6:93ca:5f80:ea9b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7dedfsm5838446f8f.24.2024.07.10.10.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jul 2024 10:05:16 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 10 Jul 2024 19:04:58 +0200
Subject: [PATCH 2/5] drm/panel: samsung-atna33xc20: Add compatible for
 ATNA45AF01
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240710-x1e80100-crd-backlight-v1-2-eb242311a23e@linaro.org>
References: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
In-Reply-To: <20240710-x1e80100-crd-backlight-v1-0-eb242311a23e@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.13.0
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

The Samsung ATNA45AF01 panel needs exactly the same non-standard power
sequence as the Samsung ATNA33XC20 panel for backlight to work properly.
Add the new "samsung,atna45af01" compatible to the driver to make it handle
these panels as well.

While ATNA45AF01 would also work with "samsung,atna33xc20" as a fallback
compatible, the original submission of the compatible in commit
4bfe6c8f7c23 ("drm/panel-simple: Add Samsung ATNA33XC20") had the timings
and resolution hardcoded. These would not work for ATNA45AF01.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index 9a482a744b8c..fd56fd02df87 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -333,6 +333,7 @@ static void atana33xc20_remove(struct dp_aux_ep_device *aux_ep)
 
 static const struct of_device_id atana33xc20_dt_match[] = {
 	{ .compatible = "samsung,atna33xc20", },
+	{ .compatible = "samsung,atna45af01", },
 	{ /* sentinal */ }
 };
 MODULE_DEVICE_TABLE(of, atana33xc20_dt_match);

-- 
2.44.1

