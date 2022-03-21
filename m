Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1494E27C0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:37:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD65410E418;
	Mon, 21 Mar 2022 13:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E9410E418
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:37:05 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 r190-20020a1c2bc7000000b0038a1013241dso8416864wmr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rmkzVJ7lPDe71qmJ25R6AMfvf9UDRM65tLBzs5QDkYM=;
 b=iLBFeSWPiXwVdVcwIuy6GOVhOfiIEdNdnew2OVu/3VdMYmn8EQsGhB9nkOzeluNv/z
 5/JDptmKB6dyn23iR67L1w/jLfL7LdKBVWAE9DCyutz/J+ZVCfUBC9o6/FmZrvpqaXql
 kYosN3MKPCSp6LDw3idHShhSyfvHjg3Wd6AynVl9Hqs1jiuWRLZdQkNzD//C8RBbZjUY
 araiUUqGsKqbmkZP2yvCTLdzeOg2aMmq2ZvIwy6vRzxhxkf0LKrsD5D8+U1N76py2um1
 IM7LNnUbv2cTEuxsXoojjbM63dyDlpmu+nJZA+aV69samqFzU1Z21/O4b4OCp7naBn3H
 JYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rmkzVJ7lPDe71qmJ25R6AMfvf9UDRM65tLBzs5QDkYM=;
 b=bDaTVsZ8SvFU/JDpsL/FVecA8GL86moyDQxbfQ3SHK+6o4b1sqMphmu61CoSdi+h2r
 BsVWn82ioLDYWwpZWeGL209UXZnzLL7u1YD23SqyoGTQDtI/lLpTu9gOTJh1pvtz8cCH
 MH452A1A9YJ4aF4rmU5JWHFZAH1lTpngSGPkK916A26Pq06oRI3Cbp0EltFYxowdAOij
 ILQYs/Z6hzbKsDbflONR4o9Jmfx2z9zKfi+c41fv65VDbixuVzb8y2ORoO3+auHGJ6Wo
 TMHaGKtvPUmJwVwumTSDBspgrEajS7dLYN4oQdMyHxapURZTe9pBtTfJCHJI3bw8nE+o
 T+Ig==
X-Gm-Message-State: AOAM532iYEGaXMpFB18T5UBbq3fUfCvmHpbsCYnRQHPzSaBh3Kli/JSt
 TbRrgxbYImAfdhOBXJLe9l4=
X-Google-Smtp-Source: ABdhPJyJztpZEF5HTmRWNv59asHTB2LyorTcORvSou9IrxfnYCvCgsEFrP4Vw4TR0ml++AXeJuR0PQ==
X-Received: by 2002:a05:600c:a0a:b0:350:564b:d55e with SMTP id
 z10-20020a05600c0a0a00b00350564bd55emr19446726wmp.124.1647869824164; 
 Mon, 21 Mar 2022 06:37:04 -0700 (PDT)
Received: from monk.home ([2a01:cb10:430:ec00:4737:d56e:186b:af1])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a5d5445000000b00203f8c96bcesm7969426wrv.49.2022.03.21.06.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:37:03 -0700 (PDT)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 0/3] Ingenic DRM bridge_atomic_enable proposal
Date: Mon, 21 Mar 2022 14:36:48 +0100
Message-Id: <20220321133651.291592-1-cbranchereau@gmail.com>
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

Hello,

v5 :

- this set doesn't include the nv3052c bindings doc anymore,
  as it's already applied

- nv3052c panel driver : removed empty lines, proceed to turn it off
  even is sleeping in fails instead of stopping there

- abt panel : switched to REGCACHE_FLAT so we can disable sleep mode
  in .enable with regmap_set_bits() instead of doing it at init time

- ingenic-drm-drv : added ingenic_drm_bridge_atomic_disable to balance
  out ingenic_drm_bridge_atomic_enable

Tested working on the rg350m and rg280m

Christophe Branchereau (3):
  drm/ingenic : add ingenic_drm_bridge_atomic_enable and disable
  drm/panel: Add panel driver for NewVision NV3052C based LCDs
  drm/panel : innolux-ej030na and abt-y030xx067a : add .enable and
    .disable

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  34 +-
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c  |  31 +-
 drivers/gpu/drm/panel/panel-innolux-ej030na.c |  31 +-
 .../gpu/drm/panel/panel-newvision-nv3052c.c   | 484 ++++++++++++++++++
 6 files changed, 572 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3052c.c

-- 
2.35.1

