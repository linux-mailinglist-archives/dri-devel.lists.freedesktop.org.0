Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AD89EB2E7
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 15:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5194710E3B0;
	Tue, 10 Dec 2024 14:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="seNyLxUM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9959010E3B0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 14:16:53 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-5cf6f367f97so8234269a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 06:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733840212; x=1734445012; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GwH0G8nePkS2BSjAdjZHUSwomZZVrTT3UjSpzowmTtQ=;
 b=seNyLxUMOiemRrzLsF04IdqHAD4xLda8OrZlfcGXYwguE/EGA1U8W4kjpKxY+1K+Hz
 dNJDu7WPWToQoNYzj7fXULwSMUdOkNComtgHrtxvl7COovqPqmGeg0Cw7SWSo1JDQCn5
 Lva3/O9Mw2eZ1m4W5bjwCVSDS9kRMAGIsBIuQjVufRRoShiWsU20/Z+qH19yfUrBgQK9
 Qt69WiOQbfAA70E7UyRoHRKxKBAbWlPATxJfwCpC/ML9TX63qC6fhSd04NUOR1JEo8Th
 ea2Bx6uADg861iVDEjo8Db7B1Yo2AIzeQl1sBmNGyYWz70bt9d+XF15yQlczqB4uA16O
 DrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733840212; x=1734445012;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GwH0G8nePkS2BSjAdjZHUSwomZZVrTT3UjSpzowmTtQ=;
 b=gAYk7EEa4pORrYMCFrO9REdhaJRz0+r5aaVwzeHx97A2+9fcG2JNAh9sV6JAqnrvX3
 MOJb3DRexBMp9/T9yXUalIa/p7RGFJFu3hiZRFXZvpVWwDD4IOktxSAJLi7i7Aaw9by0
 wiDDKcvhLPtBJl4ePLZTKAV3LPRVuf43eAE/1/omXPCzdE23HkGvwrPuD64Lz687L0wM
 b703i0P+57JZi86byWTF7QaOSZ2YGo2wHXVLpBG+P4NyBiAmHAPjR3vQYqfktrqkWPNC
 aT4Rdyq3ocHtVh0t/PMLHNK057KAV0oN/vmiRP0Y4qr93Gz/RXExCdlDA8iRfeEhzv7y
 i9Dw==
X-Gm-Message-State: AOJu0YwdBZnp3seKqtyk2lgFiQ0+cLwaknnlOEPEeVWES3xaeIV52wRp
 C9vyHOiL4FhP6d1o0Q2IjR20l6XWr1C1aw/Pm8X5T15lngdpkqfmO9cOQVSzvto=
X-Gm-Gg: ASbGncvzo+x8xW9s1w0rpy9+CkXflZXhfcSeZb+MyN+Ojura7R/aBVwH9Pt6cnJyZ7t
 p7MXyhWXqyCnl7Xbxybadx7RIvawPywrWFopTCfWo10JH2NbyCis9/EjO0z/UJ175X60dewHWkw
 FOn5NBnZlYEkjzUt5qaU085oc0823I5tdeWleW1gaIOPIv8hwMl6NGaFBc42I/c2iFGTPLSi9OE
 vpZe6CtFDPLaxgvY3kZwvsOZUAj1e2HLHPH0MrNiV+sJoyteqcZ5erQFuxdFA==
X-Google-Smtp-Source: AGHT+IGWk/qbRHRjKqV0wfeV5P+rWVopoCMPfZBVc89GTsbwmZWowfsav1SqSjh4fO5srkk+bmeMSA==
X-Received: by 2002:a05:6402:2807:b0:5d3:ba42:e9fe with SMTP id
 4fb4d7f45d1cf-5d4185319dbmr5684088a12.12.1733840211953; 
 Tue, 10 Dec 2024 06:16:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d3dc2602b0sm5104362a12.18.2024.12.10.06.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 06:16:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/4] drm/bridge: move
 drm_atomic_helper_connector_hdmi_check() to drm_bridge_connector
Date: Tue, 10 Dec 2024 16:16:46 +0200
Message-Id: <20241210-bridge_hdmi_check-v1-0-a8fdd8c5afa5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE5NWGcC/y3M4QpFQBCG4VvR/D5ba0OcW9FJ7Aw7icMsUnLvN
 vx8vvreAzwJk4dvdIDQxp7/Y0D8icC6euxIMQaD0SaJjU5VI4wdVQ4Hrqwj26uixTxDTBtTaAi
 /Sajl/W6Wv8dC8xrSyzue5wVsmTwQeAAAAA==
X-Change-ID: 20241205-bridge_hdmi_check-9fd86dd5b290
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1296;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5yWtH0/AHsQas2EHkU/GrIi2GqCzfjr8NZABeuJRXOs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWE1RE7/f5a24T6MflVG9Cf6Zh6wNv1sHzeB7U
 Re5U7qSIrqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1hNUQAKCRCLPIo+Aiko
 1WXTB/4idxCjQtZmhLjO7DL7OJyaix+Q8eg4eF4lr6z3ejiJF2RJWNH0GF5rtiNwILnhFTBCMqu
 omzbamg597QXtaYapZGMLnjiquloTdfZp4Q3g7hcGCcpApVJHuylTUE4j3fd5k04Nswo30z1dJf
 IZ/kJIwM5xlif1VVg0gbo4tj9qcHNMHoHflRwc7DoU6m+dTM5CduuKmj2m9yMlJDgY9Hvvbqfci
 dc/ignmbRRuHHCNiLuXoLJB1T3gQkwlVX1XQ3g4pbiMBb/jE8ITHyTtyaFBMZ/4VWvAruJv161Q
 9AT9L24chTox01OHwbKMa7B9xsiepN9knePLrlZ8bZ1cHpbm
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

Reduce boilerplate code and move calls to
drm_atomic_helper_connector_hdmi_check() to the drm_bridge_connector.
Initially the drm_bridge_connector didn't use HDMI state helpers
directly, so each driver had to call that function on its own. Since the
commit 9a71cf8b6fa4 ("drm/bridge-connector: reset the HDMI connector
state") it depends on DRM_DISPLAY_HDMI_STATE_HELPER, allowing us to use
the helper from the generic code too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (4):
      drm/display: bridge_connector: provide atomic_check for HDMI bridges
      drm/bridge: ite-it6263: drop atomic_check() callback
      drm/bridge: lontium-lt9611: drop atomic_check() callback
      drm/bridge: dw-hdmi-qp: drop atomic_check() callback

 drivers/gpu/drm/bridge/ite-it6263.c            | 10 ----------
 drivers/gpu/drm/bridge/lontium-lt9611.c        | 10 ----------
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 17 -----------------
 drivers/gpu/drm/display/drm_bridge_connector.c | 13 +++++++++++++
 4 files changed, 13 insertions(+), 37 deletions(-)
---
base-commit: 84e541b1e58e04d808e1bb13ef566ffbe87aa89b
change-id: 20241205-bridge_hdmi_check-9fd86dd5b290

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

