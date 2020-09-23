Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBFA2752AB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 09:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 403626E47B;
	Wed, 23 Sep 2020 07:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AC66E42E;
 Wed, 23 Sep 2020 03:42:29 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EB11A31AFFE069EDE86A;
 Wed, 23 Sep 2020 11:42:24 +0800 (CST)
Received: from huawei.com (10.175.104.57) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 23 Sep 2020
 11:42:19 +0800
From: Li Heng <liheng40@huawei.com>
To: <Bhawanpreet.Lakha@amd.com>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <harry.wentland@amd.com>
Subject: [PATCH -next] drm/amd/display: Remove set but not used variable
Date: Wed, 23 Sep 2020 11:42:18 +0800
Message-ID: <1600832538-32366-1-git-send-email-liheng40@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.175.104.57]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 23 Sep 2020 07:53:20 +0000
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c: warning:
variable speakers set but not used

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Li Heng <liheng40@huawei.com>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
index 2b08b1d..b8730d9f 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
@@ -119,7 +119,6 @@ static void afmt3_se_audio_setup(
 {
 	struct dcn30_afmt *afmt3 = DCN30_AFMT_FROM_AFMT(afmt);
 
-	uint32_t speakers = 0;
 	uint32_t channels = 0;
 
 	ASSERT(audio_info);
@@ -127,7 +126,6 @@ static void afmt3_se_audio_setup(
 	if (audio_info == NULL)
 		return;
 
-	speakers = audio_info->flags.info.ALLSPEAKERS;
 	channels = speakers_to_channels(audio_info->flags.speaker_flags).all;
 
 	/* setup the audio stream source select (audio -> dig mapping) */
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
