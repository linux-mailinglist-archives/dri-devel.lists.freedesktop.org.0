Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B654E943282
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 16:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFB610E63F;
	Wed, 31 Jul 2024 14:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121C210E63F
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 14:56:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 65B8E62111;
 Wed, 31 Jul 2024 14:56:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B05C116B1;
 Wed, 31 Jul 2024 14:56:18 +0000 (UTC)
Message-ID: <e33dc3c4-9d7d-4c85-97db-b6fd94142131@xs4all.nl>
Date: Wed, 31 Jul 2024 16:56:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 00/29] drm/connector: Create HDMI Connector
 infrastructure
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Sui Jingfeng <sui.jingfeng@linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, Andy Yan <andyshrk@163.com>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
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

On 27/05/2024 15:57, Maxime Ripard wrote:
<snip>

> Hans Verkuil also expressed interest in implementing a mechanism in v4l2
> to retrieve infoframes from HDMI receiver and implementing a tool to
> decode (and eventually check) infoframes. His current work on
> edid-decode to enable that based on that series can be found here:
> https://git.linuxtv.org/hverkuil/edid-decode.git/log/?h=hverkuil

Since this patch series is now merged in mainline I also pushed support
for parsing InfoFrames to the edid-decode git repo.

I believe the parsing part of the InfoFrames is complete, but the conformity
checks for the AVI and HDMI InfoFrames are still work-in-progress. But it
should be easier to develop this now that is merged.

The git repo for edid-decode is here: https://git.linuxtv.org/edid-decode.git/

I added test files to the test/if directory, and if you run:

edid-decode -I audio.test -I avi.test -I vendor.test -I spd.test edid.test -c

you'll get the output below.

Regards,

	Hans

edid-decode (hex):

00 ff ff ff ff ff ff 00 4c 2d 01 0c 01 06 00 01
2a 18 01 03 80 69 3b 78 0a 23 ad a4 54 4d 99 26
0f 47 4a bd ef 80 71 4f 81 c0 81 00 81 80 95 00
a9 c0 b3 00 01 01 08 e8 00 30 f2 70 5a 80 b0 58
8a 00 50 1d 74 00 00 1e 02 3a 80 18 71 38 2d 40
58 2c 45 00 50 1d 74 00 00 1e 00 00 00 fd 00 18
4b 0f 87 3c 00 0a 20 20 20 20 20 20 00 00 00 fc
00 53 41 4d 53 55 4e 47 0a 20 20 20 20 20 01 56

02 03 58 f1 57 61 10 1f 04 13 05 14 20 21 22 5d
5e 5f 60 65 66 62 63 64 07 16 03 12 29 09 07 07
15 07 50 3d 04 c0 83 01 00 00 e2 00 0f e3 05 c0
00 76 03 0c 00 30 00 b8 3c 21 d0 88 01 02 03 04
01 40 3f ff 50 60 80 90 67 d8 5d c4 01 78 80 03
e3 06 05 01 e3 0f 01 e0 01 1d 80 d0 72 1c 16 20
10 2c 25 80 50 1d 74 00 00 9e 66 21 56 aa 51 00
1e 30 46 8f 33 00 50 1d 74 00 00 1e 00 00 00 86

----------------

