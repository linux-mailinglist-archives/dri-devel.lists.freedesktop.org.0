Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EEF5485DC
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C2C10E84F;
	Mon, 13 Jun 2022 14:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC02410E85E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:49:36 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id A6468320096D;
 Mon, 13 Jun 2022 10:49:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 13 Jun 2022 10:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131775; x=1655218175; bh=cD
 oI0fQPdv2X/jwS9hPrzSr4hi8J6poAQNcExXU9uS8=; b=hyK9/O0tcv4uZ3Bp6D
 FUiwi6HOl4QqTTzMoD0jmarUaxbNLlFKGx2JLR8oN4dheoA12cTmWGOEpf14FwTJ
 Fq0e+cw+DVhWndqGYamfmXiS/QhQJpBSemL/lMjaKjH982Zql3pte1XZGCbpL/8k
 R0iH8dj/z2KLNKAd/uJOMPEe0e9ii5GpD3Z/4VPKp9V0f8oX5PwD9NIiREvd+bBb
 xJFcOolAjEz4bsOkTg+TM5NPb9GLsCLa4gY2ICEktT4xRGteMbUlvJVnIZ1yIE1R
 s/PBJbVFD06a2tZQNHtfAgl5nwsUo06/hvtc7Tn/etZmOTb92CBsyXDKNl9/MFHm
 DBdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131775; x=1655218175; bh=cDoI0fQPdv2X/
 jwS9hPrzSr4hi8J6poAQNcExXU9uS8=; b=GqIRTgUGb/0ZgSXgrmbdO8mixce0s
 V+vmAM5ljyRhyPmTtPr3U170MgQEBaf3piWy9t6lF9OpeOvWnLzB0tRT9Shw4Ip1
 3K9Fde9Dsnj1QR72Ld7IGKafUJPvV3cmii3ulsBv6c5A+TAGku+LkdkZNNga0pCD
 ov/TKlz/4X1de9RhVT9Z56uQN/wD7pbWgp8CG83LVnvUKThyEtLRzYx9h1U1If+8
 sQ7RhDrZXRSCtmo4D475hbX6HzgSy0me8znIhT1COBxDY9CXj0PW08yiHtJXmRYT
 fwkOgtIcQuTLaR2fPU/37MKLyT0zaUNxaCsvuwyV/H3UrJDVebTv1BEow==
X-ME-Sender: <xms:fk6nYltSSYKJ0MuOxtOgLq2LNTRzD1WJJOz7mnsQShR56luc54z0hw>
 <xme:fk6nYufuD3fKIO27lC4aPCLAHykk72bpS3ygMWgV8QqFd1ORJ4S7wdRM_Kr2BveuN
 NY-Y8y52CuX9QGq9tU>
X-ME-Received: <xmr:fk6nYoyawIjUtM4DpVatA8CUA6qrNhSUYj8GIgHmfdVObheKvaps2xXd49ySQq8mmiQikxE3jESspsyubRFH1l2KJ7dgYr2Oguh4asg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:f06nYsMBz2qN75vJsyt27TC9YK8i56WXBQ7OKO3V_I6oroa5YNsxwQ>
 <xmx:f06nYl-2wGvChEW93YbxDgrxkZhmia1T6qYAt-xLOdd0KK2jql1Leg>
 <xmx:f06nYsWcYQexMT3kMh9tjJcauT64G0Fk3507aKrvH7-vNV1nNFzt1A>
 <xmx:f06nYok3TafwSCbNuMZInmedZu0LeunSZT2SY1F-L9rJckl390tqTQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:49:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 29/33] drm/vc4: hdmi: Report that 3d/stereo is allowed
Date: Mon, 13 Jun 2022 16:47:56 +0200
Message-Id: <20220613144800.326124-30-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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

Our HDMI controllers supports Stereo output so let's enable it.

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index fd5ff2a9bd6c..95974f757b47 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -426,6 +426,7 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 
 	connector->interlace_allowed = 1;
 	connector->doublescan_allowed = 0;
+	connector->stereo_allowed = 1;
 
 	if (vc4_hdmi->variant->supports_hdr)
 		drm_connector_attach_hdr_output_metadata_property(connector);
-- 
2.36.1

