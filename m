Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9176CB287
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 01:35:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED8D10E7D0;
	Mon, 27 Mar 2023 23:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A922A10E7CE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 23:35:50 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id bk5so7700562oib.6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 16:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1679960150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K1xhDxA3uWDRifG4IvLBAoRIIiYm0r4QC9LLNbKp2X8=;
 b=hvoaJX2ufI+udaK8mtxiLI21DzeH7JurXG/B43jOARKu83aSms5p/jUB7lwFs6omfL
 C3MvJEbwKrp4+zN7nS9bwwLJRstOf0GeeBnUjX0wuSPeyXQ2hqrkBQek1SQGMIiX+KCX
 /4ZPrhOgZvJ0MEOfcTm3nKfKoZUGeUiv8O33K6TquSH+CmZVXyqzo50twDCInP4i9q9l
 LtUwMM4WfNHC2cmc/CLIiaJJAaok/ssG3j/4jAMDz7SP/mcITFs8jlPilmDmUbIu1rpa
 S8HtZoIjJX3ZkBhEtr41i+hLJVS4ef1KC5FtF535WpCQQdngJk+XZwGB3Wp0bFrZvPsJ
 rcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679960150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K1xhDxA3uWDRifG4IvLBAoRIIiYm0r4QC9LLNbKp2X8=;
 b=q0Yabs1h77i95KIz5WUVkoZPMpg8valPEV/0qLdd4KfyFR1dHpox0Gp6z8jEjrVq2N
 9rHHbrg9hHlWG6WmgVjlDnzrdZ+BKSsSZdQt1a7VB6tRu9goE6/DDXLlkKNbL/jnL/yJ
 0uYW8VelKPdr9P1oQwssSpN4GYVFb8mEvx2qyUC3cfrwiWJKBqx/2e1cob9oADudZmo9
 8wlj9c30kDO5cCcnrsk6L3gtp7wD2Z7npvOzlOjVOOBpU+aEDqpNd8Ajfd9So6XazY4c
 eEo41LsnJj1mJ1V/EgjhQsW3SsTVeuNo+CGmPWbBK16XNI7FuGH4Yu5e4AGly7aPkIG5
 72LQ==
X-Gm-Message-State: AO0yUKUWEzgbLwoMBByIHSvq6i2Juket195QRbZfoHLGZ+SWjfWQq5qw
 TEYQE8QcbzOrVZRRq5siJB1tYQ==
X-Google-Smtp-Source: AK7set8NiGmgJV8HERS4O1DEMBfqAEeV4IytdUJ48dLagBB0+Hq6qQQfvpgB8IkKbofF5pTimWiQAg==
X-Received: by 2002:aca:6507:0:b0:387:3239:61fa with SMTP id
 m7-20020aca6507000000b00387323961famr5553985oim.30.1679960149872; 
 Mon, 27 Mar 2023 16:35:49 -0700 (PDT)
Received: from ARCHaio.localdomain ([2804:1b3:a2c0:c911:919f:bd20:4f2a:8383])
 by smtp.gmail.com with ESMTPSA id
 b186-20020aca34c3000000b00389295e8424sm1643409oia.45.2023.03.27.16.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 16:35:49 -0700 (PDT)
From: Caio Novais <caionovais@usp.br>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 10/12] drm/amd/display: Remove unused variable 'cursor_bpp'
Date: Mon, 27 Mar 2023 20:33:51 -0300
Message-Id: <20230327233353.64081-11-caionovais@usp.br>
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

Compiling AMD GPU drivers displays a warning:

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c: In function ‘dcn32_helper_calculate_mall_bytes_for_cursor’:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:62:18: warning: variable ‘cursor_bpp’ set but not used [-Wunused-but-set-variable]

Get rid of it by removing the variable.

Signed-off-by: Caio Novais <caionovais@usp.br>
---
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
index 3a2d7bcc4b6d..a616cf078cf4 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
@@ -59,25 +59,21 @@ uint32_t dcn32_helper_calculate_mall_bytes_for_cursor(
 {
 	struct hubp *hubp = pipe_ctx->plane_res.hubp;
 	uint32_t cursor_size = hubp->curs_attr.pitch * hubp->curs_attr.height;
-	uint32_t cursor_bpp = 4;
 	uint32_t cursor_mall_size_bytes = 0;
 
 	switch (pipe_ctx->stream->cursor_attributes.color_format) {
 	case CURSOR_MODE_MONO:
 		cursor_size /= 2;
-		cursor_bpp = 4;
 		break;
 	case CURSOR_MODE_COLOR_1BIT_AND:
 	case CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA:
 	case CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA:
 		cursor_size *= 4;
-		cursor_bpp = 4;
 		break;
 
 	case CURSOR_MODE_COLOR_64BIT_FP_PRE_MULTIPLIED:
 	case CURSOR_MODE_COLOR_64BIT_FP_UN_PRE_MULTIPLIED:
 		cursor_size *= 8;
-		cursor_bpp = 8;
 		break;
 	}
 
-- 
2.40.0

