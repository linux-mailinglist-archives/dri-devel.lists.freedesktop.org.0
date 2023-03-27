Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 272076CB26A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 01:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C579310E420;
	Mon, 27 Mar 2023 23:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4272510E44A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 23:34:11 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id b19so7693995oib.7
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Mar 2023 16:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=usp.br; s=usp-google; t=1679960051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vbzg6klph6Te7iP3dSPIgG+vur+g/ph0Zdn9JxzzG40=;
 b=mcQCDHjIc1z0MV59hCiOPGbf9ypVcTa63Zwj9+4vczjxJ6xemxCHmB/bdG09R3ulGk
 wBRb0c4NRKQIeZ9AmKn4cZ2/cFiH43pbFxCU+Xwm10+2LXyU5IjgKYxYNni8iIny2BPJ
 Uyr5muaupR7SGOpBiiBp1e6Xl+GGq0CmFO3dc10hLq2qt7VhnOQk2AJ+iHp9AXHIRwtm
 NfAZ1fiK7syP88hnm8TuaCtSHzva6H/mfeVe+aCvNEeLItolg2ox+I9LK8+rwppC0E4X
 9Wxs02kRtS2zhYkR/OGYEL/mZEdqfxZ29EIIZi0qzdkVJ30c88TyYqgnmei/AGim0NxW
 27Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679960051;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vbzg6klph6Te7iP3dSPIgG+vur+g/ph0Zdn9JxzzG40=;
 b=GKhNzMDiQokGB9Wg9++iDDtzYgT1OJ9OSJI+/x50KtxKAL7h91DIGsBGVkALYsSxQF
 ToTDLEI9/dWpYt+/zMrOi4ccqO2gI76sX9Mx33GewCKScuqZhPTnV6Vmye7+gUn7jV6A
 oRZszXoLlY3mzu7UP+wfGsnA3v3ZBXiqj5TUtRebudgHGwVhafeeSo+6BCqauEMzTFOC
 beF/D8Roimcfu5mKWjgQkgP7cp1kYaOir2TWU2xlGFWJjrQqQ4b3RlvR9ZwOk2BLS7/X
 BU5BlsuApcHaYgqX8EBvJc/ZzXSOJZm34hIVE/4kKXyV+/Jt7IGDk2XjcYgOIigjcyM0
 uVKw==
X-Gm-Message-State: AAQBX9datR+8lJ1JAqT6/OEx4Z6chqZ1JPGA3kMp/IsLVXkj8lNW5uXc
 Hu8BwX2dBOpf9BcmVJ2F7Ketbg==
X-Google-Smtp-Source: AKy350aksGEh2UFglgdrglLJ3Yf7o8c/xLC1c9h/rH18JSGJMJx2XpH4So8mvyXTcj3EdZ87KQZm9Q==
X-Received: by 2002:a05:6808:1386:b0:389:4d2f:1c23 with SMTP id
 c6-20020a056808138600b003894d2f1c23mr1162500oiw.29.1679960049461; 
 Mon, 27 Mar 2023 16:34:09 -0700 (PDT)
Received: from ARCHaio.localdomain ([2804:1b3:a2c0:c911:919f:bd20:4f2a:8383])
 by smtp.gmail.com with ESMTPSA id
 b186-20020aca34c3000000b00389295e8424sm1643409oia.45.2023.03.27.16.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 16:34:09 -0700 (PDT)
From: Caio Novais <caionovais@usp.br>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 00/12] drm/amd: Remove unused variables
Date: Mon, 27 Mar 2023 20:33:41 -0300
Message-Id: <20230327233353.64081-1-caionovais@usp.br>
X-Mailer: git-send-email 2.40.0
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

This patchset cleans the code removing unused variables and one unused
function.

Caio Novais (12):
  Remove unused variable 'r'
  Remove unused variable 'value0'
  Remove unused variable 'pixel_width'
  Remove unused variable 'hubp'
  Remove unused variable 'speakers'
  Remove unused variable 'mc_vm_apt_default'
  Remove unused variable 'optc'
  Remove two unused variables 'speakers' and 'channels' and remove
    unused function 'speakers_to_channels'
  Remove two unused variables 'is_pipe_split_expected' and 'state'
  Remove unused variable 'cursor_bpp'
  Remove unused variable 'scl_enable'
  Remove two unused variables 'result_write_min_hblank' and
    'hblank_size'

 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  8 ----
 .../amd/display/dc/dcn10/dcn10_link_encoder.c |  3 --
 .../drm/amd/display/dc/dcn201/dcn201_dpp.c    |  6 ---
 .../drm/amd/display/dc/dcn201/dcn201_hwseq.c  |  2 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c |  2 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c |  4 --
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |  3 --
 .../gpu/drm/amd/display/dc/dcn31/dcn31_apg.c  | 39 -------------------
 .../drm/amd/display/dc/dcn32/dcn32_resource.c |  4 --
 .../display/dc/dcn32/dcn32_resource_helpers.c |  4 --
 .../dc/dml/dcn31/display_rq_dlg_calc_31.c     |  2 -
 .../dc/link/protocols/link_dp_capability.c    |  7 ----
 12 files changed, 84 deletions(-)

-- 
2.40.0

