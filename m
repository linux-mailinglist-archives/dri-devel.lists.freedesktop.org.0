Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35706829D36
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 16:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E6010E5FD;
	Wed, 10 Jan 2024 15:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0FF010E5FD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 15:14:18 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id
 a640c23a62f3a-a26ed1e05c7so495947866b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 07:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1704899657; x=1705504457; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8SieuMzS9DY3Pq9rPlup7/9ZFoFKz0B/pmDiOQsHEqI=;
 b=ooVhWGB98123xGZOipx053gqhgQutJjefcXQ1zWbZclL2j6XHKBDehkOhNUPgS8KVI
 VOa4YSH3Ij72BiskWsbgMdOK2NmsCminYULpfbW1T0+y/qTt5xNgFOGPXIEMqUuTsTZ+
 146wAIdUp6RHp2cnlVwT4GhPlv+5dqQQdLXA9630dqZR1/AAR4xo750WCYpsNhQxyhoH
 ExRA8peaYPGAkynJUNBmp6x9oRZlkDCuo9HvmfztOBNA0/IpX97fygfxQXq6sqNklloy
 sbWAq2OJDQXT/UQsdkMCYjXtviWGgQDTmLrxZK0J2mv7xGFrB7+TJLRkdB30EeKeo7FW
 URug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704899657; x=1705504457;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8SieuMzS9DY3Pq9rPlup7/9ZFoFKz0B/pmDiOQsHEqI=;
 b=ZvgtcZEBygkTnWuYQUfurSCPlhBebnGQF9j5XrrArCVtH2iMkaFkBW+kZdS0o6ocaa
 q6sfFuXJ2NNmGXWvTL3l6q8IDdud4engyn52+53QHFsiTRrhJG4tLeljNx2T6BC8RBmV
 KMQYg5ADO3c5z+H0EDyDkbBqoNangCpQwsDfT7v1Vikbyi4J90qE9EGA5H/E2P2ZM0Io
 QEzmW8mFZ/n3PW3hGb7Khyh8+FgdaHxkTmHYxxcIhLmCg5KBUo/VDip7cum4Dd8A7ECn
 9QzqcE8C1X95st1iQHd1g4qiDyV48YNcu1/EZQhuxkv6iWzksX+6OI5nCfSO/Aa8ctDs
 x+PQ==
X-Gm-Message-State: AOJu0Yx4hu5J8d5tRuYGT67QRFI/uD66sjAmLFc9cZ9gmnBRL1mlNW8h
 2XAYCy0rXT+c8OpHlmcYQE3OtZ2GI3wTJ0wdMHVX0QkDTs+PHpWs
X-Google-Smtp-Source: AGHT+IH+JVoLAsdIeBSP0v7Ta68ZvOe71Gvt3z5QTKw+y+MKcspk7OUyJ0XvP7JECETBN5UybvP+hg==
X-Received: by 2002:a17:906:6d59:b0:a26:b37d:bab4 with SMTP id
 a25-20020a1709066d5900b00a26b37dbab4mr484522ejt.171.1704899656621; 
 Wed, 10 Jan 2024 07:14:16 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 jx22-20020a170906ca5600b00a27a25afaf2sm2174517ejb.98.2024.01.10.07.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 07:14:16 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/4] Add display support for Fairphone 4
Date: Wed, 10 Jan 2024 16:14:07 +0100
Message-Id: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD+0nmUC/23MQQ7CIBCF4as0sxYDWKpx5T1MFwMOMokCAdNoG
 u4udu3yf3n5VqhUmCqchxUKLVw5xR56N4ALGO8k+NYbtNSjVNIIn0eRMdJDGIkWT+YwoUTo/1z
 I83uzrnPvwPWVymejF/Vb/ymLElIo9BatM0Yfp4tHLjmkSHuXnjC31r5TdxQppgAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
X-Mailer: b4 0.12.4
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luca Weiss <luca.weiss@fairphone.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce the bindings and panel driver for the DJN LCD panel using
HX83112A driver IC.

Then we can add the panel to the device dts and also enable the GPU.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Driver:
  - Drop "bool prepared" from driver (Dmitry)
  - Use drm_connector_helper_get_modes_fixed (Dmitry)
  - Use dev_err_probe in error path (Dmitry)
  - Fix width/height variables (myself)
- Dts:
  - Don't drop simple-framebuffer (Konrad)
  - Drop disablement of gmu in dtsi (Konrad)
  - Set zap shader path (myself)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com

---
Luca Weiss (4):
      dt-bindings: display: panel: Add Himax HX83112A
      drm/panel: Add driver for DJN HX83112A LCD panel
      arm64: dts: qcom: sm6350: Remove "disabled" state of GMU
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable display and GPU

 .../bindings/display/panel/himax,hx83112a.yaml     |  75 +++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  53 ++++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83112a.c       | 352 +++++++++++++++++++++
 6 files changed, 492 insertions(+), 3 deletions(-)
---
base-commit: c03393f04b540b66d267a402fcc9ac2d3733b9e3
change-id: 20240105-fp4-panel-50aba8536a0a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

