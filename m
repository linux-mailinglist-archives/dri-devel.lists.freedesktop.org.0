Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 238C930BE4A
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 13:36:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB696E169;
	Tue,  2 Feb 2021 12:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9506E115;
 Tue,  2 Feb 2021 12:36:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16C54AF72;
 Tue,  2 Feb 2021 12:36:38 +0000 (UTC)
Date: Tue, 2 Feb 2021 13:36:35 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <YBlHU4sc/5GHpXpg@linux-uq9g>
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

here's this week's PR for drm-misc-fixes. There are 3 patches for the
bridge code and one for TTM.

Best regards
Thomas

drm-misc-fixes-2021-02-02:
 * drm/bridge/lontium-lt9611uxc: EDID fixes; Don't handle hotplug
   events in IRQ handler
 * drm/ttm: Use _GFP_NOWARN for huge pages
The following changes since commit f6b57101a6b31277a4bde1d8028c46e898bd2ff2:

  drm/vc4: Correct POS1_SCL for hvs5 (2021-01-25 11:53:44 +0100)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2021-02-02

for you to fetch changes up to 2b1b3e544f65f40df5eef99753e460a127910479:

  drm/ttm: Use __GFP_NOWARN for huge pages in ttm_pool_alloc_page (2021-01-=
28 13:01:52 +0100)

----------------------------------------------------------------
 * drm/bridge/lontium-lt9611uxc: EDID fixes; Don't handle hotplug
   events in IRQ handler
 * drm/ttm: Use _GFP_NOWARN for huge pages

----------------------------------------------------------------
Dmitry Baryshkov (3):
      drm/bridge/lontium-lt9611uxc: fix waiting for EDID to become available
      drm/bridge/lontium-lt9611uxc: fix get_edid return code
      drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler

Michel D=E4nzer (1):
      drm/ttm: Use __GFP_NOWARN for huge pages in ttm_pool_alloc_page

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 57 +++++++++++++++++++++++---=
----
 drivers/gpu/drm/ttm/ttm_pool.c             |  2 +-
 2 files changed, 46 insertions(+), 13 deletions(-)

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
