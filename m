Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A2B38AD76
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88496F427;
	Thu, 20 May 2021 12:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3A3899AB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:20 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id n2so17468809wrm.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SwqZiy4Z6GG81ovO9zFP9jTTwbxWPaQnItPMn8iAg+I=;
 b=t4JJ/+Jm+OBZHvhWT3uSWqKmuLfECYUetrvnsLWOhawS+SeV9+qIX7UHBYZxZWxbUL
 +2K5DzTdiIOaxc8A4JlDo76EWa3m8PTedb81DlMdwonvBIdmzviSjmypatajwJTEv7Aq
 DifkiMWgKRy5duNfWdB6XyPwHITUSR81zaYG8VKKNyMpiGVjpzYKQqq4QQE6VlrLeU7a
 2YdDp8W4zM90yOmgMKR29qMD8S3aW5QnXONnXr8Xx19r4ogIUD94PMF9la7gMFO8/MIi
 e3aNpG77QY2F2bXnVcik/sdDFNaeieXRF+YikYW/tRFqYno5oeVf9WxlUdtn7Ca4HXu/
 DJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SwqZiy4Z6GG81ovO9zFP9jTTwbxWPaQnItPMn8iAg+I=;
 b=TjaQ/g6SGYpFzlsn+WIM7Vr9vxHUJMnNVqKSNDRI0D34wUFISc3vdQSVtS9PK5fdNB
 eivNLKa1vRkOpkdDu8vBiKlbzcyAOyqzXIOBURN6IPj6PwixEfGU80mYQTMMoZDYutbm
 Tz0eaO4NNLrMD6umGkILg/iwygv3uqjJ9pJlOk+gUy1j/KzDWx6H9gUmmQoT7TeLZXIQ
 zv/3dsbAPpCZRApIO5rmFcxaaVIHjoD79H8muFZkztIq55rC0KC6hxXpdYdVBZez+63o
 M2rQHzQTtWwG9RFjKKmkvjb7T0t0cR8Ceg3Nnx92GIF7FT6j7tE8+eZ96djxfo0BSekQ
 jU7g==
X-Gm-Message-State: AOAM533w7a8Yjvn43MhGvsrNNdKmJvjqj/P7J1TiQYQzvjZdUoYESzEz
 3vn29e133mc4uXCgrUJ7A7KpbA==
X-Google-Smtp-Source: ABdhPJxmrOeEsvi2WLTHFwHRsOHTkZdNHdWlGeXRTREqYXTZU/voycR80D2vHCcLiILbjJd+wRtAnQ==
X-Received: by 2002:a05:6000:186f:: with SMTP id
 d15mr3964910wri.400.1621512199575; 
 Thu, 20 May 2021 05:03:19 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:19 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 27/38] drm/msm/dp/dp_catalog: Correctly document param
 'dp_catalog'
Date: Thu, 20 May 2021 13:02:37 +0100
Message-Id: <20210520120248.3464013-28-lee.jones@linaro.org>
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
index b1a9b1b98f5f6..e4d9df3c04011 100644
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

