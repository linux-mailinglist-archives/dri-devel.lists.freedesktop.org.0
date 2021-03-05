Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC8532F2D2
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 19:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8CE6E2B8;
	Fri,  5 Mar 2021 18:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC5F16E2B8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 18:39:36 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id c10so5356464ejx.9
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 10:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=csf5NUrQ9kMfqiZTp/u/Zzet0YANXVlQCtAWzL/FTXs=;
 b=OM50H73dJSmiQWPtiAgDQC8QtNScBgoN8IFAiSRolesoY/VKzRVI8ZgzoOo/3KRUqR
 Ya0VhVXXKsuz6UMf5L5rzvzrsHNq2Lukf5gcUHIY9MXr+yIJgBGDEvbz3LxQIEpmZnvo
 8gd3pProv7U4W3LujtZNBcP0fe4cmDzMOab422NL/n4ek9QOoByW0bMDhcIGpGhKIi+K
 rxYtW4yjs+xlgq9jmJm7l2WKh9bRQBAH7cprX+lUI+nIZcEAenTiSbfkgzxR5eSp+SHW
 R/9yC2dkW8CRO3l3HCrbGYVQVJBQrekxMJkFJj0iNIEn9r8u3J/lJ2830ZnQo2f0Sys9
 tkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=csf5NUrQ9kMfqiZTp/u/Zzet0YANXVlQCtAWzL/FTXs=;
 b=YnGuKNAg86dZYbl9C9rv54Qnraip9uGZz2Cn1gLAEr6pXS63fw4GKB/nXE5GNlJqF5
 3Lu8ifO43/kzUmav/3i9AIxMo445kXq3gu5ySqzVe/9CD1Np6UFoC1iokfTupZDOE+iX
 0Yr/u5f01P4/D8aNeY8uW9ElRSwZb13VbjEcPuSQSgyixhRPRobb/UTlR1j5KgAgydPE
 YqtvQbLEMlRcxrLj/9CmNr4TMebzh9gr/FEKAboIXFLrbBb3jjbx3pW1SKplWYk+fjDi
 c8QGPjpdmBEWHN9ktlXLuRs/w/qOLwTJigHmEO9CO16KOk/yi08qHmkRGo1Znp0FYegT
 HNtw==
X-Gm-Message-State: AOAM53106XwXdcmw1jtFVKiAavwlUgmc+Vol7/EkTzrI4MoZmxpbX4wT
 hlLZlmUHSCz8/U6mR+qFhGwunynj42MYfA==
X-Google-Smtp-Source: ABdhPJzgV6oVodqo2vSIRJd6iPTBwfUFts6Whd3IO0Rj0omIGeh9z4syPJ5oYN5G/cFZ4iMRFu68zQ==
X-Received: by 2002:a17:906:8583:: with SMTP id
 v3mr2136910ejx.361.1614969575174; 
 Fri, 05 Mar 2021 10:39:35 -0800 (PST)
Received: from arch-x1c3.. (cpc92308-cmbg19-2-0-cust99.5-4.cable.virginm.net.
 [82.24.248.100])
 by smtp.gmail.com with ESMTPSA id o1sm2121808eds.26.2021.03.05.10.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 10:39:34 -0800 (PST)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/7] Microship SAMA5D4 VPU support et al
Date: Fri,  5 Mar 2021 18:39:17 +0000
Message-Id: <20210305183924.1754026-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
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
Cc: kernel@collabora.com, Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

This series adds support for the Microchip SAMA5D4 VPU, which it based
on the Hantro G1.

The hardware can support up-to 1280x720 for each of the MPEG2, VP8 and
H264 codecs. There is only a single decoder and no encoders on the SoC.

To minimise duplication, the series starts with a few small cleanups.


As you may have noticed, this is my first patches series to linux-media,
so any tips how to make this as smoother process are appreciated.


Looking forward to your feedback,
Emil


Emil Velikov (7):
  media: hantro: use G1_REG_INTERRUPT directly for the mpeg2
  media: hantro: imx: reuse MB_DIM define
  media: hantro: imx: remove duplicate dec_base init
  media: hantro: imx: remove unused include
  media: hantro: introduce hantro_g1.c for common API
  ARM: configs: at91: sama5: update with savedefconfig
  ARM: dts: at91: sama5d4: add vdec0 component

 arch/arm/boot/dts/sama5d4.dtsi                |   9 ++
 arch/arm/configs/sama5_defconfig              |  51 ++++----
 drivers/staging/media/hantro/Kconfig          |  10 +-
 drivers/staging/media/hantro/Makefile         |   4 +
 drivers/staging/media/hantro/hantro_drv.c     |   3 +
 drivers/staging/media/hantro/hantro_g1.c      |  39 ++++++
 .../media/hantro/hantro_g1_mpeg2_dec.c        |   5 +-
 drivers/staging/media/hantro/hantro_hw.h      |   4 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c   |  27 +---
 drivers/staging/media/hantro/rk3288_vpu_hw.c  |  36 +-----
 .../staging/media/hantro/sama5d4_vdec_hw.c    | 118 ++++++++++++++++++
 11 files changed, 216 insertions(+), 90 deletions(-)
 create mode 100644 drivers/staging/media/hantro/hantro_g1.c
 create mode 100644 drivers/staging/media/hantro/sama5d4_vdec_hw.c

-- 
2.30.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