Block 0, Base EDID:
  EDID Structure Version & Revision: 1.3
  Vendor & Product Identification:
    Manufacturer: SAM
    Model: 3073
    Serial Number: 16778753 (0x01000601)
    Made in: week 42 of 2014
  Basic Display Parameters & Features:
    Digital display
    Maximum image size: 105 cm x 59 cm
    Gamma: 2.20
    RGB color display
    First detailed timing is the preferred timing
  Color Characteristics:
    Red  : 0.6406, 0.3300
    Green: 0.3007, 0.6005
    Blue : 0.1503, 0.0605
    White: 0.2802, 0.2900
  Established Timings I & II:
    IBM     :   720x400    70.081663 Hz   9:5     31.467 kHz     28.320000 MHz
    DMT 0x04:   640x480    59.940476 Hz   4:3     31.469 kHz     25.175000 MHz
    Apple   :   640x480    66.666667 Hz   4:3     35.000 kHz     30.240000 MHz
    DMT 0x05:   640x480    72.808802 Hz   4:3     37.861 kHz     31.500000 MHz
    DMT 0x06:   640x480    75.000000 Hz   4:3     37.500 kHz     31.500000 MHz
    DMT 0x09:   800x600    60.316541 Hz   4:3     37.879 kHz     40.000000 MHz
    DMT 0x0a:   800x600    72.187572 Hz   4:3     48.077 kHz     50.000000 MHz
    DMT 0x0b:   800x600    75.000000 Hz   4:3     46.875 kHz     49.500000 MHz
    Apple   :   832x624    74.551266 Hz   4:3     49.726 kHz     57.284000 MHz
    DMT 0x10:  1024x768    60.003840 Hz   4:3     48.363 kHz     65.000000 MHz
    DMT 0x11:  1024x768    70.069359 Hz   4:3     56.476 kHz     75.000000 MHz
    DMT 0x12:  1024x768    75.028582 Hz   4:3     60.023 kHz     78.750000 MHz
    DMT 0x24:  1280x1024   75.024675 Hz   5:4     79.976 kHz    135.000000 MHz
    Apple   :  1152x870    75.061550 Hz 192:145   68.681 kHz    100.000000 MHz
  Standard Timings:
    DMT 0x15:  1152x864    75.000000 Hz   4:3     67.500 kHz    108.000000 MHz
    DMT 0x55:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
    DMT 0x1c:  1280x800    59.810326 Hz  16:10    49.702 kHz     83.500000 MHz
    DMT 0x23:  1280x1024   60.019740 Hz   5:4     63.981 kHz    108.000000 MHz
    DMT 0x2f:  1440x900    59.887445 Hz  16:10    55.935 kHz    106.500000 MHz
    DMT 0x53:  1600x900    60.000000 Hz  16:9     60.000 kHz    108.000000 MHz (RB)
    DMT 0x3a:  1680x1050   59.954250 Hz  16:10    65.290 kHz    146.250000 MHz
  Detailed Timing Descriptors:
    DTD 1:  3840x2160   60.000000 Hz  16:9    135.000 kHz    594.000000 MHz (1872 mm x 1053 mm)
                 Hfront  176 Hsync  88 Hback  296 Hpol P
                 Vfront    8 Vsync  10 Vback   72 Vpol P
    DTD 2:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz (1872 mm x 1053 mm)
                 Hfront   88 Hsync  44 Hback  148 Hpol P
                 Vfront    4 Vsync   5 Vback   36 Vpol P
    Display Range Limits:
      Monitor ranges (GTF): 24-75 Hz V, 15-135 kHz H, max dotclock 600 MHz
    Display Product Name: 'SAMSUNG'
  Extension blocks: 1
Checksum: 0x56

----------------

