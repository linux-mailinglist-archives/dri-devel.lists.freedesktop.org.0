Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9187C85D22F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 09:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630CD10E655;
	Wed, 21 Feb 2024 08:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=usp.br header.i=@usp.br header.b="AvVguWfU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5F310E548
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 19:47:50 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6e3ffafa708so2825650b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 11:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1708458470; x=1709063270; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/rfF5m6vNt6+z97Bq6fmRU0kV10rXjJY38OISp8QurM=;
 b=AvVguWfUYJE/YE+3oHScbghaKf577yn1LcUKzx+hrSri3wGw285KtJ5TxThaUsn1jl
 y+6SypjMbWEIWz7b39HG5mjjkwcQPTEyJdGEUNQznPgaGJVbKOK9/vVUgcNMGnZ7OjIk
 SGSA3NUF9CA7YshnyOETtr0gAYaenPlzWdqnpd67Mmw3Yk6YaeXVP1lq4gF1/dU/kRov
 cIBfWIfhkLtCAzUO+1E9DGQfYA53nYVdUpSUDx90X4W4mXhXo3tNmGityOps9jV0mp/T
 Q6IlEmn4h7GafIgtVWd9F7bmQ+mVCnhTZrney8gayoGOWqN6Keqj3VJKLZq73+Tp42F4
 IFvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708458470; x=1709063270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/rfF5m6vNt6+z97Bq6fmRU0kV10rXjJY38OISp8QurM=;
 b=nLRWzrZ3A7FHRcRBAuzyY0zCtevG9e8wKcMyGWel1P3yFcZihL+ZF0ojRpcqyVsyPR
 aUPQVirv/lSN2ShYRMDiyAg7iLZjY+lzyDj92hqPtSctZd5qQQsqDTXDtowEmALj4BIq
 Q/v1GLnJtE+yUWjEmeuKn6kA7sT7NAU9JqRUM6wGOWQgkdDkStOaB26AtSUnBuXAU/iK
 x1ECCGAI/OM+yPg3qrrQZO3Qqqd1CYACYEOOXAHgMXIOaf/utDDkA/bzNvQhluydW+H3
 uHWdVUwURKr5ahDy1WsLA2qc0EBgcDIQzuB76MHZnn/3w+JV01XwRFeLlRjSlmEE/HAj
 rVmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7PdvSYxZvYncTbXal3APHdw5u1v595zdg8t8MhmK6HI+pLQ5oHj7rhA3yRdPwPjLfB8ZrE2bdCcJt9OMax+zKkv+7h9JfHXIwVbZbh+s0
X-Gm-Message-State: AOJu0Yxa2vZBufPfsFYJjRoLiHSaklAoRU6Yn265shm7bPSrQFI2LOPv
 +LGLx51gEhocLRmxkQQEOfR0fXCSyDEzn7DHN5tftyLSiemXYfc6AntN0P4qEnI=
X-Google-Smtp-Source: AGHT+IGnWwdG7CL0BtV8R2A3YBFuZU/pQKWvEybJ349/zXthCZwJvV4AKsmxTNvR0W7LM5AsqUP5Jg==
X-Received: by 2002:aa7:8455:0:b0:6e4:148e:2946 with SMTP id
 r21-20020aa78455000000b006e4148e2946mr7616833pfn.25.1708458470319; 
 Tue, 20 Feb 2024 11:47:50 -0800 (PST)
Received: from localhost.localdomain ([185.153.176.89])
 by smtp.gmail.com with ESMTPSA id
 u21-20020aa78395000000b006e0ad616be3sm7293482pfm.110.2024.02.20.11.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 11:47:50 -0800 (PST)
From: David Tadokoro <davidbtadokoro@usp.br>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: David Tadokoro <davidbtadokoro@usp.br>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amd/display: add prefix to rv1_clk_mgr_vbios_smu.c
 functions
Date: Tue, 20 Feb 2024 16:46:57 -0300
Message-Id: <20240220194657.243378-4-davidbtadokoro@usp.br>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240220194657.243378-1-davidbtadokoro@usp.br>
References: <20240220194657.243378-1-davidbtadokoro@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 21 Feb 2024 08:08:40 +0000
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

The functions defined in dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c don't
have names that indicate where they were declared.

To better filter results in debug tools like ftrace, prefix these
functions with 'rv1_clk_mgr_vbios_smu_'.

