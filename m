Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB3D67CC91
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 14:48:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640A310E8F1;
	Thu, 26 Jan 2023 13:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC9F10E8F1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 13:48:02 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C53975C00ED;
 Thu, 26 Jan 2023 08:48:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 26 Jan 2023 08:48:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1674740881; x=1674827281; bh=k5J6EfmVH8
 O4lmkv85SSqR8bROTedQCfPtI6ATiEF80=; b=E7mweMcI2FI9eK9g1n5cBnEsyv
 Uvr2hvB5RLotvxKelx6WTpCOc4QT5ywDC/vRyGkoQ1HLw9lSaEMg6N1VM3c+dt3v
 XEmO4+F/n4LJcw/ACqVGrun+p9DHV544R2sMZikOLDBUecCm7Fvx56UHmnCr0a30
 DPYQEYXmpjwcy6wsoL0QvkS+clbIbtxZdO+oRXmMLK8kcnPliOxm+RyI8b+YV9DD
 aEXAzFRQcep4rMDK/citwwaFw/JIic2f3SJWQOMa6bFjghJtO4oYhnQjlcgHnOiR
 uyNMeWIfGAjUlV6Rw+BPQ99ujUKtlxnsGdAd03+jnvm2UWHvs9wHzeOKiZYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1674740881; x=1674827281; bh=k5J6EfmVH8O4l
 mkv85SSqR8bROTedQCfPtI6ATiEF80=; b=pwS+/XLHcN82l09dsCUcRVty7TygA
 u345uJPwYZ2gFng82EZzDgNex7uySERHqOAdYr0iMPa2lh+5gPvPIw3kriy/q+Ff
 VpvgXzJNN0CC7soGcF9B/5/TGREMvMmoWzlcKcbh2HnfMDeM6k7DuOZrsFqR1U5a
 /n9cJFcZkznsombADbPFzKhhsPwvY+GfoaOZFW28B9AZJDy+Gats3Ixwl0eHFpve
 Efa1CAkGQOcFn9y5G7RsblqnCJ6xs99DANNFh+AtxsvMDQJ1id9Vx4xblJfNM0y2
 QpiRaDRj/kuE/HW87Vgo/cHXOZltPluqIsxHeNGyrWqtB3uMpi2Z4cjsA==
X-ME-Sender: <xms:kYTSY6ylFQGGg_ywe_s2SuOXTR7IT08eOuHbClkCK1eSWEwU9uobSQ>
 <xme:kYTSY2QulhM0rMuturj0D0Y_HfcHqeng5dR7Tn5cirVS4-Lb8pdGAdQSG1w3Micos
 teEzr8stXQhVSAaw5A>
X-ME-Received: <xmr:kYTSY8XwL7gSbmS_4HoVEl9xNtEPbf_NmfClXs_Hwa895AOJ51ods9YPBROzWoTgp2jvufk0ForZfAxggENyq3kYAFCaIvA-TrpzdwuBBNGl6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfeutdejvdeiheffveetieejtdfhleekleffheejtdfhkeehfeekgedvgeei
 tddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kYTSYwjuOY9z6Tad0tG39JMhTOBvz8rqkUA9Ye4ATnSI2zqploChbw>
 <xmx:kYTSY8BNKaOxXPyQlAmkARYVyzgyxRfv77rtli8OzmaLvuPJQljLMg>
 <xmx:kYTSYxI3V0JDeb-APWobafb01wuYk3y08Op3_mZnW9b3TMw23uMkeQ>
 <xmx:kYTSY2wjXr6QEPgU5470oP7jIEyQgVyvnTbpBAj2Xe8nQn2TlmsEVw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 08:48:01 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 0/9] drm/vc4: hdmi: Broadcast RGB, BT601, BT2020
Date: Thu, 26 Jan 2023 14:46:35 +0100
Message-Id: <20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADuE0mMC/4WNTQrCMBCFr1KydiRJ1YIr7yEu8jOagTYpkxiQ0
 rs7eAFXj+/B996mKjJhVddhU4ydKpUsYA+DCsnlFwJFYWW1tcbqCXglSHEhoGXl0nHB3CqMEU3Q
 0TsbgxLXu4rg2eWQxM7veZYyUW2FP7+vbiTu/2a7AQ0Xb87PaToFM7pbQM7l2FB2H/u+fwH9JJJ
 nwAAAAA==
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2598; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=1Vb0fKsZ2vacyVeb1RTpG6gPYgxfRyxw4QIlRNR9Ngg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmXWpx5P8zukFS6d02/9ZDuJj7L02mb+ade/VvBFXBL5tRK
 u5uPOkpYGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjARmzSGH2unZ7E/X//m+NGMCwr9ul
 Xc9usfHv9RW/HW6ynLXI8Zjgz/tJgXPhf/26GmfPtvVbRkCcdj3aQlXCn22vXqZbvXhpqzAQA=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a collection of patches that have been in the downstream tree for a
while to add a bunch of new features to the HDMI controller.

Let me know what you think,
Maxime

To: Emma Anholt <emma@anholt.net>
To: Maxime Ripard <mripard@kernel.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v2:
- Added a new patch to convert every state accessor to container_of_const
- Added a comment to mention why planes don't need to be checked
- Removed vc4_hdmi.broadcast_rgb field
- Reordered the CSC swap and CSC matrices organization patches to make it clearer
- Link to v1: https://lore.kernel.org/r/20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech

---
Dave Stevenson (7):
      drm/vc4: hdmi: Add Broadcast RGB property to allow override of RGB range
      drm/vc4: hdmi: Rename full range helper
      drm/vc4: hdmi: Swap CSC matrix channels for YUV444
      drm/vc4: hdmi: Rework the CSC matrices organization
      drm/vc4: hdmi: Add a function to retrieve the CSC matrix
      drm/vc4: hdmi: Add BT.601 Support
      drm/vc4: hdmi: Add BT.2020 Support

Maxime Ripard (2):
      drm/vc4: Switch to container_of_const
      drm/vc4: hdmi: Update all the planes if the TV margins are changed

 drivers/gpu/drm/vc4/tests/vc4_mock.h        |   3 +
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c |   4 +-
 drivers/gpu/drm/vc4/vc4_bo.c                |   2 +-
 drivers/gpu/drm/vc4/vc4_crtc.c              |   4 +-
 drivers/gpu/drm/vc4/vc4_dpi.c               |   7 +-
 drivers/gpu/drm/vc4/vc4_drv.h               |  65 ++----
 drivers/gpu/drm/vc4/vc4_dsi.c               |  19 +-
 drivers/gpu/drm/vc4/vc4_gem.c               |   7 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c              | 343 +++++++++++++++++++++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.h              |  25 +-
 drivers/gpu/drm/vc4/vc4_irq.c               |   2 +-
 drivers/gpu/drm/vc4/vc4_kms.c               |  16 +-
 drivers/gpu/drm/vc4/vc4_plane.c             |   2 +-
 drivers/gpu/drm/vc4/vc4_txp.c               |  12 +-
 drivers/gpu/drm/vc4/vc4_v3d.c               |   2 +-
 drivers/gpu/drm/vc4/vc4_vec.c               |  14 +-
 16 files changed, 355 insertions(+), 172 deletions(-)
---
base-commit: 9fbee811e479aca2f3523787cae1f46553141b40
change-id: 20221207-rpi-hdmi-improvements-3de1c0dba2dc

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
