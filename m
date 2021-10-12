Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43189429E29
	for <lists+dri-devel@lfdr.de>; Tue, 12 Oct 2021 08:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17FA6E58A;
	Tue, 12 Oct 2021 06:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166D589F49
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Oct 2021 06:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634021344; x=1665557344;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LEsOShHi53FwhvjjCf5twbUdvETtYuAw3EERG3UwX5A=;
 b=WzOVgRZm9vgQgYHLFG7BNL22Xus668vdoePwOWiXI//m8YBm5KP2hNse
 4yLHaKce0C3MVakSXlMqr2Czm09PUnkSAUEypu6OlBPYhpw0AZB1XAFpq
 Z5lxQFp5m7qmVsTIfIRADMwPrxooZqdg7WcGxum0LRpWQbvLj9BB8gEtS
 bJ1iQoZpBLAUP+8AI8szjUyyu2CwLNCaab/ZE168zAuucqnYcYnxhtI50
 /D7T5519r+MjUGKastvknTUS+e/yb9weDhcyC2PfMDZ9K7X3qRZ2cB4iR
 OVuZ1dF5LQPwHqGEgL70MqveZ+Xit9Pj2wDhOcvy0/My5/Qu6L+49KOy/ Q==;
X-IronPort-AV: E=Sophos;i="5.85,366,1624312800"; d="scan'208";a="19985092"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 12 Oct 2021 08:49:01 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Tue, 12 Oct 2021 08:49:01 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Tue, 12 Oct 2021 08:49:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1634021341; x=1665557341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LEsOShHi53FwhvjjCf5twbUdvETtYuAw3EERG3UwX5A=;
 b=pwImc4xHEbbwZcptvNYao78PgJDfIJF6zGwX5gm+vXQkFT88dED2uJD8
 GIm0vLIH1kEB5j/su7odZmiXXsBNTEbo8jT9uJK7JbEi9VhFXyRVw31Lm
 9J5KIMTlcArciYEBbOqyG4ZcPuClgq91YYzFCjH2rdnMDffIL4aclAPjF
 7ysYqMFjSnBVCQxNIa7CUPQh2yXmMyEerX4Ocsqufa3SNLTbk4obfu/LX
 XNLmXp9pdkMrH1LFN6zPTl+5LnoelWtmr/NCeokCOtsgfHXqFiJJqttoB
 1KFqKwrNSrE4/Lr4NGZ5X63WUdYDZeoc7qBU5CaAoEAifhaqhO9PftXX9 w==;
X-IronPort-AV: E=Sophos;i="5.85,366,1624312800"; d="scan'208";a="19985091"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 12 Oct 2021 08:49:01 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 70881280075;
 Tue, 12 Oct 2021 08:49:01 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v2 1/4] dt-bindings: display: bridge: sn65dsi83: Make enable
 GPIO optional
Date: Tue, 12 Oct 2021 08:48:40 +0200
Message-Id: <20211012064843.298104-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211012064843.298104-1-alexander.stein@ew.tq-group.com>
References: <20211012064843.298104-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 12 Oct 2021 06:54:21 +0000
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The SN65DSI8x EN signal may be tied to VCC, or otherwise controlled by
means not available to the kernel. Make the GPIO optional.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/display/bridge/ti,sn65dsi83.yaml         | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
index 07b20383cbca..a5779bf17849 100644
--- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
@@ -93,7 +93,6 @@ properties:
 required:
   - compatible
   - reg
-  - enable-gpios
   - ports
 
 allOf:
-- 
2.25.1

