Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F53A36229B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60E196EC21;
	Fri, 16 Apr 2021 14:38:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BD76EC03
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:38:12 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id g5so35781107ejx.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K9wjRJ3K6gEJWw7cmRlm1PWa18kr/G6l9t1XfKeR5i0=;
 b=hsB6bda4PBPLddVEBDk0vz5lUc3uon7c5uczoWgeIVSXi6HGmocnf3hJ3J13pM4afH
 hFR8QMsXah3FZwP4gROY/5i0pujiWAdJtP4BfvAk1xqq7KVZcbyGzzsKGuIwotI/T6Ap
 Kky9Zzseqo688VrTBA5uGnRJnH3FXLykl4s8gRJlkCIZjjqCkYqUhevHh+Avgp/Bs9xV
 7S8aBaTrqBpGI5tq3XE7PStwvaQgqMbeTxsibvxDDohT1nypFcIO3lUfHFowvFwmxU3o
 nWrfZhB4GZwUA6DAG+kBo3BvtShUJeyTDS6LHRHu3DeZayPj0TDExB8LHQoXaL0z/9hq
 sAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K9wjRJ3K6gEJWw7cmRlm1PWa18kr/G6l9t1XfKeR5i0=;
 b=XuZ0GW/N45W2weN7SK6/E0wb6z589aiKvy5d22wQzp+22XpQrvW2kNAmiqQ+jXpDtH
 8kMW9CXp9hVM5hF71Uc1zFbJ45PNhEvzLJ9GWH1DPbsZWoy1BXg5X/AHKVcSNehgC3YC
 oW0hoiOK/WzgdhfzHYvbTa7XLJ/EnHqbkswb3g5EkAtOAf6tRnkA/GEae/tvLoM066iH
 oDqd0q3z1weLjS5t78ka0IHXDwVUenZH0zrht43LOZ197TDftawXY48gpkmIWwmDO2AO
 RN2Q+nJTyLjhXm7nMMNyJoi84jvfV4Pj1veFsDzRRlZR45/NFLhkhbSDVZkHxdgYB+I/
 dqkA==
X-Gm-Message-State: AOAM530+A0OMeTbK8feVh5iw/5JSmiStXSfsXN8Qal8tEPuPqL/utPS+
 hBZGIytmujwSJMJ1BQ+cyq9buQ==
X-Google-Smtp-Source: ABdhPJyu162ulu0SvfYCwjPDNoMz4ehF0YKxWNjcaeHrMN7tLesqEuNfuMeh0cHl6rXVzMJImkpgsQ==
X-Received: by 2002:a17:906:c218:: with SMTP id
 d24mr8348994ejz.363.1618583891366; 
 Fri, 16 Apr 2021 07:38:11 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:38:10 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 39/40] drm/sti/sti_hdmi: Provide kernel-doc headers with
 function names
