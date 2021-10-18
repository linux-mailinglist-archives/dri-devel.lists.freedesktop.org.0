Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD7E431244
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 10:39:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9416E85D;
	Mon, 18 Oct 2021 08:39:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8DBE6E85D;
 Mon, 18 Oct 2021 08:39:27 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id t21so2675172plr.6;
 Mon, 18 Oct 2021 01:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FIeLaEFyC6pKx/l+fqT/NHQt2GUwspGRSiBadau7wM8=;
 b=ccCc1hfbRRVQIiBA+jjdnAy93d/6C+WBoAHxQeuzOGiDe7owhfpj61rm+hQG+SkIGI
 N4pjQyQe16nSsB3PCAzu3byN83WsstHBMXBT1k1T5pYihw6kMdeUgjL1wuWLtDOAZAlI
 V+Ek9iMsO89dTq2tmrnrDj4/ZCUbFzBj0muFqvYc5bBYKjzYqTU7E9d6s6eOAIhA/1Fm
 75tv+YHAhWHtwsrHHNFMAes6noY0KmbGnHJlNEMRJ3USSEEqfOeIMix02wb6QkpuVOZM
 8MoPajkr1GiZY4P9ak7WZ7wLGq+xO0sFxTUw48SAGwQCDvQjXJXxLmqD/9OpQX2BG1dF
 JSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FIeLaEFyC6pKx/l+fqT/NHQt2GUwspGRSiBadau7wM8=;
 b=0CQ5ZoB7p53qtAG1ZTf0VrnxvEzxcfgOVIZpJiw9tUSTYRUxmdFgQ5ALLbBolIN06t
 ZcxsoOmeSwGXSrkWN0UhT170H142YzyQ2asBiBm32MA3tGccyHkz7/O+tZvmXkC8IHqy
 CVo7y9HbGTrhEX4T2U/6wKJO64N5cj8sBzjPVd3tZ8ZXUQW4FGC8GcAIGzVwkbVgNghE
 fyFiek+Lm5Lx5X/gP5oWjfEOCXEWhXQJBDwKATcY+zwnup5m1UxThG1rRCAdlihVkZK2
 dKJayqmBqPUO7TtD7Eb+Ft/iPKuGb1QmSh8B6xkkxP7+hHRVxA45K5wvAoZtsxXqbpd0
 xh7Q==
X-Gm-Message-State: AOAM533XCqtcFZu90td4wycHjXv5dfxqEnuKcF3lCHmtjiltnNfds7mG
 0eo41MgHSxsQytF/rYWhavY=
X-Google-Smtp-Source: ABdhPJxMs62rsRWoqISWhuPFvLb7uxg30l1ZlrUwvWREQRfP+no5flZFs55dKbU5UDdePfP0yUIZGA==
X-Received: by 2002:a17:90a:4fc5:: with SMTP id
 q63mr46187263pjh.148.1634546367487; 
 Mon, 18 Oct 2021 01:39:27 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id mu7sm13142829pjb.12.2021.10.18.01.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 01:39:27 -0700 (PDT)
From: luo penghao <cgel.zte@gmail.com>
X-Google-Original-From: luo penghao <luo.penghao@zte.com.cn>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Rothwell <sfr@canb.auug.org.au>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, luo penghao <luo.penghao@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] drm/i915/display: Remove unused assignment
Date: Mon, 18 Oct 2021 08:39:20 +0000
Message-Id: <20211018083920.851150-1-luo.penghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The assignment will be overwritten by the later, but the variable
is not used.

The clang_analyzer complains as follows:

drivers/gpu/drm/i915/display/intel_dpll.c:1568:2 warning:

Value stored to 'dpio_val' is never read

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: luo penghao <luo.penghao@zte.com.cn>
---
 drivers/gpu/drm/i915/display/intel_dpll.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
index 28b1616..cb77d7f 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll.c
@@ -1653,7 +1653,6 @@ static void chv_prepare_pll(const struct intel_crtc_state *crtc_state)
 	bestp1 = crtc_state->dpll.p1;
 	bestp2 = crtc_state->dpll.p2;
 	vco = crtc_state->dpll.vco;
-	dpio_val = 0;
 	loopfilter = 0;
 
 	vlv_dpio_get(dev_priv);
-- 
2.15.2


