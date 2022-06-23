Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B75557735
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 11:56:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5768113DE5;
	Thu, 23 Jun 2022 09:56:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEF0113DEA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 09:56:05 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id o16so27154625wra.4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 02:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=6Cgf9hVSkM/EuU/G5NtEggFm/5gYU2/ohft6Hi2iUoM=;
 b=DLmoXC2LYtmMgIH+URO1IHtjbJCkAlV59T4EGENzDuHw84VK8aoJRf91/NSWhHmkLq
 la7BekdDXIMQn5158NIifoyNSxZ8rOGLI4tmMtNQuFu09+Je2Cxuo7h8SQQMIVXThZMs
 8VT/86TI0kDnTa4ob3cL1JI/mU9v/1Gz51zfzHYQ8A/8LW2xVMxzdv4Ob9qaA8GOv6xS
 Yi4R3/5NY9nOtFNzri5fKyCDwKG0PRRndmIRvK8O17szrd38RoIwjZMS2x+ZesVzcP2F
 5+3Gn513loHRpcMpd3PgraUPt+wVBI+8OrOXqaF5u2M7VX29rSW+A5iNjl/6PBL0wYKs
 dCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6Cgf9hVSkM/EuU/G5NtEggFm/5gYU2/ohft6Hi2iUoM=;
 b=PFNJyT6w5WrK7/QQKtlJlhnTjvbI0Sf/7/oL8TCmTcNbHjSEf8P1h+WiB7eujo8W25
 Z0kp9ZlLzEumC+o14GPRik2GXpD93IlzIyMM55hGDx8H7ed/AH4h2lMnx5LS34AF/ZsC
 OLgkH/fHL6hyzC0Q9fjvyN8c+F3IJTc9q4OwHXSoYqXVAd95ElB2h0aRbAOWLYPnJ3nk
 4cKgBtc/kxTu3WsryVke3X/xhRxwXcLMtIsa46tgSJOO5MSazjXOnJfR3h6FbZg3Y/j3
 zWawJJNaeg3/Q21G9P/mRTNIFTsvL/zCc4bTQHw/eMAnKFgbv6Z2y1Tx7FcaKlgw0o/b
 bg9g==
X-Gm-Message-State: AJIora8Fs3uU1eOsskxWg/pbAcwOmQ/IDQXMp6CqO+Q2Bl2KDE5uVPNZ
 +O25pEgnAxUzzrHLOt0Jgxc=
X-Google-Smtp-Source: AGRyM1vZrhIfv6R1QkV1NYPXd8xWwai/oZGPfNY5LyQaTGsyWgUNU53R1OmMZyCCfCJniSdsnvSlzA==
X-Received: by 2002:a05:6000:1a89:b0:21b:83a9:aa6f with SMTP id
 f9-20020a0560001a8900b0021b83a9aa6fmr7545833wry.33.1655978163774; 
 Thu, 23 Jun 2022 02:56:03 -0700 (PDT)
Received: from felia.fritz.box
 (200116b826a89a00b5a52346a320d486.dip.versatel-1u1.de.
 [2001:16b8:26a8:9a00:b5a5:2346:a320:d486])
 by smtp.gmail.com with ESMTPSA id
 bp17-20020a5d5a91000000b0021b9870049dsm7938326wrb.82.2022.06.23.02.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jun 2022 02:56:03 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH] MAINTAINERS: rectify entry for NVIDIA TEGRA DRM and VIDEO
 DRIVER
Date: Thu, 23 Jun 2022 11:54:52 +0200
Message-Id: <20220623095452.30745-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit fd27de58b0ad ("dt-bindings: display: tegra: Convert to json-schema")
converts nvidia,tegra20-host1x.txt to yaml, but missed to adjust its
references in MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair these file references in NVIDIA TEGRA DRM and VIDEO DRIVER.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Thierry, please pick this minor non-urgent clean-up on top of the commit above.

 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1e99a4249dba..f84dba7ee301 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6767,7 +6767,7 @@ L:	dri-devel@lists.freedesktop.org
 L:	linux-tegra@vger.kernel.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/tegra/linux.git
-F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
 F:	Documentation/devicetree/bindings/gpu/host1x/
 F:	drivers/gpu/drm/tegra/
 F:	drivers/gpu/host1x/
@@ -19757,7 +19757,7 @@ M:	Sowjanya Komatineni <skomatineni@nvidia.com>
 L:	linux-media@vger.kernel.org
 L:	linux-tegra@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
 F:	drivers/staging/media/tegra-video/
 
 TEGRA XUSB PADCTL DRIVER
-- 
2.17.1