Block 1, CTA-861 Extension Block:
  Revision: 3
  Underscans IT Video Formats by default
  Basic audio support
  Supports YCbCr 4:4:4
  Supports YCbCr 4:2:2
  Native detailed modes: 1
  Video Data Block:
    VIC  97:  3840x2160   60.000000 Hz  16:9    135.000 kHz    594.000000 MHz
    VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz
    VIC  31:  1920x1080   50.000000 Hz  16:9     56.250 kHz    148.500000 MHz
    VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
    VIC  19:  1280x720    50.000000 Hz  16:9     37.500 kHz     74.250000 MHz
    VIC   5:  1920x1080i  60.000000 Hz  16:9     33.750 kHz     74.250000 MHz
    VIC  20:  1920x1080i  50.000000 Hz  16:9     28.125 kHz     74.250000 MHz
    VIC  32:  1920x1080   24.000000 Hz  16:9     27.000 kHz     74.250000 MHz
    VIC  33:  1920x1080   25.000000 Hz  16:9     28.125 kHz     74.250000 MHz
    VIC  34:  1920x1080   30.000000 Hz  16:9     33.750 kHz     74.250000 MHz
    VIC  93:  3840x2160   24.000000 Hz  16:9     54.000 kHz    297.000000 MHz
    VIC  94:  3840x2160   25.000000 Hz  16:9     56.250 kHz    297.000000 MHz
    VIC  95:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
    VIC  96:  3840x2160   50.000000 Hz  16:9    112.500 kHz    594.000000 MHz
    VIC 101:  4096x2160   50.000000 Hz 256:135  112.500 kHz    594.000000 MHz
    VIC 102:  4096x2160   60.000000 Hz 256:135  135.000 kHz    594.000000 MHz
    VIC  98:  4096x2160   24.000000 Hz 256:135   54.000 kHz    297.000000 MHz
    VIC  99:  4096x2160   25.000000 Hz 256:135   56.250 kHz    297.000000 MHz
    VIC 100:  4096x2160   30.000000 Hz 256:135   67.500 kHz    297.000000 MHz
    VIC   7:  1440x480i   59.940060 Hz  16:9     15.734 kHz     27.000000 MHz
    VIC  22:  1440x576i   50.000000 Hz  16:9     15.625 kHz     27.000000 MHz
    VIC   3:   720x480    59.940060 Hz  16:9     31.469 kHz     27.000000 MHz
    VIC  18:   720x576    50.000000 Hz  16:9     31.250 kHz     27.000000 MHz
  Audio Data Block:
    Linear PCM:
      Max channels: 2
      Supported sample rates (kHz): 48 44.1 32
      Supported sample sizes (bits): 24 20 16
    AC-3:
      Max channels: 6
      Supported sample rates (kHz): 48 44.1 32
      Maximum bit rate: 640 kb/s
    DTS:
      Max channels: 6
      Supported sample rates (kHz): 48
      Maximum bit rate: 1536 kb/s
  Speaker Allocation Data Block:
    FL/FR - Front Left/Right
  Video Capability Data Block:
    YCbCr quantization: No Data
    RGB quantization: No Data
    PT scan behavior: No Data
    IT scan behavior: Supports both over- and underscan
    CE scan behavior: Supports both over- and underscan
  Colorimetry Data Block:
    BT2020YCC
    BT2020RGB
  Vendor-Specific Data Block (HDMI), OUI 00-0C-03:
    Source physical address: 3.0.0.0
    Supports_AI
    DC_36bit
    DC_30bit
    DC_Y444
    Maximum TMDS clock: 300 MHz
    Supported Content Types:
      Graphics
    Extended HDMI video details:
      3D present
      3D-capable-VIC mask present
      Base EDID image size is in units of 1 cm
      HDMI VICs:
        HDMI VIC 1:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
        HDMI VIC 2:  3840x2160   25.000000 Hz  16:9     56.250 kHz    297.000000 MHz
        HDMI VIC 3:  3840x2160   24.000000 Hz  16:9     54.000 kHz    297.000000 MHz
        HDMI VIC 4:  4096x2160   24.000000 Hz 256:135   54.000 kHz    297.000000 MHz
      3D: Side-by-side (half, horizontal)
      3D: Top-and-bottom
      3D VIC indices that support these capabilities:
        VIC  97:  3840x2160   60.000000 Hz  16:9    135.000 kHz    594.000000 MHz
        VIC  16:  1920x1080   60.000000 Hz  16:9     67.500 kHz    148.500000 MHz
        VIC  31:  1920x1080   50.000000 Hz  16:9     56.250 kHz    148.500000 MHz
        VIC   4:  1280x720    60.000000 Hz  16:9     45.000 kHz     74.250000 MHz
        VIC  19:  1280x720    50.000000 Hz  16:9     37.500 kHz     74.250000 MHz
        VIC   5:  1920x1080i  60.000000 Hz  16:9     33.750 kHz     74.250000 MHz
        VIC  20:  1920x1080i  50.000000 Hz  16:9     28.125 kHz     74.250000 MHz
        VIC  32:  1920x1080   24.000000 Hz  16:9     27.000 kHz     74.250000 MHz
        VIC  33:  1920x1080   25.000000 Hz  16:9     28.125 kHz     74.250000 MHz
        VIC  34:  1920x1080   30.000000 Hz  16:9     33.750 kHz     74.250000 MHz
        VIC  93:  3840x2160   24.000000 Hz  16:9     54.000 kHz    297.000000 MHz
        VIC  94:  3840x2160   25.000000 Hz  16:9     56.250 kHz    297.000000 MHz
        VIC  95:  3840x2160   30.000000 Hz  16:9     67.500 kHz    297.000000 MHz
        VIC  96:  3840x2160   50.000000 Hz  16:9    112.500 kHz    594.000000 MHz
      3D VIC indices with specific capabilities:
        VIC   5:  1920x1080i  60.000000 Hz  16:9     33.750 kHz     74.250000 MHz (frame packing)
        VIC  20:  1920x1080i  50.000000 Hz  16:9     28.125 kHz     74.250000 MHz (frame packing)
        VIC  33:  1920x1080   25.000000 Hz  16:9     28.125 kHz     74.250000 MHz (frame packing)
        VIC  34:  1920x1080   30.000000 Hz  16:9     33.750 kHz     74.250000 MHz (frame packing)
  Vendor-Specific Data Block (HDMI Forum), OUI C4-5D-D8:
    Version: 1
    Maximum TMDS Character Rate: 600 MHz
    SCDC Present
    Supports 12-bits/component Deep Color 4:2:0 Pixel Encoding
    Supports 10-bits/component Deep Color 4:2:0 Pixel Encoding
  HDR Static Metadata Data Block:
    Electro optical transfer functions:
      Traditional gamma - SDR luminance range
      SMPTE ST2084
    Supported static metadata descriptors:
      Static metadata type 1
  YCbCr 4:2:0 Capability Map Data Block:
    VIC  97:  3840x2160   60.000000 Hz  16:9    135.000 kHz    594.000000 MHz
    VIC  96:  3840x2160   50.000000 Hz  16:9    112.500 kHz    594.000000 MHz
    VIC 101:  4096x2160   50.000000 Hz 256:135  112.500 kHz    594.000000 MHz
    VIC 102:  4096x2160   60.000000 Hz 256:135  135.000 kHz    594.000000 MHz
  Detailed Timing Descriptors:
    DTD 3:  1920x1080i  50.000000 Hz  16:9     28.125 kHz     74.250000 MHz (1872 mm x 1053 mm)
                 Hfront  528 Hsync  44 Hback  148 Hpol P
                 Vfront    2 Vsync   5 Vback   15 Vpol P Vfront +0.5 Odd Field
                 Vfront    2 Vsync   5 Vback   15 Vpol P Vback  +0.5 Even Field
    DTD 4:  1366x768    59.789541 Hz 683:384   47.712 kHz     85.500000 MHz (1872 mm x 1053 mm)
                 Hfront   70 Hsync 143 Hback  213 Hpol P
                 Vfront    3 Vsync   3 Vback   24 Vpol P
