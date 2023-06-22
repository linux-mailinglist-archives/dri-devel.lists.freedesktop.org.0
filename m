Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AE573981E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 09:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 580E510E4E5;
	Thu, 22 Jun 2023 07:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 322 seconds by postgrey-1.36 at gabe;
 Thu, 22 Jun 2023 00:52:09 UTC
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF31110E145
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 00:52:09 +0000 (UTC)
Received: from submission (posteo.de [185.67.36.169]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 996FB240027
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 02:46:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1687394804; bh=VKO5kAlvwT2Tg2zsi0T5+7i3uYFbcdeRVjfmpdaksA0=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:
 Content-Transfer-Encoding:From;
 b=a/oEtG0KJ+MdDAU6YvpoP+NjHlFRoZMzls3XOuzZJ+XQ1E/UujAIOUkEiwxLBgUxi
 yuBZMD8dHkENO03ShRf+cCrvF3nyBp9cDORJF29oCaGsFqFXgc8/n4gJi4SD4jhdvI
 ckcitvlwfasYJuKUDn713StJ2qZ10FvM6MuetM8W+4tsEqq301jMozkfY2ZDuEFm9J
 bZyc9NpkiUZy8Ecv5ouiy4uSQSOeoR/jIgRI0fEyjHWlvqe4jYY0gekq6O4foXc8GZ
 6s1KdL4I6ii5aqN34wazqSbDSZSOC1IXijjZGr/Y2kTy/tZHWKZtHACAPswz1MD3kt
 Z6vdyjBOxlBbw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4QmhX10KDVz9rxL;
 Thu, 22 Jun 2023 02:46:40 +0200 (CEST)
From: Yueh-Shun Li <shamrocklee@posteo.net>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amd/display: fix comment typo
Date: Thu, 22 Jun 2023 00:42:27 +0000
Message-Id: <20230622004226.7177-1-shamrocklee@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 22 Jun 2023 07:32:28 +0000
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
Cc: Yueh-Shun Li <shamrocklee@posteo.net>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Spell "transmission" properly.

Found by searching for keyword "tranm".

Signed-off-by: Yueh-Shun Li <shamrocklee@posteo.net>
---
 .../gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
index 0278bae50a9d..45143459eedd 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hpo_dp_stream_encoder.c
@@ -154,7 +154,7 @@ static void dcn31_hpo_dp_stream_enc_dp_blank(
 			VID_STREAM_STATUS, 0,
 			10, 5000);
 
-	/* Disable SDP tranmission */
+	/* Disable SDP transmission */
 	REG_UPDATE(DP_SYM32_ENC_SDP_CONTROL,
 			SDP_STREAM_ENABLE, 0);
 
-- 
2.38.1

