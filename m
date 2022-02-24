Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF1A4C3586
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14B8C10E1CD;
	Thu, 24 Feb 2022 19:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9794110E1CD;
 Thu, 24 Feb 2022 19:16:12 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id i5so4378935oih.1;
 Thu, 24 Feb 2022 11:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n40igkM5fpLZE91wSpHa85KT0DIax0l2iCyVpysGJcc=;
 b=CzbgbwcVGX/WBH4XbrVbhqDUPdTI9ZHKQWSiHWJyt3saQW/NNWRgDAx+ambOI6/gYy
 WRUNWx4uXp8eU0gbNmuRHgN2DCrlNxAps4mDLs34bVqxsQhc0F6P8KczHctuOHAyw4NQ
 uEBQhlY8ng/tyr684AZO6AVCkgbnY0DHryBUC0LHHMAWQT8gIqAWpiSkVRvFqkGnxrSP
 PXFpwWCk+39h4HW2ydih+hOCGW4bIdw916DQnSGQWn30OgWLDjexpPl5bdoS52+8A+K4
 vnmq0LI+ErF4X/JNTUzphCrP+04w3WtqMVQ91bG/YW3n7dpUVkOAScYljG9GSiwyhKJc
 SGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n40igkM5fpLZE91wSpHa85KT0DIax0l2iCyVpysGJcc=;
 b=3zhH/AL+Xl42bvDJJ8wXy1uHj8Nf9xLFnh6r3aWYsyoG9DUtwVIrzlgpf7WxHD1BUB
 YtaFr/ExHP9j+54iMinD3hQKQmCbT8cCkytls9Gz5p25facvVaUXTg0NFEaO48Jv6ijw
 nsTjPUbGIveKi+ImJrUxtRLAnHJQmKSpZaPK/Qf/002hVQlv/8EbSpPfHSAuSTHzMsIw
 29IBUst9RoQ64y1fOkGwm8AIbF/u/CMKAFOsXC9u8RdpsyGvlvxVk/UqEUbYKpaWU8k/
 kRqPq0Oqz4k4cZsxWOG1ICaU1G3lQjSELxV86wuNP7Fci4lgdjuntQcj1JCZfBs4zF72
 93Ng==
X-Gm-Message-State: AOAM531dZidegfWclnWq1An6rA6cV08fkMRdOrscy614t0mHy6xUPpmM
 fgiiSq8MNTjDLLTkJ4jyYNU=
X-Google-Smtp-Source: ABdhPJyQKFGospMUmtjTUcVamd2qh9gUUUs4aJXtYL05staz72GZsPMYAdf2vzZDxTEY9Ymhmuz1+Q==
X-Received: by 2002:a05:6808:ecd:b0:2cd:90e5:25cb with SMTP id
 q13-20020a0568080ecd00b002cd90e525cbmr7785276oiv.128.1645730171832; 
 Thu, 24 Feb 2022 11:16:11 -0800 (PST)
Received: from localhost.localdomain (189-47-54-110.dsl.telesp.net.br.
 [189.47.54.110]) by smtp.gmail.com with ESMTPSA id
 w3-20020a056830110300b005af14392276sm79509otq.62.2022.02.24.11.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 11:16:10 -0800 (PST)
From: Magali Lemes <magalilemes00@gmail.com>
To: airlied@linux.ie, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, harry.wentland@amd.com, Rodrigo.Siqueira@amd.com,
 sunpeng.li@amd.com, Xinhui.Pan@amd.com
Subject: [PATCH 0/4] Address a few compilation warnings
Date: Thu, 24 Feb 2022 16:15:47 -0300
Message-Id: <20220224191551.69103-1-magalilemes00@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: siqueirajordao@riseup.net, Magali Lemes <magalilemes00@gmail.com>,
 maira.canal@usp.br, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, isabbasso@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset addresses a few warnings reported by the Kernel Test Robot and
sparse.

Magali Lemes (4):
  drm/amd/display: Adjust functions documentation
  drm/amd/display: Add conditional around function
  drm/amd/display: Use NULL instead of 0
  drm/amd/display: Turn functions into static

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c   | 4 +++-
 .../gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c  | 2 +-
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_smu.c  | 4 ++--
 drivers/gpu/drm/amd/display/dc/core/dc.c                    | 6 +++---
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c           | 2 +-
 drivers/gpu/drm/amd/display/dc/dce110/dce110_hw_sequencer.c | 4 ++--
 drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c     | 4 +---
 .../gpu/drm/amd/display/dc/irq/dcn315/irq_service_dcn315.c  | 2 +-
 8 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.25.1

