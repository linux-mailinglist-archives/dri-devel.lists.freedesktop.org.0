Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8880C65C1BE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 15:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCA210E3E2;
	Tue,  3 Jan 2023 14:22:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B293810E3E4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jan 2023 14:22:31 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id m3so13906269wmq.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jan 2023 06:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3FOheBM0S2+JbMMoxIwLqXXDKGtNhRlPkusnCew5bM4=;
 b=ctNJKAEB0mC5xYQFtNHesl28Mc05r11ifa4IUriehLf+mhL5e6FKXp7H+WgunJWKUe
 OQ+rDSbO0PXbiAUHpFZnQ5oWutvB+cQF9Z1NnrKggR8ObQ7xWhcX6jLvHkullHf8fXkO
 GC7AQomyAL+o3uOPS74g6UEKvTm7Lr5pNhv9Tv/3fZxrX8iXMjzOjS5aIVwWEdE/OQSy
 NODstBHDq3QhRdsw74lzoJTC3RshAplsYgqVm58vuk6I6vgxBsHKnXc6FSgjSJF4nCXs
 BIZvyND0DA3SzfLcY57mFkwhoPs7qmRZcERRx+gYw+QJJ0kg5nFczeOUzqJnuaFlI3/8
 igUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3FOheBM0S2+JbMMoxIwLqXXDKGtNhRlPkusnCew5bM4=;
 b=6zFmBDGHjM7moi1wezEcK9UCYjupICO/HZjf9oHDIx48cQoD+g/EXsxPJJtfbVVuuN
 xxKXo2v6YN82TYe/aP+lJhHHSAm5OHSDXt6NT4XdFp4imn1RvJ19dpYnFh+sEKydwAYO
 r7CFh2PZ9B/bcy8HoJAoaK1c9J+L6SMYCEQwc/gDYUny9kvm447egY1pVRyOyx/0cUvY
 krGl44nfNYYI3PTgiHneOkqtl9C1zAIdqzl5kc9uQAr3SXA4kezt2kFgCc2e5jCfJ73h
 mL0hBhDP6DOouw30K4okdYTfnrrYLSVngsWjEFjIEvakmwV+K8KK2ZdBq7cVffQVeFha
 MHWA==
X-Gm-Message-State: AFqh2kqObzcNOrgcXkF29EvDvpJcFhWzsn+q+0X+fnfvOw7Inps28ppf
 m+tC1MEB2STXZ6Stz/aeEy4R9sxGlmJi2lJi
X-Google-Smtp-Source: AMrXdXsKXqoBbrs912bxVrgViZoH9V38nCKH47rX6chFwc+h8PeTtZ9ZXS9djAEtUCr9hEqt9XJ7IA==
X-Received: by 2002:a05:600c:1e16:b0:3d1:d1a9:efde with SMTP id
 ay22-20020a05600c1e1600b003d1d1a9efdemr34972107wmb.12.1672755750093; 
 Tue, 03 Jan 2023 06:22:30 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 i6-20020a5d55c6000000b00283c7b5ee3bsm20182163wrw.101.2023.01.03.06.22.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jan 2023 06:22:29 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] drm/panel: add support for the Visionox VTDR6130 AMOLED
 DSI panel
Date: Tue, 03 Jan 2023 15:22:27 +0100
Message-Id: <20230103-topic-sm8550-upstream-vtdr6130-panel-v1-0-9b746b858378@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACM6tGMC/x2NQQrDIBAAvxI8d0EjSdN+pfSw6qYRjJFdEwohf
 6/0OHOYOZUQRxL17E7FdESJW25gbp3yC+YPQQyNVa97q422ULcSPcg6DYOGvUhlwhWOGng0VkPB
 TAnmyQQMj/uILqiWcigEjjH7pcXynlKThWmO3//79b6uH1S6CNyLAAAA
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.11.1
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the 1080x2400 Visionox VTDR6130 AMOLED DSI panel
found on the Qualcomm SM8550 MTP board.

By default the the panel is configured to work with DSI compressed
streams, but can work in uncompressed video mode since 1080x2400 in
RGB888 fits in the 4 DSI lanes bandwidth.

While display compression is preferred for performance and power
reasons, let's start with the uncompressed video mode support and
add the DSC support later on.

To: Thierry Reding <thierry.reding@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

---
Neil Armstrong (2):
      dt-bindings: display: panel: document the Visionox VTDR6130 AMOLED DSI Panel bindings
      drm/panel: add visionox vtdr6130 DSI panel driver

 .../bindings/display/panel/visionox,vtdr6130.yaml  |  53 +++
 drivers/gpu/drm/panel/Kconfig                      |   8 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-visionox-vtdr6130.c    | 366 +++++++++++++++++++++
 4 files changed, 428 insertions(+)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230103-topic-sm8550-upstream-vtdr6130-panel-f81dad976abd

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
