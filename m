Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BECB82F2979
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 08:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD016E0FD;
	Tue, 12 Jan 2021 07:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793996E0F5
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 14:23:30 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id E502658067C;
 Mon, 11 Jan 2021 09:23:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 11 Jan 2021 09:23:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=sD1J7+67gErBk
 SmVm9UXagXXqbIx1wiBLhuI15KcyZ0=; b=NhtB86lW/YmRjAdP2EpTh6lUAfxEu
 5MIo/v7MwU5P4VwIiJ8XELVDfrVFyhWBvkFqZab3QGOZCq4PyXZ3TFyrt80MCYVN
 gTVhhr+p6cgMesqwxE+VSRv/t0pOmqrPEUJBlQiICtaA0Nk0dhFr9AA+vZA+g7FT
 C7hr5x464N+ZToDkVp24E+XUjPWqB0mGhiEgj/PTzGw9H9axI/6mmUauS7hesJYB
 x/ztQkNrWQBTztgqL7rmp7EdE/J2NxCIz1CfKi3JQo76jhhxVdx8EN+jK0HIR3o5
 gDqN2J8QRqOavgHbWtFfCWFzbJBPAf13sghJqwxi79q2DHT9rntCxQ86g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=sD1J7+67gErBkSmVm9UXagXXqbIx1wiBLhuI15KcyZ0=; b=G16QrQt9
 9J3GNDpGDRy05rHUJlCoURuqkODxcYTQnb/esAwGvyvwj3hsjifBzgbDkzK05IED
 XTEb4qy2VOkWKUL9aKAhxO6VAFUyLOV/XJEx32WphBekLPjZK7sXDWJ7FFhdOgxi
 ySDmaHX0U/xD0eBf3He+qVaS63xHLZwlWSojt4cRGR+R7/ikwqOan+Nh/vE5TdkY
 p5VOHtSWdhr7GVgWBrGm2QdWT25RG/gsXUPmQRc/zfucrEX9b9qNhys419Q8B2i3
 PU6hKxoXTywaFvsJ/VqjXg/NkS4pbxfSiCmTslQYz74aOul9J7QEbsb0i+uWGsiM
 ymeSV+61P5N37A==
X-ME-Sender: <xms:YV_8X-H3qDFthHz-PFrNQzE16zPohC0Sy48-wlFch9MoDHPC96h_hQ>
 <xme:YV_8X-zUeLC9l6p5CTBKsUYe0YcSvQ9a1swAb0HYy1fyF_zukmt-BUCzAuK8ROGf4
 EdxfgApUZykvfSvqBU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehuddgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepvdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YV_8X5O1eTj5pJv_qa7nbv1weG3tpSZ6C511HqcS9hAq5o0NTJPMRA>
 <xmx:YV_8X8bUInYHvRJ3jHkkLuSkI_W2lZbXOsQZPyTev_7P5O2f8qHSzw>
 <xmx:YV_8X4DsadNQ6n7LyGPk721eq0Necyagv7_egh0GBti3WWPMljznew>
 <xmx:YV_8Xwc_4U_Q_axMESkEKc_frdU7D1SA2FYiyShf-tA5oXPYCFkJNQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 90082240062;
 Mon, 11 Jan 2021 09:23:29 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 13/15] dt-binding: display: bcm2711-hdmi: Add CEC and
 hotplug interrupts
Date: Mon, 11 Jan 2021 15:23:07 +0100
Message-Id: <20210111142309.193441-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210111142309.193441-1-maxime@cerno.tech>
References: <20210111142309.193441-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 12 Jan 2021 07:57:10 +0000
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
