Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C41C8A552BA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 18:17:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CC110EA43;
	Thu,  6 Mar 2025 17:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u+zypPLv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0EF610EA35
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 17:17:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 532E7A44FAC;
 Thu,  6 Mar 2025 17:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B41FC4CEED;
 Thu,  6 Mar 2025 17:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741281454;
 bh=sBJ/Ecm4SffYsSoCrw5m0wEDMK6aNIKJ0sVghq8b1ro=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=u+zypPLvhzxB3BTkMSvmI38Wv7IPLhalLqJjzMW0WMBEcL7gyTjSvX2iTVo2FtXa2
 b+Sw8aKLG8qQGI6Yu6ZMcPX56A8RC86eH7ppqrbUpb5MKETSXnqtwE5FfRglSSQVRE
 kkYWczDaJNQFwiuVhjQzBUfR46Axnw6lwsrkc7nFrHSn1qs2WmQm21GB9irYYxEyY5
 nDgVCJJTW4Nw4PTiZYi1RzXZC4sIxrGjp6+CTyJl39QiDipY5L6NZZbDLZHGLiMfNL
 VHMIV1nzbaNaJ65JgTmIloJMOrrmam5DqUlbI3+Ke3tmMb+ZrUcT6PsePyFLfiyj9N
 nuWMH1j9mRbbg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 06 Mar 2025 18:17:24 +0100
Subject: [PATCH 2/2] drm/display: hdmi: Mention Infoframes testing with
 edid-decode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-drm-hdmi-state-docs-v1-2-56a19d3805a1@kernel.org>
References: <20250306-drm-hdmi-state-docs-v1-0-56a19d3805a1@kernel.org>
In-Reply-To: <20250306-drm-hdmi-state-docs-v1-0-56a19d3805a1@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10412; i=mripard@kernel.org;
 h=from:subject:message-id; bh=sBJ/Ecm4SffYsSoCrw5m0wEDMK6aNIKJ0sVghq8b1ro=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDOknbyzj+bdmzu/QfrfLS2vYZ69c9nZD7q1Oie0/QrafL
 Kr6wBln0FHKwiDGxSArpsgSI2y+JO7UrNedbHzzYOawMoEMYeDiFICJZFxnZJi14ez7adUbc/PX
 axt+m97m9/lyy5zPb+REFnzXOccz1VOJkeHG4SovuWs7z+3vn3tpV+Du234iW/4cv3Lu+PNOi0P
 1PJ28AA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

edid-decode gained recently support to check that infoframes are
compliant and match the EDID the monitor exposes.

Since the HDMI helpers provide those infoframes in debugfs, it makes it
easy to check from userspace that the drivers (and helpers) behave
properly.

Let's document it.

Cc: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 240 ++++++++++++++++++++++++
 1 file changed, 240 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 24bfc82bf9b02bf3201d97432e3c239ccc8714b4..86f812b89f0e51abc24910898c114d6b08a78edf 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -16,10 +16,250 @@
  * in the form of KMS helpers.
  *
  * It contains TMDS character rate computation, automatic selection of
  * output formats, infoframes generation, etc.
  *