Checksum: 0x86  Unused space in Extension Block: 3 bytes

----------------

edid-decode SHA: 303b033f9268 2024-07-31 14:47:43

Warnings:

Block 1, CTA-861 Extension Block:
  Video Capability Data Block: Set Selectable YCbCr Quantization to avoid interop issues.
  Colorimetry Data Block: Set the sRGB colorimetry bit to avoid interop issues.

Failures:

Block 0, Base EDID:
  Detailed Timing Descriptor #1: Mismatch of image size 1872x1053 mm vs display size 1050x590 mm.
  Detailed Timing Descriptor #2: Mismatch of image size 1872x1053 mm vs display size 1050x590 mm.
Block 1, CTA-861 Extension Block:
  Video Capability Data Block: Set Selectable RGB Quantization to avoid interop issues.
  Detailed Timing Descriptor #3: Mismatch of image size 1872x1053 mm vs display size 1050x590 mm.
  Detailed Timing Descriptor #4: Mismatch of image size 1872x1053 mm vs display size 1050x590 mm.
EDID:
  Base EDID: The DTD max image size is 1872x1053mm, which is larger than the display size 1050.0x590.0mm.

EDID conformity: FAIL

================

edid-decode InfoFrame (hex):

84 01 0a 70 01 00 00 00 00 00 00 00 00 00

