Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1382476ECE7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 16:42:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6586F10E1FC;
	Thu,  3 Aug 2023 14:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x44a.google.com (mail-wr1-x44a.google.com
 [IPv6:2a00:1450:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC9110E1FC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 14:42:31 +0000 (UTC)
Received: by mail-wr1-x44a.google.com with SMTP id
 ffacd0b85a97d-30e3ee8a42eso538344f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Aug 2023 07:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691073750; x=1691678550;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0ejXtVjO9uaTmaPpKPCMPrm2Yr8xE8g5nBELmFhSIvc=;
 b=eclzpD56PAvuFmNsITeQ3TfHQrMtVUwZTr94wlpz582WaX1/EGrXcEoUcROygX07ZA
 MoXJNvUp1vUJpQPhTufbiLoa6dCNqMGR+1ghn7bq0gJW+AIkr3ByMXAlRcH0OCPdL+UD
 4DCg9aUolAXKTpm5MqQhQvIXzhR/JeXGIopYb8FnLXzrBS/0iQTAvA806Fxpcycphnrv
 P2KYfsCzqpRx4i+ykt7RuQvrbsA/dAXtSpe/nrqmvPNG1oHmjpRg1yeNAjwbCZDhvvEm
 pVzneh4RP1j7mUIctLjMDIK/3ANqW5aBn8LPm7tnsPG7wOgxQ+exofEebAa6eaiknLT4
 KnLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691073750; x=1691678550;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0ejXtVjO9uaTmaPpKPCMPrm2Yr8xE8g5nBELmFhSIvc=;
 b=boqP5qkDJJkkk/A26FS/YJ42bokJctM9IlUTBx1vPudpaPRABDQ7ohXeN+n2elDHrA
 Vasnw5OLIGqviJXKQikAQsU/syhempmrBMXPMEXxtlBd83ZDmRFMe962ES9XDFumn/ct
 +a48VMIeTTRu/NQMfgonu9BGitKwPkJ5/SzjSXB+F4IixF9nhYokOM8G6+3f3ZNWF6oS
 mDdz1kTCrGEa3WjdNNgJSE0YhhruNQpe5cfeo1yrLpuHRp/Lfxorc/9z7FcKwkhlJ5wH
 gzTHonkLkAqbbxTtAr1LIY0RXgNTgNqUiiLAxyNpZzVz3+DUiN0aEczY6YA0RlNaRWuB
 U1Ww==
X-Gm-Message-State: ABy/qLa81FbvoSYNej9rFHt03qBD+al6ZfRXbtwqCmdlJttatCJm4n6O
 UqBG0577JshnXbsuToMzf+bi2LwhDfs=
X-Google-Smtp-Source: APBJJlHoRP9t97M7xyqZGKQN0/CPF7nCzoPK8aCSenB+Cx/LKVYYj2MS/G6vKOM7eOcGqD5bDkjkz9P1bO8=
X-Received: from nogikhp920.muc.corp.google.com
 ([2a00:79e0:9c:201:2d82:fa1b:ad60:64b])
 (user=nogikh job=sendgmr) by 2002:adf:f6c8:0:b0:314:182c:1a2b with SMTP id
 y8-20020adff6c8000000b00314182c1a2bmr50766wrp.4.1691073750119; Thu, 03 Aug
 2023 07:42:30 -0700 (PDT)
Date: Thu,  3 Aug 2023 16:42:27 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
Message-ID: <20230803144227.2187749-1-nogikh@google.com>
Subject: drivers/gpu/drm/bridge/samsung-dsim.c link error
From: Aleksandr Nogikh <nogikh@google.com>
To: aford173@gmail.com, l.stach@pengutronix.de, inki.dae@samsung.com, 
 jagan@amarulasolutions.com, m.szyprowski@samsung.com, airlied@gmail.com, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: syzkaller@googlegroups.com, dvyukov@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

We've been seing the following linker error on arm64 syzbot instances:

ld.lld: error: undefined symbol: phy_mipi_dphy_get_default_config_for_hsclk
>>> referenced by samsung-dsim.c:731 (drivers/gpu/drm/bridge/samsung-dsim.c:731)
>>>               drivers/gpu/drm/bridge/samsung-dsim.o:(samsung_dsim_init) in archive vmlinux.a

Steps to reproduce on the latest linux-next:

$ git checkout next-20230803
$ wget -O '.config' 'https://raw.githubusercontent.com/google/syzkaller/master/dashboard/config/linux/upstream-arm64-kasan.config'
$ make CC=clang ARCH=arm64 LD=ld.lld CROSS_COMPILE=aarch64-linux-gnu- olddefconfig

This also prints:

WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY
  Depends on [n]: GENERIC_PHY [=n]
  Selected by [y]:
  - DRM_NWL_MIPI_DSI [=y] && DRM_BRIDGE [=y] && DRM [=y] && COMMON_CLK [=y] && OF [=y] && HAS_IOMEM [=y]
  - DRM_SAMSUNG_DSIM [=y] && DRM [=y] && DRM_BRIDGE [=y] && COMMON_CLK [=y] && OF [=y] && HAS_IOMEM [=y]

$ make CC=clang ARCH=arm64 LD=ld.lld CROSS_COMPILE=aarch64-linux-gnu- -j$(nproc)

The kernel should have still compiled fine even despite the message above, right?

Could you please take a look?

-- 
Thank you!
Aleksandr
