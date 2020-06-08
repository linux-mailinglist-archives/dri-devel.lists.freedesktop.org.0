Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE4A1F1E7F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 19:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DE326E991;
	Mon,  8 Jun 2020 17:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2166F6E990
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 17:48:59 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id a45so171232pje.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 10:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8YyCBCbGrw0DIZ0MXUQK0lVQu61p/lQcR9/ys0P7l8=;
 b=crI+dMdfSYQau9vc9/yyK65ynELRvAs6mgoiidknTuRcDF9lKldNHf6Un61KThO6LE
 aBqIOsMppcw3sgF5IxZmYi6Vi+hGCW50d4PqH5aPGGzmglwhzfJxe0d+KFX5WCCsMNDx
 ofzFeFKmOIFr+i5FdRP+j44Jqmp71NbWE+Hv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o8YyCBCbGrw0DIZ0MXUQK0lVQu61p/lQcR9/ys0P7l8=;
 b=CRS4BYCNYtbRGQ9bBJRzoRkANMaga3xeYaQaUtTXvFyjPgG2nJlnTnG95H1xUR9aat
 M2p4RL+IHGSAz1NpNP9Y2oVvx0vs86ZZQuq26ad0pDgwVk5qrdX/F13DieYbNLWdPv2f
 nOKGbxdsmiAzH8sx9HwJubJRJQh/WoLAmlI/TtZnahPO5jXAmcRb8yx0wfEzAasV/s12
 Y28nQG35h1Nmn/U0+7wDhbqMJGhFgSrKgsT4Ssy5iLfQmhWka1XdzGOJdVqj8czKVGBY
 IdtRhK7EP6JSscjhCrBPCFTHKMFRjyWJzilH/rAI5gsvzT2S3qt8jjW8J08SRcYCi8GO
 vI1Q==
X-Gm-Message-State: AOAM533hMXa7A5uCy0Z3YIrEITn1s1Tei2/R3RYAN45oW6r2JtRJ6bJq
 Utw1JSIaNor6P266XdWoTCmTzQ==
X-Google-Smtp-Source: ABdhPJxDBcpzVSyypXwZzUR9uGeArOBaGnIrUgjorP9jdXDSPFLOIaEjQmAkCG5ko8oaACbKDzq5+Q==
X-Received: by 2002:a17:90b:915:: with SMTP id
 bo21mr469617pjb.52.1591638538722; 
 Mon, 08 Jun 2020 10:48:58 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id n7sm162682pjq.22.2020.06.08.10.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 10:48:58 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: a.hajda@samsung.com,
	narmstrong@baylibre.com,
	sam@ravnborg.org
Subject: [PATCH 3/4] drm/bridge: ti-sn65dsi86: Fix kernel-doc typo ln_polr =>
 ln_polrs
Date: Mon,  8 Jun 2020 10:48:34 -0700
Message-Id: <20200608104832.3.Ib616e311c48cc64b2cef11bd54d4a9cedc874bb1@changeid>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200608104832.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
References: <20200608104832.1.Ibe95d8f3daef01e5c57d4c8c398f04d6a839492c@changeid>
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
 spanda@codeaurora.org, dri-devel@lists.freedesktop.org, swboyd@chromium.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 bjorn.andersson@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes a kernel doc warning due to a typo:
  warning: Function parameter or member 'ln_polrs' not described in 'ti_sn_bridge'

Fixes: 5bebaeadb30e ("drm/bridge: ti-sn65dsi86: Implement lane reordering + polarity")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

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
2.27.0.278.ge193c7cf3a9-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
