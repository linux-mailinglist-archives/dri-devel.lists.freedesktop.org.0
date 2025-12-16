Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D69CC0A90
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 03:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AD910E406;
	Tue, 16 Dec 2025 02:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="owQKTIFS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Tue, 16 Dec 2025 02:59:30 UTC
Received: from ironport.ite.com.tw
 (hc210-202-87-179.vdslpro.static.apol.com.tw [210.202.87.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2950710E406
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 02:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=TyIsVcwkcIFBSuyGAEWQRlk2lyFi7KjeX0BLprRa5Bc=;
 b=owQKTIFSR8iNjj8dU1KQdiIec4WDGld5yrROqv5cQ+BPOzI4KMVRZ7YK
 vHlVFlik2MdW85m7chqGW3SwNDgNIuZWVeK2e7GwyY6lvxXldrsFrJgvk
 /XbvhMjgS4RbhvOJAzNxS/Jyq1Ybdgnm4xX0gaW00Lv14OPFwZM+jI687
 IDCkKKGPun001twnIw/hOHl8Y/ptjJGQdjDeBp+toH7gMS5X3m6w493fP
 OXtZnsV1dr2k9wHgGq5e3o96tcemVGDH4m42tiht3YfIBHDS2nnSDpw1z
 H7c+OGgXQQNnBNx0JeA738Ibq4vWgEKTWNtpUCBwUHZA2lcZSMOa7907T A==;
X-CSE-ConnectionGUID: n7OWDQ6PQ2i4sWSpZRU8nQ==
X-CSE-MsgGUID: yLCPddCSTW+5Wh0uRHZmzg==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 16 Dec 2025 10:52:21 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 5BG2qCur088350;
 Tue, 16 Dec 2025 10:52:12 +0800 (+08)
 (envelope-from Pet.Weng@ite.com.tw)
Received: from [127.0.1.1] (192.168.72.40) by CSBMAIL1.internal.ite.com.tw
 (192.168.65.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 16 Dec
 2025 10:52:09 +0800
From: Pet Weng <pet.weng@ite.com.tw>
Date: Tue, 16 Dec 2025 10:51:51 +0800
Subject: [PATCH v4 3/3] MAINTAINERS: Add entry for ITE IT61620 MIPI to HDMI
 bridge driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251216-it61620-0714-v4-3-9d2fea7847ae@ite.com.tw>
References: <20251216-it61620-0714-v4-0-9d2fea7847ae@ite.com.tw>
In-Reply-To: <20251216-it61620-0714-v4-0-9d2fea7847ae@ite.com.tw>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Hermes Wu <hermes.Wu@ite.com.tw>, Kenneth
 Hung <kenneth.Hung@ite.com.tw>, Pet Weng <pet.weng@ite.com.tw>, Pin-yen Lin
 <treapking@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765853533; l=1028;
 i=pet.weng@ite.com.tw; s=20250702; h=from:subject:message-id;
 bh=6CBzwqaiiwA5jdq21rdA2+OaEod9uILSwQU1/16ghgg=;
 b=DXe7hKA7VxYFFNZqNfV1/9AbCco1LGQ8fQ0WO1Vg4jFLxqSYMmm2wiOiGtpV7ysDKZGAtFDzc
 XczxdSuAYFsAzr9Kz5yNUXY+kAEAI1xhW3O/o9Jjk2PQlrKDooRUCWv
X-Developer-Key: i=pet.weng@ite.com.tw; a=ed25519;
 pk=wd08uBtTLb93x2ixbKVNsxiZPdMh1Ov4z5klodh2bqo=
X-Originating-IP: [192.168.72.40]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: 3DFDA0FE772A1F9B5D8E8D34B7480AE7D249644E2943FE39641A68C7E56A00182002:8
X-MAIL: mse.ite.com.tw 5BG2qCur088350
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

Add a new entry for the ITE IT61620 MIPI to HDMI bridge driver to the
MAINTAINERS file, include the responsible maintainer, mailing list, and
file patterns.

Signed-off-by: Pet Weng <pet.weng@ite.com.tw>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f980623f1479bb36d2c923597dc17e0ef8df32e0..1ca89de60c96110f270e635a68f2f42b985a0d2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13484,6 +13484,13 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
 F:	drivers/gpu/drm/bridge/ite-it6263.c
 
+ITE IT61620 MIPI DSI TO HDMI BRIDGE DRIVER
+M:	Pet Weng <pet.weng@ite.com.tw>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml
+F:	drivers/gpu/drm/bridge/ite-it61620.c
+
 ITE IT66121 HDMI BRIDGE DRIVER
 M:	Phong LE <ple@baylibre.com>
 M:	Neil Armstrong <neil.armstrong@linaro.org>

-- 
2.34.1

