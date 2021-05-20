Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115B438AD5A
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D4A6F41A;
	Thu, 20 May 2021 12:03:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E5266F411
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:02 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id a4so17423228wrr.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GHanPGk1uQOVUKO22D7xcyQQ9/A6KPvFy4YVhuM9AVY=;
 b=iFfSsAYG2vZJGqO4833luoS6Wmg6j9sAa9WWKN01RUL6INuZ6N0hv/fdVckHCONa6U
 5r4Y+RdUh5Nix3ij/hx3o7v8SOUDNMvYKsxYJdQ2QqH3Y7ZYLhiyUdbJj1Ruo1dHrp+9
 oS9rGv7YEvWeXai75sMeeaQMsRS6CmmcYjvWnBFAQcasupyx94TpIp/7VUZ3OoKKhu08
 0leE5pQx4HrbA6U1pZtM16KWWKe6tJIyo15196qnrVzSpH0Lp2TFKDBnTvxSWB+ACSC+
 W9LTkMQu2Xg3P+oDb4HHLp0lRI4poht30R7A+1+T9CqoZJs/cQ3Hv4qPHJeSMST4e7vH
 jCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GHanPGk1uQOVUKO22D7xcyQQ9/A6KPvFy4YVhuM9AVY=;
 b=uIyBSyQCg5zFpYf+TLfh+bmmt781di5QUNhn4k16TwWKJ7v0++p9dyeu5N6dvfn9Z0
 /Xnl6m2XAK2l5x47Jev19yHpUXJu7UL9aXRbMeyrhKMIUHT/UkuDFxatMjo9ZUQx3eEx
 qjf8kdUjiZs4ajaIx3Mc+uzyNbLlU7GtNFjBTIU4VXuwKNq95eGNmVOe89zoxiDquOUd
 Dj9wCym9+UyPLdbx1q3rCWIKl5tNaOaeObzZBgsa4eTRmpykKUiVKBm6uqxSzlKrBfRZ
 oatlWKzlJjQta1UCuOD/JM4IvKzujHqpyBcKSzgO5gIppR41/x37DD1tYIhkSTMqfAPO
 yohg==
X-Gm-Message-State: AOAM531bcUB/JX7WmnlTXGa7xEEI4CDqPvoya2GNFSF3AMncS6zd7qTN
 Msv0JGaWbqJHZ06EGhIdeGhoSg==
X-Google-Smtp-Source: ABdhPJxda1MrjZvoUJVBz6GDOHlK4UYlGNKUlKIKXSUkmLUKlH3DlLWPNY/UMvP2hYZ6zWITjCWk+w==
X-Received: by 2002:a5d:4536:: with SMTP id j22mr3886009wra.329.1621512181098; 
 Thu, 20 May 2021 05:03:01 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:00 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 09/38] drm/sti/sti_hqvdp: Fix incorrectly named function
 'sti_hqvdp_vtg_cb()'
Date: Thu, 20 May 2021 13:02:19 +0100
Message-Id: <20210520120248.3464013-10-lee.jones@linaro.org>
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
 Fabien Dessenne <fabien.dessenne@st.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/sti/sti_hqvdp.c:796: warning: expecting prototype for sti_vdp_vtg_cb(). Prototype was for sti_hqvdp_vtg_cb() instead

Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fabien Dessenne <fabien.dessenne@st.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/sti/sti_hqvdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index edbb99f53de19..d09b08995b12a 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -782,7 +782,7 @@ static void sti_hqvdp_disable(struct sti_hqvdp *hqvdp)
 }
 
 /**
- * sti_vdp_vtg_cb
+ * sti_hqvdp_vtg_cb
  * @nb: notifier block
  * @evt: event message
  * @data: private data
-- 
2.31.1

