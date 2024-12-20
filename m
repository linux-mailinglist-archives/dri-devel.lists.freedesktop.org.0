Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7B99F897A
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 02:28:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8AB10EE29;
	Fri, 20 Dec 2024 01:28:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="N/hlzS7G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D096910EE34
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 01:28:46 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-53e3a5fa6aaso2675840e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734658125; x=1735262925; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=p3GKBJwWEfw1/CxFlxhza+7CDGlBelmYowiHKIMRKmk=;
 b=N/hlzS7GiwIw66Z2FSItvgUuCLboyeyO/hMJ8bbk7MLqEAjUhYgyfOOFP0UvYHXNzZ
 pgWo06uTBbqYCZ58Ok3d/0Jo7604kPc6hgeI6uZdVC50Y+NjQIfhptzONRiDDQ4xcb31
 w2IQI3uDEYP5md8gDed7Tjw+kR5MoQ5lscHfkFrlS51ULL1NyjiPwC8+s1e4nRS+30UG
 sLGdIEWVBQr1qI7o3nMR0LBS+pV1vKkOyaD0p51ywVJ/45z+eE8a8UqvzZZUxZMdkagl
 8D2I0MRCOsuRLEgZj0iMmEBKcjXvJAF0wjDV6AZL3dTybvxNPJP7Hk3Z8tORjx1O/Z20
 7FUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734658125; x=1735262925;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p3GKBJwWEfw1/CxFlxhza+7CDGlBelmYowiHKIMRKmk=;
 b=NtyPsx2xws+yF7vRq/32zAf8Z2eM/sBIvHPApoXYGEq+AevyaIiVBwlOybmFk7Qeku
 ouqG0sRxvsNtKraZNdbmLZk7Z7ghoxXW94Ztml7NGZQtbLlRqCzLpHfkcGS1TIYOqjVI
 a9mKUfNyFq7XBatBMt5SLMQPnSGoysWyErn3Cb1wnzbNj5NaxMlMj2bUIV4XWz8eiA1F
 1K7DVeIfdDK1Y4NltNY/v6R/EmqN/ISPYMI3bKEez0mAIHxKchkkE9BURD7vm4luMxtw
 a3vUY+4271qwDDweErrUoPOZk8QivOvKwErMNp+r/wrAn4xIcEbC+cn/qmfoThg+Dokf
 BOFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLEEkl8CIhU1VTLmR0xZdf/dr06ZBWijURUKoxP8oQH/ebf47g2ORFMwDZ8SxpMDyPv3422marAWM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3PQMv8Dr3WgpKe9kyGzXjSpy3HghGOCuS+RF2ulAGj4et8jRX
 1wOt65MxIST7xXd9W+ZpVKAJOi7vM9nDK6SqHmACoBqyyfaYXMmYNBpJ7NvR24I=
X-Gm-Gg: ASbGnct86baV9WgbPlhg5jBjtzITyMG8kC34yKhleZi91WM79nxkwQMMBdZWg5aAl7s
 FQCxPKV2OY9RPhNSRRpC47ei4l7LKcYI+PNWDEijs0nvMqknSHUfr2WoGQZ0BWpZt0o1K/mEY91
 5EljZ9FBnyae3qOKAPwrL7dThVXSLFztY5beigpYUI4mv/76Y+/MQwBoRtBQ4jNH+z98VG/Mn2g
 soRiJh6RCSjPw7lopDfuAes/jloTgvnufznDX14AGaq/G/8zysc1vrajxUs3K23
X-Google-Smtp-Source: AGHT+IHESAj0aPRm12hAGclUJ3UmR8oxmXDZHMsUjV8nmvQd5MLhJkySZ0kJVJQK5K08IYjyPoxqEQ==
X-Received: by 2002:a05:6512:3f04:b0:542:28af:816 with SMTP id
 2adb3069b0e04-5422946ed34mr244788e87.20.1734658125099; 
 Thu, 19 Dec 2024 17:28:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 17:28:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:34 +0200
Subject: [PATCH v2 6/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8550
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-6-38fa961ea992@linaro.org>
References: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
In-Reply-To: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vb3CBdu7rRYdoP/BORloE4ExhCArGx9G4wRA2z3QaT0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZMg/ND6AujJKVlejqIx5KgOPU/QuqfhojOWOi
 DhTvYmZfx2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2TIPwAKCRCLPIo+Aiko
 1bHqCACxnLhTsGmevsDSoJuKkR2vjzK5c0HdYKwGpX6aV+XMirfriaa2P5aaQ/tlhTRWFh6ufvm
 UUq/IdVRCqTPCoyRknT5AR0bXpShVOk7mW1h1BL+zhdkygTNie8HqmjBrQI13S/VEDjAgf9vS2A
 XM47vQjpfYpCw0wkwQXpW75lPPE+DCkEIzfR9srWIxj3eHjgsFU/543xYYM37xUlZPIcCyLYp4K
 k2NC9DgkYTXIQ8ICtLnna3UzGRR6GyX81wPnLPjU2NUNBCI1kgJfrZtamqnexvEo4OJNwUXA8f7
 cOG+Yn9ZFNI1Aa+KLW57vbItrG5Rt6xAVM0V8DPL+XcK90l/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks. This allows
using colour transformation matrix (aka night mode) with more outputs at
the same time.

Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index ad48defa154f7d808c695860fd91e60bbb08f42a..a1dbbf5c652ff9f21c02af2e2520f019702f29c1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -160,6 +160,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -167,6 +168,7 @@ static const struct dpu_lm_cfg sm8550_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5

