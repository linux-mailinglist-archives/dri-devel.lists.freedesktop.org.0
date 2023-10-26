Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECC67D816C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 13:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90BA10E7B3;
	Thu, 26 Oct 2023 11:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F3010E7B6;
 Thu, 26 Oct 2023 11:01:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 210BC1FE3A;
 Thu, 26 Oct 2023 11:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1698318094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nWEVzbIxrOySVqHFCy1etrL/aopLoqZpztJaT29lCPc=;
 b=IMFNVHkIzDDINVMZxaBXLwHUEjbrNcc5V3duXF0nkoB/dLoSp38ecYx4t1k/m9vx9fBSSb
 Vvz29WlkvA68XccWrrzoB23BA/19HxUJmMXAM8VB0YJHypOQXjTqC04Kx1K+NJaCVrGvUe
 2GqNMcYsw6TZOpPFDXlk7OnusNZXw6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1698318094;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nWEVzbIxrOySVqHFCy1etrL/aopLoqZpztJaT29lCPc=;
 b=ZlL/lqloFWgdk+ylK4/k83yrtt1FjzFS5/mUqHTfxJ8jUqjqszSC8qV1g8BQ/CmAvdzYT+
 pWwMxEAARH1YI3CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D8A1D133F5;
 Thu, 26 Oct 2023 11:01:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id I0oENA1HOmUKZAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 26 Oct 2023 11:01:33 +0000
Date: Thu, 26 Oct 2023 13:01:32 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20231026110132.GA10591@linux-uq9g.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this is the week's PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2023-10-26:
Short summary of fixes pull:

amdgpu:
- ignore duplicated BOs in CS parser
- remove redundant call to amdgpu_ctx_priority_is_valid()

amdkfd:
- reserve fence slot while locking BO

dp_mst:
- Fix NULL deref in get_mst_branch_device_by_guid_helper()

logicvc:
- Kconfig: Select REGMAP and REGMAP_MMIO

ivpu:
- Fix missing VPUIP interrupts
The following changes since commit 8f5ad367e8b884772945c6c9fb622ac94b7d3e32:

  accel/ivpu: Extend address range for MMU mmap (2023-10-19 08:01:20 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-10-26

for you to fetch changes up to b132ac51d7a50c37683be56c96ff64f8c887930f:

  accel/ivpu/37xx: Fix missing VPUIP interrupts (2023-10-26 07:43:28 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

amdgpu:
- ignore duplicated BOs in CS parser
- remove redundant call to amdgpu_ctx_priority_is_valid()

amdkfd:
- reserve fence slot while locking BO

dp_mst:
- Fix NULL deref in get_mst_branch_device_by_guid_helper()

logicvc:
- Kconfig: Select REGMAP and REGMAP_MMIO

ivpu:
- Fix missing VPUIP interrupts

----------------------------------------------------------------
Christian König (2):
      drm/amdgpu: ignore duplicate BOs again
      drm/amdkfd: reserve a fence slot while locking the BO

Karol Wachowski (1):
      accel/ivpu/37xx: Fix missing VPUIP interrupts

Luben Tuikov (1):
      drm/amdgpu: Remove redundant call to priority_is_valid()

Lukasz Majczak (1):
      drm/dp_mst: Fix NULL deref in get_mst_branch_device_by_guid_helper()

Sui Jingfeng (1):
      drm/logicvc: Kconfig: select REGMAP and REGMAP_MMIO

 drivers/accel/ivpu/ivpu_hw_37xx.c                | 11 +++++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c          | 15 ++++++++-------
 drivers/gpu/drm/display/drm_dp_mst_topology.c    |  6 +++---
 drivers/gpu/drm/logicvc/Kconfig                  |  2 ++
 6 files changed, 21 insertions(+), 18 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
