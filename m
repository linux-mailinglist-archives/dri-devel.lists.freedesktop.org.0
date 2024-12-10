Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5329EB6C4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 17:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8753E10E92F;
	Tue, 10 Dec 2024 16:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="P2f+7EHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801E710E923
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 16:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733849017;
 bh=ZvD8OXAxS0yJUidLsVdKZA2YjRg0YV+PscUgOu6Lb0o=;
 h=From:To:Cc:Subject:Date:From;
 b=P2f+7EHdLGnKfNttoyErGAHVKOkcbZYdTUqhR94eUUmgoSubDuhoWi8sw+pvIHTMi
 79wczl8rZgzbO+eqoS+wMfGx+nepQ3YSlURpIFQvu3M8SmthMFrhCzjY1EgtmLFUQP
 A4Eqm309guTngUUWjbtN4jUzvDWPCOIsVWbJF3qOKRKQi8czMfmkwDkOr8DCPDdIQC
 yfQJIWhqpsk82JENzFd1MaAFcBOns1jRW+ghnExJ57jlphvqNsrz5fTc+6S9Mgcodt
 1I/3tjxZypiRLPuB8wimrjGsi0lEfiZwxOMvlmEhHZN8C3EbXbrWKFB1e+rR3wGqiW
 OhXRu9RG3tTng==
Received: from jupiter.universe (dyndsl-091-248-190-127.ewe-ip-backbone.de
 [91.248.190.127])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: sre)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0407D17E37AF;
 Tue, 10 Dec 2024 17:43:37 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
 id 68DCA48CC8A; Tue, 10 Dec 2024 17:43:36 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Andy Yan <andyshrk@163.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com
Subject: [PATCH v1 0/2] Rockchip W552793DBA-V10 panel support
Date: Tue, 10 Dec 2024 17:41:29 +0100
Message-ID: <20241210164333.121253-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi,

This has been tested in combination with the series from Heiko Stübner
enabling DSI support for the RK3588 [0] [1] on the RK3588 EVB1.

[0] https://lore.kernel.org/linux-rockchip/20241209231021.2180582-1-heiko@sntech.de/
[1] https://lore.kernel.org/linux-rockchip/20241203164934.1500616-1-heiko@sntech.de/

Thanks for having a look.

Greetings,

-- Sebastian

Sebastian Reichel (2):
  dt-bindings: display: panel: Add Raydium RM67200
  drm/panel: add Raydium RM67200 panel driver

 .../display/panel/raydium,rm67200.yaml        |  72 +++
 drivers/gpu/drm/panel/Kconfig                 |   8 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-raydium-rm67200.c | 503 ++++++++++++++++++
 4 files changed, 584 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raydium,rm67200.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-raydium-rm67200.c

-- 
2.45.2

