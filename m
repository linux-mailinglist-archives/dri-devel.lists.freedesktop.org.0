Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 860E54D18AC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 14:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9863510E6D0;
	Tue,  8 Mar 2022 13:06:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E91E210E6D0
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 13:06:54 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h15so4096543wrc.6
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 05:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QVUkiMBPzb0V6Lwr/lYCzPY0l/r9IyoIGkL0psVfcQI=;
 b=qzXZpTAo/WJaeuIoQBRD5jTnhWiPQOyDSdWnCQNbzQThVGfJFRmQDwh9PK25ZJkk7W
 dAPsQXTWgokt3vcoJV8Ag+/tPVYRe62tIzAwPd89fyCg9GhgKmpmkyKl/E/NiP2PnGf7
 3aWMEuqfAAecFDBaeFqphSe028pjKKm0S8rRPCTjqlhVu69JhfijMUdsfkTHnqwyDSRb
 PeVozssOnR+3OEmnVziuR+OyNTBqLjoBNyrO/X/898eW6r7wRwL/F7U8uoWuvWiz3Sp0
 AIrJjFX6FgTBL2t2hpFvzTFyaWdVv2/ZclGogNMZBd4WFhGZ8Xj3N+fg07LhYwqItCz3
 B+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QVUkiMBPzb0V6Lwr/lYCzPY0l/r9IyoIGkL0psVfcQI=;
 b=o6uHDwwyBSon1dO8/uuIx/Mg2/mBmSnPaNgsLU+mRAU84Tqh7P8lCdA9jHqRmjubml
 72jd0lfxhWWAIb5CujGJZzbO4oypeW/B0m2kqRzRklygASTdrdJw/aMn9aLLaePfKaKs
 6ruW6Z5ahJD+DIW7rwhA8Z9HOZ7Tyhas2QfdF68YAggDd053e2/JoW8Y88jNUaH8UPAa
 IBEeK943BM0AeQgD1ntiRIexbs2Y9hnpq+f2oswTKVaTSuj1XG0KvIrgV4HG11i6nT6x
 LlFPleOvgq6P1D7lUwDQY+Jq0pxTxz66a5lFd/mT2Pdl0Yhbo0Xq6luI00Gac0FH5xyL
 KMEA==
X-Gm-Message-State: AOAM5326ofl3sFwbwXFWz688Pd4rtW0yxe8Rd5ONgDBy6M06DapACD2i
 3zOcbXlDd6uH+YwZFQD+4PE=
X-Google-Smtp-Source: ABdhPJwEXW2eoxeiOUY7hBK48npDtQn6u2AmK1ULMUO0dMBQUJaUo2G2MAIrO/TZM9EuRy0f2RfUWQ==
X-Received: by 2002:a5d:6985:0:b0:1f0:4916:4d00 with SMTP id
 g5-20020a5d6985000000b001f049164d00mr12099481wru.461.1646744813267; 
 Tue, 08 Mar 2022 05:06:53 -0800 (PST)
Received: from monk.home ([2a01:cb10:430:ec00:4737:d56e:186b:af1])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c1d8f00b003899d50f01csm2129159wms.6.2022.03.08.05.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 05:06:52 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/4] Ingenic DRM bridge_atomic_enable proposal
Date: Tue,  8 Mar 2022 14:06:39 +0100
Message-Id: <20220308130643.260683-1-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello, this is the v2 for my set of patches :

- use dev_err_probe() instead of dev_err() in the newvision panel
driver probe function

- add bindings documentation for the Leadtek ltk035c5444t

Cheers - Christophe

------------------------

Hello, this is a set of patches to allow the upstreaming of the
NV3052C panel found in the Anbernic RG350M mips gaming handheld.

It was never upstreamed so far due to a longstanding graphical
bug, which I propose to solve by introducing ingenic_drm_bridge_atomic_enable
in the drm driver so the CRTC can be enabled after the panel itself slept
out, and not before as it used to.

After the drm change, 2 of the existing panels have to be modified accordingly
to introduce missing .enable and .disable in their code.

Christophe Branchereau (4):
  drm/ingenic : add ingenic_drm_bridge_atomic_enable
  drm/panel: Add panel driver for NewVision NV3052C based LCDs
  drm/panel : innolux-ej030na and abt-y030xx067a : add .enable and
    .disable
  dt-bindings: display/panel: Add Leadtek ltk035c5444t

 .../panel/leadtek,ltk035c5444t-spi.yaml       |  59 +++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  19 +-
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c  |  23 +-
 drivers/gpu/drm/panel/panel-innolux-ej030na.c |  31 +-
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 497 ++++++++++++++++++
 7 files changed, 627 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t-spi.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3052c.c

-- 
2.34.1

