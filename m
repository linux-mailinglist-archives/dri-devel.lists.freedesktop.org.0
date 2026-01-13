Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE7CD1AB08
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 18:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B753610E137;
	Tue, 13 Jan 2026 17:44:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B9110E137
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:44:47 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b7cf4a975d2so1335334066b.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:44:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768326286; x=1768931086;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nRDDaI8PSQ9i8fUQYmRubU2lZ9FKKoqL8+7T/Yos84E=;
 b=ultKqGIReXmofrt9xx01aQOAdjGmGYnPMf50/YB+bZfZcTz01sD4JkdTNMyuA2HmyD
 uSKX3TkbQlyvcX/OMXEoEBBNR2DVoDJuJuuBChPwfDQW2zupBZUIml5LoIjECIrrSifx
 DA06lI5ce36sWL/RSpw8OEn8y5a+9Y58NlkROg3vMvwmhJ90x2TTgfMxQLghU2UiPpNg
 L6rV2bABU+ns0DTkDloSKjTIX7Mi6SBcb1sbDs1E2Y3P0DUDrtKjRq14tkq5pg8P0PE4
 zIk97AC/+Y/DPHSiLmssHQXumuWXYe9Iw6Yq1RUBZpvq+fAMeOdPEqjlAD3ShaxE/pSz
 3QVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYSu/QRCDnl76Aa2b0qKkLlCHBd/eqPHdcRcX9MX2ofJqNyxkQE/5Tb47IfeV/ZNNgQEBoMihuwBE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbpk5uuFrZ5as2HVRKQH90oyINHDJGLnGUXqdKy4u0NrSvG2TG
 fVmHWYLDOHJaD28QwUvGYu9wawPy5lHs3zZDDceor2pXoID0flQdBSG0
X-Gm-Gg: AY/fxX7v1tCIyLlVAZrUbnnXiF9VblMIG8CH2bhVB1gVVpseCnuLEC0De/2nyxBODt5
 EONxRq7NJnqwPMiNaYmIbrXuUwiiOjzj16gLD3M/+8qgGEL10lXAYSBoTScQ/ROqJWxfWMjs/Uj
 LRfYzjaS3EQsWASqdU7fMiMyXCyjst0qvf5K3aybiWZ5ALkX8smYXlBV9I/3BaFZkEQouJdMNS5
 +Bxlxq5Ge4mpiC0I/tLonn83zuOHVOeDSap7FlApyHBCMZNB75bJTlAYsS5thN1Y7w97TdoetIe
 PJdYQuPdp7PzEG19Uzz2L276aBGnAdjjTjIH+ymrExqZjdO+3qOdQAsOTOVJfOVnLao0jYYs4Th
 lrAffQzjAiWdQ67k45vIW2E58MJ8Qj5VW5nrwVnebrffR2J+eX0JFs8TQFvfiAQZH5Qc9jYfJhR
 zAD9I9w+dqte43ZHDR2Y85wXq70kwrEVZejHP8dmexrXmclg==
X-Google-Smtp-Source: AGHT+IF2LxGsN/6Keoe3DyT2UHG1IbdrBpLZY09D3elBScNdSzuVpg3kGMzeCVp/wgijXP8twmjnjw==
X-Received: by 2002:a17:906:7954:b0:b87:2579:b6cf with SMTP id
 a640c23a62f3a-b872579ba1bmr579850766b.41.1768326285367; 
 Tue, 13 Jan 2026 09:44:45 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507be655aesm20873259a12.17.2026.01.13.09.44.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 09:44:44 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Subject: [PATCH 0/5] New DRM accel driver for Texas Instruments' C7x DSPs
Date: Tue, 13 Jan 2026 18:44:34 +0100
Message-Id: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKEZmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Nj3ZKMxNzUYl1jYxNDI/NEoxRLwxQloOKCotS0zAqwQdGxtbUAsQm
 1olgAAAA=
X-Change-ID: 20260113-thames-334127a2d91d
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
 drivers/accel/thames/thames_gem.c                  | 407 ++++++++++++++++++
 drivers/accel/thames/thames_gem.h                  |  45 ++
 drivers/accel/thames/thames_ipc.h                  | 204 +++++++++
 drivers/accel/thames/thames_job.c                  | 463 +++++++++++++++++++++
 drivers/accel/thames/thames_job.h                  |  51 +++
 drivers/accel/thames/thames_rpmsg.c                | 276 ++++++++++++
 drivers/accel/thames/thames_rpmsg.h                |  27 ++
 20 files changed, 2113 insertions(+), 3 deletions(-)
---
base-commit: 27927a79b3c6aebd18f38507a8160294243763dc
change-id: 20260113-thames-334127a2d91d

Best regards,
-- 
Tomeu Vizoso <tomeu@tomeuvizoso.net>

