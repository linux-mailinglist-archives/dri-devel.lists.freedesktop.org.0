Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DBD739053
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 21:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BAB10E354;
	Wed, 21 Jun 2023 19:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F5D10E353;
 Wed, 21 Jun 2023 19:44:07 +0000 (UTC)
Message-ID: <e96b1965-ba67-7cc5-2358-826eb5b9b998@lankhorst.se>
Date: Wed, 21 Jun 2023 21:43:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Maarten Lankhorst <dev@lankhorst.se>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: [PULL] drm-misc-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Midsummer is nearly here! So sending the pull request a bit early.

Cheers!
~Maarten

drm-misc-fixes-2023-06-21:
drm-misc-fixes for v6.4:
- Qaic imported dma-buf fix.
- Fix null pointer deref when printing a dp-mst message.
The following changes since commit 45a3e24f65e90a047bef86f927ebdc4c710edaa1:

   Linux 6.4-rc7 (2023-06-18 14:06:27 -0700)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-06-21

for you to fetch changes up to 54d217406afe250d7a768783baaa79a035f21d38:

   drm: use mgr->dev in drm_dbg_kms in drm_dp_add_payload_part2 
(2023-06-20 16:00:09 -0400)

----------------------------------------------------------------
drm-misc-fixes for v6.4:
- Qaic imported dma-buf fix.
- Fix null pointer deref when printing a dp-mst message.

----------------------------------------------------------------
Jeff Layton (1):
       drm: use mgr->dev in drm_dbg_kms in drm_dp_add_payload_part2

Pranjal Ramajor Asha Kanojiya (1):
       accel/qaic: Call DRM helper function to destroy prime GEM

  drivers/accel/qaic/qaic_data.c                | 4 ++--
  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
  2 files changed, 3 insertions(+), 3 deletions(-)
