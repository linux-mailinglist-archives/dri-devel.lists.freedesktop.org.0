Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E60A56889
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 14:11:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CE310EB42;
	Fri,  7 Mar 2025 13:11:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FD110EB42
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 13:11:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 81FB3A4576E;
 Fri,  7 Mar 2025 13:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABD2C4CED1;
 Fri,  7 Mar 2025 13:11:41 +0000 (UTC)
Message-ID: <9d0cb8b0-95a5-4766-88bd-45a0c5b54a1b@xs4all.nl>
Date: Fri, 7 Mar 2025 14:11:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/display: hdmi: Mention Infoframes testing with
 edid-decode
To: Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250306-drm-hdmi-state-docs-v1-0-56a19d3805a1@kernel.org>
 <20250306-drm-hdmi-state-docs-v1-2-56a19d3805a1@kernel.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20250306-drm-hdmi-state-docs-v1-2-56a19d3805a1@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 06/03/2025 18:17, Maxime Ripard wrote:
> edid-decode gained recently support to check that infoframes are
> compliant and match the EDID the monitor exposes.
> 
> Since the HDMI helpers provide those infoframes in debugfs, it makes it
> easy to check from userspace that the drivers (and helpers) behave
> properly.
> 
> Let's document it.
> 
> Cc: Hans Verkuil <hverkuil@xs4all.nl>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 240 ++++++++++++++++++++++++
>  1 file changed, 240 insertions(+)
> 
> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> index 24bfc82bf9b02bf3201d97432e3c239ccc8714b4..86f812b89f0e51abc24910898c114d6b08a78edf 100644
> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
> @@ -16,10 +16,250 @@
>   * in the form of KMS helpers.
>   *
>   * It contains TMDS character rate computation, automatic selection of
>   * output formats, infoframes generation, etc.
>   *
> + * Infoframes Compliance
> + * ~~~~~~~~~~~~~~~~~~~~~
> + *
> + * Drivers using the helpers will expose the various infoframes
> + * generated according to the HDMI specification in debugfs.
> + *
> + * Compliance can then be tested using a recent-enough ``edid-decode``
> + * version (released after summer 2024). A sample run would look like:
> + *
> + * .. code-block:: bash
> + *
> + *	# edid-decode \
> + *		-I /sys/kernel/debug/dri/1/HDMI-A-1/infoframes/audio \
> + *		-I /sys/kernel/debug/dri/1/HDMI-A-1/infoframes/avi \
> + *		-I /sys/kernel/debug/dri/1/HDMI-A-1/infoframes/hdmi \
> + *		-I /sys/kernel/debug/dri/1/HDMI-A-1/infoframes/hdr_drm \
> + *		-I /sys/kernel/debug/dri/1/HDMI-A-1/infoframes/spd \
> + *		/sys/class/drm/card1-HDMI-A-1/edid \
> + *		-c
> + *
> + *	edid-decode (hex):
> + *
> + *	00 ff ff ff ff ff ff 00 1e 6d f4 5b 1e ef 06 00
> + *	07 20 01 03 80 2f 1a 78 ea 24 05 af 4f 42 ab 25
> + *	0f 50 54 21 08 00 d1 c0 61 40 01 01 01 01 01 01
> + *	01 01 01 01 01 01 56 5e 00 a0 a0 a0 29 50 30 20
> + *	35 00 d1 06 11 00 00 1a 00 00 00 fd 00 3b 3d 1e
> + *	70 1e 00 0a 20 20 20 20 20 20 00 00 00 fc 00 4c
> + *	47 20 53 44 51 48 44 0a 20 20 20 20 00 00 00 ff
> + *	00 32 30 37 4e 54 52 4c 44 43 34 33 30 0a 01 43
> + *
> + *	02 03 29 71 23 09 07 07 4b 01 03 04 90 12 13 1f
> + *	22 5d 5e 5f 83 01 00 00 6d 03 0c 00 10 00 b8 3c
> + *	20 00 60 01 02 03 e2 00 6a 00 00 00 00 00 00 00
> + *	00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + *	00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + *	00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + *	00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> + *	00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ee
> + *
> + *	----------------
> + *
> + *	Block 0, Base EDID:
> + *	  EDID Structure Version & Revision: 1.3
> + *	 Vendor & Product Identification:

This looks odd: the two lines above should be aligned, but they are not.

Some copy-and-paste issue perhaps?

