Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B4C7FAE2F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 00:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C2910E0BF;
	Mon, 27 Nov 2023 23:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D566B10E0BF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 23:10:26 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50aab3bf71fso6594478e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 15:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701126625; x=1701731425; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aArr4Zo3fOK6qHGsqiAv8zLE+MevB0/MPL6lNLgo6oI=;
 b=fQBTyWiXJ+uAbgMKMcqAlViSljsnRxbe0yA5eho2/QMIG6A32Za/OD4B4kePH4Sj4W
 pfJZxaTqF1fx29UNciQaU2i+tdElMp1Mrwj4eMQV+/sHp40KdOQQUH45qyP2GQqAtELW
 Ze2WeG2Y2rrtaTxaf8lUsNjcT7KZ9OSX+mP+trWJyr3RQCdWfy4ddYm9zCV4E8TUNkka
 r/WqI1DR12fvyqnThmv0F/Q/M/QQQLhvw2b5XjOr/8C0Y9a7bjwnIN9Dhc7ktZ80YLR8
 BrbtZNsLNR0n7WIaD9bDyHSvHpzA6cq5dpfK8jeLBoqnTZVp5XYi9s/YRwT8Sz5vCz5s
 w6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701126625; x=1701731425;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aArr4Zo3fOK6qHGsqiAv8zLE+MevB0/MPL6lNLgo6oI=;
 b=HI44H2s/I27VKI4x+Ne0F1KrrlxmzHRrQ7MuVov3h613z8AYJlvZbfEMs2rx7cYiJu
 tS9Iy5tozTX+g3y+FVZH+x4Ou6ElQNBinjeHqzVypf9GoNh6Z+/6ixeJUYVnGr8lKgzc
 8dLUNqrlJCJ8w0Ebpds1EwQg3UoDX0Z3X+aKL2LGvHCEF1T0IyflvCUlYj7rFDJ3rB3k
 /uDIWvaZhOQzr166st8KTeQh/pqQNP1eJFp3Wl6Tmb7EAgZenA9Q7S9FkbtLRsKaXUzr
 QbpwiNlxAz/OiYX78D9S2c6oA5TLqi8VwbfADV6w1jFx5u1PQuGAqRrqwiykDg0ofwj9
 UKpg==
X-Gm-Message-State: AOJu0YxXA2b2+urZBg+hOnEUPjjbXIXEnsqj6PYnbQY/9knpthvrCEFq
 G/SiGY6j5Cbfv5g2kDsSrf/i0A==
X-Google-Smtp-Source: AGHT+IFqxRcjotsq5abR+BpqaRX3hSy8XtvlvzV0lyt0zCqUjqDI89ngohYQ1hokiAeePaglzUK7CQ==
X-Received: by 2002:a05:6512:3d9e:b0:50b:aa9a:903b with SMTP id
 k30-20020a0565123d9e00b0050baa9a903bmr6515322lfv.30.1701126624836; 
 Mon, 27 Nov 2023 15:10:24 -0800 (PST)
Received: from [192.168.1.2] (c-21d3225c.014-348-6c756e10.bbcust.telenor.se.
 [92.34.211.33]) by smtp.gmail.com with ESMTPSA id
 cf17-20020a056512281100b0050aa94e6d15sm1636877lfb.9.2023.11.27.15.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Nov 2023 15:10:24 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/3] Revert panel fixes and original buggy patch
Date: Tue, 28 Nov 2023 00:10:18 +0100
Message-Id: <20231128-revert-panel-fix-v1-0-69bb05048dae@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANohZWUC/x2MQQqAMAwEv1JyNmCqIPgV8VB01YBUaUUE6d8NH
 meZnZcykiJT715KuDXrEQ2kcjRtIa5gnY3J174R8R2bhHTxGSJ2XvRhtHNoIIIutGS3M8HmPzm
 MpXy4o/4IYgAAAA==
To: Liu Ying <victor.liu@nxp.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.4
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series reverts the attempts to fix the bug that went
into v6.7-rc1 in commit 199cf07ebd2b
"drm/bridge: panel: Add a device link between drm device and panel device"
and then it reverts that patch as well.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (3):
      Revert "driver core: Export device_is_dependent() to modules"
      Revert "drm/bridge: panel: Check device dependency before managing device link"
      Revert "drm/bridge: panel: Add a device link between drm device and panel device"

 drivers/base/core.c            |  1 -
 drivers/gpu/drm/bridge/panel.c | 26 --------------------------
 2 files changed, 27 deletions(-)
---
base-commit: 95ba893c9f4feb836ddce627efd0bb6af6667031
change-id: 20231127-revert-panel-fix-e4da3e11e7a4

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

