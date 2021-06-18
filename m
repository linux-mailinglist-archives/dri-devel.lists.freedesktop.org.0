Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AD63AC6A5
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 10:58:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368886E99A;
	Fri, 18 Jun 2021 08:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127216E998;
 Fri, 18 Jun 2021 08:58:14 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B089621ACA;
 Fri, 18 Jun 2021 08:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624006692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yvC5i/r5SAQg9pojYeOAMekoljsB4R2HJiZhKtU+M20=;
 b=zWkZ2W51Rj9l3XzN1HQpULMYBd6dijMNcltmq5xIPYDO6RLipB4jTgTedk69Q/oNlvzqSp
 Vj1qJYPG6gG7/lhNtfiemILCGPQV9+SQ7wDskriTl7Lesz6GaJe6sdZ8NeSVtNc/8MxXUY
 ocLGtUCDlx/+9jcj5bcIzJz8bT8oIJ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624006692;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yvC5i/r5SAQg9pojYeOAMekoljsB4R2HJiZhKtU+M20=;
 b=RNr84aC0ZlOj2k+3q2Vw8xeIQ1YF5rCFKEbcHl0gkrr/9eyvZBLxrPl8IZYLZmdDIvbWSY
 0guUXGYkMosR58Bw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7A5B6118DD;
 Fri, 18 Jun 2021 08:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624006692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yvC5i/r5SAQg9pojYeOAMekoljsB4R2HJiZhKtU+M20=;
 b=zWkZ2W51Rj9l3XzN1HQpULMYBd6dijMNcltmq5xIPYDO6RLipB4jTgTedk69Q/oNlvzqSp
 Vj1qJYPG6gG7/lhNtfiemILCGPQV9+SQ7wDskriTl7Lesz6GaJe6sdZ8NeSVtNc/8MxXUY
 ocLGtUCDlx/+9jcj5bcIzJz8bT8oIJ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624006692;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yvC5i/r5SAQg9pojYeOAMekoljsB4R2HJiZhKtU+M20=;
 b=RNr84aC0ZlOj2k+3q2Vw8xeIQ1YF5rCFKEbcHl0gkrr/9eyvZBLxrPl8IZYLZmdDIvbWSY
 0guUXGYkMosR58Bw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 6LTpHCRgzGAdJAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Jun 2021 08:58:12 +0000
Date: Fri, 18 Jun 2021 10:58:11 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <YMxgI1oluBpPyfu6@linux-uq9g.fritz.box>
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's the extra PR for drm-misc-next-fixes for this week. In addition
to the previous fixes, it only contains the dp_mst build fix.

Best regards
Thomas

drm-misc-next-fixes-2021-06-18:
Short summary of fixes pull:

 * hyperv: advertise the correct formatmodifiers for its primary plane
 * dp_mst: VCPI fixes to make it work with StarTech hub; Fix build error

The following changes since commit 1bd8a7dc28c1c410f1ceefae1f2a97c06d1a67c2:

  Merge tag 'exynos-drm-next-for-v5.14' of git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos into drm-next (2021-06-11 14:19:12 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2021-06-18

for you to fetch changes up to 24ff3dc18b99c4b912ab1746e803ddb3be5ced4c:

  drm/dp_mst: Add missing drm parameters to recently added call to drm_dbg_kms() (2021-06-16 15:53:15 -0400)

----------------------------------------------------------------
Short summary of fixes pull:

 * hyperv: advertise the correct formatmodifiers for its primary plane
 * dp_mst: VCPI fixes to make it work with StarTech hub; Fix build error

----------------------------------------------------------------
José Roberto de Souza (1):
      drm/dp_mst: Add missing drm parameters to recently added call to drm_dbg_kms()

Pu Lehui (1):
      drm/hyperv: Fix unused const variable 'hyperv_modifiers'

Wayne Lin (2):
      drm/dp_mst: Do not set proposed vcpi directly
      drm/dp_mst: Avoid to mess up payload table by ports in stale topology

 drivers/gpu/drm/drm_dp_mst_topology.c       | 68 ++++++++++++++++++-----------
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |  2 +-
 2 files changed, 43 insertions(+), 27 deletions(-)

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
