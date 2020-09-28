Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDB227BDD0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 09:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA4489BFB;
	Tue, 29 Sep 2020 07:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313126E14F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 17:31:08 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id h17so1749752otr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 10:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FJGv07+JHeVcrfJOxkfeh9QoG+u0r3z2uEbgMDvlPAw=;
 b=HpTYidOcB3OjyjUs+CaeziYjrSUWMeP+7/0xx30dJwc8znJPBHRWxz28ZgF4nPOwNb
 XNQFPWgzItCWPW4buKXRrR0ZsVKOe9hgYpwFsw7BHsVnV+4ETabpCpuaY1n7SyDtcP6P
 7pQ9v80l39rwf0dfHWugNwALy4hB1bXhUpPgryBLVoCFyl774I+g9DFQsCqdzn9cAqZV
 BnrOkydZy3dMYnM7XxSykpr1kNUKoEozhqUiooEvuioU9CcgrVN0QemB+hYfXcQhf12M
 bKTftbMqx63toGDh4s53pxxFUC1YI2Z7af6jItOFTka+lDCja6n8Ob5Qvm/W8Qdx19hW
 iwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FJGv07+JHeVcrfJOxkfeh9QoG+u0r3z2uEbgMDvlPAw=;
 b=r2CcGGCxwdeIiegZnGcPNR2XTKpUBb+9kppeBFF8RhFofjCA08qvfuhdNFImXdPgHw
 plpGcD0AYprVq2hZBOMeghTFk/QTTjnj3oaaAm3PMB1CdBjFsj5zCnu//B3MfooDKd1N
 UdZZ49R0LcxUsWY7C47AwneXQ5FVUTBYO397iTcU/5xAPKtBGHjPhy0XJr8KVkJK9q+P
 bhaGWasu+3lit5tpwb7DMA5vP7Vup0CDkyggsz7tqQxnCixn41jdFVdWZL9dEPsdTyWL
 OADKRL0JK3Ln7xF5XJOawR+Fmn5y2GKiMqnBkUf9Aw3N1vf/XRs+Z1voj5kNIz+0LIPA
 O07w==
X-Gm-Message-State: AOAM530MMm7kOQo0cmOOHEjisf9qpCKeSjmo3q2DGr4+APul6dVMZGwy
 GCG9DKCm0KPHH7D4adrdl7E=
X-Google-Smtp-Source: ABdhPJyCpkUkNmAh2IUG4xY92+ML/ksOW0Nga82x371b0KsM9Uu2/e8u27f3BY9YCjkoKr6TTueb2A==
X-Received: by 2002:a9d:674f:: with SMTP id w15mr32816otm.213.1601314267528;
 Mon, 28 Sep 2020 10:31:07 -0700 (PDT)
Received: from nuclearis2-1.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id g23sm2348484ooh.45.2020.09.28.10.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 10:31:07 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] dt-bindings: display: sii902x: Add supply bindings
Date: Mon, 28 Sep 2020 12:30:54 -0500
Message-Id: <20200928173056.1674274-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200928173056.1674274-1-mr.nuke.me@gmail.com>
References: <20200924200507.1175888-1-mr.nuke.me@gmail.com>
 <20200928173056.1674274-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 29 Sep 2020 07:12:58 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Mark Brown <broonie@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 open list <linux-kernel@vger.kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The sii902x chip family requires IO and core voltages to reach the
correct voltage before chip initialization. Add binding for describing
the two supplies.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
Changes since v1:
  * Nothing. version incremented to stay in sync with sii902x regulator patch
  
 Documentation/devicetree/bindings/display/bridge/sii902x.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/sii902x.txt b/Documentation/devicetree/bindings/display/bridge/sii902x.txt
index 0d1db3f9da84..02c21b584741 100644
--- a/Documentation/devicetree/bindings/display/bridge/sii902x.txt
+++ b/Documentation/devicetree/bindings/display/bridge/sii902x.txt
@@ -8,6 +8,8 @@ Optional properties:
 	- interrupts: describe the interrupt line used to inform the host
 	  about hotplug events.
 	- reset-gpios: OF device-tree gpio specification for RST_N pin.
+	- iovcc-supply: I/O Supply Voltage (1.8V or 3.3V)
+	- cvcc12-supply: Digital Core Supply Voltage (1.2V)
 
 	HDMI audio properties:
 	- #sound-dai-cells: <0> or <1>. <0> if only i2s or spdif pin
@@ -54,6 +56,8 @@ Example:
 		compatible = "sil,sii9022";
 		reg = <0x39>;
 		reset-gpios = <&pioA 1 0>;
+		iovcc-supply = <&v3v3_hdmi>;
+		cvcc12-supply = <&v1v2_hdmi>;
 
 		#sound-dai-cells = <0>;
 		sil,i2s-data-lanes = < 0 1 2 >;
-- 
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
