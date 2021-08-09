Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1963B3E3F3D
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 07:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B0289AD2;
	Mon,  9 Aug 2021 05:10:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DDE89AD2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 05:10:35 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d17so15081722plr.12
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Aug 2021 22:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=bfUA2dfTdnWy7owueak2d2BBuP+5ggo63PNQbXg9bzE=;
 b=Cfe9rJ837P8KTfwuV/5W7iiaVQyE1YjQNfYn0rKTVHU76ZZYHhl8hxh8YBjxJRxXxw
 W1Pr9jKZyyDaV645NypdApCbNShTvncQ1cn1dr8TGR7pZC7NarOz85ko6dPIbfm/CIU/
 f5+Ds5hJZOSE8wubFYtQQ7/ocSnCLomJyiC4snJQ3orTqn1r0DUWOe1QwnEDirtdzEcx
 NCj7MDMnI9qK+7HftimklBs4FXOBy0k7uab0aluG16l/IynmASPNa9WRskecrYVzlUG7
 Tr1jN1mfWSjOEqsaMbfffIuqvI3TsbhxUhx1tjX+Yii662Itq00dybkGd4g0SbSSSa1f
 b6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bfUA2dfTdnWy7owueak2d2BBuP+5ggo63PNQbXg9bzE=;
 b=gdwyoqCo87rDC8Ys57LwBbcGUFHqQDxeNVyRspXcufUaEMF6ZpLKTNOhecik3lR1IR
 duKXzPqhSu0pkjmcooVl2vW3PmhAz0P5o3zkNlSySW/GDYKFwGTNvG4+cdRrFt/oMTwT
 VKClHN5ifx3xfRFwgAxT6WS6SSGn5hSk9JD7rxzprM01E89EkwcRQ1kkvWgCR7SkYoup
 73MB6OIKfSJH9qLfIlDqpeuQj+W72OFyslFIu0xS7XF96yraLwaToiqbl6BWA4rvmfby
 FmaOdT/hhXC62+Agz8k2OJ5+sqhx+5lyxUKif1lL/jlUOiz/u+VbwlvFJBSNNTpQakIs
 aLHA==
X-Gm-Message-State: AOAM530SQNOzxsGxaTeHlFzBhOYSU+heKI/yGq2/X3F0SrqHJ9VacqSB
 C4PSHKrs6eyGu4aqMI3PufRyFA==
X-Google-Smtp-Source: ABdhPJyjI9cyeTEe16lm05RIWz7l5Ip/lo0xiq9kg2hmD9U2pcCuCbC+y2IW1odl9UFS7tYUkaKhlA==
X-Received: by 2002:a17:90b:1209:: with SMTP id
 gl9mr809952pjb.148.1628485835061; 
 Sun, 08 Aug 2021 22:10:35 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com.
 [80.251.214.228])
 by smtp.gmail.com with ESMTPSA id e35sm20420219pjk.28.2021.08.08.22.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 22:10:34 -0700 (PDT)
From: Shawn Guo <shawn.guo@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Stephan Gerhold <stephan@gerhold.net>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 0/2] Add Sony Tulip Truly NT35521 panel support
Date: Mon,  9 Aug 2021 13:10:06 +0800
Message-Id: <20210809051008.6172-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
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

It adds driver for Sony Tulip Truly NT35521 5.24" 1280x720 DSI panel,
which can be found on Sony Xperia M4 Aqua phone.

Changes for v2:
- Add `port` node into bindings.
- Re-create the driver using linux-mdss-dsi-panel-driver-generator[1].
- Rename the driver to include Sony Tulip.
- Model 5V control GPIOs with regulators.
- Rename Backlight GPIO as "backlight-gpios".

[1] https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator

Shawn Guo (2):
  dt-bindings: display: Add Sony Tulip Truly NT35521 panel support
  drm/panel: Add Sony Tulip Truly NT35521 driver

 .../panel/sony,tulip-truly-nt35521.yaml       |  72 +++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../panel/panel-sony-tulip-truly-nt35521.c    | 552 ++++++++++++++++++
 4 files changed, 635 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c

-- 
2.17.1

