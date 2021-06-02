Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81241398CDE
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CEB6ECB8;
	Wed,  2 Jun 2021 14:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4A176ECB3
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:17 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q5so2567055wrm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AV8ypLVFqPQaG8ImkTPidzOwU8OZuMCnDE642RmrYdM=;
 b=p3+jsdMrgcaJkJnXd2tptd14Mk1isNUcDV4LXBYeZFHXMeFmYoBo2PZjh5bUHprvBq
 amccJeNF6hAUYrfLing1CDMI1lReu7p2/ZAPfNGglUqM+2Rosu78ZD4ZV2ViNAIQScMe
 wcJ6ppFXrlweNftZsGxihOEpbqUhKj9zZ+SBmXx8WlKP35h3ApyUFlHv1WuX4/aRYecr
 UusaQA09LCi1+W2zmLQxxNfnPYNx3oYZ87WeKqo4H2PsuuzWCEMdq/OBUnTDjCAaWYIC
 hDz0pDtBIqho0/CX2qKIHMxLUYwUoQVRYTGzccznsPwNZV5ctCqhoRsYdfJ3+rB2OCNV
 oDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AV8ypLVFqPQaG8ImkTPidzOwU8OZuMCnDE642RmrYdM=;
 b=RMeZ4ROm8N7budK04DmrReyCt2bWTWZTYIynVRvKiRJpOP4t8yrbn+te8iNP7StPcc
 IQj9oey+GnsgZJQacWj0RVi6hv2kd4SnB/5P6lRUEVLFtcEMUnzhiro4btCTnCXktqaN
 69t1vz9r9RhMWrmHaVLRb/y/I7cGi0eHsAfx5USs03iZrriFQLL8hE1oSqv60Kna99iO
 oS62m2KGAp52TsSnPZ4Ndc3VG2WuBJ3i5ycnqjg9ieaLGuMH3ESfQgJZBKSkJM1gIHdf
 ZZuuF0xRjT1SYn0fGsUF5PXHgEEh2sRi1KsWIskV9wH1KPJ40dDq3MziqMeGYu3Y/6BA
 IySQ==
X-Gm-Message-State: AOAM531kwfXctJTbScSbNrCLTZedUGNi040sTyn4772QwIMX1e30uLVQ
 Ga2aOtVRBN4fjG4cYXiC2fJ1ig==
X-Google-Smtp-Source: ABdhPJxv8/tXnt3jZGpEevkz+eyTG2Mxqu7ZVtAd/LSIfmLkLKLboeHduLpBdhMqhKvTfjt1eKrKQA==
X-Received: by 2002:a5d:5049:: with SMTP id h9mr23002280wrt.221.1622644396475; 
 Wed, 02 Jun 2021 07:33:16 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:16 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 07/26] drm/sti/sti_tvout: Provide a bunch of missing function
 names
Date: Wed,  2 Jun 2021 15:32:41 +0100
Message-Id: <20210602143300.2330146-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
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

