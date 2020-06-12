Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CA91F7D9F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 21:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F18786E1AA;
	Fri, 12 Jun 2020 19:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 888416E1AA
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 19:31:01 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id j6so652973pgh.4
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 12:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b/GfnNC8pXVMnpUdumvg6vaJ4jiyTtawkJau7ukqTZo=;
 b=G2IlTYMXhCkQR4ELMO19WmWfDfP34LAIVdX40D7bNRrYfyXYvFKHC7Cdn77RuP82R4
 2ji01psEasSHfT1/aQ/yTtES/Sj6YmBf669RUbjoQtq2VMdbkNQgsRnJr3n07tbZ+BsE
 0QYNW/8dm940Jgz8VVbIfmRORs8S/oDxamvWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b/GfnNC8pXVMnpUdumvg6vaJ4jiyTtawkJau7ukqTZo=;
 b=q9rcqG1CktHALXAewJy7ME6T8RWq8RpcfoTxvBKU3Xgkujje6YnGB48xPxlknxxFUG
 EQziZuheTBic2+YUO01hslALIU0j5FHMQG5+6Fz+/W7DEt+XQJBw8KbmykvxoM9EL7YK
 gXr5p3d19GgTkLY8gcLZ+y4//gX5slfy3A+cLKyw8DylkdvlVI1s4epODfWxUQ/+c5qD
 FDT/uDW7S4On7OGb4hmWLxXNKs23NNeAmZuHdVScNHc2U4sqQTTFQB54Fz3oCAeowU8V
 xZ0AwyaOa33GMX37ei+snfdGrdz2pC/nOHD7plxo87RhbHrITmsIeKmw8gjFXsde5+xU
 YF1g==
X-Gm-Message-State: AOAM533+HrFgQFPIoPdI+04YcZkHi46wLK22eLTorYSgvlzV9l4N8ZHw
 hBTHwPFOOXuHjAxhoRHk0pfCHg==
X-Google-Smtp-Source: ABdhPJyfydS6pnh63FC5FkWpfhhla7sdsI5aEnFHl7FPTKIrMMSQFO2xsBGnY2nj7D6x9bPXeGIkKQ==
X-Received: by 2002:aa7:9052:: with SMTP id n18mr13776479pfo.319.1591990260998; 
 Fri, 12 Jun 2020 12:31:00 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id n69sm6966934pjc.25.2020.06.12.12.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 12:31:00 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: a.hajda@samsung.com,
	narmstrong@baylibre.com,
	sam@ravnborg.org
Subject: [PATCH v2 3/4] drm/bridge: ti-sn65dsi86: Fix kernel-doc typo ln_polr
 => ln_polrs
Date: Fri, 12 Jun 2020 12:30:49 -0700
Message-Id: <20200612123003.v2.3.Ib616e311c48cc64b2cef11bd54d4a9cedc874bb1@changeid>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
In-Reply-To: <20200612123003.v2.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
References: <20200612123003.v2.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
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
 Douglas Anderson <dianders@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 spanda@codeaurora.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, swboyd@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes a kernel doc warning due to a typo:
  warning: Function parameter or member 'ln_polrs' not described in 'ti_sn_bridge'

Fixes: 5bebaeadb30e ("drm/bridge: ti-sn65dsi86: Implement lane reordering + polarity")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v2: None

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index fca7c2a0bcf9..1080e4f9df96 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -122,7 +122,7 @@
  * @supplies:     Data for bulk enabling/disabling our regulators.
  * @dp_lanes:     Count of dp_lanes we're using.
  * @ln_assign:    Value to program to the LN_ASSIGN register.
- * @ln_polr:      Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
+ * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
  *
  * @gchip:        If we expose our GPIOs, this is used.
  * @gchip_output: A cache of whether we've set GPIOs to output.  This
-- 
2.27.0.290.gba653c62da-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
