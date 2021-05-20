Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AA738AD57
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3946F413;
	Thu, 20 May 2021 12:03:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54EEA6F410
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:01 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id u133so9024471wmg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AV8ypLVFqPQaG8ImkTPidzOwU8OZuMCnDE642RmrYdM=;
 b=l1KGBAOdFAJXHL9C42nmDEfceS+WjToud0zWjfRH0biJ5jNv5OhIHeoNPhmNOOyuUX
 +oSJJcPdUvUgMG2YMk7jnebNSoOL3gM0+pOm6HCsFP/o/fQvDvwsbjHKXxOWWV6TfSIX
 DX71uO0VzV3eQsX7KE6NBBMdxJbPf4XwYZGVo42cDwAxYh6kYH92oaedI/+q0PMjd6qO
 w8bKh6yNKmBUA0kl/X3q5tAQbcpAsITn/tEgXretQFP0QU/vO05BM05/PHOteGzj9Kit
 n6WC7E3bw+hDgpyYo9dzc7KcJ4lgDklPoVEO2qyryxuW6QBaL4f7VrWK9oDIkWCnkRWZ
 N/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AV8ypLVFqPQaG8ImkTPidzOwU8OZuMCnDE642RmrYdM=;
 b=GOD9/a4UCUvatuj0kRoaoxowkk/CvUOWR00JrVFCYtFEDdAzRpJFkiHF+eUwQvgTcR
 jzeol5ZGIy6Kc1WGOnzew7ag7tH3orojhdRZA3nucr8XPiSPu59oR1I8A2OO/xd1lI/p
 pkq+GZVzE6dJe7KO3mFXB+OcIpaw4Mq1lbhHeiYrVW/T4cGANOt456k7GNcpn6D3Xqfj
 nyHqbDvcrgeTrkxBZ3CkztRYpem4b1BaEtdnePWRJVFCtMyrLpjSFQu+D29rqsJuSBXQ
 Fwk7Khjb3mxVC3CS2T3OmrVWcZauBwSHFMHKtDr+cTFcuW84WSzBHyPmcsImQGH30i5E
 x9Sw==
X-Gm-Message-State: AOAM5335k5s9SCb2YsHY5kqIa0Lh/O32xtXkoE0jEmaFXJUEdvSsbE1D
 2syejhq+98pXJVeSzgjL5bEsh18iv6+7ow==
X-Google-Smtp-Source: ABdhPJw0Ik9gZa9FezJAqTaG8yftjhBqljFO2Y9prWkBU+rdxAoQzfK8s97SDz4K/ZlbgkOqXNHHsg==
X-Received: by 2002:a1c:a949:: with SMTP id s70mr3815822wme.30.1621512180085; 
 Thu, 20 May 2021 05:03:00 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:02:59 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/38] drm/sti/sti_tvout: Provide a bunch of missing function
 names
