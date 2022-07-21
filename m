Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A747F57C4F2
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 09:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A0F1134D1;
	Thu, 21 Jul 2022 07:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2EF10E511;
 Thu, 21 Jul 2022 07:06:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1367537ECF;
 Thu, 21 Jul 2022 07:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658387177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i5z9hp5Em/y1ykPLBh/uyT09OeDPKAfkydqr4ggHMzg=;
 b=VgPiJoeHG3C6IoJdmTCfogmNOL1kuBuoQwym2/VzXFS+mQKYSfdSRE6tfJeSF+EnZXigbu
 l9+vHy1iF8/JChUhR7S4fp43MfUX+vJcIwIfehFRndQ1de87xijDQAaMk8Qt96qT49horB
 l1l9kQ96fnMHgfLYBWELxhzIXYUDLG8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658387177;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i5z9hp5Em/y1ykPLBh/uyT09OeDPKAfkydqr4ggHMzg=;
 b=O0YuF/slW0K4/fqEd3nu7WiXs0HLOLcVfBzIBla7Eqz+S2vRucWtF16i1/Uk9n27xbDcju
 P5hKwoGjL3aLCPCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFAD5139FC;
 Thu, 21 Jul 2022 07:06:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RQLLMej62GLzBwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Jul 2022 07:06:16 +0000
Date: Thu, 21 Jul 2022 09:06:15 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <Ytj65+PdAJs4jIEO@linux-uq9g>
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's the drm-misc-next-fixes PR for this week.

Best regards
Thomas

drm-misc-next-fixes-2022-07-21:
Short summary of fixes pull:

 * amdgpu: Fix for drm buddy memory corruption
 * nouveau: PM fixes; DP fixes
The following changes since commit 7d09c7606346db9a48b62b4e02454a6b8f323043:

  drm/mgag200: Don't read-back PCI option register before writing (2022-07-14 15:14:45 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2022-07-21

for you to fetch changes up to 6f2c8d5f16594a13295d153245e0bb8166db7ac9:

  drm/amdgpu: Fix for drm buddy memory corruption (2022-07-15 15:41:51 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * amdgpu: Fix for drm buddy memory corruption
 * nouveau: PM fixes; DP fixes

----------------------------------------------------------------
Arunpravin Paneer Selvam (1):
      drm/amdgpu: Fix for drm buddy memory corruption

Lyude Paul (3):
      drm/nouveau/kms: Fix failure path for creating DP connectors
      drm/nouveau/acpi: Don't print error when we get -EINPROGRESS from pm_runtime
      drm/nouveau: Don't pm_runtime_put_sync(), only pm_runtime_put_autosuspend()

 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 16 ++++++++--------
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h |  2 +-
 drivers/gpu/drm/nouveau/nouveau_connector.c  |  8 +++-----
 drivers/gpu/drm/nouveau/nouveau_display.c    |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_fbcon.c      |  2 +-
 5 files changed, 15 insertions(+), 17 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
