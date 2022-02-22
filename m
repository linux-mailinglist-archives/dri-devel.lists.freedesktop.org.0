Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0685E4BF8F3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D423510E616;
	Tue, 22 Feb 2022 13:17:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E0210E60D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:17:31 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 a7-20020a9d5c87000000b005ad1467cb59so9578188oti.5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 05:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=usp.br; s=usp-google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7bcSxnOgYRWuwEWYsw+jDqFwC/iPiLyo1fAK+m7rTBM=;
 b=FARwwudhrbiHNm+ymHkQ0oMqAOKF0Vf42hLTkLPVD7ODdcqqajzRrQGBdwOih/K0bb
 RUxopYSwKuxLMBZiJ79Q+DgoMrhCzQOsjQmLPvgQINoXR0wtyLlPZYzuYRPIZ8swe962
 ZgigI+e6snret4Jj4aG3OOyEc4M9wSawdbeC545UbyBvOExwqEX5bbLbG/As/xk4zLhr
 Gp/IMdQXMT73GBWuxTLlts5DVT60AgyXaAZeMf+VwrX0ptevIAl+8aj9IDEteHsTkRJH
 BN24yfy/ysLfDcXaCnkXr4TUHMV7v22mVn0BKE3jLi4rzvrC/KeNn/IfwhiVcKcW0gOD
 Ni2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7bcSxnOgYRWuwEWYsw+jDqFwC/iPiLyo1fAK+m7rTBM=;
 b=6osd/yhOUiWPK7zB80h3rN85GuWqMbpIXm3L77oRfY3pGGHpdyDsGHXabILgfm/w87
 BqIZwwxD23Kbj04/mFT7Xqw1EmVkQAxI45DCpy3GxfiVgTA2rhEoenFzJ6+3V9W3axe9
 sZwoxbElCS3ELlKi5iMNL6hZqZnhiy6eaBEYPD1e9EYFcHPEUHIwI8PfZzSU8ppgW3FD
 5934bQjc1/i6ooOEGglRKC/vhaH24c9Jwl34x8tTdMbVdnSq6+iuv94tqEMV9xoGfnx5
 9ttwEyK6UjfzsdBf3r4c/esPN9XCbq8e0GQ2aXn63SLV+Wbp7Nkj/ajgwfaSoFt0ZEgV
 ORWA==
X-Gm-Message-State: AOAM533zgnFDAOcCyEir60/2KzMyBqkUCM3aQJWLWQFtACYXcg7mRD2u
 gDlPagspCl/kCj05J5mNPHalXw==
X-Google-Smtp-Source: ABdhPJwd8xzR9s0jcNwaKdd2s6R5udAwjLK2LLk1zR46KzB4XuGEtlKmrg0YPTU0KivbVcgwBzB58Q==
X-Received: by 2002:a05:6830:268c:b0:5ad:1000:397e with SMTP id
 l12-20020a056830268c00b005ad1000397emr8446171otu.35.1645535851081; 
 Tue, 22 Feb 2022 05:17:31 -0800 (PST)
Received: from fedora.. ([187.36.236.204])
 by smtp.gmail.com with ESMTPSA id c9sm6325050otd.26.2022.02.22.05.17.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 05:17:30 -0800 (PST)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 Hawking.Zhang@amd.com, john.clements@amd.com, tao.zhou1@amd.com,
 YiPeng.Chai@amd.com, luben.tuikov@amd.com, Stanley.Yang@amd.com,
 Dennis.Li@amd.com, mukul.joshi@amd.com, harry.wentland@amd.com,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, Anthony.Koo@amd.com
Subject: [PATCH 00/10] Fix multiple compilation warnings
Date: Tue, 22 Feb 2022 10:16:51 -0300
Message-Id: <20220222131701.356117-1-maira.canal@usp.br>
X-Mailer: git-send-email 2.35.1
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
Cc: magalilemes00@gmail.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <maira.canal@usp.br>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, mwen@igalia.com,
 amd-gfx@lists.freedesktop.org, isabbasso@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset intends to deal with a couple of warnings in the AMD graphic
drivers. All warnings were generated with Clang and W=1 flag.

Maíra Canal (10):
  drm/amdgpu: Change amdgpu_ras_block_late_init_default function scope
  drm/amdgpu: Remove tmp unused variable
  drm/amdgpu: Remove unused get_umc_v8_7_channel_index function
  drm/amd/display: Remove unused temp variable
  drm/amd/display: Remove unused dcn316_smu_set_voltage_via_phyclk
    function
  drm/amd/display: Remove vupdate_int_entry definition
  drm/amd/display: Remove unused dmub_outbox_irq_info_funcs variable
  drm/amd/display: Remove unused variable
  drm/amd/display: Add missing prototypes to dcn201_init
  drm/amd/display: Turn global functions into static functions

 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c          |  4 +---
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c          |  4 +---
 drivers/gpu/drm/amd/amdgpu/umc_v8_7.c          |  7 -------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  4 ++--
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c    |  2 +-
 .../dc/clk_mgr/dcn10/rv1_clk_mgr_vbios_smu.c   |  3 ++-
 .../display/dc/clk_mgr/dcn316/dcn316_clk_mgr.c |  2 +-
 .../amd/display/dc/clk_mgr/dcn316/dcn316_smu.c | 18 +-----------------
 .../gpu/drm/amd/display/dc/core/dc_resource.c  |  2 +-
 .../amd/display/dc/dcn10/dcn10_hw_sequencer.c  |  3 ---
 .../drm/amd/display/dc/dcn201/dcn201_init.c    |  1 +
 .../display/dc/irq/dcn20/irq_service_dcn20.c   |  2 +-
 .../display/dc/irq/dcn201/irq_service_dcn201.c |  5 -----
 .../display/dc/irq/dcn21/irq_service_dcn21.c   | 14 --------------
 .../display/dc/irq/dcn30/irq_service_dcn30.c   |  2 +-
 .../gpu/drm/amd/display/dmub/inc/dmub_cmd.h    |  5 +----
 17 files changed, 15 insertions(+), 65 deletions(-)

-- 
2.35.1

