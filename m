Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E770FB55E93
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 07:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C92C210E1EC;
	Sat, 13 Sep 2025 05:31:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fastmail.com header.i=@fastmail.com header.b="nDCInszP";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="PotKFIAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 554 seconds by postgrey-1.36 at gabe;
 Sat, 13 Sep 2025 05:31:12 UTC
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B49310E0D5;
 Sat, 13 Sep 2025 05:31:12 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 1E7E2EC01DD;
 Sat, 13 Sep 2025 01:21:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Sat, 13 Sep 2025 01:21:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm1; t=1757740918; x=1757827318; bh=cktaq3vi6+QiWEhOgyfud
 QrPSODKg6pOr7hfniZrmPA=; b=nDCInszP3qlTONwSl+o1k2WggCNFldeqwQX/I
 qhy036AdXI6l+B3NDFA1HPye76TpP8G3kOL8A0cKrUUwezolWz65bRQN0/622yLF
 cig+EZaGdNArbTidaSGbZQ8j0wZQH6dVwNJTfwamqg9tV2PhIJvYA87JUE9BJRiZ
 ZyCNG14xFESjNMPD4xj+uNcX9KjA79toBg1edahcbuCW2qkuBqxZnMrL5mhAuhAb
 pwruJtU/AddAzwZr1SuC5wPrpGjQtyjyV15ULIkehWUQe0c91rxzT+q8dh4cVilj
 Wpy2vQnoN7rh3OEB4PySEqjMuiFecSnIw1Yc4VDY3kDhx6CtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1757740918; x=1757827318; bh=cktaq3vi6+QiWEhOgyfudQrPSODKg6pOr7h
 fniZrmPA=; b=PotKFIAzHkCqBRaxewaROMabGVHPnw9CzHn6CIwzfzIHpqaophi
 /W1rVi3qkUP+krKtbKNDv7o7oIO6NxfX6nHWKSTVPKkeyDvicun9O/2lTDZV9xzH
 PzxzIRdTKy+GavRUGVYH2b7nqTXmJv3obQYZkZXo1rLgpOxv18mEeWdxqNQfi0kr
 KKzvhJqd2KHENxdXoIec9OeUokEow5UDs5XykfMta3FU5uu5ItPY2klH+HjudR5H
 9MhvzBBm0TqFT3pKo2GTw8Grt9fFCMRrZZRvt0p3f0g2xCwb7q/Ke3TrTKaDvHym
 bW7plyMvdhPdc0aNuQgjXbot52eT5UjMY0w==
X-ME-Sender: <xms:df_EaETEC2ZxHUmZJDRMaGzwYJpg0kOIwU5ujwTf1N_DKolHIXx7FA>
 <xme:df_EaCYZ60wDaxwlket6mK-QhtJQ6OD0Tsh62-E0qBb0-koH9Ri7Ion5RZZmx5_Vb
 PZgr_gxclWXrdPDjnw>
X-ME-Received: <xmr:df_EaM-oS3JmKBKEOggUm1Prkv-eCFwO8t4k7jg2MjrxuGlgrqkksSbOCwAWtTf3Y4RzQIoQ6xd7j2kq7GnjmDQvzPxo8Hs0W83DGZbzN0ujeco1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefuddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtredttd
 enucfhrhhomheplfgrmhgvshcuhfhlohifvghrshcuoegsohhlugdriihonhgvvdefjeef
 sehfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhephfevgfekiedutdduhf
 eggfeivdeuhfehtdffjedttdefkeeifeeijeevtefhgeehnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsgholhgurdiiohhnvgdvfeejfeesfh
 grshhtmhgrihhlrdgtohhmpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphho
 uhhtpdhrtghpthhtohephhgrrhhrhidrfigvnhhtlhgrnhgusegrmhgurdgtohhmpdhrtg
 hpthhtohepshhunhhpvghnghdrlhhisegrmhgurdgtohhmpdhrtghpthhtohepshhiqhhu
 vghirhgrsehighgrlhhirgdrtghomhdprhgtphhtthhopegrlhgvgigrnhguvghrrdguvg
 hutghhvghrsegrmhgurdgtohhmpdhrtghpthhtoheptghhrhhishhtihgrnhdrkhhovghn
 ihhgsegrmhgurdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomh
 dprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtghhpdhrtghpthhtoheprhhomhgr
 nhdrlhhisegrmhgurdgtohhmpdhrtghpthhtoheprghlvhhinhdrlhgvvgdvsegrmhgurd
 gtohhm
