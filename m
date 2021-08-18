Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A193F0BA6
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 21:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9E36E92C;
	Wed, 18 Aug 2021 19:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BBE6E929;
 Wed, 18 Aug 2021 19:18:09 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C431D1FFEA;
 Wed, 18 Aug 2021 19:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629314287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mIZRvehKTnrcYymWcg07or6boPgne2Fx3BpA5eaVurU=;
 b=S5J9Hem1b+Ek+GJTkTNZvF4nlldcCCBbLAeb7JOsOw5wINyF0RFy+pM6Z7/A0Aj16X9I+O
 CpiGKC1PPv3PwqFTMf/L99kBCriSDmVvcSIfBqGLTSnYDlIP8oYs6QzqCECrE7zM9MlFho
 u+YhjZh7fcVKpI3Cpu9ta2AadtbCyVs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629314287;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mIZRvehKTnrcYymWcg07or6boPgne2Fx3BpA5eaVurU=;
 b=ZkhR8SnzQgDHpAFRDmoS3zNs4EZZt0SYYUrTAjgQu9A2qCkrm/LmhPBsuK0DIxMBJLMDCa
 V+Y3LD073bRx3TAA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0FA161371C;
 Wed, 18 Aug 2021 19:18:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id fExWN+5cHWEdMAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 18 Aug 2021 19:18:06 +0000
Date: Wed, 18 Aug 2021 21:18:05 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <YR1c7cG1IaL+g8EN@linux-uq9g.fritz.box>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's the drm-misc-fixes PR for this week. The vblank fix is a UAPI
change that unifies the behaviour of the regular and compat ioctl.

Best regards
Thomas

drm-misc-fixes-2021-08-18:
Short summary of fixes pull:

 * UAPI: Return results for failed drm_wait_vblank_ioctl()
 * ttm: Fix debugfs initialization
The following changes since commit bf33677a3c394bb8fddd48d3bbc97adf0262e045:

  drm/meson: fix colour distortion from HDR set during vendor u-boot (2021-08-10 10:00:02 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-08-18

for you to fetch changes up to fa0b1ef5f7a694f48e00804a391245f3471aa155:

  drm: Copy drm_wait_vblank to user before returning (2021-08-17 13:56:03 -0400)

----------------------------------------------------------------
Short summary of fixes pull:

 * UAPI: Return results for failed drm_wait_vblank_ioctl()
 * ttm: Fix debugfs initialization

----------------------------------------------------------------
Dan Moulding (1):
      drm: ttm: Don't bail from ttm_global_init if debugfs_create_dir fails

Mark Yacoub (1):
      drm: Copy drm_wait_vblank to user before returning

 drivers/gpu/drm/drm_ioc32.c      | 4 +---
 drivers/gpu/drm/ttm/ttm_device.c | 2 --
 2 files changed, 1 insertion(+), 5 deletions(-)

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
