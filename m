Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FAB73326E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 15:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E9A10E62E;
	Fri, 16 Jun 2023 13:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (lankhorst.se
 [IPv6:2a02:2308:0:7ec:e79c:4e97:b6c4:f0ae])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A89110E0D0;
 Fri, 16 Jun 2023 11:32:35 +0000 (UTC)
Message-ID: <641eb8a8-fbd7-90ad-0805-310b7fec9344@lankhorst.se>
Date: Fri, 16 Jun 2023 13:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Maarten Lankhorst <dev@lankhorst.se>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: [PULL] drm-misc-fixes
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 16 Jun 2023 13:46:05 +0000
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

Hey Dave, Daniel,

Sorry for being late,  life sometimes get in the way. Sometimes even 
literally!

Cheers,
~Maarten

drm-misc-fixes-2023-06-16:
drm-misc-fixes maybe in time for v6.4-rc7:
- qaic leak and null deref fix.
- Fix runtime pm in nouveau.
- Fix array overflow in ti-sn65dsi86 pwm chip handling.
- Assorted null check fixes in nouveau.
The following changes since commit a3efabee5878b8d7b1863debb78cb7129d07a346:

   accel/ivpu: Fix sporadic VPU boot failure (2023-06-08 08:17:27 +0200)

are available in the Git repository at:

   git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-06-16

for you to fetch changes up to 55b94bb8c42464bad3d2217f6874aa1a85664eac:

   drm/nouveau: add nv_encoder pointer check for NULL (2023-06-13 
16:53:00 -0400)

----------------------------------------------------------------
drm-misc-fixes maybe in time for v6.4-rc7:
- qaic leak and null deref fix.
- Fix runtime pm in nouveau.
- Fix array overflow in ti-sn65dsi86 pwm chip handling.
- Assorted null check fixes in nouveau.

----------------------------------------------------------------
Carl Vanderlip (1):
       accel/qaic: Free user handle on interrupted mutex

Jeffrey Hugo (1):
       accel/qaic: Fix NULL pointer deref in qaic_destroy_drm_device()

Natalia Petrova (2):
       drm/nouveau/dp: check for NULL nv_connector->native_mode
       drm/nouveau: add nv_encoder pointer check for NULL

Ratchanan Srirattanamet (1):
       drm/nouveau: don't detect DSM for non-NVIDIA device

Su Hui (1):
       drm/bridge: ti-sn65dsi86: Avoid possible buffer overflow

  drivers/accel/qaic/qaic_drv.c               | 4 ++++
  drivers/gpu/drm/bridge/ti-sn65dsi86.c       | 4 ++++
  drivers/gpu/drm/nouveau/nouveau_acpi.c      | 3 +++
  drivers/gpu/drm/nouveau/nouveau_connector.c | 7 ++++---
  4 files changed, 15 insertions(+), 3 deletions(-)
