Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C1C4AC5D2
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 17:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C9E10F871;
	Mon,  7 Feb 2022 16:36:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F0F10F8BB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 16:35:58 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 5A8582B0014D;
 Mon,  7 Feb 2022 11:35:57 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 07 Feb 2022 11:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; bh=RkfLFhsT0oeGyH5Q3NR1vzRXIXUZ5k
 WakkOr/SvCplw=; b=JpWwuFwE/j/V04CJHDv3wX6V0EFJqQgjmMIIv1jPDGhGZ1
 /k9gGwSmkz/Unlvo+DUYd2o2YIEz2IgqzssdY3BR3U45fnIUqZIGQX8Qn2IqjI5f
 pMwe0vLbTpx6wnZAWRAEAZOA2SAsaQ/Kv447OwvdHegl995Xe/d+6rUM+rPAXnCK
 i+KsfpnnsPtp+GqUKsQ08QFYA04LAEfOCOZZvXuQhz+VcxUBQMXSRltlMWnPUsaf
 0WnLKkhPImhe7BBhma4XHUtgUhXUH/2kXeusX7mnGPdiOvbdqexDekyL0eN+RaeM
 /RywVkcoNtf6Bq/kHZWwATwUB427oJIZjda+CR5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=RkfLFh
 sT0oeGyH5Q3NR1vzRXIXUZ5kWakkOr/SvCplw=; b=nTDNgBD6enNdVjyZ7eQNR3
 63bAs193AjFl7nFO48OejRLSgFPXpexTOjM311Xk2yKI6iBr1UZysd+mgCMZg/bS
 d/pMr/hgqOCwnRUB+23RW4DnNu2Jn32D5Gt9xBSzsJ6erwq+Hk8OBpqKHOTH3dDz
 0CD/55FSAYILCAPvov76xCVkjIhwL45KzgYxLrq/49sv7iZvi0RQvN2sn/UaHiZY
 7rtsbx6r+wKoI2sobPeOE40Nd51UBFqW8UwYporQa972gSRvtfDVZTAyUPZkbMrA
 YcSVtKw9mGBzsimPj2uv6WBtYJ90Ychr4bJusNF4Bwp3mbfc464/sX7VUHdB+M4w
 ==
X-ME-Sender: <xms:bEoBYjuyiyJGb2n7FMK24TaKN7ay5yhytj7BprlBrnq5Ex3rwEPoHQ>
 <xme:bEoBYkcB9vdvVP_HM2SvkLdOQIC_XknUadgZlU_Ir5wWmKu3rM34cBaemPrm6Buaq
 GVUDThCt2DL-4VBH6g>
X-ME-Received: <xmr:bEoBYmytuE_LlLb4JHkV5zY8AkNG_3reaqHSn_M9Gh_tOpJBW_KKP4ROk_cH__QlRNLW0RedXPgKd5bywpOjvIYo4EHU7pTe0at46vw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheehgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:bEoBYiNL5KmMiKjuLz5bhmwid_ngNA3kiZNcD_zbsUOSUJY1ubcWZQ>
 <xmx:bEoBYj80PUzuZRJI5tDiY7m1sAMxcC9OMxu2h4FXZwJFjLoyReL1pg>
 <xmx:bEoBYiV1-r-N0TiqR5iHpSZ37s1aOPcrLV67PDkv4wwECOH-daxzdw>
 <xmx:bEoBYmVQARFjq16iioq1RSH2_U-Yri-kUSUMixPmV6Os2Nw7sfKs39vS4P0>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Feb 2022 11:35:56 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH 13/23] drm/nouveau/kms: Remove redundant zpos initialisation
Date: Mon,  7 Feb 2022 17:35:05 +0100
Message-Id: <20220207163515.1038648-14-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220207163515.1038648-1-maxime@cerno.tech>
References: <20220207163515.1038648-1-maxime@cerno.tech>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Phil Elwell <phil@raspberrypi.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nouveau KMS driver will call drm_plane_create_zpos_property() with
an init value depending on the plane purpose.

Since the initial value wasn't carried over in the state, the driver had
to set it again in nv50_wndw_reset(). However, the helpers have been
adjusted to set it properly at reset, so this is not needed anymore.

Cc: nouveau@lists.freedesktop.org
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 133c8736426a..0c1a2ea0ed04 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -635,8 +635,6 @@ nv50_wndw_reset(struct drm_plane *plane)
 		plane->funcs->atomic_destroy_state(plane, plane->state);
 
 	__drm_atomic_helper_plane_reset(plane, &asyw->state);
-	plane->state->zpos = nv50_wndw_zpos_default(plane);
-	plane->state->normalized_zpos = nv50_wndw_zpos_default(plane);
 }
 
 static void
-- 
2.34.1

