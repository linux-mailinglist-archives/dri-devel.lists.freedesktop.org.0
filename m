Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DEA144D2F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16106F3D5;
	Wed, 22 Jan 2020 08:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1C6A6EBF3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 08:51:19 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id p9so1035005plk.9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 00:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=P5hzbJ/D5OQnnI17N1166eEm61xxCbFsprqagnG+VjE=;
 b=Ymk0sIDLUtRA5jnvN237BnDeocFfzS6hjlNI2fkR9R2D7XqeCNhGmS42rPeLE+RJwo
 qPyqv87g1lmqX77uYKOyUWIFwvqlLLZbMevBPP11jAinnRPdZvFbPwIuTw3d8AKqT4YF
 7Rz92fvubPQePAaLSyYrlgr9NKijk4ZBSj/SRjqXVlxmaGiW0stGv2/brSBtHXX+pMJJ
 mkgqlc8YFY/L7uoEkTbG4ic1nKRP5PC70bBiQ/SynsSOmRMnFLeA3mIx4RASnbokb76F
 RrJIt38wPtRPxu9IOyR+1Jm1Seme2G7dkmIQFG+hjmSTJaTXMkfqEYuKpwXeukmTGlFL
 XYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=P5hzbJ/D5OQnnI17N1166eEm61xxCbFsprqagnG+VjE=;
 b=Ug1Lb49JLFMlzG70jZyjnUbY3zwo4OhYHiuAuqCP3if1JsN//Y41e0J3xkkvokWZ+j
 xSe2eFtBXlJjvST9dUknvNgTKqEgGsibzRGi4TRlPLudkcJIEdAXkUVF4Rq7l1vS6mZ6
 is38I2NvD/i97MwpLE01scAbfkTS12Lh5dEJldYe8GKFL+eeV+Smu2280OAIaMekw4fY
 Jd8uckYB9Z5emm+9AndH+eIsGagokTWm/2TZT9/Bx9fr+VOFAJ/lhrjwVptphNudeCaX
 //nbPCiDf2NelITolIGBAFBkosPKhLdtuItKjhYPjflLVgKfrxnEcRHjVOMvxmUvdV8G
 ymfg==
X-Gm-Message-State: APjAAAXJx2UOsMFcJMnQZRbtA3plwAXb8YrQ2eTvp6lRNhaKbQKi/8tz
 9dY+V4ncn4vtpT71sDZ8QGM=
X-Google-Smtp-Source: APXvYqxLNFJNXGhVtmyJxWZmtSEhLCgcKQTy4Zjf+7DPNMokZpP8VYGTA5BWbGEalZpenUbExvlZ5g==
X-Received: by 2002:a17:90a:22a5:: with SMTP id
 s34mr4226979pjc.8.1579596679316; 
 Tue, 21 Jan 2020 00:51:19 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id 80sm42820957pfw.123.2020.01.21.00.51.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 21 Jan 2020 00:51:18 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v2 0/6] Add Unisoc's drm kms module
Date: Tue, 21 Jan 2020 16:50:56 +0800
Message-Id: <1579596662-15466-1-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
 drivers/gpu/drm/sprd/Makefile                      |   17 +
 drivers/gpu/drm/sprd/disp_lib.c                    |  134 ++
 drivers/gpu/drm/sprd/disp_lib.h                    |   24 +
 drivers/gpu/drm/sprd/dphy/Makefile                 |    7 +
 drivers/gpu/drm/sprd/dphy/pll/Makefile             |    3 +
 drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c  |  626 +++++++++
 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c          |  254 ++++
 drivers/gpu/drm/sprd/dphy/sprd_dphy_hal.h          |  329 +++++
 drivers/gpu/drm/sprd/dpu/Makefile                  |    7 +
 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c                |  886 ++++++++++++
 drivers/gpu/drm/sprd/dsi/Makefile                  |    7 +
 drivers/gpu/drm/sprd/dsi/core/Makefile             |    3 +
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c      | 1169 ++++++++++++++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h      | 1417 ++++++++++++++++++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c  |  375 ++++++
 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c            |  544 ++++++++
 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h            |   28 +
 drivers/gpu/drm/sprd/dsi/sprd_dsi_hal.h            | 1102 +++++++++++++++
 drivers/gpu/drm/sprd/sprd_crtc.c                   |  212 +++
 drivers/gpu/drm/sprd/sprd_crtc.h                   |   98 ++
 drivers/gpu/drm/sprd/sprd_dphy.c                   |  246 ++++
 drivers/gpu/drm/sprd/sprd_dphy.h                   |  102 ++
 drivers/gpu/drm/sprd/sprd_dpu.c                    |  458 +++++++
 drivers/gpu/drm/sprd/sprd_dpu.h                    |  122 ++
 drivers/gpu/drm/sprd/sprd_drm.c                    |  305 +++++
 drivers/gpu/drm/sprd/sprd_drm.h                    |   16 +
 drivers/gpu/drm/sprd/sprd_dsi.c                    |  652 +++++++++
 drivers/gpu/drm/sprd/sprd_dsi.h                    |  192 +++
 drivers/gpu/drm/sprd/sprd_plane.c                  |  393 ++++++
 drivers/gpu/drm/sprd/sprd_plane.h                  |   36 +
 37 files changed, 10083 insertions(+)
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
 create mode 100644 drivers/gpu/drm/sprd/sprd_crtc.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_crtc.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dphy.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dphy.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_plane.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_plane.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
