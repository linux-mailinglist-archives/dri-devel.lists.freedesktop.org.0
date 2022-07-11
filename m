Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C71956FD93
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:57:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFBE8D50E;
	Mon, 11 Jul 2022 09:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D916A8D50E
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:57:35 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id y9so4321122pff.12
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 02:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ucIABpm0tHgZbugMVpXR/cvUpPRiZNPssbWbAhXi7gg=;
 b=rNmK0O6/+Lj6vxcMBnC3KBcmhOIh5Ic2wZj2otu6RA+O59tfRCYmBngCYG+901kZxL
 bcLdoGG7dH6wcQ1OIeQwd8U65ldL1NjQbcAPJELi97B+TPum+uX23qFHoBDa0FnRlCKj
 3c/SGPLHeAv0SJOFum0MZM83m7KXs5k2Yi6F0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ucIABpm0tHgZbugMVpXR/cvUpPRiZNPssbWbAhXi7gg=;
 b=zkwAX1lkhSpfVFO7DQZgBvLFHVzNIK3PJ9/nou+w3DVtuqyoCrtDVNB+X4DQJLLIjd
 bGMJ/ci2960XrCgQvevPVO/T872ItBzVR4y5OKqEA4SghJaedVZI4jlLdWkRU7dtGWKF
 QleDBRU8gmjd0HAEVMaKLow8ZLPkVa3BwxavGlHEByc6lIeduR1ughktDGHIw3YD820m
 dZjMM2azA1zIS35/UeEoOev0Sfo+kfIqVios2p/Evg771mostede3qmZ+nBMich6q34w
 cys5h+5ekthuJ4P1hQ63o+EGPy7Z4wHZ90VM7MXHpnxk4PXmvEBq5XjiSI18gRhueeVU
 C4KA==
X-Gm-Message-State: AJIora+mkAVj3kXukdkFR43e1ZQ6Dq8J/IEnvqLBt1Zd1UjCtJ5Cq3/9
 llf4wRIWJErFYvgMKuJzbM7SXg==
X-Google-Smtp-Source: AGRyM1shcbcdZucQQ7F1qcDmpMRqkfAOfjxb3Q05U7MTeRf2MEHZ1fAJoCmUS3y5HaN1ewWsco7fFQ==
X-Received: by 2002:a05:6a00:2292:b0:525:6c57:8dd5 with SMTP id
 f18-20020a056a00229200b005256c578dd5mr17866670pfe.17.1657533455349; 
 Mon, 11 Jul 2022 02:57:35 -0700 (PDT)
Received: from localhost.localdomain ([183.83.136.224])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a17090a390300b001ef81bac701sm6560814pjb.42.2022.07.11.02.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 02:57:34 -0700 (PDT)
From: Suniel Mahesh <sunil@amarulasolutions.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Christopher Vollo <chris@renewoutreach.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v3 0/2] Add R16 Vista E board from RenewWorldOutreach
Date: Mon, 11 Jul 2022 15:27:19 +0530
Message-Id: <20220711095721.1935377-1-sunil@amarulasolutions.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds the R16-Vista-E board from RenewWorldOutreach based
on allwinner R16(A33).

Patch 1/2 adds the dt-bindings for the board.

Patch 2/2 adds the board with the following below features:

General features:
- 1GB RAM
- microSD slot
- Realtek Wifi
- 1 x USB 2.0
- HDMI IN
- HDMI OUT
- Audio out
- MIPI DSI
- TI DLPC3433

It has also connectors to connect an external mini keypad.

v2 patches can be found here:
https://lore.kernel.org/all/20220615093900.344726-1-sunil@amarulasolutions.com/

Suniel Mahesh (2):
  dt-bindings: arm: sunxi: Add binding for RenewWorldOutReach
    R16-Vista-E board
  ARM: dts: sun8i: Add R16 Vista E board from RenewWorldOutreach

 .../devicetree/bindings/arm/sunxi.yaml        |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts | 362 ++++++++++++++++++
 4 files changed, 371 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts

-- 
2.25.1

