Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F1D2B0D3E
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 20:01:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4626E3EC;
	Thu, 12 Nov 2020 19:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 312C86E3DB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:01:47 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 23so7137184wrc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rT+IXEU28/HBDiXMRe74AzE+dn3RqXWDXkbUpL6OkoA=;
 b=tdjaaSuaL8f73OZa6UUsPKJjUCx6w+csHrLMQpSHxNDvRT0Ejajm9RK/ikXe4ea8dn
 C/+cimXhEn18f0wcUKVz8wQLISeZJJvF09qkXWh1wGcO8CSlYt/wGaz9hbq5+eO3yC0J
 ISrgyxBrrLlvG0Zi1IUN8NhiomV3/E5bpY2B0kW8VGSpWc21ajrnZkOPKImDEn7Z1PFf
 PI0VWcHs8iLytYqKhKiNltaxRYoOBUWpHyzt1T2g/OxuD90NDEEZFeJZHDfx7m15cOlj
 iHUZUr6CEBoTHqDwb7rZvu87Sq+YXAvgT+6ABAgCe+U2ipZP8NEODF8O2we3wWsI9S37
 ufag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rT+IXEU28/HBDiXMRe74AzE+dn3RqXWDXkbUpL6OkoA=;
 b=OVg7e6CNDWYaakF8oncDS7iPC0Qk34VzHvJ20NmePPFzAFB/l/LauJvfb+tVtiPXuj
 BsVudut3ZTVF/ZHs03aIWsTtUtwV8AHnRs3xpRFx6dThx7Kn487o8/JXpE581/2H8+Lr
 cMn/SjHTZTRnD3n9nZlmpIbFoU++OUKH+ML7o0mvyErx+5suLuv95FI4/yrI6nifzAI2
 sEPkjrtmafD76E2N/y+iF1IInyi6wUqkCTUr8uWMKfeDpHQy/DUTxHzDF5Wfx2EIpNiR
 5vYBFz4FtTtU3djW0o45yn0A6A78h/9CdXb/wZjveh9U5atIR2T1tRsjGeXxLIL0YCsG
 xShQ==
X-Gm-Message-State: AOAM531kqMCf5Y7MyFSiO57s7ZEJEL0VpZZ2zTG9lqciGU8bgsO8GTWN
 TjVVECbPUrMB/zzQ/COh+hALRQ==
X-Google-Smtp-Source: ABdhPJwu2RHhtXr1BaoQ9pZlbxk1MKDa1ftmZPrnmdplp0CwIonYDb//qkatFZvv5Ghbum++hiSt8g==
X-Received: by 2002:adf:f20c:: with SMTP id p12mr1162094wro.27.1605207704885; 
 Thu, 12 Nov 2020 11:01:44 -0800 (PST)
Received: from dell.default ([91.110.221.159])
 by smtp.gmail.com with ESMTPSA id p4sm8105214wrm.51.2020.11.12.11.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:01:44 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 26/30] drm/exynos/exynos_drm_gsc: Supply missing description
 for 'num_limits'
Date: Thu, 12 Nov 2020 19:00:35 +0000
Message-Id: <20201112190039.2785914-27-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112190039.2785914-1-lee.jones@linaro.org>
References: <20201112190039.2785914-1-lee.jones@linaro.org>
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
Cc: linux-samsung-soc@vger.kernel.org, Eunchul Kim <chulspro.kim@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>, David Airlie <airlied@linux.ie>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Jinyoung Jeon <jy0.jeon@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Sangmin Lee <lsmin.lee@samsung.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/exynos/exynos_drm_gsc.c:129: warning: Function parameter or member 'num_limits' not described in 'gsc_driverdata'

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Eunchul Kim <chulspro.kim@samsung.com>
Cc: Jinyoung Jeon <jy0.jeon@samsung.com>
Cc: Sangmin Lee <lsmin.lee@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_gsc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 45e9aee8366a8..b01f36e76eafd 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -118,6 +118,7 @@ struct gsc_context {
  * struct gsc_driverdata - per device type driver data for init time.
  *
  * @limits: picture size limits array
+ * @num_limits: number of items in the aforementioned array
  * @clk_names: names of clocks needed by this variant
  * @num_clocks: the number of clocks needed by this variant
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
