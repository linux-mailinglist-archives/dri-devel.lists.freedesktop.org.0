Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4164374FD06
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 04:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38CB310E47C;
	Wed, 12 Jul 2023 02:23:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F362910E479;
 Wed, 12 Jul 2023 02:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=cePnlLEiqgQ2Pylbx1FGY2RvBTUt1YcYyuWHcsYfmpE=; b=nvRUmlLPkADlM46tMRobzAMSVD
 k5PIOvwf+/myoNanBVdhsfFi/Y4FQOM6XNfmw8+5sS9U3D4XYAmQTP9Vr5eaUs53ppYYAO1WfYxY2
 s/VpgFIRGUTQBOfan6CxNsz08Z40UHPqgOuPGTJlQbWuWcNzOcYR+1ZadgyS/7UHygk7hPNIFZOH/
 jSKjRpA5sK6Ool1tfoSmuPJ886W4J4h4tRR9yZAlDC0tyz1smPEjDifSrdWA+FHjKLYY61Ypjnsm7
 EwJknqk7zaiK0zATbBXIcGfEimEpgDHF/NTx7UhqoVsBON5hoZLrHP5xgtUaPlpoeb5loWznPyBVp
 Rzdr1ruQ==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qJPW2-00GFs8-0B; Wed, 12 Jul 2023 02:23:42 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/display: dc.h: eliminate kernel-doc warnings
Date: Tue, 11 Jul 2023 19:23:38 -0700
Message-ID: <20230712022339.17902-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.41.0
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quash 175 kernel-doc warnings in dc.h by unmarking 2 struct
comments as containing kernel-doc notation and by spelling one
struct field correctly in a kernel-doc comment.

Fixes: 1682bd1a6b5f ("drm/amd/display: Expand kernel doc for DC")
Fixes: ea76895ffab1 ("drm/amd/display: Document pipe split policy")
Fixes: f6ae69f49fcf ("drm/amd/display: Include surface of unaffected streams")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/dc/dc.h |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff -- a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
--- a/drivers/gpu/drm/amd/display/dc/dc.h
+++ b/drivers/gpu/drm/amd/display/dc/dc.h
@@ -506,7 +506,7 @@ enum dcn_zstate_support_state {
 	DCN_ZSTATE_SUPPORT_DISALLOW,
 };
 
-/**
+/*
  * struct dc_clocks - DC pipe clocks
  *
  * For any clocks that may differ per pipe only the max is stored in this
@@ -728,7 +728,7 @@ struct resource_pool;
 struct dce_hwseq;
 struct link_service;
 
-/**
+/*
  * struct dc_debug_options - DC debug struct
  *
  * This struct provides a simple mechanism for developers to change some
@@ -756,7 +756,7 @@ struct dc_debug_options {
 	bool use_max_lb;
 	enum dcc_option disable_dcc;
 
-	/**
+	/*
 	 * @pipe_split_policy: Define which pipe split policy is used by the
 	 * display core.
 	 */
@@ -1334,7 +1334,7 @@ struct dc_validation_set {
 	struct dc_stream_state *stream;
 
 	/**
-	 * @plane_state: Surface state
+	 * @plane_states: Surface state
 	 */
 	struct dc_plane_state *plane_states[MAX_SURFACES];
 
