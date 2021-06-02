Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DE2398CEC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E051A6ECBE;
	Wed,  2 Jun 2021 14:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF42F6ECC0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:25 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v23so2533018wrd.10
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LMk1TNRyjEkKfMz8CVM0q7dVL5MOXxkVaJNdLWr+qvs=;
 b=ayCwXdOagW91dL4geRSSIvnIoAy86Hw+zvDhq8hVyXqOhpdz6XnC/vzBQeIRDy+wlr
 dG84f/OXE+BKJ1dq68TKWtirOA9ai92ZbczPg2Ymw0FxCLRRfPZ45fDP9yQ5vTweuxvA
 J8/gVUsJy/tJPAiJBDLOSiEndiAZ9+Fv4X5M6kMqT5PVlYWZsnKgMFma7iwMyYQS02qx
 iU24y4Kfsm8O9Qclj31wnRtZ/VeHfg/J6l0iZUJM5RipSOUUuMbSccDzfdotqZYiQSRi
 SN1rDPmp+PimibgpfQtWz8X4pD7tHebO8silLsR1u4KY89QPdSkjYyakOc8D2fGohhxA
 VuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LMk1TNRyjEkKfMz8CVM0q7dVL5MOXxkVaJNdLWr+qvs=;
 b=MHcGiWKrH0Qgbk0Z/h/434W/x1L2gB/nTouBPaWxVybnuD01eGZEJyNWep8Oy3XhmH
 u+2PlTTs9i/w/Ks8AxeCLvnRp/W494VjC6CPr8yHlopHFuDXbUuaVfQpBjBXDi3BAN+t
 D8kAZhVxOmQvxZ399cTujzVjTQIwNJ9c0P8ofN9CB2zKOYvACDIx8y2cm7AjriFCfskS
 fTGbBVEs1pMdvICb4ECzeYHbdXpy1GRSALeDUMjB3qPqseY5Raka6sqvWZOsfO0i342T
 X4Jff+G3QXCdG8rzn6+aby74qsBkfV8aU84oYTjoH5gv0eAX2UMeifF9WlpDj2KKUQMM
 xnzA==
X-Gm-Message-State: AOAM532b66o37xC45/sx+G2ids2uiut2p7rHyv5V7V6OA3an48yEb2XQ
 ihSrFkvhAZA7r1AFl6XmKrNoX7Tp1nQxjw==
X-Google-Smtp-Source: ABdhPJy36YCMrmcz7kEQrnj2vN6WxprS9/r3ZzMpDck/Tqk9lITU0jhcTqTjWCIH0Nh9IhtVqvOUKg==
X-Received: by 2002:adf:9dd1:: with SMTP id q17mr21515165wre.402.1622644404009; 
 Wed, 02 Jun 2021 07:33:24 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:23 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 13/26] drm/msm/dp/dp_catalog: Correctly document param
 'dp_catalog'
Date: Wed,  2 Jun 2021 15:32:47 +0100
Message-Id: <20210602143300.2330146-14-lee.jones@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Function parameter or member 'dp_catalog' not described in 'dp_catalog_aux_reset'
 drivers/gpu/drm/msm/dp/dp_catalog.c:206: warning: Excess function parameter 'aux' description in 'dp_catalog_aux_reset'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index f4f53f23e331e..9ba75b994595d 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -193,7 +193,7 @@ int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog)
 /**
  * dp_catalog_aux_reset() - reset AUX controller
  *
- * @aux: DP catalog structure
+ * @dp_catalog: DP catalog structure
  *
  * return: void
  *
-- 
2.31.1

