Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87666323A86
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 11:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E97A6E8B2;
	Wed, 24 Feb 2021 10:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833276E8B2;
 Wed, 24 Feb 2021 10:27:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4EB7B03B;
 Wed, 24 Feb 2021 10:27:52 +0000 (UTC)
Date: Wed, 24 Feb 2021 11:27:50 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <YDYqJhsuNDKvD3V/@linux-uq9g>
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

here's this week's PR for drm-misc-fixes. One of the patches is a memory
leak; the rest is for hardware issues.

Best regards
Thomas

drm-misc-fixes-2021-02-24:
 * drm/panel: kd35t133: Work with non-continuous DSI clock
 * drm/rockchip: Require YTR modifier for AFBC
 * drm/ttm: Fix a memory leak in error handling
The following changes since commit f40ddce88593482919761f74910f42f4b84c004b:

  Linux 5.11 (2021-02-14 14:32:24 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-02-24

for you to fetch changes up to 54dab3a718f7094532daf7d25cd14121a0e00e34:

  drm/panel: kd35t133: allow using non-continuous dsi clock (2021-02-23 22:=
44:58 +0100)

----------------------------------------------------------------
 * drm/panel: kd35t133: Work with non-continuous DSI clock
 * drm/rockchip: Require YTR modifier for AFBC
 * drm/ttm: Fix a memory leak in error handling

----------------------------------------------------------------
Alyssa Rosenzweig (1):
      drm/rockchip: Require the YTR modifier for AFBC

Heiko Stuebner (1):
      drm/panel: kd35t133: allow using non-continuous dsi clock

xinhui pan (1):
      drm/ttm: Fix a memory leak

 drivers/gpu/drm/panel/panel-elida-kd35t133.c |  3 ++-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h  | 11 +++++++++++
 drivers/gpu/drm/ttm/ttm_bo.c                 |  9 ++++++---
 3 files changed, 19 insertions(+), 4 deletions(-)

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
