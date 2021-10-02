Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A3241FEAD
	for <lists+dri-devel@lfdr.de>; Sun,  3 Oct 2021 01:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DE86E047;
	Sat,  2 Oct 2021 23:35:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F936E047
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Oct 2021 23:35:47 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 t16-20020a1c7710000000b003049690d882so14634094wmi.5
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Oct 2021 16:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vJLRmXvXpDieM9p4IfNVMQWSXUi92X3nPkKdYWz2iRk=;
 b=dqFnPfjdfHWAMnleVoj0KScKX7p6/vhlBE0vXQN+6NwMhtmaEv42mDcebtV3Ndu/S3
 9pPGZ6WfSTA2JPmzncn9GHuxu6Yz2bq28ZlAWZrWo43lQx9GBGjrpE3crdMAqa/zu44P
 1S/JGe18EUfEY5fMzJOeX2Qpfs2ylzPOOJ74x4zogblZcp6GBKDrikJHNSDum9nqnROC
 HMV6dsBbMZ04RN445ChK04TwuAs0squOIhJxHRnuW95EIQ4VYdZS1vLm4jWFLaAWqluW
 8evW1OWhU6fm0sAQVvx//7a47psS/mPs4C2di/N1fcz8Wi+MMSIBQYFJlQv5rLxYMCA8
 JwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vJLRmXvXpDieM9p4IfNVMQWSXUi92X3nPkKdYWz2iRk=;
 b=rDkfezGio2/pOQ0zdDj6PjoRJTgphoDKAynjO7w6e886ENqc/1dHhoDqxynIRulA/z
 bcaDLfkePNLdLwjHAPLMrumgi5LcLEFtxeIq7cefuupORIzMQ8SGkBlVA7O3L3ruT/0w
 ZCqZXUkg2u3E2MXsqtHjL3KZLea29hxBqheFbUdQdsXCJqTav5iEbcBnbX7ljlIWubAb
 VnjWRPrqO0Z26ccX5xGT6zMaYK1S/JrO+F1MstJkzwophyZtGEstg2RY7Wz4qttTTqEW
 qsWmeHB7YrFfX8sRnLRJNWCvQBOE7+FcRkUa6zLdf37n5u3S04yvobbO8EM9UpPsV/S9
 esJA==
X-Gm-Message-State: AOAM533BfSoJu/IU8QKzQnPc43l/fNFRmJ7yBbG6vBRSI3llZMn5JRBM
 MaxoLH0hUT2gG2QpGH6OVfU=
X-Google-Smtp-Source: ABdhPJxqno/bpAL3KvAxFuikauLNUkQ2rUI2693qHcvKv693EkSXRaxLRuM/BKXaUwl+PCc9NCxDgQ==
X-Received: by 2002:a7b:c0da:: with SMTP id s26mr11144158wmh.58.1633217746229; 
 Sat, 02 Oct 2021 16:35:46 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru.
 [94.29.54.195])
 by smtp.gmail.com with ESMTPSA id r2sm10487089wmq.28.2021.10.02.16.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 16:35:45 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>,
 Andreas Westman Dorcsak <hedmoo@yahoo.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] Improvements for TC358768 DSI bridge driver
Date: Sun,  3 Oct 2021 02:34:42 +0300
Message-Id: <20211002233447.1105-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds couple improvements to the TC358768 DSI bridge driver,
enabling Panasonic VVX10F004B00 DSI panel support. This panel is used by
ASUS Transformer TF700T tablet, which is ready for upstream kernel and
display panel support is the biggest missing part.

Dmitry Osipenko (5):
  drm/bridge: tc358768: Enable reference clock
  drm/bridge: tc358768: Support pulse mode
  drm/bridge: tc358768: Calculate video start delay
  drm/bridge: tc358768: Disable non-continuous clock mode
  drm/bridge: tc358768: Correct BTACNTRL1 programming

 drivers/gpu/drm/bridge/tc358768.c | 94 +++++++++++++++++++++++--------
 1 file changed, 71 insertions(+), 23 deletions(-)

-- 
2.32.0

