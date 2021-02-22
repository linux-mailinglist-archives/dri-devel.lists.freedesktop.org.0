Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 111C5321C99
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 17:17:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D806E544;
	Mon, 22 Feb 2021 16:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD26F6E544
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 16:17:50 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id 75so10493572pgf.13
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 08:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UZQ81zn5KjPnayIv7F7//pJHAsLKWR/BMQUUmYbIJXA=;
 b=Dt24BpX1YnqNTOhs8U7CREV4Lwj8nxBU4uXPfqBHHTPVIQFF6zSRkdvkLhOspr4LAI
 YbdJ3riCVg59tdKSVZ9jnsxpX8Q7fnxLlwckZiwMrI6B79ElGHQOqjSBap+koQ5kyS4V
 MCIf4ozDHEckAzJIYfG9nn11cEux0MSu78mUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UZQ81zn5KjPnayIv7F7//pJHAsLKWR/BMQUUmYbIJXA=;
 b=cY4cnXqZDvsKgeIlbPH2k65F4w3ymk3jzMoMepFwG3w2YC106pHpi/5K3Fb7MXWXIv
 6WZly3OQ8TaJf7wsZqHhv2+1LlEvXZhfoWgybpmKVIbBJ1d6Z9lz3BalGdFeezEn1wwK
 mqI/75YtDsIP50LOCDy0tiqxTA6PzoWBJ90/oXtWaO+cRGrADEnCmyE6U+WcP/TE+vBC
 Iu2WesDOaz3q9Bc2FoExRObGoA00rXhH1MEllfDPV+BCtrAyYAgdcVcA39OiHEU/Vu0/
 IF57hwMZFjQx5AcbwUNwB1XsvxTQ+1foIo4FYHg9DjOuRP1VjRE/M4HaEhhKaYylKdXV
 HbLA==
X-Gm-Message-State: AOAM530MiML2mSQjPKSC0ZjzxOwRC+7rkGQOieA8ydMf9s5AY196MzJg
 OPEu8I3OuCF8T2ZwunYF38XuQg==
X-Google-Smtp-Source: ABdhPJyScZsUsiOdGNQAF4qiKt7TO6n7/fuJpM8ctVZsirjyQNhhtutqAA4teSOba+e4apFfpB4uFQ==
X-Received: by 2002:a63:4405:: with SMTP id r5mr20209002pga.168.1614010670456; 
 Mon, 22 Feb 2021 08:17:50 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:fd5d:7c23:34f:c618])
 by smtp.gmail.com with ESMTPSA id v4sm21101036pjc.0.2021.02.22.08.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 08:17:50 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm: panel: simple: Set enable delay for BOE NV110WTM-N61
Date: Mon, 22 Feb 2021 08:17:24 -0800
Message-Id: <20210222081716.1.I1a45aece5d2ac6a2e73bbec50da2086e43e0862b@changeid>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Panel power sequence says timing T8 (time from link idle to turn on
the backlight) should be at least 50 ms.  This is what the .enable
delay in simple-panel is for, so set it.  NOTE: this overlaps with the
80 ms .prepare_to_enable delay on purpose.  The data sheet says that
at least 80 ms needs to pass between HPD going high and turning on the
backlight and that at least 50 ms needs to pass between the link idle
and the backlight going on.  Thus it works like this on the system in
front of me:
* In bridge chip pre_enable call drm_panel_prepare()
* drm_panel_prepare() -> panel_simple_prepare()
* Wait for HPD GPIO to go high.
* Start counting for 80 ms (store in prepared_time)
* In bridge chip enable, train link then call drm_panel_enable()
* drm_panel_enable() -> panel_simple_enable()
* panel_simple_enable() does hardcoded 50 ms delay then enforces 80 ms
  from HPD going high (in case the bridge took less than 30 ms to
  enable / link train).
* drm_panel_enable() -> backlight_enable().

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9858079f9e14..9d36b74357ae 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1445,6 +1445,7 @@ static const struct panel_desc boe_nv110wtm_n61 = {
 	.delay = {
 		.hpd_absent_delay = 200,
 		.prepare_to_enable = 80,
+		.enable = 50,
 		.unprepare = 500,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-- 
2.30.0.617.g56c4b15f3c-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
