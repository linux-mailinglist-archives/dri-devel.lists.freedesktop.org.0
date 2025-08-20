Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992D3B2D467
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 09:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21A210E05F;
	Wed, 20 Aug 2025 07:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HXdgOCTr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AEAE10E05F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 07:02:51 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-afcb7ab87ffso94417266b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 00:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755673370; x=1756278170; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Kz8t+h/h/0n0QXBXq+nhgUGC9ql7IeTr95ekPgWAy9w=;
 b=HXdgOCTrxV8J/6yOUdxDfE8YM2C5+1+X823ngEIySSHva63SeEIpAR6lIW+IgtX3Ti
 PWisfZOZvJHS/Jq9qj0ZdVZ+zBKJ1xTHZH/B8gxyl7DeNEG0jLlHi3H9eXX14/MU8hOT
 JHen6EYSR8T12ubDJrJideW1HfmchXxaY7VupHxvnW7P6xNKgAe7fkGgUM7dGU0i/cwb
 auMBKbqhHvotdaVRrvQZpI7zWnN7Io1Tlo63mVD4w1I3jLlRKZhbS6B4QvqTUeGoklMG
 q3DPxH8p2fhrYhN0ckppmmxRwn3QFPZEGRmBCMnMwhk4sO6/HiMnNresn0yTfEMsWdYL
 iIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755673370; x=1756278170;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kz8t+h/h/0n0QXBXq+nhgUGC9ql7IeTr95ekPgWAy9w=;
 b=KJ7d38S/awKet6CjSEMb+TshKT+jD45PCtdlAoQ2ewjQTPoBp6PhV6Dy9I1yAGgqb0
 PLKzaXtm7D3rwTttlvFto7jrolWzIJ9wU/2wN2AxqAH7aZ5KdqSxtTPultLgcfTHOg/g
 2BtzeA68F2EYAj+bS6fHtL73sp2Tc8EEjBU3mOQdfSDASWFX5MedTFNEsjALDcyrBrRV
 LZJEpW6DSMonHZL0r9u+IWF0SEqmA057IjIXo+2+nZ7/IsT1TUo7dnv+ckRkV/Ok1hIq
 dwNn3a1n3XFi+8L9lNXwUBBAdnf5l9yBhF7DJqShnKjW4p/sZRBQLaJZ9865NA9oX3ja
 Sbtw==
X-Gm-Message-State: AOJu0YyUYU4BBj0enRML7xUUWKFgnT8c2ZW+nmuzIdyO4/ivaTXnYge4
 W6t89JTyHrOimPla6kOwsu9QdAc4ZR2AZdb9SCKR6NE+mTSoFBx3fwm8T8z2QX7g2+4=
X-Gm-Gg: ASbGncsMGJgjyHE7azpCek69zV3kgaIIxHuU1VkeIX30eUgebbNj7XDBbKUSW1VZlGN
 opOMFzpbKYPM4Dj7iyjRGHZrCH+HpkCnNpRsWSQOXX0Q2loiDH7pnYLVUcq/Pv8unumZ7eJH8o0
 EvQzbivXGiWe1BLZqaDby1ewsenrOwtexCZAvDlA1SmSGwRNU5I0Qx23JLXlzNL6E++FUDMIoYN
 yS7RLZSs17u6hwiNimp/7mabYP9Z2Xm5/IAirvcAxx5uod4GxGQxWOpjvQJGdJoAJyFTcXADbSg
 NYHTjDKk3w7JuuF6FcPguCFB+s6bwwkK2fjXffEleunSncx9Ghg4wC3eOOWtzEMXKndlMzT9aN1
 flnV0t6UQkqTjzLcMnc9Kx2lx1IX6EGElszsoSz+icawLsvZwPQ==
