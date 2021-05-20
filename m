Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED8D38B280
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 17:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B986F477;
	Thu, 20 May 2021 15:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD33A6F477
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 15:04:13 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 08C091656;
 Thu, 20 May 2021 11:04:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 20 May 2021 11:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=vvhQSOUeUthBO
 4iLrRAnd7BgS689N6pLnJOyMb4iqPk=; b=vIJJ0E5+tldPjmSpOGJ2w3NIF3Ehv
 Zw0BbasNN9jxyzU0YD6xbZp1U8u91mRxoaX6uahPQg1RlcJ9JbNUrUej4939NG8K
 otD3LCwtFd1EkzYMXztulVrQoMVF7qjbjhRQWbrKId3lWhMo76kIrxV04S4HDWr3
 gR12bNbmFK6Nahc6N6c+XwrAwusk05/iKWQhYTnXtj4oOhMKHRkYMLJV87H1K4ET
 Oji891WTutZLJVgnqVIMffkRacCplKJG4JqUN4SDw9B9HQg7TMDWCcmm+9qDavMk
 gTU3Gy2JmHSh9UsWpMhta3loCZRgaVrOTByMV1rp4HaGLrZbLfLt9Ewvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=vvhQSOUeUthBO4iLrRAnd7BgS689N6pLnJOyMb4iqPk=; b=DQlz09Bf
 TR4EWvQvBHVQh081S8S57MnTEGIgP8qJsidLtXtTzRO7mqnGfPihauWeqjEzVoiv
 cwwZbtJXa2R7TNkUdbYtNFq8fnuTOvbrRQ+nApe1BAdGVM2kzjs+blIjAohhdOZY
 O8T387fxypMXR1tZxCjwwIHRWN2Hu9M8O/NzLkj9DA/zPkAYSqWwtCMxCxi6/QrC
 v1MFOQo+9YwYtfyW6PGGEtOckTpckJhnLsOZxX+pf9BNKK+Wei8wqtgAYe7K9D7N
 XdxXq6VUpHft+V/zFUs1ib25Xbg/gT80dv68L0CB35tR2VZH6t1IrRi9tlUrmeZ2
 eJDju8Np+8QmqQ==
X-ME-Sender: <xms:aXqmYKB3ZvLlWrxX7tPCG6CEgUulOi6vyH10R4xxgBk7buYI7cEfIA>
 <xme:aXqmYEjLkJR-Wt-ZWa1kfDmzUQ-t_1pvtsf9nH6Fy5av-enZ_YZ-NZIo15r0pldPF
 pwr8ZRzLvQIB3KRbDY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejuddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:aXqmYNmVCSalHFtdx8wQ7sK8paPCWwuycm-Hiy5w7SSmhNkXxjOL-A>
 <xmx:aXqmYIwvpWUEnRM8p95wnmituuGOqjE_ZnojwYB6iShs6VKaOsMj0Q>
 <xmx:aXqmYPTKYCl9Sw_CBT8CvRrAoC0acdOnd5mg_JTTTbWcxU6gz7vsSA>
 <xmx:a3qmYNEhwgVVL6K5Un4vqA7Xcra8iqfjj8HPFxc3ywb-0x4-cW_8RRNdQX8>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 11:04:09 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 4/4] ARM: boot: dts: bcm2711: Add BCM2711 VEC compatible
Date: Thu, 20 May 2021 17:03:44 +0200
Message-Id: <20210520150344.273900-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520150344.273900-1-maxime@cerno.tech>
References: <20210520150344.273900-1-maxime@cerno.tech>
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>

The BCM2711 has a slightly different VEC than the one found in the older
SoCs. Now that we support the new variant, add its compatible to the
device tree.

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/bcm2711.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 720beec54d61..0b6900815d19 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -1087,5 +1087,6 @@ &usb {
 };
 
 &vec {
+	compatible = "brcm,bcm2711-vec";
 	interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
 };
-- 
2.31.1

