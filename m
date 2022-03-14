Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D913E4D824D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 13:01:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFD810E708;
	Mon, 14 Mar 2022 12:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF9710E328;
 Mon, 14 Mar 2022 12:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FJ5wXrhL/9ylQnMvdM2Q4vFxfquXxlOyQHpUBbVVNgI=;
 b=a3jhw+wo/Cs8m0TeWfe+JUWEyIsLOIAuZ+eUSQ/fY1nkQeScgGRbVVDX
 Y/WQfE3t4AAGmGm7CwfaPzKr4JZeP1e/7BOTm4hxIDSf9lP03Pj6cEyhv
 7gd50CPjNwFMpGcf26wvWl/Xn8HrwUP+ftNfv8ZuM9a2EnFliHV4CSk4t w=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,180,1643670000"; d="scan'208";a="25997357"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 12:54:00 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH 23/30] drm/amdgpu/dc: fix typos in comments
Date: Mon, 14 Mar 2022 12:53:47 +0100
Message-Id: <20220314115354.144023-24-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220314115354.144023-1-Julia.Lawall@inria.fr>
References: <20220314115354.144023-1-Julia.Lawall@inria.fr>
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
Cc: Leo Li <sunpeng.li@amd.com>, kernel-janitors@vger.kernel.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/gpu/drm/amd/display/dc/bios/command_table.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/bios/command_table.c b/drivers/gpu/drm/amd/display/dc/bios/command_table.c
index ad13e4e36d77..0e36cd800fc9 100644
--- a/drivers/gpu/drm/amd/display/dc/bios/command_table.c
+++ b/drivers/gpu/drm/amd/display/dc/bios/command_table.c
@@ -456,7 +456,7 @@ static enum bp_result transmitter_control_v2(
 		if ((CONNECTOR_ID_DUAL_LINK_DVII == connector_id) ||
 				(CONNECTOR_ID_DUAL_LINK_DVID == connector_id))
 			/* on INIT this bit should be set according to the
-			 * phisycal connector
+			 * physical connector
 			 * Bit0: dual link connector flag
 			 * =0 connector is single link connector
 			 * =1 connector is dual link connector
@@ -468,7 +468,7 @@ static enum bp_result transmitter_control_v2(
 				cpu_to_le16((uint8_t)cntl->connector_obj_id.id);
 		break;
 	case TRANSMITTER_CONTROL_SET_VOLTAGE_AND_PREEMPASIS:
-		/* votage swing and pre-emphsis */
+		/* voltage swing and pre-emphsis */
 		params.asMode.ucLaneSel = (uint8_t)cntl->lane_select;
 		params.asMode.ucLaneSet = (uint8_t)cntl->lane_settings;
 		break;
@@ -2120,7 +2120,7 @@ static enum bp_result program_clock_v5(
 	memset(&params, 0, sizeof(params));
 	if (!bp->cmd_helper->clock_source_id_to_atom(
 			bp_params->pll_id, &atom_pll_id)) {
-		BREAK_TO_DEBUGGER(); /* Invalid Inpute!! */
+		BREAK_TO_DEBUGGER(); /* Invalid Input!! */
 		return BP_RESULT_BADINPUT;
 	}
 

