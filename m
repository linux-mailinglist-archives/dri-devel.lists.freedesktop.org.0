Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C75D27812D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:09:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2C16EC06;
	Fri, 25 Sep 2020 07:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD636E48B
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 20:05:20 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id m12so146644otr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 13:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=857T7F4rzq03Unnc/Mc2XwCHG0TcRs4Qu8Df7doMZL4=;
 b=JWGsgkBsj6pfRbjE39f2NIz/OoE06+8RwtnQCOldTnlPp8jifBR80qGgqFcp71iSlV
 a03WamSCCRB1vhuc1FdooyUGpwn+Dwc6oYN72p0JRXenhsw9fpjJhmbJj7daStKcFKP8
 dH3OBN33aiMsaMIRNXEkzKtNaTIBTY1liFF8N2dXF/3CIk58Xu1ez64VLcKL6o5IsLlH
 UnS3vHA7STRc7f4E5rkTMT6o1E2+hCRzEx/3xNWqUamRk6flRaXz+U0vy3e3o3F64cfv
 a0x8wrz0udt6GZWZY9ftkfiUbrPd59d0oUfkcmEvTm5yF/MpE6kjG/5PIcO8r20OOtqz
 cP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=857T7F4rzq03Unnc/Mc2XwCHG0TcRs4Qu8Df7doMZL4=;
 b=VeIEad0vI3rygBKMDM3bSo3XNjlK19fEFEgsomQNChsju3ulLGlqKvi+z2TSra5mkH
 J+WuT4rDN8ALFR9/6u34mD523SWfeqvZeDQj1XfLUfFbDSg4QnfGYU5CoI+9S0ocj/Rd
 Gjh6BbGTAkMQq6KKTSxZg0OSMTJRjofdauPcxlhj7IJpPPmU21k9L4UwgId8TVyPOMcA
 KaylYpsr2qiGJFyas/wd8CIIVSMd+lpUBUFv4VvN/bg68JZdmZkf+iMcOqK96CW4FxHo
 6axAC16Bu7rD3Y+o9wQqbuNKN8jhiN+9B/D3IJVT2cNXYkAQwMgR1DnZ8BanaoKmfeHq
 ZzCQ==
X-Gm-Message-State: AOAM532RbTkdGUySPI8rRddRp/c3VqN4STq9f8CEZBGelxYCR5uwHrAM
 SQPpqhiP4PeD+qYOwC7Ysjzof53xal4uqg==
X-Google-Smtp-Source: ABdhPJwGiIt0ArCj3FJVqvxe8EgRJSxg1iwSynzZlTKEwkNIpSvfMMLNr/cg2LmGGPuZg1m8ZffQMA==
X-Received: by 2002:a9d:6a0e:: with SMTP id g14mr607342otn.126.1600977920048; 
 Thu, 24 Sep 2020 13:05:20 -0700 (PDT)
Received: from nuclearis2-1.lan (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126])
 by smtp.gmail.com with ESMTPSA id n13sm85590oic.14.2020.09.24.13.05.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 13:05:19 -0700 (PDT)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: display: sii902x: Add supply bindings
Date: Thu, 24 Sep 2020 15:05:06 -0500
Message-Id: <20200924200507.1175888-2-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200924200507.1175888-1-mr.nuke.me@gmail.com>
References: <20200924200507.1175888-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 25 Sep 2020 07:09:24 +0000
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
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Mark Brown <broonie@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Alexandru Gagniuc <mr.nuke.me@gmail.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
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
