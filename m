Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DD329FFBE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4994E6ECEE;
	Fri, 30 Oct 2020 08:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 844056E8E9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 19:01:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id DD56A5807F8;
 Thu, 29 Oct 2020 15:01:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 29 Oct 2020 15:01:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=DJblop826jaau
 ARFHlsFWGhybWeX4gCdzuspM7ojKio=; b=T1dd5rspJuZzJ3CovJjMx/dkKwTee
 E+9XTYeVwWu2lnJONtSB74RNOokh3Qg/CO3QaOx9+A/JJoC9XNyKYiIVtKtTUSde
 0xLFw3KkofdqQnNurggrUmdBFggtkZkgc4dUgDup1Drls/fv/THM4/0jizrw6V/R
 xdImfc7oPMy3Y8bWZhcicVqLB9SHMbiffMdG4u4I+Tq4F0PGMO70c5dZDdYN9yI1
 mqsZtsX5BpDOPk3Syf1UPIyRWb5sXOl+bA555xJWC51Luu2prFUmrpAH7DDgsGFa
 YPpMnJLaS4nWrdzDJcii5/lyZkqyqHe59U/xQuV6YomNfwuMwA073kZhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=DJblop826jaauARFHlsFWGhybWeX4gCdzuspM7ojKio=; b=d0mBk7Xt
 M35dpBfOGcHX3T8xO0Es3UlUXLBjMc+ZVwwMz1PZxAK86R6IHpPsY0zmzlLMzsgw
 LmCedRo8Diml1NdZFo1wLPb/mYMnuK2oOiEexJvfAAurqQV3sRajydicz9KAPD17
 CWUUaC6wm1iSN+ypauojFhkKkjcrguP0wRIAaYokV1z4VCZPhEwQwC3LE0OFO/qg
 JFJ5qeNAFi+bqke1sXVgJ1shsVO4irEUagNNb4pTGASkeiSRozypmX6yQX3my7UN
 RG6coLzdrb3HI1x0gol3SHVXkz9ESkWB40iJbe76YAF0NCd4uN58CKIiDpAFMoHk
 009YzX9zBEsxMA==
X-ME-Sender: <xms:dxGbX-tv91rPrkSU9LViZJvC6XY44gv2Q-FyOBoqsLftvLySexexng>
 <xme:dxGbXzflgUiaf1isQBSxxbranrn-rvTAFS2qGxw4XnfdnKk6CX_-HjSHCoWUCvY2S
 jW3CuMos-vNY1FxEmU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrleefgdduudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dxGbX5xaUotVAwdxOC81-w0gEEzYNmjauhdIkHc0DhVrzcAp9T6Mgw>
 <xmx:dxGbX5MoLGSA5J9P7OzjUXd9zY2r0JRLcptuGbixLkmi8OKslUTW0Q>
 <xmx:dxGbX-8cCXHBtNQd2FaMSKwvlE1fQNsGC5vgTKe_UI29xJu4aNISmw>
 <xmx:dxGbXyQi_cq7gSdnaZc4At1eww50e6-IVannpDPeAexlgkmPx0ZcWw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 64F0C3064683;
 Thu, 29 Oct 2020 15:01:11 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH 4/6] drm/vc4: Use the helper to retrieve vc4_dev when needed
Date: Thu, 29 Oct 2020 20:01:02 +0100
Message-Id: <20201029190104.2181730-4-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201029190104.2181730-1-maxime@cerno.tech>
References: <20201029190104.2181730-1-maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 30 Oct 2020 08:23:17 +0000
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
Cc: linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have a helper to retrieve the vc4_dev structure from the drm_device one
when needed, so let's use it consistently.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 4 ++--
 drivers/gpu/drm/vc4/vc4_kms.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 4d0a833366ce..b72b2bd05a81 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -560,7 +560,7 @@ static int vc4_hvs_bind(struct device *dev, struct device *master, void *data)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = drm->dev_private;
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_hvs *hvs = NULL;
 	int ret;
 	u32 dispctrl;
@@ -679,7 +679,7 @@ static void vc4_hvs_unbind(struct device *dev, struct device *master,
 			   void *data)
 {
 	struct drm_device *drm = dev_get_drvdata(master);
-	struct vc4_dev *vc4 = drm->dev_private;
+	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct vc4_hvs *hvs = vc4->hvs;
 
 	if (drm_mm_node_allocated(&vc4->hvs->mitchell_netravali_filter))
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 149825ff5df8..708099a24406 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -51,7 +51,7 @@ static struct vc4_ctm_state *vc4_get_ctm_state(struct drm_atomic_state *state,
 					       struct drm_private_obj *manager)
 {
 	struct drm_device *dev = state->dev;
-	struct vc4_dev *vc4 = dev->dev_private;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_private_state *priv_state;
 	int ret;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
