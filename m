Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C288BE7DB
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 17:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD19110FB2F;
	Tue,  7 May 2024 15:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="i+4/mCop";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609FA10FB2F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 15:55:11 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-41dc9f97c7eso28246005e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2024 08:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1715097309; x=1715702109;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RJ47pWXAtCFdZcUV/HEfsVY67B3nHtrNt0g1FksRjBo=;
 b=i+4/mCopUetjx0lkzogh1RUa1aI+yg47qcCzdotHBM6LxGFHea7o6ZtSTLyKiv1mOS
 RH283xqyhS43jJ1ftti6vOsffmkgMreqxyOMvO5rFTuAwOlLFgr/Btgk/bYtOYo6rQlA
 k3i+SmbnnXaK/BTQsqz3mYE5WvrGpoiTYYNQjIeqw1LqlHTyai+2G6cjp8h71C8cHo1L
 prvm9c7LZRNHVJenyG+a1kiW6A/djj9D4Z9lPpSjBmJONWlvnrOSCQB928nWhpior6uB
 lHS1gbWfHxD7YIaH8hqWkdsAy+OFhUfLv9Ef7ApL6uiuYdF274lZ6SmOCNE69+AZRlua
 DJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715097309; x=1715702109;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RJ47pWXAtCFdZcUV/HEfsVY67B3nHtrNt0g1FksRjBo=;
 b=X3DLtK4YZpjMlWY+Bm65TWHh29mO8FUVR/H3OQImweY0RQaeNm5Jh2QKjmMm4CT20H
 9uzSIuLedVOuAh8m8fJtyPZ1te2NXL+mhvgEfjCbTD/PzoANt/EOU7gbvpGE9XGnXNWQ
 3VZPzVBeOMb7ijg3Gw4m1ZLIud1RjSe0vCJEuqfxxWz+GEsll0z/sRKqT0lLw22JEC+J
 k4ITRwLI9hhoGX0/fneCqmd/UEb7F7Mzu1CRZvPVaKAHBu1IJj5TFa9nZ/ESuIRa84Fr
 3Y2y61LET14IYvEJvldzE6HQ6KrOhzAT+zGhsWW9fiWmuRENvhPgXaEHteaos6J8v0aB
 mFsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMMcUM3iiyvus62I45xuTFXvi69UCD5FufP3MKGy0Ob/qfdngrGZ14OqjaZBRHDeNLRCJDBj8HYN8y6iwZ2EjTwrGuiY2EsYOOCUYRiNAp
X-Gm-Message-State: AOJu0YxeZzOlP38MX9dUV/I6iLR4iFtHJbZgqF3+IK5w8YZntgWQBaPB
 GNBVIhq/+IVrxJbEDqq9xOsADIHhwYc12m+iutF3Ezv7MYnJmLgMGcyiYkPLFcP+RfP4m/d2WeM
 /U+Tox7mh8w==
X-Google-Smtp-Source: AGHT+IH8xn8VWc+XkVkTbMSGWBKDl+TyyuL6M2xFwlfEJnC34wjOlZXzDZDE9agYnoRWzeKbkzLvsId01BSlcg==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:600c:5103:b0:41e:8543:c5ea with SMTP
 id 5b1f17b1804b1-41f2d44054cmr326105e9.1.1715097309052; Tue, 07 May 2024
 08:55:09 -0700 (PDT)
Date: Tue,  7 May 2024 15:54:03 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240507155413.266057-1-panikiel@google.com>
Subject: [PATCH v3 00/10] Add Chameleon v3 video support
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com, 
 "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Google Chameleon v3 is a testing device capable of emulating multiple
DisplayPort monitors, used for testing purposes.  It is based on an Arria
10 SoCFPGA.  This patchset adds V4L2 drivers for two IP blocks used in the
device's FPGA: the Chameleon v3 video interface, and the Intel DisplayPort
RX IP.  The former is a video capture device that takes video signal and
writes frames into memory, which can be later processed by userspace.
The latter is a DisplayPort receiver IP from Intel, its datasheet can
be found at:
https://www.intel.com/programmable/technical-pdfs/683273.pdf

The video interface driver is a regular v4l2 capture device driver, while
the DP RX driver is a v4l2 subdevice driver. In order to avoid code
duplication, some parts of the DisplayPort code from the DRM subsystem
were put into headers usable by the DP RX driver.

This patchset depends on changes merged into the linux-media tree at:
git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.10d

Here is the output of `v4l2-compliance -s` run on a Chameleon v3 for
/dev/video0 (no attached subdevice):

```
v4l2-compliance 1.27.0-5204, 32 bits, 32-bit time_t
v4l2-compliance SHA: dd049328e528 2024-04-29 13:40:09

Compliance test for chv3-video device /dev/video0:

Driver Info:
	Driver name      : chv3-video
	Card type        : Chameleon v3 video
	Bus info         : platform:c0060500.video
	Driver version   : 6.9.0
	Capabilities     : 0x84200001
		Video Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04200001
		Video Capture
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video0 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
	test VIDIOC_DV_TIMINGS_CAP: OK
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test TIME32/64: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	test MMAP (no poll): OK
	test MMAP (select): OK
	test MMAP (epoll): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for chv3-video device /dev/video0: 55, Succeeded: 55, Failed: 0, Warn=
ings: 0
```

