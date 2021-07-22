Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A123D272C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 18:00:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722FA6EA68;
	Thu, 22 Jul 2021 16:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92706EC42
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 14:05:49 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id b29so7451890ljf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 07:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I2yvd7CInVO2nkOTfuFibl5KCx2wDyhIqtzEA3PsnKs=;
 b=iGv9cBbqaurk6QU1wp3PVLgyY0KNSOovMBvrZq6jnnLKkNTjdkt4smesD6pNc5fBo3
 nt8vqGgNRJ72qlI2xbLjY2u+r63hEG/Crs9n+jQBebrSwDHvRl4Tlp6olb2vMSsr5aLE
 47+EWwBbwBGUrGW0nB2KI0Mctk+Hpnjrz7pH4oyFidatq2/VV5LNfwmSvUc2HL/ARhoi
 4cEu2I3yein+jYwXJRdrcxLM+TpFuEbaofT49WhectMycdy6ZKwcgI2+lVUfhPg9Obji
 b13myBnPFk8YUoSR1TxQ2NIOPFmV8o9jknvK2fJfssxmywDjrc88784MKEL/f04he8ks
 i3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I2yvd7CInVO2nkOTfuFibl5KCx2wDyhIqtzEA3PsnKs=;
 b=cYsQcQ+h++qPY5enVWZBTTobZVg6SH7SpzDfnxHv5Odom04R7CIVR4EipvrBrVvVPC
 JIrrDaR2MxpRXAcLqIMSl3KudZV0yT0kSCob7qmuOPJITzIVW3JrmhfMtAl+YhkNmEd2
 3yUkGTAKYl2S9O4nv9G45hPwu19zD9KEg3gBb2l7B1FAYLPKh6kf4sjq9IzULHcz2bpM
 YBgExEEclYkksMqK5r6X9donJpWJDlLQstE9CoWYFRXuNPKC+YiX6NuJJzdkSPSqhLT6
 a9crUhsOW+apPbQt8P4HNya6+aIne4M9lD5yC25yBDGKTaYsd7Y651fCG/svWXrfBImV
 D85g==
X-Gm-Message-State: AOAM533U5h/CjDArLneTNx/9g4vLsXfoZEisW18cVN2SmEvwa8ms9OD2
 S7RJuAY1uqSeO25Dg0dtmYw=
X-Google-Smtp-Source: ABdhPJy2pWZsvjXrjqMiSXpK+xu2P95G6VMKEhFtj21OR8/GzxKnwAtKWHBOZ4sv3SYhQBYUUK0EBA==
X-Received: by 2002:a2e:a44a:: with SMTP id v10mr94179ljn.497.1626962748142;
 Thu, 22 Jul 2021 07:05:48 -0700 (PDT)
Received: from akaWolf-PC.. ([194.79.5.201])
 by smtp.gmail.com with ESMTPSA id p8sm190584lfu.163.2021.07.22.07.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 07:05:47 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: 
Subject: [PATCH 0/3] add Gopher 2b LCD panel
Date: Thu, 22 Jul 2021 17:04:29 +0300
Message-Id: <20210722140432.1426173-1-akawolf0@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Jul 2021 16:00:25 +0000
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
 dri-devel@lists.freedesktop.org, paul@crapouillou.net, robh+dt@kernel.org,
 thierry.reding@gmail.com, akawolf0@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Gopher 2b LCD panel is used in Gopher 2b handhelds.
It's simple panel with NewVision NV3047 driver,
but SPI lines are not connected.
It has no specific name, since it's unique to that handhelds.
lot name at AliExpress: 4.3 inch 40PIN TFT LCD Screen COG
NV3047 Drive IC 480(RGB)*272 No Touch 24Bit RGB Interface

Artjom Vejsel (3):
  dt-bindings: Add QiShenglong vendor prefix
  dt-bindings: Add DT bindings for QiShenglong Gopher 2b panel
  drm/panel-simple: add Gopher 2b LCD panel

 .../bindings/display/panel/panel-simple.yaml  |  2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/gpu/drm/panel/panel-simple.c          | 44 +++++++++++++++++++
 3 files changed, 48 insertions(+)

--
2.32.0