X-Google-Smtp-Source: AGHT+IEUJtY9T7M3w+t6NgODZP2UMBO1bB6yUNgABbdBlZ++2gMxl+ZFtQKIgu4nmM7A4aFMOc3sVQ==
X-Received: by 2002:a17:907:6094:b0:af9:3d0a:f383 with SMTP id
 a640c23a62f3a-afdf019afd1mr77479066b.6.1755673370012; 
 Wed, 20 Aug 2025 00:02:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afdf6ff14f8sm37756466b.67.2025.08.20.00.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 00:02:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] dt-bindings: display: Few cleanups
Date: Wed, 20 Aug 2025 09:02:39 +0200
Message-Id: <20250820-dt-bindings-display-v1-0-d5b2555df51f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA9zpWgC/x3M3QpAQBBA4VfRXJta6ye8ilwsM5jS0o5E8u42l
 9/FOQ8oB2GFNnkg8Ckqm4/I0gTGxfmZUSgarLGlqa1BOnAQT+JnRRLdV3dj01QuK/KxrhxBLPf
 Ak1z/tevf9wMZuMYIZQAAAA==
X-Change-ID: 20250820-dt-bindings-display-996a143c86ad
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "H. Nikolaus Schaller" <hns@goldelico.com>, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=x6AMMrfKmpsnt80qI/jaePh0x1MxD2M+8h0kme5S3Q4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopXMRGm342NsJMwTGBeIUU3aEDsSSJNSmaCf3z
 2hb1+uhE/aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKVzEQAKCRDBN2bmhouD
 18bZD/91yp/iNgPOT/8uepdf/zbiG/DGKC1+o61nNJG7BV5sIXxSsdSZ1foiLkHXibtjcNRwQ/s
 x+wbb+LGT8rwNihSQTbClhlnGpXKGOb5kIJQ9z3T+PIKGYN6CIV3o4p6hfvnGiiew5aADThPKJ9
 8NFQigShv/pzBXx/7yRzb4UyRxhkvfSjxBXf76ppaLwyvUh3Tcf5awj8aHfTVb9kR2jVBM21gAD
 SRTfGiqhC9yWvPJP16o9c3sdHOf8Pak2qnpJyfXj8yXGv3+EpcwZ4oJj55lq0mjIBoTlHaedT8L
 CwM/STq7YsVkiQHD2Yd6bln07WWyUdQtXiVUbm/JBKJgSAyysh1/E7VRbp17BQ2yvsl8AuRzi1X
 qVjHurkILLCLqiOGWuyYBYbr+Oddhxx3w3ZDR47yvJGMmXlHwfzTab5U5IW8OfiXHiSgAP0STuS
 zfMQFCqSeskPBGzRZm3FMVw6Cmlt4kZSgBff7JbYb6rD7dQZF1Z185+7beNhzP7mkFdtVplBT6B
 ueg1Uhz/o51bOZgNc3s2Jf/nBPRDEFwXdw5iSS63VO+LfPJsFJmg98MoUMEpkCbz4oMfag2Ig6Z
 Tl/wWTVLi9tC3Z4XuYkUHpUtHbUGghMGsxPnlZ+gCDNEYcdQN30wBgZOxKPet6HCgmghz8FDqla
 d+DIIriSdXsoRwg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Few minor issues fixed.
Rob, can you take them directly? Display bindings are pretty often not
picked up.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: display: ingenic,jz4780-hdmi: Add missing clock-names
      dt-bindings: display: ti,tdp158: Add missing reg constraint
      dt-bindings: display: rockchip,dw-mipi-ds: Narrow clocks for rockchip,rk3288-mipi-dsi

 .../devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml        | 3 +++
 Documentation/devicetree/bindings/display/bridge/ti,tdp158.yaml        | 1 +
 .../devicetree/bindings/display/rockchip/rockchip,dw-mipi-dsi.yaml     | 2 ++
 3 files changed, 6 insertions(+)
---
base-commit: c2a1a5ede4717e6f12d49fe5177a66d40cbf4847
change-id: 20250820-dt-bindings-display-996a143c86ad

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

