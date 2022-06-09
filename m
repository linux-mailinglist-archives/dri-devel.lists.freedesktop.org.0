Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5239F54415E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 04:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 351D511AF93;
	Thu,  9 Jun 2022 02:22:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744EE11AF93
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 02:22:31 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 gc3-20020a17090b310300b001e33092c737so19884649pjb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 19:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=nlEuBg8v8joAJ3nTxPPVFu0RND3GlqjDdGfi1BUzhm0=;
 b=LJmcIVVXNarxPUfq0rfH//BBnhbaZH2jWI5amnGOcwkJlP1CDETkYnGDqkPXyT/in6
 2R20GDuhfi8Mvdwzz/hVIxd+d5XD7TGO6dj8Y1h9E+BM12XA8MrixiYcQqXnpNcTUd2C
 FWU3Lqh+X+AVFPQbIWm3ZjXreXQSeYJ3RIEMusGp+vnyzWUGKsceywjN41TQVOpR/SUl
 6bjLPZBCbRPwf1r16aRxZIom5ou8bPWuS6EhOjjf3nSC4O5GYNkITndO3zrplEs8Ls6E
 6JDT2CHliZ3u9Icgoun8uP2dXicUoVK2+kqynUrP60LjwCFUc/LmZknTkv0kkAAwEPCA
 u6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=nlEuBg8v8joAJ3nTxPPVFu0RND3GlqjDdGfi1BUzhm0=;
 b=3n9Zmi1/b5P8ZqTFiTOsdIVHwDoufzarQ7eqSRajoSptKLf/uM+oLe7lCBQeYDf0VE
 mEzd5btD+CrPMLypbNjSp6/LgB4jhpW1eCnXU0H/yFiKQTdwMwxJSw9kATw1MfS3sIgE
 6o8HfrVo9oXG9jM3Vwd5+FDw0CI0RDyBjfarz6h7YpirKm6FrZyay3O9W/svdUYGOFzG
 Ic2A8qQmwGtlCoh5BmD+aVD2N5lMbA5fqKZ3x5mZ97tK3uaBISDYmLvRGwK6TRmWV6Hd
 SKcci7o91ZDpyXURehqfXZ9N4T+mMflS/mQsRfEE6Xz/rhlKC46DweATmpt2pxUha6r0
 j34Q==
X-Gm-Message-State: AOAM533ha6pqTP3io0g4v+UHOnCRoyO+0FEggiscLK/j0kwTHctRFi9v
 YAsjsA0cD5PhfqbtWcqBpgE=
X-Google-Smtp-Source: ABdhPJw00++Rt/yaahJuwvadiTVVY1cXYdUGG5axxtj0mdJqipLC/NYfxJoE1poR3gWa5OtWiVnM0w==
X-Received: by 2002:a17:90b:4c8f:b0:1e6:9bf9:1ab8 with SMTP id
 my15-20020a17090b4c8f00b001e69bf91ab8mr986765pjb.215.1654741350991; 
 Wed, 08 Jun 2022 19:22:30 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:478:d041:804b:4db9:72:b011])
 by smtp.gmail.com with ESMTPSA id
 y22-20020aa78056000000b005183f333721sm15748770pfm.87.2022.06.08.19.22.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jun 2022 19:22:28 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: [PATCH v3 0/2] Add the property to make backlight OCP level selectable
Date: Thu,  9 Jun 2022 10:22:17 +0800
Message-Id: <1654741339-12756-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 lucas_tsai@richtek.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

This patch series is to add the backlight ocp level property parsing.

Since  v3
- Refine the description for backlight ocp property.
- Use the enum to list the supported value.

Since v2
- change the property name from the register style 'richtek,bled-ocp-cel' to
  'richtek,bled-ocp-microamp'.
- Use the clamp and roundup to get the ovp level selector.

ChiYuan Huang (2):
  dt-bindings: backlight: rt4831: Add the new ocp level property
  backlight: rt4831: Apply ocp level from devicetree

 .../leds/backlight/richtek,rt4831-backlight.yaml   |  5 ++++
 drivers/video/backlight/rt4831-backlight.c         | 33 +++++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.7.4

