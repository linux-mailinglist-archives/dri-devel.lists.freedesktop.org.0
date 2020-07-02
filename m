Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5949211D87
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639666EA8B;
	Thu,  2 Jul 2020 07:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6CB6EA81;
 Thu,  2 Jul 2020 07:51:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7281DAE35;
 Thu,  2 Jul 2020 07:51:45 +0000 (UTC)
Date: Thu, 2 Jul 2020 09:51:43 +0200
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20200702075143.GA25040@linux-uq9g>
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

here's the PR for the current drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2020-07-02:
 * dma-buf: fix a use-after-free bug

 * sun4i: remove HPD polling
The following changes since commit dc5bdb68b5b369d5bc7d1de96fa64cc1737a6320:

  drm/fb-helper: Fix vt restore (2020-06-24 21:34:11 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2020-07-02

for you to fetch changes up to bda8eaa6dee7525f4dac950810a85a88bf6c2ba0:

  drm: sun4i: hdmi: Remove extra HPD polling (2020-06-30 10:01:48 +0200)

----------------------------------------------------------------
 * dma-buf: fix a use-after-free bug

 * sun4i: remove HPD polling

----------------------------------------------------------------
Chen-Yu Tsai (1):
      drm: sun4i: hdmi: Remove extra HPD polling

Sumit Semwal (1):
      dma-buf: Move dma_buf_release() from fops to dentry_ops

 drivers/dma-buf/dma-buf.c              | 54 ++++++++++++++++------------------
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c |  5 ++--
 2 files changed, 27 insertions(+), 32 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
