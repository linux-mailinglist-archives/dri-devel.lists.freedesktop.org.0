Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2292CE9BA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7F956E156;
	Fri,  4 Dec 2020 08:33:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18FD16EB71
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 13:25:57 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7FA4158040B;
 Thu,  3 Dec 2020 08:25:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 03 Dec 2020 08:25:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=I6doUmppOEVK6
 GAo4bovCF6NmoONvlNHwLcCk0roEso=; b=ccCNnITwc+zpen1BaqU8j+Iu+hTKc
 wDbmndcTfoRyc7Dm2oIzH3IQwYRUsqMBzDjzdboLCD+rc+PmMbJsE7SJS7osjlTz
 GrdQh1nzkKP+n24ZwWhkwWgepbDDztvO9Bsdx8ICFubkEHhvI/fs/oS0N5AA8AZg
 w4xdKXfHxesBC66aH4xmb7MGYn0bwLE//ouDik9bgdSC/uAf9lQFsHksD9ZlXngx
 O2MfxigZ27BqtzSoETo4H7/o4AUfmMPoR1UT+zBwZ8+hCtAW/8ElIB1ipnGEv7Ng
 TKdpDx4AG4/OjSARnBlbu4Tb9qW0bFJGsIuMp8Ogw62JfS9sFJFL/YB+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=I6doUmppOEVK6GAo4bovCF6NmoONvlNHwLcCk0roEso=; b=gpGB0aF6
 UMsEAuWPweldTVb66Igo1D+qXFKEDcNWMDBBR0KzkXNPh7Tzb305kcKjsKlBoAxP
 rqccUdKeN7iVsUx4CIvJ6dFG0PRVjKFFF9fnDZlND16rCxtqG7+vJ88AGnhNovrU
 tDe17JGtUGBLm34UOu6ozpY4ApD/YHNBTRdqxyFCzBKbLjDRRoLOvapPsd9jmKMf
 1lctzvt+M+neG43LSz5bhSbUwJxXfszlPjCvjCJ7ZSQ52gyxwuxXQkUYT+1FkLLe
 hKhc4I1+ihJ7PQropv54BTaa9qfCzY5HT2dqy4nm2xWRWmfIpb14uvPDn9kAfhdI
 mbRgEjFTlCguLg==
X-ME-Sender: <xms:ZOfIX4cl9Y_5eHUVScmPgKwx4i_ijlImXj8huB2mSwKYGN2jFmEAjg>
 <xme:ZOfIX71LVUtFkkRfQEHobGoE552oa_kQSL8B_5wOB7-i8ltNiyQ1ww4UVFr3zE7vM
 3hIxe5114Aq6DbOPM8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeiiedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ZOfIX9nyWtT91vtwHeW7xIfe5bMxa4uenyyDb995TW-OfEfBnK0fsA>
 <xmx:ZOfIX0YDBvW74J5rVlZQcTzr9EJgBLqR41TbMYYUWzHQWZTmreH6-w>
 <xmx:ZOfIXzrlAkE8Sjc9DkzsuOxnYSlGqMCiIa-r7J0beLug2bpD_jpzig>
 <xmx:ZOfIX0acDGXVf3Nm_KuA8c7pwwoE5vefItYjyqaRbGdbuMdDXSKBww>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 41849240057;
 Thu,  3 Dec 2020 08:25:56 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 8/8] ARM: dts: bcm2711: Use compatible string for BCM2711 DSI1
Date: Thu,  3 Dec 2020 14:25:43 +0100
Message-Id: <20201203132543.861591-9-maxime@cerno.tech>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201203132543.861591-1-maxime@cerno.tech>
References: <20201203132543.861591-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:33 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

Updates the compatible string for DSI1 on BCM2711 to
differentiate it from BCM2835.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 arch/arm/boot/dts/bcm2711.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/bcm2711.dtsi b/arch/arm/boot/dts/bcm2711.dtsi
index 4847dd305317..f53a51cc91f0 100644
--- a/arch/arm/boot/dts/bcm2711.dtsi
+++ b/arch/arm/boot/dts/bcm2711.dtsi
@@ -540,6 +540,7 @@ &dsi0 {
 
 &dsi1 {
 	interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+	compatible = "brcm,bcm2711-dsi1";
 };
 
 &gpio {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
