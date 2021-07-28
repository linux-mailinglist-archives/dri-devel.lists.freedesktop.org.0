Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC433D9381
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 18:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0BA6E9DB;
	Wed, 28 Jul 2021 16:46:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8C26E855
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 16:46:30 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id t3so1291284plg.9
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jul 2021 09:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AQzrLQVtbfQMv3/HRKhyPjphDJ6FYVHsID5Re5m9DFY=;
 b=IvGaD/1RLetm7Cjii3YEvU2f/KPRF1C+ltbml72+0w6fKj8e25td/YJRlhSFBMVA0I
 cvGSi4P8FY7EJ0aUt00+u2RDum+Rmc2RwTyyaA+oDNsC83nDAlpjqjovcatYQG5OjF9U
 WHA2HbSz37wkMMEDZgtYjF1H/UQKiDPrwurNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AQzrLQVtbfQMv3/HRKhyPjphDJ6FYVHsID5Re5m9DFY=;
 b=KRpSJB4a8zwIdmRQ+RECWyXhXw7i96KGthtG8yfTQFeVwgHBeYvk5kOcoaaN5cQ8nZ
 tg53LK2NR1swdopBFWfJLDarLYMsOxRaJwJz7CGIZf3ivQySsldAGQpNQgiPjdmj2Vam
 oCX4lDf5xnwWjv2HWFFzlJj7GPlk+Hfv3yw+CdDgAf1yirWb6t76xP/bHRInm05GVMG7
 BifqYLvfjrYvez+24MCmL94pENWRcCiSih8NadU54N9HpFG6zJib/yayz67rTAPaoWGS
 Ue43lJh4yUmpyNAoVNf5I0rrbWbm7SON9PNELtGFSiV6pdOsTKR1jQT5BG5jHJrrFCEW
 guKg==
X-Gm-Message-State: AOAM530uSK1H7ZRZcI847iKj+Doz+v7TVzg4JzyVQW7xox4/98VlZ/ps
 omWm/1flRUk3Eg79Qbw2oUYa+kwhiNlLgDpi
X-Google-Smtp-Source: ABdhPJwYmqa7VXgcysC0cEarvUasOXzxXP3vKtk023ORHTxH8iQ0+T8zkBZaWNczJ9w0ArTdPjU/6w==
X-Received: by 2002:a17:90a:4cc4:: with SMTP id
 k62mr10419437pjh.110.1627490790101; 
 Wed, 28 Jul 2021 09:46:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:9f1e:e713:1a5e:89dc])
 by smtp.gmail.com with ESMTPSA id l12sm474075pff.182.2021.07.28.09.46.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 09:46:29 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/bridge: ti-sn65dsi86: Add some 100 us delays
Date: Wed, 28 Jul 2021 09:45:54 -0700
Message-Id: <20210728094511.3.I842d483139531aa4651da8338512fdf0171ff23c@changeid>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210728164557.1882787-1-dianders@chromium.org>
References: <20210728164557.1882787-1-dianders@chromium.org>
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, steev@kali.org,
 bjorn.andersson@linaro.org, a.hajda@samsung.com, thierry.reding@gmail.com,
 Laurent.pinchart@ideasonboard.com, sam@ravnborg.org, jernej.skrabec@gmail.com,
 devicetree@vger.kernel.org, tzimmermann@suse.de, jonas@kwiboo.se,
 linux-arm-msm@vger.kernel.org, rodrigo.vivi@intel.com, rajeevny@codeaurora.org,
 Douglas Anderson <dianders@chromium.org>, robert.foss@linaro.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The manual has always said that we need 100 us delays in a few
places. Though it hasn't seemed to be a big deal to skip these, let's
add them in case it makes something happier.

NOTE: this fixes no known issues but it seems good to make it right.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 5e932070a1c3..cd0fccdd8dfd 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -307,6 +307,9 @@ static int __maybe_unused ti_sn65dsi86_resume(struct device *dev)
 		return ret;
 	}
 
+	/* td2: min 100 us after regulators before enabling the GPIO */
+	usleep_range(100, 110);
+
 	gpiod_set_value(pdata->enable_gpio, 1);
 
 	/*
@@ -1096,6 +1099,9 @@ static void ti_sn_bridge_pre_enable(struct drm_bridge *bridge)
 
 	if (!pdata->refclk)
 		ti_sn65dsi86_enable_comms(pdata);
+
+	/* td7: min 100 us after enable before DSI data */
+	usleep_range(100, 110);
 }
 
 static void ti_sn_bridge_post_disable(struct drm_bridge *bridge)
-- 
2.32.0.432.gabb21c7263-goog

