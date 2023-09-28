Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1197B15C1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 10:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A5710E5E1;
	Thu, 28 Sep 2023 08:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36EA10E5DE;
 Thu, 28 Sep 2023 08:12:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 870602186F;
 Thu, 28 Sep 2023 08:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695888732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=6X3/7g8w7Td+sWdV/Kb401xbbGEIOCzRHH09F4sKEMQ=;
 b=VHUm8LyU5xC6KPSId8V6OvyUNCfdKV+0jLsYobMUQcTg79GRgQYxvKoqpV6d6/cSFSkDSH
 64xHvyFhkI+E9o178rmYGmNdpMCoV+XxOlL4iPK12prtw01ukX/LVsiF3fk1d91G8NW31K
 5HDorlYKNhNz8GmJm8VdzlwM3yqCwRk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695888732;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=6X3/7g8w7Td+sWdV/Kb401xbbGEIOCzRHH09F4sKEMQ=;
 b=EGn8agQ4rzRtbjaUTJGxe7uFllnVovmlUaDEN9DBKXiY2bQvR+zaeYO6m4Q/95JC4wewlU
 lx4H5091zWdUnhCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1245D138E9;
 Thu, 28 Sep 2023 08:12:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PIOEA1w1FWXUQgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Sep 2023 08:12:12 +0000
Date: Thu, 28 Sep 2023 10:12:08 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230928081208.GA7881@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hi Dave and Daniel,

drm-misc-fixes, Intel VPU Edition. Only the ivpu driver received
fixes this week.

Best regards
Thomas

drm-misc-fixes-2023-09-28:
Short summary of fixes pull:

 * ivpu:
   * Add PCI ids for Arrow Lake
   * Fix memory corruption during IPC
   * Avoid dmesg flooding
   * 40xx: Wait for clock resource
   * 40xx: Fix interrupt usage
   * 40xx: Support caching when loading firmware
The following changes since commit f75f71b2c418a27a7c05139bb27a0c83adf88d19:

  fbdev/sh7760fb: Depend on FB=y (2023-09-21 10:33:49 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-09-28

for you to fetch changes up to 645d694559cab36fe6a57c717efcfa27d9321396:

  accel/ivpu: Use cached buffers for FW loading (2023-09-27 07:40:43 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * ivpu:
   * Add PCI ids for Arrow Lake
   * Fix memory corruption during IPC
   * Avoid dmesg flooding
   * 40xx: Wait for clock resource
   * 40xx: Fix interrupt usage
   * 40xx: Support caching when loading firmware

----------------------------------------------------------------
Jacek Lawrynowicz (1):
      accel/ivpu: Don't flood dmesg with VPU ready message

Karol Wachowski (4):
      accel/ivpu/40xx: Ensure clock resource ownership Ack before Power-Up
      accel/ivpu/40xx: Disable frequency change interrupt
      accel/ivpu/40xx: Fix missing VPUIP interrupts
      accel/ivpu: Use cached buffers for FW loading

Stanislaw Gruszka (2):
      accel/ivpu: Add Arrow Lake pci id
      accel/ivpu: Do not use wait event interruptible

 drivers/accel/ivpu/ivpu_drv.c         |  3 ++-
 drivers/accel/ivpu/ivpu_drv.h         |  2 ++
 drivers/accel/ivpu/ivpu_fw.c          |  8 +++++---
 drivers/accel/ivpu/ivpu_gem.h         |  5 +++++
 drivers/accel/ivpu/ivpu_hw_40xx.c     | 28 ++++++++++++++++++++--------
 drivers/accel/ivpu/ivpu_hw_40xx_reg.h |  2 ++
 drivers/accel/ivpu/ivpu_ipc.c         | 11 ++++-------
 7 files changed, 40 insertions(+), 19 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
