Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9C01B7FD7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 22:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224E46EB31;
	Fri, 24 Apr 2020 20:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B9189718
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Apr 2020 15:36:42 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 0EDE610EF;
 Fri, 24 Apr 2020 11:36:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 24 Apr 2020 11:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=iq6OgdlFEi7iP
 9VtPA3ftfVCrNknR3NlOuyTZGDy93w=; b=HChR8YBtXgXQqYbRO1Jpwyey+yYPQ
 cPcN1K+2vRjn/O8HWfjND2M6H1xoegmU9aHcpBgh25W7Juput/FFZSfHRAxn698g
 oEs0S8t4xmmRCyT1gM2mVpwfRfm6Dwh7RnK55qvwnLVrjuMi4o4KGwAVWPCxij8F
 iTW8dCuiVtzH1qqU2JBXHP2eRmcK6OdBwOTDhZunPgHoM5ajP1n1kSlNNOHykvhA
 lhGpX6R3+C00JJphvLtM6RM9qZ0qBUWotft76FUy9mNYOsjyLX9SP60EuWCOECSp
 80dfjyVLIcK4pysKytoQ0W1Pzp59/J5JMb41pNZF8DdC7acj61KF5zOmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=iq6OgdlFEi7iP9VtPA3ftfVCrNknR3NlOuyTZGDy93w=; b=SCsvIJTi
 VeCzFoe8CkT9Vn1TYOhartPUFW7a90SDZ1iNP8ta4ttb1IbNQtgB+Z+sWfgIz/6l
 fdW7PEdkpHSWkqKA4zNC6P9QwFJhMmWo7vt6dxBkyPcgbFS5vDuRPoc6xZMLpASC
 iqhDFfv9pN2tdw0vC05505/4rOIK2UrmFrkhf65TWYenu3WLBBZxD0jAuv4Xucgc
 XxnXjbP5gzaapu5uyPNza7mT03QVA833udpfJ6W3nJgnwcATiXwat4Bs9qQo/5+p
 yFWyX3bLS7bApJ+66p3z/OzufW8lWOsVKXuwBteKKKh7JOKoWcGIKCZGhJc1wrf5
 bG2jehCh3rmpZg==
X-ME-Sender: <xms:iAejXoqG_4BifGT85kv0gVNMHrg3E2VyWYZRHyE4-zvUm1r-a4eVVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrhedugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
 ekledrieekrdejieenucevlhhushhtvghrufhiiigvpeehudenucfrrghrrghmpehmrghi
 lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:iAejXg6QcCnaLysFXwaagmhlKrj6XoyqVH8LHV-jQqKRqf6nRdCfpQ>
 <xmx:iAejXs4702M3TRA-1YO_mmMAa4FLmFYMnA99a_FLCKmXBQRcosJcRA>
 <xmx:iAejXsnw1GDWx6T2LxCQKlAb7G0KTFc-2BTjf3U0PerSzxozAAPtzQ>
 <xmx:iAejXtL4dIL5GeiPG5J7q4Ipv4bXCWCcEq475I46x_FAfe0lmrpnUylu7mQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A514328006B;
 Fri, 24 Apr 2020 11:36:40 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 56/91] drm/vc4: crtc: Add HDMI1 encoder type
Date: Fri, 24 Apr 2020 17:34:37 +0200
Message-Id: <ceede41bee5828a381358165d298fef933ff8f5a.1587742492.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
References: <cover.d1e741d37e43e1ba2d2ecd93fc81d42a6df99d14.1587742492.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Apr 2020 20:08:26 +0000
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

The BCM2711 sports a second HDMI controller, so let's add that second HDMI
encoder type.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index e480839c1056..39b0d5ee1eba 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -430,6 +430,7 @@ to_vc4_plane_state(struct drm_plane_state *state)
 enum vc4_encoder_type {
 	VC4_ENCODER_TYPE_NONE,
 	VC4_ENCODER_TYPE_HDMI0,
+	VC4_ENCODER_TYPE_HDMI1,
 	VC4_ENCODER_TYPE_VEC,
 	VC4_ENCODER_TYPE_DSI0,
 	VC4_ENCODER_TYPE_DSI1,
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
