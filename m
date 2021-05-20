Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4BC38B278
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 17:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33F26E154;
	Thu, 20 May 2021 15:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4847C6E154
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 15:03:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 971491618;
 Thu, 20 May 2021 11:03:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 20 May 2021 11:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=2thoq06TT4N3h
 i9RRmUNxgrAVfVdF+93RckPU2uHJgU=; b=bTJv4oN/ATSvtzQ3xHanmd1ZqIbLw
 tfovHDgG4btu7Xn+kQKsCsLDAl8ORqZX24kGHQK+aQG99+mzMVRb9EWSQyQ8Tq2U
 NxnQZtoH+Z7+HYybX+krXePhSSPscV+pcW/yrSQoN0nO0zzSHomzU2Huwe+osIog
 qsA9OlIBd0iQE7mJd3VQwGjFu+sPLSlq3xr+AI3k8qt1w1t0jJCmwNdCu3Ju/wVu
 cV3JE0OvzsTfQdR28SJArsI9x2hg31rR7Yo3SYEJNpdpXeg/SymERRIjvCmublae
 dXr4kMp1U3/Ygb3wpVxYeQEYgZhbHdrzGZxEUHYDBLzvM31QhqwebB6Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=2thoq06TT4N3hi9RRmUNxgrAVfVdF+93RckPU2uHJgU=; b=BXMu0zkg
 xVAXepK60dX8DJ/L5MZZzgpM6H7/FnZyOD5uEsCOcxDqO0UJzger3KNDFYC7m0YR
 YmUs+47L2XXo4Nd9n+id0bpIinBZhoIu9W3dM4z0xOthk56qqxJhCSyURrQpeIpb
 xkJqhdrxCuHsx8T5hgeNTwYooCJUU9Wchz/b+KKdbVwwK82zRjUSic+otoedvAFt
 UdM/SHEVPSFNR3BJw36HM5BHYHLbb+ATSkDCjaSUY7Da+LvXC94nkc/IARlxcgRi
 jJKQ5Xc3iF9BZb3jsl0sB9TMJUDDLIOkrK9JoESvr716PIsfwNxZ//Pd5bChUW3z
 GMcmkgyzQZonJQ==
X-ME-Sender: <xms:WXqmYL-momaTZbDre49SgRsRLhV2zbIgHMfS0y_yehaW-xPnlXUDKw>
 <xme:WXqmYHu1Gnd-I0OLLYczOPyofy0rlnb8Y9VAJW3WWAL26GiegFR0ip1oYSi12gsO9
 -nTfLCpUcY1XO2lsCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejuddgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:WXqmYJAfMKR0Xb31HmXqfxFUGdG2vbMKjU34tIPwPvUdEUmLl5WS5Q>
 <xmx:WXqmYHc8fGJxOMvoj2RZ7SAYm8aR9NlZqr82ISgys7cBpgczPqWtQA>
 <xmx:WXqmYANtMLmvSga5uJyjWZJPxGrvqjD7wsrOUIKZtksjE9aStv4c4Q>
 <xmx:W3qmYNwpGqj-tVki5Co2oJsmTtdbRodIS-Zc53zOC1m3SlwFIl4i9gFvbu0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 20 May 2021 11:03:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 1/4] drm/vc4: Fix clock source for VEC PixelValve on BCM2711
Date: Thu, 20 May 2021 17:03:41 +0200
Message-Id: <20210520150344.273900-2-maxime@cerno.tech>
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

On the BCM2711 (Raspberry Pi 4), the VEC is actually connected to
output 2 of pixelvalve3.

NOTE: This contradicts the Broadcom docs, but has been empirically
tested and confirmed by Raspberry Pi firmware devs.

Signed-off-by: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 76657dcdf9b0..665ddf8f347f 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -994,7 +994,7 @@ static const struct vc4_pv_data bcm2711_pv3_data = {
 	.fifo_depth = 64,
 	.pixels_per_clock = 1,
 	.encoder_types = {
-		[0] = VC4_ENCODER_TYPE_VEC,
+		[PV_CONTROL_CLK_SELECT_VEC] = VC4_ENCODER_TYPE_VEC,
 	},
 };
 
-- 
2.31.1

