Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E18546604
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 13:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4116110EBD4;
	Fri, 10 Jun 2022 11:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCC510EC11
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 11:51:57 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CE8ED5C0121;
 Fri, 10 Jun 2022 07:51:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 10 Jun 2022 07:51:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1654861915; x=1654948315; bh=2o
 CqFfBN6r/lbT0HHl3bQsJYZZGcdGw0InLFP7cfkc0=; b=eJctbeYYJmF58o0BKn
 LvW1ZR3QW2+RsaNN7DJpMAOa+QSosnW9VvcDS+9gQb1knNr9Vu4db0MslIumjpOt
 T39MWqPtNLIgvbomL6abVCArViK1u1ZetXljKBEBwav7uJuK7kwaHRZafizl02Kt
 eRHe1yAHWbF56qA/vfBiNVXHfBATZiyNGDqbgiFifiEtkHnaMAkZsHodCyzpiZCC
 LR0baBVVfx8WGKEtUh9bcmIPd01/fMBCA+Zb0EoQF+5HL4ASdbwsI8zpNs05YKc7
 DYPmp/byL6R4d1cS6eNeuNVoTPeayeURKZFl7GifmmSXIoxbtOAzl6gl7gA+934G
 yV2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1654861915; x=1654948315; bh=2oCqFfBN6r/lb
 T0HHl3bQsJYZZGcdGw0InLFP7cfkc0=; b=nTBGfXlxJxG0V65YYzZpoP1aw9vT8
 IDjVoiHJ5Ae4zeJjMCpnZoVi11szPOzobldE2YK6DEPSx2BuE1U7wrZPdrIUiymu
 WuQbxKPQyYeUKrglh9/ZEpfsG76kcbZSu6eknSn2qXSh73dxsK9SBQQM4CVqI76M
 j8eZAHKfcvdoDWoXjZoFCiAQyJFrG8KN3t7P7IshCbUM8iqGnk1gbuM9R9bng/uX
 X004PZah6rVrFFhifTOe5dYVerbmU5apvkY79YBYlVE5qy/OM06jlmip7LNi/rmy
 B9n63ZAzS0yzHAUB0S2mBTg3bsPGX3FLXGhxfCOFVCR33JcTj9GOU0NuA==
X-ME-Sender: <xms:WzCjYiInHm9YEd9CBYD20XTJgAJrM7PfggC8d0OUHpvkyXMLaEHH5A>
 <xme:WzCjYqJRTT72JwtaK9ILmOty9ve5kI-VxYfTi-7zVTfeYMKFO4NbpTS_I-3OHSnaD
 gkeUEjKrh3dV0BNA5w>
X-ME-Received: <xmr:WzCjYium-7KiVQ2u3sVXV7_Ygv2Y9gyAy140rOzcZ7KguDZ2nBsu4OZgwMlouJiEQ2jxJ4E06oKNq5RhEzFmK4OE7ie506NcSqVa2iI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduuddggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:WzCjYnbO9wr9eian-QCjdjUDmuSUSwlxrnuNRVel9PgMeVr46va3xg>
 <xmx:WzCjYpawDDQmd7DRPly4GCobmZO5OrkBn_gJFs4gIq2mbgj1dgX8Gw>
 <xmx:WzCjYjCQPO-7aplqZQ16Ec56E3ETJHtz0RUtsA3yHkVQe6_YMQGztA>
 <xmx:WzCjYszVlWTf441IQgjbr9RRhMap5ZeQa4auxUBzE1MYkJ8r0-eyuA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Jun 2022 07:51:55 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 01/14] drm/vc4: plane: Prevent async update if we don't
 have a dlist
Date: Fri, 10 Jun 2022 13:51:36 +0200
Message-Id: <20220610115149.964394-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610115149.964394-1-maxime@cerno.tech>
References: <20220610115149.964394-1-maxime@cerno.tech>
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
Cc: Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4 planes are setup in hardware by creating a hardware descriptor
in a dedicated RAM. As part of the process to setup a plane in KMS, we
thus need to allocate some part of that dedicated RAM to store our
descriptor there.

The async update path will just reuse the descriptor already allocated
for that plane and will modify it directly in RAM to match whatever has
been asked for.

In order to do that, it will compare the descriptor for the old plane
state and the new plane state, will make sure they fit in the same size,
and check that only the position or buffer address have changed.

Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index b3438f4a81ce..811a2d004cc4 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1321,6 +1321,10 @@ static int vc4_plane_atomic_async_check(struct drm_plane *plane,
 
 	old_vc4_state = to_vc4_plane_state(plane->state);
 	new_vc4_state = to_vc4_plane_state(new_plane_state);
+
+	if (!new_vc4_state->hw_dlist)
+		return -EINVAL;
+
 	if (old_vc4_state->dlist_count != new_vc4_state->dlist_count ||
 	    old_vc4_state->pos0_offset != new_vc4_state->pos0_offset ||
 	    old_vc4_state->pos2_offset != new_vc4_state->pos2_offset ||
-- 
2.36.1