Date: Thu, 20 May 2021 13:02:18 +0100
Message-Id: <20210520120248.3464013-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
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
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vincent Abriou <vincent.abriou@st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/sti/sti_tvout.c:166: warning: expecting prototype for Set the clipping mode of a VIP(). Prototype was for tvout_vip_set_color_order() instead
 drivers/gpu/drm/sti/sti_tvout.c:187: warning: expecting prototype for Set the clipping mode of a VIP(). Prototype was for tvout_vip_set_clip_mode() instead
 drivers/gpu/drm/sti/sti_tvout.c:203: warning: expecting prototype for Set the rounded value of a VIP(). Prototype was for tvout_vip_set_rnd() instead
 drivers/gpu/drm/sti/sti_tvout.c:223: warning: expecting prototype for Select the VIP input(). Prototype was for tvout_vip_set_sel_input() instead
 drivers/gpu/drm/sti/sti_tvout.c:258: warning: expecting prototype for Select the input video signed or unsigned(). Prototype was for tvout_vip_set_in_vid_fmt() instead
 drivers/gpu/drm/sti/sti_tvout.c:274: warning: expecting prototype for Set preformatter matrix(). Prototype was for tvout_preformatter_set_matrix() instead
 drivers/gpu/drm/sti/sti_tvout.c:299: warning: expecting prototype for Start VIP block for DVO output(). Prototype was for tvout_dvo_start() instead
 drivers/gpu/drm/sti/sti_tvout.c:353: warning: expecting prototype for Start VIP block for HDMI output(). Prototype was for tvout_hdmi_start() instead
 drivers/gpu/drm/sti/sti_tvout.c:402: warning: expecting prototype for Start HDF VIP and HD DAC(). Prototype was for tvout_hda_start() instead

Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/sti/sti_tvout.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_tvout.c b/drivers/gpu/drm/sti/sti_tvout.c
index df3817f0fd302..2499715a69b79 100644
--- a/drivers/gpu/drm/sti/sti_tvout.c
+++ b/drivers/gpu/drm/sti/sti_tvout.c
@@ -153,7 +153,7 @@ static void tvout_write(struct sti_tvout *tvout, u32 val, int offset)
 }
 
 /**
- * Set the clipping mode of a VIP
+ * tvout_vip_set_color_order - Set the clipping mode of a VIP
  *
  * @tvout: tvout structure
  * @reg: register to set
@@ -177,7 +177,7 @@ static void tvout_vip_set_color_order(struct sti_tvout *tvout, int reg,
 }
 
 /**
- * Set the clipping mode of a VIP
+ * tvout_vip_set_clip_mode - Set the clipping mode of a VIP
  *
  * @tvout: tvout structure
  * @reg: register to set
@@ -193,7 +193,7 @@ static void tvout_vip_set_clip_mode(struct sti_tvout *tvout, int reg, u32 range)
 }
 
 /**
- * Set the rounded value of a VIP
+ * tvout_vip_set_rnd - Set the rounded value of a VIP
  *
  * @tvout: tvout structure
  * @reg: register to set
@@ -209,7 +209,7 @@ static void tvout_vip_set_rnd(struct sti_tvout *tvout, int reg, u32 rnd)
 }
 
 /**
- * Select the VIP input
+ * tvout_vip_set_sel_input - Select the VIP input
  *
  * @tvout: tvout structure
  * @reg: register to set
@@ -247,7 +247,7 @@ static void tvout_vip_set_sel_input(struct sti_tvout *tvout,
 }
 
 /**
- * Select the input video signed or unsigned
+ * tvout_vip_set_in_vid_fmt - Select the input video signed or unsigned
  *
  * @tvout: tvout structure
  * @reg: register to set
@@ -264,7 +264,7 @@ static void tvout_vip_set_in_vid_fmt(struct sti_tvout *tvout,
 }
 
 /**
- * Set preformatter matrix
+ * tvout_preformatter_set_matrix - Set preformatter matrix
  *
  * @tvout: tvout structure
  * @mode: display mode structure
@@ -289,7 +289,7 @@ static void tvout_preformatter_set_matrix(struct sti_tvout *tvout,
 }
 
 /**
- * Start VIP block for DVO output
+ * tvout_dvo_start - Start VIP block for DVO output
  *
  * @tvout: pointer on tvout structure
  * @main_path: true if main path has to be used in the vip configuration
@@ -343,7 +343,7 @@ static void tvout_dvo_start(struct sti_tvout *tvout, bool main_path)
 }
 
 /**
- * Start VIP block for HDMI output
+ * tvout_hdmi_start - Start VIP block for HDMI output
  *
  * @tvout: pointer on tvout structure
  * @main_path: true if main path has to be used in the vip configuration
@@ -392,7 +392,7 @@ static void tvout_hdmi_start(struct sti_tvout *tvout, bool main_path)
 }
 
 /**
- * Start HDF VIP and HD DAC
+ * tvout_hda_start - Start HDF VIP and HD DAC
  *
  * @tvout: pointer on tvout structure
  * @main_path: true if main path has to be used in the vip configuration
-- 
2.31.1

