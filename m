Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7164E9B38
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 17:37:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E70610ED57;
	Mon, 28 Mar 2022 15:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0176C10ED55
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 15:37:13 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 06DFE3200C10;
 Mon, 28 Mar 2022 11:37:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 28 Mar 2022 11:37:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=HBkfY1Fguy3iaXPfpX0Lv3YYI1mCcP
 xE0pURKL9eteI=; b=QCpk7J/a/KDVIdn1czsiHhqS1IEGhGb4aTd6NiCJeJGHN6
 WstNGKy2E0Wf56Mvk40O4R8TWatAc7VnO1mvhsGeljDJD5M2qi229rDMrPPW84OV
 UhPYtWeXtCAOWIYGgoirVQfMh+qx3ufhWAZCh/9IA/GAlSjWghSU5jCK/kxkSlbJ
 q8eTFghMMGGNeC7WxbwVJY5ZLBpFS2+h5ahMMeAG9K9YSPYa6CPrk2LoUpnBriGh
 vWvUSYdkZu1JZ4LmKhopMEscsm1a6CV/I3jNv52qhuwjrcJez8am9OpMbDHNACiH
 L+feQ3wuvqaOWRJNYw6/KzQZ9JCsiBpWIsI+Zasw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=HBkfY1
 Fguy3iaXPfpX0Lv3YYI1mCcPxE0pURKL9eteI=; b=Frc6fAgfYbULDzfZx2gVU2
 L1ltBSEH0A71JOzsAldBBD1Qij4eNy1DT8Rudny1j26Hm5Ri9MEROKQw0EZbz0C0
 foihZDDvo8fs9YkWyHEwXzfDiMDVEVJOguwtoDJm/S+4oxt4zRtKd+Dx1LO1wgr0
 J+4QMa1/9hMFs+g1vczmzCzlT9GEZqk+Ohzi+PrVNGmeOHgvWzTOT7b6G28QW8Bn
 M1RZ9LKwduNkKfa1REoCatxiqfxOLTpD8UUjkKoK1OC7YdoPyLL+Sw+WUa4X98qJ
 u30qbJ5obVzYNbCsbblcQD2ow01UXkr5TLEikghim/jQxFpjC0qfVKtnJauGubVg
 ==
X-ME-Sender: <xms:KNZBYjTQE-NMcG2enGy2VG57DC87kPW0DRpTzDOt5o-yePd6fqgrfA>
 <xme:KNZBYkx6ZMzDb0VDB0qmXvh6MKjUWQ7p-x5vQwCedkShXE-ZB1dwKNWhYtJ3CfVnE
 UJu-VeL8UcoNyrpm3g>
X-ME-Received: <xmr:KNZBYo2yGOpjCeBifY0jNs35b0V3X5QqovM4gLiD_K71nadTaYI8EnCPjDCMPlOzVmKjItGOCFd38UdC1P01cFFHD93VxBRMfM1PiyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehjedgleduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KNZBYjAgzgGhmtTlQ5VBmEi39mdD6tWQf47ZH7g2Z1JkW9kUwroubw>
 <xmx:KNZBYsiYMn4B7uSQ1qOO76wm4Ir47CghGC1lN9nHw269raXm1F7X5Q>
 <xmx:KNZBYnpZFfrBAy8El_fy85P-RLgi_lg7gAMJpRWtwC08L5PvYXbh7g>
 <xmx:KNZBYkcsp56nao5IUacYgRBRtzSBIkO_SBpYkK_woKrllafx-Rftig>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Mar 2022 11:37:12 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/vc4: txp: Force alpha to be 0xff if it's disabled
Date: Mon, 28 Mar 2022 17:36:56 +0200
Message-Id: <20220328153659.2382206-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328153659.2382206-1-maxime@cerno.tech>
References: <20220328153659.2382206-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we use a format that has padding instead of the alpha component (such
as XRGB8888), it appears that the Transposer will fill the padding to 0,
disregarding what was stored in the input buffer padding.

This leads to issues with IGT, since it will set the padding to 0xff,
but will then compare the CRC of the two frames which will thus fail.
Another nice side effect is that it is now possible to just use the
buffer as ARGB.

Fixes: 008095e065a8 ("drm/vc4: Add support for the transposer block")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_txp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index ace2d03649ba..5b4dd644214f 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -304,6 +304,8 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 
 	if (fb->format->has_alpha)
 		ctrl |= TXP_ALPHA_ENABLE;
+	else
+		ctrl |= TXP_ALPHA_INVERT;
 
 	gem = drm_fb_cma_get_gem_obj(fb, 0);
 	TXP_WRITE(TXP_DST_PTR, gem->paddr + fb->offsets[0]);
-- 
2.35.1

