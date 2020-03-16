Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC783186979
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 11:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3359489DB8;
	Mon, 16 Mar 2020 10:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8FB89DB8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 10:52:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id C4D863F72C;
 Mon, 16 Mar 2020 11:52:41 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=RWm20K94; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: 0.4
X-Spam-Level: 
X-Spam-Status: No, score=0.4 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SORTED_RECIPS=2.499,
 URIBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mpqOfJWLxtke; Mon, 16 Mar 2020 11:52:40 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 3AB7C3F6A3;
 Mon, 16 Mar 2020 11:52:39 +0100 (CET)
Received: from linlap1.host.shipmail.org.com (unknown [94.191.152.149])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 313143607D5;
 Mon, 16 Mar 2020 11:52:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1584355959; bh=uKHEYIvIsU0sJI1yd/nNU+aQlR5CTpV5n/pWHwj9jSs=;
 h=From:To:Cc:Subject:Date:From;
 b=RWm20K94Y5SfLaP7x+Mfm7XVcqoDIjf3VqSt/B7GQhsDgm2Hs0nsEA74rg7kMHrY+
 awheanTpq3e/TmuT387XkHaUThmAmXV+kZMX1dTLEz55xYfN8VWHBtDe7xC8iNxv/l
 0exGuierzgVEJ9gs/+TozzJ60xPHcY0BcbwTOl3w=
From: "Thomas Hellstrom (VMware)" <thomas_os@shipmail.org>
To: airlied@gmail.com, airlied@redhat.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [git-pull] vmwgfx-next
Date: Mon, 16 Mar 2020 11:52:12 +0100
Message-Id: <20200316105212.26504-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: pv-drivers@vmware.com, Thomas Hellstrom <thomas_os@shipmail.org>,
 linux-graphics-maintainer@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dave, Daniel,

The first vmwgfx-next pull for 5.7. Roland Scheidegger will follow up with
a larger pull request for functionality needed for GL4 support.

- Disable DMA when using SEV encryption
- An -RT fix
- Code cleanups

Thanks,
Thomas

The following changes since commit d3bd37f587b4438d47751d0f1d5aaae3d39bd416:

  Merge v5.6-rc5 into drm-next (2020-03-11 07:27:21 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~thomash/linux vmwgfx-next

for you to fetch changes up to 6b656755428dc0c96d21d7af697dc2a10c7ff175:

  drm/vmwgfx: Replace zero-length array with flexible-array member (2020-03-16 10:42:01 +0100)

----------------------------------------------------------------
Gustavo A. R. Silva (1):
      drm/vmwgfx: Replace zero-length array with flexible-array member

Sebastian Andrzej Siewior (2):
      drm/vmwgfx: Drop preempt_disable() in vmw_fifo_ping_host()
      drm/vmwgfx: Remove a few unused functions

Thomas Hellstrom (2):
      drm/vmwgfx: Fix the refuse_dma mode when using guest-backed objects
      drm/vmwgfx: Refuse DMA operation when SEV encryption is active

 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c     |  3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        | 11 +++-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        | 28 -----------
 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c       |  2 -
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        | 81 ------------------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c    | 31 ------------
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c       |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c    |  2 +-
 9 files changed, 14 insertions(+), 148 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
