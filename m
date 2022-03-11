Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98284D6708
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 18:02:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3560810E1DF;
	Fri, 11 Mar 2022 17:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B817D10E1DF
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 17:02:52 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 v130-20020a1cac88000000b00389d0a5c511so1476588wme.5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 09:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b4tMgDVBFnehXL1pb03Ti258/q2uZML0ebzleqv3Ixc=;
 b=HvaUH62WX6pUIJOi+/a29vKAhOLeIKnRopbrO4JJKhz3QmzZe6muG+Y/BEVFEy8Fse
 KAMZTnkj+diNGxkXEJswNHG4PaeViCUgUcsX58aeK9YXfjMicxgf7X1wCIZy6XIzUuxF
 IQwjY434BYdRUFTZcRveJ9kQIFhD1JeozqEl1VcafA89VELNfHMPbT5H/9eEf/XFA36i
 gG2Z0t2ecvYST3P8KuSYSKkI9npMTbzx+SwwU7cB0AUIU6mLqjcOXjPqsXzDm3U/insT
 Mz8TusuJ8GMP/wWrZAlqtKp1EBRc1TYDa96pDKOC5IKD82IfvgNRf2jq9SytW27A6ZUL
 /BSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b4tMgDVBFnehXL1pb03Ti258/q2uZML0ebzleqv3Ixc=;
 b=hQjTiqRCwsTz+yaMI5yvKxYQFmtXKrktdmwOjdpHNfa74wNwHcVc8+T3RKbKesHEkJ
 WM6v2hpoD4oFKYl5kWYIqpX22YSlBYooqvkgZxu8Zk5PmwakTfA0TYEeEwu3f+w9PCwx
 uni019MgaxJ5u64wfq7tWAuyMEvnDZJmCpnZzY3PGv0mMXEpvvUZUr9d91uCW/Wb59C+
 WnRbG7960yi/6cb2JOZDgvEkkRxOHwJr2JELDP/RK6XUD+N37FB/MCBGAu1UqRqZscYT
 44/9drDRfTQQYUnywsSMc2sttZE9QK0HgBtaEJpabrRgDZlQ7T/fDx3UmIb16K23C6Fv
 uMrQ==
X-Gm-Message-State: AOAM533kCH29Qxqd3q7OcuQtdF7BaxyzlJaNiI5sH61gOU7K0NMxil0V
 5ff/yq+o2S1yo0CuN3CqDyI=
X-Google-Smtp-Source: ABdhPJxj3jVOz/Q7IbMLbCLuZKT16k+r+6pniCJkraCXFGPsIUcmDCYdhxcNOthvBDG08MXtT0TOqQ==
X-Received: by 2002:a05:600c:3590:b0:389:f1c5:fd10 with SMTP id
 p16-20020a05600c359000b00389f1c5fd10mr2509465wmq.76.1647018171025; 
 Fri, 11 Mar 2022 09:02:51 -0800 (PST)
Received: from monk.home ([2a01:cb10:430:ec00:4737:d56e:186b:af1])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037bb8df81a2sm14067733wmp.13.2022.03.11.09.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 09:02:50 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 0/4] Ingenic DRM bridge_atomic_enable proposal
Date: Fri, 11 Mar 2022 18:02:36 +0100
Message-Id: <20220311170240.173846-1-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.35.1
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

v4: fix the bindings license

KR
Christophe

-----------------------

Hello, v3 :

Drop -spi in the compatible string, adjust bindings doc accordingly

KR
Christophe

------------------------

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

 .../display/panel/leadtek,ltk035c5444t.yaml   |  59 +++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  19 +-
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c  |  23 +-
 drivers/gpu/drm/panel/panel-innolux-ej030na.c |  31 +-
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 497 ++++++++++++++++++
 7 files changed, 627 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/leadtek,ltk035c5444t.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3052c.c

-- 
2.35.1

