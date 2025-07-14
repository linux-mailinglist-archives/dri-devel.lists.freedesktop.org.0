Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEE6B037F0
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 09:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2255A10E40E;
	Mon, 14 Jul 2025 07:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="FONcMrMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw
 (hc210-202-87-179.vdslpro.static.apol.com.tw [210.202.87.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DA910E1E6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 03:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=+xKvYziZy9Gvntr50dLc06twjRMEnl6NNaXi41ccQvM=;
 b=FONcMrMMeEocmjGflfvKNWXcbIvgkCGNGMLW4VTv2PVAnRS0s6aIj1iB
 Ne9832qQGTNG2gZp/cunMqXwqEMED2/oMA8noSIg6owtT6xpwDAXR6sfA
 Q/qK24v3NnSYUfOLSLEq2gUA+4MeXNmUBUx3IIMAoVU2VGOYzSi6klJeP
 ZisuY4ZzVfbFFg24HGdmfuM8dJgQ4NP6MV+J2d9OzDLRKnSD+8jZTvSIH
 0PdiY6nfOKRsKKmhvxiJvQ4fTrsbRMYEoD8UUaIzpMA04P99+g3NLd23H
 +OLlOKrUNRyw/lZZa1L6PvuwqT/tzCEMgR7m5hwCCtLJ5U78XEZWzn0+X A==;
X-CSE-ConnectionGUID: o8EzQnz0Smqvo5vWA+sUsQ==
X-CSE-MsgGUID: 5SExJrQvQ0uZ9tNK+eq2ig==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 14 Jul 2025 11:15:24 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 56E3FIb7091142;
 Mon, 14 Jul 2025 11:15:18 +0800 (+08)
 (envelope-from Pet.Weng@ite.com.tw)
Received: from [127.0.1.1] (192.168.72.15) by CSBMAIL1.internal.ite.com.tw
 (192.168.65.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 11:15:17 +0800
From: Pet Weng <pet.weng@ite.com.tw>
Date: Mon, 14 Jul 2025 11:14:34 +0800
Subject: [PATCH 3/3] MAINTAINERS: Add entry for ITE IT61620 MIPI to HDMI
 bridge driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250714-it61620-0714-v1-3-3761164d0b98@ite.com.tw>
References: <20250714-it61620-0714-v1-0-3761164d0b98@ite.com.tw>
In-Reply-To: <20250714-it61620-0714-v1-0-3761164d0b98@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752462909; l=1089;
 i=pet.weng@ite.com.tw; s=20250702; h=from:subject:message-id;
 bh=+IFvH11m36wvX0dCALImUQ3my/Mqt5qCzewvfCRgKGM=;
 b=kLIzaRsXKxETsQFi2MKlQgl341RfCbkH1jTZyI2G128bOqSoeRi91F4hAl1MpUnIDRFbcsxG7
 IN6NI7ijy/8AXxC13P9Pq9PEv8RfsEKk8v5b7VV8ofxRvkKy08JIBzu
X-Developer-Key: i=pet.weng@ite.com.tw; a=ed25519;
 pk=wd08uBtTLb93x2ixbKVNsxiZPdMh1Ov4z5klodh2bqo=
X-Originating-IP: [192.168.72.15]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: AB5C484DFF45214EE4E133440795F671808876017C9EE7F203A2F1E899FFF2072002:8
X-MAIL: mse.ite.com.tw 56E3FIb7091142
X-Mailman-Approved-At: Mon, 14 Jul 2025 07:28:12 +0000
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
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ee2ef9d9db2ab3a2b462aaa1a7a473018c70596d..3a7167ac8a840321d2c5b0f230e3e29f72ced0b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12916,6 +12916,14 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/bridge/ite,it6263.yaml
 F:	drivers/gpu/drm/bridge/ite-it6263.c
 
+ITE IT61620 MIPI DSI TO HDMI BRIDGE DRIVER
+M:	Pet Weng <pet.weng@ite.com.tw>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/bridge/ite,it61620.yaml
+F:	drivers/gpu/drm/bridge/ite-it61620.c
+
 ITE IT66121 HDMI BRIDGE DRIVER
 M:	Phong LE <ple@baylibre.com>
 M:	Neil Armstrong <neil.armstrong@linaro.org>

-- 
2.34.1

