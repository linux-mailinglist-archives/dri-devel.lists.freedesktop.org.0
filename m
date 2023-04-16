Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E40F6E40B2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AD510E39A;
	Mon, 17 Apr 2023 07:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2056910E31B
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 10:01:45 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id vc20so1816029ejc.10
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681639303; x=1684231303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pJigTOMieV88JCMUkFyYL25oiCUdnIAzYt3+b/d9iJU=;
 b=CK+FzezMiv2xY54n49RI1Hh4a3V/IpVGr9cPTGzt18vBdOWGwcYOMrDdyg+B7Npa83
 AHRLzfW0xHpgvt2GiDppjcWV/MIV6ZF+06gB5DBwIBUOflB9GzUyo1K8RjQjuyExyoY7
 qDVg4cBav/ryzXyQJAbh5OcUsmK/LtnWjewIgpnelQElavMAf/GdXyZChHVph3AhHaTH
 JQuJiXwljacmVOBtaPHxcvsKiOuYRII4BCh0Ex72Pvv/v1s6k2ASIb+oyZi6RlQL2m9N
 xM0CBaIH6jeYkXDIXuJcIMLxUC96ifyF/iWnO+eZTy30iJr1VB4ul3Jj5MHehbzSUcNE
 us/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681639303; x=1684231303;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pJigTOMieV88JCMUkFyYL25oiCUdnIAzYt3+b/d9iJU=;
 b=WjV/8Nn7NbBggyThiM0quhGxaVWyexXsN9+jJtEG3ORExnVzsgqCY83UVsRGIIJiOC
 T+fiIJe45j5q7Y9u/Z8o6FZnoOsxahVUlYCyCu/gYGrl0D2v4ehPGVOVejEWAOQBE9to
 bPLL1PM0jTFi7Z7HvBnSUeLmuAaEasWrJsPpcTeoXil71X0Rd+huIT3mCk0zeKVqlIqJ
 6Lwl06gAmVOhqTlCQt4K/1jgadLT/5PiQf9JorDLXTyjPkxu4ncEkDHlTQ9N1L+OxTJ1
 YFsebHuq9nYRFb7vrKdQ3YBKMI9cK2XUoc99g2Z/r33EQQ2Vo5U8+lkdyUlRxJv2Z2GU
 FFIQ==
X-Gm-Message-State: AAQBX9fAP7QTllXMjSLPziC4nUKOpO+GJkCpydHe4kLOH5S1O4qOhCJY
 DoCxzK1l+lpF3/U100GwoCG09MqyTPs=
X-Google-Smtp-Source: AKy350blmIQqNb6VOqWPaRs8N1vcRDsMO1c+ca9Bz5vL8d20BlI7qVirihpC9PAbKpIxDgnp2nSTsQ==
X-Received: by 2002:a17:906:7013:b0:94e:d3e8:ec3e with SMTP id
 n19-20020a170906701300b0094ed3e8ec3emr3770036ejj.46.1681639303270; 
 Sun, 16 Apr 2023 03:01:43 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl.
 [83.8.121.70]) by smtp.gmail.com with ESMTPSA id
 lh22-20020a170906f8d600b0094f6bf5ac9asm145232ejb.22.2023.04.16.03.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 03:01:42 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH 0/3] Add Samsung S6D7AA0 panel controller driver
Date: Sun, 16 Apr 2023 12:01:36 +0200
Message-Id: <20230416100139.13741-1-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Apr 2023 07:21:51 +0000
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, krzysztof.kozlowski+dt@linaro.org,
 Artur Weber <aweber.kernel@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset adds initial support for Samsung S6D7AA0-based panels.
Currently, only the S6D7AA0-LSL080AL02 panel used in the Samsung
Galaxy Tab 3 8.0 family of tablets is supported; other panels can be
added in the future.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Artur Weber (3):
  dt-bindings: panel: Add Samsung S6D7AA0 LCD controller bindings
  drm/panel: Add Samsung S6D7AA0 panel controller driver
  MAINTAINERS: Add myself as Samsung S6D7AA0 panel driver maintainer

 .../display/panel/samsung,s6d7aa0.yaml        |  51 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/panel/Kconfig                 |   7 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 397 ++++++++++++++++++
 5 files changed, 462 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c

-- 
2.40.0

