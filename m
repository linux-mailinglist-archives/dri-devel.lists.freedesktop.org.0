Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 679BF6E40A7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:22:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DCD10E394;
	Mon, 17 Apr 2023 07:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0729910E0F3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 13:08:06 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id fw30so4574566ejc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 06:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681650485; x=1684242485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+KDQHaLJ8qvbp2xFnk+s991bcH9UQHReavTLwQ6GCys=;
 b=PvSQWosWKH48ypxeTXgJCmKox+JHvvMf+LZk6SevC4ngYReeufXYTIHNGMUZfZfSjr
 auurTl1TGZl7LPIONks3oRy9SCzKZSV38dN/tphwpUTulfDlKv9yZhVRoR8KPvUcwqtT
 Tq/MkPVG//+ns5l/E3/mb269L/qf5DOgHCKzmWutsP9D4Z8Y5L1mm0sXryzFMmBWQ1dl
 /ifXmvQR5bw02PuCviKJyn4jZmpZsATmbZP34vwmIehJFu/IReMpCClzc1L9LWP8I36Q
 Qe9GEFok/kLF18v+wLtA2+dGQaIOHzaU1dfwBqmRG9h/GnGeXQrDqShn6R0qukTRyxU3
 oZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681650485; x=1684242485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+KDQHaLJ8qvbp2xFnk+s991bcH9UQHReavTLwQ6GCys=;
 b=Sw6TwKUYEbT0VTykdehMKNcrdpY/yIYizj8zL0rssKNppcTasXJxQDYtWSdcG219F1
 Iv3b9PxRSyNxCyL/i0fetK15M8y3Pf1EpbofCsTeFG48/edgetLD9+yZ81Ct5qjFu/DQ
 Uy7BF4NTTzJZnTBSC1hLM5eBy4V88fkNZbhkFyK8pssgxyVIOxmqN1XAWJTdrL1lMZKA
 NZgfINuCdDeCnRxHqQGzJuFrvprKvUbd/dTH0f7hmwuG7dx0ewXw65sCplBKo+tjB3sW
 4Esg8FjlTFX64ySR1fv9rVl+QPIekqjNnQo60wOPpepmbQFbVz3u5AxqgNVQWaHIf1ZC
 caVw==
X-Gm-Message-State: AAQBX9f3nkLJles4Ee4PH2JuP/nD+AR7AsZ/xjVnb2WTgNMvE57Yr9B8
 mRlSe3MGNo1H987zNleByYM=
X-Google-Smtp-Source: AKy350aKX3vg6Kp0KkHCRmesMo5qpwWn9CeQ7h6ufV0GJX8sTcxsE6O60TgF+JbUMsYUlqOtfRwDZA==
X-Received: by 2002:a17:906:2412:b0:93e:908d:cfe2 with SMTP id
 z18-20020a170906241200b0093e908dcfe2mr5314054eja.0.1681650484403; 
 Sun, 16 Apr 2023 06:08:04 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl.
 [83.8.121.70]) by smtp.gmail.com with ESMTPSA id
 l12-20020a056402344c00b00504803f4071sm4511609edc.44.2023.04.16.06.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 06:08:03 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH v2 0/3] Add Samsung S6D7AA0 panel controller driver
Date: Sun, 16 Apr 2023 15:07:32 +0200
Message-Id: <20230416130735.30965-1-aweber.kernel@gmail.com>
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

Changed in v2:
 - Added commit messages for dt-bindings and MAINTAINERS entry commits
 - dt-bindings: Applied suggestions from Krzysztof Kozlowski
 - driver: Removed unused panel_name property from desc struct

Artur Weber (3):
  dt-bindings: panel: Add Samsung S6D7AA0 LCD controller bindings
  drm/panel: Add Samsung S6D7AA0 panel controller driver
  MAINTAINERS: Add entry for Samsung S6D7AA0 LCD panel controller driver

 .../display/panel/samsung,s6d7aa0.yaml        |  51 +++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/panel/Kconfig                 |   7 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 395 ++++++++++++++++++
 5 files changed, 460 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c

-- 
2.40.0

