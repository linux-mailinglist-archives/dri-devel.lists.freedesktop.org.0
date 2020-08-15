Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9912450FA
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 14:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E5A6E296;
	Sat, 15 Aug 2020 12:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2100B6E102
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 12:54:22 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j22so6147567lfm.2
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 05:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Pvx2SzgUcRuWE1RepcZ56CM2lEHcyDxlzZ6KGXl/uBk=;
 b=ajDbz5peTQ99h3xb2LYZJgpo8xX/f75ks5ZQv0ysZhLWb0uJf7rKThSp7W19XlnLrl
 5xooLK5W49FHmDeT52rTipUBJQnIzGbgx+HFo6thQ//AmJ15maE4FpNOPsSLLJ4R9XNv
 EvFpgBLZYf/CKPbKpOTSD80V6O3D0CXtfTEzrKtwOairiWCcKRv+rvy4xeg/D5iId3DA
 vkxkLC3AEDOMBFI00OThgIt22L7E+6TSLeGfB0l1eRjDZcj5ObXYA6Zat+GhADx8jufs
 /3r3ffQcVShB/kXHDt99ckAVJblH2uHBVY9/BLI6zPqhv2zry1XpFUh5ZsJESHNbZtcy
 sx0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Pvx2SzgUcRuWE1RepcZ56CM2lEHcyDxlzZ6KGXl/uBk=;
 b=poqqPZdtvpBQ3Qyey9jeIOu10EUNPsMKVxgNqC4tDhJjB1okE1tgsy6KzK44YhBtp4
 IZlKHnFpIE8j49stvjcGLmEr88g4ZoG7MM1ySj06AIFNSswT3rTOVrbzmEwFAuMx0H7F
 97V6ZWwhwRGnZsL2X99IrBngGygpwlvQGqXoZKeIv2i5EBjtt36krpsoh0ieQ3/2h7ba
 pW8czyRqAuSMqaJI5bsY7vMnbpORKbpjnOgDf5mDJLRDOtIz1LbiQlvIKi+NPO2gmNM1
 DLpjG0RrdduSa4N9hN4XqxLs5qiXTUPOKNlVn0L1lTbq9M94aSiRf4lBMPEDsemf7u44
 S+TQ==
X-Gm-Message-State: AOAM532dxU33U/mLm/m7TDJiRK44yavvpIiIU9RMoT1a2wdU6FIhjeVS
 kPqfaYAm7RmdgYgUdK+M+FVMz53JkyZNhQ==
X-Google-Smtp-Source: ABdhPJzZaKmWjBRWLCmhIZLMOO5zfq56UQ33haIvu1+sk9OzGNWe3SSSF8T2+cXU6de+3rYeR95brQ==
X-Received: by 2002:a19:3d4:: with SMTP id 203mr3422305lfd.183.1597496060234; 
 Sat, 15 Aug 2020 05:54:20 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:402:93d8:3e64:6121])
 by smtp.gmail.com with ESMTPSA id e29sm2396322ljp.136.2020.08.15.05.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2020 05:54:19 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 0/5] drm/panel: Use dev_ based logging
Date: Sat, 15 Aug 2020 14:54:01 +0200
Message-Id: <20200815125406.1153224-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@linux.ie>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>,
 Jani Nikula <jani.nikula@intel.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Robert Chiras <robert.chiras@nxp.com>, Sam Ravnborg <sam@ravnborg.org>,
 Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm/panel drivers uses a mixture of DRM_ and dev_ based logging.
With this patchset all panel drivers are migrated to use dev_ based
logging as the DRM_ based logging did not add any extra info.

Drop the now unused include of drm_print.h.

With this change new panel drivers will be requires to change to dev_
based logging - so some of the in-flight panel drivers will need trivial
updates before they are accepted.

Patch divided in smaller bites to ease review. There is no dependencies
between the patches.

Copied a few people that may have input to the move away from DRM_ based
logging (Daniel (presumeably on vacation), Jani).

	Sam

Sam Ravnborg (5):
      drm/panel: samsung: Use dev_ based logging
      drm/panel: leadtek: Use dev_ based logging
      drm/panel: raydium: Use dev_ based logging
      drm/panel: sitronix: Use dev_ based logging
      drm/panel: Use dev_ based logging

 drivers/gpu/drm/panel/panel-boe-himax8279d.c       | 44 ++++--------
 drivers/gpu/drm/panel/panel-elida-kd35t133.c       | 51 +++++---------
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c  | 19 +++--
 .../gpu/drm/panel/panel-feiyang-fy07024di26a30d.c  | 21 +++---
 drivers/gpu/drm/panel/panel-ilitek-ili9322.c       |  3 +-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c      | 31 +++------
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c | 33 ++++-----
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 58 ++++++----------
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c | 49 +++++--------
 drivers/gpu/drm/panel/panel-novatek-nt35510.c      | 40 ++++-------
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c   | 13 ++--
 drivers/gpu/drm/panel/panel-raydium-rm67191.c      | 33 ++++-----
 drivers/gpu/drm/panel/panel-raydium-rm68200.c      | 18 +++--
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c       | 16 ++---
 drivers/gpu/drm/panel/panel-samsung-ld9040.c       |  3 +-
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c      | 23 +++---
 drivers/gpu/drm/panel/panel-samsung-s6e3ha2.c      |  3 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63j0x03.c   |  3 +-
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c      | 22 +++---
 drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c      |  3 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c      | 10 ++-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c      | 61 ++++++----------
 drivers/gpu/drm/panel/panel-sony-acx424akp.c       | 81 ++++++++--------------
 drivers/gpu/drm/panel/panel-tpo-tpg110.c           | 38 +++++-----
 drivers/gpu/drm/panel/panel-truly-nt35597.c        | 63 ++++++-----------
 drivers/gpu/drm/panel/panel-visionox-rm69299.c     | 41 ++++-------
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c   | 51 +++++---------
 27 files changed, 308 insertions(+), 523 deletions(-)



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
