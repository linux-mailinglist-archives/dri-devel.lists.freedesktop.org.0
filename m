Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C871A11CC8
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 10:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 111E710E14C;
	Wed, 15 Jan 2025 09:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IE+rSVpz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479A910E14C
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 09:03:58 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C86654AD;
 Wed, 15 Jan 2025 10:02:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1736931779;
 bh=5Pslzax16nMlSwgi+PwgfYBVrKnp69rF590hz9cLkcM=;
 h=From:Subject:Date:To:Cc:From;
 b=IE+rSVpzYhVAZY8pKGBm5LvJ/0ftQz5I+syVwAED05SmSJMf6o1/UeB4Zp0JQjor/
 URkQ2ry4HfftdVZQ+/78eGly6cI+oDl3tEuHWVcYopgoBHgqI5yHZsMKLH/zh20P4f
 C5meCeRz6dwjolKdoafAmUJUmiyeflsB9Amr6DQ4=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 00/10] drm: Add new pixel formats for Xilinx Zynqmp
Date: Wed, 15 Jan 2025 11:03:29 +0200
Message-Id: <20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOF5h2cC/13Myw6CMBCF4Vchs7amM1RRV76HYVF6kUmkJS0hG
 MK7W3Hn8j/J+VbILrHLcKtWSG7mzDGUoEMFptfh6QTb0kCSFCJJsfCLwyJ8TIOesvANXiWeCS9
 1DeU0Jud52cFHW7rnPMX03v0Zv+uPIqn+qRmFFLLzZE6oGtvhna3TOYYu6mSPJg7Qbtv2AbHYE
 zizAAAA
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Sean Anderson <sean.anderson@linux.dev>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3833;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=5Pslzax16nMlSwgi+PwgfYBVrKnp69rF590hz9cLkcM=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnh3n0LQaoWzoVNUl40goOqifDnBxhzk1cTgDFw
 /xifSQN2oiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ4d59AAKCRD6PaqMvJYe
 9b8vD/9ZhEdi81Wkp7R3X9N0W/qo2Kp+ABygdOsc0psmiVl2sqz36Xl6EOd8pqrA8WaC3kjqx0Z
 Ocbq0OoEPUJ7H9txS72dspYjtDgO9I+ibq0vylCdyWcAmuxD+gexBM4n5L0ACw2wath4UVTJ/po
 zynnbuP1uUxevfnSZ7OXTh65ffLj7kLBCL+Z+sirtUqNbEJMORzO/WTgsE+mbwLSOepm5lUoMx3
 D897//UJJSnRF82CPQcMcHXUJS3newI6NLTmT+9PLXybNzV3lVwf5mz0GVrTpmndGx0FCXtZtLR
 DePAH7IcvpKbuQzqG1/b+yFV88I1BFan9FxnR12CyEo9YAcWU2nmgQk7sIbQwspsVWKI+ig107e
 CKl1dfBt2R1YGhFmDOR8a0Kl9Txhr9hfRXtcZnCagF2VkPWOO9uXV9wkRLB7XaWTJBatfkdQR+X
 fs4auR8vh2yW/Sg00iasET308gddzyfmgkUZQBfYXvAMda/ox88BSSAEIssU3O/jbJms4LNMhqG
 XmPIyxpRjMyeGAqTQWwGzZwK40Kv/cJuzI4Ow1mhp3IV5uSq7iTlOWb53rr2KZ/hPd6VV41i2Jd
 KqCBg+C+pkq7/iMl7IxMr/bdcF6w7x8BbCW7AwCb5KRU7/GGebBSQAWpJTUuNpCkNAk3NXntkpg
 bl/8HTgPd80UK5w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Add new DRM pixel formats and add support for those in the Xilinx zynqmp
display driver.

All of these formats are already supported in upstream gstreamer, except
in the gstreamer kmssink, which obviously cannot support the formats
without kernel having the formats.

