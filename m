Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7143B2F8370
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:14:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3AF6E48C;
	Fri, 15 Jan 2021 18:13:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662666E47E
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:44 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d26so10187389wrb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Sf7UxFKe3Y/0LIWjexcpC2JdFLtpHY5KwvFx7/VFjA=;
 b=w9NoGSZ/l11wfSZSeAI4t499CVHwCdmjQnsIudKi0BoQ1Qmcl/PevP5g/9yIqF1VZI
 zNb7qldTqI8Z8+nqxO3I0vxh6xYD4hsB/C1KIT71zz1hTeHDc3e1oztvaUrGon+1UwRd
 wPbyfic0PGsGSerU7GReFRPZW0JhETAtUZYpzyB/nM76gZBnlCXcJH4OZsu6Pslu+mha
 gjkrHspJ9en30gn8UHW92S0gUfchzdIRqmXAMzN+iJqizZAEc9UftalWpWiYmcZE6+/l
 23zmbg3+KPPZKhAiwhCoWV1v56PowvyZ96BIZLbFruHIadxswgoFKCDU85BHETPzOlmB
 6LBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Sf7UxFKe3Y/0LIWjexcpC2JdFLtpHY5KwvFx7/VFjA=;
 b=rqd8FVqXUIR+yUpwS+mUwVj01tiCNSdLjajq5rZv4RXm13bNgY1RxgyggBZxuFFvgH
 KBpAKMknNKKS97+dibnjIUxbHoK1TJ0mIL/KsNDFX0gl+5ppG54xJZlOZiWhuViQ9INm
 l420CraXN4jf5Xb3Hjrrd0oPbg92eRDTPR1A0BaBNDKCBMTyXMklO2NuRG55+9m/3wXP
 p84/U+Y8AdspqGTVi6GHfix+I3NswZWf4ITfY7eSSE+BsXdgT8m3jnYthxJuWvm1AsCw
 daE9aUbQ61cC0one2NWllH+WO9hMadTjuqaukKB0A0BmXYsOG+5QLGYr5mti7mhIS51H
 XeEw==
X-Gm-Message-State: AOAM530pDslfB7QGSM36bobVowJa9qjDaK2BH+TzqEzZZFa1PXe1zGJ/
 pCNPiHqbsy0HmzgjeeS7vie+3A==
X-Google-Smtp-Source: ABdhPJz6d+j7wki717P/WkT8b7Lqmx9P4yQ4dPmJKhA70mj3ZUr77wv0gL0gUdiALFkMDnci8VO2oA==
X-Received: by 2002:adf:b1db:: with SMTP id r27mr4599002wra.125.1610734423051; 
 Fri, 15 Jan 2021 10:13:43 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:42 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 17/40] drm/gma500/intel_i2c: Remove superflouous parameter
 description and rename another
Date: Fri, 15 Jan 2021 18:12:50 +0000
Message-Id: <20210115181313.3431493-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115181313.3431493-1-lee.jones@linaro.org>
References: <20210115181313.3431493-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/gma500/intel_i2c.c:108: warning: Excess function parameter 'output' description in 'psb_intel_i2c_create'
 drivers/gpu/drm/gma500/intel_i2c.c:153: warning: Function parameter or member 'chan' not described in 'psb_intel_i2c_destroy'
 drivers/gpu/drm/gma500/intel_i2c.c:153: warning: Excess function parameter 'output' description in 'psb_intel_i2c_destroy'

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/gma500/intel_i2c.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/intel_i2c.c b/drivers/gpu/drm/gma500/intel_i2c.c
index cb92f24e6f1c5..5e1b4d70c3171 100644
--- a/drivers/gpu/drm/gma500/intel_i2c.c
+++ b/drivers/gpu/drm/gma500/intel_i2c.c
@@ -85,7 +85,6 @@ static void set_data(void *data, int state_high)
 /**
  * psb_intel_i2c_create - instantiate an Intel i2c bus using the specified GPIO reg
  * @dev: DRM device
- * @output: driver specific output device
  * @reg: GPIO reg to use
  * @name: name for this bus
  *
@@ -145,7 +144,7 @@ struct psb_intel_i2c_chan *psb_intel_i2c_create(struct drm_device *dev,
 
 /**
  * psb_intel_i2c_destroy - unregister and free i2c bus resources
- * @output: channel to free
+ * @chan: channel to free
  *
  * Unregister the adapter from the i2c layer, then free the structure.
  */
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
