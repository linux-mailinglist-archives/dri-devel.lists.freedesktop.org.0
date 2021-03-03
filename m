Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DB632B83D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71A56E96F;
	Wed,  3 Mar 2021 13:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B810F6E906
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:12 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d15so8499518wrv.5
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9r1GQwee06HjD/ZuKzpJIH+jsbPeQe25QbvmJPlwsC8=;
 b=VeTo2b9j29UjrFvzdkFremTLs30Tgspf+4bLewOxS6oxCoibyoixpRWImY4tDNfArA
 mXFJYt5mb1NbqG4WWSiTZlJeNQpLg13sA/LboTN7FlfiP2c3CSh2Di+mLEjuF75LfgQc
 Igq8JaCD3A+j6emMVuTYJnRlsrE3gKaWU5orKL0Bpms/5BOWs+x7+/pGrR5s1N9DomxL
 tSw0RrAKY8y6agcfGqRqwDnNDn50hjb0HwymvixPEZmaY8u1WE8tuuhpLlRIGaebK7HX
 M5Ig1I5QsPlSTMQFlaqGB16FS2QX46ORiLdi6DgyH0Fv/CG5FVCkNen9faffd4DD4Pwk
 /JgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9r1GQwee06HjD/ZuKzpJIH+jsbPeQe25QbvmJPlwsC8=;
 b=EdnPaLMgGMwVsY5nb3VlPcpDho4U1EbO+I9Cwo+xzcIduUxfju18fIRDtWP1r8xyQR
 dYT9UcMtKU/lCcTbK+mRcy9hsHvGMLrgTl+4MSTQdd8mRRgvUucfXe+Z6SZ6NUp6FdW7
 RXxCfam/IFIlODL8rpGYeniwRX8EeIzuWjsQXvP9Eq/r4Nie1otlyMpVT+C5Kkpss5E0
 YbrwvFyj8GNnoVVY4k+/mUxpyA1YphNdBswAW7zAXEkbtApdjD24Ts5Pleq5wcj0J1av
 sKpmfie4EktQ2+2j2wOifLHgrqA/Hska5v7eX/mZN8/os6oMqrEpDkOQKH5dh6cgwhOx
 TjUw==
X-Gm-Message-State: AOAM530RiS8ixm1CTWXnkmnOR1x9Ml62CAm9fkLjx4a7LINzGTGoDloB
 +lpjcAx29iLmuiCDbAhbYaXdMw==
X-Google-Smtp-Source: ABdhPJwYpxI750hNt2KrGWilNdo3e5J7cGOuMzdHBB2+G/Fw3234QX8Bqx5eq6K9fw1ZNRbdR1gfIw==
X-Received: by 2002:a5d:6042:: with SMTP id j2mr28095491wrt.336.1614779051401; 
 Wed, 03 Mar 2021 05:44:11 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:10 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 36/53] drm/vmwgfx/vmwgfx_context: Demote kernel-doc abuses
Date: Wed,  3 Mar 2021 13:43:02 +0000
Message-Id: <20210303134319.3160762-37-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_context.c:121: warning: Function parameter or member 'dev_priv' not described in 'vmw_context_cotables_unref'
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c:121: warning: Function parameter or member 'uctx' not described in 'vmw_context_cotables_unref'
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c:681: warning: Function parameter or member 'base' not described in 'vmw_user_context_base_to_res'
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c:707: warning: Function parameter or member 'p_base' not described in 'vmw_user_context_base_release'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181313.3431493-29-lee.jones@linaro.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_context.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_context.c b/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
index 6f4d0da11ad87..4a5a3e246216d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_context.c
@@ -112,7 +112,7 @@ static const struct vmw_res_func vmw_dx_context_func = {
 	.unbind = vmw_dx_context_unbind
 };
 
-/**
+/*
  * Context management:
  */
 
@@ -672,7 +672,7 @@ static int vmw_dx_context_destroy(struct vmw_resource *res)
 	return 0;
 }
 
-/**
+/*
  * User-space context management:
  */
 
@@ -698,7 +698,7 @@ static void vmw_user_context_free(struct vmw_resource *res)
 			    vmw_user_context_size);
 }
 
-/**
+/*
  * This function is called when user space has no more references on the
  * base object. It releases the base-object's reference on the resource object.
  */
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
