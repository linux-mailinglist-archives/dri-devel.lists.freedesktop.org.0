Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8517499BE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 12:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3AE410E4D2;
	Thu,  6 Jul 2023 10:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6821E10E4CF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 10:48:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A3C55229D2;
 Thu,  6 Jul 2023 10:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688640534; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fdccDL/2gY7MVJiBv6HySUTnssAS/IzsINY4DdaHR98=;
 b=JbOuQ1uwS33lIYSEo7DM5MmTaKIf3b9IswyTcs7QkzZWJc6QWcbxBmJ5KecJmO0ils47LG
 /d44K6KDFcilxC5HynwVQXejSUpPTmvu1ZJOJobmRQDvlgWhAwCHUobMjZLVC0++mcMnYy
 Xp0WpMu3EXcCgzErT41Rli4VGyF1PdA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688640534;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=fdccDL/2gY7MVJiBv6HySUTnssAS/IzsINY4DdaHR98=;
 b=hOkVUUyhDO2O4Nr6IRJY3NuSB8KrmNGHLH8kdbGf/sAYqgtxcLKvyQfKqEWMaIVVjmAEtC
 A4jOjqtLkXIiE3Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69D6B138EE;
 Thu,  6 Jul 2023 10:48:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aeThGBacpmSDAQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 10:48:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	suijingfeng@loongson.cn,
	arnd@arndb.de
Subject: [PATCH v2 0/4] Remove unnecessary includes of <linux/screen_info.h>
Date: Thu,  6 Jul 2023 12:42:13 +0200
Message-ID: <20230706104852.27451-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
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
Cc: linux-fbdev@vger.kernel.org, linux-efi@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(was: arch,fbdev: Move screen_info into arch/)

Remove include statements of <linux/screen_info.h> The patches have
been reviewed as part of the patchset at [1]. Patch 1 has a fix to make
it build on loongarch. 

v2:
	* update loongarch

[1] https://patchwork.freedesktop.org/series/120010/#rev1

Thomas Zimmermann (4):
  efi: Do not include <linux/screen_info.h> from EFI header
  fbdev/sm712fb: Do not include <linux/screen_info.h>
  sysfb: Do not include <linux/screen_info.h> from sysfb header
  staging/sm750fb: Do not include <linux/screen_info.h>

 arch/arm/kernel/efi.c                         | 2 ++
 arch/arm64/kernel/efi.c                       | 1 +
 arch/loongarch/kernel/efi.c                   | 1 +
 drivers/firmware/efi/libstub/efi-stub-entry.c | 2 ++
 drivers/firmware/efi/libstub/screen_info.c    | 2 ++
 drivers/staging/sm750fb/sm750.c               | 1 -
 drivers/staging/sm750fb/sm750_accel.c         | 1 -
 drivers/staging/sm750fb/sm750_cursor.c        | 1 -
 drivers/staging/sm750fb/sm750_hw.c            | 1 -
 drivers/video/fbdev/sm712fb.c                 | 9 +++++++--
 include/linux/efi.h                           | 3 ++-
 include/linux/sysfb.h                         | 3 ++-
 12 files changed, 19 insertions(+), 8 deletions(-)

-- 
2.41.0