X-ME-Proxy: <xmx:df_EaMnkX9_BzM1hn7sVx7e7J8h7FzBTpPjZwE7Mkw9nxaw3IcRu9g>
 <xmx:df_EaBZfYC6HwZDogcSAPTk8aQD2nQTzmAq_wHb990HPYZvUqDV1cg>
 <xmx:df_EaEPIDyXRVfS9JhHrL0CyyQQWmUcl-aPx6-xuEJLqYixY9Cp5Ag>
 <xmx:df_EaJe07oxiZKvc0aqTCgKB-oPbczexXkXqZCRW8LZAVzYWn67bqw>
 <xmx:dv_EaB-2Kp6Y4uGFk_hB7uVwUzSqzWlZSkXuX_xmPUP2LHAerFQrotjl>
Feedback-ID: ibd7e4881:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Sep 2025 01:21:54 -0400 (EDT)
From: James Flowers <bold.zone2373@fastmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, roman.li@amd.com, alvin.lee2@amd.com,
 skhan@linuxfoundation.org
Cc: James Flowers <bold.zone2373@fastmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drm/amd/display: Use kmalloc_array() instead of kmalloc()
Date: Fri, 12 Sep 2025 22:19:52 -0700
Message-ID: <20250913052109.2638-1-bold.zone2373@fastmail.com>
X-Mailer: git-send-email 2.51.0
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

Documentation/process/deprecated.rst recommends against the use of kmalloc
with dynamic size calculations due to the risk of overflow and smaller
allocation being made than the caller was expecting. This could lead to
buffer overflow in code similar to the memcpy in
amdgpu_dm_plane_add_modifier().

Signed-off-by: James Flowers <bold.zone2373@fastmail.com>
---
I see that in amdgpu_dm_plane_get_plane_modifiers, capacity is initialized to 
only 128, but it is probably preferable to refactor.
 
Tested on a Steam Deck OLED with no apparent regressions using these test suites from
igt-gpu-tools: 
1) kms_plane
2) amd_plane
3) amd_fuzzing
4) testdisplay 

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index b7c6e8d13435..b587d2033f0b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -146,7 +146,7 @@ static void amdgpu_dm_plane_add_modifier(uint64_t **mods, uint64_t *size, uint64
 
 	if (*cap - *size < 1) {
 		uint64_t new_cap = *cap * 2;
-		uint64_t *new_mods = kmalloc(new_cap * sizeof(uint64_t), GFP_KERNEL);
+		uint64_t *new_mods = kmalloc_array(new_cap, sizeof(uint64_t), GFP_KERNEL);
 
 		if (!new_mods) {
 			kfree(*mods);
@@ -732,7 +732,7 @@ static int amdgpu_dm_plane_get_plane_modifiers(struct amdgpu_device *adev, unsig
 	if (adev->family < AMDGPU_FAMILY_AI)
 		return 0;
 
-	*mods = kmalloc(capacity * sizeof(uint64_t), GFP_KERNEL);
+	*mods = kmalloc_array(capacity, sizeof(uint64_t), GFP_KERNEL);
 
 	if (plane_type == DRM_PLANE_TYPE_CURSOR) {
 		amdgpu_dm_plane_add_modifier(mods, &size, &capacity, DRM_FORMAT_MOD_LINEAR);
-- 
2.51.0

