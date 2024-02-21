Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117ED85E25E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 17:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F64110E7D8;
	Wed, 21 Feb 2024 16:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Or4ga+G+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0062C10E7D7
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 16:02:31 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-33d7fcb70c2so336568f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Feb 2024 08:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708531350; x=1709136150;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FJVga6C02gm8F+WILMx3neboftdensw7Cuuwer2cEQA=;
 b=Or4ga+G+KQdtfcplzBN8VU++NgbmqMujLlTeHyRP4F/zjwrJYiXTfEuIY81r4Yi+5V
 glCwkfpb+rDZcpePux8YaBf6nwLeaJ3IHGC3fb6Yzltu3Nj2xtgCnpYv+ALFZOau7f17
 HeXFmwH6lN3UJkvQuUJ5fAX4N7jAzeGdDR0RzXWKq/rv2IMCgHIkjDPwce5RnOfDyj22
 fL65ZBOABNFP7T/OAJ5iDl+I9yyppnziphVXCBOTakoQBeY1272+bhv+MKNrfGz4hFho
 gjUnsMQS5zGs8HX9mldYemC65Lf8WyIie/8SuREzQEKnmt5neRQfQOPC4AcPgyGS7EP0
 6L/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708531350; x=1709136150;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FJVga6C02gm8F+WILMx3neboftdensw7Cuuwer2cEQA=;
 b=cnMhxukY3S6uA4bTMhja+0m57aN1i4cIf4sFQDjMIan+FTkkawenFXerISTU6LJp1+
 H3B2VVqchd4vgaW2bR8a9hj6EtVSS7JwZwSo6oV//6sSqmc6LEDM+kwaXMpFJejKNE8u
 DV18PCG9Lyy+ocXTljSSwvoqmaDnnVko36gfiMTe3L8vs73SnqDbxvOpoOuGAbyMz2W/
 LgwUm5WtKxLcEAEi+EwqeGwXKGLvaofH2F9cM5h0i4eRK3pbCn3DJSacVSoTCAHfl4Kl
 fP+TbBfNVPXJsUTeyaebYswOGw2X3O21OhBKmAZN/5jB1YbByrQsroNiOYpIaBVQPJq+
 2PPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrR/5AOD6J2MtL6qIgGkcHrImcA3S+Yky5kAKrS4IQl1mknV61KfHuslLaORUIARMeIgmFhTx8N1ZAnj+FHA925Y2w78hYj4V5aYkWXULT
X-Gm-Message-State: AOJu0YwNSLadXDUayGNY9UZeJNBee0QMpdvZ57ufBy9pKA4jh/VaojFb
 vVZkek0gnLqOjEnCs8PHmqHXqQCyUxHeOsDkkr1f9qSKQ2BP+gnMZ+6HkddUQv1Rx3uARby45mS
 t5M4KhzxkcQ==
X-Google-Smtp-Source: AGHT+IEooKRp2zKGUK2syFgTA3tTV4kAt1EwuYhu4+TtSMP3vQ9G88kPNi9mc3bYpxIMwIx+9Ey3AiIC1zmmfQ==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:adf:ce90:0:b0:33d:87e6:c960 with SMTP id
 r16-20020adfce90000000b0033d87e6c960mr89wrn.6.1708531350183; Wed, 21 Feb 2024
 08:02:30 -0800 (PST)
Date: Wed, 21 Feb 2024 16:02:06 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221160215.484151-1-panikiel@google.com>
Subject: [PATCH v2 0/9] Add Chameleon v3 video support
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: airlied@gmail.com, akpm@linux-foundation.org, conor+dt@kernel.org, 
 daniel@ffwll.ch, dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
 krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
 mchehab@kernel.org, mripard@kernel.org, robh+dt@kernel.org, 
 tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 chromeos-krk-upstreaming@google.com, ribalda@chromium.org, 
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
10 SoCFPGA.  This patchset adds V4L2 drivers for two IP blocks used in
the device's FPGA: the Chameleon v3 framebuffer, and the Intel DisplayPort
RX IP.  The former is a video capture device that takes video signal and
writes frames into memory, which can be later processed by userspace.
The latter is a DisplayPort receiver IP from Intel, its datasheet can
be found at:
https://www.intel.com/programmable/technical-pdfs/683273.pdf

