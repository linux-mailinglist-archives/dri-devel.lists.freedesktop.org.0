Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8202267E8B7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 15:56:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391F610E971;
	Fri, 27 Jan 2023 14:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE51310E971
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 14:56:14 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id D2E473200B35;
 Fri, 27 Jan 2023 09:56:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 27 Jan 2023 09:56:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1674831372; x=1674917772; bh=+LXERSxXxfa1Qa3nVVEU1s6/C
 KGrW8/bWKF2EiakzfA=; b=YflIfeFlf4ONKScUtLpuj9Fm6yKVqcJF07GUQPh/Q
 TJtZai5DI3Bna+iqusyX6CFYez1zuTjWKypNha1CSv5zn9DT5emESpjju2CeEr9e
 Ds2NX0svH6/P1RFZ63cMDlMXrPN91aKxEG54GRkRaFZZBE6dSa4waPSFbdCKhT6V
 Lo266h4eQIf9BGWP8vUEAsePNRLlafTTinV72iccgdeStJgMcb0tnuOv4OEIUpXk
 zZ/jk69CB/UyjMga42GM1Fb506shXxFliPuMKPF91j+XVpbgrMw8wtJ6i64VpsDH
 b6eWy9bwyCwd2swdPiIMAczf9BUUlalptBYB9HMCUpYfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1674831372; x=1674917772; bh=+LXERSxXxfa1Qa3nVVEU1s6/CKGrW8/bWKF
 2EiakzfA=; b=MCeWxNbiKreRLIfp5e8/miiBYtw9MQW/GisushFdtlPIVvkUOtV
 BU6a6vKSXqrh+T9bNVtgY0XQ/yHAhn3LasoX893KMolNclY1gN6d5f6nQAZPXXJo
 vYYnXCxOgGfC82HHck0xsw8V2rbLTvbhWEgAfiF8bsEbhrafaYQcn7rP67T8AEzX
 j339P+It6EzTVtwKbtdGbD65By4ySkkZJPLNPiyDNJxka89gMqWD/QTcDb/GH1zU
 ZXT1Tf2+tQOGI+xBc+zVXvRBeK7CTk4bTdoyDa2pjMZqZTC23PZUMaTSVjJdso5k
 HXx4ztxXZkRZ2+Hc1BkuP/SRsYIesj/1gvQ==
X-ME-Sender: <xms:C-bTY2EY3RUCmz26iCyftF0J4lVPtp2t_MjUDdURGw00aUmmfdcBaw>
 <xme:C-bTY3WjbNIIwmoLmH4bmhVDupty6Q7tsDVkpAE2-_OvsQC1p5cAK_JNfzMPzbxOv
 XjxX46jx6-UP1plL_4>
X-ME-Received: <xmr:C-bTYwIPWVB-MKk8VlZNR8ip3OQTvZrB7yXZ4XfObotrJFAeI02dXclbjlHOW0c1YSNlv5bvFcBXitrHxQs5u_i9JF4yC8nUo4Zp40dSIe6eBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddviedgieelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduveevhefgheefledtleeitedtgeeikeelgfeuhedtvefhkeejleehtdduteek
 tdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:C-bTYwGcIhB3tF5fV8vs6X3Munu2hJPqNAGlyKmaIMj0z48sZHWCZg>
 <xmx:C-bTY8UWFeK6IggA2Y2p2YDfYcngmqMv0sM4qtMc2iXq-Kj2S2A-tg>
 <xmx:C-bTYzNM8onAGgBJKq9VtRg0s22AM336eNemQVbSjKMS7xrXjLNp7g>
 <xmx:DObTY9uesRLSxHxhDbZzMx9J5SS-Q1ESQkZvI3cDnqxQi6FtBo7OGA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jan 2023 09:56:11 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/vc4: crtc: Increase setup cost in core clock calculation
 to handle extreme reduced blanking
Date: Fri, 27 Jan 2023 15:55:58 +0100
Message-Id: <20230127145558.446123-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.39.1
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
Cc: Dom Cobley <popcornmix@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

The formula that determines the core clock requirement based on pixel
clock and blanking has been determined experimentally to minimise the
clock while supporting all modes we've seen.

A new reduced blanking mode (4kp60 at 533MHz rather than the standard
594MHz) has been seen that doesn't produce a high enough clock and
results in "flip_done timed out" error.

Increase the setup cost in the formula to make this work. The result is
a reduced blanking mode increases by up to 7MHz while leaving the
standard timing
mode untouched

Link: https://github.com/raspberrypi/linux/issues/4446
Fixes: 16e101051f32 ("drm/vc4: Increase the core clock based on HVS load")
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index cdc0559221f0..bef9d45ef1df 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -722,7 +722,7 @@ int vc4_crtc_atomic_check(struct drm_crtc *crtc,
 		struct vc4_encoder *vc4_encoder = to_vc4_encoder(encoder);
 
 		if (vc4_encoder->type == VC4_ENCODER_TYPE_HDMI0) {
-			vc4_state->hvs_load = max(mode->clock * mode->hdisplay / mode->htotal + 1000,
+			vc4_state->hvs_load = max(mode->clock * mode->hdisplay / mode->htotal + 8000,
 						  mode->clock * 9 / 10) * 1000;
 		} else {
 			vc4_state->hvs_load = mode->clock * 1000;
-- 
2.39.1

