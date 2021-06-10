Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4533A29FD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:16:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCAD6ECFE;
	Thu, 10 Jun 2021 11:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF026ECFE;
 Thu, 10 Jun 2021 11:15:56 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AADEA21A24;
 Thu, 10 Jun 2021 11:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623323754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KPkeWPOWywAL8VyLGcjXNCoMMiLWZc8fOKIBbx0sc1E=;
 b=JOu7qo49NyzpFx85vYSLKzPmbBJUc1WWuefeFxRDtBb3q15rNxiVRoZ3QyC7nCkFQBSmVi
 Y34/MAGRpM3J+qrsZIO/QQ08OGh91ilSaWPzaZw5dyEdbqC2QgjVHe84XmBbxF6n9lpZGS
 dBXwh9mDaBQUYdPuJLzO3i3VuJPId08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623323754;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KPkeWPOWywAL8VyLGcjXNCoMMiLWZc8fOKIBbx0sc1E=;
 b=jUmGEmqYGURY7lD8KpoACqGV0zzGJ+zjaDalGSi2CA9LWm7feSPUTEXrLIixppuYwQSBUc
 1LGjwiGPLk8j5jBQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7098F118DD;
 Thu, 10 Jun 2021 11:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623323754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KPkeWPOWywAL8VyLGcjXNCoMMiLWZc8fOKIBbx0sc1E=;
 b=JOu7qo49NyzpFx85vYSLKzPmbBJUc1WWuefeFxRDtBb3q15rNxiVRoZ3QyC7nCkFQBSmVi
 Y34/MAGRpM3J+qrsZIO/QQ08OGh91ilSaWPzaZw5dyEdbqC2QgjVHe84XmBbxF6n9lpZGS
 dBXwh9mDaBQUYdPuJLzO3i3VuJPId08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623323754;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KPkeWPOWywAL8VyLGcjXNCoMMiLWZc8fOKIBbx0sc1E=;
 b=jUmGEmqYGURY7lD8KpoACqGV0zzGJ+zjaDalGSi2CA9LWm7feSPUTEXrLIixppuYwQSBUc
 1LGjwiGPLk8j5jBQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id vF2aGWr0wWCYdgAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Jun 2021 11:15:54 +0000
Date: Thu, 10 Jun 2021 13:15:53 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next
Message-ID: <YMH0ad8qoREx9YZK@linux-uq9g>
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

here's the second PR for drm-misc-next for this week, and the final one
for 5.14. I backmerged drm-next for the TTM changes. As for highlights
nouveau now has eDP backlight support and udmabuf supports huge pages.

Best regards
Thomas

drm-misc-next-2021-06-10:
drm-misc-next for 5.14:

UAPI Changes:

Cross-subsystem Changes:

 * dma-buf: Support huge pages in udmabuf

Core Changes:

 * Backmerge of drm/drm-next

 * drm/dp: Import eDP backlight code from i915

Driver Changes:

 * drm/bridge: TI SN65DSI83: Fix sparse warnings

 * drm/i915: Cleanup eDP backlight code before moving it into helper

 * drm/nouveau: Support DPCD backlights; Fix GEM init for internal BOs
The following changes since commit c707b73f0cfb1acc94a20389aecde65e6385349b:

  Merge tag 'amd-drm-next-5.14-2021-06-09' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2021-06-10 13:47:13 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-2021-06-10

for you to fetch changes up to 86441fa29e57940eeb00f35fefb1853c1fbe67bb:

  Merge drm/drm-next into drm-misc-next (2021-06-10 12:18:54 +0200)

----------------------------------------------------------------
drm-misc-next for 5.14:

UAPI Changes:

Cross-subsystem Changes:

 * dma-buf: Support huge pages in udmabuf

Core Changes:

 * Backmerge of drm/drm-next

 * drm/dp: Import eDP backlight code from i915

Driver Changes:

 * drm/bridge: TI SN65DSI83: Fix sparse warnings

 * drm/i915: Cleanup eDP backlight code before moving it into helper

 * drm/nouveau: Support DPCD backlights; Fix GEM init for internal BOs

----------------------------------------------------------------
Christian König (1):
      drm/nouveau: init the base GEM fields for internal BOs

Lyude Paul (9):
      drm/i915/dpcd_bl: Remove redundant AUX backlight frequency calculations
      drm/i915/dpcd_bl: Handle drm_dpcd_read/write() return values correctly
      drm/i915/dpcd_bl: Cleanup intel_dp_aux_vesa_enable_backlight() a bit
      drm/i915/dpcd_bl: Cache some backlight capabilities in intel_panel.backlight
      drm/i915/dpcd_bl: Move VESA backlight enabling code closer together
      drm/i915/dpcd_bl: Return early in vesa_calc_max_backlight if we can't read PWMGEN_BIT_COUNT
      drm/i915/dpcd_bl: Print return codes for VESA backlight failures
      drm/dp: Extract i915's eDP backlight code into DRM helpers
      drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau

Marek Vasut (1):
      drm/bridge: ti-sn65dsi83: Fix sparse warnings

Thomas Zimmermann (1):
      Merge drm/drm-next into drm-misc-next

Vivek Kasireddy (1):
      udmabuf: Add support for mapping hugepages (v4)

 drivers/dma-buf/udmabuf.c                          |  50 ++-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c              |  21 +-
 drivers/gpu/drm/drm_dp_helper.c                    | 347 +++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_display_types.h |   2 +-
 .../gpu/drm/i915/display/intel_dp_aux_backlight.c  | 329 +++----------------
 drivers/gpu/drm/nouveau/dispnv50/disp.c            |  28 ++
 drivers/gpu/drm/nouveau/nouveau_backlight.c        | 166 +++++++++-
 drivers/gpu/drm/nouveau/nouveau_bo.c               |   6 +
 drivers/gpu/drm/nouveau/nouveau_connector.h        |   9 +-
 drivers/gpu/drm/nouveau/nouveau_encoder.h          |   1 +
 include/drm/drm_dp_helper.h                        |  48 +++
 11 files changed, 682 insertions(+), 325 deletions(-)

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