> + *	    Manufacturer: GSM
> + *	    Model: 23540
> + *	    Serial Number: 454430 (0x0006ef1e)
> + *	    Made in: week 7 of 2022
> + *	  Basic Display Parameters & Features:
> + *	    Digital display
> + *	    Maximum image size: 47 cm x 26 cm
> + *	    Gamma: 2.20
> + *	    DPMS levels: Standby Suspend Off
> + *	    RGB color display
> + *	    First detailed timing is the preferred timing
> + *	  Color Characteristics:
> + *	    Red  : 0.6835, 0.3105
> + *	    Green: 0.2587, 0.6679
> + *	    Blue : 0.1445, 0.0585
> + *	    White: 0.3134, 0.3291
> + *	  Established Timings I & II:
> + *	    DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
> + *	    DMT 0x09:   800x600    60.316541 Hz   4:3     37.879 kHz     40.000000 MHz
> + *	    DMT 0x10:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000000 MHz
> + *	  Standard Timings:
> + *	    DMT 0x52:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz
> + *	    DMT 0x10:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000000 MHz
> + *	  Detailed Timing Descriptors:
> + *	    DTD 1:  2560x1440   59.950550 Hz  16:9     88.787 kHz    241.500000 MHz (465 mm x 262 mm)
> + *	                 Hfront   48 Hsync  32 Hback   80 Hpol P
> + *	                 Vfront    3 Vsync   5 Vback   33 Vpol N
> + *	    Display Range Limits:
> + *	      Monitor ranges (GTF): 59-61 Hz V, 30-112 kHz H, max dotclock 300 MHz
> + *	    Display Product Name: 'LG SDQHD'
> + *	    Display Product Serial Number: '207NTRLDC430'
> + *	  Extension blocks: 1
> + *	Checksum: 0x43
> + *
> + *	----------------
> + *
> + *	Block 1, CTA-861 Extension Block:
> + *	  Revision: 3
> + *	  Basic audio support
> + *	  Supports YCbCr 4:4:4
> + *	  Supports YCbCr 4:2:2
> + *	  Native detailed modes: 1
> + *	  Audio Data Block:
> + *	    Linear PCM:
> + *	      Max channels: 2
> + *	      Supported sample rates (kHz): 48 44.1 32
> + *	      Supported sample sizes (bits): 24 20 16
> + *	  Video Data Block:
> + *	    VIC   1:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
> + *	    VIC   3:   720x480    59.940060 Hz  16:9     31.469 kHz     27.000000 MHz
> + *	    VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
> + *	    VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz (native)
> + *	    VIC  18:   720x576    50.000000 Hz  16:9     31.250 kHz     27.000000 MHz
> + *	    VIC  19:  1280x720    50.000000 Hz  16:9     37.500 kHz     74.250000 MHz
> + *	    VIC  31:  1920x1080   50.000000 Hz  16:9     56.250 kHz    148.500000 MHz
> + *	    VIC  34:  1920x1080   30.000000 Hz  16:9     33.750 kHz     74.250000 MHz
> + *	    VIC  93:  3840x2160   24.000000 Hz  16:9     54.000 kHz    297.000000 MHz
> + *	    VIC  94:  3840x2160   25.000000 Hz  16:9     56.250 kHz    297.000000 MHz
> + *	    VIC  95:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
> + *	  Speaker Allocation Data Block:
> + *	    FL/FR - Front Left/Right
> + *	  Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
> + *	    Source physical address: 1.0.0.0
> + *	    Supports_AI
> + *	    DC_36bit
> + *	    DC_30bit
> + *	    DC_Y444
> + *	    Maximum TMDS clock: 300 MHz
> + *	    Extended HDMI video details:
> + *	      HDMI VICs:
> + *	        HDMI VIC 1:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
> + *	        HDMI VIC 2:  3840x2160   25.000000 Hz  16:9     56.250 kHz    297.000000 MHz
> + *	        HDMI VIC 3:  3840x2160   24.000000 Hz  16:9     54.000 kHz    297.000000 MHz
> + *	  Video Capability Data Block:
> + *	    YCbCr quantization: No Data
> + *	    RGB quantization: Selectable (via AVI Q)
> + *	    PT scan behavior: Always Underscanned
> + *	    IT scan behavior: Always Underscanned
> + *	    CE scan behavior: Always Underscanned
> + *	Checksum: 0xee  Unused space in Extension Block: 86 bytes
> + *
> + *	----------------
> + *
> + *	edid-decode SHA: 5332a3b76080 2024-11-19 07:53:00

I recommend that you get the latest edid-decode version from https://git.linuxtv.org/v4l-utils.git/
so that the documentation is at least corresponding to the most recent version.

Should there be a link to the official git repo as well?

