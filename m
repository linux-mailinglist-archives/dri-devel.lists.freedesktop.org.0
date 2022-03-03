Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 383844CBAFE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 11:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F24B10EDAE;
	Thu,  3 Mar 2022 10:06:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33FF10EDA6;
 Thu,  3 Mar 2022 10:06:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 18FA4210FA;
 Thu,  3 Mar 2022 10:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646301984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MwGz3idXTAtvK1q0KZrl09HwUbeNyc5S3xmkznaxE+w=;
 b=iTdBHuOwelrmys/vWfCkYtXLtVrMzucVcLwBQofTAZt6b9L4etcHJzNh7PvYbpH6TtK+ab
 eU5jDgJk6yo4KDis4JppehaJlkNcLyTK5X9zNDdIOpaL7dsJLhxc4gael6ovsNPvMi+F6B
 hx5JcuXrjDzhG2zsgWrtCls+b0qibpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646301984;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MwGz3idXTAtvK1q0KZrl09HwUbeNyc5S3xmkznaxE+w=;
 b=/AaPAFQrRvSpSstmiQ7FWdAAV1WRizUvYFYlp5B4pEG4B1wyjsmrIkh3hZ1/CEqDo9cyAG
 m0cfpsXr4prkNJBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C7A8513AB4;
 Thu,  3 Mar 2022 10:06:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4jqiLx+TIGKEeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 03 Mar 2022 10:06:23 +0000
Date: Thu, 3 Mar 2022 11:06:17 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <YiCTGZ8IVCw0ilKK@linux-uq9g>
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

here's the drm-misc-fixes PR for this week.

Best regards
Thomas

drm-misc-fixes-2022-03-03:
 * drm/arm: Select DRM_GEM_CMEA_HELPER for HDLCD
 * drm/bridge: ti-sn65dsi86: Properly undo autosuspend
 * drm/vrr: Fix potential NULL-pointer deref
The following changes since commit ecbd4912a693b862e25cba0a6990a8c95b00721e:

  drm/edid: Always set RGB444 (2022-02-23 14:12:01 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-03-03

for you to fetch changes up to 62929726ef0ec72cbbe9440c5d125d4278b99894:

  drm/vrr: Set VRR capable prop only if it is attached to connector (2022-03-01 11:37:21 -0800)

----------------------------------------------------------------
 * drm/arm: Select DRM_GEM_CMEA_HELPER for HDLCD
 * drm/bridge: ti-sn65dsi86: Properly undo autosuspend
 * drm/vrr: Fix potential NULL-pointer deref

----------------------------------------------------------------
Carsten Haitzler (1):
      drm/arm: arm hdlcd select DRM_GEM_CMA_HELPER

Douglas Anderson (1):
      drm/bridge: ti-sn65dsi86: Properly undo autosuspend

Manasi Navare (1):
      drm/vrr: Set VRR capable prop only if it is attached to connector

 drivers/gpu/drm/arm/Kconfig           | 1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 +++--
 drivers/gpu/drm/drm_connector.c       | 3 +++
 3 files changed, 7 insertions(+), 2 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
(HRB 36809, AG Nürnberg)
Geschäftsführer: Felix Imendörffer
