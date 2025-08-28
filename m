Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E47B3944E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 08:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633C810E194;
	Thu, 28 Aug 2025 06:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="Hd44Ke+3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F283210E930
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 04:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=5i32xVWzp1ZgAbyeSFx2eN0Rw5Nb3gh7i2Zbl7txSXs=;
 b=Hd44Ke+3nje0Kq5uOVJhlEKXJ+tfwTt1TQRfHoXC+jwWJfWVytl+JHjx
 EWnSkvTA7CDyO3H1868IcGBlZdd4suQCYmzOhs//mXcmXvOkSXNN9u/u5
 KjeI1Zcwq+MYecFcU+SZ6cQCkRZ24qFlBNLlyvMtrNa2JRCHtF5Tktsuj
 7W8Mf46aLEZOkDy/HMVZ8cOT0Qbr2O+9d6jnkVGBvkHL+NS5NG3SWn9K4
 uxmdcT2ZMI9xpKZ0Y4Q+r4xfraWUwzfk9rpzP4BY7kgTnMfj0Ks/70Oha
 UVv7n8GdYJIx6dATJU2PUmAVcmrLfjEmLV6WWC9+iL8IrIKcljsckk8Ew Q==;
X-CSE-ConnectionGUID: GyMaAGshRJWnVk2KcR3shw==
X-CSE-MsgGUID: 13321c+KSSGPEaBr3haUMw==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 28 Aug 2025 12:02:15 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 57S429PX028070;
 Thu, 28 Aug 2025 12:02:09 +0800 (+08)
 (envelope-from Pet.Weng@ite.com.tw)
Received: from [127.0.1.1] (192.168.72.40) by CSBMAIL1.internal.ite.com.tw
 (192.168.65.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 28 Aug
 2025 12:02:08 +0800
From: Pet Weng <pet.weng@ite.com.tw>
Date: Thu, 28 Aug 2025 12:01:20 +0800
Subject: [PATCH v2 3/3] MAINTAINERS: Add entry for ITE IT61620 MIPI to HDMI
 bridge driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250828-it61620-0714-v2-3-586f5934d5f8@ite.com.tw>
References: <20250828-it61620-0714-v2-0-586f5934d5f8@ite.com.tw>
In-Reply-To: <20250828-it61620-0714-v2-0-586f5934d5f8@ite.com.tw>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756353731; l=1089;
 i=pet.weng@ite.com.tw; s=20250702; h=from:subject:message-id;
 bh=OB4EAjXKghqmmJsht+EMIjwxC9vVhtVzs0OtpNzbruI=;
 b=EOii9uEGakuF9g9P3b0vqIAS3c/C8LTpUjtNyPWI7qczi6B2/VbCQGvOpmeJP8ZL4+bGqRpI5
 Tt4bf95rD3bBaxWfJFLSJEXm8ygWljyR2lk373LtSB21SclrUJQF5v4
X-Developer-Key: i=pet.weng@ite.com.tw; a=ed25519;
 pk=wd08uBtTLb93x2ixbKVNsxiZPdMh1Ov4z5klodh2bqo=
X-Originating-IP: [192.168.72.40]
X-ClientProxiedBy: CSBMAIL1.internal.ite.com.tw (192.168.65.58) To
 CSBMAIL1.internal.ite.com.tw (192.168.65.58)
X-TM-SNTS-SMTP: 3E2A61BA08F6FA45881083E07CB89951BBD95433E7A70B275EE3B9DAE98C751C2002:8
X-MAIL: mse.ite.com.tw 57S429PX028070
X-Mailman-Approved-At: Thu, 28 Aug 2025 06:55:09 +0000
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
index cfa28b3470ab6d2f7cbe8161c3f415853a7ce9bf..5e9aaa76b788c790fc487bba1062a987c538ff67 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13074,6 +13074,14 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
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

