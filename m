Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF1F1F62EA
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 09:50:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AD56E89A;
	Thu, 11 Jun 2020 07:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21BA6E89A;
 Thu, 11 Jun 2020 07:50:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6ED5AD33;
 Thu, 11 Jun 2020 07:50:13 +0000 (UTC)
Date: Thu, 11 Jun 2020 09:50:07 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20200611075007.GA15098@linux-uq9g>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

here's the PR for the latest fixes in drm-misc-next-fixes.

Best regards
Thomas

drm-misc-next-fixes-2020-06-11:
In core, DRM connectors now notify userspace of hotplug events via
sysfs. In drivers, sun4i now uses 4 bits to store the clock's m divider;
ast sets up 24/32-bit color mode correctly.
The following changes since commit 9ca1f474cea0edc14a1d7ec933e5472c0ff115d3:

  Merge tag 'amd-drm-next-5.8-2020-05-27' of git://people.freedesktop.org/~agd5f/linux into drm-next (2020-05-28 16:10:17 +1000)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2020-06-11

for you to fetch changes up to 291ddeb621e4a9f1ced8302a777fbd7fbda058c6:

  drm/ast: fix missing break in switch statement for format->cpp[0] case 4 (2020-06-11 09:05:31 +0200)

----------------------------------------------------------------
In core, DRM connectors now notify userspace of hotplug events via
sysfs. In drivers, sun4i now uses 4 bits to store the clock's m divider;
ast sets up 24/32-bit color mode correctly.

----------------------------------------------------------------
Colin Ian King (1):
      drm/ast: fix missing break in switch statement for format->cpp[0] case 4

Jernej Skrabec (1):
      drm/sun4i: hdmi ddc clk: Fix size of m divider

Jeykumar Sankaran (1):
      drm/connector: notify userspace on hotplug after register complete

 drivers/gpu/drm/ast/ast_mode.c             | 1 +
 drivers/gpu/drm/drm_connector.c            | 5 +++++
 drivers/gpu/drm/drm_sysfs.c                | 3 ---
 drivers/gpu/drm/sun4i/sun4i_hdmi.h         | 2 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c | 2 +-
 5 files changed, 8 insertions(+), 5 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
