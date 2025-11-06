Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25B6C3D7D2
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 22:24:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7E010E9D9;
	Thu,  6 Nov 2025 21:24:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.b="N+mbpBjY";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="o6m80hTS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a1-smtp.messagingengine.com
 (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6E2A10E9D9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 21:24:06 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 0F85314000B8;
 Thu,  6 Nov 2025 16:24:06 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Thu, 06 Nov 2025 16:24:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1762464246;
 x=1762550646; bh=2qCxCx4mvL7O/F6l6ezZJaJhcFM77/ZI3N0lNRey/ec=; b=
 N+mbpBjYFRsEm0UuUP8YwUM3n/gqbSVI4Vx6GO/1MB+wIm6Lcy5IhTyS8g9mYrKs
 h3HaL4qcV5Gw5mgs1C7yOpuwIrN84+L5Eb1hiPyH4e96jbXbLIjfLuTODMvAZ/JB
 QVCwbbE02qd/mlSPgHzS9kMJhVw5PQUdAplbyptHmLmFQOK39agXpZ1U+FvV4eqs
 z86yQ8zZFiTN2e4ynQP6VhWj60pui2/PsXpE8jkgfU8uU4Ti1e8QBt6zot/48tWz
 m4q4dNkctivMIHX6WS3So7xo1CU33EQRzsWCr1pNVDAO8M/VqhcaJv5jP+rDHU1K
 SJHUKalc6XVHsrs+tOOmuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762464246; x=
 1762550646; bh=2qCxCx4mvL7O/F6l6ezZJaJhcFM77/ZI3N0lNRey/ec=; b=o
 6m80hTSO1G/ORwRCSPiCJ6WnUZXuoCedH8y6XA2Uo1m/NX6zswXW3UjKujc5vdgV
 df0oiPgPDNqqYVxEmCDD07+CN+nhHga8mImSyayUc0iYErLyjp9VjRtn7EZA4iI0
 Bsc6wESEpcEsaGeOaCVwi7sH5WL+Z9vkSakl6fZbb0w+1shhDh2ZVmSuYyIqeoiE
 EoegcxEXt+w2bqE1eCinW6+BUFJU+RxBHAiiHl9oas8ui0E6ZP6UU7r4f0NdIPwC
 BV4aHDpCQIKjjdiss53ngWueMIrQlB/1Cc2jG4NAa0QLwmWDpci2FX3FLAtlvrah
 aTWzunb8EaBtcKBtNhnqg==
X-ME-Sender: <xms:9RENaQFYMzRn7vLlEK5XlnyxD5TTmMfs9ZTvo1dx66Y2UsggXaDOrg>
 <xme:9RENadcAzxNBHuD1t3UVnUZAO2TWUUdTciLGmNhBU7ko8RnpUjepc1gHslA1ZBJkx
 sUE_vCx2VznSLrnzPJUtkmGQdfsebYGv_EALy43E6fmzo0-VLOX65Y>
X-ME-Received: <xmr:9RENaXJEXeujiVM9oflzJbZg8X1yi4UvhTs6MOIlzyMn-Rjz0pUAmpCBbE4WG2RNDRjCZaFY8AMwrvPeOugW2SBX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeejkeehucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
 shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
 grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
 fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
 uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedujedpmhhouggvpe
 hsmhhtphhouhhtpdhrtghpthhtohepmhgrrhgvkhdrvhgrshhuthdorhgvnhgvshgrshes
 mhgrihhlsghogidrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglh
 hiuggvrhdrsggvpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdp
 rhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepfhhrrg
 hnkhdrsghinhhnshesihhmghhtvggtrdgtohhmpdhrtghpthhtohepkhhriihkodguthes
 khgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhsth
 eslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrghgnhhushdruggrmhhm
 sehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrthhtrdgtohhsthgvrhesihhmghhtvg
 gtrdgtohhm
X-ME-Proxy: <xmx:9RENacosLrqqO02nJ-dhObQn-dbVlCnU7q1e1xyJ-iOh5NDuiYlSLg>
 <xmx:9RENadVmxFqQGEpj_Rjyv6ipGw38L6OInEXIYDPRtRDpRw4f5_8y8Q>
 <xmx:9RENaX3ZHql4dpv3gKIgmubnsSu3GZO_zuOtvhGCMYkkeH8xGxpE5Q>
 <xmx:9RENae2D7Tt1DVXsfKXxEUSuQTNsgDOUZlSppVxRMJsQ9WJU5JFzLg>
 <xmx:9hENaSbmNKkqppbwiATQYPCZovbhlKUDAWWvtybIwQuXH88xRXrJOOAM>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 16:24:04 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node
Date: Thu,  6 Nov 2025 22:23:42 +0100
Message-ID: <20251106212342.2771579-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251106212342.2771579-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251106212342.2771579-1-niklas.soderlund+renesas@ragnatech.se>
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

Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
present in Renesas R-Car R8A779A0 V3U SoC.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
* Changes since v1
- Rename node gpu from gsx.
- Fix sort order (by unit address) in DTS file.
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index b08865841476..4b101a6dc49d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -2337,6 +2337,23 @@ gic: interrupt-controller@f1000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a779a0-gpu",
+				     "img,img-ge7800",
+				     "img,img-rogue";
+			reg = <0 0xfd000000 0 0x40000>;
+			interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A779A0_CLK_ZG>,
+				 <&cpg CPG_CORE R8A779A0_CLK_S3D1>,
+				 <&cpg CPG_MOD 0>;
+			clock-names = "core", "mem", "sys";
+			power-domains = <&sysc R8A779A0_PD_3DG_A>,
+					<&sysc R8A779A0_PD_3DG_B>;
+			power-domain-names = "a", "b";
+			resets = <&cpg 0>;
+			status = "disabled";
+		};
+
 		fcpvd0: fcp@fea10000 {
 			compatible = "renesas,fcpv";
 			reg = <0 0xfea10000 0 0x200>;
-- 
2.51.1

