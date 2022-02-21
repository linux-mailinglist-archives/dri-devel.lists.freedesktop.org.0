Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7A54BD9FD
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 14:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B70610E396;
	Mon, 21 Feb 2022 13:42:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8F810E386
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 13:42:07 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id EBE725C01CA;
 Mon, 21 Feb 2022 08:42:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 21 Feb 2022 08:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=uifjtJK1IaaXaQlZMDyIEDSa9Pn0JH
 L+z/u3hqJx6T4=; b=HaUCwVsZ25fBTRGdYi4jSsgDnIHMGg3L1VGIYR/4SuWuFG
 GYt13kFkdqp98u+dQ4q1fcfvZRQIUh5WdRpbluca/dP/C6KRWyXEIo+5qf6GgRnk
 NrOVCJ0k9oZqvEONTyy8ybnJJrJN65sONDBONjv/DNeQwmyV2hjudFHcfgi+LTTo
 7PokZRWEwwXx6ErbduMWDvZz3A20gT97w4F/naOcU7fjDICqe7UvbbgBDSgOqIFB
 u1/JVOwTKyZJoun+xRirNI12m6LtHFeHPqezq0oBiheVOepS7UQXyOIxmpJB+YRQ
 uj5qvMU5ha1peBoVoc4hiHCpdhJJQ/fhrjqMPttw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=uifjtJ
 K1IaaXaQlZMDyIEDSa9Pn0JHL+z/u3hqJx6T4=; b=KaXLq2ausNCVTPL8Y3voav
 h+qnbh/RhbmHAD0MKXbPIMEE1NOGMhcMvzd5hJ/8OV9hCNUglp+72YN+BKq3y4KB
 qu/AxE4HzFybCeKpEIAZzUyX+OYy18Bmuno/FTvyzSkEbEG5gN1rAWerryEYmjWS
 xemgbgYKs9t632antnvX+GncG7+MHiQuMed+uC6TO6SVCEMg6N3TVT0O5DPBuog0
 gHEzhG3/Y2w99lnjkKaHNo0UVWlPMSmyRcI6mOcWVwgYKJF9G/X9h8lp9RXcd4Bi
 Y3yrVkDecoPNzXZnHS4rp3Cdhv/xvKtMMfIPEBV3i79dJHjOzC5jk29T2emHnd6A
 ==
X-ME-Sender: <xms:rpYTYrQEi5o7kYd6V-a5uvNsGStkLSzidEV-hJT8ANCjdIpqzjOfFw>
 <xme:rpYTYszUUGnAK27fBsJtgLJL76yqK7Xkp1_1njNQyz8doMB_r0lOkL7mIIH4i9J1e
 tKMhdP3FYi2QNkuDSc>
X-ME-Received: <xmr:rpYTYg07CoKeTcBMPvH7JwGmdCNUUs1HRHC6ngIgt5pNqPMiAxiKpQqw_jT-Xpp085Jl6qMkBomcCsdu0PzxvegicUIxjW7_4zJCzcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:rpYTYrA-SIqabMCw8-FXvK5P97UV-UoZVjBF4H_mVLTZau6FirzYcg>
 <xmx:rpYTYkiVmG8z2eFU86tOL0xTSDfa4AS4I7IPJNpNH7TImaX9wkxpnA>
 <xmx:rpYTYvrbXCkUdweSKq-pcMGQlaCBNDR8C4Nz1k5-CufwDw-3WRThSw>
 <xmx:rpYTYtUAovJZHZnlcNCusl1eLfPqS_6eMHEzasgM2viE53p2TGKPVg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 08:42:06 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 3/8] drm/vc4: hvs: Store channel in variable
Date: Mon, 21 Feb 2022 14:41:50 +0100
Message-Id: <20220221134155.125447-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221134155.125447-1-maxime@cerno.tech>
References: <20220221134155.125447-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The assigned_channel field of our vc4_crtc_state structure is accessed
multiple times in vc4_hvs_atomic_flush, so let's move it to a variable
that can be used in all those places.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index c8cae10500b9..d225eea6e640 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -460,6 +460,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct vc4_crtc_state *vc4_state = to_vc4_crtc_state(crtc->state);
+	unsigned int channel = vc4_state->assigned_channel;
 	struct drm_plane *plane;
 	struct vc4_plane_state *vc4_plane_state;
 	bool debug_dump_regs = false;
@@ -500,8 +501,8 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 		/* This sets a black background color fill, as is the case
 		 * with other DRM drivers.
 		 */
-		HVS_WRITE(SCALER_DISPBKGNDX(vc4_state->assigned_channel),
-			  HVS_READ(SCALER_DISPBKGNDX(vc4_state->assigned_channel)) |
+		HVS_WRITE(SCALER_DISPBKGNDX(channel),
+			  HVS_READ(SCALER_DISPBKGNDX(channel)) |
 			  SCALER_DISPBKGND_FILL);
 
 	/* Only update DISPLIST if the CRTC was already running and is not
@@ -515,7 +516,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 		vc4_hvs_update_dlist(crtc);
 
 	if (crtc->state->color_mgmt_changed) {
-		u32 dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(vc4_state->assigned_channel));
+		u32 dispbkgndx = HVS_READ(SCALER_DISPBKGNDX(channel));
 
 		if (crtc->state->gamma_lut) {
 			vc4_hvs_update_gamma_lut(crtc);
@@ -527,7 +528,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 			 */
 			dispbkgndx &= ~SCALER_DISPBKGND_GAMMA;
 		}
-		HVS_WRITE(SCALER_DISPBKGNDX(vc4_state->assigned_channel), dispbkgndx);
+		HVS_WRITE(SCALER_DISPBKGNDX(channel), dispbkgndx);
 	}
 
 	if (debug_dump_regs) {
-- 
2.35.1

