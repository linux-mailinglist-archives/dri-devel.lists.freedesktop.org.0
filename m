Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDD267BE24
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 22:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0406710E8A2;
	Wed, 25 Jan 2023 21:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3694910E122
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 21:09:18 +0000 (UTC)
Received: by mail-qt1-x833.google.com with SMTP id d3so2509258qte.8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 13:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EPiDgcipjgNdRkY3Z9BH0bSCD7F/IhOp1+OkeiKo+Tg=;
 b=Gjuim1G2iQKXJUKX+bJTr24WRgNSOngeO9fmVyvAqTmTDHLuw0udDGy8ckLeB/GV6i
 Tp1vvhaiR8FnOLujfQg1Ng9DeOa9f9vYZXZHYCHnYdWYlVN0lzvzmFv1RlqoWACMpH8w
 Xf1jG7/GFlRfjrUGz1gSDEJwoq52chMd5d0wpOfGIm8RoAN/zwj5LzKeMN7p8ZyaApr0
 siu/c0kJCY8MWNJb72+YZTesuaOih93Naah/tMli87xhCZ4fxvY/XbWXYVXDtjreCOHh
 +SnkVSnoHLSFaGH9gpr8aEH6RTW6Bb2eg3pY+plFMAsF3PS8iEumCzCmyHx2bSxu7xu0
 CJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EPiDgcipjgNdRkY3Z9BH0bSCD7F/IhOp1+OkeiKo+Tg=;
 b=dsQzEjK3l/pd3gsy9I7mnCmbBvkiwjhcqbdjWg94/zsEMJCYRnRNfz0N+J49PzpmVg
 yinJuUGgXu9KoYPygrF+4UXMAiGcovZKOSh+s3owkdHMrOl24byKU5QmFd/P/wsvAgD7
 ZQpNeSJNIKvTTgL571fXHD7X7RJqURZGUY6PifYNuSk/wXbxHw2XzjPMlHoAOaPUFVhd
 yWbyU8Ar47NXCpbIr8kr8NSBRJFmJQCQUNqeXxcaQ9VdQKdCNecU/ssKp6jYHV4pxZSE
 u3lNVZEMbOZbjf8byrzd/dkoV6nfuDP6AnPGVA60MIQwphartsololqeF/MhpFx/Q7LF
 jI1g==
X-Gm-Message-State: AFqh2kq6FhfjXTLIg0/g3LOiS8or5cW+rMRsRU3pe7MO9TAdrh8gKuW4
 txzPDUwg1NTxEOCjv5qax3QxhQ==
X-Google-Smtp-Source: AMrXdXu6tjgpwHxMJ/VXW+rCUpOHcG/ItMbGudGs+gp7qu7VsX/kPfQBOmSAwq/UAbLuR/G3NAFKzg==
X-Received: by 2002:ac8:4896:0:b0:3a5:24ac:a175 with SMTP id
 i22-20020ac84896000000b003a524aca175mr51479667qtq.56.1674680957167; 
 Wed, 25 Jan 2023 13:09:17 -0800 (PST)
Received: from [127.0.1.1] (static-72-90-70-109.syrcny.fios.verizon.net.
 [72.90.70.109]) by smtp.gmail.com with ESMTPSA id
 q196-20020a3743cd000000b0070736988c10sm4177090qka.110.2023.01.25.13.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 13:09:16 -0800 (PST)
From: Jonathan Cormier <jcormier@criticallink.com>
Subject: [PATCH 0/4] DRM: BRIDGE: TFP410: Add i2c support
Date: Wed, 25 Jan 2023 16:09:09 -0500
Message-Id: <20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHWa0WMC/yXN0QrCMAyF4VcZubaQtorgq4iUpqYuoHWkmwzG3
 t1uu/zhfJwFKqtwhVu3gPJPqnxLC3vqIPWxvNjIszU4dB6tu5gxD2eLQVwyntwVCSl7RmiAYmVD
 GkvqN/KWMs3hE+vIGg62rQblLPN+eX+s6x/+HeIjggAAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
