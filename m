Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECE0229192
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 09:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B5376E5CD;
	Wed, 22 Jul 2020 07:03:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBFD6E5C8;
 Wed, 22 Jul 2020 07:03:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77C03AECA;
 Wed, 22 Jul 2020 07:03:31 +0000 (UTC)
Date: Wed, 22 Jul 2020 09:03:21 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20200722070321.GA29190@linux-uq9g>
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

here's this week's PR for drm-misc-fixes. There are only 2 fixes. The sun4i
patch updates a bugfix that was merged via drm-misc-fixes a few weeks ago.

Best regards
Thomas

drm-misc-fixes-2020-07-22:
 * sun4i: Fix inverted HPD result; fixes an earlier fix
 * lima: fix timeout during reset

The following changes since commit 6348dd291e3653534a9e28e6917569bc9967b35b:

  dmabuf: use spinlock to access dmabuf->name (2020-07-10 15:39:29 +0530)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-07-22

for you to fetch changes up to f3f90c6db188d437add55aaffadd5ad5bcb8cda6:

  drm/lima: fix wait pp reset timeout (2020-07-20 08:46:06 +0800)

----------------------------------------------------------------
 * sun4i: Fix inverted HPD result; fixes an earlier fix
 * lima: fix timeout during reset

----------------------------------------------------------------
Chen-Yu Tsai (1):
      drm: sun4i: hdmi: Fix inverted HPD result

Qiang Yu (1):
      drm/lima: fix wait pp reset timeout

 drivers/gpu/drm/lima/lima_pp.c         | 2 ++
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
