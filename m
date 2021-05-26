Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BE73912DF
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49FBF6EC59;
	Wed, 26 May 2021 08:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B6926EC3D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:48:01 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id x8so185091wrq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+mad90AtNlCIQqeONJLgwNjgy3qTN43q4JqhckiOfdA=;
 b=rDtWdIyU6k0Cu5EI0Xlh1Az0oi7vs4Rth10DNmiyY6J6hI++dGQgjhk0Ys7zL9Zffb
 4njHjsoCQFlwcTujCSBLYl/jQKTw9l/Fc7oYmViTqq+nSag3QAXqaW1PWbx7mA724IrN
 etOcBgE3E4D4L7jpS9zuUTeLSizvoLtiNbXFR3BYha4kSt4fXo/bc+ubcSigbUFa7J8h
 6f0XO14rRjVWzK5KGbVgkPdQICuiMB/Eth5vyt4C3DTWBpC9u7qhl5G1/EnhNo+eNPQc
 ahnftmb6732uEKdskUfq9+EkUKctnVZXLnSi7quTT+3ewG0j5rJqHVAt/3GZ2436Yldh
 tbmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+mad90AtNlCIQqeONJLgwNjgy3qTN43q4JqhckiOfdA=;
 b=pvYo/j4HLCbZhdUMXh/MpKtTSIk02YbEpl1BgiPbAj1/Ifw9lP9yDqobhoE9vELAj9
 4gecCFfJGU+1YZIO9y6orZlM5+ROSQcsZqDLZ4UtgL4ZwPFIw7dQ/hK7ZWCEl35QFY7q
 3gMJcmzLP+8JbGIxHt/JjiRSdRDr6XwP7qPUaMxT2vRMK1e9dQWIz7twHW+siu8Cmdko
 YZSWKIcLVCx/HtBUqN+l54MMTOzsgAgEGSxV6jVDZYbu6ODtFjAcWX9VBNvIEuiLSpbW
 JtUnksPFr59zoSFAxLRHC62UFdTqgAMEtFagv1N99uMFKKHfXjBhFs6Iged/cu6dZvSU
 zHDg==
X-Gm-Message-State: AOAM532picOmKUcIbqtRq8lfxwMbZCCCEm15srflo0591PSebID2Am4T
 E9pc47z3RkDxQobLwoHQ7OA4tw==
X-Google-Smtp-Source: ABdhPJy2slfQ3QCAf471u3XJ0KZjA6HRnV8JDSY7c/reI6yg8Wjtmsz0gglvZK/wgOQqkD9TjiZs0A==
X-Received: by 2002:a5d:678c:: with SMTP id v12mr32334508wru.246.1622018879881; 
 Wed, 26 May 2021 01:47:59 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:47:59 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 28/34] drm/panel/panel-raspberrypi-touchscreen: Demote
 kernel-doc abuse
Date: Wed, 26 May 2021 09:47:20 +0100
Message-Id: <20210526084726.552052-29-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526084726.552052-1-lee.jones@linaro.org>
References: <20210526084726.552052-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c:33: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Eric Anholt <eric@anholt.net>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
index 5e9ccefb88f62..2229f1af2ca8c 100644
--- a/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
+++ b/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
@@ -29,7 +29,7 @@
  * DEALINGS IN THE SOFTWARE.
  */
 
-/**
+/*
  * Raspberry Pi 7" touchscreen panel driver.
  *
  * The 7" touchscreen consists of a DPI LCD panel, a Toshiba
-- 
2.31.1

