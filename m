Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29425A7175B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 14:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2B010E6ED;
	Wed, 26 Mar 2025 13:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i7iNaTU1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD6910E12A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 13:23:18 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBF0C3A4;
 Wed, 26 Mar 2025 14:21:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1742995289;
 bh=sAIJw7BPKBNNVzzsTtL6WzDYuJ8VKljZcZpZv6dqZRw=;
 h=From:Subject:Date:To:Cc:From;
 b=i7iNaTU1pL7sZAhzT8LycDhgsEvQymANM1SIVaRO2166Ui5cDIeRH3JW0qYsnJNWg
 ssAzn/H5roDWrV2FZHETXdMwiJm9IEpT6PdNSaOMjLHOVX0Go79Fp/Mgc5EG2TLin/
 84Id7hw9KuiSZBgJhmVi3QyGgfwJxkEpHFdm3dPk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v4 00/11] drm: Add new pixel formats for Xilinx Zynqmp
Date: Wed, 26 Mar 2025 15:22:43 +0200
Message-Id: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKT/42cC/3XMywrCMBCF4VeRrI3MTJrWuvI9xEXaJDqgjSRSK
 tJ3N62I4GX5HzjfXSQX2SWxWdxFdD0nDl2OYrkQ7dF0ByfZ5hYEVCASyIFP3A3Sh3g21yR9hTV
 gSbhWSuTTJTrPwwzu9rmPnK4h3ma/x2l9UgTFJ9WjBAmNp1ZjUdkGt2ydSaFrgol21YazmMSeX
 ooGRP2lUFawBEVVa0pN5o+i3gohfSkqKzVY8A6hrGv9QxnH8QF460AhPwEAAA==
X-Change-ID: 20241120-xilinx-formats-f71901621833
To: Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6512;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=sAIJw7BPKBNNVzzsTtL6WzDYuJ8VKljZcZpZv6dqZRw=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4/+7/zs6MUBHsPdx+EZMT6OckpAXLeTxIyDM1
 uvNg/cO2UyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+P/uwAKCRD6PaqMvJYe
 9UGsD/9fp4EB+R25B7xquqtquSrxnv2tMJ/8/Ht0CMlPiOPM57i5yZNRd1m6qKE4eLXSfngJ0sT
 FRdGkIGgVDDP9wAXSb60L6U1Ib0rGh9PBkuBP6ubpAztt9oE29dhus7RK6/A2iyzqDKzoC2giD/
 HjZpac6rzvlz/hLM+YD9nV+AXVQ7VoXHGJ5aAazhqfZx1ou48ez2V2IIMOJEncsVqaCI+rrS7Vu
 THjmkhXaWyeg+YoHQ1Ohz73PgRlmDwB/ci0jgCztQI1wjYfCmabJQbfomADiyloT8Z2iFMlbKTb
 uXSQPamF4gyvgCc55sYiq2C1q3mXxRe2D6dkCQsPa50CHJx2d0W86tt0dp/Wsq7yFnDCuxsM5Id
 /0Q0gN2Kvpj0Y6tuIvyz4k2Ppy0kndIk9iU6VA4lYFKpM2L8mMuePGiydnzmiLsJ2Vo/YYmyE/w
 6wD+velg5e7FWpHd429NNbipW4kw29uutc2SwDOysuEbjjkzeDxn1m4q1RynYIOPRnk2fXnX1gV
 eTQiy35BCfKfqmYGyP+RlEBGF5AJ+KT/zczag1fioJQ3fp99B4Mu8Y8ys9nbPVlArowPkMM0+eG
 DqHMHAn2mSaS2Ev2ykxxVhxmiNqu8mYXyhUuHcuHz+Wz7x0EAZLd47q9HZStKuEVgVaIMKpxfwJ
 kEeumup61FgEdOg==
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

All other formats except XVUY2101010 are already supported in upstream
gstreamer, but gstreamer's kmssink does not have the support yet, as it
obviously cannot support the formats without kernel having the formats.

Xilinx has support for these formats in their BSP kernel, and Xilinx has
a branch here, adding the support to gstreamer kmssink:

https://github.com/Xilinx/gst-plugins-bad.git xlnx-rebase-v1.18.5

New formats added:

DRM_FORMAT_Y8
- 8-bit Y-only
- fourcc: "GREY"
- gstreamer: GRAY8

DRM_FORMAT_Y10_P32
- 10-bit Y-only, three pixels packed into 32-bits
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
- 10-bit planar 4:4:4, with three samples packed into 32-bits
- fourcc: "X403"
- gstreamer: Y444_10LE32

XVUY2101010
- 10-bit 4:4:4, one pixel in 32 bits
- fourcc: "XY30"

Some notes:

I know the 8-bit greyscale format has been discussed before, and the
guidance was to use DRM_FORMAT_R8. While I'm not totally against that, I
would argue that adding DRM_FORMAT_Y8 makes sense, as:

1) We can mark it as 'is_yuv' in the drm_format_info, and this can help
   the drivers handle e.g. full/limited range. Probably some hardware
   handles grayscale as a value used for all RGB components, in which case
   R8 makes sense, but at least for Xilinx hardware it is YUV, just
   Y-only, not RGB.