Here is the output of `v4l2-compliance -s` run on a Chameleon v3 for
/dev/video4 (attached subdevice):

```
v4l2-compliance 1.27.0-5204, 32 bits, 32-bit time_t
v4l2-compliance SHA: dd049328e528 2024-04-29 13:40:09

Compliance test for chv3-video device /dev/video4:

Driver Info:
	Driver name      : chv3-video
	Card type        : Chameleon v3 video
	Bus info         : platform:c0060600.video
	Driver version   : 6.9.0
	Capabilities     : 0x84200001
		Video Capture
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04200001
		Video Capture
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video4 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 1 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK
	test VIDIOC_DV_TIMINGS_CAP: OK
	test VIDIOC_G/S_EDID: OK

Control ioctls (Input 0):
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 2 Private Controls: 0

Format ioctls (Input 0):
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test TIME32/64: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK
	test MMAP (no poll): OK
	test MMAP (select): OK
	test MMAP (epoll): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for chv3-video device /dev/video4: 55, Succeeded: 55, Failed: 0, Warn=
ings: 0
```

v3 changes:
  - Send v4l2-subdev API changes as a separate patchset
  - Drop chameleonv3/ directory
  - Change capture device name from "framebuffer" to "video interface"
  - Set sensible min and max dv timing caps
  - Set pixelclock to htotal * vtotal * 24Hz (we can't detect the actual va=
lue)
  - Remove enum_framesizes
  - Use v4l2_match_dv_timings()
  - Add V4L2_CID_DV_RX_POWER_PRESENT control
  - Use V4L2_DV_BT_CEA_1920X1080P60 as default timing
  - Use vb2_video_unregister_device()
  - Move subdev pad initialization to probe
  - Change subdev entity function to MEDIA_ENT_F_DV_DECODER
  - Drop dprx 'port' property and always use 'ports' instead
  - Remove legacy-format property and use multiple compats
  - Cleanup notifier only in non-fallback mode
  - Cleanup subdev entity using media_entity_cleanup()
  - Increase HPD pulse length to 500ms (see comment in dprx_set_edid())
  - Pull HPD low before updating EDID
  - Add a DisplayPort media bus type
  - Move receiver properties to port endpoint (data-lanes, link-frequencies=
)

v2 changes:
  - Add missing includes in dt binding examples
  - Add version number to intel,dprx compatible
  - Use generic node names in dts
  - Add and document IP configuration parameters
  - Remove IRQ registers from intel-dprx (they're not a part of the IP)
  - Remove no-endpoint property and check for "port" node instead

Pawe=C5=82 Anikiel (10):
  media: Add Chameleon v3 video interface driver
  drm/dp_mst: Move DRM-independent structures to separate header
  lib: Move DisplayPort CRC functions to common lib
  drm/display: Add mask definitions for DP_PAYLOAD_ALLOCATE_* registers
  media: dt-bindings: video-interfaces: Support DisplayPort MST
  media: v4l2-mediabus: Add support for DisplayPort media bus
  media: intel: Add Displayport RX IP driver
  media: dt-bindings: Add Chameleon v3 video interface
  media: dt-bindings: Add Intel Displayport RX IP
  ARM: dts: chameleonv3: Add video device nodes

 .../bindings/media/google,chv3-video.yaml     |   64 +
 .../devicetree/bindings/media/intel,dprx.yaml |  172 ++
 .../bindings/media/video-interfaces.yaml      |    7 +
 .../socfpga/socfpga_arria10_chameleonv3.dts   |  194 ++
 drivers/gpu/drm/display/Kconfig               |    1 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c |   76 +-
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/google/Kconfig         |   13 +
 drivers/media/platform/google/Makefile        |    3 +
 drivers/media/platform/google/chv3-video.c    |  891 +++++++
 drivers/media/platform/intel/Kconfig          |   12 +
 drivers/media/platform/intel/Makefile         |    1 +
 drivers/media/platform/intel/intel-dprx.c     | 2283 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-fwnode.c         |   38 +
 include/drm/display/drm_dp.h                  |    9 +-
 include/drm/display/drm_dp_mst.h              |  238 ++
 include/drm/display/drm_dp_mst_helper.h       |  232 +-
 include/dt-bindings/media/video-interfaces.h  |    2 +
 include/linux/crc-dp.h                        |   10 +
 include/media/v4l2-fwnode.h                   |    5 +
 include/media/v4l2-mediabus.h                 |   17 +
 lib/Kconfig                                   |    8 +
 lib/Makefile                                  |    1 +
 lib/crc-dp.c                                  |   78 +
 25 files changed, 4053 insertions(+), 304 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/google,chv3-vid=
eo.yaml
 create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.yaml
 create mode 100644 drivers/media/platform/google/Kconfig
 create mode 100644 drivers/media/platform/google/Makefile
 create mode 100644 drivers/media/platform/google/chv3-video.c
 create mode 100644 drivers/media/platform/intel/intel-dprx.c
 create mode 100644 include/drm/display/drm_dp_mst.h
 create mode 100644 include/linux/crc-dp.h
 create mode 100644 lib/crc-dp.c

--=20
2.45.0.rc1.225.g2a3ae87e7f-goog

