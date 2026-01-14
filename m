Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFCED1D371
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 09:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD92210E393;
	Wed, 14 Jan 2026 08:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC73410E393
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:47:14 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-b7ffbf4284dso1221339566b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 00:47:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768380433; x=1768985233;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BM8f7jH0taMvYnkaVr76MNplqROK/eiMRxPqXZYuq2Y=;
 b=wx2R0sfTJ+iClivOF7xjrEvTPjlN20M3oihhp6462hMvjVaJPdXINgMVgsNPvtXhB0
 fJYmEpgcAFXuqKlMwkk7dnlScJLImm5BPTJG51JMGLBFl1pXICmnezedL312tmIOe1kf
 x0+RkJGIHAjCWUjIic2IeSX52UfNitmaStIS5D7PyZcUWxCeb+YVwR43EJV8AZWCI8AD
 88WMTasyM0PzdZTIzI+zXbOJaOnWzVPdE8Ngq5VhLBsVtdvCCDECzjJVNacKlgq6tU2K
 oDQK9Jwxxqwmz9ls6+sEDCXRcfXrA948LgHZn2HmOuOG+exByatrccnLgvkaZk8yK2Jy
 cfbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFrrJHiht5TCGYxacMvtMQmVBjCSE35xeUE2/uZbC9keA5J3Cn3mYebg2iGCKP9EBrr0XM1DFz+g0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7xhXHIoemwApeRJ70pjL1wexjSF0amwvh/24KSYOkEyzd3hFP
 UZ3zyjDoRtKCtoyxg6b4sJW/uKWlC0D//vB0uhHclGKoGr9OQF3Op3a2
X-Gm-Gg: AY/fxX4g8yOINFyOLc1K2Y6N+24iGwu/8qNViuvfwRq994P++i5RDPs3iDIEV/b+h35
 kz0ekPwG5otYghsngWgS04FNHnS17gA88FzpXlzwXucuw/ISOE3Gvfu9elcfVERMPLQaI4mes+t
 Y4/14ADtXlNg7Ox8P6qjiT0orOrjNxKMOhDio/O4KuoX/IfomIDWYe37sxg09R16rq8pFgNAWDD
 ZOdLjnqM2ac8vhE0HkVr5xLPzvcpuiNNaWIVVjciH+lyx0AwesmUT0XABp6wZBJA8QdT+IjRKj1
 wiHADsrDeJetvD33fPZtPLP1VVZnv12hAWW5bu2MHJ3qmBtQQTmKtK+30eIzSC7q36h5O05G6vt
 +hmVjdpgQt+a9BvESVHkuFLiLZ681FBxQut5pWXY/HJbg4mltRCjGpx5p88zeWbYHO8EwtLjzw0
 9HxM6KqqemrTU814pEg1YhmA0nXzOvAKPfW2UvwmzwgYMyyA==
X-Received: by 2002:a17:907:2da0:b0:b83:972c:77fe with SMTP id
 a640c23a62f3a-b876770a4famr96020166b.2.1768380432976; 
 Wed, 14 Jan 2026 00:47:12 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507bf6d5d4sm22379136a12.32.2026.01.14.00.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 00:47:12 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH v2 0/5] New DRM accel driver for Texas Instruments' C7x
 DSPs
Date: Wed, 14 Jan 2026 09:46:47 +0100
Message-Id: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPdXZ2kC/2WMQQ7CIBBFr9LMWgwDxgZX3sN0QcoosygYoERtu
 LvYrcv3/8vbIFNiynAZNkhUOXMMHdRhgNnb8CDBrjMoqc4SUYvi7UJZaH1CNVrlDDro8jPRnV9
 76DZ19pxLTO+9W/G3/iUqCimM0Ub2w+hxvpa40Fr5E3M8Biowtda+r3H/yaIAAAA=
X-Change-ID: 20260113-thames-334127a2d91d
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
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

This series adds a new DRM/Accel driver that supports the C7x DSPs
inside some Texas Instruments SoCs such as the J722S. These can be used
as accelerators for various workloads, including machine learning
inference.

This driver controls the power state of the hardware via remoteproc and
communicates with the firmware running on the DSP via rpmsg_virtio.  The
kernel driver itself allocates buffers, manages contexts, and submits
jobs to the DSP firmware. Buffers are mapped by the DSP itself using its
MMU, providing memory isolation among different clients.

The source code for the firmware running on the DSP is available at:
https://gitlab.freedesktop.org/tomeu/thames_firmware/.

Everything else is done in userspace, as a Gallium driver (also called
thames) that is part of the Mesa3D project: https://docs.mesa3d.org/teflon.html

If there is more than one core that advertises the same rpmsg_virtio
service name, the driver will load balance jobs between them with
drm-gpu-scheduler.

Userspace portion of the driver: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/39298

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
Changes in v2:
- Add thames_accel.h UAPI header (Robert Nelson).
- Link to v1: https://lore.kernel.org/r/20260113-thames-v1-0-99390026937c@tomeuvizoso.net

---
Tomeu Vizoso (5):
      arm64: dts: ti: k3-j722s-ti-ipc-firmware: Add memory pool for DSP i/o buffers
      accel/thames: Add driver for the C7x DSPs in TI SoCs
      accel/thames: Add IOCTLs for BO creation and mapping
      accel/thames: Add IOCTL for job submission
      accel/thames: Add IOCTL for memory synchronization

 Documentation/accel/thames/index.rst               |  28 ++
 MAINTAINERS                                        |   9 +
 .../boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi      |  11 +-
 drivers/accel/Kconfig                              |   1 +
 drivers/accel/Makefile                             |   3 +-
 drivers/accel/thames/Kconfig                       |  26 ++
 drivers/accel/thames/Makefile                      |  11 +
 drivers/accel/thames/thames_core.c                 | 161 +++++++
 drivers/accel/thames/thames_core.h                 |  53 +++
 drivers/accel/thames/thames_device.c               |  93 +++++
 drivers/accel/thames/thames_device.h               |  46 ++
 drivers/accel/thames/thames_drv.c                  | 180 ++++++++
 drivers/accel/thames/thames_drv.h                  |  21 +
 drivers/accel/thames/thames_gem.c                  | 405 ++++++++++++++++++
 drivers/accel/thames/thames_gem.h                  |  45 ++
 drivers/accel/thames/thames_ipc.h                  | 204 +++++++++
 drivers/accel/thames/thames_job.c                  | 463 +++++++++++++++++++++
 drivers/accel/thames/thames_job.h                  |  51 +++
 drivers/accel/thames/thames_rpmsg.c                | 276 ++++++++++++
 drivers/accel/thames/thames_rpmsg.h                |  27 ++
 include/uapi/drm/thames_accel.h                    | 189 +++++++++
 21 files changed, 2300 insertions(+), 3 deletions(-)
---
base-commit: 27927a79b3c6aebd18f38507a8160294243763dc
change-id: 20260113-thames-334127a2d91d

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>