2) We can have the same fourcc as in v4l2. While not strictly necessary,
   it's a constant source of confusion when the fourccs differ.

3) It (possibly) makes more sense for the user to use Y8/GREY format
   instead of R8, as, in my experience, the documentation usually refers
   to gray(scale) format or Y-only format.

As we add new Y-only formats, it makes sense to have similar terms, so
we need to adjust the Y10_P32 format name accordingly.

I have made some adjustments to the formats compared to the Xilinx's
branch. E.g. The DRM_FORMAT_Y10_P32 format in Xilinx's kmssink uses
fourcc "Y10 ", and DRM_FORMAT_Y10. I didn't like those, as the format is
a packed format, three 10-bit pixels in a 32-bit container, and I think
Y10 means a 10-bit pixel in a 16-bit container.

Generally speaking, if someone has good ideas for the format define
names or fourccs, speak up, as it's not easy to invent good names =).
That said, keeping them the same as in the Xilinx trees will, of course,
be slightly easier for the users of Xilinx platforms.

I made WIP additions to modetest to support most of these formats,
partially based on Xilinx's code:

https://github.com/tomba/libdrm.git xilinx

A few thoughts about that:

modetest uses bo_create_dumb(), and as highlighted in recent discussions
in the kernel list [1], dumb buffers are only for RGB formats. They may
work for non-RGB formats, but that's platform specific. None of the
formats I add here are RGB formats. Do we want to go this way with
modetest?

I also feel that the current structure of modetest is not well suited to
more complicated formats. Both the buffer allocation is a bit more
difficult (see "Add virtual_width and pixels_per_container"), and the
drawing is complicated (see, e.g., "Add support for DRM_FORMAT_XV15 &
DRM_FORMAT_XV20").

I have recently added support for these Xilinx formats to both kms++ [2] and
pykms/pixutils [3][4] (WIP), and it's not been easy... But I have to say I
think I like the template based version in kms++. That won't work in
modetest, of course, but a non-templated version might be implementable,
but probably much slower.

In any case, I slighly feel it's not worth merging the modetest patches
I have for these formats: they complicate the code quite a bit, break
the RGB-only rule, and I'm not sure if there really are (m)any users. If
we want to add support to modetest, I think a bigger rewrite of the test
pattern code might be in order.

[1] https://lore.kernel.org/all/20250109150310.219442-26-tzimmermann%40suse.de/
[2] git@github.com:tomba/kmsxx.git xilinx
[3] git@github.com:tomba/pykms.git xilinx
[4] git@github.com:tomba/pixutils.git xilinx

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Changes in v4:
- Reformat the drm_format_info entries a bit
- Calculate block size only once in drm_format_info_bpp()
- Declare local variables in separate lines
- Add review tags
- Fix commit message referring to Y10_LE32 (should be Y10_P32)
- Link to v3: https://lore.kernel.org/r/20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com

Changes in v3:
- Drop "drm: xlnx: zynqmp: Fix max dma segment size". It is already
  pushed.
- Add XVUY2101010 format.
- Rename DRM_FORMAT_Y10_LE32 to DRM_FORMAT_Y10_P32.
- Link to v2: https://lore.kernel.org/r/20250115-xilinx-formats-v2-0-160327ca652a@ideasonboard.com

Changes in v2:
- I noticed V4L2 already has fourcc Y10P, referring to MIPI-style packed
  Y10 format. So I changed Y10_LE32 fourcc to YPA4. If logic has any
  relevance here, P means packed, A means 10, 4 means "in 4 bytes".
- Added tags to "Fix max dma segment size" patch
- Updated description for "Add warning for bad bpp"
- Link to v1: https://lore.kernel.org/r/20241204-xilinx-formats-v1-0-0bf2c5147db1@ideasonboard.com

---
Tomi Valkeinen (11):
      drm/fourcc: Add warning for bad bpp
      drm/fourcc: Add DRM_FORMAT_XV15/XV20
      drm/fourcc: Add DRM_FORMAT_Y8
      drm/fourcc: Add DRM_FORMAT_Y10_P32
      drm/fourcc: Add DRM_FORMAT_X403
      drm/fourcc: Add DRM_FORMAT_XVUY2101010
      drm: xlnx: zynqmp: Use drm helpers when calculating buffer sizes
      drm: xlnx: zynqmp: Add support for XV15 & XV20
      drm: xlnx: zynqmp: Add support for Y8 and Y10_P32
      drm: xlnx: zynqmp: Add support for X403
      drm: xlnx: zynqmp: Add support for XVUY2101010

 drivers/gpu/drm/drm_fourcc.c       | 28 ++++++++++++++++---
 drivers/gpu/drm/xlnx/zynqmp_disp.c | 55 +++++++++++++++++++++++++++++++++++---
 include/uapi/drm/drm_fourcc.h      | 21 +++++++++++++++
 3 files changed, 97 insertions(+), 7 deletions(-)
---
base-commit: 2f9d51740cc30e0d2c8a23a55b1e20cf2513c250
change-id: 20241120-xilinx-formats-f71901621833

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

