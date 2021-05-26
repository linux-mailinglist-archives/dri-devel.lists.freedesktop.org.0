Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B61D43912E2
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 10:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F496EC4C;
	Wed, 26 May 2021 08:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A096EC3C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 08:48:08 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r10so173697wrj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 01:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t1FEEZ6P0S4l/25hBadFVgOVdkrL3aHOBAeW0vMC5CA=;
 b=zfhh2O6P8DylNjUuy1kAnE6HCVfcj23pKW4MI4X3zCxipAtycmlxMCpGLJEDvIXUWW
 LD6HVf3BT+Ps/iZ5CVJR3AaB6fmApN8qkHBuzls0+EXNDrOE5WkasQeAy00bgmffHV+V
 BAKy4ziCI7YVymwUrqeswepb4mOTa4CDPlcDKr2yYY8SBwNpIFEe87HqreB3sOyz9zmj
 cmLs943uswyNh0+VxY1t/kZ1qWjfayz9dLd9OS4GhQ1zscL6CVhoS3JhEH2OamRiSe0+
 /b+UyjY43ON8f/fBGr785HlD4TWqXuV+NmARfDvjEhyXo3PhtFep7q6BWCtl/niBz5Id
 ihgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t1FEEZ6P0S4l/25hBadFVgOVdkrL3aHOBAeW0vMC5CA=;
 b=AxN7ZzHBiVAlrUarVbrfddMKXrtmiQfFpyXf6cj7u6OtO9O5e0evI3cT/G5S9CEYnH
 c9F7eD6bp3YEGtGrM52PZYlNhNnQgJFnmLC0j0i/c1f0xFXnFHcd+POH1ds8wi6sObZV
 fMk9HmXBUMH4rxFZqaxsQGbU/sW08tPE0yFvNbPhUIhIcFXhVFaRFRVjppuNK4xdiQdy
 HKLgyPJMIQ6CEBXVyWJOmiMv+owWsTC0y728JQ5QyqHvoaukpanvVeLZ6GGbTLU9i6tB
 yGS5ZH7nq+ZY8Ccz8SIRIeJMVFRIW2JVJWQtND+d2WZuSd856Q7MWM0qmTVZU+GOqGaY
 2jyg==
X-Gm-Message-State: AOAM532DhUldtm5hTOOEBe7T88Grk9uUVSzgjcuvkK2+UtDEpke+l2AP
 ltYrgAB+XH6MXH4cJq8I09U3NQ==
X-Google-Smtp-Source: ABdhPJxGXwJgROU3bwZTUbIFx7pkLuSuNxFOiW93AfYV3f4AEdnue+CYugHm9C0HVHvuuVYMdhN1rg==
X-Received: by 2002:a5d:4e8c:: with SMTP id e12mr31666122wru.94.1622018887659; 
 Wed, 26 May 2021 01:48:07 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
 by smtp.gmail.com with ESMTPSA id l18sm18911918wrt.97.2021.05.26.01.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 01:48:07 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 33/34] drm/vboxvideo/hgsmi_base: Place function names into
 headers
Date: Wed, 26 May 2021 09:47:25 +0100
Message-Id: <20210526084726.552052-34-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Hans de Goede <hdegoede@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vboxvideo/hgsmi_base.c:12: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/vboxvideo/hgsmi_base.c:42: warning: expecting prototype for Notify the host of HGSMI(). Prototype was for hgsmi_send_caps_info() instead
 drivers/gpu/drm/vboxvideo/hgsmi_base.c:74: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/vboxvideo/hgsmi_base.c:102: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 drivers/gpu/drm/vboxvideo/hgsmi_base.c:174: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vboxvideo/hgsmi_base.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/hgsmi_base.c b/drivers/gpu/drm/vboxvideo/hgsmi_base.c
index 361d3193258ea..8c041d7ce4f1b 100644
--- a/drivers/gpu/drm/vboxvideo/hgsmi_base.c
+++ b/drivers/gpu/drm/vboxvideo/hgsmi_base.c
@@ -9,7 +9,8 @@
 #include "hgsmi_ch_setup.h"
 
 /**
- * Inform the host of the location of the host flags in VRAM via an HGSMI cmd.
+ * hgsmi_report_flags_location - Inform the host of the location of
+ *                               the host flags in VRAM via an HGSMI cmd.
  * Return: 0 or negative errno value.
  * @ctx:        The context of the guest heap to use.
  * @location:   The offset chosen for the flags within guest VRAM.
@@ -33,7 +34,8 @@ int hgsmi_report_flags_location(struct gen_pool *ctx, u32 location)
 }
 
 /**
- * Notify the host of HGSMI-related guest capabilities via an HGSMI command.
+ * hgsmi_send_caps_info - Notify the host of HGSMI-related guest capabilities
+ *                        via an HGSMI command.
  * Return: 0 or negative errno value.
  * @ctx:        The context of the guest heap to use.
  * @caps:       The capabilities to report, see vbva_caps.
@@ -71,7 +73,8 @@ int hgsmi_test_query_conf(struct gen_pool *ctx)
 }
 
 /**
- * Query the host for an HGSMI configuration parameter via an HGSMI command.
+ * hgsmi_query_conf - Query the host for an HGSMI configuration
+ *                    parameter via an HGSMI command.
  * Return: 0 or negative errno value.
  * @ctx:        The context containing the heap used.
  * @index:      The index of the parameter to query.
@@ -99,7 +102,8 @@ int hgsmi_query_conf(struct gen_pool *ctx, u32 index, u32 *value_ret)
 }
 
 /**
- * Pass the host a new mouse pointer shape via an HGSMI command.
+ * hgsmi_update_pointer_shape - Pass the host a new mouse pointer shape
+ *                              via an HGSMI command.
  * Return: 0 or negative errno value.
  * @ctx:        The context containing the heap to be used.
  * @flags:      Cursor flags.
@@ -171,9 +175,10 @@ int hgsmi_update_pointer_shape(struct gen_pool *ctx, u32 flags,
 }
 
 /**
- * Report the guest cursor position.  The host may wish to use this information
- * to re-position its own cursor (though this is currently unlikely).  The
- * current host cursor position is returned.
+ * hgsmi_cursor_position - Report the guest cursor position.  The host may
+ *                         wish to use this information to re-position its
+ *                         own cursor (though this is currently unlikely).
+ *                         The current host cursor position is returned.
  * Return: 0 or negative errno value.
  * @ctx:              The context containing the heap used.
  * @report_position:  Are we reporting a position?
-- 
2.31.1

