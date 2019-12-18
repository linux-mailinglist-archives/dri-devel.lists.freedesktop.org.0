Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A385F1256D8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 23:36:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845F46EA8E;
	Wed, 18 Dec 2019 22:35:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E92F6EA8E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 22:35:58 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id s7so1550540pjc.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 14:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ac+GRDMFPcxFMKgFQ0+PN5ep2CIAGQOVje6d76UBFmU=;
 b=bJT2Wk+hjANwW4eZsDvl3YCIgdw/UuJFo8So+f9iGdvMWtC/AP2mu4QAeyNQg7MIMV
 NGhDP8H44Vst4zK5cQkKxqoMD36i7D+cxsnYr44KppfZLgtBfFTjveKVD8T8XjE7qsiS
 hBysUPQrLSAIjCwADAfprx/LC4F6GhQIFQkEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ac+GRDMFPcxFMKgFQ0+PN5ep2CIAGQOVje6d76UBFmU=;
 b=AiQdV6vZKOfOwPEt7PM9PSmH3qtk4sUzPsYY7oUiHFx5tcI/Nyzllg9G8xK/18M6Dk
 6YWEYtnQs7Rsdx8LNAQlEbheoTF/wYANCUYAl5clMaa/ch3xcxAuufdvV63ggnp8IRai
 oNRHj4AycZxwIDD+oCt4WaruDAmNaQs9vZMA0b1TbAI/IqTwzdPqmDgXu23n65JAcRUF
 dYXPGxPWrzrJMqoaJLvhxaIqd12MTCQ8muSl3mWxv3B8NlB//5Bq5zchAdE8QfOZFlgh
 HbUvYAdMOQeRC5GcD+TI6VFrVD0Ja9/stlDbG0aV+YhgSXWDuTclEjD4g79TAEuHxvjR
 tKwA==
X-Gm-Message-State: APjAAAUx67Co16tlkRkADG7B3uUNkjSoBlFsceKz7iS6ST+2UmNK+5XJ
 kavsvPYGY8SbUVTjkc+IpkSIEg==
X-Google-Smtp-Source: APXvYqx57BZ+CNHb/hjEGlMO3rpcPAYYWODK4qahli7hCHRhAdX55bWmLvl5Xm6VZGLGAG7faFuJjw==
X-Received: by 2002:a17:902:d881:: with SMTP id
 b1mr5720489plz.29.1576708557854; 
 Wed, 18 Dec 2019 14:35:57 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i9sm4709919pfk.24.2019.12.18.14.35.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 14:35:57 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v3 0/9] drm/bridge: ti-sn65dsi86: Improve support for AUO
 B116XAK01 + other DP
Date: Wed, 18 Dec 2019 14:35:21 -0800
Message-Id: <20191218223530.253106-1-dianders@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, seanpaul@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series contains a pile of patches that was created to support
hooking up the AUO B116XAK01 panel to the eDP side of the bridge.  In
general it should be useful for hooking up a wider variety of DP
panels to the bridge, especially those with lower resolution and lower
bits per pixel.

The overall result of this series:
* Allows panels with fewer than 4 DP lanes hooked up to work.
* Optimizes the link rate for panels with 6 bpp.
* Supports trying more than one link rate when training if the main
  link rate didn't work.
* Avoids invalid link rates.

It's not expected that this series will break any existing users but
testing is always good.

To support the AUO B116XAK01, we could actually stop at the ("Use
18-bit DP if we can") patch since that causes the panel to run at a
link rate of 1.62 which works.  The patches to try more than one link
rate were all developed prior to realizing that I could just use
18-bit mode and were validated with that patch reverted.

These patches were tested on sdm845-cheza atop mainline as of
2019-12-13 and also on another board (the one with AUO B116XAK01) atop
a downstream kernel tree.

This patch series doesn't do anything to optimize the MIPI link and
only focuses on the DP link.  For instance, it's left as an exercise
to the reader to see if we can use the 666-packed mode on the MIPI
link and save some power (because we could lower the clock rate).

I am nowhere near a display expert and my knowledge of DP and MIPI is
pretty much zero.  If something about this patch series smells wrong,
it probably is.  Please let know and I'll try to fix it.

Changes in v3:
- Init rate_valid table, don't rely on stack being 0 (oops).
- Rename rate_times_200khz to rate_per_200khz.
- Loop over the ti_sn_bridge_dp_rate_lut table, making code smaller.
- Use 'true' instead of 1 for bools.
- Added note to commit message noting DP 1.4+ isn't well tested.

Changes in v2:
- Squash in maybe-uninitialized fix from Rob Clark.
- Patch ("Avoid invalid rates") replaces ("Skip non-standard DP rates")

Douglas Anderson (9):
  drm/bridge: ti-sn65dsi86: Split the setting of the dp and dsi rates
  drm/bridge: ti-sn65dsi86: zero is never greater than an unsigned int
  drm/bridge: ti-sn65dsi86: Don't use MIPI variables for DP link
  drm/bridge: ti-sn65dsi86: Config number of DP lanes Mo' Betta
  drm/bridge: ti-sn65dsi86: Read num lanes from the DP sink
  drm/bridge: ti-sn65dsi86: Use 18-bit DP if we can
  drm/bridge: ti-sn65dsi86: Group DP link training bits in a function
  drm/bridge: ti-sn65dsi86: Train at faster rates if slower ones fail
  drm/bridge: ti-sn65dsi86: Avoid invalid rates

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 259 +++++++++++++++++++++-----
 1 file changed, 216 insertions(+), 43 deletions(-)

-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
