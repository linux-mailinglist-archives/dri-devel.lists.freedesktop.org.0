Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDFE13D6E5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 10:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B4016EC6B;
	Thu, 16 Jan 2020 09:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FECA6EC6B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 09:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id A1D774096E;
 Thu, 16 Jan 2020 10:30:12 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=kZm8Byw0; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6pu8w-_IfGk; Thu, 16 Jan 2020 10:30:11 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id BF83740924;
 Thu, 16 Jan 2020 10:30:09 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D9A053600E5;
 Thu, 16 Jan 2020 10:30:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1579167008; bh=9N3TdYxajTmazYNCb722O3UDhcqrDhRn4ZTGAS3a+kg=;
 h=From:To:Cc:Subject:Date:From;
 b=kZm8Byw0qeY2Z9lIjPFtrxJk4VAiXC7C9s7dahRoBaOphhOXSaRg4cDsuWIwemybw
 OzqKkxkoEsTRUuC432w4luaWz5VqEAsxPc25J6IsZlg6O1w6Juq+EbQ5l9DdmNngF3
 QwZBuTS/9AjcoXdOZsujvcdJjcIIf+cLD+FgIBQ0=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: airlied@gmail.com,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [git pull] vmwgfx-next
Date: Thu, 16 Jan 2020 10:29:34 +0100
Message-Id: <20200116092934.5276-1-thomas_os@shipmail.org>
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
Cc: pv-drivers@vmware.com,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas_os@shipmail.org>,
 linux-graphics-maintainer@vmware.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dave, Daniel

The main 5.6 -next pull from vmwgfx. Minor things here and there, as well
as an added ioctl for host messaging and a corresponding api version bump.

Thanks,
Thomas

The following changes since commit 71e7274066c646bb3d9da39d2f4db0a6404c0a2d:

  Merge tag 'drm-intel-next-2020-01-14' of git://anongit.freedesktop.org/drm/drm-intel into drm-next (2020-01-15 16:57:54 +1000)

are available in the Git repository at:

  git://people.freedesktop.org/~thomash/linux vmwgfx-next

for you to fetch changes up to b20414252068263c736d008e536658f9ce13d74a:

  drm/vmwgfx: Use VM_PFNMAP instead of VM_MIXEDMAP when possible (2020-01-15 14:34:49 +0100)

----------------------------------------------------------------
Emil Velikov (3):
      drm/vmwgfx: move the require_exist handling together
      drm/vmwgfx: check master authentication in surface_ref ioctls
      drm/vmwgfx: drop DRM_AUTH for render ioctls

Lukas Bulwahn (1):
      drm/vmwgfx: Replace deprecated PTR_RET

Navid Emamdoost (1):
      drm/vmwgfx: prevent memory leak in vmw_cmdbuf_res_add

Roland Scheidegger (1):
      drm/vmwgfx: add ioctl for messaging from/to guest userspace to/from host

Thomas Hellstrom (3):
      drm/vmwgfx: Don't use the HB port if memory encryption is active
      drm/vmwgfx: Bump driver minor version
      drm/vmwgfx: Use VM_PFNMAP instead of VM_MIXEDMAP when possible

Thomas Zimmermann (1):
      drm/vmwgfx: Call vmw_driver_{load,unload}() before registering device

 drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf_res.c |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        | 76 ++++++++++++++++++-------
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h        |  6 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c    | 21 +++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c        | 90 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c    | 16 ++++--
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c   |  4 ++
 include/uapi/drm/vmwgfx_drm.h              | 17 ++++++
 8 files changed, 200 insertions(+), 34 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
