Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E896A1F7D9B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 21:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577576E1A3;
	Fri, 12 Jun 2020 19:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEB56E193
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 19:31:00 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id s88so4261028pjb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 12:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H4xJr5jHCVeAEcRLOFPcb5oZvkfyMNzLWQX/m/ptM6s=;
 b=X6YqLiCqFgiZc0NhYCB30C7wLDMPbYQ1KFjBFPpBQ0r5OO/xXc4YZgE7MHqjKarp0U
 N7IeiQ6yhOUF/eWk1pWxJP+Ntzl8V3b4Z0XSxXCfNy9nHAWpTzEmPeCuvx+Eb8c077Cn
 0kRaRMRetUI5j6Lk5LSttJVz2vl8Qr+gmey2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H4xJr5jHCVeAEcRLOFPcb5oZvkfyMNzLWQX/m/ptM6s=;
 b=ZUjpRfZIFfZ77N34NgPY4aHC8WiMCB2LvmBQ4tNA808l5z0zqlTj5UhXEliS5v8SbE
 sjjgMuZSA4kehZJNrCjDPKwPIUmgfkgijMo0ADAYRtEe6xsqZ2/JOZlDnKNgq5nP0d8S
 f49AjkaBw5jNurAZIdLrfgzRrpocQijzc8xE/ks3ACzUwx1zV42/30VHy8GfAZ9WYdhc
 PoVpXvozPtRms6JReyUxcxR5QTd+RPLkr2aMHkvWZi980D7BgagaPZqWk48QqnbxpCyL
 jLBY+v0yLumv8brWF1Pic1tJjzGBERJEVinvvPvTOzk79bgZE2JTqWm5x9VRgDAowfJf
 Cxuw==
X-Gm-Message-State: AOAM530HopY4yBCALDLFP1PUMjYEOWpdSTI+ha3o+awBnVEziiupGHQ/
 nL8uJ5nFbn8D1fFip59XkqDhzw==
X-Google-Smtp-Source: ABdhPJxQ5lcbMl7V73ZgbUO6jfK/4rDdndHu4h+o3zCtnTJevCht7YBpu0fJXUZdrdAoteLmZSaYQQ==
X-Received: by 2002:a17:90a:de95:: with SMTP id
 n21mr458867pjv.100.1591990259869; 
 Fri, 12 Jun 2020 12:30:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id n69sm6966934pjc.25.2020.06.12.12.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 12:30:59 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: a.hajda@samsung.com,
	narmstrong@baylibre.com,
	sam@ravnborg.org
Subject: [PATCH v2 2/4] drm/bridge: ti-sn65dsi86: Don't use kernel-doc comment
 for local array
Date: Fri, 12 Jun 2020 12:30:48 -0700
Message-Id: <20200612123003.v2.2.If3807e4ebf7f0440f64c3069edcfac9a70171940@changeid>
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

When building we were getting an error:

  warning: cannot understand function prototype:
    'const unsigned int ti_sn_bridge_dp_rate_lut[] = '

Arrays aren't supposed to be marked with "/**" kerneldoc comments.  Fix.

Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v2: None

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 6fa7e10b31af..fca7c2a0bcf9 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -504,7 +504,7 @@ static unsigned int ti_sn_bridge_get_bpp(struct ti_sn_bridge *pdata)
 		return 24;
 }
 
-/**
+/*
  * LUT index corresponds to register value and
  * LUT values corresponds to dp data rate supported
  * by the bridge in Mbps unit.
-- 
2.27.0.290.gba653c62da-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
