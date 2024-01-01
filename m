Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A60821554
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jan 2024 22:00:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197C510E0E6;
	Mon,  1 Jan 2024 21:00:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A78010E0E6
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jan 2024 21:00:23 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ccbc0ecefbso59781161fa.3
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jan 2024 13:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704142821; x=1704747621; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tqi/PFlm04D03r/uNnvI0Wh0bkXl0RaxBHMbPg2VEEE=;
 b=NYgA+kE3z933gFHzaWV/W9O5U6DzKqrq0+XwvrWj9rjabnM6dJR9HXEgBrb68gyfK8
 EzqJNmaHeOj+XadabTq/lo5JgQ0CpI8lX08/NKbSAREZB2vs1BuC5f/euAvWUOZt5oT5
 stoUBgSgoE1R/ZBrY5ZyAEDEbM9QUs3BaQru0YG585YOzkr3AslCC5zwFD9jPqIhZ99x
 ySZUba3VMK8hrQdKK02FM1NPhFF850JEi0vO4n3TPIH8ufM4CkwVoEsUzEAbojSYQQ4e
 TgOWYI8fpx4QkxSxSj8UWWuEdVx9+8OxgY7+ZIen/jdTDLNAhKm8Xk+fW72/wprP9f4z
 Tb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704142821; x=1704747621;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tqi/PFlm04D03r/uNnvI0Wh0bkXl0RaxBHMbPg2VEEE=;
 b=Dt2FbiVFCXmavUVazdJwvNJGSXBA48LlbNxwW4smXboJL4FYE14uchuMuijjz0MTYk
 HuS3/XxfWI0Q8070Vl4n5E34UO/kK4zYtZA8eVbbGKeLEqsLMDd1idh1mMB+/pN2yJsH
 XJLfB25PZqC+7svTs6Vyx2RYayUtaclmyv86qEgx2vamvlDRs9b+MonqKINMkqBEKOyi
 zAUgxJ5n8gt+fTC+EBUpDsSUq61h3srfHj6KILlW5bOhzvk/YAh652iMI6hikdCW+CqO
 YNPoRUR39RmMO62Wk8adIUHILbmXpMzL5B150z8Zyhg0jnolmSIXxwJ2K5gl1IGEnTjL
 d0Pg==
X-Gm-Message-State: AOJu0YxDPOzCZZfOw9v9Ge2gMzAoyTyAC+NKagVF1byLL/Y3RRO8/1+5
 t5TUHIP3heNB2+ZvQXBSlts=
X-Google-Smtp-Source: AGHT+IHdudQvuC/lyGmvDLmISXErlKLgahloCNNddMPoFOYU3xXcQk081H1/xDsa1sPb7po13mCXnQ==
X-Received: by 2002:a05:651c:2213:b0:2cc:d864:124e with SMTP id
 y19-20020a05651c221300b002ccd864124emr2688835ljq.18.1704142821231; 
 Mon, 01 Jan 2024 13:00:21 -0800 (PST)
Received: from hex.my.domain (83.11.207.119.ipv4.supernova.orange.pl.
 [83.11.207.119]) by smtp.gmail.com with ESMTPSA id
 i15-20020a05640200cf00b0055404e08589sm15122045edu.85.2024.01.01.13.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jan 2024 13:00:20 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH 0/2] Fix panel polarity mixup in S6D7AA0 panel driver and
 Galaxy Tab 3 8.0 DTSI
Date: Mon, 01 Jan 2024 22:00:14 +0100
Message-Id: <20240101-tab3-display-fixes-v1-0-887ba4dbd16b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN4nk2UC/x3LSwqAMAwA0atI1gYaP114FXGRatSAqDQiinh3i
 8vHMA+YRBWDJnsgyqmm25pAeQb9zOskqEMyFK6oHDnCg0OJg9q+8I2jXmLoa/KjC56JCdK4R/l
 D+trufT8/HwxsZAAAAA==
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1704142819; l=715;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=SZn5M9Pk6q9VjN++Ee+TessamT4rYBp1C1F4I9mxRN8=;
 b=wBY0KIHnA5bzFetxlwqtDbP103C+pP9HM7SG3H9Q4sCCtzwiy6Erlb8Ux10uWKtZSSei3OiNV
 298Jx2OoZdgCOKOldtWLnCf2PijMgNEORBRuIebIOme6UuYfk2YXNB2
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Artur Weber <aweber.kernel@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Two small one-line patches to address a mixup in the Samsung S6D7AA0
panel driver and the Samsung Galaxy Tab 3 8.0 board it was initially
added for.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Artur Weber (2):
      ARM: dts: exynos4212-tab3: add samsung,invert-vclk flag to fimd
      drm/panel: samsung-s6d7aa0: drop DRM_BUS_FLAG_DE_HIGH for lsl080al02

 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: 610a9b8f49fbcf1100716370d3b5f6f884a2835a
change-id: 20240101-tab3-display-fixes-6516f0b6a1a1

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>