Xilinx has support for these formats in their BSP kernel, and Xilinx has
a branch here, adding the support to gstreamer kmssink:

https://github.com/Xilinx/gst-plugins-bad.git xlnx-rebase-v1.18.5

New formats added:

DRM_FORMAT_Y8
- 8-bit Y-only
- fourcc: "GREY"
- gstreamer: GRAY8

DRM_FORMAT_Y10_LE32
- 10-bit Y-only
- fourcc: "YPA4"
- gstreamer: GRAY10_LE32

DRM_FORMAT_XV15
- Like NV12, but with 10-bit components
- fourcc: "XV15"
- gstreamer: NV12_10LE32

DRM_FORMAT_XV20
- Like NV16, but with 10-bit components
- fourcc: "XV20"
- gstreamer: NV16_10LE32

DRM_FORMAT_X403
- 10-bit 4:4:4
- fourcc: "X403"
- gstreamer: Y444_10LE32

Some notes:

I know the 8-bit greyscale format has been discussed before, and the
guidance was to use DRM_FORMAT_R8. While I'm not totally against that, I
would argue that adding DRM_FORMAT_Y8 makes sense, as: 1) we can mark it
as 'is_yuv' in the drm_format_info, 2) we can have the same fourcc as in
v4l2, 3) it makes more sense for the user to use Y8/GREY format instead
of R8.

Also, if we go with DRM_FORMAT_R8, then I think it would make sense to
also add the 10-bit grayscale version as R10, instead of Y10, and it
would also have to have 'is_yuv' false, and I feel that would just
create even more confusion.

I have made some adjustments to the formats compared to the Xilinx's
branch. E.g. The DRM_FORMAT_Y10_LE32 format in Xilinx's kmssink uses
fourcc "Y10 ", and DRM_FORMAT_Y10. I didn't like those, as the format is
a packed format, three 10-bit pixels in a 32-bit container, and I think
Y10 means a 10-bit pixel in a 16-bit container.

Generally speaking, if someone has good ideas for the format define
names or fourccs, speak up, as it's not easy to invent good names =).
That said, keeping them the same as in the Xilinx trees will, of course,
be slightly easier for the users of Xilinx platforms.

There's also a bit unrelated path on top, fixing the missing max dma
seegment size in the zynqmp driver which I encountered while testing
these.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v2:
- I noticed V4L2 already has fourcc Y10P, referring to MIPI-style packed
  Y10 format. So I changed Y10_LE32 fourcc to YPA4. If logic has any
  relevance here, P means packed, A means 10, 4 means "in 4 bytes".
- Added tags to "Fix max dma segment size" patch
- Updated description for "Add warning for bad bpp"
- Link to v1: https://lore.kernel.org/r/20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com

---
Tomi Valkeinen (10):
      drm/fourcc: Add warning for bad bpp
      drm/fourcc: Add DRM_FORMAT_XV15/XV20
      drm/fourcc: Add DRM_FORMAT_Y8
      drm/fourcc: Add DRM_FORMAT_Y10_LE32
      drm/fourcc: Add DRM_FORMAT_X403
      drm: xlnx: zynqmp: Use drm helpers when calculating buffer sizes
      drm: xlnx: zynqmp: Add support for XV15 & XV20
      drm: xlnx: zynqmp: Add support for Y8 and Y10_LE32
      drm: xlnx: zynqmp: Add support for X403
      drm: xlnx: zynqmp: Fix max dma segment size

 drivers/gpu/drm/drm_fourcc.c        | 24 ++++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_disp.c  | 49 ++++++++++++++++++++++++++++++++++---
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c |  2 ++
 include/uapi/drm/drm_fourcc.h       | 20 +++++++++++++++
 4 files changed, 91 insertions(+), 4 deletions(-)
---
base-commit: adc218676eef25575469234709c2d87185ca223a
change-id: 20241120-xilinx-formats-f71901621833

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

