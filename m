Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9859B2FCF42
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 13:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6231289D84;
	Wed, 20 Jan 2021 12:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B910889D4B;
 Wed, 20 Jan 2021 12:09:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3FB21B74C;
 Wed, 20 Jan 2021 12:09:07 +0000 (UTC)
Date: Wed, 20 Jan 2021 13:09:04 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <YAgdYGNoH7pC29rz@linux-uq9g>
MIME-Version: 1.0
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's this week's PR for drm-misc-next.

Best regards
Thomas

drm-misc-fixes-2021-01-20:
Short summary of fixes pull (less than what git shortlog provides):

 * drm/atomic: Release state on error
 * drm/syncobj: Fix use-after-free
 * drm/ttm: Don't use GFP_TRANSHUGE_LIGTH
 * drm/vc4: Unify driver naming for PCM
 * drm/vram-helper: Fix memory leak in vmap
The following changes since commit 19c329f6808995b142b3966301f217c831e7cf31:

  Linux 5.11-rc4 (2021-01-17 16:37:05 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-01-20

for you to fetch changes up to a37eef63bc9e16e06361b539e528058146af80ab:

  drm/syncobj: Fix use-after-free (2021-01-20 10:28:39 +0100)

----------------------------------------------------------------
Short summary of fixes pull (less than what git shortlog provides):

 * drm/atomic: Release state on error
 * drm/syncobj: Fix use-after-free
 * drm/ttm: Don't use GFP_TRANSHUGE_LIGTH
 * drm/vc4: Unify driver naming for PCM
 * drm/vram-helper: Fix memory leak in vmap

----------------------------------------------------------------
Christian K=F6nig (1):
      drm/ttm: stop using GFP_TRANSHUGE_LIGHT

Daniel Vetter (1):
      drm/syncobj: Fix use-after-free

Nicolas Saenz Julienne (1):
      drm/vc4: Unify PCM card's driver_name

Pan Bian (1):
      drm/atomic: put state on error path

Thomas Zimmermann (1):
      drm/vram-helper: Reuse existing page mappings in vmap

 drivers/gpu/drm/drm_atomic_helper.c   |  2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c | 14 +++++++++++---
 drivers/gpu/drm/drm_syncobj.c         |  8 +++++---
 drivers/gpu/drm/ttm/ttm_pool.c        | 11 ++++++-----
 drivers/gpu/drm/vc4/vc4_hdmi.c        |  1 +
 5 files changed, 24 insertions(+), 12 deletions(-)

--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
