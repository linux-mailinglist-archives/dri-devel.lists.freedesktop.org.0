Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE51C695242
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 21:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3043B10E721;
	Mon, 13 Feb 2023 20:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C79910E71E;
 Mon, 13 Feb 2023 20:50:16 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4PFxLH4ndFzDrtC;
 Mon, 13 Feb 2023 20:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1676321415; bh=qSzOgwBfWlWzG9KtttT5nF4Q+sFniSnXt8jGIQdXQl0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hBom7EIt3TH9DPsPL7tWfffCgb21EjvZ7PebgQBoWlvvm1MgnT+Js4y1wQN+KVeQC
 on1vgaRHu8wdVQIeUTWdblRSaguv5L2RmzGUemA09W2NgyL1amnfxnlXiVqm+i72fw
 s23nAmq1Akn7NIDa41QYEVBcf0D2pdv6wnxnywKg=
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4PFxLH1PYGz9stW;
 Mon, 13 Feb 2023 20:50:15 +0000 (UTC)
X-Riseup-User-ID: D5AD1A8E1F77654C997A80EB847AECA96AB47E895197FB0839FB9BFF4AB9A3DB
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PFxL92Yq0z1y8Z;
 Mon, 13 Feb 2023 20:50:09 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/10] drm/amd/display: Add previously missing includes
Date: Mon, 13 Feb 2023 17:49:17 -0300
Message-Id: <20230213204923.111948-5-arthurgrillo@riseup.net>
In-Reply-To: <20230213204923.111948-1-arthurgrillo@riseup.net>
References: <20230213204923.111948-1-arthurgrillo@riseup.net>
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Arthur Grillo <arthurgrillo@riseup.net>,
 mairacanal@riseup.net, alexander.deucher@amd.com, andrealmeid@riseup.net,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add includes that were previously missing to reduce the number of
-Wmissing-prototypes warnings.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c               | 1 +
 drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
index 330d7cbc7398..3069af3684c6 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_init.c
@@ -30,6 +30,7 @@
 #include "dcn30/dcn30_hwseq.h"
 #include "dcn31/dcn31_hwseq.h"
 #include "dcn32_hwseq.h"
+#include "dcn32_init.h"
 
 static const struct hw_sequencer_funcs dcn32_funcs = {
 	.program_gamut_remap = dcn10_program_gamut_remap,
diff --git a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c
index 04838a31e513..257f4fc065a5 100644
--- a/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c
+++ b/drivers/gpu/drm/amd/display/dc/link/accessories/link_dp_trace.c
@@ -24,6 +24,7 @@
  */
 #include "dc_link.h"
 #include "link_dp_trace.h"
+#include "link.h"
 
 void dp_trace_init(struct dc_link *link)
 {
-- 
2.39.1

