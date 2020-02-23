Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E16D16A1D3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 10:20:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB758926F;
	Mon, 24 Feb 2020 09:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.netbsd.org (mail.NetBSD.org [IPv6:2001:470:a085:999::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E4C6E104
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2020 20:40:28 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 1508)
 id 81BCD84D5A; Sun, 23 Feb 2020 20:40:27 +0000 (UTC)
Date: Sun, 23 Feb 2020 20:40:27 +0000
From: Maya Rashish <coypu@sdf.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/radeon: Correct typos in comments
Message-ID: <20200223204027.GA27975@homeworld.netbsd.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Mon, 24 Feb 2020 09:20:26 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Maya Rashish <coypu@sdf.org>
Signed-off-by: Thomas Klausner <wiz@NetBSD.org>
Co-authored-by: Thomas Klausner <wiz@NetBSD.org>
---
 drivers/gpu/drm/radeon/atombios.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index 4b86e8b45009..e118d4bec807 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -1711,9 +1711,9 @@ typedef struct _PIXEL_CLOCK_PARAMETERS_V6
 #define PIXEL_CLOCK_V6_MISC_HDMI_BPP_MASK           0x0c
 #define PIXEL_CLOCK_V6_MISC_HDMI_24BPP              0x00
 #define PIXEL_CLOCK_V6_MISC_HDMI_36BPP              0x04
-#define PIXEL_CLOCK_V6_MISC_HDMI_36BPP_V6           0x08    //for V6, the correct defintion for 36bpp should be 2 for 36bpp(2:1)
+#define PIXEL_CLOCK_V6_MISC_HDMI_36BPP_V6           0x08    //for V6, the correct definition for 36bpp should be 2 for 36bpp(2:1)
 #define PIXEL_CLOCK_V6_MISC_HDMI_30BPP              0x08
-#define PIXEL_CLOCK_V6_MISC_HDMI_30BPP_V6           0x04    //for V6, the correct defintion for 30bpp should be 1 for 36bpp(5:4)
+#define PIXEL_CLOCK_V6_MISC_HDMI_30BPP_V6           0x04    //for V6, the correct definition for 30bpp should be 1 for 36bpp(5:4)
 #define PIXEL_CLOCK_V6_MISC_HDMI_48BPP              0x0c
 #define PIXEL_CLOCK_V6_MISC_REF_DIV_SRC             0x10
 #define PIXEL_CLOCK_V6_MISC_GEN_DPREFCLK            0x40
@@ -2036,7 +2036,7 @@ typedef struct _LVDS_ENCODER_CONTROL_PARAMETERS
 typedef struct _LVDS_ENCODER_CONTROL_PARAMETERS_V2
 {
   USHORT usPixelClock;  // in 10KHz; for bios convenient
-  UCHAR  ucMisc;        // see PANEL_ENCODER_MISC_xx defintions below
+  UCHAR  ucMisc;        // see PANEL_ENCODER_MISC_xx definitions below
   UCHAR  ucAction;      // 0: turn off encoder
                         // 1: setup and turn on encoder
   UCHAR  ucTruncate;    // bit0=0: Disable truncate
@@ -3732,7 +3732,7 @@ typedef struct _ATOM_DPCD_INFO
 #define ATOM_DPCD_MAX_LANE_MASK    0x1F
 
 /**************************************************************************/
-// VRAM usage and their defintions
+// VRAM usage and their definitions
 
 // One chunk of VRAM used by Bios are for HWICON surfaces,EDID data.
 // Current Mode timing and Dail Timing and/or STD timing data EACH device. They can be broken down as below.
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
