Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F6F118290
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 09:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D1726E84A;
	Tue, 10 Dec 2019 08:40:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166EC6E48C
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:51:29 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id q8so7352575pfh.7
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 06:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y+0hUIOuHNjYLITTiiOz7YncnUCd05TXc7UArDjIWPQ=;
 b=MTVk39t+p3sutUs/EaeRJsE9LBl7uiMHkFMRLZd/nX+Pe2fsFUDRRmXx9l/V5Dj6aV
 59Z9O3SSk0vvqJhbLLM3jWLWTQgC0a5FRwezfJhM/mgIXd7HIQAOSTSiq0SsZSItO1RV
 LBTAWLNycc1s071U3sy9+SqAlBOMKjNrnU7mE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y+0hUIOuHNjYLITTiiOz7YncnUCd05TXc7UArDjIWPQ=;
 b=nQbSwIfHVIGJWmoAWXXfcCBwnmoih6YwhK+l9rq4lMxvA0z3fz+5WdiXKQvoATEai5
 8ZEQa2Ke+dViLnQdKP4cXf8F/0/HhlchCepNmLv5mayXbeKVbIlRywKqyx+3efhXE/0c
 e/aJ5QD4EkQEGrZkz88tup6h7bvR2p1Zhk/ph7EC+sAqi5lJ+J2iBorij7XHnXyRuLtI
 376SdMPJ/LJ+Gx/CF4yH0Wc0WC1/kHeFDH22aUng/CEV1jWbo2ECfiY7iCWi8urxdwPQ
 PkHFCCxXYYvrPzgiyPON5wu+qHKuvBKcySlp4xo6s830XQlzaLffv+PLblbMxMyq8S1Z
 sduA==
X-Gm-Message-State: APjAAAWbXlJfN20v/piYBkUTlD8S4R/TpDb3idmUEOdqbP5j7pbIefm8
 0YSNbETHyPP0IIZ4cijYpZ3PVNClweN2Bg==
X-Google-Smtp-Source: APXvYqywaG4WX0pSxF4HCeSSMFbKbY3wDRtmsG50dx44TU1Ypx6sq4Pk+CTzkgbiq0kZiYkp7z8Gbw==
X-Received: by 2002:a63:1101:: with SMTP id g1mr18531573pgl.435.1575903089059; 
 Mon, 09 Dec 2019 06:51:29 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id k16sm29143119pfh.97.2019.12.09.06.51.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 06:51:28 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 0/4] drm: bridge: anx7688 and an optional feature
Date: Mon,  9 Dec 2019 22:50:12 +0800
Message-Id: <20191209145016.227784-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 10 Dec 2019 08:40:04 +0000
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
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Archit Taneja <architt@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Resend to cc more reviewers]

This series is to add anx7688 bridge driver. It is extended from
previous work[1].

The first 2 patches are same as previous version, with some modification
due to drm core function changes and use regmap abstraction.

We add an optional feature bypass-gpios so that driver can decide if it serves
as simple pass-thru by reading GPIO values, which is controlled by
hardware.

[1] https://lore.kernel.org/lkml/1467013727-11482-1-git-send-email-drinkcat@chromium.org/

Hsin-Yi Wang (2):
  dt-bindings: drm/bridge: analogix-anx78xx: support bypass GPIO
  drm: bridge: anx7688: Support bypass GPIO feature

Nicolas Boichat (2):
  dt-bindings: drm/bridge: analogix-anx7688: Add ANX7688 transmitter
    binding
  drm: bridge: anx7688: Add anx7688 bridge driver support.

 .../bindings/display/bridge/anx7688.txt       |  70 +++++
 drivers/gpu/drm/bridge/Kconfig                |   9 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/analogix-anx7688.c     | 260 ++++++++++++++++++
 4 files changed, 340 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/anx7688.txt
 create mode 100644 drivers/gpu/drm/bridge/analogix-anx7688.c

-- 
2.24.0.393.g34dc348eaf-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
