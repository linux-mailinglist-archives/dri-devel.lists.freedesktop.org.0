Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D41E6CB277
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 01:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C1F10E7B8;
	Mon, 27 Mar 2023 23:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFD810E7B8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 23:34:50 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id bj20so7705507oib.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 16:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1679960089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8QsHyz7gKUkQwkVhf5pyg1KknFMPIvy4LcmMgDotpCM=;
 b=sx01gakuWa2Q5P6dcI4aIQRwIo9i+t9MKVEV2yp/xxLG+XXh5L4SKodd8Ib0rthkhM
 d229sHbxpl6ezpNSYIuE8NQG3fv4OcWLeqiVpughUBDCD6HoXLYQkjPeeOcHA6UVU8G5
 /J+jdLdjufxFxv955wirCwSmbuLxHyCqXYk0my/ciyXJCElao7c90x1rIa/Yh0yTCp3W
 s7+bZXZt1V3nUO4Bba4bODojyT+ct9iMtEBxRi58GmbNQ7mDBbPk1ey70ybCkLX6rMhK
 2vB49cK9mzSLuo9e7QPRVLEHJHwT0WQ6eKElBGY/NK8HFvBSQE8kDrnuupww2QfLMRTD
 Y6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679960089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8QsHyz7gKUkQwkVhf5pyg1KknFMPIvy4LcmMgDotpCM=;
 b=cZEqM2aGmBJWG4gZgOvG4G9SkjS7iRu7AXl7ooqO5Z/aagGVSwlvJkwas5PQEgD4Mf
 HJMKvg7o8cKl2x8XkT6kuqVjPE7jftcWsZkKVObUURYabYV7eKFatsIp2AZuYwOTA6Sy
 LrUZDnpHNu8bHTfsF6E2Tq7Qsr463x5tgdsRxD1AhDMJtXGYleHCLjaagXNFCoD+0T5I
 tMwG1yQURKZa3++wtODXq7xrH8BypJQLL/KR89W5qZ7QL7sOOKgDzxIMZC1LfO/hxM1z
 zgdVSPjgboWkxZVdCGqeGf5U5uyUDOzev3Df4oqFXjGDtcoluD+eos6qPluMGhjkNuBI
 SNBA==
X-Gm-Message-State: AAQBX9fSTxoQOAccQfr5wL4tyHpL379TECiL8dTplIidS97vMusyQZww
 2V9O2r+O8n5aFs58mKHWU4+Nn/ysO1gKbo18Ftwj7Q==
X-Google-Smtp-Source: AKy350Zf7TAyCj72D7dBxB05x85USmeaRH3Aok5R7Th4M199ri5mIqKovxSmqM4aYnXWp8ALjUMQfA==
X-Received: by 2002:aca:d0f:0:b0:389:f4a:93ec with SMTP id
 15-20020aca0d0f000000b003890f4a93ecmr2974502oin.28.1679960089575; 
 Mon, 27 Mar 2023 16:34:49 -0700 (PDT)
Received: from ARCHaio.localdomain ([2804:1b3:a2c0:c911:919f:bd20:4f2a:8383])
 by smtp.gmail.com with ESMTPSA id
 b186-20020aca34c3000000b00389295e8424sm1643409oia.45.2023.03.27.16.34.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 16:34:49 -0700 (PDT)
From: Caio Novais <caionovais@usp.br>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 04/12] drm/amd/display: Remove unused variable 'hubp'
Date: Mon, 27 Mar 2023 20:33:45 -0300
Message-Id: <20230327233353.64081-5-caionovais@usp.br>
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

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_hwseq.c: In function ‘dcn201_pipe_control_lock’:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn201/dcn201_hwseq.c:544:22: warning: variable ‘hubp’ set but not used [-Wunused-but-set-variable]

Get rid of it by removing the variable.

Signed-off-by: Caio Novais <caionovais@usp.br>
---
 drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
index 61bcfa03c4e7..1aeb04fbd89d 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
@@ -541,8 +541,6 @@ void dcn201_pipe_control_lock(
 	bool lock)
 {
 	struct dce_hwseq *hws = dc->hwseq;
-	struct hubp *hubp = NULL;
-	hubp = dc->res_pool->hubps[pipe->pipe_idx];
 	/* use TG master update lock to lock everything on the TG
 	 * therefore only top pipe need to lock
 	 */
-- 
2.40.0

