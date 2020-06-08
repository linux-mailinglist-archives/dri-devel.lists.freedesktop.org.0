Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C08411F1E7E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 19:49:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786CD6E990;
	Mon,  8 Jun 2020 17:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7326E198
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 17:48:57 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id k2so147780pjs.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 10:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rDREJdIeqVVNUFKbTRjN9h4pzjh8nAC/rSJIcVHTPvI=;
 b=YjVS/wJMDLTWoyw/MsK1Tuoq6+gBFrFSlynfEopbBcduF6pOpl8ZIFp6syxK7jadgP
 SnS5iQoGnbiSlE52dB4TPYH0ijiObajjXDXXytMm4k3DNgb2u247r+rvsDyfsIeeAW2w
 Qs4FXhdcsKjWCadLsOOJI8zMKrfIQY8x11DfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rDREJdIeqVVNUFKbTRjN9h4pzjh8nAC/rSJIcVHTPvI=;
 b=XZLDthDfZSyqOySeU6ouHmPTvMnQZauw/61XM9F/SWBjD4fcNS0ELYtjC3M43QqRuV
 CLgc7beer3R3hqEsGWaD9UUA4WtmEwHV9l1GLWm9juPgGvTtSJITnpl0an0e3Z2r3JyN
 gZvKlul0w+irhRlJTCDX8lD+dOzyDkxmdiLPkqmszdu32++DYvbeFaXM1mwg7IwC+84F
 7/AxYIthXZnbyZBWxzFoxjyDCI04xJR80/5Xn8Ej2ntjwJF+z6vpqTZE2WTTETYLr+1P
 MFYfuquFrxwfasAEd9p9MVtJYEI5wCihBuGOjAMFkE2hWE944wQEfBJJqXS3021fxaTa
 cxXw==
X-Gm-Message-State: AOAM5337itRUf8s5DBv9SbQe4LF+QzpiX3cUmQUrGCE/GWuUyAOCfaI1
 Gp4W10usaFvwQRNo8L6uvaVcHQ==
X-Google-Smtp-Source: ABdhPJzXgMGLzrQbBansRBa6+m6CHlci9mkI2ZDTaVy/m4IurD1PdamJfY6lX9gd88k7K4l+QTJrvA==
X-Received: by 2002:a17:90a:1546:: with SMTP id y6mr490880pja.92.1591638537595; 
 Mon, 08 Jun 2020 10:48:57 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id n7sm162682pjq.22.2020.06.08.10.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 10:48:57 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: a.hajda@samsung.com,
	narmstrong@baylibre.com,
	sam@ravnborg.org
Subject: [PATCH 2/4] drm/bridge: ti-sn65dsi86: Don't use kernel-doc comment
 for local array
Date: Mon,  8 Jun 2020 10:48:33 -0700
Message-Id: <20200608104832.2.If3807e4ebf7f0440f64c3069edcfac9a70171940@changeid>
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

When building we were getting an error:

  warning: cannot understand function prototype:
    'const unsigned int ti_sn_bridge_dp_rate_lut[] = '

Arrays aren't supposed to be marked with "/**" kerneldoc comments.  Fix.

Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

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
2.27.0.278.ge193c7cf3a9-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
