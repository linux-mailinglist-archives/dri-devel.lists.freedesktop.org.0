Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F33C69522A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 21:49:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4432A10E714;
	Mon, 13 Feb 2023 20:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7207110E713;
 Mon, 13 Feb 2023 20:49:50 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4PFxKp11kxzDrt1;
 Mon, 13 Feb 2023 20:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1676321390; bh=wZ2k6D1sf+LAhw4sQy5FBqNVX/9/c++77YoxwTZ/l74=;
 h=From:To:Cc:Subject:Date:From;
 b=NiOI0dUKmW9qxTAQBFZ3KnDSwEBmU5aVk+uUw+r9sjcxp1RdlvXo7KVexYHihKIbk
 Vr29XkSSZWvdTOFHiIXKlZWnVVfGxRv6xNx3+I9+SoZA/8AwbJplnoJmZQg66zZ0zd
 rHs1O3Dcjd//hQwHuoPdySxpIR6R39az2i2wiwFs=
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4PFxKn1Zs2z9ssg;
 Mon, 13 Feb 2023 20:49:49 +0000 (UTC)
X-Riseup-User-ID: B6C2F566C47B4AEFE85B775391F6C3F1DED2A77D0E80149B80AD474C46AEA140
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PFxKd1Jpjz1yNK;
 Mon, 13 Feb 2023 20:49:40 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 00/10] Resolve warnings from AMDGPU
Date: Mon, 13 Feb 2023 17:49:13 -0300
Message-Id: <20230213204923.111948-1-arthurgrillo@riseup.net>
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Arthur Grillo <arthurgrillo@riseup.net>,
 mairacanal@riseup.net, alexander.deucher@amd.com, andrealmeid@riseup.net,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series resolve some of the warnings that appear when compiling AMDGPU
with W=1.

Each patch is focused in a specific warning.

This is my First Patch for the GSoC Project Idea about increasing code
coverage of the DRM code[1].

Thanks for reviewing!

Best regards,
Arthur Grillo

[1]: https://www.x.org/wiki/DRMcoverage2023/#firstpatch

---

Arthur Grillo (10):
  drm/amd/display: Turn global functions into static
  drm/amd/display: Add function prototypes to headers
  drm/amd/amdgpu: Add function prototypes to headers
  drm/amd/display: Add previously missing includes
  drm/amd/display: Fix excess arguments on kernel-doc
  drm/amd/display: Fix implicit enum conversion
  drm/amd/amdgpu: Deal with possible fail allocation
  drm/amd/display: Remove unused local variables
  drm/amd/display: Make variables declaration inside ifdef guard
  drm/amd/display: Remove unused local variables and function

 drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_ucode.h     |  1 +
 drivers/gpu/drm/amd/amdgpu/sdma_v6_0.c        | 15 ++++---
 .../dc/clk_mgr/dcn315/dcn315_clk_mgr.c        |  2 +-
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c  |  2 +-
 .../drm/amd/display/dc/dcn10/dcn10_dpp_dscl.c |  2 +-
 .../amd/display/dc/dcn10/dcn10_link_encoder.c |  3 --
 .../drm/amd/display/dc/dcn201/dcn201_dpp.c    |  7 ----
 .../drm/amd/display/dc/dcn201/dcn201_hwseq.c  |  2 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c |  2 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c |  4 --
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |  3 --
 .../gpu/drm/amd/display/dc/dcn31/dcn31_apg.c  | 41 -------------------
 .../drm/amd/display/dc/dcn31/dcn31_hubbub.h   |  2 +
 .../drm/amd/display/dc/dcn32/dcn32_hubbub.h   |  2 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h |  2 +
 .../gpu/drm/amd/display/dc/dcn32/dcn32_init.c |  1 +
 .../drm/amd/display/dc/dcn32/dcn32_resource.c |  5 +--
 .../display/dc/dcn32/dcn32_resource_helpers.c |  4 --
 .../dc/dml/dcn20/display_mode_vba_20.c        |  9 ++--
 .../dc/dml/dcn20/display_mode_vba_20v2.c      | 10 ++---
 .../dc/dml/dcn21/display_mode_vba_21.c        | 12 +++---
 .../dc/dml/dcn31/display_mode_vba_31.c        |  4 ++
 .../dc/dml/dcn31/display_rq_dlg_calc_31.c     |  2 -
 .../dc/dml/dcn314/display_mode_vba_314.c      |  4 ++
 .../dc/irq/dcn201/irq_service_dcn201.c        |  2 +-
 .../dc/link/accessories/link_dp_trace.c       |  1 +
 .../dc/link/protocols/link_dp_capability.c    |  4 --
 28 files changed, 47 insertions(+), 103 deletions(-)

-- 
2.39.1

