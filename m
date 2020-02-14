Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9BF160CD9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29F96E7EA;
	Mon, 17 Feb 2020 08:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 598 seconds by postgrey-1.36 at gabe;
 Fri, 14 Feb 2020 11:40:14 UTC
Received: from mail.netbsd.org (mail.NetBSD.org [IPv6:2001:470:a085:999::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 824C26E5C1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 11:40:14 +0000 (UTC)
Received: by mail.netbsd.org (Postfix, from userid 1508)
 id EAE2A84E7C; Fri, 14 Feb 2020 11:29:38 +0000 (UTC)
Date: Fri, 14 Feb 2020 11:29:38 +0000
From: Maya Rashish <maya@NetBSD.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] Correct typos in comments
Message-ID: <20200214112938.GA26876@homeworld.netbsd.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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

Signed-off-by: Maya Rashish <maya@NetBSD.org>
Co-authored-by: Thomas Klausner <wiz@NetBSD.org>
---
 drivers/gpu/drm/amd/include/atombios.h     | 20 ++++++++++----------
 drivers/gpu/drm/amd/include/atomfirmware.h |  4 ++--
 drivers/gpu/drm/radeon/atombios.h          |  8 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c        |  2 +-
 4 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/include/atombios.h b/drivers/gpu/drm/amd/include/atombios.h
index 8ba21747b40a..2f124c1a9c8e 100644
--- a/drivers/gpu/drm/amd/include/atombios.h
+++ b/drivers/gpu/drm/amd/include/atombios.h
@@ -1987,9 +1987,9 @@ typedef struct _PIXEL_CLOCK_PARAMETERS_V6
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
@@ -2420,7 +2420,7 @@ typedef struct _LVDS_ENCODER_CONTROL_PARAMETERS
 typedef struct _LVDS_ENCODER_CONTROL_PARAMETERS_V2
 {
   USHORT usPixelClock;  // in 10KHz; for bios convenient
-  UCHAR  ucMisc;        // see PANEL_ENCODER_MISC_xx defintions below
+  UCHAR  ucMisc;        // see PANEL_ENCODER_MISC_xx definitions below
   UCHAR  ucAction;      // 0: turn off encoder
                         // 1: setup and turn on encoder
   UCHAR  ucTruncate;    // bit0=0: Disable truncate
@@ -2873,7 +2873,7 @@ typedef struct _ATOM_MULTIMEDIA_CONFIG_INFO
 // Structures used in FirmwareInfoTable
 /****************************************************************************/
 
-// usBIOSCapability Defintion:
+// usBIOSCapability Definition:
 // Bit 0 = 0: Bios image is not Posted, =1:Bios image is Posted;
 // Bit 1 = 0: Dual CRTC is not supported, =1: Dual CRTC is supported;
 // Bit 2 = 0: Extended Desktop is not supported, =1: Extended Desktop is supported;
@@ -4213,7 +4213,7 @@ typedef struct _ATOM_DPCD_INFO
 #define ATOM_DPCD_MAX_LANE_MASK    0x1F
 
 /**************************************************************************/
-// VRAM usage and their defintions
+// VRAM usage and their definitions
 
 // One chunk of VRAM used by Bios are for HWICON surfaces,EDID data.
 // Current Mode timing and Dail Timing and/or STD timing data EACH device. They can be broken down as below.
@@ -6753,7 +6753,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO_V3
 #define ATOM_S0_SYSTEM_POWER_STATE_VALUE_LITEAC 3
 #define ATOM_S0_SYSTEM_POWER_STATE_VALUE_LIT2AC 4
 
-//Byte aligned defintion for BIOS usage
+//Byte aligned definition for BIOS usage
 #define ATOM_S0_CRT1_MONOb0             0x01
 #define ATOM_S0_CRT1_COLORb0            0x02
 #define ATOM_S0_CRT1_MASKb0             (ATOM_S0_CRT1_MONOb0+ATOM_S0_CRT1_COLORb0)
@@ -6819,7 +6819,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO_V3
 #define ATOM_S2_DISPLAY_ROTATION_ANGLE_MASK   0xC0000000L
 
 
-//Byte aligned defintion for BIOS usage
+//Byte aligned definition for BIOS usage
 #define ATOM_S2_TV1_STANDARD_MASKb0     0x0F
 #define ATOM_S2_CURRENT_BL_LEVEL_MASKb1 0xFF
 #define ATOM_S2_DEVICE_DPMS_STATEb2     0x01
@@ -6871,7 +6871,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO_V3
 
 
 
-//Byte aligned defintion for BIOS usage
+//Byte aligned definition for BIOS usage
 #define ATOM_S3_CRT1_ACTIVEb0           0x01
 #define ATOM_S3_LCD1_ACTIVEb0           0x02
 #define ATOM_S3_TV1_ACTIVEb0            0x04
@@ -6910,7 +6910,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO_V3
 #define ATOM_S4_LCD1_REFRESH_MASK       0x0000FF00L
 #define ATOM_S4_LCD1_REFRESH_SHIFT      8
 
-//Byte aligned defintion for BIOS usage
+//Byte aligned definition for BIOS usage
 #define ATOM_S4_LCD1_PANEL_ID_MASKb0    0x0FF
 #define ATOM_S4_LCD1_REFRESH_MASKb1     ATOM_S4_LCD1_PANEL_ID_MASKb0
 #define ATOM_S4_VRAM_INFO_MASKb2        ATOM_S4_LCD1_PANEL_ID_MASKb0
@@ -6989,7 +6989,7 @@ typedef struct _ATOM_ASIC_INTERNAL_SS_INFO_V3
 #define ATOM_S6_VRI_BRIGHTNESS_CHANGE       0x40000000L
 #define ATOM_S6_CONFIG_DISPLAY_CHANGE_MASK  0x80000000L
 
-//Byte aligned defintion for BIOS usage
+//Byte aligned definition for BIOS usage
 #define ATOM_S6_DEVICE_CHANGEb0         0x01
 #define ATOM_S6_SCALER_CHANGEb0         0x02
 #define ATOM_S6_LID_CHANGEb0            0x04
diff --git a/drivers/gpu/drm/amd/include/atomfirmware.h b/drivers/gpu/drm/amd/include/atomfirmware.h
index 70146518174c..f9dcf67b3517 100644
--- a/drivers/gpu/drm/amd/include/atomfirmware.h
+++ b/drivers/gpu/drm/amd/include/atomfirmware.h
@@ -445,7 +445,7 @@ struct atom_dtd_format
   uint8_t   refreshrate;
 };
 
-/* atom_dtd_format.modemiscinfo defintion */
+/* atom_dtd_format.modemiscinfo definition */
 enum atom_dtd_format_modemiscinfo{
   ATOM_HSYNC_POLARITY    = 0x0002,
   ATOM_VSYNC_POLARITY    = 0x0004,
@@ -597,7 +597,7 @@ struct lcd_info_v2_1
   uint32_t reserved1[8];
 };
 
-/* lcd_info_v2_1.panel_misc defintion */
+/* lcd_info_v2_1.panel_misc definition */
 enum atom_lcd_info_panel_misc{
   ATOM_PANEL_MISC_FPDI            =0x0002,
 };
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
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index f47d5710cc95..5195c19d25a4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -2016,7 +2016,7 @@ void vmw_disable_vblank(struct drm_device *dev, unsigned int pipe)
  * plugin and generate DRM uevent
  * @dev_priv: device private
  * @num_rects: number of drm_rect in rects
- * @rects: toplogy to update
+ * @rects: topology to update
  */
 static int vmw_du_update_layout(struct vmw_private *dev_priv,
 				unsigned int num_rects, struct drm_rect *rects)
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
