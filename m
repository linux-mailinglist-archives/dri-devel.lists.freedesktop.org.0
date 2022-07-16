Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C685771CC
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 00:26:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448B510F006;
	Sat, 16 Jul 2022 22:25:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C03B210EE28;
 Sat, 16 Jul 2022 22:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PMs68WYNHJhkS1kcL7j8c65He4Lc5Yr6NcHeOzGMwok=; b=WAaZAKFbCqOjMCMCR7o1WiKjO8
 zE26eq3kCQDj5UBRHvNzAraxlBNtu6GZr0EYvdq1b6tjYvnRHToX/HDoxj1r95wZmH6LljHsoUwE0
 G1xvoaMKQHfNXIihUTWuW4Wj2c9q7zJu6+OFfP2XAEAQups4MnS2kg4tY2RMUnrJ+wMaHfMY4DEgs
 BnAYOIgjdP91Hu8lwVBgjyX2jLriF45u6FMhEpckNN0PFpAWEYKphWFQK/zElMzH2s5iWEcTwYuWN
 9oLp+3cYAnkzV3jF9E0/enx0rcYeXn5RDlFI142s+WsW1PgOFj5DYVaCXtxUiBsJ818Xc/GhxytVj
 Kjg6pPiw==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oCqEG-00274N-Js; Sun, 17 Jul 2022 00:25:40 +0200
From: Melissa Wen <mwen@igalia.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com
Subject: [PATCH 0/4] Documentation/amdgpu/display: describe color and blend
 mode properties mapping
Date: Sat, 16 Jul 2022 21:25:25 -0100
Message-Id: <20220716222529.421115-1-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
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
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 nicholas.kazlauskas@amd.com, amd-gfx@lists.freedesktop.org,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patches 1 and 2 describe DM mapping of DRM color correction properties
to DC interface and where detached from 3D LUT RFC series [1]. Patches 3
and 4 describe MPC block programming that matches the three DRM blend
modes and came from previous work [2][3] and discussions on AMD issue
tracker. Let me know any misleading information.

[1] https://lore.kernel.org/amd-gfx/20220619223104.667413-1-mwen@igalia.com/
[2] https://lore.kernel.org/amd-gfx/20220329201835.2393141-1-mwen@igalia.com/
[3] https://lore.kernel.org/amd-gfx/7a95d6a4-bc2f-b0e8-83f8-8cc5b75599f2@amd.com/

Melissa Wen (4):
  Documentation/amdgpu_dm: Add DM color correction documentation
  Documentation/amdgpu/display: add DC color caps info
  drm/amd/display: add doc entries for MPC blending configuration
  Documentation/gpu/amdgpu/amdgpu_dm: add DM docs for pixel blend mode

 .../amdgpu/display/dcn2_cm_drm_current.svg    | 1370 +++++++++++++++
 .../amdgpu/display/dcn3_cm_drm_current.svg    | 1529 +++++++++++++++++
 .../gpu/amdgpu/display/display-manager.rst    |  142 ++
 Documentation/gpu/drm-kms.rst                 |    2 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   |  121 +-
 drivers/gpu/drm/amd/display/dc/dc.h           |   74 +-
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   |   91 +-
 7 files changed, 3270 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/gpu/amdgpu/display/dcn2_cm_drm_current.svg
 create mode 100644 Documentation/gpu/amdgpu/display/dcn3_cm_drm_current.svg

-- 
2.35.1

