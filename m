Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0637ED869
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 01:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6BB10E2B2;
	Thu, 16 Nov 2023 00:17:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C544C10E2B2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 00:17:48 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-6ce31c4a653so121905a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 16:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700093868; x=1700698668; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+T640iabDcn94YPGyLAPy5TpEuHJTBSfofResuK41VQ=;
 b=FNQs7GqKDZ4i2TPNqQO1t9keafgq2awFnUY65hiLzJH4R80v23u33G5BQD20iAjcyr
 bjgNwYJTx2z/HTI5yr2d2X0gect1NWvnyqNvgLvX+9sF7+70n9jjDUcQRPeOcGNA53ll
 RovK/rDjtMkYU9Hkka5Y1Ieslck9KZ7MTpEZ5CdAKIJ5hKaQc+ECAZizyKbafO7fBqEV
 8MyKc1I0EldwGyJnMAjo/RUiBzQuj3MdHK69E0pcKoJ/Z8WSfhfYWbJWGUFzBChSuxPh
 teUh/CRQ1AWqLUDYLwMOO/rRG4X/8Xhl+0lAZjxFOCPI/Gsmk+IPK/X3TqYM7UBEBU6j
 /oTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700093868; x=1700698668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+T640iabDcn94YPGyLAPy5TpEuHJTBSfofResuK41VQ=;
 b=ClmyHjHnpfpeV7evv57m8cTYZaT0yXn07puIrTlpQ9a2WjGXkZTUZSX25Nfi00grRa
 f+ZPWMH/pntznrwrusTYT/6PpiXmNY8MW1Hil8iUbFp9fDTq6g/3uhiYOiNH2dX7fK8x
 ZmFY6x9gS+DCRGARjipO8AQ7j8Z9G4m+rRA6gvq2rMrWpv2FDQf/sDhZMkURGjJEMwbz
 91e0ek53m5M5A6e/FjwxCCc8P5Pz/1vk2ukKgD25Ll0xGuYQ4nrwaNDFlVpgvNAyMCzb
 xqLnYC2Y9GlLLP5axQaS5MrDfL6Q1jOeIkzUYHLO9i5RSneIqg2fzyNU5YN1vxnP/pkx
 AMrg==
X-Gm-Message-State: AOJu0YyXMVMhlNvNNsDQgJl5/6laL/NyMXsHYacqD9RXwPQ+dx06GmnZ
 VyHY3CeIXjIzWCUTTWzygLI=
X-Google-Smtp-Source: AGHT+IFKl9kDcNbmofepMGj1Dnht7Xf1P87GcxVSLTppZx4COKkoDcBO4GGyvMHqiBZZYKfstb4zwA==
X-Received: by 2002:a9d:62d3:0:b0:6bc:fab5:e996 with SMTP id
 z19-20020a9d62d3000000b006bcfab5e996mr6517974otk.31.1700093867763; 
 Wed, 15 Nov 2023 16:17:47 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a9d7d92000000b006c619f17669sm727117otn.74.2023.11.15.16.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 16:17:47 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V3 0/6] rockchip: Add Powkiddy RK2023
Date: Wed, 15 Nov 2023 18:17:36 -0600
Message-Id: <20231116001742.2340646-1-macroalpha82@gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, sebastian.reichel@collabora.com,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Powkiddy RK2023, which is extremely similar to
existing Powkiddy RGB30 device.

Changes since V2:
 - Split "hold panel in reset" to a separate patch for the NV3051D.
 - Changed replaced common include to a new Powkiddy specific include
   to better reflect the similarity of these two devices (and so as
   to not have to delete so many nodes).

Changes since V1:
 - Necessary clock changes have been accepted to mainline, so removed
   from this series.
   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=f1db0865b4628d5e2e85347350c077a71f0629d2
 - Combined Powkiddy RK3566 devices in devicetree documentation.
   Dropped ack from binding as this change is vastly different than
   the previous update.
 - Updated panel driver to hold panel in reset status after unprepare.

Chris Morgan (6):
  dt-bindings: display: panel: Update NewVision NV3051D  compatibles
  drm/panel: nv3051d: Hold panel in reset for unprepare
  nv3051d: Add Powkiddy RK2023 Panel Support
  dt-bindings: arm: rockchip: Add Powkiddy RK2023
  arm64: dts: rockchip: Update powkiddy,rgb30 include to rk2023 DTSI
  dt-bindings: arm: rockchip: Add Powkiddy RK2023

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +-
 .../display/panel/newvision,nv3051d.yaml      |   2 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3566-powkiddy-rgb30.dts    | 154 +--
 .../dts/rockchip/rk3566-powkiddy-rk2023.dts   |  38 +
 .../dts/rockchip/rk3566-powkiddy-rk2023.dtsi  | 875 ++++++++++++++++++
 .../gpu/drm/panel/panel-newvision-nv3051d.c   |  57 +-
 7 files changed, 981 insertions(+), 152 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi

-- 
2.34.1

