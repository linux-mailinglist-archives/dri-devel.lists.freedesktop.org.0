Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24126CB284
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 01:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BD210E7CB;
	Mon, 27 Mar 2023 23:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 907F410E7CB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 23:35:40 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id r14so2020964oiw.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 16:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1679960140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1A2mIjPdUqhr5Ice4vp7gIRuK6chByRV3cyN7aavT0E=;
 b=hBEZEu/Fg8Z7uqZ/Ekz1hHMkGIiWSFF5sR50cANSTAnWulG9QmfK+wwFoes5VSYTRh
 htMmf303bnpibjbmVMsR9SPCc51HKUstFFhpmUbInbdSvxo7XOCdedKUFZ8ZtXeJ7/FA
 238eQJQE4A1BarBX9h8IbgyVHKEJmOM2bfBO2yN40h1Yw8KQ3rxQ/tQW4pQ1x4wP5cwj
 x4RDRYoVZB/R5SC67RF1rxAyAA1Nu27ewQa8soq4BzP4HWRC7hBCY2FiqLFMYboWuy++
 x2mBeYBSEDmh/XqmaVCK4Cp6GkEDyA9YmnvG/o4ecItjja9Cz2eSbfxPBnJSBpJvtT0J
 pvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679960140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1A2mIjPdUqhr5Ice4vp7gIRuK6chByRV3cyN7aavT0E=;
 b=4VpmwgCESmr+FW2jpV4Gw4RQMt/oThYoR3iUpIL/JiywE5NXb+8YHEQPLYBX4KVCAt
 T0qqgPqQ30IONRmmry6gz27sxpfmSU9kSd7AKniw+yVdL/PStqtVXj5HrIHm9K1dF+TT
 BzdEZOIXIoM69mV/seHLEKIxlPCPkUKOPAB+ZZ+TaUxoAtm7zVJZPeOV6Cmj/wHEIjkI
 NUBtnqlo0NIYu699PpnewCUgkEBpJ5nUUb63uHID+nLkKW4yqxABf65AOkY7N58F8aml
 3kYlVNo81VzEgHoat9W/HLp6Isjr4NXNsjU4Hknkl6EODbqxRn9XOwl2yThVIRmRaB57
 J0sw==
X-Gm-Message-State: AO0yUKXIIeM/B6cD0M1qlKU5i9RZ6/qBevC5r0gqrxmYa9hVjPjsCPM0
 2NQ3D7EL5B+YKCY/xb+IjHD0TA==
X-Google-Smtp-Source: AK7set/XpIaBnrd0Il1RA6TJi7frFciWmH9SabrmY2R33L9ZbylSXEKtU1Nfc4VXuM45NiWKMhJC9Q==
X-Received: by 2002:a05:6808:58:b0:386:f58a:2262 with SMTP id
 v24-20020a056808005800b00386f58a2262mr5575924oic.57.1679960139887; 
 Mon, 27 Mar 2023 16:35:39 -0700 (PDT)
Received: from ARCHaio.localdomain ([2804:1b3:a2c0:c911:919f:bd20:4f2a:8383])
 by smtp.gmail.com with ESMTPSA id
 b186-20020aca34c3000000b00389295e8424sm1643409oia.45.2023.03.27.16.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 16:35:39 -0700 (PDT)
From: Caio Novais <caionovais@usp.br>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] drm/amd/display: Remove two unused variables
 'is_pipe_split_expected' and 'state'
Date: Mon, 27 Mar 2023 20:33:50 -0300
Message-Id: <20230327233353.64081-10-caionovais@usp.br>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327233353.64081-1-caionovais@usp.br>
References: <20230327233353.64081-1-caionovais@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
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
Cc: Felipe Clark <felipe.clark@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Mario Limonciello <mario.limonciello@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Charlene Liu <Charlene.Liu@amd.com>, Gabe Teeger <gabe.teeger@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Taimur Hassan <Syed.Hassan@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 George Shen <George.Shen@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Chaitanya Dhere <chaitanya.dhere@amd.com>, Alan Liu <HaoPing.Liu@amd.com>,
 Mukul Joshi <mukul.joshi@amd.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Jingwen Zhu <Jingwen.Zhu@amd.com>, Guo Zhengkui <guozhengkui@vivo.com>,
 Leo Li <sunpeng.li@amd.com>, Melissa Wen <mwen@igalia.com>,
 Le Ma <le.ma@amd.com>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Caio Novais <caionovais@usp.br>, Martin Leung <Martin.Leung@amd.com>,
 Ryan Lin <tsung-hua.lin@amd.com>, Brian Chang <Brian.Chang@amd.com>,
 Sung Joon Kim <sungjoon.kim@amd.com>, Yifan Zhang <yifan1.zhang@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, Dillon Varone <Dillon.Varone@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Wesley Chalmers <Wesley.Chalmers@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Zhan Liu <zhan.liu@amd.com>, Roman Li <Roman.Li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Ethan Wellenreiter <Ethan.Wellenreiter@amd.com>,
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Compiling AMD GPU drivers displays two warnings:

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource.c: In function ‘dcn32_acquire_post_bldn_3dlut’:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource.c:1614:31: warning: variable ‘state’ set but not used [-Wunused-but-set-variable]
and
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource.c: In function ‘dcn32_populate_dml_pipes_from_context’:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource.c:1916:17: warning: variable ‘is_pipe_split_expected’ set but not used [-Wunused-but-set-variable]

Get rid of them by removing the variables.

Signed-off-by: Caio Novais <caionovais@usp.br>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
index 74e50c09bb62..3435d3294e0b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
@@ -1611,7 +1611,6 @@ bool dcn32_acquire_post_bldn_3dlut(
 		struct dc_transfer_func **shaper)
 {
 	bool ret = false;
-	union dc_3dlut_state *state;
 
 	ASSERT(*lut == NULL && *shaper == NULL);
 	*lut = NULL;
@@ -1620,7 +1619,6 @@ bool dcn32_acquire_post_bldn_3dlut(
 	if (!res_ctx->is_mpc_3dlut_acquired[mpcc_id]) {
 		*lut = pool->mpc_lut[mpcc_id];
 		*shaper = pool->mpc_shaper[mpcc_id];
-		state = &pool->mpc_lut[mpcc_id]->state;
 		res_ctx->is_mpc_3dlut_acquired[mpcc_id] = true;
 		ret = true;
 	}
@@ -1913,7 +1911,6 @@ int dcn32_populate_dml_pipes_from_context(
 	struct resource_context *res_ctx = &context->res_ctx;
 	struct pipe_ctx *pipe;
 	bool subvp_in_use = false;
-	uint8_t is_pipe_split_expected[MAX_PIPES] = {0};
 	struct dc_crtc_timing *timing;
 
 	dcn20_populate_dml_pipes_from_context(dc, context, pipes, fast_validate);
@@ -2002,7 +1999,6 @@ int dcn32_populate_dml_pipes_from_context(
 		}
 
 		DC_FP_START();
-		is_pipe_split_expected[i] = dcn32_predict_pipe_split(context, &pipes[pipe_cnt]);
 		DC_FP_END();
 
 		pipe_cnt++;
-- 
2.40.0

