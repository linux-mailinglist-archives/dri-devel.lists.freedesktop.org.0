Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6982EF3B4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 15:08:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43696E822;
	Fri,  8 Jan 2021 14:08:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6A26E07B
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jan 2021 14:08:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6841AB731;
 Fri,  8 Jan 2021 14:08:11 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org,
	eric@anholt.net,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 0/3] drm/vc4: Streamline the vmap and mmap code
Date: Fri,  8 Jan 2021 15:08:05 +0100
Message-Id: <20210108140808.25775-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Daniel recently pointed out that vc4 has test in it's vmap code that
cannot really fail. [1] I took the opportunity to cleanup vc'4 vmap
and mmap implementations.

The patches got smoke-tested by running fbdev and Xorg on an RPi3.

[1] https://lore.kernel.org/dri-devel/20201211094000.GK401619@phenom.ffwll.local/

Thomas Zimmermann (3):
  drm/vc4: Use drm_gem_cma_vmap() directly
  drm/vc4: Make several BO functions static
  drm/vc4: Move mmap implementation into GEM object function

 drivers/gpu/drm/vc4/vc4_bo.c  | 97 +++++++----------------------------
 drivers/gpu/drm/vc4/vc4_drv.c | 14 +----
 drivers/gpu/drm/vc4/vc4_drv.h |  5 --
 3 files changed, 21 insertions(+), 95 deletions(-)

--
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
