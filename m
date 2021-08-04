Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA513DF8E5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Aug 2021 02:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5798A6E98F;
	Wed,  4 Aug 2021 00:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821F06E981
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Aug 2021 00:24:06 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id l17so624485ljn.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Aug 2021 17:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=77hJXrhsOlvF6oe1Gy/71bngx7Swibl7zjXjn7JDTb4=;
 b=JKx+MBWxiihe0VyvwO2KJ02kWA24USSLP6Lf0xQkBfrFzcD6UjAjmd/PShVKY/+i3i
 dQIfkTSsxM5pZ4XVFHXB4uXxOPppzIAYtsgCMxGaHlcvQUzE3SsZXI7/qj/K7JzP8UeH
 Ikes47fkfeMGbhKUge4EkPPp5DdE+NVF+ex9d4bQneTjqQX3ZQytntalT1+lOTjQ8aw6
 jxlu9UH0LPotB7YiM6Hrg7v1kQg7HFdo4SKevxrq+diJLm4+3HG/V0VbZ4OQoHuoK16B
 uwFgxZTcFn9D60CSoZpxxpoxLyT20olqeglsDc2NbijVk0yxHJ4e1/qzD+KmqYNvPOMy
 ++4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=77hJXrhsOlvF6oe1Gy/71bngx7Swibl7zjXjn7JDTb4=;
 b=qtH1Dr631SsPa64bH3YNHk7jpeVzNoZLDQQmLMG6M0XHAIeAw2hFtmFQi/YxqSYk+x
 oPDPg7QWF1/D/XDqHJcdjuxujWF4/BjozKLYJke1E7V/HVA7SPOB9eVgDoafgUOnyFOg
 v1QAHJ82iRWp93CNKLMzfqdy3ftF01gK81JH9+q+Y5hdgm6GgbA0VqMaN3FhY2XJ0iwZ
 4FAQU0ucFDSlTeDpeJGMCMhDJrQdTxxbTAJjJDNjriOO56oKqhar9lNl4vXLHv7rlmMy
 letQlouAm/bvqDnQDlv+OE1jSo5/K4gXXOF045AVovKQC/JtkqfbHEOXSaQseVlSISlk
 WCFQ==
X-Gm-Message-State: AOAM531BiZSpDx/9d2DxXXcEHpZHCpUZ3G3bmy0Nx5OCQsSk3iqI9nPF
 KcllFViBF5Z+0bDpjMDMAvg=
X-Google-Smtp-Source: ABdhPJx8vAHnHn8j6mTOZSPuL5Ok/oPPKPH0gf8Oj/0TKnGxPILQq3oI3ns9YhFnj/fDDoKOY1iuYg==
X-Received: by 2002:a2e:888f:: with SMTP id k15mr16397989lji.326.1628036644702; 
 Tue, 03 Aug 2021 17:24:04 -0700 (PDT)
Received: from akaWolf-PC.. (broadband-5-228-138-51.ip.moscow.rt.ru.
 [5.228.138.51])
 by smtp.gmail.com with ESMTPSA id t17sm40992ljk.102.2021.08.03.17.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 17:24:04 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: 
Cc: thierry.reding@gmail.com, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 paul@crapouillou.net, akawolf0@gmail.com
Subject: [PATCH v4 0/3] add Gopher 2b LCD panel
Date: Wed,  4 Aug 2021 03:23:50 +0300
Message-Id: <20210804002353.76385-1-akawolf0@gmail.com>
X-Mailer: git-send-email 2.32.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Gopher 2b LCD panel is used in Gopher 2b handhelds.
It's simple panel with NewVision NV3047 driver,
but SPI lines are not connected.
It has no specific name, since it's unique to that handhelds.
lot name at AliExpress: 4.3 inch 40PIN TFT LCD Screen COG
NV3047 Drive IC 480(RGB)*272 No Touch 24Bit RGB Interface

Changelog:
v2: remove .num_modes
v3: sort QiShenglong vendor prefix,
	sort qishenglong_gopher2b_lcd_panel_modes struct
v4: rename lcd-panel to lcd

Artjom Vejsel (3):
  dt-bindings: Add QiShenglong vendor prefix
  dt-bindings: Add DT bindings for QiShenglong Gopher 2b panel
  drm/panel-simple: add Gopher 2b LCD panel

 .../bindings/display/panel/panel-simple.yaml  |  2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/gpu/drm/panel/panel-simple.c          | 43 +++++++++++++++++++
 3 files changed, 47 insertions(+)

--
2.32.0
