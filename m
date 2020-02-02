Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57538150253
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 09:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC246EB48;
	Mon,  3 Feb 2020 08:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from kvm5.telegraphics.com.au (kvm5.telegraphics.com.au
 [98.124.60.144])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9787189854
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Feb 2020 02:44:56 +0000 (UTC)
Received: by kvm5.telegraphics.com.au (Postfix, from userid 502)
 id C87F129AFA; Sat,  1 Feb 2020 21:38:15 -0500 (EST)
Message-Id: <cover.1580610812.git.fthain@telegraphics.com.au>
From: Finn Thain <fthain@telegraphics.com.au>
Subject: [PATCH 0/3] Improve MIPS Magnum support
Date: Sun, 02 Feb 2020 13:33:32 +1100
To: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paulburton@kernel.org>,
 James Hogan <jhogan@kernel.org>
X-Mailman-Approved-At: Mon, 03 Feb 2020 08:10:41 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A few minor patches are needed to more easily boot a MIPS Magnum build
under 'qemu-system-mips64el -M magnum'. This series fixes a build failure
in the g364fb driver and modifies jazz_defconfig for use with QEMU.

Note that QEMU's dp8393x implementation has bugs, one of which prevents
the Linux jazzsonic driver from probing the chip. I have fixed the bugs
that I know of in a series of patches at,
https://github.com/fthain/qemu/commits/sonic


Finn Thain (3):
  fbdev/g364fb: Fix build failure
  mips/jazz: Remove redundant settings and shrink jazz_defconfig
  mips/jazz: Update jazz_defconfig for MIPS Magnum

 arch/mips/configs/jazz_defconfig | 267 ++-----------------------------
 drivers/video/fbdev/g364fb.c     |  29 +---
 2 files changed, 15 insertions(+), 281 deletions(-)

-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
