Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEF66CB270
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 01:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AE810E7B0;
	Mon, 27 Mar 2023 23:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F5A10E7B0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 23:34:31 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id q27so6957805oiw.0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 16:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1679960071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rCjnRFQPvAGnNx5L3qglgkfLmLwG3nPN+a/hM9CacEs=;
 b=GtnEi/KsBIrFkxShd3lvYGNJ9gUrQ2buWtvBFztcLMpjZHYnpfC2btTyNI2wDsx8gP
 PDOwtTF/TcTUNyeDxR4+oqyXUYAWrwKZvEptBJqEajGlOvHQG/N2hgJNqoRivII1xx51
 srSRUFm+TSmPWghIrj0BJh5li74VwsAaLfH1KqwWeaR6TO4B41nDX8EIySGgAXFLkN8F
 YdwEqm/wd8FQ3RikiVit9f33f8/yakAEXCIUHf2m4mD8ZPr83k/J/9pPD+iRpgpI1jss
 eOoS5rgPZHuaXhSaw/dfu9zrMhREgjPL3L5P57orkSVqAnny3ybOMPodpqyInQTfYtTE
 TpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679960071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rCjnRFQPvAGnNx5L3qglgkfLmLwG3nPN+a/hM9CacEs=;
 b=XWy9Rs0mlgHEdDZp/vTulxmA56rQNY9d18mYMAZ1HHrBOnU4zpwZE3rnnMWNxdPuEA
 mBlouur+OrNRJKgo0MF6HWkkNhqiCEF6telgD1t2n1TwdtO8TqrRR2heLk93CW3eApdU
 9NLQVFb3z2H4IYgkmNS8oyUshbC5yPGvoXVRFzKE6LsPg8ZqThVrjZNBFU1hC6j5FSY1
 68qzMiQKVoiY5ahpUx8N0QS+iIiRt//ffACcTsi51Yf2JPLq6JtnRiHb22e87tt/g6I/
 9eg2riWI55Ci+AeLhuFPfoCTJCoId2Bj8ROdiW544wqs17kVsQuYuZ04bbWJtF7i6F8s
 LuYw==
X-Gm-Message-State: AO0yUKXoFa/g1irLGZCaQe3oUs4CUaDsCfivf0dZgKAcvXsaNrVPnheO
 esyztUVakoAAyqx+ZTl784LOfA==
X-Google-Smtp-Source: AK7set8rDxFHQB6rrg/v8At+R+vD2rhk2qXsj5IgrUWpiFpg9BehvyB3jSFGPbGLp8x0w8YllHWLbA==
X-Received: by 2002:a05:6808:2d3:b0:386:ca6d:b602 with SMTP id
 a19-20020a05680802d300b00386ca6db602mr3723586oid.41.1679960069565; 
 Mon, 27 Mar 2023 16:34:29 -0700 (PDT)
Received: from ARCHaio.localdomain ([2804:1b3:a2c0:c911:919f:bd20:4f2a:8383])
 by smtp.gmail.com with ESMTPSA id
 b186-20020aca34c3000000b00389295e8424sm1643409oia.45.2023.03.27.16.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 16:34:29 -0700 (PDT)
From: Caio Novais <caionovais@usp.br>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 02/12] drm/amd: Remove unused variable 'value0'
Date: Mon, 27 Mar 2023 20:33:43 -0300
Message-Id: <20230327233353.64081-3-caionovais@usp.br>
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

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_link_encoder.c: In function ‘dcn10_link_encoder_update_mst_stream_allocation_table’:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn10/dcn10_link_encoder.c:1222:18: warning: variable ‘value0’ set but not used [-Wunused-but-set-variable]

Get rid of it by removing the variable.

Signed-off-by: Caio Novais <caionovais@usp.br>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
index c4287147b853..81aa1631945a 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
@@ -1219,7 +1219,6 @@ void dcn10_link_encoder_update_mst_stream_allocation_table(
 	const struct link_mst_stream_allocation_table *table)
 {
 	struct dcn10_link_encoder *enc10 = TO_DCN10_LINK_ENC(enc);
-	uint32_t value0 = 0;
 	uint32_t value1 = 0;
 	uint32_t value2 = 0;
 	uint32_t slots = 0;
@@ -1321,8 +1320,6 @@ void dcn10_link_encoder_update_mst_stream_allocation_table(
 	do {
 		udelay(10);
 
-		value0 = REG_READ(DP_MSE_SAT_UPDATE);
-
 		REG_GET(DP_MSE_SAT_UPDATE,
 				DP_MSE_SAT_UPDATE, &value1);
 
-- 
2.40.0

