Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AF47FF411
	for <lists+dri-devel@lfdr.de>; Thu, 30 Nov 2023 16:56:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55E210E010;
	Thu, 30 Nov 2023 15:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05F310E010
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 15:56:36 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6cd0963c61cso692042a34.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Nov 2023 07:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701359796; x=1701964596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TvmqJO0ppzl3rJXfbHdcHrgR5dQ8u3NxPpJslKQqqYw=;
 b=TQbmUcC74Qu42RIUdokxznzLfXMknNWbHXeUZ1vcBG1s9bYqazYAjNcpxBkKp1PuqN
 XZtgYGC8YYrWrEfg27ttKGgQ5W7crF1QTjKu9oCPFQirzlMXCVk4nr4nOBG3SDRXBo2v
 7wv+zy+zD5r+ffHP1XcdtQzL3z++vyJxGPmvd88D0y6nA+210riNcS3qXRRf290Jc/AL
 7T0eIwzvBRDVO69xM8Q7kJeZo8m6FRiqlgJYj6bgo0mbU09L0JX+HwmrOGzHEdSw1iVo
 4MfYLAtwTO+T51L4sg0NgrYOScqnP5BfDJdr7IuJNH4LBEf0uMDqhyF/+hZ5yajoCku8
 i8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701359796; x=1701964596;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TvmqJO0ppzl3rJXfbHdcHrgR5dQ8u3NxPpJslKQqqYw=;
 b=XZ6T7Tg2G8kfp9BS6KNnFUIXDdpeqnjlqwUKzjsnzfnsvQ86rZZhWzn9G+rZqpHnJ5
 PJlEl7OsLhTII1hcBplE3Bo07TqjFfVZb/fkZYZSXrTZ71I7mBnTWedYogJgoD1dJRJF
 nxAKvWTCekvvNTT02S3N5XxpqniJ2ntgd2b/lPLO9HDzoRzZByUJrI7DM+0HnFNgLLDn
 2h0t/ToV1Y/pL4QmRBQeT8g96uBwlNiCVsrAVPnlmDo/7MyYW6UGzymxpKqcfW7bz7He
 P5YBk2TlABq5Zsxx8WjxgvszBirb1VtWC11MhbNBEUu66VTj0PAXRKruADGpKoC/2Z/s
 dL9w==
X-Gm-Message-State: AOJu0YxjjCxEhpSJZ0GVAYvzf6U503esX3SPmbt4MuXEXw8WDk7XjfPa
 2VFqV47juA+6U7l9iAjGxy4=
X-Google-Smtp-Source: AGHT+IGETl/gTp4AkG0pVc3uLa1QNZZM4WQtChA8x1bd0u1DJ9TEu3j4YaOt3w6rwoz7iauW3gsExw==
X-Received: by 2002:a9d:7416:0:b0:6d8:17ea:e48e with SMTP id
 n22-20020a9d7416000000b006d817eae48emr16937254otk.30.1701359795998; 
 Thu, 30 Nov 2023 07:56:35 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a9d6f19000000b006d7ff27a47esm187852otq.77.2023.11.30.07.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 07:56:35 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH 0/9] rockchip: Add Powkiddy X55
Date: Thu, 30 Nov 2023 09:56:15 -0600
Message-Id: <20231130155624.405575-1-macroalpha82@gmail.com>
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

Chris Morgan (9):
  drm/panel: himax-hx8394: Drop prepare/unprepare tracking
  drm/panel: himax-hx8394: Drop shutdown logic
  dt-bindings: display: Document Himax HX8394 panel rotation
  drm/panel: himax-hx8394: Add Panel Rotation Support
  dt-bindings: display: himax-hx8394: Add Powkiddy X55 panel
  drm/panel: himax-hx8394: Add Support for Powkiddy X55 panel
  clk: rockchip: Mark pclk_usb as critical on rk3568
  dt-bindings: arm: rockchip: Add Powkiddy X55
  arm64: dts: rockchip: Add Powkiddy X55

 .../devicetree/bindings/arm/rockchip.yaml     |   1 +
 .../bindings/display/panel/himax,hx8394.yaml  |   3 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3566-powkiddy-x55.dts | 926 ++++++++++++++++++
 drivers/clk/rockchip/clk-rk3568.c             |   1 +
 drivers/gpu/drm/panel/panel-himax-hx8394.c    | 180 +++-
 6 files changed, 1084 insertions(+), 28 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts

-- 
2.34.1

