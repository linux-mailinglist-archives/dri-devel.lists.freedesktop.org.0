Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 630EE6BE345
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 09:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A7A10EE8B;
	Fri, 17 Mar 2023 08:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E712810EE87;
 Fri, 17 Mar 2023 08:23:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A699EB824FA;
 Fri, 17 Mar 2023 08:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97BC3C4339B;
 Fri, 17 Mar 2023 08:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679041411;
 bh=79iAvhZFRGEvtnZme2ps1FOUDz1tuFW8RI7HfSRsKrI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nlrgMtSkoRGw5phNB19c9q5leoa9sBOe+WFRzK6J/2ksv0eObO3zdafcDaEDSv3f2
 A/NETGTlaIRob9JniBVKZDQHxIh+2CF8oD7nY9WfBDG7Xmh3cxfTnDdudySURoG5aY
 SbBii3l/sknzFXtnhERM3DZFnZdMQ2kDcoVk2vCufNQ2d7uDZILZiJiRnR+NJAewHo
 IGEertbiQsI4IFV+/i+7K6u4Zy2pl6wwi3geQ9ObU0GvV+yFnP6qysofUSKOU8DuS8
 vJOTjgBxa6nFXJN7WDXiKNorqir/LX15yltNon5R2Vu1JEjMq3d4sQBeCL1N17Z0/C
 ChhK6RNxCSc6w==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 29/37] drm/amd/display/dc/link/link_detection: Remove unused
 variable 'status'
Date: Fri, 17 Mar 2023 08:17:10 +0000
Message-Id: <20230317081718.2650744-30-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
In-Reply-To: <20230317081718.2650744-1-lee@kernel.org>
References: <20230317081718.2650744-1-lee@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Wenjing Liu <wenjing.liu@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c: In function ‘query_hdcp_capability’:
 drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_detection.c:501:42: warning: variable ‘status’ set but not used [-Wunused-but-set-variable]

Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Wenjing Liu <wenjing.liu@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/amd/display/dc/link/link_detection.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
index 9177b146a80a8..9a4cfa777622e 100644
--- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
+++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
@@ -498,8 +498,6 @@ static void query_hdcp_capability(enum signal_type signal, struct dc_link *link)
 	dc_process_hdcp_msg(signal, link, &msg22);
 
 	if (signal == SIGNAL_TYPE_DISPLAY_PORT || signal == SIGNAL_TYPE_DISPLAY_PORT_MST) {
-		enum hdcp_message_status status = HDCP_MESSAGE_UNSUPPORTED;
-
 		msg14.data = &link->hdcp_caps.bcaps.raw;
 		msg14.length = sizeof(link->hdcp_caps.bcaps.raw);
 		msg14.msg_id = HDCP_MESSAGE_ID_READ_BCAPS;
@@ -507,7 +505,7 @@ static void query_hdcp_capability(enum signal_type signal, struct dc_link *link)
 		msg14.link = HDCP_LINK_PRIMARY;
 		msg14.max_retries = 5;
 
-		status = dc_process_hdcp_msg(signal, link, &msg14);
+		dc_process_hdcp_msg(signal, link, &msg14);
 	}
 
 }
-- 
2.40.0.rc1.284.g88254d51c5-goog

