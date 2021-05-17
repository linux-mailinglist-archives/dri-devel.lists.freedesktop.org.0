Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C066F3865E3
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 22:10:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259236E2EF;
	Mon, 17 May 2021 20:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598B56E2E6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 20:09:48 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id j12so5407097pgh.7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 13:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Od89iO9K7b3a0mIXVinRw4ty+isZRxmi2wE6XqdNOk=;
 b=TtUzhEsImHEcyrdQGMv96nCuysYgEsi3cNO4UegmgRhdA1F8TACbuVBLqp/QdKqQaf
 UAtp6s4WuAUNwtNHz8bz9UudmLTCHxM6xHX4DvbM/OUI/MRDYHTHfgOj3vROVbiMG17d
 UARJMKUM6A4voepduG2ek9sL/YpvPRkECaI7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Od89iO9K7b3a0mIXVinRw4ty+isZRxmi2wE6XqdNOk=;
 b=N1CRd5IK/5+4UynAJiUZtKDrOVspIvnGQ7sUC8mRd9eCrXqjCJEU9PjAlwEE3S9iu+
 oekqoJ8MPiWs5hfaGST9Y2aijF+1pFAN13SuPcQ/rmydCl1TZdMmzkSS/YPeYbB8sfk7
 O6klA2jIkZm3nkkqXaxD3gHzOfWuWKDIOHRg3HtHJvjszzqRs31kLsTKiSrQpr5zQCTa
 iEd5/UXKuJgr39mFriLCQ0pLMQKun8VxA2aS9cV2hw46/CPRKm1KhDiicJW0yYeVbmIE
 QcAaHTaelfAW9+ylLQ1V/o9NQ+IKwpNYL3KsY30awPV23c0xvVytNingWtgK1ExzL75F
 r89Q==
X-Gm-Message-State: AOAM533hNrSVlK2dB7W076jgQb3jqxA4zXcuXPJTcmhzu45+nRUR6ogR
 6ODI8JfaS0vF2mR/erOumsJITw==
X-Google-Smtp-Source: ABdhPJzM48ZbURkxPit3OBuzXEszo4hQUmrav6Fobpm8X3kMTwn8gRXetNU7W9BoueB/crKw8VmEDg==
X-Received: by 2002:a63:36c1:: with SMTP id d184mr1219542pga.47.1621282188016; 
 Mon, 17 May 2021 13:09:48 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:bc91:c597:ded0:7930])
 by smtp.gmail.com with ESMTPSA id x19sm9078941pgj.66.2021.05.17.13.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 13:09:47 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v7 01/10] drm/panel: panel-simple: Add missing
 pm_runtime_dont_use_autosuspend() calls
Date: Mon, 17 May 2021 13:08:58 -0700
Message-Id: <20210517130450.v7.1.I9e947183e95c9bd067c9c1d51208ac6a96385139@changeid>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210517200907.1459182-1-dianders@chromium.org>
References: <20210517200907.1459182-1-dianders@chromium.org>
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Steev Klimaszewski <steev@kali.org>,
 Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PM Runtime docs specifically call out the need to call
pm_runtime_dont_use_autosuspend() in the remove() callback if
pm_runtime_use_autosuspend() was called in probe():

> Drivers in ->remove() callback should undo the runtime PM changes done
> in ->probe(). Usually this means calling pm_runtime_disable(),
> pm_runtime_dont_use_autosuspend() etc.

We should do this. This fixes a warning splat that I saw when I was
testing out the panel-simple's remove().

Fixes: 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare / prepare")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v7:
- pm_runtime_dont_use_autosuspend() fix new for v7.

 drivers/gpu/drm/panel/panel-simple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9be050ab372f..21939d4352cf 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -798,6 +798,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	return 0;
 
 disable_pm_runtime:
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 free_ddc:
 	if (panel->ddc)
@@ -814,6 +815,7 @@ static int panel_simple_remove(struct device *dev)
 	drm_panel_disable(&panel->base);
 	drm_panel_unprepare(&panel->base);
 
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 	if (panel->ddc)
 		put_device(&panel->ddc->dev);
-- 
2.31.1.751.gd2f1c929bd-goog

