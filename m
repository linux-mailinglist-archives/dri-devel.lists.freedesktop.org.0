Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFBEC803DB7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 19:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A9610E3CD;
	Mon,  4 Dec 2023 18:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13F910E3C9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 18:57:25 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-58d54612d9cso3220559eaf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 10:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701716245; x=1702321045; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m3EZHczOx7koya72sYXSi8rdiO9yIL2IVq+1IfTnxCg=;
 b=nj2/t50oxVnVaHCfZ148hLkPTUjfSKmV68yb2LIw2YFUDKyOIHzMS4shawh9G6SLzk
 OTyGYCdQoJXmOmv4dpU3lHgJRjh/eaXKgl5tJEp1mQN8W+EnXayaCyvbSCPamcWmIPVr
 K5WgEloK5yx/sCNXmCVFLFIpVY0+9geAT+8Dezn96Q978T778W44cYiB0IMAB10sBu9P
 O7zPgJz8nSXISXwS5iReleiGWvU+VKtCucO91a9BesVTYz6IdTCxowpY0DeswbzbVDVB
 MZEN6mYdDZ/QjQI4EwIvVwtkzQx0+AfmBJBcs1GV9QRJlpjsmh4ijZbBObtaFz5oTWgi
 S/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701716245; x=1702321045;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m3EZHczOx7koya72sYXSi8rdiO9yIL2IVq+1IfTnxCg=;
 b=HdUmBlEGKSY9cKnX6b3buH4iU2H2JUUHylM/hiy3J8s5G0RQVi+sTaLHE6ZOE0Ndbi
 L1O2BkP8+4YbzqAVERAePKbVYB7jNNQi92Efcxfjgu6DSvyUycGDKTb/BAG+28kMqdiO
 v1z5GYUcrP4x8Iz1I1KDSAulEHDBsBHVMkp9x8r5JjSODFaA3h1dRPrMNxVg5sPpkPAV
 6e5U7Sq+3PGJvgvWoN7WpkvyvQpu215eXNjzSOGrLuGzt2/6tgadHD7+wSfSBIEAMX4R
 Z8Lkb8cF6VkzbLP3Ge9aa//9lj+4jkcLdOuea5NwpRJxd/r0YYNYsvzx15s/IGr6RqTU
 duvA==
X-Gm-Message-State: AOJu0YxRXzQnhqrpsNj88ZkP7y5XHDEaDy0oQ918LqtjHKoFqBNNxAbV
 mpGMUnSCm7JM4ltNME1SK6I=
X-Google-Smtp-Source: AGHT+IGsVHwRrAfqq4xLIPsN5oERcixtArTe5wxe1Vzbkpi/n7S980Z81B1TUUr2Z5wVehMBXeBH3Q==
X-Received: by 2002:a05:6820:2c03:b0:58e:1c47:76c7 with SMTP id
 dw3-20020a0568202c0300b0058e1c4776c7mr3120244oob.19.1701716245016; 
 Mon, 04 Dec 2023 10:57:25 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 10:57:24 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V2 00/10] rockchip: Add Powkiddy X55
Date: Mon,  4 Dec 2023 12:57:09 -0600
Message-Id: <20231204185719.569021-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, sam@ravnborg.org,
 mturquette@baylibre.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, mripard@kernel.org, tzimmermann@suse.de,
 quic_jesszhan@quicinc.com, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Rockchip RK3566 based Powkiddy X55 handheld gaming
console.

Changes since V1:
 - Corrected a bug with the DRM mode flags for the video driver.
 - Adjusted panel front and back porch and pixel clock to fix
   issues with display that occurred after correcting DRM mode
   flag bug.
 - Add a new clk frequency for PLL_VPLL to get panel to run at ~60hz.

Chris Morgan (10):
  drm/panel: himax-hx8394: Drop prepare/unprepare tracking
  drm/panel: himax-hx8394: Drop shutdown logic
  dt-bindings: display: Document Himax HX8394 panel rotation
  drm/panel: himax-hx8394: Add Panel Rotation Support
  dt-bindings: display: himax-hx8394: Add Powkiddy X55 panel
  drm/panel: himax-hx8394: Add Support for Powkiddy X55 panel
  clk: rockchip: Mark pclk_usb as critical on rk3568
  clk: rockchip: rk3568: Add PLL rate for 126.4MHz
  dt-bindings: arm: rockchip: Add Powkiddy X55
  arm64: dts: rockchip: Add Powkiddy X55

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 .../bindings/display/panel/himax,hx8394.yaml  |   3 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3566-powkiddy-x55.dts | 926 ++++++++++++++++++
 drivers/clk/rockchip/clk-rk3568.c             |   2 +
 drivers/gpu/drm/panel/panel-himax-hx8394.c    | 180 +++-
 6 files changed, 1085 insertions(+), 28 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts

-- 
2.34.1

