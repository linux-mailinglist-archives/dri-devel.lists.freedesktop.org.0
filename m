Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AC36CB26D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 01:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BDB10E54F;
	Mon, 27 Mar 2023 23:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7F110E54F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 23:34:20 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id bm2so7704670oib.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 16:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1679960059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ATSF4wL+BzdBMa6MQ9WEbv1t9xTPovSyTP8ALVjMP/g=;
 b=jjeTndIjow57RXIs03XG4zTCjcQS7/ijT5BWQdjbh4qY+GsQ5sYgm1M7PfuUXOSubb
 RrcSC2LSZIQfp0531wAMUZRsj1uVKqOISsBGGNSY5U6pNoa1kNuv43aD/NYjC6A0KQAw
 NT3ZDNcHFzDJJVeOAgZLF9F0vKbnjWCpGSlH6vBP4QDYysI59nc8P7J+kUnT8x4lBZJp
 FYbdsN9mU0vDTXG1HHo3ScuOB+bDR2fxQyorBOuoG76lU68szVA2oeX+KQjILaM4guk7
 /vn8xua0wWVLPjP/ShDuq9R6Lij2bknq4mBHwqNGQM7y9Z7y1F/u1tIdneevves42NeF
 BK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679960059;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ATSF4wL+BzdBMa6MQ9WEbv1t9xTPovSyTP8ALVjMP/g=;
 b=UzAFNtKDHKhMHR/JZrqvS1qP+mS7zKt2XKCopr8ungWNmhpNuBWEu8g2js5Yc0LG2z
 tgItEpJKGNL2kk+Xvbo2eE7yb8u9qWhMxssvqx9Ep1D+MbK0PbkNR4wsWlouyu85JxvA
 R30T+zKXEStbSsmyGELQ2a/r/2GhzLv8F6RmgFrLsS2RV/6ADWjMCtzdQ80tqprHrY/u
 WXdFR0hmjUn56eJny2uOXzDxqkX2BOmrBpjLseeh1i22W3NOr/6jPWunfIQEN+IOnv1S
 JZeJKZW/BEafCZVWDDvs7PmnaNIhWd6Sl9BguxXI0kD84S8LeRwk6QhOiK0SfQgsY7ZN
 YrmA==
X-Gm-Message-State: AO0yUKUwYAvz1X0slqB0g4q121dnOrLmV5ov+e2HadTw4f1aks3q8GY4
 ge2przV43MkKvCccVX7Iicbj4A==
X-Google-Smtp-Source: AK7set9DW5uNG3ER+wZDWGxBetFSD6HDWjyxXA+KWrXZQuX9MkweyGj2xhoBwNRWBg7ILEXEH0kkjQ==
X-Received: by 2002:a05:6808:b22:b0:383:f572:2646 with SMTP id
 t2-20020a0568080b2200b00383f5722646mr4940712oij.5.1679960059520; 
 Mon, 27 Mar 2023 16:34:19 -0700 (PDT)
Received: from ARCHaio.localdomain ([2804:1b3:a2c0:c911:919f:bd20:4f2a:8383])
 by smtp.gmail.com with ESMTPSA id
 b186-20020aca34c3000000b00389295e8424sm1643409oia.45.2023.03.27.16.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 16:34:19 -0700 (PDT)
From: Caio Novais <caionovais@usp.br>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 01/12] drm/amd: Remove unused variable 'r'
Date: Mon, 27 Mar 2023 20:33:42 -0300
Message-Id: <20230327233353.64081-2-caionovais@usp.br>
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

drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c: In function ‘amdgpu_mes_ctx_alloc_meta_data’:
drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c:1099:13: warning: variable ‘r’ set but not used [-Wunused-but-set-variable]

Get rid of it by removing the variable.

Signed-off-by: Caio Novais <caionovais@usp.br>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
index 82e27bd4f038..e0130536f778 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
@@ -1096,14 +1096,6 @@ uint32_t amdgpu_mes_get_aggregated_doorbell_index(struct amdgpu_device *adev,
 int amdgpu_mes_ctx_alloc_meta_data(struct amdgpu_device *adev,
 				   struct amdgpu_mes_ctx_data *ctx_data)
 {
-	int r;
-
-	r = amdgpu_bo_create_kernel(adev,
-			    sizeof(struct amdgpu_mes_ctx_meta_data),
-			    PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
-			    &ctx_data->meta_data_obj,
-			    &ctx_data->meta_data_mc_addr,
-			    &ctx_data->meta_data_ptr);
 	if (!ctx_data->meta_data_obj)
 		return -ENOMEM;
 
-- 
2.40.0

