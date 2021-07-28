Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDA13D9370
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 18:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8266E0EE;
	Wed, 28 Jul 2021 16:46:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D24D6E0EE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 16:46:24 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id f13so3418956plj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3Wf14gG5Rla0NCThAzrC4jotbBpcH9EXwPpxX3uNRjo=;
 b=EtlAYDaEc0TpuNyXhqKi50L3nKK4in1bT8Phheri8gREf7P5NrxJ2A29bcz9tTkNV4
 KMxG0EH+veKm8iIIsYG68Hmklfn+DxuQp9m7Kv3Wqy4kOtalb2dvdpSOmUM0aFyN6p9x
 8aa2qd57b8OCOv02Ru/xKrV2Y1aghXj14dmi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3Wf14gG5Rla0NCThAzrC4jotbBpcH9EXwPpxX3uNRjo=;
 b=T5NsJgBbotoC/ExUXqsOS88csc84I318LeuZqBV4g0zePUXGA+PdR+iCIFY1oibx3c
 q0hJctifxcb+4msy2JHRnR2ygNr1dkz9EHCT10vpqUVuXXpFAJjAuZvFpzN8N/qjObsM
 047IQAQEHxO8qIrqUQ62errrZK0umGQD3AFoz6hjgvcuvPlmt2zidTKpVA4haTqWX8yT
 0c/CSfvl3IRbYbHq8P2WeO5OzmQBIDFspgD/mnR1g3M6wG5UKPWjFtWiNHZsjmUql4tL
 uP/xq0LFkGffxLQD51blIt2e6Ck4PHiOc777l6bNOe+TlIIFcTM7zxh1iqK9jcKdZfuI
 xcRg==
X-Gm-Message-State: AOAM531w8IZDGZWYdrgD3/gfBHQaYGIBbtWbSsiSwXwTJtgohjOVhZUP
 h8rfujnjNxsSe6eAY7UgPeHzluBgf944BYuq
X-Google-Smtp-Source: ABdhPJzfO4KkJpCh98jEoXUePNoIZEGk1qRg4kKFgs4O1HX2oxNwF0DCb/etyqdvMdxChckiCrP56g==
X-Received: by 2002:a65:4382:: with SMTP id m2mr656852pgp.205.1627490784259;
 Wed, 28 Jul 2021 09:46:24 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:9f1e:e713:1a5e:89dc])
 by smtp.gmail.com with ESMTPSA id l12sm474075pff.182.2021.07.28.09.46.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 09:46:23 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm/panel: atna33xc20: Fix the Samsung ATNA33XC20 panel
Date: Wed, 28 Jul 2021 09:45:51 -0700
Message-Id: <20210728164557.1882787-1-dianders@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
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
Cc: narmstrong@baylibre.com, airlied@linux.ie,
 Sandeep Panda <spanda@codeaurora.org>, steev@kali.org,
 bjorn.andersson@linaro.org, a.hajda@samsung.com, thierry.reding@gmail.com,
 Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, jernej.skrabec@gmail.com,
 devicetree@vger.kernel.org, tzimmermann@suse.de, jonas@kwiboo.se,
 linux-arm-msm@vger.kernel.org, rodrigo.vivi@intel.com, rajeevny@codeaurora.org,
 Douglas Anderson <dianders@chromium.org>, robert.foss@linaro.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


The overall goal of this series is to make the Samsung ATNA33XC20
panel work more properly. As part of this, we have:
* A bugfix for the recently abstracted DP AUX backlight code.
* A bugfix for the sequencing of the ti-sn65dsi86 bridge driver.
* Removal of the panel from panel-simple and moving it to its own
  driver.

If the bugfixes look good but the rest of the series needs work then
those could land early on their own. There's no real compile time
dependency on the bugfixes, things are just glitchier without them.

NOTE: this series will (slightly) conflict with my other recent series
making eDP panels probable [1]. The conflict is easy to resolve and
I'm happy to repost either once the other lands. It should be noted
that the fact that the Samsung ATNA33XC20 needs its own panel driver
means that it _can't_ handled as a probed driver. I think this is
fine, at least for now. I don't think it would be easy to make a
unified design with this panel and other panels given that it's an
AMOLED panel and has a whole bunch of different components on board.

[1] https://lore.kernel.org/r/20210723002146.1962910-1-dianders@chromium.org/


Douglas Anderson (6):
  drm/dp: Don't zero PWMGEN_BIT_COUNT when driver_pwm_freq_hz not
    specified
  drm/bridge: ti-sn65dsi86: Fix power off sequence
  drm/bridge: ti-sn65dsi86: Add some 100 us delays
  Revert "drm/panel-simple: Add Samsung ATNA33XC20"
  Revert "drm/panel-simple: Support for delays between GPIO & regulator"
  drm/panel: atna33xc20: Introduce the Samsung ATNA33XC20 panel

 drivers/gpu/drm/bridge/ti-sn65dsi86.c         |  17 +-
 drivers/gpu/drm/drm_dp_helper.c               |  10 +-
 drivers/gpu/drm/panel/Kconfig                 |  12 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-atna33xc20.c  | 366 ++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          |  61 ---
 6 files changed, 398 insertions(+), 69 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c

-- 
2.32.0.432.gabb21c7263-goog

