Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7366C6191
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 09:24:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D272310E2AB;
	Thu, 23 Mar 2023 08:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C08710E0ED;
 Thu, 23 Mar 2023 08:24:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 16D1A33B63;
 Thu, 23 Mar 2023 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679559843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4w9r6Q0E7jeLVI2fkecPUDfIAXkoMgIQoXKd2lmMmOk=;
 b=z5ZIHi0xQ4zbmIKmsrpLKB1lCXejTXb5q6SBqQvizvXLA3b9oVkEQ2uJj+8V8adiLE9vto
 CZ3QphN7JTZjj5/P7EeHfN/qBOjpE3BcWaqGzBo4E7QeTWzakPUs4fZqF7vCFKgY7OUHop
 wfFpwYTrouDOimEnfHNXYNiAUBPfo+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679559843;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4w9r6Q0E7jeLVI2fkecPUDfIAXkoMgIQoXKd2lmMmOk=;
 b=9n4InMC90+EwT+u7JkVhhVICj6cKli4g6MqRdTVxC01kkRMNkZh/N3GH1yBZAizmHrHDXz
 0d2GW8p4Vp3znPDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CBEAD132C2;
 Thu, 23 Mar 2023 08:24:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9WTcMKIMHGSPIQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Mar 2023 08:24:02 +0000
Date: Thu, 23 Mar 2023 09:24:01 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20230323082401.GA8371@linux-uq9g>
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

here's the weekly PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2023-03-23:
Short summary of fixes pull:

 * fixes for bind and probing error handling
 * panel-orientation fixes for Lenovo Book X90F
The following changes since commit 4028cbf867f70a3c599c9b0c9509334c56ed97d7:

  drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*() conversion again (2023-03-15 10:06:46 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-03-23

for you to fetch changes up to 1a70ca89d59c7c8af006d29b965a95ede0abb0da:

  drm/bridge: lt8912b: return EPROBE_DEFER if bridge is not found (2023-03-22 18:01:57 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

 * fixes for bind and probing error handling
 * panel-orientation fixes for Lenovo Book X90F

----------------------------------------------------------------
Hans de Goede (1):
      drm: panel-orientation-quirks: Add quirk for Lenovo Yoga Book X90F

Johan Hovold (1):
      drm/meson: fix missing component unbind on bind errors

Matheus Castello (1):
      drm/bridge: lt8912b: return EPROBE_DEFER if bridge is not found

 drivers/gpu/drm/bridge/lontium-lt8912b.c       |  4 ++--
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 13 ++++++++++---
 drivers/gpu/drm/meson/meson_drv.c              | 13 ++++++++-----
 3 files changed, 20 insertions(+), 10 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
