Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7835E3EA092
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 10:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E966E311;
	Thu, 12 Aug 2021 08:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F07A36E311;
 Thu, 12 Aug 2021 08:29:50 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 295EC1FF27;
 Thu, 12 Aug 2021 08:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628756988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gqce+MGHHAIMGxUT4gRVAmTc5R6KqmWj1xsQZ8yIXfo=;
 b=V9drmKJ4KNSKW/LrkQALSh8iVQ1KwLRouuRwyALIDKbej9NNVBqed6Ae2GZxgVFb0Zx7Bq
 ++YL0ZYExPb+aVml3izD7TiTesTTTkh+SziBvnsNV9ka+mnqZXOcDtlSn/JGTyK9L8lshz
 9ARCkadCzNXXlgUfYxhc1Iq6wqnGz9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628756988;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gqce+MGHHAIMGxUT4gRVAmTc5R6KqmWj1xsQZ8yIXfo=;
 b=cubfCAHY4Bhxd2AHtqHjU9yQ8Q7rtR1+as/lCjUsHCjHWMouJuZWdwcgK9x7ncNo14p9PC
 kkxiyM6YhxS0AuDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id CEE2013846;
 Thu, 12 Aug 2021 08:29:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id isAzMfvbFGFUDAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Aug 2021 08:29:47 +0000
Date: Thu, 12 Aug 2021 10:29:46 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org
Subject: [PULL] drm-misc-fixes
Message-ID: <YRTb+qUuBYWjJDVg@linux-uq9g.fritz.box>
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

only one bug fix in this week's drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2021-08-12:
Short summary of fixes pull:

 * meson: Fix colors when booting with HDR
The following changes since commit e89afb51f97ae03ee246c1fd0b47e3e491266aef:

  drm/vmwgfx: Fix a 64bit regression on svga3 (2021-08-02 21:00:37 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-08-12

for you to fetch changes up to bf33677a3c394bb8fddd48d3bbc97adf0262e045:

  drm/meson: fix colour distortion from HDR set during vendor u-boot (2021-08-10 10:00:02 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

 * meson: Fix colors when booting with HDR

----------------------------------------------------------------
Christian Hewitt (1):
      drm/meson: fix colour distortion from HDR set during vendor u-boot

 drivers/gpu/drm/meson/meson_registers.h | 5 +++++
 drivers/gpu/drm/meson/meson_viu.c       | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
