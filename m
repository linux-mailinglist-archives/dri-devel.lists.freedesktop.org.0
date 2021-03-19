Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B315C3420F5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 16:29:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01D26EA45;
	Fri, 19 Mar 2021 15:29:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A83B6EA45
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 15:29:29 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2AA89580EEC;
 Fri, 19 Mar 2021 11:29:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 19 Mar 2021 11:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=2cNzd7YoIDhfwDHpW/c7bvKkcP
 BXtKeoOZey4iUpgOc=; b=unszStEGqYwJb0kOWnvChjr5fiHAzWD9LHgWEUPouf
 HDZZWpRVM36PU6Et6pWdNa5DLMLNGV3ymgYVyu+X9hoeAgaIzDju7EUA+WXHJuAp
 tRldwEswZq/+IpLo5iXX3yBH9VDXQS6DZgYOQvRGS3c2cIVnKwQ5xFS1wzd2QWRY
 tiP2cKwJYLcrsC2Fv467X3Ze1ckWK0TscIr1/KJsDOPZSp2gMvynLN0atXyADZxM
 7BwkrlDCi+TiyJXv23ICgJAsgE3slBjXWGYHKWirWsDoPXF8l9IQbYK2cGiAYIND
 xZA1quQQ4mpOENBHpiyyXmE/TAHX9uAjOdcCD2E5S3Sw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=2cNzd7YoIDhfwDHpW
 /c7bvKkcPBXtKeoOZey4iUpgOc=; b=R4pEoOEKhclUi1szkvr//3tRAFNM//7/J
 DV3Uea7NP8VGpcd8TtVJZ7XomC3jEqOnxZwsUjL6ovvws6xGt216JurYlD5LAvVc
 lBEPEEwlBoE8TV1gjk5l2+u0kT6Lqp5mc5Y2rljMSyT5oUa9UrSFZ5GTbcj59/KD
 B6YKnA99VoCjLTxpeL48z6aSzvPf8HRZxdrdRB+XW4V31M7MHrJJ5a3p+IVVHLmF
 s5n8MAf3X2pP1kyxkSvWldp8AQIhS9yLRDzySPMSPM0RGxkrcC3Hl24k6URov6k6
 2qKAsaLYpMKPBZEQwqrSjLqileWyhwmu4KryqejaWDIHVmlRtyajg==
X-ME-Sender: <xms:UsNUYLpkYcrjPA8UOwliuidVbIxOVI2zGSNifWU5oGFo4bFSr71Kjg>
 <xme:UsNUYFobZRslWP_ZnbaXHwIS9saTfQvJlEee5eIRGuHNR6pycPbfirp7D6iQxYy6M
 s4RSA2xiO3e_Aq3wGY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefkedgjeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:UsNUYIPZ97pMwBwD6qO-zzwjyaCo_HFU2F6PcwEmzM5YOkTxZInf5w>
 <xmx:UsNUYO66mqzTBvoH3lo6rMSSOq-V9l3qNhX45g-gywdkQAxybn5xZQ>
 <xmx:UsNUYK4vf3VhThFikPblVjNl5RRcYQdhKBawnCeKav2wH5u_MJYrww>
 <xmx:VsNUYCh6jKLUzbdddc-53UcCBXNDF938UH65urMM6kwlvJ6oVb_owA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A9C4F24005B;
 Fri, 19 Mar 2021 11:29:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/rockchip: Remove unused variable
Date: Fri, 19 Mar 2021 16:29:20 +0100
Message-Id: <20210319152920.262035-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 977697e20b3d ("drm/atomic: Pass the full state to planes atomic
disable and update") added the old_state variable instead of what used
to be a parameter, but it also removed the sole user of that variable in
the vop_plane_atomic_update function leading to an usused variable.
Remove it.

Fixes: 977697e20b3d ("drm/atomic: Pass the full state to planes atomic disable and update")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index 81c70d7a0471..64469439ddf2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -879,8 +879,6 @@ static void vop_plane_atomic_disable(struct drm_plane *plane,
 static void vop_plane_atomic_update(struct drm_plane *plane,
 		struct drm_atomic_state *state)
 {
-	struct drm_plane_state *old_state = drm_atomic_get_old_plane_state(state,
-									   plane);
 	struct drm_plane_state *new_state = drm_atomic_get_new_plane_state(state,
 									   plane);
 	struct drm_crtc *crtc = new_state->crtc;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
