Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A9753A36D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 13:03:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C167610E118;
	Wed,  1 Jun 2022 11:03:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8092E10E118
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 11:03:07 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e2so1848461wrc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 04:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+zZsO86c7UE7QvEC2eQfX2kUILcgmTmiVsimoV00Fig=;
 b=RWvLvKoFlLoIqtEIQEBmqRinPoXT2pwcMzXiPP9mYFKGYydw1o3JyJjUyV4EwzjC9P
 0UExEuQhv2MSWzAGrpUXAO2d1muYe8xLg0cKYXY3GwiaU5DeeQD5QEH+Th3UUos8fKrS
 0VB3J3QtsNdL8KC5zazlD7gE6vV3VDE/EkaAo8O6tyQR8OAIJByWUHWZgTihNNtopR5U
 mYxdbWYYI+coPQ3RimPdJXIhShfdegJk6PSk+P7R2MPYdu6EYrLW928ETR3SLm81Ybdj
 pJTdtzHiQinLYZ4OEknrc4/9sXwfq8cAPRq6uYG3fIxgwEV75i0LK8bFJeGBbNItTrxh
 v+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+zZsO86c7UE7QvEC2eQfX2kUILcgmTmiVsimoV00Fig=;
 b=MofPGKvhq2p+/ewQoXl7yCuByxrFo/QZ0QBkcqiV00G+J05y7aJmswiqqPb38eXS1Y
 2MD2gakcmEIcrONi+s8pMhs8GX29TN1SEKCPSs0SWm3lf2yFT00r1eEJXQXPU9BwZKJW
 Sd2OXhv8yAULqgKD8bkJDyNLVGJrtS4vOONIqyI+j47UAPAZMwFKor5GPv2YA43UlBo0
 vVkV2XxnV/JzsuYaLOLhM8r5VoBqupyYDFn2XZJkEE/4WJq3XIHIKoZUqsTlf6DPYtBy
 bhgEQtT6ZPOu/hlXI15x57yrwPZk18ywoASijvPJ3VhBTW1JoYByWTWLiOZDAxNxVVu7
 APFw==
X-Gm-Message-State: AOAM530dO7YlnlpRoqWPygH3GnjjdkrPJX8Ao3DEyIxkll/mgrV2sOKW
 jGlJUT0KWelk3OYbegxYkWo=
X-Google-Smtp-Source: ABdhPJzdFArfJvW9hQHWFrJs7yIIuQUxkFM6pa4e9yIMCEe3t4YJGws6JFPuVFk2mvCQupjXtq4MdA==
X-Received: by 2002:adf:c80a:0:b0:20c:ffa0:6a3 with SMTP id
 d10-20020adfc80a000000b0020cffa006a3mr52732693wrh.360.1654081385880; 
 Wed, 01 Jun 2022 04:03:05 -0700 (PDT)
Received: from morpheus.home.roving-it.com (82-132-215-116.dab.02.net.
 [82.132.215.116]) by smtp.googlemail.com with ESMTPSA id
 j14-20020a05600c190e00b00397381a7ae8sm6074559wmq.30.2022.06.01.04.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 04:03:05 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, bcm-kernel-feedback-list@broadcom.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>,
 javierm@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, maxime@cerno.tech,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v5 0/6] Raspberry PI 4 V3D enablement
Date: Wed,  1 Jun 2022 12:02:43 +0100
Message-Id: <20220601110249.569540-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a follow up from my v4 patchset. The power management pieces have
been split out to a separate independent set of patches by Stefan [1]. This
version 5 of the DRM patches are independent and given the V3D driver has
been upstream for some time the two patches to enable it in defconfigs can 
be taken at anytime independent of the enablement for the Raspberry Pi 4.

I've tested this using mesa 22.0.x and Wayland/Gnome on Fedora 36, it's 
more or less stable with basic testing.

Changes since v4:
- Fixes for device tree and bindings
- Split out the power management changes into an independent set
- Rebase to 5.18
- Individual changes in patches

[1] https://www.spinics.net/lists/arm-kernel/msg980342.html

Nicolas Saenz Julienne (1):
  arm64: config: Enable DRM_V3D

Peter Robinson (5):
  dt-bindings: gpu: v3d: Add BCM2711's compatible
  drm/v3d: Get rid of pm code
  drm/v3d: Add support for bcm2711
  ARM: dts: bcm2711: Enable V3D
  ARM: configs: Enable DRM_V3D

 .../devicetree/bindings/gpu/brcm,bcm-v3d.yaml  |  1 +
 arch/arm/boot/dts/bcm2711-rpi.dtsi             |  4 ++++
 arch/arm/boot/dts/bcm2711.dtsi                 | 11 +++++++++++
 arch/arm/configs/bcm2835_defconfig             |  1 +
 arch/arm/configs/multi_v7_defconfig            |  1 +
 arch/arm64/configs/defconfig                   |  1 +
 drivers/gpu/drm/v3d/Kconfig                    |  2 +-
 drivers/gpu/drm/v3d/v3d_debugfs.c              | 18 +-----------------
 drivers/gpu/drm/v3d/v3d_drv.c                  | 12 +-----------
 drivers/gpu/drm/v3d/v3d_gem.c                  | 12 +-----------
 10 files changed, 23 insertions(+), 40 deletions(-)

-- 
2.36.1

