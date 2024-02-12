Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB88851469
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F4310ED3A;
	Mon, 12 Feb 2024 13:14:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="FjrD8B8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com
 [209.85.219.202])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF9510ED2E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:14:20 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id
 3f1490d57ef6-dc64b659a9cso5459404276.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 05:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707743656; x=1708348456;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kvuLvApdM/ZlGaK4NZuFt8gRWwgyTlGJWJvpEXVTb1w=;
 b=FjrD8B8nRkLXGyOwD9NtBuD+mMY73/B5Wk7iloAqEYH+E629sDMtwj05chGUZ+8jJE
 4bIgTdhJK+z1atzYLGyUU1Xfm0soYkJHs71ooP2Sjuvv7eI+9oHHANkIcTkGFq8ETVxe
 JL7Qnisaf4TgJWH01P7Ora6bcTN4SgmQjhQYeerMvqH/Qw38w3BGoJmMVkahPkD9hsjY
 BYWWPdSALWqjUdD4v7klO5si2CCZgejn5EbfUi1TYZxplEPcLOZP2tJs9caGyKsuf1EZ
 4Smke758zlu3fWlI202Feo4zyTjeTREyMzqO87hCB+LuwajKCmpBCDRW47FY5TtvgKrg
 TQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707743656; x=1708348456;
 h=content-transfer-encoding:cc:to:from:subject:message-id
 :mime-version:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kvuLvApdM/ZlGaK4NZuFt8gRWwgyTlGJWJvpEXVTb1w=;
 b=hqxvlrbSCbQvC4xJ5sphJ2Y1yWT4JxKiOLXNdFZemLpcBwziIjmdjo5o4mloe68lke
 7p4vgqT2mWwrq/mEtCBBEvT/VG1JOtmcM2CRl34r4DiAm6/CyQ9ZMZfcgXW7DEqmamiM
 3ujQGm5vHu8Vt7d979xnIz1R6jY3Tfm5lXlhJGWzpGI9kWGD1uMUJf49BEjLaYFi24Dh
 JbOsSmB2aKWpwy+pNZVs9EuIKx57Qjrm78lNTJzofRmmZqj5iq4gywTjSxUIhF5dtfBW
 iBcMJppyNsHW+eoPwKJhV0HS05/fnEtORPLicLAfx8hxgoWr6hmfi4qVa3db4aW+ifuf
 /YmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPrkX0CFXPwCdQ6vRv44pHmaZ4cPr50UsO3rBSJXKgbm9S3n+FzT9ymySlazqhstMIkg75fma4M/GBYfzRL5hwDVKJ6mstmpy4309pZDEg
X-Gm-Message-State: AOJu0Ywuagvp94lxA11SxkQbDbj12w+xNc7REc7/l2W+PMlnxH5m73aa
 rcPn6JJq1WThKXolkcrMsNsYrfZopq+FHLjGA7wIA/Ltw7PnB2N+juPUr+RaXTk3jf/Qq+5YWSF
 /v68axxPRog==
X-Google-Smtp-Source: AGHT+IFr9+EiSzPAdqxdDrunMziFdLc97Szl2+/YcVLrl65gByrGUTWmItIayvjwjfIhJaI2on5s096RjZxdJg==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:6902:120c:b0:dc6:e5d3:5f03 with SMTP
 id s12-20020a056902120c00b00dc6e5d35f03mr1820499ybu.4.1707743656565; Mon, 12
 Feb 2024 05:14:16 -0800 (PST)
Date: Mon, 12 Feb 2024 13:13:14 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240212131323.2162161-1-panikiel@google.com>
Subject: [PATCH 0/9] Add Chameleon v3 video support
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

 .../bindings/media/google,chv3-fb.yaml        |   77 +
 .../devicetree/bindings/media/intel,dprx.yaml |  125 +
 .../socfpga/socfpga_arria10_chameleonv3.dts   |  130 +
 drivers/gpu/drm/display/Kconfig               |    1 +
 drivers/gpu/drm/display/drm_dp_mst_topology.c |   76 +-
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/google/Kconfig         |    3 +
 drivers/media/platform/google/Makefile        |    2 +
 .../media/platform/google/chameleonv3/Kconfig |   13 +
 .../platform/google/chameleonv3/Makefile      |    3 +
 .../platform/google/chameleonv3/chv3-fb.c     |  897 +++++++
 drivers/media/platform/intel/Kconfig          |   12 +
 drivers/media/platform/intel/Makefile         |    1 +
 drivers/media/platform/intel/intel-dprx.c     | 2171 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-subdev.c         |   11 +
 include/drm/display/drm_dp.h                  |    9 +-
 include/drm/display/drm_dp_mst.h              |  238 ++
 include/drm/display/drm_dp_mst_helper.h       |  232 +-
 include/linux/crc-dp.h                        |   10 +
 include/media/v4l2-subdev.h                   |    5 +
 lib/Kconfig                                   |    8 +
 lib/Makefile                                  |    1 +
 lib/crc-dp.c                                  |   78 +
 24 files changed, 3801 insertions(+), 304 deletions(-)
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
2.43.0.687.g38aa6559b0-goog