> + *
> + *	Warnings:
> + *
> + *	Block 1, CTA-861 Extension Block:
> + *	  IT Video Formats are overscanned by default, but normally this should be underscanned.
> + *	  Video Data Block: VIC 1 and the first DTD are not identical. Is this intended?
> + *	  Video Data Block: All VICs are in ascending order, and the first (preferred) VIC <= 4, is that intended?
> + *	  Video Capability Data Block: Set Selectable YCbCr Quantization to avoid interop issues.
> + *	  Video Capability Data Block: S_PT is equal to S_IT and S_CE, so should be set to 0 instead.
> + *	  Display Product Serial Number is set, so the Serial Number in the Base EDID should be 0.
> + *	  Add a Colorimetry Data Block with the sRGB colorimetry bit set to avoid interop issues.
> + *	EDID:
> + *	  Base EDID: Some timings are out of range of the Monitor Ranges:
> + *	    Vertical Freq: 24.000 - 60.317 Hz (Monitor: 59.000 - 61.000 Hz)
> + *
> + *	Failures:
> + *
> + *	Block 1, CTA-861 Extension Block:
> + *	  Video Capability Data Block: IT video formats are always underscanned, but bit 7 of Byte 3 of the CTA-861 Extension header is set to overscanned.
> + *	EDID:
> + *	  CTA-861: Native progressive timings are a mix of several resolutions.
> + *
> + *	EDID conformity: FAIL
> + *
> + *	================
> + *
> + *	InfoFrame of '/sys/kernel/debug/dri/1/HDMI-A-1/infoframes/audio' was empty.
> + *
> + *	================
> + *
> + *	edid-decode InfoFrame (hex):
> + *
> + *	82 02 0d 31 12 28 04 00 00 00 00 00 00 00 00 00
> + *	00
> + *
> + *	----------------
> + *
> + *	HDMI InfoFrame Checksum: 0x31
> + *
> + *	AVI InfoFrame
> + *	  Version: 2
> + *	  Length: 13
> + *	  Y: Color Component Sample Format: RGB
> + *	  A: Active Format Information Present: Yes
> + *	  B: Bar Data Present: Bar Data not present
> + *	  S: Scan Information: Composed for an underscanned display
> + *	  C: Colorimetry: No Data
> + *	  M: Picture Aspect Ratio: 16:9
> + *	  R: Active Portion Aspect Ratio: 8
> + *	  ITC: IT Content: No Data
> + *	  EC: Extended Colorimetry: xvYCC601
> + *	  Q: RGB Quantization Range: Limited Range
> + *	  SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
> + *	  YQ: YCC Quantization Range: Limited Range
> + *	  CN: IT Content Type: Graphics
> + *	  PR: Pixel Data Repetition Count: 0
> + *	  Line Number of End of Top Bar: 0
> + *	  Line Number of Start of Bottom Bar: 0
> + *	  Pixel Number of End of Left Bar: 0
> + *	  Pixel Number of Start of Right Bar: 0
> + *
> + *	----------------
> + *
> + *	AVI InfoFrame conformity: PASS
> + *
> + *	================
> + *
> + *	edid-decode InfoFrame (hex):
> + *
> + *	81 01 05 49 03 0c 00 20 01
> + *
> + *	----------------
> + *
> + *	HDMI InfoFrame Checksum: 0x49
> + *
> + *	Vendor-Specific InfoFrame (HDMI), OUI 00-0C-03
> + *	  Version: 1
> + *	  Length: 5
> + *	  HDMI Video Format: HDMI_VIC is present
> + *	  HDMI VIC 1:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
> + *
> + *	----------------
> + *
> + *	Vendor-Specific InfoFrame (HDMI), OUI 00-0C-03 conformity: PASS
> + *
> + *	================
> + *
> + *	InfoFrame of '/sys/kernel/debug/dri/1/HDMI-A-1/infoframes/hdr_drm' was empty.
> + *
> + *	================
> + *
> + *	edid-decode InfoFrame (hex):
> + *
> + *	83 01 19 93 42 72 6f 61 64 63 6f 6d 56 69 64 65
> + *	6f 63 6f 72 65 00 00 00 00 00 00 00 09
> + *
> + *	----------------
> + *
> + *	HDMI InfoFrame Checksum: 0x93
> + *
> + *	Source Product Description InfoFrame
> + *	  Version: 1
> + *	  Length: 25
> + *	  Vendor Name: 'Broadcom'
> + *	  Product Description: 'Videocore'
> + *	  Source Information: PC general
> + *
> + *	----------------
> + *
> + *	Source Product Description InfoFrame conformity: PASS
> + *
>   * Testing
>   * ~~~~~~~
>   *
>   * The helpers have unit testing and can be tested using kunit with:
>   *
> 

Note that the InfoFrame checks are still rudimentary for the AVI and HDMI InfoFrames.

It's on my TODO list to improve this further, but -ENOTIME :-(

Regards,

	Hans
