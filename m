Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 992543D471E
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jul 2021 12:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD926E059;
	Sat, 24 Jul 2021 10:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCBA6E059
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 10:34:12 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id h9so4789697ljq.8
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 03:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x6qKlfQqH4Pff1qY3yh2+h4mSC4bChkJmId4p4BeXQU=;
 b=O6hvyvnQIiTssakclxodabsh84VNdDn9LRuunsV2DlxcfjfrE5a0C4XDVFjIOUQ2CV
 eaB1icO6o4OMnXoQ8j8f+EQIFM2T8vf4S/f/0Sj966XKDC+fv8D315AcsWcblWaZbOwi
 ZIRKKJJePG3/B/vSvOA1q2+idYwZxjqwxo1xfa4a/LPCERHcEg3jGQdIjTg7LNiSY1D3
 a6xahXn2u6LTYwKzP3/2Luq5a69Osd1FojrSm01WqlWWxPkXrYlDYFxICAzdFkUApcUJ
 N1S0WVoHxzx38vFAWUfFoFOsuCeHzEo8B/HnyyAIBvC7UuKWr7bwZSoW5XKd04dOm9ZT
 O+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x6qKlfQqH4Pff1qY3yh2+h4mSC4bChkJmId4p4BeXQU=;
 b=ek0AXx/6qx6jEtcItgJbMBAkXqq2rHxBIJhlV6KRz7Yrv0/Zw139goFcbDxUEa/d8X
 iLJ9FrXkohVuXkdQPFZ4HrGZ/R1WLPbgZ+GgPnMp+vGTLcW9O+uUoWY/3xHcHrEmMXS8
 o9K1GKF/fPD0m92vfXfiWmgPaNd5i0VLPF/OkCpj4iWuuV35KYz/Tm5Bjest27y6AxBF
 Qy3NK/5l+Rg6jsvV+amzLFYap6qR61L2ZTIRNfBV7+FrDCYw9cc/QlpCxCOg//1bqm7E
 Bsn0bzxDRL+Sm/wPMfSsu6gXO9kns1R9kNJuHDITsxOC2D2fCR9sFEN4vPmcn4UKMoGw
 daKA==
X-Gm-Message-State: AOAM532xB8D3+4fVDn+yzOktL2nuDoSU9SFTYD93dXodSzoGBWQhb3+x
 g0LZFe1WQSL/qnuW+T6Ukio=
X-Google-Smtp-Source: ABdhPJw1DpZY1EfJig8d3cXTa8Tc9M+VIOgYNm4+S2hFK0uPqhzIBTOFv32HnDYsxMsZfB/QZql0TQ==
X-Received: by 2002:a2e:8743:: with SMTP id q3mr1517461ljj.397.1627122850546; 
 Sat, 24 Jul 2021 03:34:10 -0700 (PDT)
Received: from akaWolf-PC.. ([194.79.5.201])
 by smtp.gmail.com with ESMTPSA id v22sm2158938lfi.270.2021.07.24.03.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 03:34:10 -0700 (PDT)
From: Artjom Vejsel <akawolf0@gmail.com>
To: 
Subject: [PATCH v2 0/3] add Gopher 2b LCD panel
Date: Sat, 24 Jul 2021 13:33:55 +0300
Message-Id: <20210724103358.1632020-1-akawolf0@gmail.com>
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

In v2 removed .num_modes as noticed by Paul.

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
