Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BFB305519
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 08:56:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41976E5A2;
	Wed, 27 Jan 2021 07:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57FF6E2C7;
 Wed, 27 Jan 2021 07:56:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 508F3ADC4;
 Wed, 27 Jan 2021 07:56:22 +0000 (UTC)
Date: Wed, 27 Jan 2021 08:56:19 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <YBEco1Vxeny8U/ca@linux-uq9g>
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

here are the 2 fixes from this week's drm-misc-next.

Best regards
Thomas

drm-misc-fixes-2021-01-27:

 * drm/vc4: Fix LBM size calculation; Fix high resolutions for hvs5
The following changes since commit a37eef63bc9e16e06361b539e528058146af80ab:

  drm/syncobj: Fix use-after-free (2021-01-20 10:28:39 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-01-27

for you to fetch changes up to f6b57101a6b31277a4bde1d8028c46e898bd2ff2:

  drm/vc4: Correct POS1_SCL for hvs5 (2021-01-25 11:53:44 +0100)

----------------------------------------------------------------
Short summary of fixes pull (less than what git shortlog provides):

 * drm/vc4: Fix LBM size calculation; Fix high resolutions for hvs5

----------------------------------------------------------------
Dom Cobley (2):
      drm/vc4: Correct lbm size and calculation
      drm/vc4: Correct POS1_SCL for hvs5

 drivers/gpu/drm/vc4/vc4_hvs.c   |  8 ++++----
 drivers/gpu/drm/vc4/vc4_plane.c | 11 ++++++++---
 2 files changed, 12 insertions(+), 7 deletions(-)

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
