Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4011CA683
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 10:48:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DE46EAAD;
	Fri,  8 May 2020 08:47:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F33C6E12C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 04:13:21 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id x77so288964pfc.0
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 21:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=n63i3r0L2IRpeGMKN7qKGLKSiEkxvDfFBuN0D82sIKo=;
 b=f549fH1riIbuo8ah1TTsCCpm1ZZXn7S2OPcoVIKseqS3u3naNxt2u5u2yue9ia4f35
 aukn+x9RoVtzRotGy89BFThqOsN+8Hvz0BiPwBjQEETQ9gD+zhB0cqzrEvTxKYQDvgwF
 ZZ3vzEx4Edbtr92ALNFDitl/XcwHHmoK6aBBirRzTJb2giYxmR8LHalrm8FHTOBuhSD6
 hR6zDTJluoRElYuNmnpxzdsWrJvQ2QN2cyG5asOiU16f9ANpVcSJF4/7QDMMFK9+ZPgV
 k0NVAlaHzH3PUoYp+3/40hIKX2qcANGDt4gxjc+LWJBv7LnVGgOCTAESa5PmQ5zQMZyR
 da5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=n63i3r0L2IRpeGMKN7qKGLKSiEkxvDfFBuN0D82sIKo=;
 b=OuzWDCIpWAx5DYT+j+TGtXpk+nkQ/qTNmFeMiITeZsPusUBZfGNWFchQPAgnk6K9aG
 F0Ot1c1rhBOBkNt46RWBW4zI1LaXBqetf3uMxHZzuom++Q5U6Dfbm3uDZw1n8zA/sTjA
 0329Z3B3gyyZDlcl19O3fiveZvCmWSyCxwWFM4yozyaduH/MBhrMxUiFzthvv5vd+ET3
 DEkBNjzK33bJh4jDIw6++oqvw3tqS2t99h7HAv8vcK3hVQKpXFPFCCkgBdJa8jIZAJvH
 2NnHx8vCRyYv5on5GXhTr4Qcp4gJ6we2oVFtbKcki101sEcQO6a2mxedjnGAIM8VftKk
 gZsg==
X-Gm-Message-State: AGi0PuZleVh9RgXyfUDqb3lQ4dEvLzb8O/+Acymi897tnSB9g6h7ks9R
 Sg8XlPG/pqy0LNstkkSDfKw=
X-Google-Smtp-Source: APiQypKy7XAhc6hawzdj77Xs0oeZFyq8G/VpqAn061VrqG5U+MNUQKe6OKJlyeRDZxXp18aM4MdX/g==
X-Received: by 2002:a63:da49:: with SMTP id l9mr508966pgj.432.1588911200789;
 Thu, 07 May 2020 21:13:20 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.190.146])
 by smtp.gmail.com with ESMTPSA id h12sm314868pfq.176.2020.05.07.21.13.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 May 2020 21:13:20 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, mturquette@baylibre.com, sboyd@kernel.org
Subject: [PATCH v2 0/5] Enable ilitek ili9341 on stm32f429-disco board
Date: Fri,  8 May 2020 12:13:09 +0800
Message-Id: <1588911194-12433-1-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Fri, 08 May 2020 08:47:23 +0000
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
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 dillon min <dillon.minfei@gmail.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: dillon min <dillon.minfei@gmail.com>

This patchset have following changes

V2: verify ilitek,ili9341.yaml with make O=../linux-stm32 dt_binding_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml

V1:
    add ili9341 drm panel driver
    add ltdc, spi5 controller for stm32f429-disco
    add ltdc, spi5 pin map for stm32f429-disco
    add docs about ili9341
    fix ltdc driver loading hang in clk set rate bug

dillon min (5):
  ARM: dts: stm32: Add pin map for ltdc, spi5 on stm32f429-disco board
  ARM: dts: stm32: enable ltdc binding with ili9341 on stm32429-disco
    board
  dt-bindings: display: panel: Add ilitek ili9341 panel bindings
  clk: stm32: Fix stm32f429 ltdc driver loading hang in clk set rate.
    keep ltdc     clk running after kernel startup
  drm/panel: add panel driver for Ilitek ili9341 panels

 .../bindings/display/panel/ilitek,ili9341.yaml     |  68 +++
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi             |  67 +++
 arch/arm/boot/dts/stm32f429-disco.dts              |  40 ++
 drivers/clk/clk-stm32f4.c                          |   5 +-
 drivers/gpu/drm/panel/Kconfig                      |   8 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-ilitek-ili9341.c       | 561 +++++++++++++++++++++
 7 files changed, 748 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/ilitek,ili9341.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9341.c

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
