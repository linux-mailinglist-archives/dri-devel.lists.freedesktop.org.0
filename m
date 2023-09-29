Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A12547B32DB
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 14:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072F910E70B;
	Fri, 29 Sep 2023 12:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68B710E70B
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 12:54:27 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9ada2e6e75fso1957576966b.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 05:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695992066; x=1696596866; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+AuRv4KTqJ8bK4vJwp6Rlf7DjgTsFVdEaK8Kexn8Dp4=;
 b=E0OKb6HWSx72YQalD5tws6qU0ccl/wv+pfOv1TrfUrIStpzgdCpCjkHqzHGCMxhT+0
 gvayYRbkc9Qqdu9i4CjRyixPYpfgQmoPEugTpMPEey1oEBa47CZrMDy1EgdKzFy8F9Kd
 6Bh5Jh37FjIo/M4Yl8/w5Do2fm+7ivQpnC/vllsp5FvMAYr9FD0JXK3T61lpJ0Q+2CR3
 37oDXbnl/OykmVLjLZhXlEUfp/HIyZM1LSidetqdaf1+iVCqOy6DV0z4ZP1xZAzmsa6E
 l2E8G0jJYafL5kfazahU5QTAfcXLt3S3sV5JY/ZcKqr/F1dOcQWnXn86dlUI84XCChg/
 gfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695992066; x=1696596866;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+AuRv4KTqJ8bK4vJwp6Rlf7DjgTsFVdEaK8Kexn8Dp4=;
 b=HcB4Z/ezOqD9SmZsgAe94LAHw7bzmyA6VEwnZwdHprnh9+10onoqLZrxwFcy0tMfzr
 0eq+47qOPVpbjih58/bz/wDeO5wsbSQofgx0bGuHCVoIe1FAt/HaD9C5LnMLmRurdFdA
 yUZu9doW/hrymf7buB8FDiFhC2HKOavundcNmHhsVfyMF3jWw6oVE6dkXB7VGaSUVoAt
 wzFjWqhqrzqD9zKQC7+P02K5eBgemYIkz4oNM2P0FSX/8135fxc7Kige6C/5T9gdLYpf
 ysIhukJVufEc+1q2gS8sIGDE4jZPSC/CAgGfOpFaGYfuMmgPuoD2L4ZzZPk6DWBaUNJS
 trPw==
X-Gm-Message-State: AOJu0YwB814KvWBiEoPZA51mxn7GhY4E7pixUcqUr5c7jFpaTSJCBBk4
 GJia6R1dALgpXFsevapW+KmhWw==
X-Google-Smtp-Source: AGHT+IHRZn9LrlpURw5VR8gkE65oLEBKEN+4DaWKjtyxPioqWxZlBs4SfN8Yt45onlSLuw1Zv/bBug==
X-Received: by 2002:a17:907:7851:b0:9ae:594d:d3fc with SMTP id
 lb17-20020a170907785100b009ae594dd3fcmr3150969ejc.17.1695992065978; 
 Fri, 29 Sep 2023 05:54:25 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177217.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.217])
 by smtp.gmail.com with ESMTPSA id
 j26-20020a170906831a00b0099bc8bd9066sm12380376ejx.150.2023.09.29.05.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 05:54:25 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v2 0/2] Raydium RM692E5-based BOE panel driver
Date: Fri, 29 Sep 2023 14:54:19 +0200
Message-Id: <20230927-topic-fp5_disp-v2-0-7b5e1d1662a6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPvIFmUC/3WNQQqDMBBFryKz7pQkpWq66j2KlCSOOiBJSKy0i
 Hdv6r7L9+D/t0GmxJThVm2QaOXMwRdQpwrcZPxIyH1hUEJdhFYNLiGywyFenz3niE3dSCeEtiR
 bKCNrMqFNxrupzPxrnouMiQZ+H5VHV3jivIT0OaKr/Nm//6tEgaY2xvZ1K7Ue7jN7k8I5pBG6f
 d+/aCqhL8IAAAA=
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695992063; l=1363;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=2d9A8dWRUIiELWOfFWWRUFTRoeEgh24LYoeTZfnTIdg=;
 b=KFKilxuw2y1VD+FVx1XyC7xUmXUIkaWMvt6MYZK+K3+21M+RhPOmeb+/6P9/3/UQ25nyvjoNk
 lYj79bWX3LZBhrDtvOTAyE/dQBIM3ecP90jsp65aVlQbSgneO/pb2Mu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Fairphone 5 smartphone ships with a BOE AMOLED panel in conjunction
with a Raydium RM692E5 driver IC. This series adds the bindings and driver
for that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
DRIVER:
- Remove 1ms sleeps after each DCS command submission
- Remove WARN_ON from probe()
- Move DCS off commands from .unprepare to .disable so that they
  actually reach the DSI host
- Do NOT introduce the 60 Hz mode for now, exploring ways to avoid tons
  of boilerplate
BINDINGS:
- Fix weird capitalization at the end of a sentence in title:
- Drop unnecessary | in description:
- pick up rb
- Link to v1: https://lore.kernel.org/r/20230927-topic-fp5_disp-v1-0-a6aabd68199f@linaro.org

---
Konrad Dybcio (2):
      dt-bindings: display: panel: Add Raydium RM692E5
      drm/panel: Add driver for BOE RM692E5 AMOLED panel

 .../bindings/display/panel/raydium,rm692e5.yaml    |  73 ++++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c      | 423 +++++++++++++++++++++
 4 files changed, 506 insertions(+)
---
base-commit: df964ce9ef9fea10cf131bf6bad8658fde7956f6
change-id: 20230927-topic-fp5_disp-7671c009be18

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

