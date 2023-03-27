Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD61F6CB278
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 01:35:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BBC10E7BF;
	Mon, 27 Mar 2023 23:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66F3C10E7BF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 23:35:00 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id bm2so7705495oib.4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 16:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1679960099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UZvChWzT9y/5zLeIHf5uAQzD/BtvkDRJ3FwyLW2ZaHk=;
 b=wm7ahbRIhc9RvuZcZDoeymhlv3zgD7q8vtlddoiFgyPuYrCF2UQHw1qVFatPY38lbk
 L2MDcqf4eFfFC9CD4fkQf+dipCiiaXWG8ig6gj/1+WLjtVv9dPoPoWUW0OdVyljtevBj
 P1tAYeCjhmjGlaaJoO3h1AsREJwGADm4oAyEWnyxhNQmZEp/yuGqEhppic9GwJ497+6m
 cdfMze0NchXZo6iFtJ+LC4Uj2Wt37hP+m0Yhw2h11qHaiAf+GKNcfNcWz6Vr8UPFQ20/
 qqdrotLRu9N+cgoUH8F8M74KXSdu7eKJD2CI9iaISd9WZdaUnoQcd733g9l1a2Q1kQib
 AJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679960099;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UZvChWzT9y/5zLeIHf5uAQzD/BtvkDRJ3FwyLW2ZaHk=;
 b=S2DbELcXT/qS1IoipzQuG70VtsZs+NVBXIg5gDmQnjNpKaDWVaFyN6F3mIg5cJpqWo
 oH9B9oIN1eklGB9QEMqZJuDYryAf8+SYD5QmCN0waDjgY3nehuModElplHzC1hTBAgD9
 ELARkiTRgqmR70ReqbLBMGmgGpdbjqNyoYeukyF1xRvlOGmVZftYWCqgDFhsanLk6Ccp
 DRT/X7o54KaNzduiPlyspwsfI6d15U3jlczQKQp0ElzPJxDaiIILTuRu4EqHchPnXFGe
 g6emZAxxXrRSQy66qZDbrZcPChIFgnHs4LtGdwxBbNUmN/TD+xqKcGjyBm8DNx7jx/qZ
 hZmg==
X-Gm-Message-State: AO0yUKWBfOuAKQxGoAXmuz0fVSmkmywqWUliKnUy9Z+RPZFEvjm/Y3hD
 X+8Np+ej37DNthWG6z6vrrKLkA==
X-Google-Smtp-Source: AK7set/8tjEH59vf8bLWrjpQFwfi5OJxvuo18LnQL3tRmSwfL7lkONT3v+KQNmF/JKJ6LyaDvpfYzA==
X-Received: by 2002:aca:220a:0:b0:387:3a49:4733 with SMTP id
 b10-20020aca220a000000b003873a494733mr5203770oic.59.1679960099653; 
 Mon, 27 Mar 2023 16:34:59 -0700 (PDT)
Received: from ARCHaio.localdomain ([2804:1b3:a2c0:c911:919f:bd20:4f2a:8383])
 by smtp.gmail.com with ESMTPSA id
 b186-20020aca34c3000000b00389295e8424sm1643409oia.45.2023.03.27.16.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 16:34:59 -0700 (PDT)
From: Caio Novais <caionovais@usp.br>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 05/12] drm/amd/display: Remove unused variable 'speakers'
Date: Mon, 27 Mar 2023 20:33:46 -0300
Message-Id: <20230327233353.64081-6-caionovais@usp.br>
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

drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_afmt.c: In function ‘afmt3_se_audio_setup’:
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn30/dcn30_afmt.c:126:18: warning: variable ‘speakers’ set but not used [-Wunused-but-set-variable]

Get rid of it by removing the variable.

Signed-off-by: Caio Novais <caionovais@usp.br>
---
 drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
index 95528e5ef89e..55e388c4c98b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
@@ -123,7 +123,6 @@ void afmt3_se_audio_setup(
 {
 	struct dcn30_afmt *afmt3 = DCN30_AFMT_FROM_AFMT(afmt);
 
-	uint32_t speakers = 0;
 	uint32_t channels = 0;
 
 	ASSERT(audio_info);
@@ -131,7 +130,6 @@ void afmt3_se_audio_setup(
 	if (audio_info == NULL)
 		return;
 
-	speakers = audio_info->flags.info.ALLSPEAKERS;
 	channels = speakers_to_channels(audio_info->flags.speaker_flags).all;
 
 	/* setup the audio stream source select (audio -> dig mapping) */
-- 
2.40.0

