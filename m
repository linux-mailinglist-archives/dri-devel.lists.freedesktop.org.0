Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37687C938E9
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 08:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 105E510E1BE;
	Sat, 29 Nov 2025 07:37:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="krOyTkdc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E7510E1BE;
 Sat, 29 Nov 2025 07:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=e3URbhgqZ4cX254o0Gl1m/BER6n+wvOlOZank3sJZDM=; b=krOyTkdcngpq50IwBb3BQ813Q+
 D5FzZvEg0+cULjknoZs8Y6y8TPa1o4kcHLmBfS9TQJU6RrYsMqkQ53R+LQ4FbSl5Q3z+us2flSfsY
 J/okZU1mFha8HjyIX5vbxjnoYkx1/tTfU6xGGUzTrpWWpendRAhqvqs3SRzKWVjDZe4mARx1FF+Ok
 tPJQBRSULYEQHI0EB4ratkTGKUhCSItpjvhyEnUFXPr+ssF3qgMbHa5MQ1KYmjI5YwqwlAugM4VcA
 tX/34/ftdWWsw65kJdPe5TDEK9xVKr2h4xBZur9J+VC6NZNUkZIwlTW2+fF4rl/PsPkWObJiHLSqM
 GUiRbTsQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vPFWc-00000001Lt7-0Lpo; Sat, 29 Nov 2025 07:37:46 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Austin Zheng <austin.zheng@amd.com>,
 Jun Lei <jun.lei@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: correct kernel-doc in dml21_wrapper.h
Date: Fri, 28 Nov 2025 23:37:39 -0800
Message-ID: <20251129073740.1813659-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix all kernel-doc warnings in dml21_wrapper.h:
- add missing @dml_ctx entries (2 places)
- fix function prototype typo for dml21_create()
- change a blank kernel-doc line to " *"

Fixes these warnings:
Warning: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.h:30
 function parameter 'dml_ctx' not described in 'dml21_create'
Warning: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.h:30
 expecting prototype for dml2_create(). Prototype was for dml21_create()
 instead
Warning: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.h:55
 bad line:
Warning: drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.h:61
 function parameter 'dml_ctx' not described in 'dml21_validate'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Austin Zheng <austin.zheng@amd.com>
Cc: Jun Lei <jun.lei@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <siqueira@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.h |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--- linux-next-20251128.orig/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.h
+++ linux-next-20251128/drivers/gpu/drm/amd/display/dc/dml2_0/dml21/dml21_wrapper.h
@@ -17,9 +17,9 @@ struct dml2_context;
 enum dc_validate_mode;
 
 /**
- * dml2_create - Creates dml21_context.
+ * dml21_create - Creates dml21_context.
  * @in_dc: dc.
- * @dml2: Created dml21 context.
+ * @dml_ctx: Created dml21 context.
  * @config: dml21 configuration options.
  *
  * Create of DML21 is done as part of dc_state creation.
@@ -40,6 +40,7 @@ void dml21_reinit(const struct dc *in_dc
  * dml21_validate - Determines if a display configuration is supported or not.
  * @in_dc: dc.
  * @context: dc_state to be validated.
+ * @dml_ctx: dml21 context.
  * @validate_mode: DC_VALIDATE_MODE_ONLY and DC_VALIDATE_MODE_AND_STATE_INDEX
  *           will not populate context.res_ctx.
  *
@@ -53,7 +54,7 @@ void dml21_reinit(const struct dc *in_dc
  * -dml21_check_mode_support - for DC_VALIDATE_MODE_ONLY and DC_VALIDATE_MODE_AND_STATE_INDEX option
  * Calculates if dc_state can be supported for the input display
  * config.
-
+ *
  * Context: Two threads may not invoke this function concurrently unless they reference
  *          separate dc_states for validation.
  * Return: True if mode is supported, false otherwise.
