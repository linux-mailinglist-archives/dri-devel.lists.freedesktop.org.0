Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBC438AD67
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E450B89BE8;
	Thu, 20 May 2021 12:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E692E89129
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:15 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id p7so13653598wru.10
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LEQDjer3vbO3TY4ZLRkV2RG2nkyiXc42+Td4BCQWM9s=;
 b=Ki/5vsccVM8UHJjBDGFEOMuTjOicSQZ1oz/OgLD4xv2Mx1VnM2VGHXxQik26n7huqz
 z+M0QggmLyEdbh5Z6f5cvjF26hkbqkjqZdRsDY/uCBFP9XHELAfxkgmlEHLWuxPcKDl0
 +ueptwbIz3rdVJVYcrJrmXoJISOoWkn/qWGuX0w8/oNZzsrv8zDCSW3V+lYoFDY+4mwx
 DdAQ44Bz3ymEqFpMxp+VFW/PuXEBgA6+C2u6IQfhVS7FCXUKQIRax56FYq3e5u94hjxV
 uJWLg8jT4C+/uABqpXoJ1pHREuWwxGXHwSP+D7wfEOuHJtO2jUvCHoNKxlCDoschLjdq
 N70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LEQDjer3vbO3TY4ZLRkV2RG2nkyiXc42+Td4BCQWM9s=;
 b=Trhi9b2fckW5NNwpqNVJreLogJOdO+iyLxwCSNh8n4dW2UTL8jo5ippTbsL6sHhBzq
 aUK7Vkb7HRE+jT9IXDy9Fv+xvbY0d3VC51L5mAEBa4RAK6DPBI+x8U1lsMB6JnGR87YR
 TchyxsYJXNWZZMEQhRcHETf0DwMMQTIElvLy6fmE2MnBs+wm4ABoi/gwE6tkkvWLjIlF
 a+3SM3IcAboU07D4k7hQ1AOMLu9s4WoNM+u4aSTenmvPA5gVgR9uEAlBoNlbsE9K6XXL
 1YnXvdi7kgveb6JviP/EYeOgPHkr+v0CnU/oNXnB7vNNwBd2O5vyBjMe2zYo3Ahspj4h
 UHvQ==
X-Gm-Message-State: AOAM53354ZWM257H7VARFq3drrmpoouuQD6ELB6hwDb1l4niDzO8zwcx
 V7cAo2DDVdAddFfV8TLd31lHnA==
X-Google-Smtp-Source: ABdhPJw4bICpRBMx5HeraldCYJJDz2R+rg+I59syE9V7H9hsq2MLfMyrxB9ejwWsFz74csOg7ggUcA==
X-Received: by 2002:a5d:44cb:: with SMTP id z11mr3998746wrr.159.1621512194487; 
 Thu, 20 May 2021 05:03:14 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:14 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 22/38] drm/msm/disp/dpu1/dpu_plane: Fix a couple of naming
 issues
Date: Thu, 20 May 2021 13:02:32 +0100
Message-Id: <20210520120248.3464013-23-lee.jones@linaro.org>
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
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:373: warning: expecting prototype for _dpu_plane_set_panic_lut(). Prototype was for _dpu_plane_set_danger_lut() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:498: warning: expecting prototype for _dpu_plane_set_vbif_qos(). Prototype was for _dpu_plane_set_qos_remap() instead

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 7a993547eb751..ed05a7ab58f53 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -364,7 +364,7 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 }
 
 /**
- * _dpu_plane_set_panic_lut - set danger/safe LUT of the given plane
+ * _dpu_plane_set_danger_lut - set danger/safe LUT of the given plane
  * @plane:		Pointer to drm plane
  * @fb:			Pointer to framebuffer associated with the given plane
  */
@@ -491,7 +491,7 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 }
 
 /**
- * _dpu_plane_set_vbif_qos - set vbif QoS for the given plane
+ * _dpu_plane_set_qos_remap - set vbif QoS for the given plane
  * @plane:		Pointer to drm plane
  */
 static void _dpu_plane_set_qos_remap(struct drm_plane *plane)
-- 
2.31.1