The framebuffer driver is a regular v4l2 capture device driver, while
the DP RX driver is a v4l2 subdevice driver. In order to avoid code
duplication, some parts of the DisplayPort code from the DRM subsystem
were put into headers usable by the DP RX driver. Apart from that, the
patchset adds a new callback to the internal v4l2 subdevice API to allow
querying the dv timings of individual video streams of the DP receiver.

v2 changes:
  - Add missing includes in dt binding examples
  - Add version number to intel,dprx compatible
  - Use generic node names in dts
  - Add and document IP configuration parameters
  - Remove IRQ registers from intel-dprx (they're not a part of the IP)
  - Remove no-endpoint property and check for "port" node instead

Pawe=C5=82 Anikiel (9):
  media: v4l2-subdev: Add a pad variant of .query_dv_timings()
  media: Add Chameleon v3 framebuffer driver
  drm/dp_mst: Move DRM-independent structures to separate header
  lib: Move DisplayPort CRC functions to common lib
  drm/display: Add mask definitions for DP_PAYLOAD_ALLOCATE_* registers
  media: intel: Add Displayport RX IP driver
  media: dt-bindings: Add Chameleon v3 framebuffer
  media: dt-bindings: Add Intel Displayport RX IP
  ARM: dts: chameleonv3: Add video device nodes

 .../bindings/media/google,chv3-fb.yaml        |   67 +
 .../devicetree/bindings/media/intel,dprx.yaml |  160 ++
 .../socfpga/socfpga_arria10_chameleonv3.dts   |  152 ++
 drivers/gpu/drm/display/Kconfig               |    1 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c |   76 +-
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/google/Kconfig         |    3 +
 drivers/media/platform/google/Makefile        |    2 +
 .../media/platform/google/chameleonv3/Kconfig |   13 +
 .../platform/google/chameleonv3/Makefile      |    3 +
 .../platform/google/chameleonv3/chv3-fb.c     |  895 +++++++
 drivers/media/platform/intel/Kconfig          |   12 +
 drivers/media/platform/intel/Makefile         |    1 +
 drivers/media/platform/intel/intel-dprx.c     | 2176 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c         |   11 +
 include/drm/display/drm_dp.h                  |    9 +-
 include/drm/display/drm_dp_mst.h              |  238 ++
 include/drm/display/drm_dp_mst_helper.h       |  232 +-
 include/linux/crc-dp.h                        |   10 +
 include/media/v4l2-subdev.h                   |    5 +
 lib/Kconfig                                   |    8 +
 lib/Makefile                                  |    1 +
 lib/crc-dp.c                                  |   78 +
 24 files changed, 3851 insertions(+), 304 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/google,chv3-fb.=
yaml
 create mode 100644 Documentation/devicetree/bindings/media/intel,dprx.yaml
 create mode 100644 drivers/media/platform/google/Kconfig
 create mode 100644 drivers/media/platform/google/Makefile
 create mode 100644 drivers/media/platform/google/chameleonv3/Kconfig
 create mode 100644 drivers/media/platform/google/chameleonv3/Makefile
 create mode 100644 drivers/media/platform/google/chameleonv3/chv3-fb.c
 create mode 100644 drivers/media/platform/intel/intel-dprx.c
 create mode 100644 include/drm/display/drm_dp_mst.h
 create mode 100644 include/linux/crc-dp.h
 create mode 100644 lib/crc-dp.c

--=20
2.44.0.rc0.258.g7320e95886-goog

