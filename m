Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358602627E9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:05:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED29A6E9D9;
	Wed,  9 Sep 2020 07:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279FA6E157;
 Tue,  8 Sep 2020 23:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=EK9nCPA8Amh2jxRu+oV/LS9FWBTa7vHxNwTW3NXJse0=; b=MA3klo6Ht+sTgmyqNNpAuyGXK7
 FIPRvHG4I/77N2XWo41bS5s+vLglm9b18XFMj9rjdzdH0hejbyL4YYA+HK+Aqy7RQ+ZB+opBfvTga
 TsLwFbfbu/kuPp+EtK8m+b2yiQxI7AFvBtwl1eZ+22RUQtlmXTeJoA2p7RS6Vvy+neLVlTOhJKLEO
 gR1TD3GLgvuHLeEnmSLpGS0UsDW1xei8rWVhRaEt8JfvCqC9G3f7o0sZXOuuJ3Szj4MHENTArPGhU
 tqKaFy/ut2sGaMkpv0fNrEjnxPm4HVv2O92X9W2OC+gzxlTauwAzBZyB7zlukZ6VKdxGoQNi/kKl4
 OR9PPI4Q==;
Received: from [2601:1c0:6280:3f0::19c2]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFnTA-0003fN-VS; Tue, 08 Sep 2020 23:56:13 +0000
To: LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] drm: amd/display: fix spelling of "function"
Message-ID: <a31672e7-9047-e4ef-93d8-d0c9afd47964@infradead.org>
Date: Tue, 8 Sep 2020 16:56:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Randy Dunlap <rdunlap@infradead.org>

Fix spellos of "function" in drivers/gpu/drm/amd/display/.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.h   |    2 +-
 drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.h |    2 +-
 drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.h   |    2 +-
 drivers/gpu/drm/amd/display/dc/gpio/dce120/hw_factory_dce120.c      |    2 +-
 drivers/gpu/drm/amd/display/dc/gpio/dcn10/hw_factory_dcn10.c        |    2 +-
 drivers/gpu/drm/amd/display/dc/gpio/dcn20/hw_factory_dcn20.c        |    2 +-
 drivers/gpu/drm/amd/display/dc/gpio/dcn21/hw_factory_dcn21.c        |    2 +-
 drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c        |    2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

--- linux-next-20200908.orig/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.h
+++ linux-next-20200908/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.h
@@ -33,7 +33,7 @@ struct display_mode_lib;
 
 // Function: dml_rq_dlg_get_rq_reg
 //  Main entry point for test to get the register values out of this DML class.
-//  This function calls <get_rq_param> and <extract_rq_regs> fucntions to calculate
+//  This function calls <get_rq_param> and <extract_rq_regs> functions to calculate
 //  and then populate the rq_regs struct
 // Input:
 //  pipe_src_param - pipe source configuration (e.g. vp, pitch, etc.)
--- linux-next-20200908.orig/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.h
+++ linux-next-20200908/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.h
@@ -33,7 +33,7 @@ struct display_mode_lib;
 
 // Function: dml_rq_dlg_get_rq_reg
 //  Main entry point for test to get the register values out of this DML class.
-//  This function calls <get_rq_param> and <extract_rq_regs> fucntions to calculate
+//  This function calls <get_rq_param> and <extract_rq_regs> functions to calculate
 //  and then populate the rq_regs struct
 // Input:
 //  pipe_src_param - pipe source configuration (e.g. vp, pitch, etc.)
--- linux-next-20200908.orig/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.h
+++ linux-next-20200908/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.h
@@ -32,7 +32,7 @@ struct display_mode_lib;
 
 // Function: dml_rq_dlg_get_rq_reg
 //  Main entry point for test to get the register values out of this DML class.
-//  This function calls <get_rq_param> and <extract_rq_regs> fucntions to calculate
+//  This function calls <get_rq_param> and <extract_rq_regs> functions to calculate
 //  and then populate the rq_regs struct
 // Input:
 //  pipe_param - pipe source configuration (e.g. vp, pitch, scaling, dest, etc.)
--- linux-next-20200908.orig/drivers/gpu/drm/amd/display/dc/gpio/dce120/hw_factory_dce120.c
+++ linux-next-20200908/drivers/gpu/drm/amd/display/dc/gpio/dce120/hw_factory_dce120.c
@@ -162,7 +162,7 @@ static void define_hpd_registers(struct
 }
 
 
-/* fucntion table */
+/* function table */
 static const struct hw_factory_funcs funcs = {
 	.init_ddc_data = dal_hw_ddc_init,
 	.init_generic = NULL,
--- linux-next-20200908.orig/drivers/gpu/drm/amd/display/dc/gpio/dcn10/hw_factory_dcn10.c
+++ linux-next-20200908/drivers/gpu/drm/amd/display/dc/gpio/dcn10/hw_factory_dcn10.c
@@ -194,7 +194,7 @@ static void define_hpd_registers(struct
 }
 
 
-/* fucntion table */
+/* function table */
 static const struct hw_factory_funcs funcs = {
 	.init_ddc_data = dal_hw_ddc_init,
 	.init_generic = dal_hw_generic_init,
--- linux-next-20200908.orig/drivers/gpu/drm/amd/display/dc/gpio/dcn20/hw_factory_dcn20.c
+++ linux-next-20200908/drivers/gpu/drm/amd/display/dc/gpio/dcn20/hw_factory_dcn20.c
@@ -221,7 +221,7 @@ static void define_generic_registers(str
 	generic->base.regs = &generic_regs[en].gpio;
 }
 
-/* fucntion table */
+/* function table */
 static const struct hw_factory_funcs funcs = {
 	.init_ddc_data = dal_hw_ddc_init,
 	.init_generic = dal_hw_generic_init,
--- linux-next-20200908.orig/drivers/gpu/drm/amd/display/dc/gpio/dcn21/hw_factory_dcn21.c
+++ linux-next-20200908/drivers/gpu/drm/amd/display/dc/gpio/dcn21/hw_factory_dcn21.c
@@ -202,7 +202,7 @@ static void define_hpd_registers(struct
 }
 
 
-/* fucntion table */
+/* function table */
 static const struct hw_factory_funcs funcs = {
 	.init_ddc_data = dal_hw_ddc_init,
 	.init_generic = dal_hw_generic_init,
--- linux-next-20200908.orig/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
+++ linux-next-20200908/drivers/gpu/drm/amd/display/dc/gpio/dcn30/hw_factory_dcn30.c
@@ -218,7 +218,7 @@ static void define_hpd_registers(struct
 }
 
 
-/* fucntion table */
+/* function table */
 static const struct hw_factory_funcs funcs = {
 	.init_ddc_data = dal_hw_ddc_init,
 	.init_generic = dal_hw_generic_init,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