Date: Fri, 16 Apr 2021 15:37:24 +0100
Message-Id: <20210416143725.2769053-40-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vincent Abriou <vincent.abriou@st.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/sti/sti_hdmi.c:193: warning: expecting prototype for HDMI interrupt handler threaded(). Prototype was for hdmi_irq_thread() instead
 drivers/gpu/drm/sti/sti_hdmi.c:225: warning: expecting prototype for HDMI interrupt handler(). Prototype was for hdmi_irq() instead
 drivers/gpu/drm/sti/sti_hdmi.c:246: warning: expecting prototype for Set hdmi active area depending on the drm display mode selected(). Prototype was for hdmi_active_area() instead
 drivers/gpu/drm/sti/sti_hdmi.c:267: warning: expecting prototype for Overall hdmi configuration(). Prototype was for hdmi_config() instead
 drivers/gpu/drm/sti/sti_hdmi.c:346: warning: expecting prototype for Helper to concatenate infoframe in 32 bits word(). Prototype was for hdmi_infoframe_subpack() instead
 drivers/gpu/drm/sti/sti_hdmi.c:366: warning: expecting prototype for Helper to write info frame(). Prototype was for hdmi_infoframe_write_infopack() instead
 drivers/gpu/drm/sti/sti_hdmi.c:438: warning: expecting prototype for Prepare and configure the AVI infoframe(). Prototype was for hdmi_avi_infoframe_config() instead
 drivers/gpu/drm/sti/sti_hdmi.c:481: warning: expecting prototype for Prepare and configure the AUDIO infoframe(). Prototype was for hdmi_audio_infoframe_config() instead
 drivers/gpu/drm/sti/sti_hdmi.c:561: warning: expecting prototype for Software reset of the hdmi subsystem(). Prototype was for hdmi_swreset() instead

Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Vincent Abriou <vincent.abriou@st.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index f3ace11209dd7..dd5a388898e79 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -184,7 +184,7 @@ void hdmi_write(struct sti_hdmi *hdmi, u32 val, int offset)
 }
 
 /**
- * HDMI interrupt handler threaded
+ * hdmi_irq_thread - HDMI interrupt handler threaded
  *
  * @irq: irq number
  * @arg: connector structure
@@ -216,7 +216,7 @@ static irqreturn_t hdmi_irq_thread(int irq, void *arg)
 }
 
 /**
- * HDMI interrupt handler
+ * hdmi_irq - HDMI interrupt handler
  *
  * @irq: irq number
  * @arg: connector structure
@@ -238,7 +238,7 @@ static irqreturn_t hdmi_irq(int irq, void *arg)
 }
 
 /**
- * Set hdmi active area depending on the drm display mode selected
+ * hdmi_active_area - Set hdmi active area depending on the drm display mode selected
  *
  * @hdmi: pointer on the hdmi internal structure
  */
@@ -259,7 +259,7 @@ static void hdmi_active_area(struct sti_hdmi *hdmi)
 }
 
 /**
- * Overall hdmi configuration
+ * hdmi_config - Overall hdmi configuration
  *
  * @hdmi: pointer on the hdmi internal structure
  */
@@ -337,7 +337,7 @@ static void hdmi_infoframe_reset(struct sti_hdmi *hdmi,
 }
 
 /**
- * Helper to concatenate infoframe in 32 bits word
+ * hdmi_infoframe_subpack - Helper to concatenate infoframe in 32 bits word
  *
  * @ptr: pointer on the hdmi internal structure
  * @size: size to write
@@ -354,7 +354,7 @@ static inline unsigned int hdmi_infoframe_subpack(const u8 *ptr, size_t size)
 }
 
 /**
- * Helper to write info frame
+ * hdmi_infoframe_write_infopack - Helper to write info frame
  *
  * @hdmi: pointer on the hdmi internal structure
  * @data: infoframe to write
@@ -424,7 +424,7 @@ static void hdmi_infoframe_write_infopack(struct sti_hdmi *hdmi,
 }
 
 /**
- * Prepare and configure the AVI infoframe
+ * hdmi_avi_infoframe_config - Prepare and configure the AVI infoframe
  *
  * AVI infoframe are transmitted at least once per two video field and
  * contains information about HDMI transmission mode such as color space,
@@ -467,7 +467,7 @@ static int hdmi_avi_infoframe_config(struct sti_hdmi *hdmi)
 }
 
 /**
- * Prepare and configure the AUDIO infoframe
+ * hdmi_audio_infoframe_config - Prepare and configure the AUDIO infoframe
  *
  * AUDIO infoframe are transmitted once per frame and
  * contains information about HDMI transmission mode such as audio codec,
@@ -552,7 +552,7 @@ static int hdmi_vendor_infoframe_config(struct sti_hdmi *hdmi)
 #define HDMI_TIMEOUT_SWRESET  100   /*milliseconds */
 
 /**
- * Software reset of the hdmi subsystem
+ * hdmi_swreset - Software reset of the hdmi subsystem
  *
  * @hdmi: pointer on the hdmi internal structure
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
