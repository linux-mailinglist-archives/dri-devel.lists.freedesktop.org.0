Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 067453B91BE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 14:43:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC846EAD7;
	Thu,  1 Jul 2021 12:43:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832E16E902
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 12:43:20 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3A561228BB;
 Thu,  1 Jul 2021 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625143399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9Pqm1HrFYJtLPR9in514QsO+tnXs/QpcsRtp4j6oxD4=;
 b=0UINKcjNT9BRDYTg5mHr6a4yqbrJ8jDhEyxfzOJChGtHHV0G6RVhYoVlvmIugnwSQmmY3x
 1kKFk6slzFxeG9AL2TwjUZDMKFIsJ49Qi959yv09nqte7ayce8c6AveL5uyIs2m2gPv0xq
 1n+mBdSCEl1Cs3W9b8D4wlPQO6Q3aDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625143399;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9Pqm1HrFYJtLPR9in514QsO+tnXs/QpcsRtp4j6oxD4=;
 b=mitjaOq/U+vr71UaR2aEg/dryGzEWPs9LXrOpyX2aJSX3kYEFKzQdb3Ba0VgfA6M6pCP9J
 Aa1gHzHlLfcV1TBg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 0E7EB11CC0;
 Thu,  1 Jul 2021 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625143399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9Pqm1HrFYJtLPR9in514QsO+tnXs/QpcsRtp4j6oxD4=;
 b=0UINKcjNT9BRDYTg5mHr6a4yqbrJ8jDhEyxfzOJChGtHHV0G6RVhYoVlvmIugnwSQmmY3x
 1kKFk6slzFxeG9AL2TwjUZDMKFIsJ49Qi959yv09nqte7ayce8c6AveL5uyIs2m2gPv0xq
 1n+mBdSCEl1Cs3W9b8D4wlPQO6Q3aDg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625143399;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=9Pqm1HrFYJtLPR9in514QsO+tnXs/QpcsRtp4j6oxD4=;
 b=mitjaOq/U+vr71UaR2aEg/dryGzEWPs9LXrOpyX2aJSX3kYEFKzQdb3Ba0VgfA6M6pCP9J
 Aa1gHzHlLfcV1TBg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id vLn2AWe43WAmKwAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 01 Jul 2021 12:43:19 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@redhat.com
Subject: [PATCH 0/4] mgag200: Various cleanups
Date: Thu,  1 Jul 2021 14:43:12 +0200
Message-Id: <20210701124316.20818-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Cleanup several nits in the driver's init code. Also move constant
data into the RO data segment. No functional changes.

Tested on mgag200 HW.

Thomas Zimmermann (4):
  drm/mgag200: Don't pass flags to drm_dev_register()
  drm/mgag200: Inline mgag200_device_init()
  drm/mgag200: Extract device type and flags in mgag200_pci_probe()
  drm/mgag200: Constify LUT for programming bpp

 drivers/gpu/drm/mgag200/mgag200_drv.c  | 62 +++++++++++++-------------
 drivers/gpu/drm/mgag200/mgag200_drv.h  | 14 ------
 drivers/gpu/drm/mgag200/mgag200_mode.c | 16 +++----
 3 files changed, 36 insertions(+), 56 deletions(-)


base-commit: 67f5a18128770817e4218a9e496d2bf5047c51e8
--
2.32.0

