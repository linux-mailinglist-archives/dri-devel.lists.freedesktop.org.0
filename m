Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A442690321
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726C410E977;
	Thu,  9 Feb 2023 09:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F78610E977;
 Thu,  9 Feb 2023 09:17:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5985D5C594;
 Thu,  9 Feb 2023 09:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675934238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ml7xqopXK7A5EqVx8Pth7EJ9pqrEgGkNY2Z0ShZzDww=;
 b=FTJSeJy2PTBe309s4IjHoIUtGx5TluH4FO3tChxiV1/yc3/2hZ+HDP/aUxuVQG7J8oRxSc
 1wiNQCCTpswsCRyL5q4vmcoGXO2pg7LhKS8MXm2EGAScyOB1+H+fjrIYpFC9BSkY+ZqZ2A
 iPnzK/DA8VRdvPFzreAUWKj+B0eJ1pQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675934238;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ml7xqopXK7A5EqVx8Pth7EJ9pqrEgGkNY2Z0ShZzDww=;
 b=E9UvPa4U0zv969ZO7oFLi6xe/aB8btmtX7gzTr2fn5gDcIIDmIZaPbpTqhzVAz5GOsnUPB
 708ZLxYotTPcpjDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B5B61339E;
 Thu,  9 Feb 2023 09:17:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +20PBR665GPiJwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 09:17:18 +0000
Date: Thu, 9 Feb 2023 10:17:16 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <Y+S6HBmaRJNPYiBG@linux-uq9g>
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

here's the weekly PR for drm-misc-next-fixes.

Best regards
Thomas

drm-misc-next-fixes-2023-02-09:
Short summary of fixes pull:

Contains a number of fixes to vc4 and ivpu. The patches to the probe
helpers were cherry-picked from the regular development branch.
The following changes since commit 84cc4c7aecc4c6a17ea1030c49199ad7dc0a6b55:

  drm/client: fix kernel-doc warning in drm_client.h (2023-02-01 16:32:35 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2023-02-09

for you to fetch changes up to 467fbc77f673ecc9dcf4e58ffc1fa426a22df7fd:

  dt-bindings: display: panel: visionox,vtdr6130: add missing reg property (2023-02-09 09:28:31 +0100)

----------------------------------------------------------------
Short summary of fixes pull:

Contains a number of fixes to vc4 and ivpu. The patches to the probe
helpers were cherry-picked from the regular development branch.

----------------------------------------------------------------
Andrzej Kacprowski (2):
      accel/ivpu: Fix FW API data alignment issues
      accel/ivpu: Send VPU_JSM_MSG_CONTEXT_DELETE when deleting context

Arnd Bergmann (1):
      drm/vc4: allow DRM_VC4_KUNIT_TEST to be a loadable module

Dmitry Baryshkov (2):
      drm/probe_helper: extract two helper functions
      drm/probe_helper: sort out poll_running vs poll_enabled

Neil Armstrong (1):
      dt-bindings: display: panel: visionox,vtdr6130: add missing reg property

Stanislaw Gruszka (2):
      accel/ivpu: Set dma max_segment_size
      accel/ivpu: Fix old dma_buf api usage

 .../bindings/display/panel/visionox,vtdr6130.yaml  |  34 ++++---
 drivers/accel/ivpu/ivpu_drv.c                      |   2 +
 drivers/accel/ivpu/ivpu_fw.c                       |  37 ++++---
 drivers/accel/ivpu/ivpu_gem.c                      |   8 +-
 drivers/accel/ivpu/ivpu_job.c                      |   5 +-
 drivers/accel/ivpu/ivpu_jsm_msg.c                  |  11 +++
 drivers/accel/ivpu/ivpu_jsm_msg.h                  |   2 +-
 drivers/accel/ivpu/vpu_jsm_api.h                   |  67 +++++++------
 drivers/gpu/drm/drm_probe_helper.c                 | 108 ++++++++++++---------
 drivers/gpu/drm/vc4/Kconfig                        |   2 +-
 10 files changed, 165 insertions(+), 111 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
