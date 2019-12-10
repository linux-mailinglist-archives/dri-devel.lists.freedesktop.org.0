Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E696A118285
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0423D6E837;
	Tue, 10 Dec 2019 08:40:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4801B6E82A
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 08:36:45 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id s10so7025754plp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 00:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4fsnlSubZghOrO7JimNuHIfleyU8iOvTlpKskXRjns4=;
 b=ii/ucN1rxj6JCmjxSTHN0ekVilVInrhHQyAguU/mv0gKySpU4EjFHUaHdJuuyNk9JB
 Vq+dOrrAV7d9WfTjY9U9elkS4HYOCUJ3ZalqlnkA0ef92RlCeY/GQYodU7L2NN3TClyH
 /EFpbokRIHQkuzlttz2O6XpRD26LC8mkKrPAvSPr+H8T4GGOpVFbCAnWe8JCqi8ie6ol
 dcFWtfU2TLobl0bPIs0LcI8pDnBNRpR3yUUFg+XNGZaQfYmAwPMkUqciQ2rF2y5OPlbM
 9fLRzLs0edzrKB+VWw2OrxqgnWcMPJk1tfW8yqekQsa8bCu6YI9eTvsaTIpQ9Jj5TO71
 VRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4fsnlSubZghOrO7JimNuHIfleyU8iOvTlpKskXRjns4=;
 b=MDeZ5yE4EBza/u6qFHeTvUESYR6XlNSeOdSc+g3vEObbo6pO8eXzpWoFOnBaX11gr1
 G5zMKRRp2poHHoISpa9lcaz5KDB/lXJ5QskgZyBBeHJNHPwnRtciB5VwNOoLSBxJeJLq
 A9kfu5VyRzL4k/ecKu3dLHuqS5dHwMewE+OF3ABMnx2K1ZOqfVGm1ky1aMJm4W35mdTT
 bDgqrx8wNOpwbaJ5DkBtEc6Jj9R0dYxAd1Hd4dmPrtJ0FxLkxtE8G8QgLVoRB4UD7g3u
 CPPk8Raae2JwE7gTBK14coi4RGEszbZFFqChHR1QW0hfiINjs28P8insH+4a8L6DzqxB
 LDDw==
X-Gm-Message-State: APjAAAXiBiTj6yJr1Yt9uRQrEoCsCiXDo/foG4UlO1c7Xdhlx7yrWHxX
 USQyt+C+r9P8M3B+Clm48i0=
X-Google-Smtp-Source: APXvYqyoXXioJ5BYD/aK5SM6EJtUev7BGsYxelZ31rR/MTOuLvS4HpjqFdMISdNatw3dVNJe4v9dNA==
X-Received: by 2002:a17:90a:a48c:: with SMTP id
 z12mr4193037pjp.38.1575967004921; 
 Tue, 10 Dec 2019 00:36:44 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id y128sm2246632pfg.17.2019.12.10.00.36.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 10 Dec 2019 00:36:44 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie,
	daniel@ffwll.ch,
	kevin3.tang@gmail.com
Subject: [PATCH RFC 0/8] Add Unisoc's drm kms module
Date: Tue, 10 Dec 2019 16:36:27 +0800
Message-Id: <1575966995-13757-1-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:05 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,
This patch is our Unisoc's new drm display driver, This driver
provides support for the Direct Rendering Infrastructure (DRI)
in XFree86 4.1.0 and higher.

This patch include display controller, mipi dsi and mipi dphy support
for Unisoc's display subsystem.

Best,
Kevin Tang

Kevin Tang (8):
  dt-bindings: display: add Unisoc's drm master bindings
  drm/sprd: add Unisoc's drm kms master
  dt-bindings: display: add Unisoc's dpu bindings
  drm/sprd: add Unisoc's drm display controller driver
  dt-bindings: display: add Unisoc's mipi dsi&dphy bindings
  drm/sprd: add Unisoc's drm mipi dsi&dphy driver
  dt-bindings: display: add Unisoc's generic mipi panel bindings
  drm/sprd: add Unisoc's drm generic mipi panel driver

 .../devicetree/bindings/display/sprd/dphy.txt      |   49 +
 .../devicetree/bindings/display/sprd/dpu.txt       |   55 +
 .../devicetree/bindings/display/sprd/drm.txt       |   18 +
 .../devicetree/bindings/display/sprd/dsi.txt       |   68 +
 .../devicetree/bindings/display/sprd/panel.txt     |  110 ++
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/sprd/Kconfig                       |   14 +
 drivers/gpu/drm/sprd/Makefile                      |   17 +
 drivers/gpu/drm/sprd/disp_lib.c                    |  290 ++++
 drivers/gpu/drm/sprd/disp_lib.h                    |   40 +
 drivers/gpu/drm/sprd/dphy/Makefile                 |    7 +
 drivers/gpu/drm/sprd/dphy/pll/Makefile             |    3 +
 drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c  |  640 +++++++++
 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c          |  254 ++++
 drivers/gpu/drm/sprd/dphy/sprd_dphy_hal.h          |  329 +++++
 drivers/gpu/drm/sprd/dpu/Makefile                  |    8 +
 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c                | 1464 ++++++++++++++++++++
 drivers/gpu/drm/sprd/dsi/Makefile                  |    7 +
 drivers/gpu/drm/sprd/dsi/core/Makefile             |    3 +
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c      | 1186 ++++++++++++++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h      | 1417 +++++++++++++++++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c  |  392 ++++++
 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c            |  544 ++++++++
 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h            |   28 +
 drivers/gpu/drm/sprd/dsi/sprd_dsi_hal.h            | 1102 +++++++++++++++
 drivers/gpu/drm/sprd/sprd_dphy.c                   |  235 ++++
 drivers/gpu/drm/sprd/sprd_dphy.h                   |  121 ++
 drivers/gpu/drm/sprd/sprd_dpu.c                    | 1152 +++++++++++++++
 drivers/gpu/drm/sprd/sprd_dpu.h                    |  217 +++
 drivers/gpu/drm/sprd/sprd_drm.c                    |  287 ++++
 drivers/gpu/drm/sprd/sprd_drm.h                    |   19 +
 drivers/gpu/drm/sprd/sprd_dsi.c                    |  722 ++++++++++
 drivers/gpu/drm/sprd/sprd_dsi.h                    |  210 +++
 drivers/gpu/drm/sprd/sprd_gem.c                    |  178 +++
 drivers/gpu/drm/sprd/sprd_gem.h                    |   30 +
 drivers/gpu/drm/sprd/sprd_panel.c                  |  778 +++++++++++
 drivers/gpu/drm/sprd/sprd_panel.h                  |  114 ++
 38 files changed, 12111 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dphy.txt
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dpu.txt
 create mode 100644 Documentation/devicetree/bindings/display/sprd/drm.txt
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dsi.txt
 create mode 100644 Documentation/devicetree/bindings/display/sprd/panel.txt
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
 create mode 100644 drivers/gpu/drm/sprd/sprd_gem.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_gem.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_panel.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_panel.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
