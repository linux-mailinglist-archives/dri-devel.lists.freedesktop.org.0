Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CC0B1BF58
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 05:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C5E10E71A;
	Wed,  6 Aug 2025 03:34:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bl9UvN1k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B2710E714;
 Wed,  6 Aug 2025 03:34:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0C0AD601F7;
 Wed,  6 Aug 2025 03:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B71D3C4CEE7;
 Wed,  6 Aug 2025 03:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754451264;
 bh=ZgLpn0RkxXS+6QqKuQSilpnYfvlfFjajaKMxreUiSDw=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=Bl9UvN1kUwMBKLHGp5XuK5DL6ATFs6DRpretX1ZpSOCOxBARTnmPySmsaSm/2qnGN
 mRQ4giRamkh5vC3aSh+AWp9N1dJueA/hUrAn2vujENkhR0Z/WOsXdh5as080DDExIV
 KTi6QtHO85L3IwgUFF8Y+3Yp4d8c1oUByXnXH9ihQ7TRfuEfh4xwcueVntumllGfo+
 /RWmIF+qrIx+7fy7YEdc3BZqYA3XnEG9i8kUYaZrkgeN8DM4H6iF+s7RdzSLWKfPBd
 T6PjF2+cjOCWbwhl27ceiaEutb+C/urSCkyKT+ZFRNCJZjxe4JUSGeCxV6b/NnSG5T
 IpkmPRhVh+a6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id A6F9DC87FD1;
 Wed,  6 Aug 2025 03:34:24 +0000 (UTC)
From: Cryolitia PukNgae via B4 Relay
 <devnull+cryolitia.uniontech.com@kernel.org>
Date: Wed, 06 Aug 2025 11:34:18 +0800
Subject: [PATCH] drm/amdgpu: fix incorrect comment format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-amdgpu_typo-v1-1-b5a3cb84ce26@uniontech.com>
X-B4-Tracking: v=1; b=H4sIADnNkmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwMz3cTclPSC0viSyoJ8XQsDCzPLJEMjo2RjMyWgjoKi1LTMCrBp0bG
 1tQACdEg2XQAAAA==
X-Change-ID: 20250806-amdgpu_typo-80869b122c36
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, wangyuli@uniontech.com, zhanjun@uniontech.com, 
 guanwentao@uniontech.com, Cryolitia PukNgae <cryolitia@uniontech.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754451263; l=1198;
 i=cryolitia@uniontech.com; s=20250730; h=from:subject:message-id;
 bh=k+gY44TRXxHS44Et5U7hyAbjjywRyysMNE2p/m6W2bk=;
 b=scrrcR+qucYdJOb23SqbCcLG/aPsSIlZavZRQjljyvWN3luE7E0YF0hYRvtsZC7q8Fb2wsGPL
 6J7+X73na1/CqDc0X1MznKWPaBxmB5oEOA62tx24u1QQCfiWEe5UnBy
X-Developer-Key: i=cryolitia@uniontech.com; a=ed25519;
 pk=tZ+U+kQkT45GRGewbMSB4VPmvpD+KkHC/Wv3rMOn/PU=
X-Endpoint-Received: by B4 Relay for cryolitia@uniontech.com/20250730 with
 auth_id=474
X-Original-From: Cryolitia PukNgae <cryolitia@uniontech.com>
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
Reply-To: cryolitia@uniontech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Cryolitia PukNgae <cryolitia@uniontech.com>

Comments should not have a leading plus sign.

Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>
---
 drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
index d5002ff931d841994ca2c70cdf5b989f5b3c59d6..860bc5cb03c81b5346743b5fb46a7dcbe5a201a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
+++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_4.c
@@ -151,9 +151,9 @@ static void nbio_v7_4_sdma_doorbell_range(struct amdgpu_device *adev, int instan
 		 *   BIF_SDMA0_DOORBELL_RANGE:  0x3bc0
 		 *   BIF_SDMA1_DOORBELL_RANGE:  0x3bc4
 		 *   BIF_SDMA2_DOORBELL_RANGE:  0x3bd8
-+		 *   BIF_SDMA4_DOORBELL_RANGE:
-+		 *     ARCTURUS:  0x3be0
-+		 *     ALDEBARAN: 0x3be4
+		 *   BIF_SDMA4_DOORBELL_RANGE:
+		 *     ARCTURUS:  0x3be0
+		 *     ALDEBARAN: 0x3be4
 		 */
 		if (adev->asic_type == CHIP_ALDEBARAN && instance == 4)
 			reg = instance + 0x4 + 0x1 +

---
base-commit: 6bcdbd62bd56e6d7383f9e06d9d148935b3c9b73
change-id: 20250806-amdgpu_typo-80869b122c36

Best regards,
-- 
Cryolitia PukNgae <cryolitia@uniontech.com>


