Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657A16F2437
	for <lists+dri-devel@lfdr.de>; Sat, 29 Apr 2023 12:46:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFD110E0A5;
	Sat, 29 Apr 2023 10:45:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C8810E0A5
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 10:45:55 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-504eac2f0b2so1149154a12.3
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Apr 2023 03:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682765153; x=1685357153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WTQTEbLPt4h9veixLWM+5ZtwRhk8Wsy+ewL1TGUe3D0=;
 b=oH5Kvm5drzQdcOXTiqEwKZhd7EmXTc4PzAK03AaVxM3T9Y3Z4v02nzKRQw+JKmLXDa
 hHfP3cVaROpARK80o9Px6dby16oN8U2ony8aEDqo8HHSJYrw5t9GKqy0MYpUDPsSctle
 CB5SFrTFkL7WFcReoHDaLQ+ZnfqxjD9ApSysyxIZqU9aGCQTW2yGDXSgWl+dwsvJesdi
 o3Ip7JbO0A3s2iZ9i4dUvZ2Whyo6X392jfNqd8+xo4TXHXLJUPAeM5t4MwR6TarTO9Uu
 aTa8+CWtcK4O+7PvC/eVLW87vMxxlDlsx4436E1Hf3iuF1Fbl8XLaxy6kbTgA48kCq1x
 A1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682765153; x=1685357153;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WTQTEbLPt4h9veixLWM+5ZtwRhk8Wsy+ewL1TGUe3D0=;
 b=eH0CMq1vQZD6beImj23oDn4u+S4fdJWq81s1v8OMkENJBXqE2F/nB0slcag1oDcFqL
 cL0fgTDu2Yu3CCj9tG+Lz6ZnFHz1XtOEIgahJ4wHjarh1pznNcTMwwYmbp8J6uEZgwHd
 1by9FMlgnDFM3QcocPekpdjW8OSjUgMv1FyyQMeyJD63vEIXz89/FwNBbqC8Rmp1C78t
 VhbTEZVbChLnvJaz5kHla7pc6AY8qRMWb81yNDDQuh/5GK5REoXHh7HS2ISgTTUSv+f2
 2jTB9w5jMQjGVF3YniUEp/W42i1J7QAMpNRbuKZq0mPfR3AG6AGJuarONxKe/BvrvGhW
 vx7w==
X-Gm-Message-State: AC+VfDwWhzqHmFrIRRnMjfoWTVitvnU75HGiByq7qndcfao/y0sABE9Q
 yMBDkObS/yXQgRfxz1z3iuE=
X-Google-Smtp-Source: ACHHUZ4x/Gdg5OzSrpmM9phfXhSpLi+EARAapUnJz09J7J4N94Z160t6oxkz+44oNxD3ND2gGUwSvg==
X-Received: by 2002:aa7:d547:0:b0:4fc:709f:7abd with SMTP id
 u7-20020aa7d547000000b004fc709f7abdmr1241415edr.2.1682765153465; 
 Sat, 29 Apr 2023 03:45:53 -0700 (PDT)
Received: from localhost.my.domain (83.8.115.30.ipv4.supernova.orange.pl.
 [83.8.115.30]) by smtp.gmail.com with ESMTPSA id
 b11-20020a056402138b00b004bd6e3ed196sm9952522edv.86.2023.04.29.03.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Apr 2023 03:45:53 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 0/4] video: backlight: lp855x: modernize bindings
Date: Sat, 29 Apr 2023 12:45:30 +0200
Message-Id: <20230429104534.28943-1-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>, linux-pwm@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-fbdev@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert TI LP855X backlight controller bindings from TXT to YAML and,
while we're at it, rework some of the code related to PWM handling.
Also correct existing DTS files to avoid introducing new dtb_check
errors.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Artur Weber (4):
  dt-bindings: backlight: lp855x: convert to YAML and modernize
  video: backlight: lp855x: get PWM for PWM mode during probe
  ARM: dts: adapt to LP855X bindings changes
  arm64: dts: adapt to LP855X bindings changes

 .../leds/backlight/lp855x-backlight.yaml      | 148 ++++++++++++++++++
 .../bindings/leds/backlight/lp855x.txt        |  72 ---------
 .../dts/qcom-apq8026-samsung-matisse-wifi.dts |   1 -
 ...-msm8974pro-sony-xperia-shinano-castor.dts |  23 +--
 .../boot/dts/nvidia/tegra210-p2371-2180.dts   |   6 +-
 drivers/video/backlight/lp855x_bl.c           |  48 +++---
 6 files changed, 188 insertions(+), 110 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/lp855x.txt


base-commit: e154a338e16cc3b3bbd54c891253319d22383746
-- 
2.40.1

