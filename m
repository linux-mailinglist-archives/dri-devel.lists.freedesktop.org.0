Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E72341444
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 05:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7916E983;
	Fri, 19 Mar 2021 04:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3BD6E983;
 Fri, 19 Mar 2021 04:39:22 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id o5so1675785qkb.0;
 Thu, 18 Mar 2021 21:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0pJOhHalCOQI7CNPLCF/MfvREiZP5xjm22JkU7T65OE=;
 b=Hv93RUXh1Z3Q+tEkyOUfj/GacorwdT6MPFwGz4Hw++Tte9u0iwDT06L+7NAmYrpiIg
 65eBbqriV1rPDWaF/HiGBGd/Pd/cWQzTuplSVdkmLCOsRSkDI3vMCKdQ6dDlv6sxS4qk
 Hp7EFbHZexEYu6QzcNHtSjYXRwsF31GP7b2BcaYgNOX67gsdSY6zMRTtqxMC/vHxrEd6
 o5Sg1xQB9lqzXL4sEmTBe4dCNPSgpxsRL/xDtvsMdWJtNddk+YnpmdbueKznCRpLDAUI
 wqAh8LEAaRPtZJvqmJME/F9yO6tgUsKmaS8muz5tXV/5MIkVDv1LI5ae1rcQWoS4yKf5
 iIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0pJOhHalCOQI7CNPLCF/MfvREiZP5xjm22JkU7T65OE=;
 b=Wdd0jf5YmAW7C5/DAk7uGZaL1CjbZA/W2XbbmRtfZvWv+JBZ22yhxuPKWaO37PBwy3
 nIHJSzzSING0MeUp/9JO1ib1FEG3b7SZqBRTwHoq2Z4PJVMfkQF3bTtqhHRKfN51MORa
 u6oeg30rXgZwuez7NhQoliUcKoFF587PDcMffyFbISUkO3Q+JprG4qn06z/ZpDQ22zWB
 WGf94ylV3zKam4ADQWhxYQZ+jMPV4ZXMpOoTL/VH0DR09Sn/kwXsPWtVKtEWGbE3Kj2O
 vp5VZ3JJpTeMKdU3KbguHkvLNQOT0JTCoGatei0BqOY+ciLuJGBinzxW0vJheGLDhTmv
 2hfA==
X-Gm-Message-State: AOAM533fDWCSEwMrXVKOkomLGisBrcNJ6nkf+sTBf7Ar8IvEiS3be3pb
 HfB15V3//VvdZ6MitpRsiTM=
X-Google-Smtp-Source: ABdhPJwhAX/SxVXTbcrANn/VyOtQy7E2wW3G14TkgDUJqG0oDLj9RKl7BlGO6nXO10tgqLmxWJEfHw==
X-Received: by 2002:a37:8906:: with SMTP id l6mr7814754qkd.232.1616128761345; 
 Thu, 18 Mar 2021 21:39:21 -0700 (PDT)
Received: from localhost.localdomain ([37.19.198.87])
 by smtp.gmail.com with ESMTPSA id m25sm3024917qtq.59.2021.03.18.21.39.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 21:39:20 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 imre.deak@intel.com, ville.syrjala@linux.intel.com,
 lucas.demarchi@intel.com, matthew.d.roper@intel.com,
 tejaskumarx.surendrakumar.upadhyay@intel.com, aditya.swarup@intel.com,
 anusha.srivatsa@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: i915: Fix a typo
Date: Fri, 19 Mar 2021 10:07:01 +0530
Message-Id: <20210319043701.14105-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/nothign/nothing/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dpll_mgr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
index f6ad257a260e..14d784a6fae5 100644
--- a/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
+++ b/drivers/gpu/drm/i915/display/intel_dpll_mgr.c
@@ -4185,7 +4185,7 @@ static void icl_pll_disable(struct drm_i915_private *dev_priv,
 	/*
 	 * DVFS pre sequence would be here, but in our driver the cdclk code
 	 * paths should already be setting the appropriate voltage, hence we do
-	 * nothign here.
+	 * nothing here.
 	 */

 	val = intel_de_read(dev_priv, enable_reg);
--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
