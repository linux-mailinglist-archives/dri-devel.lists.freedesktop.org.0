Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ED5C99E69
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 03:47:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCA110E0A5;
	Tue,  2 Dec 2025 02:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vip.corpemail.net (mail-vip.corpemail.net
 [162.243.126.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D218510E0A5
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 02:47:18 +0000 (UTC)
Received: from inspur.com
 by unicom146.biz-email.net ((D)) with ESMTP id 202512021025470825
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Dec 2025 10:25:47 +0800
Received: from localhost.localdomain.com (unknown [10.94.15.65])
 by app6 (Coremail) with SMTP id bgJkCsDwEjEpTi5p0R8GAA--.156S4;
 Tue, 02 Dec 2025 10:25:46 +0800 (CST)
From: Chu Guangqing <chuguangqing@inspur.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chu Guangqing <chuguangqing@inspur.com>
Subject: [PATCH v11 0/1] [DRIVER] gpu: drm: add support for YHGCH ZX1000 soc
 chipset
Date: Tue,  2 Dec 2025 10:24:51 +0800
Message-ID: <20251202022452.2636-1-chuguangqing@inspur.com>
X-Mailer: git-send-email 2.43.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: bgJkCsDwEjEpTi5p0R8GAA--.156S4
X-Coremail-Antispam: 1UD129KBjvJXoWxArW7GF1DXrWktry5Zw4kCrg_yoWrur1kpF
 W7CFyYkr1UKF4ay3s3ta1xAFy3tw4xJFW3Gwn7Jw13uw4UZFy7ZFZYy345uF9rJF97Ja1j
 qrn3XF1SgF17AaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl
 6s0DM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
 6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
 IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUYCJmUUUUU
X-CM-SenderInfo: 5fkxw35dqj1xlqj6x0hvsx2hhfrp/
tUid: 20251202102547d7f4ebbe4aaadc9286c4ec1813ffcd19
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v11:
 - For header files: Alphabetical sorting
 - remove test for visibility
 - add drm_gem_fb_begin_cpu_access to tell device when accessing the
   buffer
 - remove write to fb->patches
 - use drm_format_info_min_pitch instead cpp
 - change to One format per line 
 - remove yhgch_crtc_atomic_begin function
 - make yhgch_dumb_create static function
 - add drm_mode_size_dumb(dev, args, SZ_16, 0) call
 - remove dev->mode_config.prefer_shadow = 1
 - make connector polling work
 - Modify yhgch_connector_get_modes function for EDID access and prevent double free

v10:
 - add drm_edid_free call
 (https://lore.kernel.org/all/20251014072421.4486-1-chuguangqing@inspur.com/)

v9:
 - Remove the check that will not occur
 - Call drm_edid_connector_update to reset when drm_edid is empty.

v8:
 - Use YHGCH uniformly and add the company's official website.

v7:
 - Delete the three preceding function definitions
 - delete Delete the redundant code and comments
 (https://lore.kernel.org/all/20250929063103.7375-1-chuguangqing@inspur.com/)

v6:
 - simplify to return drm_atomic_helper_check_plane_state()
 - remove empty line
 - remove call drm_probe_ddc and smidebug
 - replace drm_err with drm_dbg_kms
 - add callback .disable
 (https://lore.kernel.org/all/20250928054123.32895-1-chuguangqing@inspur.com/)

v5:
  - remove extra level of subdiretories, change to driver/gpu/drm/yhgch
  - remove else from > +        else if (!new_plane_state->visible)
  - remove extra check in function yhgch_plane_atomic_check
  - remove the extra parentheses
  - change the author like other modules
  - use drm_edit_read function instead drm_get_edit
  - remove debug info drm_warn call
  - rename function name smi_connector_helper_detect_from_ddc to
     yhgch_connector_helper_detect_from_ddc, remove extra return statement.
  (https://lore.kernel.org/all/20250925091715.12739-1-chuguangqing@inspur.com/)

v4:
  - remove  VRAM helpers from Kconfig
  - use the coding style in ast/mgag200 for the DDC
  - use plane_state->dst instead of crtc_h/w/x/y.
  - delete duplicate framebuffer's atomic_check.
  - use FIELD_PREP() directly.
  - use dev->mode_config.
  - delete unnecessary drm_atomic_helper_shutdown call
  - add AUTHOR
  - using .enable instead
  (https://lore.kernel.org/all/20250924064954.3921-1-chuguangqing@inspur.com/)

v3:
  - The order of the code blocks has been adjusted, and the "warn-on" branch
     has been removed.
  - removed the related formats for the alpha channel.
  - removed the atomic_flush function.
  - have removed the empty line.
  - have removed the error message here.
  - replaced it with the drmm_encoder_init function.
  (https://lore.kernel.org/all/20250910022311.2655-1-chuguangqing@inspur.com/)

v2:
  - Delete unnecessary comments
  - Delete unnecessary branch
  - Use drm_atomic_helper_check_plane_state
  - remove the alpha formats form this list.
  - use w,h rather than x, y
  - delete type casting
  - use a simple call to drm_atomic_helper_shutdown()
  - delete yhgch_load function
  - delete vblanking code
  - delete unneeded i2c type
  (https://lore.kernel.org/all/20250903054533.68540-1-chuguangqing@inspur.com/)

v1:
  (https://lore.kernel.org/all/20250808053508.52202-1-chuguangqing@inspur.com/)

Chu Guangqing (1):
  [DRIVER] gpu: drm: add support for YHGCH ZX1000 soc chipset

 MAINTAINERS                            |   6 +
 drivers/gpu/drm/Kconfig                |   2 +
 drivers/gpu/drm/Makefile               |   1 +
 drivers/gpu/drm/yhgch/Kconfig          |  11 +
 drivers/gpu/drm/yhgch/Makefile         |   4 +
 drivers/gpu/drm/yhgch/yhgch_drm_de.c   | 371 +++++++++++++++++++++++++
 drivers/gpu/drm/yhgch/yhgch_drm_drv.c  | 313 +++++++++++++++++++++
 drivers/gpu/drm/yhgch/yhgch_drm_drv.h  |  51 ++++
 drivers/gpu/drm/yhgch/yhgch_drm_i2c.c  | 114 ++++++++
 drivers/gpu/drm/yhgch/yhgch_drm_regs.h | 208 ++++++++++++++
 drivers/gpu/drm/yhgch/yhgch_drm_vdac.c | 132 +++++++++
 11 files changed, 1213 insertions(+)
 create mode 100644 drivers/gpu/drm/yhgch/Kconfig
 create mode 100644 drivers/gpu/drm/yhgch/Makefile
 create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_de.c
 create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_drv.c
 create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_drv.h
 create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_i2c.c
 create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_regs.h
 create mode 100644 drivers/gpu/drm/yhgch/yhgch_drm_vdac.c

-- 
2.43.7

