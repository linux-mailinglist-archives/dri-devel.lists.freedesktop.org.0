Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A792E6ABD45
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 11:49:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14DBB10E219;
	Mon,  6 Mar 2023 10:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB7EE10E1EE
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 10:49:42 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 331065C01BB;
 Mon,  6 Mar 2023 05:49:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 06 Mar 2023 05:49:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :sender:subject:subject:to:to; s=fm2; t=1678099780; x=
 1678186180; bh=q4ovOrCsKz1xIMfq6VOqlmn5ZsRe2oL7RgsUcVVSluQ=; b=O
 S085PlgQgX/nnFBT6AGiA4YkGL9Z5TSi874M3KbNFw+NFHkkW7g8fe6qbEM/xmz9
 DH3AOq8zmNW0g9L6Tijf8tNe2lmhKVcQiCyKrQj22YlC2xBKNHAjUQ3eklr0jYJD
 VfASsLFlHtYwGjDlCmkCDrFTTjLUNBicm95zoXy7dhIWcNcW9hMU+EAYVa/GJwue
 enWYzLR1b7oqVG5F5siV7nGj92Ln3eblWXnIzRD7B5KDdC/92CGTsAlBTHZu5kNo
 1V49UoxBcLesMAs6VFr5oKkYzGbhDsg+44VAzCeSwKF9IaYN3NqoOs41+XOnsw2A
 1LHfYv45iqkuD/MUMQ7DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1678099780; x=1678186180; bh=q
 4ovOrCsKz1xIMfq6VOqlmn5ZsRe2oL7RgsUcVVSluQ=; b=jFoeWdKeMuqbkxk6d
 ZP4A9P1SwfPw25hFhW7MRv5wzIELrAoK22mamkJTyZGp0v5zI18V3D6YEcJ00i02
 QFBldhtzvoMSd38n7iCn0UwUYexvWmXrL4NRl0ISq95wsV8VpvB5mFIZ/g+OEru6
 MXWdiHXjRRNA9LsuXx8HUatfQjLmxCeaI1toMyFonytBZJ6pPckodFXA7B3Rf/Zq
 LKnyyz0TYLp+21vnAlhzVQwKc1fngiLnyXytI18Tg/SGlahv29k22mqiHq1/ciPK
 BaI3Dq5+Nt2iMkUNPCNgY9mpTUdlVWOCMwDlL1GUxPMW6uxRTj9CGbcun7yhGseM
 2EObg==
X-ME-Sender: <xms:Q8UFZDhRJf7_5Xvxd4o8n8M6mW1WrJjkwQpxBJ25_rWSeJyVbzOO1A>
 <xme:Q8UFZAABcnTWVCwme6Rq2yzRe9ydzxRpe4RqnSlHtfZXj-tcKGnZ55H47dqSCO4qp
 vxCCZv1TUWSNCqGpsI>
X-ME-Received: <xmr:Q8UFZDHF0OQIfP493WJl4EWle4td9Gk-7JEuQE-UXmrt8B8V2PYTJf5vWdlPNiUaTmPNypDreDIfDgiXTF2N8OM6_1FxeUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtiedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfeutdejvdeiheffveetieejtdfhleekleffheejtdfhkeehfeekgedvgeei
 tddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Q8UFZARoHYp4glZWXibcDbmTqNa6KkdYhvN5Ked4X6206Fsha2xrGg>
 <xmx:Q8UFZAym7NEUqYgWZS3UCBjGEFUHFsRKKLRUFOO-DZSY-vZus1HXuQ>
 <xmx:Q8UFZG4X6Prm0-wuCM7c-WvsVndFMP7rL56Fw_CnfLC2WLvs4ExphA>
 <xmx:RMUFZBoWXxkIqs33uU74zgXzSPRw6Zk_HCG5TFT8SVMqknRb5kL4Vg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Mar 2023 05:49:38 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 0/9] drm/vc4: hdmi: Broadcast RGB, BT601, BT2020
Date: Mon, 06 Mar 2023 11:46:41 +0100
Message-Id: <20221207-rpi-hdmi-improvements-v3-0-bdd54f66884e@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJHEBWQC/43NzwrCMAwG8FcZPRtpM3XDk+8hHvon2sDWjXYWZ
 OzdDd486Sl8Id8vqyqUmYo6N6vKVLnwlCS0u0b5aNODgINkhRrRoO4gzwwxjAw8znmqNFJaCrS
 BjNfBWQxeSdfZQuCyTT5KOz2HQZaRyzLl1+dXNTKuv9hqQMPJmeO96w7etPbiKadpv5C4NyEr/
 sWgML31hKGXQxu+mG3b3lM7HXIHAQAA
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2265; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=25IYmcfQdR7HII8ziNWw1kuesEjMVsnC13rHxR+abUU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCmsR6bbyU8uFH/s8Dcu/av7ji06R6I/mTCc+Kyfrj7FLW9F
 wN11HaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIRzmG/0F7rpqcub9h9+X6lskXzp
 ySnO6TvbtM2CFb+MzPRzl237gZGZbJzVrw64FYpAbbkpfVcg5vtlQmbPt8KNvkju1c14kGvCwA
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a collection of patches that have been in the downstream tree for a
while to add a bunch of new features to the HDMI controller.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
Changes in v3:
- Convert only helper functions to container_of_const but drop the
  direct calls in the driver
- Link to v2: https://lore.kernel.org/r/20221207-rpi-hdmi-improvements-v2-0-8ace2d8221ad@cerno.tech

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
 drivers/gpu/drm/vc4/vc4_dpi.c               |   7 +-
 drivers/gpu/drm/vc4/vc4_drv.h               |  65 ++----
 drivers/gpu/drm/vc4/vc4_dsi.c               |  17 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c              | 336 +++++++++++++++++++++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.h              |  25 ++-
 drivers/gpu/drm/vc4/vc4_kms.c               |  16 +-
 drivers/gpu/drm/vc4/vc4_plane.c             |   3 +-
 drivers/gpu/drm/vc4/vc4_txp.c               |  12 +-
 drivers/gpu/drm/vc4/vc4_vec.c               |  14 +-
 11 files changed, 341 insertions(+), 161 deletions(-)
---
base-commit: dc837c1a5137a8cf2e9432c1891392b6a66f4d8d
change-id: 20221207-rpi-hdmi-improvements-3de1c0dba2dc

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>

