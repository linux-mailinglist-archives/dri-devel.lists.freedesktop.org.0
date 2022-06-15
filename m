Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7757D54D100
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 20:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FCB10F7E2;
	Wed, 15 Jun 2022 18:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF9A10E638
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 09:39:13 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso1500434pjh.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 02:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ja3EqjN7N3wjkxeGuFVn5Brj3OCcnua+aSOiaQe4d38=;
 b=Dl6wspIqN1HwQv+xanGbY5aahQSjQUwlXUwZZrlw7ZsOmHfqQ+C82WMcs9hILlP2J7
 A08MpVrb4Xc124CZe2D49toRajJ1auXhphFK1rOZSQmsvxoY2ciSH7k7+Z6fkM7fz7Tv
 53bTfCSTORaNt5pw+0wYQZY8oUsa8h68+R1dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ja3EqjN7N3wjkxeGuFVn5Brj3OCcnua+aSOiaQe4d38=;
 b=iqNLzSz/ZYGe4njEFRWE7OTPX/rfM9S7tnM4CfbaH0l3EEzga3e3I1a048wBbipa4g
 Q9u73iclUSsZCfwQOtCJ1Y6w5LPtAPi8ETGpRv1YU2207C0Jl1WzDPiD4je8sGyQwnVE
 35zNlkEqaSerqjHmW5N1WkdVAv+jRTskKTqAVz1UB1exjS3VXb1tLiOlo5vJ2FOduP4Y
 35a+Zvm4EiO8pmctCu0lxun2MJDKraXAhe+PGcxRHBi1ZHmobJ2MhOnHSK2lEv8E3kFj
 mP3RD9B/rW1pXMbpSzaG7bHS3qpF16++xtFxaBV7lbOxVFzQNandU3VSA28yzsLuF1Hy
 k3wQ==
X-Gm-Message-State: AJIora8VG1VwAAkDleaN9/i3WMR6qSAPJqCWnfqowAHyjWHOgAP6C0OC
 1BGdIW/YbeBJi1EBmMyp4GtDsw==
X-Google-Smtp-Source: AGRyM1ttjP1JHhgada/B2uAxCQZnmdni3+xYfYipiH7otAjGeZI2YHcaZGJM5J6ZNWQ53JQTvClPJA==
X-Received: by 2002:a17:90b:3b8a:b0:1e2:f1da:bf9b with SMTP id
 pc10-20020a17090b3b8a00b001e2f1dabf9bmr9184899pjb.77.1655285953507; 
 Wed, 15 Jun 2022 02:39:13 -0700 (PDT)
Received: from localhost.localdomain ([183.83.136.224])
 by smtp.gmail.com with ESMTPSA id
 jf17-20020a170903269100b00163f183ab76sm8662543plb.152.2022.06.15.02.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 02:39:13 -0700 (PDT)
From: Suniel Mahesh <sunil@amarulasolutions.com>
To: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Christopher Vollo <chris@renewoutreach.org>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 0/2] Add R16 Vista E board from RenewWorldOutreach
Date: Wed, 15 Jun 2022 15:08:58 +0530
Message-Id: <20220615093900.344726-1-sunil@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 15 Jun 2022 18:36:18 +0000
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

Suniel Mahesh (2):
  dt-bindings: arm: sunxi: Add binding for RenewWorldOutReach
    R16-Vista-E board
  ARM: dts: sun8i: Add R16 Vista E board from RenewWorldOutreach

 .../devicetree/bindings/arm/sunxi.yaml        |   6 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts | 361 ++++++++++++++++++
 3 files changed, 368 insertions(+)
 create mode 100644 arch/arm/boot/dts/sun8i-r16-renew-vista-e.dts

-- 
2.25.1

