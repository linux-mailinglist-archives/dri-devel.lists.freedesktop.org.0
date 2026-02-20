Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GP9GxoSmGnG/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 08:49:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E285D165635
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 08:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402D110E1A6;
	Fri, 20 Feb 2026 07:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jkbzd5p6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE7ED10E1A6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 07:49:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 108C460054;
 Fri, 20 Feb 2026 07:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1115EC116C6;
 Fri, 20 Feb 2026 07:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771573780;
 bh=UzVeBE3iCh3DSBT9JWduA7mU0vNfL1xU4qqoBfwV5VA=;
 h=Date:From:To:Cc:Subject:From;
 b=jkbzd5p6L86cvUNE5W0/AIY/bChKdWTd1SrL2ZKRxlRP9nIiHUZJgxuGbPHkxruR0
 biqh344PmHRGvUrg6EwmYNQ7ayQGyKSCmtm6tvsgi3A7FQsbG4cM2iXXbCe+eMTbON
 tpStkzWaQnbfi7DsPAKUKMGu6pRxH9U20wDUpp1wq9IP6I0SKT78/1gmuCUSzo4dmF
 dsh+v8hHGDFC4Re0q+KU1vOGByyKUt99BtjDdOOJwnUTrJ6cKaKCSXKU/ifLqNhIRl
 693UkIkx58gWmFW70Ot5eBf2mVN2G3X8imOB98t+E5KeRVAB8vpCpWK4Guc8PAPJd3
 sHPL6190NLqSg==
Date: Fri, 20 Feb 2026 08:49:35 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: [GIT PULL] au1100fb fbdev updates for v7.0-rc1
Message-ID: <aZgSDyT2VcYM4R_Z@carbonx1>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:u.kleine-koenig@baylibre.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[deller@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Queue-Id: E285D165635
X-Rspamd-Action: no action

Hi Linus,

please pull a series of patches with code cleanups for the au1100fb driver.

Thanks!
Helge

----------------------------------------------------------------

The following changes since commit 26a4cfaff82a2dcb810f6bfd5f4842f9b6046c8a:

  Merge tag 'docs-7.0-2' of git://git.kernel.org/pub/scm/linux/kernel/git/docs/linux (2026-02-15 10:47:59 -0800)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-7.0-rc1-2

for you to fetch changes up to 0f967cb8ea04486953f85b249b42dda3de842053:

  fbdev: au1100fb: Replace license boilerplate by SPDX header (2026-02-19 17:38:17 +0100)

----------------------------------------------------------------
fbdev enhancements for 7.0-rc1:

A series with code cleanups for the au1100fb fbdev driver [Uwe Kleine-König].

----------------------------------------------------------------
Uwe Kleine-König (7):
      fbdev: au1100fb: Don't store device specific data in global variables
      fbdev: au1100fb: Mark several local functions as static
      fbdev: au1100fb: Use proper conversion specifiers in printk formats
      fbdev: au1100fb: Make driver compilable on non-mips platforms
      fbdev: au1100fb: Replace custom printk wrappers by pr_*
      fbdev: au1100fb: Fold au1100fb.h into its only user
      fbdev: au1100fb: Replace license boilerplate by SPDX header

 drivers/video/fbdev/Kconfig    |   3 +-
 drivers/video/fbdev/au1100fb.c | 487 ++++++++++++++++++++++++++++++++++-------
 drivers/video/fbdev/au1100fb.h | 379 --------------------------------
 3 files changed, 406 insertions(+), 463 deletions(-)
 delete mode 100644 drivers/video/fbdev/au1100fb.h
