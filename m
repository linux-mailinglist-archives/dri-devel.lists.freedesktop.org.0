Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD5D324745
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 00:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A4EE6EC03;
	Wed, 24 Feb 2021 23:01:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5ED6EC02
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 23:01:45 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id c8so4319219ljd.12
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 15:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JWazTQ/6PwXeBKQ5AHtcslmYVVFr0X7rQ3bwRNkLBQ4=;
 b=m8MeP9RgTHfK0oJ8o9ojw9reVRo40AHAx9ZzYGHPC0gEmpmWgPEPO/O9JeWslY82zI
 sKiqDko9RY9cOIrweUbRxWZVjFq50Ge+/SFckP5LQvfuysIT68G/bKXgWUXuAxhkdmg4
 5x4IDAEum+tvpyIKyykBuWR+6hlcjIwUPv4wlgLii8wtavrTHZFb+/TY0GhrHJJqAoEJ
 OEL319aFwTMvsXGYVBUwNfRRHdUvkK6301N5dp8JHDYMqd/nZqINh0YKW2W/y2VmigEL
 eovRDofitUKj42GNEW9iFi1lrQP+herSPzNo7LRa182aKKwF8P7UWzQBfCLuNtGmWq7f
 ZGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JWazTQ/6PwXeBKQ5AHtcslmYVVFr0X7rQ3bwRNkLBQ4=;
 b=B/fhdNQ6tKtCGSFUX9Pa1kSLALUIEfU/s/ubOuDNI8rg0yBgr6ydMXrEEethjng60a
 F9UsU0RaSv+kzEewL3izYTKYXWdMB0BxX7X877F9BFf/WJAdB/tWZvTzFKCwo+tVoOpa
 lc7i5lY0FtDsI4KKyLzJkmkvwKOD6I0xDUOxdJVJ337upoksfNlni6OFdK1wS5olpp8a
 T/FKb6fMCqfKNuhY9dHXwftbq/G42q7EsuNcXPT+jUSbqQtP1bvGLnkgwlE31b12asKA
 D1RuSiXaqAHL2o8+TnqrVOXH754YMBIgKIBLLYUCkUg4zpxJaRyMj7aNknQbadw2WKaE
 4bmw==
X-Gm-Message-State: AOAM533aJEpP/uj1FVhcIR9E8SsnUxkes+A+DjMjtuq+4JNJ0EasqRu3
 YhCxMJ4/E9KB6FFjIHrrLcUUVqq7nUwJ9w==
X-Google-Smtp-Source: ABdhPJxzaH9J5CMg5MHT2YGXigBWhsYbLIVpW4igifMX1z/lnFHGn9sQCmobgSKen59v6zddfzhquQ==
X-Received: by 2002:a2e:8849:: with SMTP id z9mr50547ljj.478.1614207704266;
 Wed, 24 Feb 2021 15:01:44 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a1sm757790ljm.73.2021.02.24.15.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 15:01:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/msm/dsi_pll_7nm: Solve TODO for multiplier frac_bits
 assignment
Date: Thu, 25 Feb 2021 02:01:43 +0300
Message-Id: <20210224230143.1216118-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.0
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The number of fractional registers bits is known and already set in
the frac_bits variable of the dsi_pll_config struct here in 7nm:
remove the TODO by simply using that variable. This is a copy of
196145eb1af1 ("drm/msm/dsi_pll_10nm: Solve TODO for multiplier frac_bits
assignment").

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
index c1f6708367ae..0458eda15114 100644
--- a/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
@@ -509,6 +509,7 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 {
 	struct msm_dsi_pll *pll = hw_clk_to_pll(hw);
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(pll);
+	struct dsi_pll_config *config = &pll_7nm->pll_configuration;
 	void __iomem *base = pll_7nm->mmio;
 	u64 ref_clk = pll_7nm->vco_ref_clk_rate;
 	u64 vco_rate = 0x0;
@@ -529,9 +530,8 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	/*
 	 * TODO:
 	 *	1. Assumes prescaler is disabled
-	 *	2. Multiplier is 2^18. it should be 2^(num_of_frac_bits)
 	 */
-	multiplier = 1 << 18;
+	multiplier = 1 << config->frac_bits;
 	pll_freq = dec * (ref_clk * 2);
 	tmp64 = (ref_clk * 2 * frac);
 	pll_freq += div_u64(tmp64, multiplier);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
