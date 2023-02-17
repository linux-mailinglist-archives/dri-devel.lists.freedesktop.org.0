Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABED69B243
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 19:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F9A10E101;
	Fri, 17 Feb 2023 18:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8761A10E101;
 Fri, 17 Feb 2023 18:17:18 +0000 (UTC)
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4PJKjq6l37zDsQM;
 Fri, 17 Feb 2023 18:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1676657838; bh=ljYWqHk/W4DmopHLtXqwDebKXf5kt3kca31lwU7+J2g=;
 h=From:To:Cc:Subject:Date:From;
 b=RSsDLwTeMhutw+p0PlUt0UA8JnErpwbuc04PKaQ10hoL7OfYEue/xwZ81Ou/JzLku
 oThqxzIxW1tfvV/p1s/jNGY4YkCzX34cdw4lkhz6Xdqrd1iMDA5/r7dVdbGA9OMf+A
 YLO7l4yQF0AJkH93fmBn/A82BHrE+o48kc0F4edM=
X-Riseup-User-ID: E6ECEDAD15E74F07AA2B008D85CEAE51E1F60ADA9B850BE4E307FBCA09534630
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PJKjF6mNSz1yCw;
 Fri, 17 Feb 2023 18:14:57 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] Resolve warnings from AMDGPU
Date: Fri, 17 Feb 2023 15:14:06 -0300
Message-Id: <20230217181409.218008-1-arthurgrillo@riseup.net>
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

v1 -> v2: https://lore.kernel.org/all/20230213204923.111948-1-arthurgrillo@riseup.net/

- Use dm_odm_combine_mode_disabled dm_odm_combine_mode_2to1 instead of an enum casting
- Maintain register read

---

Arthur Grillo (3):
  drm/amd/display: Fix implicit enum conversion
  drm/amd/display: Remove unused local variables
  drm/amd/display: Remove unused local variables and function

 .../amd/display/dc/dcn10/dcn10_link_encoder.c |  3 +-
 .../drm/amd/display/dc/dcn201/dcn201_dpp.c    |  7 ----
 .../drm/amd/display/dc/dcn201/dcn201_hwseq.c  |  2 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c |  2 -
 .../gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c |  4 --
 .../drm/amd/display/dc/dcn30/dcn30_hwseq.c    |  3 --
 .../gpu/drm/amd/display/dc/dcn31/dcn31_apg.c  | 41 -------------------
 .../drm/amd/display/dc/dcn32/dcn32_resource.c |  5 +--
 .../display/dc/dcn32/dcn32_resource_helpers.c |  4 --
 .../dc/dml/dcn20/display_mode_vba_20.c        |  9 ++--
 .../dc/dml/dcn20/display_mode_vba_20v2.c      | 11 ++---
 .../dc/dml/dcn21/display_mode_vba_21.c        | 12 +++---
 .../dc/dml/dcn31/display_rq_dlg_calc_31.c     |  2 -
 .../dc/link/protocols/link_dp_capability.c    |  4 --
 14 files changed, 19 insertions(+), 90 deletions(-)

-- 
2.39.2

