Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ME4lLzmOrGkYqwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 21:44:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEAD22D8C9
	for <lists+dri-devel@lfdr.de>; Sat, 07 Mar 2026 21:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC70510E215;
	Sat,  7 Mar 2026 20:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JhTmnhbv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AACA10E215
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Mar 2026 20:44:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BBFEC60051;
 Sat,  7 Mar 2026 20:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6002C19423;
 Sat,  7 Mar 2026 20:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772916276;
 bh=oY0s3W/hYUWrijfF6RWam4IbufwGlzeBGFnSWdw4w5U=;
 h=Date:From:To:Cc:Subject:From;
 b=JhTmnhbvQRC6xFqEylAw2qDd32ZiTar7Vd/U6oDeApqA9jP+4jdD3N7xLmfQRu2Tv
 G2Q2Bi76fyclIuRNbbMu9ocZIAI7ezLF2M0vmS6Z6wXD3qiCXIjwPmmm4GdY4DCRP5
 ytslczVgch+7sl1JhY4zB92hxeVbLw3vZoOlJlDqe8I+2kE5w5khcnohwezegRWOZO
 fdCuJcG/3FdzNA8O9J42unqD7/nTOl8Jn5t6rtwOh2TLPmJ+nAM8DTl/JjLmOW/piq
 lUwEiY0AUhLr9xElKlv3Wt0SBQVQ0m25XgJVe2RvsApOQBcYv8+ON5D8XKN1mKoYWK
 9Gv3i8gEyMf3A==
Date: Sat, 7 Mar 2026 21:44:31 +0100
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Uwe =?iso-8859-15?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: [GIT PULL] fbdev fix for v7.0-rc3
Message-ID: <aayOLznDX70UUs6T@carbonx1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
X-Rspamd-Queue-Id: 3EEAD22D8C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:u.kleine-koenig@baylibre.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[deller@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.988];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Hi Linus,

please pull one patch for the au1100fb driver to
fix a build error reported by the kernel test robot.

Thanks!
Helge

----------------------------------------------------------------
The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-7.0-rc3

for you to fetch changes up to e31a374a99f5026df6ebff2a1c49492276e776fd:

  fbdev: au1100fb: Fix build on MIPS64 (2026-03-05 17:35:12 +0100)

----------------------------------------------------------------
fbdev fixes for kernel v7.0-rc3:

Silence build error in au1100fb driver found by kernel test robot

----------------------------------------------------------------
Helge Deller (1):
      fbdev: au1100fb: Fix build on MIPS64

 drivers/video/fbdev/au1100fb.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