Signed-off-by: David Tadokoro <davidbtadokoro@usp.br>
---
 .../drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c |  2 +-
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c       | 14 +++++++-------
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.h       |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c
index 093084a48daa..3109c6651f1c 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr.c
@@ -312,7 +312,7 @@ static struct clk_mgr_funcs rv1_clk_funcs = {
 };
 
 static struct clk_mgr_internal_funcs rv1_clk_internal_funcs = {
-	.set_dispclk = rv1_vbios_smu_set_dispclk,
+	.set_dispclk = rv1_clk_mgr_vbios_smu_set_dispclk,
 	.set_dprefclk = dce112_set_dprefclk
 };
 
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c
index 89b79dd39628..7823186250d3 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c
@@ -83,7 +83,7 @@ static const struct IP_BASE MP1_BASE  = { { { { 0x00016000, 0, 0, 0, 0 } },
  * the register is NOT EQUAL to zero, and because the translation in msg_if.h
  * won't work with REG_WAIT.
  */
-static uint32_t rv1_smu_wait_for_response(struct clk_mgr_internal *clk_mgr, unsigned int delay_us, unsigned int max_retries)
+static uint32_t rv1_clk_mgr_vbios_smu_wait_for_response(struct clk_mgr_internal *clk_mgr, unsigned int delay_us, unsigned int max_retries)
 {
 	uint32_t res_val = VBIOSSMC_Status_BUSY;
 
@@ -101,7 +101,7 @@ static uint32_t rv1_smu_wait_for_response(struct clk_mgr_internal *clk_mgr, unsi
 	return res_val;
 }
 
-static int rv1_vbios_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
+static int rv1_clk_mgr_vbios_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
 		unsigned int msg_id, unsigned int param)
 {
 	uint32_t result;
@@ -115,7 +115,7 @@ static int rv1_vbios_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
 	/* Trigger the message transaction by writing the message ID */
 	REG_WRITE(MP1_SMN_C2PMSG_67, msg_id);
 
-	result = rv1_smu_wait_for_response(clk_mgr, 10, 1000);
+	result = rv1_clk_mgr_vbios_smu_wait_for_response(clk_mgr, 10, 1000);
 
 	ASSERT(result == VBIOSSMC_Result_OK);
 
@@ -123,14 +123,14 @@ static int rv1_vbios_smu_send_msg_with_param(struct clk_mgr_internal *clk_mgr,
 	return REG_READ(MP1_SMN_C2PMSG_83);
 }
 
-int rv1_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz)
+int rv1_clk_mgr_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz)
 {
 	int actual_dispclk_set_mhz = -1;
 	struct dc *dc = clk_mgr->base.ctx->dc;
 	struct dmcu *dmcu = dc->res_pool->dmcu;
 
 	/*  Unit of SMU msg parameter is Mhz */
-	actual_dispclk_set_mhz = rv1_vbios_smu_send_msg_with_param(
+	actual_dispclk_set_mhz = rv1_clk_mgr_vbios_smu_send_msg_with_param(
 			clk_mgr,
 			VBIOSSMC_MSG_SetDispclkFreq,
 			khz_to_mhz_ceil(requested_dispclk_khz));
@@ -144,11 +144,11 @@ int rv1_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_di
 	return actual_dispclk_set_mhz * 1000;
 }
 
-int rv1_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr)
+int rv1_clk_mgr_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr)
 {
 	int actual_dprefclk_set_mhz = -1;
 
-	actual_dprefclk_set_mhz = rv1_vbios_smu_send_msg_with_param(
+	actual_dprefclk_set_mhz = rv1_clk_mgr_vbios_smu_send_msg_with_param(
 			clk_mgr,
 			VBIOSSMC_MSG_SetDprefclkFreq,
 			khz_to_mhz_ceil(clk_mgr->base.dprefclk_khz));
diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.h b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.h
index 083cb3158859..d6d50cd3755d 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.h
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.h
@@ -26,7 +26,7 @@
 #ifndef DAL_DC_DCN10_RV1_CLK_MGR_VBIOS_SMU_H_
 #define DAL_DC_DCN10_RV1_CLK_MGR_VBIOS_SMU_H_
 
-int rv1_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz);
-int rv1_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr);
+int rv1_clk_mgr_vbios_smu_set_dispclk(struct clk_mgr_internal *clk_mgr, int requested_dispclk_khz);
+int rv1_clk_mgr_vbios_smu_set_dprefclk(struct clk_mgr_internal *clk_mgr);
 
 #endif /* DAL_DC_DCN10_RV1_CLK_MGR_VBIOS_SMU_H_ */
-- 
2.39.2

