Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 968CF5FD943
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 14:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87A410E8A4;
	Thu, 13 Oct 2022 12:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C6910E8AC;
 Thu, 13 Oct 2022 12:37:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7D31A1F74A;
 Thu, 13 Oct 2022 12:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665664632; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g3M6nNDdh4dr179mxdmmhC3iID0pjpvGdheURCQW2QI=;
 b=W13s8SyxeUOE8xLRUgMrv/vl4dUzFBnJvphPXjlhnQIEQ6ZAHU8tPmQiEyp0EtEOeCRbD1
 9C3gnSfnhM3l/TRFHPaDWKRSFkak2V+HSa8YwBy8UhqXkMFVO+YSEt1g79ZozSzUuPbheZ
 YkfrzRd7kzff8JMpmTtxr8AJAkXiAFQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665664632;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g3M6nNDdh4dr179mxdmmhC3iID0pjpvGdheURCQW2QI=;
 b=0EEKUaiMoDhL9vD0xBqdHsp4TQZitvniZm56zwdWfH9gMpZg39ADvNYP4rt5k3tQLi0ptB
 8q95TkaawZv/FoAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 35EDA139F3;
 Thu, 13 Oct 2022 12:37:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id frEODHgGSGP3DgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Oct 2022 12:37:12 +0000
Date: Thu, 13 Oct 2022 14:37:10 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <Y0gGdlujszCstDeP@linux-uq9g>
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

this is the weekly PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2022-10-13:
Short summary of fixes pull:

 * vc4: HDMI fixes
The following changes since commit cc62d98bd56d45de4531844ca23913a15136c05b:

  Revert "drm: bridge: analogix/dp: add panel prepare/unprepare in suspend/resume time" (2022-09-23 07:15:18 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-10-13

for you to fetch changes up to 4190e8bbcbc77a9c36724681801cedc5229e7fc2:

  drm/vc4: hdmi: Check the HSM rate at runtime_resume (2022-10-13 13:57:04 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * vc4: HDMI fixes

----------------------------------------------------------------
Maxime Ripard (3):
      drm/vc4: Add module dependency on hdmi-codec
      drm/vc4: hdmi: Enforce the minimum rate at runtime_resume
      drm/vc4: hdmi: Check the HSM rate at runtime_resume

 drivers/gpu/drm/vc4/vc4_drv.c  |  1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
