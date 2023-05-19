Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18518709ECB
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 20:09:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7E310E098;
	Fri, 19 May 2023 18:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C97D10E5DC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:09:19 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-510dabb3989so5415496a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 11:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684519754; x=1687111754;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8o05QKrR9i4VTufIFRtl+AkR5mq9b5z62LFHT8IgVfw=;
 b=aNrpVUMvMUZrfYK8lfSebmNQYE99vsyydV1N10nkuzsz9DUJKm80hRtutMT81CQ/v1
 erlLrLCFEXvUHu/3uUhhbpbghSv5bwZ+8TMFNzun5FCWpaWmZjOnmptTd3qkUrwhmt5O
 FfhqPY8IcOd1FM9R/q00TxXX9eAQbHmNXSwp32D8gjp+kN/FOrHK8Cxr3Uvm5ux5dGsY
 ExChZOjnPNs28nvEl7HsDVYGM4eXf5T6jZxxneuqtn5Q7p1mkSenltRNq0ufI8Pj9YWv
 zxkaJ6UR+/j+X5Z0VlaIjleiwsjCvChv0Uv/YqSkgyWNsjYs0Qq4Z2N7Ryxx9mzHG/0P
 bqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684519754; x=1687111754;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8o05QKrR9i4VTufIFRtl+AkR5mq9b5z62LFHT8IgVfw=;
 b=YfCucUYrm+5HbLHtdfbFiVd1mqXxKfyegiZVnsQU2nmQVdtxnOi8a5sHiepXRK/pwN
 9F3s6Sy+gEoN8q+dGBKjF0JocVJLx/ky3X5XecBWhKt/4xxCbhDxr8N0aDjp8ojKv2V4
 g+hiIKW02K352SvuLa2qMu6NmChTh85y3Zcg7YUrrrNc8gdPTSyns8g5hsGVFBt4m1kQ
 SOFWQafeYssyhN0XjvtVNagucQgRHDaxp7am5M0FdUsZP4r29vWNvSw/7FO2CW7/ND1+
 62OseyW9LtsvFPI+Rz8jGc8MGo3lbOuoJyryikRHXhSElsuu31cl36ztyhDpkQBNvHVu
 VBBA==
X-Gm-Message-State: AC+VfDzbVVHMD6xsP5yCHmPKGgQwxm0WHhS+5zZafgt/8eoe/UR21JVd
 RxZ7yDNjnMEj+6v5XoqNZuY=
X-Google-Smtp-Source: ACHHUZ4QuWMsmHNjfxTEGVqbmvSkwEgThKA2QEo9J/htJiK0EVr0kMRbpREmzY4yQ1LotTfnAwMbxQ==
X-Received: by 2002:aa7:d9c3:0:b0:50b:cae1:d7a3 with SMTP id
 v3-20020aa7d9c3000000b0050bcae1d7a3mr2639608eds.14.1684519754252; 
 Fri, 19 May 2023 11:09:14 -0700 (PDT)
Received: from localhost.my.domain (83.11.222.198.ipv4.supernova.orange.pl.
 [83.11.222.198]) by smtp.gmail.com with ESMTPSA id
 g26-20020aa7c85a000000b0050690bc07a3sm19824edt.18.2023.05.19.11.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 11:09:13 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 0/4] video: backlight: lp855x: modernize bindings
Date: Fri, 19 May 2023 20:07:24 +0200
Message-Id: <20230519180728.2281-1-aweber.kernel@gmail.com>
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
Cc: linux-arm-msm@vger.kernel.org, Luca Weiss <luca@z3ntu.xyz>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Artur Weber <aweber.kernel@gmail.com>, devicetree@vger.kernel.org,
 Jingoo Han <jingoohan1@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-fbdev@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-tegra@vger.kernel.org, linux-pwm@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert TI LP855X backlight controller bindings from TXT to YAML and,
while we're at it, rework some of the code related to PWM handling.
Also correct existing DTS files to avoid introducing new dtb_check
errors.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Changed in v2:
 - Added additionalProperties to ROM patternProperties in DT binding

Artur Weber (4):
  dt-bindings: backlight: lp855x: convert to YAML and modernize
  video: backlight: lp855x: get PWM for PWM mode during probe
  ARM: dts: adapt to LP855X bindings changes
  arm64: dts: adapt to LP855X bindings changes

 .../leds/backlight/lp855x-backlight.yaml      | 149 ++++++++++++++++++
 .../bindings/leds/backlight/lp855x.txt        |  72 ---------
 .../dts/qcom-apq8026-samsung-matisse-wifi.dts |   1 -
 ...-msm8974pro-sony-xperia-shinano-castor.dts |  23 +--
 .../boot/dts/nvidia/tegra210-p2371-2180.dts   |   6 +-
 drivers/video/backlight/lp855x_bl.c           |  48 +++---
 6 files changed, 189 insertions(+), 110 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/lp855x-backlight.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/backlight/lp855x.txt


base-commit: fb200218b40b7864f64f1a47de61e035d8934e92
-- 
2.40.1