+ * Infoframes Compliance
+ * ~~~~~~~~~~~~~~~~~~~~~
+ *
+ * Drivers using the helpers will expose the various infoframes
+ * generated according to the HDMI specification in debugfs.
+ *
+ * Compliance can then be tested using a recent-enough ``edid-decode``
+ * version (released after summer 2024). A sample run would look like:
+ *
+ * .. code-block:: bash
+ *
+ *	# edid-decode \
+ *		-I /sys/kernel/debug/dri/1/HDMI-A-1/infoframes/audio \
+ *		-I /sys/kernel/debug/dri/1/HDMI-A-1/infoframes/avi \
+ *		-I /sys/kernel/debug/dri/1/HDMI-A-1/infoframes/hdmi \
+ *		-I /sys/kernel/debug/dri/1/HDMI-A-1/infoframes/hdr_drm \
+ *		-I /sys/kernel/debug/dri/1/HDMI-A-1/infoframes/spd \
+ *		/sys/class/drm/card1-HDMI-A-1/edid \
+ *		-c
+ *
+ *	edid-decode (hex):
+ *
+ *	00 ff ff ff ff ff ff 00 1e 6d f4 5b 1e ef 06 00
+ *	07 20 01 03 80 2f 1a 78 ea 24 05 af 4f 42 ab 25
+ *	0f 50 54 21 08 00 d1 c0 61 40 01 01 01 01 01 01
+ *	01 01 01 01 01 01 56 5e 00 a0 a0 a0 29 50 30 20
+ *	35 00 d1 06 11 00 00 1a 00 00 00 fd 00 3b 3d 1e
+ *	70 1e 00 0a 20 20 20 20 20 20 00 00 00 fc 00 4c
+ *	47 20 53 44 51 48 44 0a 20 20 20 20 00 00 00 ff
+ *	00 32 30 37 4e 54 52 4c 44 43 34 33 30 0a 01 43
+ *
+ *	02 03 29 71 23 09 07 07 4b 01 03 04 90 12 13 1f
+ *	22 5d 5e 5f 83 01 00 00 6d 03 0c 00 10 00 b8 3c
+ *	20 00 60 01 02 03 e2 00 6a 00 00 00 00 00 00 00
+ *	00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ *	00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ *	00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ *	00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
+ *	00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ee
+ *
+ *	----------------
+ *
+ *	Block 0, Base EDID:
+ *	  EDID Structure Version & Revision: 1.3
+ *	 Vendor & Product Identification:
+ *	    Manufacturer: GSM
+ *	    Model: 23540
+ *	    Serial Number: 454430 (0x0006ef1e)
+ *	    Made in: week 7 of 2022
+ *	  Basic Display Parameters & Features:
+ *	    Digital display
+ *	    Maximum image size: 47 cm x 26 cm
+ *	    Gamma: 2.20
+ *	    DPMS levels: Standby Suspend Off
+ *	    RGB color display
+ *	    First detailed timing is the preferred timing
+ *	  Color Characteristics:
+ *	    Red  : 0.6835, 0.3105
+ *	    Green: 0.2587, 0.6679
+ *	    Blue : 0.1445, 0.0585
+ *	    White: 0.3134, 0.3291
+ *	  Established Timings I & II:
+ *	    DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
+ *	    DMT 0x09:   800x600    60.316541 Hz   4:3     37.879 kHz     40.000000 MHz
+ *	    DMT 0x10:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000000 MHz
+ *	  Standard Timings:
+ *	    DMT 0x52:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz
+ *	    DMT 0x10:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000000 MHz
+ *	  Detailed Timing Descriptors:
+ *	    DTD 1:  2560x1440   59.950550 Hz  16:9     88.787 kHz    241.500000 MHz (465 mm x 262 mm)
+ *	                 Hfront   48 Hsync  32 Hback   80 Hpol P
+ *	                 Vfront    3 Vsync   5 Vback   33 Vpol N
+ *	    Display Range Limits:
+ *	      Monitor ranges (GTF): 59-61 Hz V, 30-112 kHz H, max dotclock 300 MHz
+ *	    Display Product Name: 'LG SDQHD'
+ *	    Display Product Serial Number: '207NTRLDC430'
+ *	  Extension blocks: 1
+ *	Checksum: 0x43
+ *
+ *	----------------
+ *
+ *	Block 1, CTA-861 Extension Block:
+ *	  Revision: 3
+ *	  Basic audio support
+ *	  Supports YCbCr 4:4:4
+ *	  Supports YCbCr 4:2:2
+ *	  Native detailed modes: 1
+ *	  Audio Data Block:
+ *	    Linear PCM:
+ *	      Max channels: 2
+ *	      Supported sample rates (kHz): 48 44.1 32
+ *	      Supported sample sizes (bits): 24 20 16
+ *	  Video Data Block:
+ *	    VIC   1:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
+ *	    VIC   3:   720x480    59.940060 Hz  16:9     31.469 kHz     27.000000 MHz
+ *	    VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
+ *	    VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz (native)
+ *	    VIC  18:   720x576    50.000000 Hz  16:9     31.250 kHz     27.000000 MHz
+ *	    VIC  19:  1280x720    50.000000 Hz  16:9     37.500 kHz     74.250000 MHz
+ *	    VIC  31:  1920x1080   50.000000 Hz  16:9     56.250 kHz    148.500000 MHz
+ *	    VIC  34:  1920x1080   30.000000 Hz  16:9     33.750 kHz     74.250000 MHz
+ *	    VIC  93:  3840x2160   24.000000 Hz  16:9     54.000 kHz    297.000000 MHz
+ *	    VIC  94:  3840x2160   25.000000 Hz  16:9     56.250 kHz    297.000000 MHz
+ *	    VIC  95:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
+ *	  Speaker Allocation Data Block:
+ *	    FL/FR - Front Left/Right
+ *	  Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
+ *	    Source physical address: 1.0.0.0
+ *	    Supports_AI
+ *	    DC_36bit
+ *	    DC_30bit
+ *	    DC_Y444
+ *	    Maximum TMDS clock: 300 MHz
+ *	    Extended HDMI video details:
+ *	      HDMI VICs:
+ *	        HDMI VIC 1:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
+ *	        HDMI VIC 2:  3840x2160   25.000000 Hz  16:9     56.250 kHz    297.000000 MHz
+ *	        HDMI VIC 3:  3840x2160   24.000000 Hz  16:9     54.000 kHz    297.000000 MHz
+ *	  Video Capability Data Block:
+ *	    YCbCr quantization: No Data
+ *	    RGB quantization: Selectable (via AVI Q)
+ *	    PT scan behavior: Always Underscanned
+ *	    IT scan behavior: Always Underscanned
+ *	    CE scan behavior: Always Underscanned
+ *	Checksum: 0xee  Unused space in Extension Block: 86 bytes
+ *
+ *	----------------
+ *
+ *	edid-decode SHA: 5332a3b76080 2024-11-19 07:53:00
+ *
+ *	Warnings:
+ *
+ *	Block 1, CTA-861 Extension Block:
+ *	  IT Video Formats are overscanned by default, but normally this should be underscanned.
+ *	  Video Data Block: VIC 1 and the first DTD are not identical. Is this intended?
+ *	  Video Data Block: All VICs are in ascending order, and the first (preferred) VIC <= 4, is that intended?
+ *	  Video Capability Data Block: Set Selectable YCbCr Quantization to avoid interop issues.
+ *	  Video Capability Data Block: S_PT is equal to S_IT and S_CE, so should be set to 0 instead.
+ *	  Display Product Serial Number is set, so the Serial Number in the Base EDID should be 0.
+ *	  Add a Colorimetry Data Block with the sRGB colorimetry bit set to avoid interop issues.
+ *	EDID:
+ *	  Base EDID: Some timings are out of range of the Monitor Ranges:
+ *	    Vertical Freq: 24.000 - 60.317 Hz (Monitor: 59.000 - 61.000 Hz)
+ *
+ *	Failures:
+ *
+ *	Block 1, CTA-861 Extension Block:
+ *	  Video Capability Data Block: IT video formats are always underscanned, but bit 7 of Byte 3 of the CTA-861 Extension header is set to overscanned.
+ *	EDID:
+ *	  CTA-861: Native progressive timings are a mix of several resolutions.
+ *
+ *	EDID conformity: FAIL
+ *
+ *	================
+ *
+ *	InfoFrame of '/sys/kernel/debug/dri/1/HDMI-A-1/infoframes/audio' was empty.
+ *
+ *	================
+ *
+ *	edid-decode InfoFrame (hex):
+ *
+ *	82 02 0d 31 12 28 04 00 00 00 00 00 00 00 00 00
+ *	00
+ *
+ *	----------------
+ *
+ *	HDMI InfoFrame Checksum: 0x31
+ *
+ *	AVI InfoFrame
+ *	  Version: 2
+ *	  Length: 13
+ *	  Y: Color Component Sample Format: RGB
+ *	  A: Active Format Information Present: Yes
+ *	  B: Bar Data Present: Bar Data not present
+ *	  S: Scan Information: Composed for an underscanned display
+ *	  C: Colorimetry: No Data
+ *	  M: Picture Aspect Ratio: 16:9
+ *	  R: Active Portion Aspect Ratio: 8
+ *	  ITC: IT Content: No Data
+ *	  EC: Extended Colorimetry: xvYCC601
+ *	  Q: RGB Quantization Range: Limited Range
+ *	  SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
+ *	  YQ: YCC Quantization Range: Limited Range
+ *	  CN: IT Content Type: Graphics
+ *	  PR: Pixel Data Repetition Count: 0
+ *	  Line Number of End of Top Bar: 0
+ *	  Line Number of Start of Bottom Bar: 0
+ *	  Pixel Number of End of Left Bar: 0
+ *	  Pixel Number of Start of Right Bar: 0
+ *
+ *	----------------
+ *
+ *	AVI InfoFrame conformity: PASS
+ *
+ *	================
+ *
+ *	edid-decode InfoFrame (hex):
+ *
+ *	81 01 05 49 03 0c 00 20 01
+ *
+ *	----------------
+ *
+ *	HDMI InfoFrame Checksum: 0x49
+ *
+ *	Vendor-Specific InfoFrame (HDMI), OUI 00-0C-03
+ *	  Version: 1
+ *	  Length: 5
+ *	  HDMI Video Format: HDMI_VIC is present
+ *	  HDMI VIC 1:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
+ *
+ *	----------------
+ *
+ *	Vendor-Specific InfoFrame (HDMI), OUI 00-0C-03 conformity: PASS
+ *
+ *	================
+ *
+ *	InfoFrame of '/sys/kernel/debug/dri/1/HDMI-A-1/infoframes/hdr_drm' was empty.
+ *
+ *	================
+ *
+ *	edid-decode InfoFrame (hex):
+ *
+ *	83 01 19 93 42 72 6f 61 64 63 6f 6d 56 69 64 65
+ *	6f 63 6f 72 65 00 00 00 00 00 00 00 09
+ *
+ *	----------------
+ *
+ *	HDMI InfoFrame Checksum: 0x93
+ *
+ *	Source Product Description InfoFrame
+ *	  Version: 1
+ *	  Length: 25
+ *	  Vendor Name: 'Broadcom'
+ *	  Product Description: 'Videocore'
+ *	  Source Information: PC general
+ *
+ *	----------------
+ *
+ *	Source Product Description InfoFrame conformity: PASS
+ *
  * Testing
  * ~~~~~~~
  *
  * The helpers have unit testing and can be tested using kunit with:
  *

-- 
2.48.1