----------------

HDMI InfoFrame Checksum: 0x70

Audio InfoFrame
  Version: 1
  Length: 10
  CT: Audio Coding Type: Refer to Stream Header
  CC: Audio Channel Count: 2
  SF: Sampling Frequency: Refer to Stream Header
  SS: Bits/Sample: Refer to Stream Header
  CXT: Audio Coding Extension Type: Refer to Audio Coding Type (CT) Field
  CA: Channel Allocation: FR/FL
  LSV: Level Shift Value: 0 dB
  DM_INH: Allow the Down Mixed Stereo Output: Yes
  LFEPBL: LFE Playback Level compared to other channels: Unknown or refer to other information

----------------

Audio InfoFrame conformity: PASS

================

edid-decode InfoFrame (hex):

82 02 0d b1 12 08 00 64 40 00 00 00 00 00 00 00
00

----------------

HDMI InfoFrame Checksum: 0xb1

AVI InfoFrame
  Version: 2
  Length: 13
  VIC 100:  4096x2160   30.000000 Hz 256:135   67.500 kHz    297.000000 MHz
  Y: Color Component Sample Format: RGB
  A: Active Format Information Present: Yes
  B: Bar Data Present: Bar Data not present
  S: Scan Information: Composed for an underscanned display
  C: Colorimetry: No Data
  M: Picture Aspect Ratio: No Data
  R: Active Portion Aspect Ratio: 8
  ITC: IT Content: No Data
  EC: Extended Colorimetry: xvYCC601
  Q: RGB Quantization Range: Default
  SC: Non-Uniform Picture Scaling: No Known non-uniform scaling
  YQ: YCC Quantization Range: Full Range
  CN: IT Content Type: Graphics
  PR: Pixel Data Repetition Count: 0
  Line Number of End of Top Bar: 0
  Line Number of Start of Bottom Bar: 0
  Pixel Number of End of Left Bar: 0
  Pixel Number of Start of Right Bar: 0

----------------

AVI InfoFrame conformity: PASS

================

edid-decode InfoFrame (hex):

81 01 04 6b 03 0c 00 00

----------------

HDMI InfoFrame Checksum: 0x6b

Vendor-Specific InfoFrame (HDMI), OUI 00-0C-03
  Version: 1
  Length: 4
  HDMI Video Format: No additional data

----------------

Vendor-Specific InfoFrame (HDMI), OUI 00-0C-03 conformity: PASS

================

edid-decode InfoFrame (hex):

83 01 19 c9 43 69 73 63 6f 00 00 00 56 69 64 65
6f 63 6f 72 65 00 00 00 00 00 00 00 09

----------------

HDMI InfoFrame Checksum: 0xc9

Source Product Description InfoFrame
  Version: 1
  Length: 25
  Vendor Name: 'Cisco'
  Product Description: 'Videocore'
  Source Information: PC general

----------------

Source Product Description InfoFrame conformity: PASS

