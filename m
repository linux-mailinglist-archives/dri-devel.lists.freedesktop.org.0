Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA722D5E5A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 15:48:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35CD66E5CA;
	Thu, 10 Dec 2020 14:48:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B6BF6E5CA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 13:47:08 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 13008F3E;
 Thu, 10 Dec 2020 08:47:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 10 Dec 2020 08:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=fklFVIL4Y1AJE
 O4W9nFqNlVOvqBIEiPSfsqHHscTIBE=; b=nNO2RIx/astgzAlXENxsKURrTJJSI
 UHXJnswJvUqviJv1BEOPeVTq3+uU0ymAP96TDRugvCTVE4YHFqj73fSPr3T+MGyB
 lNWYQ3kXMnjIFHOEylnZP7FvBFx9BrCHSUWV0u0trgPJR8eNu+Loo6pbNBpkZCUj
 WnchPKPM7ou8mN6/7dm33q47hJdXN2UbdgmtlzgUDyazt3pQ81OT4cHLXFE/rthJ
 w1QMZ5KL6xXfVZSiJrsY0t52dJhVp+8MiVT0fe9/CxNnCn6Z8QRZjg+UNeKGK1QR
 HmAgeLKe3pc8MH7FZlctlxJccshFC1oyA6fn6El2jTqz4NqBuk0bn0PlA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=fklFVIL4Y1AJEO4W9nFqNlVOvqBIEiPSfsqHHscTIBE=; b=mRPoa3CL
 DaxFOvTVB6EdXe2MJe/edKYP9BDX7tzRiiK9uQSq//RMTH2TYdZQRLZ/jpXaayqx
 TgDyUEf5hOqmM3hN4iSUEbSkqCcg+bytIBHuXoTROEssM4jx3fULZy915qwLGDIs
 e/8TvPv+2Ly3ntSgWscW8zizBNJ8FJdUvTX8Ch/XAxfzAYrILzh+0sm4KAzgbhlm
 orPCL2H7lHdHkpi8l1CsCgHjaOpnZpnFE/MIJRmTtwvXFU/YFj6sLEBndTMwBeyv
 CxTR+gJiI55nRDmql4fZQm5H52fPu4KnxetReOUHPIUvd3MVRWLVRhGph/n0+kDz
 uYQAHnb4jsJWjw==
X-ME-Sender: <xms:2ibSX9mH94HI6WwMkHJ1GchPuosLfHB3xQe59PjAoflQzfN9IEQeyg>
 <xme:2ibSXxlppsHHlVlGXg3MW8KcmejKnG9ei_izcDU8vLCTQWB2wySKMf04eJHI_eFeA
 ZdcVlM8UmYfgvjxzBM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudektddgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2ibSXyVV8tFiVZ37_xZ_eNy4hLtkebRoLuW5j-fGUgKIg8INQvECqw>
 <xmx:2ibSX_8V5BKgBklSGzpJOHbBLinD3L8GLx2_f-Yvi7TgCkO2e_0nYw>
 <xmx:2ibSX_o2q_v30l___fIGEZ3JzWJcEume39X23uiig5fBRmJWlIpDhQ>
 <xmx:2ibSX2vWFJECfjf8Qq-LJFjJ4jKm01wj0L7gs5DERdcXUie8fwHUl_eVODM>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 73253108006B;
 Thu, 10 Dec 2020 08:47:06 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 12/15] drm/vc4: hdmi: Don't register the CEC adapter if
 there's no interrupts
Date: Thu, 10 Dec 2020 14:46:45 +0100
Message-Id: <20201210134648.272857-13-maxime@cerno.tech>
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

We introduced the BCM2711 support to the vc4 HDMI controller with 5.10,
but this was lacking any of the interrupts of the CEC controller so we
have to deal with the backward compatibility.

Do so by simply ignoring the CEC setup if the DT doesn't have the
interrupts property.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 327638d93032..69217c68d3a4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1655,9 +1655,15 @@ static int vc4_hdmi_cec_init(struct vc4_hdmi *vc4_hdmi)
 {
 	struct cec_connector_info conn_info;
 	struct platform_device *pdev = vc4_hdmi->pdev;
+	struct device *dev = &pdev->dev;
 	u32 value;
 	int ret;
 
+	if (!of_find_property(dev->of_node, "interrupts", NULL)) {
+		dev_warn(dev, "'interrupts' DT property is missing, no CEC\n");
+		return 0;
+	}
+
 	vc4_hdmi->cec_adap = cec_allocate_adapter(&vc4_hdmi_cec_adap_ops,
 						  vc4_hdmi, "vc4",
 						  CEC_CAP_DEFAULTS |
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
