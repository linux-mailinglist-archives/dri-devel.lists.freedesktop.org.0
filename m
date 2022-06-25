Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B55555A5E9
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jun 2022 03:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E053810E469;
	Sat, 25 Jun 2022 01:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD1410E958;
 Sat, 25 Jun 2022 01:42:07 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 k12-20020a17090a404c00b001eaabc1fe5dso7263001pjg.1; 
 Fri, 24 Jun 2022 18:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pdeIHQVuGIq74deo1wq4KcCpm8Z3V/4ahZjeL3ne7+8=;
 b=JZollLIDhwsOxrqh/kIbwN3pl1uMWkUobCywBL/OTzI6aS8SvxU/5iZfD2+zfDb9rm
 5brWxDDqYtLrjhk6jDrCYpcUSeEM881A+oqpKPnMuGi60s/6ykKxfxnqrhKtaqjLK/5s
 senljBsT/4eFU7LUWu1FqjMwQzXXSskr6lBFzE1loeWeFnw0SF4xomh8E5sXdCTilDVe
 If5PIWHBarJ8UMtd6SxXcPdCPuD7BmHSNxL+1ks5oTkPcY6tD8svM4ozwFVktK2yxEA0
 iYFuh1vXVqz8VMkzRn4whTc4lLtfbazv9qphnX0vPueWyWRN9bJP23LdwK2nFTSvx9JJ
 dYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pdeIHQVuGIq74deo1wq4KcCpm8Z3V/4ahZjeL3ne7+8=;
 b=TyudJWpJjhx7Cvz5qG4/lhU1GjoKFz7axno444a8Dun9sw6uT/Km2RPfR7SlBktD7L
 qQg3joU+gg7XMewKvTJUsWdn61KKjaPHHTeKPkIJa9bZrIqMEHaxgOYeWCZemZgF1CSG
 o11My0slU+uDyP1g6/RTqAUN0e5y7oj4/midcgx3af9xiMxodUUEPalu2nD5LGSNoKzY
 LwLiJsqs+KcLp4zQAPQ5rEMPBPezEnEhz9A6Yd35kyxKEglH7RFIsPpyyPa9ZJ0NErgL
 WULiT54+/fjA3s41J/WXa6htgCmW88KvfVTeDxThUwtDPcIKMLFA0kYUJVXypLwN4H+q
 f0aw==
X-Gm-Message-State: AJIora/0f7+rWGz2pwmnMf2QTqmHVQoqD1yI760Bax01TRNiLXgKOrhA
 cR/rtu9zcghr20mpwmbBL9U=
X-Google-Smtp-Source: AGRyM1uZAHtn24InCTHwiAwpG/NEyIdpbEc0pkFGkCXvPsXO8VyUNPMZeaXitH3RhCxNFWM+5p6pfw==
X-Received: by 2002:a17:902:d504:b0:16a:4846:3f46 with SMTP id
 b4-20020a170902d50400b0016a48463f46mr1900105plg.159.1656121327298; 
 Fri, 24 Jun 2022 18:42:07 -0700 (PDT)
Received: from localhost.localdomain ([122.167.211.160])
 by smtp.gmail.com with ESMTPSA id
 x20-20020a056a00189400b005251b9102dbsm2467173pfh.144.2022.06.24.18.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 18:42:06 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, wenjing.liu@amd.com, Jun.Lei@amd.com,
 Jimmy.Kizito@amd.com, Jerry.Zuo@amd.com,
 meenakshikumar.somasundaram@amd.com, hanghong.ma@amd.com
Subject: [PATCH] drm/amd/display: Removed unused variable ret
Date: Sat, 25 Jun 2022 07:11:57 +0530
Message-Id: <20220625014157.5004-1-jrdr.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: "Souptick Joarder \(HPE\)" <jrdr.linux@gmail.com>,
 kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>

Kernel test robot throws below warning ->

drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:
In function 'dc_link_reduce_mst_payload':
   drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_link.c:3782:32:
warning: variable 'ret' set but not used [-Wunused-but-set-variable]
    3782 |         enum act_return_status ret;

Removed the unused ret variable.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index 55a8f58ee239..445357623d8b 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -3706,7 +3706,6 @@ enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw
 	struct fixed31_32 pbn_per_slot;
 	struct dp_mst_stream_allocation_table proposed_table = {0};
 	uint8_t i;
-	enum act_return_status ret;
 	const struct link_hwss *link_hwss = get_link_hwss(link, &pipe_ctx->link_res);
 	DC_LOGGER_INIT(link->ctx->logger);
 
@@ -3777,7 +3776,7 @@ enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw
 			&link->mst_stream_alloc_table);
 
 	/* poll for immediate branch device ACT handled */
-	ret = dm_helpers_dp_mst_poll_for_allocation_change_trigger(
+	dm_helpers_dp_mst_poll_for_allocation_change_trigger(
 			stream->ctx,
 			stream);
 
-- 
2.25.1

