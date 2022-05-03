Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C29C35183FE
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B6110F76C;
	Tue,  3 May 2022 12:13:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0ED410F76C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:13:52 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 63279320098C;
 Tue,  3 May 2022 08:13:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 03 May 2022 08:13:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1651580030; x=1651666430; bh=sv
 TxL8uNAr19t7v6+3OIHon2dv9U1c1TfS/m8XQSAvI=; b=It8ADgzqpYoRjks9Q7
 Ox/SI6eaLWjOlKPvE/Iau89g/O63OR1Z7cBvgULkLIeyaJfhaFDOLjis7mQzJZMK
 9hDhpmq9wJQCZ94G0l75lOILSwJDN8QuQU+9rQoOb572mf0EI9s35PHN+1mSLmYs
 MPcpPO4H86WWSQc+3r8dHJZx2JEtY2iaB74NR7z9v+zBU8NmcAOsJPN94SbvOZdy
 eRQXIs5bDDRfcBx2NYp5gAcazYYYbC3bZVlfBwNvZiJz/i8Igd5HuPidj46/77W+
 iqW/OwRDyIlFnOLjtJPgGYK3nq/bzagp7Iz6Yrr/L2txLIY2deNnWb7sxdFCnqd1
 I+Kg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651580030; x=1651666430; bh=svTxL8uNAr19t7v6+3OIHon2dv9U1c1TfS/
 m8XQSAvI=; b=QT6oAMuLG/PbacSSLgR5xMMrtlCoTS/yCVxUoZ4/HAj4QzgHfOn
 m3FtuA8F5mzOHkGwvQPPZOQb4q6J1aKn3Hfyz4glAVUuEfXYo1GBaz8QjTkTXW+W
 pZovByM5DhOQ+/qui3bBXpboeBeGQsRiwyUTmGuG/E7eJdvxUuHPyjgus/fSbaIe
 82zP9nXOSE8MtEqMTtqOowEU8kJl+IrrFeEJLG7z8Q/P5EPuX6mTDged98VK+wUB
 aZpubSNjvaB7Qs2TE+61aG8XNTusgPR25mtWOTzZfxyzczf8yVksDld5MJU6/j9k
 vpM5AyUwS8TDJZdECVXKRa2Csu6cpbimaoA==
X-ME-Sender: <xms:fhxxYud5F3_IqkxY_Ikr-kYw0okHGlw7T4bPBMgpFO3HzCPs2KCWtw>
 <xme:fhxxYoONbi9tL3UJbNBgIWvUfjFFJnVS1MXQXNTR1OskBIYen6WtrCCMFMsEwWB_O
 1K7hGyWywbcEyOqxqI>
X-ME-Received: <xmr:fhxxYvhKWotFtDVIyzJv0Ua7xb4SbR-PbMiPNFcxSmt9dwInj3zQbxAgTaHHEgu2zZT168JK8T2eRiD4b1Lu46-doXfmMYi8lnYSt00>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
 jefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:fhxxYr8nUOak1ZFG_DFfqpVwD_tm3c_j4CGk2xzfvw6D3KEm76QSCQ>
 <xmx:fhxxYqtKLpZAuE2I480wpnkqNZdoVNIxysBCEFBrPdtngsBgeSLujQ>
 <xmx:fhxxYiEJVin_MWmiV7a9BwbcK7iuIATNAUK6YFexx_kHASl6RabURQ>
 <xmx:fhxxYsU8AqnrnwE5pzqMy6a7Caj50tjZHYGF8YK_yskghOF1n43dbw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 May 2022 08:13:50 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 01/14] drm/vc4: plane: Prevent async update if we don't have a
 dlist
Date: Tue,  3 May 2022 14:13:28 +0200
Message-Id: <20220503121341.983842-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503121341.983842-1-maxime@cerno.tech>
References: <20220503121341.983842-1-maxime@cerno.tech>
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
2.35.1

