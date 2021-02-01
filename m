Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB96130A89F
	for <lists+dri-devel@lfdr.de>; Mon,  1 Feb 2021 14:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C796E59D;
	Mon,  1 Feb 2021 13:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31966E59D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 13:26:35 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id m22so12127641ljj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 05:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LZxvJUjhWxCl0Oued5nfmdJDN7RgogDJn++6GeZRY1g=;
 b=t7adSygFSaLhLJVYkBJ3SlHLM0XsUuaq27/YMomkJH3sUvOD7J8D/kcasR9BporOnS
 W7Kb+9pHZseOXSASpNZJdkOpcYyjMgDKU6r23dy/4yyeuA6Y17V3oVseMsxZ1rXv+/uG
 fBATf48ytnLdhaSfMLo75sk2fXBErJkDA8CBtNcnwmBgW8kEjprcAqtClqwWjFl8qLlt
 +K19o8BPRnDNa4jBr+daBcjOgSeDwHTkpOD5w0IUQR2ra5lgUQLRoLwx9y1L59eWw/q3
 ZEOTbLFEuOy1KnU+yagJBuq344CDiZ3YAF+N6MpphU3mSthuXNYfTYqyU4fHdDVBjJRP
 CTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LZxvJUjhWxCl0Oued5nfmdJDN7RgogDJn++6GeZRY1g=;
 b=Ssu/abIOL7YYCRNoLga8gPtwohL4njsMTJhWw/J1BMk2x1mXgCHRQ7KiXwbwCvSuGp
 taBElvM9DaWG1EBr8VvKfkdy2t0az/ACPyaOhvusMgkc0I8QgnOdtClGQUqrt/4G2JaV
 bmW5+I856cTIfEq5dg6U9gu1tLYfDCzeMkSInhR1lJ/m2oGem6EpzMn40ZiS78xJPp0D
 CmExvN96Jj0O3cSOjcA78KpiKu2ds0n96MQvpbassFfIR/5Msb/jpTN6bRfOfYsuvBJC
 X2+4Cj0oxK5P6zoolxaPHNJqThyLZG5CnfjkiizyiNbYCeujbS61jnwzMkvijKoZInVw
 9X/g==
X-Gm-Message-State: AOAM533JiJIk2U2IohSeSMqvOIbnxwf4F4N8R34lnzWBXjIWvPqzq58x
 SRDn9bulaBeOwbBhbimkIEYJWtoGqx4=
X-Google-Smtp-Source: ABdhPJzy6V27PSws0pAuUKhxBVFJVS86LxSrF1EedhOnJcS5yXapaAVmHGN+FpIZmF4s99z02cStLQ==
X-Received: by 2002:a2e:9cc8:: with SMTP id g8mr10378122ljj.479.1612185993804; 
 Mon, 01 Feb 2021 05:26:33 -0800 (PST)
Received: from workstation.lan (81-229-85-231-no13.tbcn.telia.com.
 [81.229.85.231])
 by smtp.gmail.com with ESMTPSA id p21sm2984737lfu.227.2021.02.01.05.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 05:26:32 -0800 (PST)
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/gma500/cdv: Remove unused tv out paths
Date: Mon,  1 Feb 2021 14:26:14 +0100
Message-Id: <20210201132617.1233-3-patrik.r.jakobsson@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
References: <20210201132617.1233-1-patrik.r.jakobsson@gmail.com>
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
Cc: airlied@linux.ie, tzimmermann@suse.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Afaik tv out is not available on Cedarview and the code isn't doing
anything so remove it.

Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
---
 drivers/gpu/drm/gma500/cdv_intel_display.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_display.c b/drivers/gpu/drm/gma500/cdv_intel_display.c
index 5d3302249779..aac776fab36d 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_display.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_display.c
@@ -582,7 +582,7 @@ static int cdv_intel_crtc_mode_set(struct drm_crtc *crtc,
 	struct gma_clock_t clock;
 	u32 dpll = 0, dspcntr, pipeconf;
 	bool ok;
-	bool is_lvds = false, is_tv = false;
+	bool is_lvds = false;
 	bool is_dp = false;
 	struct drm_mode_config *mode_config = &dev->mode_config;
 	struct drm_connector *connector;
@@ -603,9 +603,6 @@ static int cdv_intel_crtc_mode_set(struct drm_crtc *crtc,
 		case INTEL_OUTPUT_LVDS:
 			is_lvds = true;
 			break;
-		case INTEL_OUTPUT_TVOUT:
-			is_tv = true;
-			break;
 		case INTEL_OUTPUT_ANALOG:
 		case INTEL_OUTPUT_HDMI:
 			break;
@@ -660,12 +657,6 @@ static int cdv_intel_crtc_mode_set(struct drm_crtc *crtc,
 	}
 
 	dpll = DPLL_VGA_MODE_DIS;
-	if (is_tv) {
-		/* XXX: just matching BIOS for now */
-/*	dpll |= PLL_REF_INPUT_TVCLKINBC; */
-		dpll |= 3;
-	}
-/*		dpll |= PLL_REF_INPUT_DREFCLK; */
 
 	if (is_dp || is_edp) {
 		cdv_intel_dp_set_m_n(crtc, mode, adjusted_mode);
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
