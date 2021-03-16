Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3761E33DFF7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 22:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA5BA6E448;
	Tue, 16 Mar 2021 21:09:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 871196E448
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 21:09:02 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id q5so10796993pgk.5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 14:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h3nGRIVAZ8p8oH1+FLMCV0ztlq3vh7E/c3Mkltgxfig=;
 b=At7nxtTZi0r6E/hJAVN5l/dmCfxqOqkm3CirquJCcbKRpxNEj0UlA5R04342G4ZGjg
 kj2dlf4h7ZIt8YPErpECIjgVtEWlTsoP7vnhaK1z+6SgXoIUci+gdClvaxnPSRnQ6b0X
 qid///YOVCa2O4AGOuVeqknyZaDXXF+sgX+Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h3nGRIVAZ8p8oH1+FLMCV0ztlq3vh7E/c3Mkltgxfig=;
 b=n6lb1T7IKqQdtuXFL3X6RrUFwzCf1GKDc4jXymHAQ5+B3vMbRwqKtjXoJ70ANFCc0o
 xLA3aFgkywDgLD8Wx8SQX9miXP7S+oSJc5ed+nWir6Td+RvtiCpKghmdRoRg4MqbsMBL
 D00AgTQSniBKBnAgaR4e+lAf7Rh7Zuy9r0uGFHfMBJnkL+l2siMTQzq6/6AcI6RH99cW
 YE3k3oZugAB3xZG+JruRFFdg5K6MjMN3LDDBZfGCEEf/4gfzv1BjKOME8H80S+PxAPAQ
 3A4vjio57ii6ZulJlgiBAyNjGsqGMVTmFkGg+upXmdaqmmQcEj7mRoXRiy3GBT7hYE7j
 1U2A==
X-Gm-Message-State: AOAM531muC7ofAGUym8LSFW/n74TuyBNsuYawD7/a0g6N+pYFCVeQh2S
 NWZKDyt0CAiHAXVmGFg00XMLWw==
X-Google-Smtp-Source: ABdhPJx+sDl3T3tfWxKBS3KMgRQuF3wDhkFfazknzXEMfmOKK8tHUBXu5QUQSZhXOidpHjnVGnihHA==
X-Received: by 2002:a63:f311:: with SMTP id l17mr1405391pgh.349.1615928942134; 
 Tue, 16 Mar 2021 14:09:02 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:84d6:7fd1:d469:351f])
 by smtp.gmail.com with ESMTPSA id 192sm17358072pfa.122.2021.03.16.14.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 14:09:01 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [RFC PATCH 2/3] drm/panel: panel-simple: Add the panel on
 sc7180-trogdor-pompom
Date: Tue, 16 Mar 2021 14:08:20 -0700
Message-Id: <20210316140707.RFC.2.Ie81e36b66aadc4afe29eb6ae9126177b811c381e@changeid>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
References: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
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
Cc: robdclark@chromium.org, devicetree@vger.kernel.org, drinkcat@chromium.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, Andy Gross <agross@kernel.org>,
 Steev Klimaszewski <steev@kali.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds an entry to simple panel for the timings of a panel that
might be attached to the board sc7180-trogdor-pompom.

As talked about in the previous patch ("dt-bindings: display: simple:
Add the panel on sc7180-trogdor-pompom") any number of panels might be
attached. These panels might have different timings or even different
resolutions.

When we see a pompom panel we'll use some conservative power sequence
timings that can work with any of the panels that will be
attached. All the rest of the details about the panel can be found by
read its EDID.

NOTE: if we wanted to optimize things a bit we could figure out which
of the panels was actually attached and perhaps reduce some of the
timings by a tiny bit if it was a panel that we recognized. I won't
attempt this right now but it could be a nice future optimization,
epsecially getting rid of the 200 ms "enable delay" imposed by the
Starry panel.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
For overall discussion about the idea of defining a generic panel at
the board level, please respond in the bindings patch so we can keep
all discussion in one place.

 drivers/gpu/drm/panel/panel-simple.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4e2dad314c79..c8964efd562b 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2205,6 +2205,15 @@ static const struct panel_desc hitachi_tx23d38vm0caa = {
 	},
 };
 
+static const struct panel_desc google_pompom_panel = {
+	.delay = {
+		.hpd_absent_delay = 200,
+		.enable = 200,
+		.unprepare = 500,
+	},
+	.connector_type = DRM_MODE_CONNECTOR_eDP,
+};
+
 static const struct drm_display_mode innolux_at043tn24_mode = {
 	.clock = 9000,
 	.hdisplay = 480,
@@ -4265,6 +4274,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "hit,tx23d38vm0caa",
 		.data = &hitachi_tx23d38vm0caa
+	}, {
+		.compatible = "google,pompom-panel",
+		.data = &google_pompom_panel,
 	}, {
 		.compatible = "innolux,at043tn24",
 		.data = &innolux_at043tn24,
-- 
2.31.0.rc2.261.g7f71774620-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
