Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4F2AA5AB4
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 07:58:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9106C10E1B9;
	Thu,  1 May 2025 05:58:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fastmail.com header.i=@fastmail.com header.b="O+4pzBF6";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="G7EhpQ0o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A7510E1B9;
 Thu,  1 May 2025 05:58:06 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 3C59B138016C;
 Thu,  1 May 2025 01:58:05 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Thu, 01 May 2025 01:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm3; t=1746079085; x=1746165485; bh=wBa+/RP16JDDqe808w2hJ
 uVvdiTrgtxeTmMlzvStV40=; b=O+4pzBF6r2WKZ6eDqs4LiUxjDiAFVOdEmok09
 jA/7ww3vcBznOPaaPG29NjxpdgJeWOfpD+BLwhfKlKCrif/NnDeyr39/MZY2V3F9
 Id+rA90HTNki3aW4NI2FdJA6V71kejBhHkkpzWRwfsrtfc2oWe2nfXUSX3Z9SNDB
 BPSKFaEEFlJifczqymEKam4/6yaoJIB6ygKlBprcvZGj8rbi83ffjsdJabDl3SzI
 psoAiJX1gM1gcno0hNyi5OpE1AFw48emJGfw2XZwLNSC78Th4TnSHSA2S1Xl3R66
 7NinxDbdZJlX6Disz1xP3IMT2LGXliy7bs2EYiEoIkiqz2LAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1746079085; x=1746165485; bh=wBa+/RP16JDDqe808w2hJuVvdiTrgtxeTmM
 lzvStV40=; b=G7EhpQ0oiQ1g3Euw64aaUrqs7YLmf4yu1Y10PaBGxdjonTZBCeB
 jVCkjnXHhVWnMWr06RJAHjD6Q8tMZh5RnXvSY4hE3BNKyG7pk/ZpUNt5IelBbREk
 LZuEtuZBFJERMyUCTZOgNng2SoM+Kp3Q8Lm+zo2vNeBvQ47Cm3BBHjhMeCQx1CO6
 EoPbOR9bly2LVT+qXT3GbFeVKnach1pWDwLYyannk6MVTw6ABE/6gnZqPIByp1A8
 7wjfNIcpXcjVflU6uxi+/ZsDAcqS7GK5FjuIyujAAoj45GpO/i2+d5t+cqiHw7KM
 MnREZOXi55Sbq9WhAZYIU4MI9nncHAy3LnA==
X-ME-Sender: <xms:bA0TaFzjQFUxAkSNbdVtIXXAURJuVg7S067NYNGLrqQ5uGpkWFslTA>
 <xme:bA0TaFSSq0F6TlSfQ9_j50eUzpHgIJA6c0uWt3zmLoUmFujO-mHJcWWic8gUewqOa
 uctuvJOiyOvvS1WtJo>
X-ME-Received: <xmr:bA0TaPUdVdDaYFlwgIsj2372EtaI1wAxBqAeVpwmeYX8XZ2sLLmGXP2CVJTs1QvkF0mTmkTQaFXJEH7-C_gsyJ8vbw6ywQbPIh_876oWi3IIRYtE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieekjeelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvf
 evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflrghmvghsucfhlhhofigvrhhs
 uceosgholhgurdiiohhnvgdvfeejfeesfhgrshhtmhgrihhlrdgtohhmqeenucggtffrrg
 htthgvrhhnpefhvefgkeeiuddtudfhgefgiedvuefhhedtffejtddtfeekieefieejveet
 hfegheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 gsohhlugdriihonhgvvdefjeefsehfrghsthhmrghilhdrtghomhdpnhgspghrtghpthht
 ohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhrghrrhihrdifvghnth
 hlrghnugesrghmugdrtghomhdprhgtphhtthhopehsuhhnphgvnhhgrdhlihesrghmugdr
 tghomhdprhgtphhtthhopehsihhquhgvihhrrgesihhgrghlihgrrdgtohhmpdhrtghpth
 htoheprghlvgigrghnuggvrhdruggvuhgthhgvrhesrghmugdrtghomhdprhgtphhtthho
 pegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopegrih
 hrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhl
 rdgthhdprhgtphhtthhopehskhhhrghnsehlihhnuhigfhhouhhnuggrthhiohhnrdhorh
 hgpdhrtghpthhtohepsgholhgurdiiohhnvgdvfeejfeesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:bA0TaHhL54XvezQvlBAWiJMLYQ4lLem4cvTj-Kqy8k02jJWwxr_gmQ>
 <xmx:bA0TaHC2LLAW81q9rRvrJidjUSTsavhB4nxQI9BVFMTOeU60J1qvzg>
 <xmx:bA0TaALqGP8q3C4Yq-Me_ZeYCIJ9Q5dqX6VtlhTSJnAbA8CarJsd6g>
 <xmx:bA0TaGAAT-haECyx6lviJ9lgFvQ2sRihNoE9j0omVHuJX7_lElxLiQ>
 <xmx:bQ0TaE3y3NlLynx7EDoKHNooBBNKkY5U1x5iIfJ0jXc7RA-bx9kKeyfg>
Feedback-ID: ibd7e4881:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 May 2025 01:58:02 -0400 (EDT)
From: James Flowers <bold.zone2373@fastmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, skhan@linuxfoundation.org
Cc: James Flowers <bold.zone2373@fastmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: [PATCH RESEND] drm/amd/display: adds kernel-doc comment for
 dc_stream_remove_writeback()
Date: Wed, 30 Apr 2025 22:56:42 -0700
Message-ID: <20250501055701.2667-1-bold.zone2373@fastmail.com>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adds a kernel-doc for externally linked dc_stream_remove_writeback() function.

Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index 0478dd856d8c..060ee6c3fc2e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -552,6 +552,14 @@ bool dc_stream_fc_disable_writeback(struct dc *dc,
 	return true;
 }
 
+/**
+ * dc_stream_remove_writeback() - Disables writeback and removes writeback info.
+ * @dc: Display core control structure.
+ * @stream: Display core stream state.
+ * @dwb_pipe_inst: Display writeback pipe.
+ *
+ * Return: returns true on success, false otherwise. 
+ */
 bool dc_stream_remove_writeback(struct dc *dc,
 		struct dc_stream_state *stream,
 		uint32_t dwb_pipe_inst)
-- 
2.49.0

