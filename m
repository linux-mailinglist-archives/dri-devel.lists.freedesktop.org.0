Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3B55231D2
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 13:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D159710E276;
	Wed, 11 May 2022 11:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF49D10E276
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 11:35:20 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id j6so2010550qkp.9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 04:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fIWpbH8Qkfx6CtZf98GRcpag46QLNFxJDLii79V6Ww4=;
 b=iwUFlCXpNjAisVEfnwmlAdOatVcSnAwwbuVcsltGQ/5e2qlxjuvMvHFH0zjH653Mbe
 P10WcoYwALsqMADv3kofz5Iv36VCkh+MBGhmZIVf+tfXY4c6t/nPYMTWollwMNTd8SA1
 axrtWIBOwW4r+pvlA76424OgOCu0uMq70lLVLEb+qqhnND16vEEjQS5J1IpkudyWrFy4
 5TlJT9hljT5a5CrhxTLXnu0mHPi/Gd9oa/44/w52HsA6upKYCtvyhYOLlUSUSNn9AO6J
 FrVO5m0S9T8BVuuyUXNKoMtg808X7troFbx1f36TKqFRqd8P4T0doH2AqrtBrlJleTDW
 O5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fIWpbH8Qkfx6CtZf98GRcpag46QLNFxJDLii79V6Ww4=;
 b=0xoyJOLtxExULEKCylwlvFy3oOBIgh82TrXjg7PdzSRLDzUtsyP3x1Pz3F30hYl8FE
 Nyv6WYeAEEwIrarpKI5BgNeHXvzYgDFeLkUJSQ/fhUIo04/CFOTUFadLeSlU14TN/5U7
 NogCLDl+eTGoImaGV5isO6OqFz11zsuLBx7MUS0eO5sibv+IjrPoGfMKMP8ytAT/5Jal
 H9VxkS8AnBniZBIJEjVO/8BB4Aj0nuADG0wpr+5dE3tMcXAkhTSam3mmwPROLZeIUC16
 0GSAM10IhVaTuPfFL2ZlJ7upR2ab4vYwh/G7PzLl7HNK9bYRE0aD/4QwoqSry4I2yoSR
 yzmA==
X-Gm-Message-State: AOAM532Dj3gDLdoT4dQGnEhKJbkvCNjzJ1YfX/lRcJrReSL9qmWaT2ra
 l0hlI9T1+SVgA4sMNEb9o78=
X-Google-Smtp-Source: ABdhPJzmxu38yPKnQkUR29DXmgeEH2Q7/lQoPhE5QKvfpHBeWFD/QSRUEnuuqI6W5KyHPA4iWJ4xBw==
X-Received: by 2002:a05:620a:254e:b0:680:a307:8a33 with SMTP id
 s14-20020a05620a254e00b00680a3078a33mr18549892qko.304.1652268919643; 
 Wed, 11 May 2022 04:35:19 -0700 (PDT)
Received: from master-x64.sparksnet ([2601:153:980:85b1::10])
 by smtp.gmail.com with ESMTPSA id
 bw26-20020a05622a099a00b002f39b99f6basm953377qtb.84.2022.05.11.04.35.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 04:35:19 -0700 (PDT)
From: Peter Geis <pgwipeout@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH v2 0/3] add Pine64 touch panel support to rockpro64
Date: Wed, 11 May 2022 07:35:13 -0400
Message-Id: <20220511113517.4172962-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Peter Geis <pgwipeout@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Good Morning,

Apologies Heiko on taking so long for this v2.

This patch series adds support for the Pine64 touch panel to the
rockpro64 single board computer.
This panel attaches to the dsi port and includes an i2c touch screen.

The first two patches involve making the reset pin to the Feiyang
fy07024di26a30d panel optional. On the rockpro64 and quartz64-a this pin
is tied to dvdd and automatically comes high when power is applied.
The third patch adds the device tree nodes to rockpro64 to permit the
panel to be used.

Changelog:
v2:
- Drop patch 4 so we don't "enable" the nodes
- Drop the unnecessary null checks
- Rebase to 5.18-rc1

Peter Geis (3):
  dt-bindings: display: panel: feiyang, fy07024di26a30d: make reset gpio
    optional
  drm/panel: feiyang-fy07024di26a30d: make reset gpio optional
  arm64: dts: rockchip: add pine64 touch panel display to rockpro64

 .../panel/feiyang,fy07024di26a30d.yaml        |  1 -
 .../boot/dts/rockchip/rk3399-rockpro64.dtsi   | 80 ++++++++++++++++++-
 .../drm/panel/panel-feiyang-fy07024di26a30d.c |  2 +-
 3 files changed, 77 insertions(+), 6 deletions(-)

-- 
2.25.1

