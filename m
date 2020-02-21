Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0063C167BC2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 12:15:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E76C36F403;
	Fri, 21 Feb 2020 11:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81A76EEB0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 07:49:03 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id v23so574661pgk.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 23:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=OK5QR972nKe83ja7vFw4PScqgofVWYqnjcZMFqqtFHM=;
 b=mwwv8UHF7HJf5WY4yLevMY3IG6ENI49aercwQ2Yl9FFyzEDARpP7dhT4blU8nwEfcg
 GjKxyz9Tn4VfGausA9k7XmZ0fqLQ/tuQRuvzy+lCCXIBALIlCbpcqBO+Vgdc+D/Zh52j
 LcbzVd+AM8RwMnEi1Cam6hURXU3eh4/X9N59I8Ah/BO6jCmAqKbp1kJOh7EXyQOPY59W
 wUU316emL1Nxm5RWYuHrgnVDRpPCQjgrKDnXqFan371heERGeMHwij5P21GLA75T6FuC
 bfxDILU7m+0O6LhKh9uGE88BSFT4ri3cJ0Sxrl4ZWk2efWEjwmsDLoANOsJe2a1iUhFD
 L9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=OK5QR972nKe83ja7vFw4PScqgofVWYqnjcZMFqqtFHM=;
 b=DCNeJoQiBnFFxvfnSW0WODy00QV+j2SX2s7xnY6GfPRihSoQFTJE/o49Ww5mWxFHXt
 FekiSgP7FSY0i9nKlDRvD8Hu/m7LvWIRHIprb4ORDj0y1eh1tVHQy0rnvwW9vMa4JmKa
 xQjf8v0H86Jin9k+XjeEGljfBm2Vq6rBAu6+gKfo9a01OzGlE1uWoOlTxBJQDHQvlEbd
 xuTIXXCHmLgN8GEhrBn5psBazG0vtUVh6cbrAhwe4lscZZkEY6bwG/PY+3bLsw615KND
 6pfYsT8E4OKnCSjUuZx58wgFHXwEQtcD/19f1Z0V0VjRWecd+Hu3dPzWhxC8IaXuDr5j
 XbFA==
X-Gm-Message-State: APjAAAXSVVnczis24kCFcmFpjeknSsCvoZxyj0A+k6HGaKpv53FIZ8z7
 d8QCJ90725y6wa0rNaqg6V4=
X-Google-Smtp-Source: APXvYqyVK4MW60zAdN5pTw3l6mI8blbOp0QqUPIeROkNy2b6AlXliCMgxdpShbHsfXfYjio7fSpifQ==
X-Received: by 2002:aa7:96b7:: with SMTP id g23mr35201332pfk.108.1582271343499; 
 Thu, 20 Feb 2020 23:49:03 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id d1sm1444653pgj.79.2020.02.20.23.49.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Feb 2020 23:49:03 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v3 0/6] Add Unisoc's drm kms module
Date: Fri, 21 Feb 2020 15:48:50 +0800
Message-Id: <1582271336-3708-1-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 21 Feb 2020 11:14:23 +0000
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
Cc: orsonzhai@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhang.lyra@gmail.com, baolin.wang@linaro.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ChangeList:
v1:
1. only upstream modeset and atomic at first commit. 
2. remove some unused code;
3. use alpha and blend_mode properties;
3. add yaml support;
4. remove auto-adaptive panel driver;
5. bugfix

v2:
1. add sprd crtc and plane module for KMS, preparing for multi crtc&encoder
2. remove gem drivers, use generic CMA handlers
3. remove redundant "module_init", all the sub modules loading by KMS

v3:
1. multi crtc&encoder design have problem, so rollback to v1

Kevin Tang (6):
  dt-bindings: display: add Unisoc's drm master bindings
  drm/sprd: add Unisoc's drm kms master
  dt-bindings: display: add Unisoc's dpu bindings
  drm/sprd: add Unisoc's drm display controller driver
  dt-bindings: display: add Unisoc's mipi dsi&dphy bindings
  drm/sprd: add Unisoc's drm mipi dsi&dphy driver

 .../devicetree/bindings/display/sprd/dphy.yaml     |   78 ++
 .../devicetree/bindings/display/sprd/dpu.yaml      |   85 ++
 .../devicetree/bindings/display/sprd/drm.yaml      |   38 +
 .../devicetree/bindings/display/sprd/dsi.yaml      |  101 ++
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/sprd/Kconfig                       |   14 +
 drivers/gpu/drm/sprd/Makefile                      |   15 +
 drivers/gpu/drm/sprd/disp_lib.c                    |   59 +
 drivers/gpu/drm/sprd/disp_lib.h                    |   21 +
 drivers/gpu/drm/sprd/dphy/Makefile                 |    7 +
 drivers/gpu/drm/sprd/dphy/pll/Makefile             |    3 +
 drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c  |  628 +++++++++
 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c          |  254 ++++
 drivers/gpu/drm/sprd/dphy/sprd_dphy_hal.h          |  329 +++++
 drivers/gpu/drm/sprd/dpu/Makefile                  |    7 +
 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c                |  787 +++++++++++
 drivers/gpu/drm/sprd/dsi/Makefile                  |    7 +
 drivers/gpu/drm/sprd/dsi/core/Makefile             |    3 +
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c      | 1169 ++++++++++++++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h      | 1417 ++++++++++++++++++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c  |  375 ++++++
 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c            |  544 ++++++++
 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h            |   28 +
 drivers/gpu/drm/sprd/dsi/sprd_dsi_hal.h            | 1102 +++++++++++++++
 drivers/gpu/drm/sprd/sprd_dphy.c                   |  225 ++++
 drivers/gpu/drm/sprd/sprd_dphy.h                   |   99 ++
 drivers/gpu/drm/sprd/sprd_dpu.c                    |  678 ++++++++++
 drivers/gpu/drm/sprd/sprd_dpu.h                    |  130 ++
 drivers/gpu/drm/sprd/sprd_drm.c                    |  295 ++++
 drivers/gpu/drm/sprd/sprd_drm.h                    |   20 +
 drivers/gpu/drm/sprd/sprd_dsi.c                    |  655 +++++++++
 drivers/gpu/drm/sprd/sprd_dsi.h                    |  192 +++
 33 files changed, 9368 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dphy.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/drm.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dsi.yaml
 create mode 100644 drivers/gpu/drm/sprd/Kconfig
 create mode 100644 drivers/gpu/drm/sprd/Makefile
 create mode 100644 drivers/gpu/drm/sprd/disp_lib.c
 create mode 100644 drivers/gpu/drm/sprd/disp_lib.h
 create mode 100644 drivers/gpu/drm/sprd/dphy/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dphy/pll/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c
 create mode 100644 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c
 create mode 100644 drivers/gpu/drm/sprd/dphy/sprd_dphy_hal.h
 create mode 100644 drivers/gpu/drm/sprd/dpu/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h
 create mode 100644 drivers/gpu/drm/sprd/dsi/sprd_dsi_hal.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dphy.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dphy.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
