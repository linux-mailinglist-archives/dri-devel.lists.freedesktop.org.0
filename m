Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE658C8E8B
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 01:36:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5257810E341;
	Fri, 17 May 2024 23:36:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="lQD3r4zV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6314810E1F0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 23:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=zCEGpkp3Zmdhb06kEQRsXk9mj5wYCe5bu+6wwSjIgUA=; b=lQD3r4zVStcDT0Rz
 L3K0k99h6eTjHTq1uMj7Pb7fRpKfCatEf+J6ysrXs5czg7mR9BJRjbhrIzmlBW9/p9OPWoWBXmyvs
 jWDNZ2U0kNqhkG8sKlkIGYCCUEteDB1Jx55QdyCQVHSDw7NC9/tZT9Sot4o1LIzCTtTIZW/ZefEaC
 N2eukhCTw7S5k9Zrkky4sHQHOMIBTSKstAvIjFbDyRYnEbBan6JfO7nhW8ugvL3TEQEVZAMPo/4rm
 E1zkAc++pw6lBfvib9Q1k3BBpX8V3mp+6tsaxE7QrBUqRKHohmqtNLYOFXtErP0lWixEFkeY22x3w
 RR5dkugoATolFb0T4A==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1s877E-001TpV-1Y;
 Fri, 17 May 2024 23:35:57 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/3] drm/amd/display: remove unused struct 'aux_payloads'
Date: Sat, 18 May 2024 00:35:47 +0100
Message-ID: <20240517233548.231120-3-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240517233548.231120-1-linux@treblig.org>
References: <20240517233548.231120-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'aux_payloads' is unused since
commit eae5ffa9bd7b ("drm/amd/display: Switch ddc to new aux interface")
Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
index c2d40979203e..d6d5bbf2108c 100644
--- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
+++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
@@ -51,10 +51,6 @@ struct i2c_payloads {
 	struct vector payloads;
 };
 
-struct aux_payloads {
-	struct vector payloads;
-};
-
 static bool i2c_payloads_create(
 		struct dc_context *ctx,
 		struct i2c_payloads *payloads,
-- 
2.45.1

