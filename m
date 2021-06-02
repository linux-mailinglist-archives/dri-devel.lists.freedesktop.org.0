Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2403B398D01
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 16:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 837576ECD3;
	Wed,  2 Jun 2021 14:33:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E193E6ECCD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:36 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id o127so1445757wmo.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t1FEEZ6P0S4l/25hBadFVgOVdkrL3aHOBAeW0vMC5CA=;
 b=nVd+6txbGTkvd96oaTKfulBS8JwdcjwEWSIdrGauDfuARuO8ZRkTn5cTMhfdV6roe/
 cwP6oO1NmBUt8tuY0zeyaNsQEFZqw1HpHYvfsM1GHddzEOe3Ks+SLzyV/BmZxgFR3Y/j
 adKn13qmTK8EYIIfEKpiTryxiYMPefvNxH1uQMoK7to9/l3I6opm9WKt8BYa5VzcxUug
 zt9Rl6tsSESUE5RozQ/us7RYglBBX9AXrcQRfvLqcAuM/cLbWyOB+grqCDYSNzwibxnO
 P8jt2qL3RrOVVj8Lyfq+0yrt4uigX2fLTFeIvrUrxuYmpvA8cjeygpsiaeCO9Hpg+t2y
 u+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t1FEEZ6P0S4l/25hBadFVgOVdkrL3aHOBAeW0vMC5CA=;
 b=JFz6sLvtY8c0tOeNN8AJ+RLywEMCT0PEARgEoreCMuY42Wu47smXEy+mRJ1stndz3t
 kgk1lz2Jx/+IDDMZGCJX8zYUYrN4HhSi3ccfjHpAkmYor0o86jfBO50vdWDHggJl4/ot
 ti1tot5/FGgtT+5nhKz2KgIFUGfqrx/X5FMgyZKMvXLJYq+JffwWwQ6FM6dAajhtHhbv
 uCsNFlTHQlKHs5hZEb8BJbCGuZjHrExSUDP5dkU0CDr+XlfEWSvUO5YV/bi1mKSenvbG
 aW5kUYokjrZL2+oQmLEjAMP2p7WLj1SFrgphYVW41xr2ZGzWG6JfkWasEWVC8oFKH1hn
 UDrw==
X-Gm-Message-State: AOAM533210m4me/M9ICQ1KJz/hIOQ3FbLfMSQLuhMvXTCHUeT2FQqXB0
 rLAlVBKWHsFxxwEInyEHAE1btt6AcMwx6Q==
X-Google-Smtp-Source: ABdhPJwkxJ/qPJiDi8CqvBhmwrZs7KTAO5sO/q0DxkmixOUPMnRCW0Ho6IQbwT/mlBfpFSag196fSA==
X-Received: by 2002:a05:600c:22d7:: with SMTP id
 23mr5327853wmg.119.1622644415687; 
 Wed, 02 Jun 2021 07:33:35 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:35 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND 25/26] drm/vboxvideo/hgsmi_base: Place function names into
 headers
Date: Wed,  2 Jun 2021 15:32:59 +0100
Message-Id: <20210602143300.2330146-26-lee.jones@linaro.org>
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

