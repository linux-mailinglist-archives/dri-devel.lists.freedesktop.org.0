Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE597E73DD
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 22:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0E010E926;
	Thu,  9 Nov 2023 21:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7EE10E927
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 21:50:15 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1f03fdfcfacso731762fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Nov 2023 13:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699566615; x=1700171415; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KHWtDVUYZSf0Guk+L6n4AjbYj4AnCFaIY1Xxcyv3l2c=;
 b=UKZ0unkd7Tg4owmdJ1aoboX2RWidYROAMOdLfpDQd1XZ+eaDyRNmYlEi89U3Ra9XHY
 8fWzOkhotvKLJYCNEEpz9y16fhBvQxDefwyVISgt/GQqrLNlAHwwmIgvZ3kU8ex6zq0x
 dTgtw/jFBUTtD9SK0YcAyy5dYvMQ5tuJb2Ih+7lIL7XsAKn9pjI5YVo9Yof+AGpJyBnC
 MTV1Z2vPyZjNJoVdwQTn3oEgCrVjkRx4+VlsvWN4/Jm4r/5dRDTUiUUY8ESN3Wu8kXFc
 kkU72j0pF8Wlx8dAB5UYAF2v64uPL3N+nyHnFLXciqX781utFnUe1ftcw6W22bElTW1s
 Gxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699566615; x=1700171415;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KHWtDVUYZSf0Guk+L6n4AjbYj4AnCFaIY1Xxcyv3l2c=;
 b=sKXKYMGA/h8zwsjvyxvyIoXWaYgVPXfa5BE2/3wjkYYbt8kmxoLbiQ7Km6M0veZ9yd
 FnT4do8mhHbJ2o38ObPawEHuM6SYQ70phNAJbKqCubVfYHvzCITfPNXAv0f2HWU2Ckmz
 mdDlB0X3jVyMvdgoRrfYhalqpanpMp//a10/Nc7M2w3kj95HqyFUo7NINX/quoUqcWIS
 tvd/YnrUfaxIZj9xq+OEcbXSAb/kAMSbFS+XJT0JG+bpFyxQgPiUPuzUg2I8XLdDWTso
 HirDzychUR85KoYkTEoe+gn8kVnuefDP4o3aSmG3AoDAbiqZMLlJVrMBx5itGGW4J7ky
 Ezzg==
X-Gm-Message-State: AOJu0YxHbCjCfi0ze8oWboAbb0fZfHcynsGMSSzE5kgh6fkFfupZXXP5
 C4LR9Bq4ssyfu3hBIGUlWS8=
X-Google-Smtp-Source: AGHT+IG1tUCieKLhfvTf/RY4xeb9CnluV/OI/K5u8iVdMN1jloug13hPXlZ6R1USTMrKbhXhGYgFWw==
X-Received: by 2002:a05:6871:723:b0:1ea:fd4:58fb with SMTP id
 f35-20020a056871072300b001ea0fd458fbmr6987340oap.52.1699566614875; 
 Thu, 09 Nov 2023 13:50:14 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 tp22-20020a0568718b9600b001d4d8efa7f9sm864003oab.4.2023.11.09.13.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 13:50:14 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V2 0/4] rockchip: Add Powkiddy RK2023
Date: Thu,  9 Nov 2023 15:50:03 -0600
Message-Id: <20231109215007.66826-1-macroalpha82@gmail.com>
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
existing devices from Anbernic.

Changes since V1:
 - Necessary clock changes have been accepted to mainline, so removed
   from this series.
   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/commit/?id=f1db0865b4628d5e2e85347350c077a71f0629d2
 - Combined Powkiddy RK3566 devices in devicetree documentation.
   Dropped ack from binding as this change is vastly different than
   the previous update.
 - Updated panel driver to hold panel in reset status after unprepare.

Chris Morgan (4):
  dt-bindings: display: panel: Update NewVision NV3051D compatibles
  nv3051d: Add Powkiddy RK2023 Panel Support
  dt-bindings: arm: rockchip: Add Powkiddy RK2023
  arm64: dts: rockchip: add Powkiddy RK2023

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +-
 .../display/panel/newvision,nv3051d.yaml      |   2 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3566-powkiddy-rk2023.dts   | 161 ++++++++++++++++++
 .../gpu/drm/panel/panel-newvision-nv3051d.c   |  57 +++++--
 5 files changed, 213 insertions(+), 14 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts

-- 
2.34.1

