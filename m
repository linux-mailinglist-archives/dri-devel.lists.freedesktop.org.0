Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D2DAA82FC
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 23:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A451710E227;
	Sat,  3 May 2025 21:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fastmail.com header.i=@fastmail.com header.b="UpORUabr";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="noE3qTIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6653710E227;
 Sat,  3 May 2025 21:19:20 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 26924254013E;
 Sat,  3 May 2025 17:19:19 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Sat, 03 May 2025 17:19:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm3; t=1746307159; x=1746393559; bh=Un/bt6UrGtVYI4PFhsLl7
 CgrGuxCoSHY1s4qLoGbllQ=; b=UpORUabrLd8cN76Jaq6K2gkqwM7By3HBukQma
 oUYNv0zXHW7u1PBaHzM7HW5affDXjNZ6QxE9keHf3gIm8NH6qgOL9SDjyMWEaLmp
 DX4ZwEu064lFTe0tzfIvhlf6z6A+oza0qbmWRUlVXRyhgXQYu5cuQf1JBnwoWeAj
 br+/0Xw5ccuojAyfUM0UAbPJ9lBhHxF2BeFGiAz5neZ/7F+9cMaUc4TW5aw1mOKW
 UUALRcAuacdYt5NWiNGFgdMiqtDbtGx7Z4NAlsEku7p6/u/FQEARs1Ph7vILrU4M
 PtH8XOVHSEX176ZtdQLQjrK/nA+WMFZuc8j8ITV3PsugRLsdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1746307159; x=1746393559; bh=Un/bt6UrGtVYI4PFhsLl7CgrGuxCoSHY1s4
 qLoGbllQ=; b=noE3qTIfgRvJF1xbUDmZjlGPJqUtmlmmzmNHLBHNmKeseXZUH99
 MhnejinCiEDwlQGxPa4qlDqYHKrUA0UofCwvHMRMLOw3isU0NbLSHAA2qZJ9mc9C
 9Oxu+uZB8RTi1ucJJ+2VLtFf5Vu+DPI+TzagPShBeYonJ+tTVmdS59jq92190p4w
 3IaYsaObLcT9m65qyGCCiAqnBDCXE9osT5V8mCI6sNjb8pFu3H08/hPtWqxPX/4r
 gyMF4sJJgblnP+yfl1S1FV2pdGHB++60UqGGbohd2AGqufg51HA4RNFAnHHfgIv/
 h6IZbJYvanDUz0+yY38Xwn/flEc4+ACLqgw==
X-ME-Sender: <xms:VogWaMuH_f-vO3iJMZCF0uUZlGFNoJi-rDgUdE_2klNulzM8XkZJfw>
 <xme:VogWaJdPDUhJkqOu_SPXr92ZC2z0BApsMm_PUKDHSYwij04eAfx9lbAOiu5UqMFhi
 bx-5OJNsu3K3LmCoPI>
X-ME-Received: <xmr:VogWaHzlwOtLlAxTcG6J8wE3FZOYiyPgHK_CGYXnrQ5qjJnW6jjN0JdDiQLNPRffUiFp9cwTwqt5q4mOA69jlx9Ev2VNDRET9Y-tFFLbhcxsY1pU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeeifeelucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvf
 evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflrghmvghsucfhlhhofigvrhhs
 uceosgholhgurdiiohhnvgdvfeejfeesfhgrshhtmhgrihhlrdgtohhmqeenucggtffrrg
 htthgvrhhnpefhvefgkeeiuddtudfhgefgiedvuefhhedtffejtddtfeekieefieejveet
 hfegheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 gsohhlugdriihonhgvvdefjeefsehfrghsthhmrghilhdrtghomhdpnhgspghrtghpthht
 ohepudeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehhrghrrhihrdifvghnth
 hlrghnugesrghmugdrtghomhdprhgtphhtthhopehsuhhnphgvnhhgrdhlihesrghmugdr
 tghomhdprhgtphhtthhopehsihhquhgvihhrrgesihhgrghlihgrrdgtohhmpdhrtghpth
 htoheprghlvgigrghnuggvrhdruggvuhgthhgvrhesrghmugdrtghomhdprhgtphhtthho
 pegthhhrihhsthhirghnrdhkohgvnhhighesrghmugdrtghomhdprhgtphhtthhopegrih
 hrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhl
 rdgthhdprhgtphhtthhopegrlhhvihhnrdhlvggvvdesrghmugdrtghomhdprhgtphhtth
 hopeiirggvvghmrdhmohhhrghmvggusegrmhgurdgtohhm
X-ME-Proxy: <xmx:VogWaPOJggpnPRy39gdK-KmQ1lH-vrPZCA_Q0myv6HK8vhG5tK-81A>
 <xmx:VogWaM_SzOP117tFfJ1ArzIaxdsWp-Qh2InRVKwDbzeCXsFPfu0f3g>
 <xmx:VogWaHVYVl2__DEJXwZ2AEln8aPqwAFiM1PP73GXA09lopxGJB8xQA>
 <xmx:VogWaFdZtsW59lP3kU3fTGc8PQpvp4HSy31odCNxts-iQA4ENVwTiQ>
 <xmx:VogWaKrZt3rFDrJvHAiEGqVBDy7aqY01UZpTRjDteXaGD9Ahhy5hfsnv>
Feedback-ID: ibd7e4881:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 May 2025 17:19:16 -0400 (EDT)
From: James Flowers <bold.zone2373@fastmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, alvin.lee2@amd.com, zaeem.mohamed@amd.com,
 alex.hung@amd.com, skhan@linuxfoundation.org
Cc: James Flowers <bold.zone2373@fastmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] drm/amd/display: adds kernel-doc comment for
 dc_stream_remove_writeback()
Date: Sat,  3 May 2025 14:18:51 -0700
Message-ID: <20250503211902.70141-1-bold.zone2373@fastmail.com>
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

Adds kernel-doc for externally linked dc_stream_remove_writeback function.

Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
---
V1 -> V2: Corrected checkpatch warnings and errors

 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index e6e41678525f..b883fb24fa12 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -569,6 +569,14 @@ bool dc_stream_fc_disable_writeback(struct dc *dc,
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

