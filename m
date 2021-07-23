Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A9D3D336D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 06:06:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9DA6FA34;
	Fri, 23 Jul 2021 04:06:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161186FA34
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 04:06:50 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so2206664pjd.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 21:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=RKdaEsPfAlKUYrkBK+n66uijIOWgcmdfoucBJb81UlI=;
 b=JlI8qQBVsqJolo4J6+lssAhVLAW4WI0h44RDmyWUIozpf+HOYMa6oBPQY1CYaiETlJ
 e0p86s7S0YEN67eYMoIL15B+yq73t8iZ2B1TS4Mt68w8NCbsCDQgCYD5NoQMX8Q/yFd7
 jLFu7ikQ7oHqAbsSavkh78zOBk+wGcGqGUQHmiViMybrCSnku6302tIgpPX/KakAGv3P
 7SyQ7QMGWrrYhdcT70+tQwFpqylL89y4fD72k9u3B2/UKDFohUYhUBaG92avHjQwYlAw
 mIa8fRBZRpH3chTO8D5m7mSFqhNVESnOh2YHa/806R7tW+ymgaHxrT9fVuGf82ZJo7i0
 A77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=RKdaEsPfAlKUYrkBK+n66uijIOWgcmdfoucBJb81UlI=;
 b=hkGCBYNp7nsHBs2iwkfX8DUYQ8NLauPXu9TItXPIzsE8/D5y95RNbeLIdJpLKRTM+L
 vHl6SdgypHRwh6L6UxGUnv3AFVWOuWmfEfKerSRlM6HYGpXdvUbTTvDWoYgS8lXPFgSR
 buQekUjUE3eEDNw7P+FS3oqctSPZSCXxqw0gx+xk8GnPscQ9pRfk3siUdXYPLpZIFD6c
 ZiHWqQCM5nQDUSpHhZ1ovTAaDWra8lUG3fsWTYhOKQcsm2kwEtR6IrIbNHFiKc+ugvhD
 vHnKf9c6dhfIDPNFhFU645rUy3jxDld88hlTwHA0YDNRV2gIy4Cc9+4PY54+D92S/71u
 e1vg==
X-Gm-Message-State: AOAM530eVRTBahkKfrTnTjyKCgU3IRBJm4dx9ImjDTAZoajNOWLJJUSd
 qYiAd2quW0g5cKtykJ/IJxU=
X-Google-Smtp-Source: ABdhPJwNAAij7z5rx88FKTHLGOz5rOgz5z1mKMYlcOKEJ1KRn7lreB7XIeJuFyi4DPC2Jc0gvis/mg==
X-Received: by 2002:a63:1d47:: with SMTP id d7mr3132259pgm.44.1627013209715;
 Thu, 22 Jul 2021 21:06:49 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
 by smtp.gmail.com with ESMTPSA id p3sm35474910pgi.20.2021.07.22.21.06.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Jul 2021 21:06:49 -0700 (PDT)
From: dillon.minfei@gmail.com
To: laurent.pinchart@ideasonboard.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 linus.walleij@linaro.org, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com
Subject: [PATCH v3 0/3] Add ilitek ili9341 panel driver
Date: Fri, 23 Jul 2021 12:06:40 +0800
Message-Id: <1627013203-23099-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
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
Cc: devicetree@vger.kernel.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 noralf@tronnes.org, Dillon Min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dillon Min <dillon.minfei@gmail.com>

Since the st,sf-tc240t-9370-t dts binding already exist in stm32f429-disco.dts
but, the panel driver didn't get accepted from mainline. it's time to submit
patch fot it.

This driver can support two different interface by different dts bindings:
- spi+dpi, use spi to configure register, dpi for graphic data.
  st,sf-tc240t-9370-t
- only spi, just like tiny/ili9341.c (actually, this part is copy from tiny)
  adafruit,yx240qv29

I submited the first patch last year, you can find it at [1].
this patch has one major difference from that one, which is replace the low
level communication way, from spi_sync() to mipi_dbi_{command,
command_stackbuf}() interface, referred from Linus's patch [2].

both the two dpi/dbi interface was tested on stm32f429-disco board, if anyone
want to verify this patch, you need apply the clk patch for this board first,
you can get it from [3]

[1] "drm/panel: Add ilitek ili9341 panel driver"
https://lore.kernel.org/lkml/1590378348-8115-7-git-send-email-dillon.minfei@gmail.com/

[2] "drm/panel: s6e63m0: Switch to DBI abstraction for SPI"
https://lore.kernel.org/dri-devel/20210611214243.669892-1-linus.walleij@linaro.org/

[3]
https://lore.kernel.org/lkml/1590378348-8115-6-git-send-email-dillon.minfei@gmail.com/

v3:
- add Fixes tags.
- collect reviewed-by tags from linus and jagan.
- replace DRM_ERROR() with dev_err() or drm_err().
- remove kernel-doc markers from struct ili9341_config{}.
- reorder include headers.
- remove the struct device *dev from struct ili9341{}.
- restructure the ili9341_probe() function, add two ili9341_{dbi,dpi)_probe()
  to make it more readable according to jagan's suggestion, thanks.

for the full drm driver exist in drm/panel need Sam and Laurent's feedback.
so, not cover this part at this time, will be update in v4.

v2 link:
https://lore.kernel.org/lkml/1626853288-31223-1-git-send-email-dillon.minfei@gmail.com/

v2:
- replace vcc regulator to bulk regulators in driver, from linus suggestion.
- fix dtbs_check warnings on ili9341 dts binding check.
- add bulk regulation node in ilitek,ili9341.yaml.
v1 link:
https://lore.kernel.org/lkml/1626430843-23823-1-git-send-email-dillon.minfei@gmail.com/

Dillon Min (3):
  dt-bindings: display: panel: Add ilitek ili9341 panel bindings
  ARM: dts: stm32: fix dtbs_check warning on ili9341 dts binding
  drm/panel: Add ilitek ili9341 panel driver

 .../bindings/display/panel/ilitek,ili9341.yaml     |  78 ++
 arch/arm/boot/dts/stm32f429-disco.dts              |   2 +-
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 786 +++++++++++++++++++++
 5 files changed, 878 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c

-- 
2.7.4

