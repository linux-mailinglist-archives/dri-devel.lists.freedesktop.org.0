Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD5E21992C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83FA46E9DD;
	Thu,  9 Jul 2020 07:05:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900C06E907
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jul 2020 17:42:41 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 8A95B109A;
 Wed,  8 Jul 2020 13:42:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 08 Jul 2020 13:42:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=+PSb2nWmzRXnx
 sLnQxfZbPOaVw9RdI0nFsyk/O4d7IY=; b=KPCoRRw7S1Zhtv2YxnxRTJSzYe8oL
 HvJHntQFeQ46TgVbujGnWvNRs456jNYpAn1/hFZPUY/8ZtA+UB2eic31Oj7Ay2yr
 Qa0GI92u5rz5QKyneDtKsqElOnQpI9+ooyyUoFWfWVciPi9NtiM3w5CxStk5tvWO
 tUZ/TO7sb8k6l62ngauRx0umERzyUEZSIsmwB9mQWaPS/uJ61HeU/k7MlEfB/PwK
 o29Ha7ICk1pllKvzS325UtABELCpmud/wTg0xJI3uflDxZEwTzSCiV43vD0KGaoI
 MubvdixuXyQfotU/oCbzw9exgf3Bt3Mzn+cD/l4NtG47AqzQLPV+Hp/8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+PSb2nWmzRXnxsLnQxfZbPOaVw9RdI0nFsyk/O4d7IY=; b=Qh2pRKzH
 QwoqQpB9bqAKE4ybOtuky1Bdt9oyNzWMYNRePXizp1NrwCMOMU4kHlOWq/zGOFwb
 +2Itn3gv/38ORqTF5CNJoa/Dr5hcYqHnXk7BjZ+oW5NwzrQp2Yq3yCF4DGCaz4+/
 AtsihFzOdVVaQP4+UNA0c+0VHv5aqUIs1v6+XMPHmH8OC2V6bzwffkaZ7uJ2Hdg/
 Mppn9pa3RuPVf3LjNSIYycdFWM+8FVL2XyRAUBS0N8CHzzMj1aEfTZvdpe5yxetA
 g9D5kJfU3/vIpjK63iQgAslZ3/ooamX3ceTUDcT2XuYDKwsPXQmVdfPVReDL4OhY
 lZEJnAA3gMkPQg==
X-ME-Sender: <xms:kAUGXxYbnPELnIynWuHe2oEe-bloW079kzsaCuLJb5FZRlUgc8WAAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudejgdduudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kAUGX4ZoC3QesaBn-94G6OZua6ze4rMIe-YXF5LNVG41FecM0eLWjQ>
 <xmx:kAUGXz89rC_pp_y-SdM1RICCCj5iSSGuKe7gf89HxIlazooTuogpwA>
 <xmx:kAUGX_oZVGhuHAxer3BLUuHUiuOM353J0RcE8WlMh9h57VCzzEzO9Q>
 <xmx:kAUGX0Ig2By8KhudPJKYLZB6IhrhvN9L11vjCg8SIZ0Aq7zXra-kie3kyBg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id CA0A7328005A;
 Wed,  8 Jul 2020 13:42:39 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v4 06/78] drm/vc4: plane: Create more planes
Date: Wed,  8 Jul 2020 19:41:14 +0200
Message-Id: <5b3ce924397939fd208af8eb2e142499a705cc21.1594230107.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
References: <cover.7a1aa1784976093af26cb31fd283cf5b3ed568bb.1594230107.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:03 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Let's now create more planes that can be affected to all the CRTCs.

vc4 has 3 CRTCs, 1 primary and 1 cursor each, and was having 24 (8
planes per CRTC) overlays.

However, vc5 has 5 CRTCs, so keeping the same logic would put us at 50
planes which is well above the 32 planes limit imposed by DRM.

Using 16 seems like a good tradeoff between staying under 32 and yet
providing enough planes.

Reviewed-by: Eric Anholt <eric@anholt.net>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 23916814b4e3..1e38e603f83b 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1384,7 +1384,7 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
 	 * modest number of planes to expose, that should hopefully
 	 * still cover any sane usecase.
 	 */
-	for (i = 0; i < 8; i++) {
+	for (i = 0; i < 16; i++) {
 		struct drm_plane *plane =
 			vc4_plane_init(drm, DRM_PLANE_TYPE_OVERLAY);
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
