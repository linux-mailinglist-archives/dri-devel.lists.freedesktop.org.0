Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 177E52D5E64
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:48:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51F36EA96;
	Thu, 10 Dec 2020 14:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AF56E89E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 13:47:09 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 936D6EC2;
 Thu, 10 Dec 2020 08:47:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 10 Dec 2020 08:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=SPgf1wB/xw4Mk
 wQeco+JJrimkNY1S+AA9QXTDWr3NYU=; b=Vr+cxwk4GU9qz5Hwjg5+H7js7ZpnG
 QcxQdpyzQnv7kPybp8rIdCVDFv3r4JSOfmKrNM0kDK6hLV+Vjc0/qdgEJvUybOsV
 Pjagw34YWo4rix2c+6sFtEZwRHwtuxqW7yJB7GjjzvVIU/FQO16zmfFyeh6ysuay
 gb1cCO1Z2onlFNu43mElZCLaYEtIRlNBQ/5uX+DnKFcpo7nJ7AgAgRb2FSPy5I4M
 8ayS7oP4qYPkXTc5B4eZ4PZiNMF/ISh6qG66uoNSX4uXm7zba6bk7mC4cjQqq8Zf
 b+jz9vvgIQobetFKQGXRgPkdUnBHs2RPsNdo5yEMr0tg+97FXOIM27UJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=SPgf1wB/xw4MkwQeco+JJrimkNY1S+AA9QXTDWr3NYU=; b=QDtDMaHb
 ngds5FELYivTTnNubg1egHZjEmCCkA6RqGAe9PTnRZE4wardt+/ohMjwwWWkyuc0
 KzY4zwCfNCAR5sCVkB+xPMGZkjB6Re30Rzujt2N3c7VLPFWlC+yaonrcwi5kZ4yD
 sKZ2gNoA2Q0Y7d5GSRNOIlDiEuXjbLtTQ3Cii0yeIi46a7Bd+yZGR82i62QkVvbU
 62vV8OVsX9N6SZWfTZEK3+RPSLQnLf29BFZZqfqmTpWBSdSEvUXPy7D8cTgdmiGy
 o4vms68TWI5ciDQXLrQtfbu4H39pJwOhCk1oztVKjwnsOB1MTvgrtFDIKvajY2YY
 uMLE4joIJOmlFw==
X-ME-Sender: <xms:3CbSX4EI-qiUgahO5hFoCbNgc6h5SDzRv14i1ZNVbwZbGdl5Mxev5Q>
 <xme:3CbSX4HVyM1GDkDLOMj3HWbsP7GC7_7CaNjqPdHj_jzccbqxVBXh1r7DAuKpDGyAY
 eRbzIdJfDhP8KlI2lE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3CbSXz6u9PHO3OmJUZL04D_0MGRTZU_WEk7a46x0RkI6tjCBK55MVw>
 <xmx:3CbSX1y5_8U5y180D3lSj-ZQ7KThMoF3ywvhFEDiRbETu_Q1lW_OIw>
 <xmx:3CbSX6NJx8RxsbkAl2ZDRww-xluhKhuL-AORM_XFrxTlXCX7ugYQuw>
 <xmx:3CbSX_Qav9lnlrBQQ5Rr2S_MDCrBLauB9Z9WJA3c5VW-IwqCabi4QIgkQg4>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CF73C108005C;
 Thu, 10 Dec 2020 08:47:07 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 13/15] dt-binding: display: bcm2711-hdmi: Add CEC and hotplug
 interrupts
Date: Thu, 10 Dec 2020 14:46:46 +0100
Message-Id: <20201210134648.272857-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201210134648.272857-1-maxime@cerno.tech>
References: <20201210134648.272857-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 10 Dec 2020 14:48:10 +0000
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
Cc: Jason Cooper <jason@lakedaemon.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The CEC and hotplug interrupts were missing when that binding was
introduced, let's add them in now that we've figured out how it works.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/display/brcm,bcm2711-hdmi.yaml   | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index 7ce06f9f9f8e..6e8ac910bdd8 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
@@ -53,6 +53,24 @@ properties:
       - const: audio
       - const: cec
 
+  interrupts:
+    items:
+      - description: CEC TX interrupt
+      - description: CEC RX interrupt
+      - description: CEC stuck at low interrupt
+      - description: Wake-up interrupt
+      - description: Hotplug connected interrupt
+      - description: Hotplug removed interrupt
+
+  interrupt-names:
+    items:
+      - const: cec-tx
+      - const: cec-rx
+      - const: cec-low
+      - const: wakeup
+      - const: hpd-connected
+      - const: hpd-removed
+
   ddc:
     allOf:
       - $ref: /schemas/types.yaml#/definitions/phandle
@@ -90,7 +108,7 @@ required:
   - resets
   - ddc
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
