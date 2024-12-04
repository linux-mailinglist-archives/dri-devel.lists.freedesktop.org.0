Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FE59E36A1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 10:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E5910EC9C;
	Wed,  4 Dec 2024 09:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Qsq2ozS/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1F910EC9C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 09:31:35 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2C4684D4;
 Wed,  4 Dec 2024 10:31:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733304665;
 bh=7H4GLv0YlHkeG6k+ZGHpqUzkmzirEyErsRrUJE56Xm0=;
 h=From:Subject:Date:To:Cc:From;
 b=Qsq2ozS/dfxq+dArR31Jot8scTj7jqyLdhjWcC/tEg7QFWsoaDugmyDJMZzsVhUfM
 5zepYzR6fiGi4nfmd/5PUTmk/OoNXTF7uc/jJS/agtZuTDCTcDdnwUqDeS0K2YePd2
 JM20/0cG9y61qTtEJDiJdAd/MaGLCz0oejHUMNRs=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 00/10] drm: Add new pixel formats for Xilinx Zynqmp
Date: Wed, 04 Dec 2024 11:31:00 +0200
Message-Id: <20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFUhUGcC/x3MTQqAIBBA4avErBMcjf6uEi2kxhooCydCiO6et
 PwW7z0gFJkE+uKBSDcLHyEDywKm1YWFFM/ZYLSpEI1WiTcOSfkj7u4S5RvsNNYGW2shR2ckz+k
 fDuP7fkfUOo9gAAAA
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3394;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=7H4GLv0YlHkeG6k+ZGHpqUzkmzirEyErsRrUJE56Xm0=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUCFs8f57M74i1UeOmt3cmIIkBgTojlc6XFzxg
 HsRooLfoS+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1AhbAAKCRD6PaqMvJYe
 9fOxD/9aBJ+ckBgerw5YWv5CkCbblrne8VCoUKFgv+0N1qjScszyAr6h1hEi2HmRgegZIjWwhfs
 sG0VSebhsG5AvdlSaFkH99uKeL3gyXGa+0EEYiTt58Uzf35uyS5tswFLN8MCTQaMYAHzXIAFX6M
 RF7+4DWNeIEr2CCkgU8QsRH3ubcWenn5VrKsJ/nyF1SZpxp85szscNBdUNsmUF4hV/w5FxKb3BH
 2z4hSk2Sgcc9fP39s3rGArg3qUq/AbTp8h0FlZ8NYWLbhUwPbuxnSm61dMhB7aWBOpkC2nUeY9k
 0f8ChX0b0Os7jUMGQimoof3boVBrS9sRtKd8GEhrm6LcW+agfYldK81/yfw3Kt12zqMBOM1FgU5
 tPxo9Q//lALKUihxnra+zTyJupDO971RSd89ODyJnBUUffjiHPypC8F7cToZFUUQOBAVDKDOWnk
 GnOFW5UjcIlykSEuzFLX0ke++llghIjqg0SbxqZMiM/ffKnQB8z3bCBM+2wBJByavz/7GD/rubj
 IaKsNIVBe/glDHMiBnekayT7XAD7srSL6w+dSvmubNj4hBEbF6PSZOX2dMjK06IM5++gXZrPQs7
 DNRJOrfNvZvRFfd9r477zhcPtugbBH0dXA6MgI7rV1NmVDow3Jf/9H9CBR1RahHwGuRKAf9vpNY
 a3ZcsvcTSQ/uOJA==
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
- fourcc: "Y10P"
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