X-Mailer: b4 0.11.3-dev-d001f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1891;
 i=jcormier@criticallink.com; h=from:subject:message-id;
 bh=7DEgVz84wDEyR0sxfDf06N+lWfzxeUZpfqRP1tczmxs=;
 b=owEBbQKS/ZANAwAKAdzX/S4LNuuqAcsmYgBj0Zp7aDcdCk+9yMv/XE+pU/W5vRSh5c+/zfRFxfs8
 6ZFbyKiJAjMEAAEKAB0WIQT/MozqCeZtYxNnVN/c1/0uCzbrqgUCY9GaewAKCRDc1/0uCzbrqup9D/
 9gWJb98/LvAHt8vKxBJs/VL/ecw/yYOXuX2o4XY5CriXYLYwA3NX77R/64zbW7vZf3m+h7zMqur5yZ
 vRxww+qSw0z/wMfEh+w3XDuUW5iL/KMKryjn+SDpL+7akKZH6PI35ejhWN+uY6Fmi6EykYPr7h9N1G
 +mmhncSOZUHmKibhdojCvPtf5Kd8hhaOOX4AJ6/v+5axWHO9J2zl+/82Fo8FhJOqlWgl99phDKSyoi
 XwxF7YpmJQtUmHvU2Hu2OgGmrVqFVj9et4/GaQYmk5oeNP3oYDayki/I9buVMlm6dVaCbvyYerp9Cf
 d8dwBuknlDoHG+gikH+bgvD8/5oIiomcDNHMEGj8cdXVI0O7tsb+6QGHnuxTxgzDW0jhtwOfbFofFr
 GYvc8LFIE63PV3oLVQGvsAG5cdS3+U83BKiymFm3KdfnQq2ZL6BW9Cw+428YOqwHeZjSrme3uRd+vB
 0SZNEIFIMx68HBqZtjq2KEUQv4CIa2Mvfgik+8LCLKV2dbqlP43qoYCBIw52YL7Dt9uEXZRcSqf6a/
 RWOWRjOpL/NAtZbH4xHypOXge8UMYAe8JHj4sn4jaCgk1QM8iHJpU0QgfBk/ZLkfLGR/evleBSOntd
 LvU+NYPGaRHrS/xZf9NhErmOicts1pRjXje5HFanOi+kZU3DWwC6Vj5+rOEA==
X-Developer-Key: i=jcormier@criticallink.com; a=openpgp;
 fpr=FF328CEA09E66D63136754DFDCD7FD2E0B36EBAA
X-Mailman-Approved-At: Wed, 25 Jan 2023 21:21:46 +0000
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
Cc: Jonathan Cormier <jcormier@criticallink.com>, devicetree@vger.kernel.org,
 Bob Duke <bduke@criticallink.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Michael Williamson <michael.williamson@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TFP410 driver does not support I2C.  As such, the device remains in
Power Down if the I2C is enabled by the bootstrap pins.

Add basic support for the I2C interface, and provide support to take
the device out of power down when enabled.  Also read the bootstrap mode
pins via the CTL_1_MODE register when using the I2C bus.

Also allow polling device to support hdmi/dvi hotplug detection.

To: Andrzej Hajda <andrzej.hajda@intel.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Robert Foss <robert.foss@linaro.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
To: Jonas Karlman <jonas@kwiboo.se>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Jyri Sarha <jsarha@ti.com>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Michael Williamson <michael.williamson@criticallink.com>
Cc: Bob Duke <bduke@criticallink.com>
Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>

---
Jonathan Cormier (1):
      dt-bindings: display: bridge: tfp410: Add tfp410 i2c example

Michael Williamson (3):
      DRM: BRIDGE: TFP410: Support basic I2C interface
      DRM: BRIDGE: TFP410: Fix logic to configured polled HPD
      DRM: BRIDGE: TFP410: If connected, use I2C for polled HPD status.

 .../bindings/display/bridge/ti,tfp410.yaml         |  42 ++++++++
 drivers/gpu/drm/bridge/ti-tfp410.c                 | 110 +++++++++++++++------
 2 files changed, 124 insertions(+), 28 deletions(-)
---
base-commit: 93f875a8526a291005e7f38478079526c843cbec
change-id: 20230125-tfp410_i2c-3b270b0bf3e0

Best regards,
-- 
Jonathan Cormier <jcormier@criticallink.com>
