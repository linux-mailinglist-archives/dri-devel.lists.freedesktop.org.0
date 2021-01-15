Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFC42F836A
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 19:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 074C66E47A;
	Fri, 15 Jan 2021 18:13:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5398E6E479
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 18:13:37 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w5so10180306wrm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 10:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jvyHS8XiQc1oAzz859zgo3XkDd1Co0kNwC7up5M68+w=;
 b=XhjjfcqbMACLLu1UbUwoqoD/8t48q+La60pp5xe4eCTr0EMZJnWkSTnd6IyBDzec+Q
 RHflyw7Qx5MObqDYdfUNRRhZb5tcQlDS93CBk9n8BvSp//3B3HXS7yDQ20yIBhpDjm7J
 CJecEL0ZPE8v+KQyGPehSrFI59nJ68dHfp6WhLpKaprgpNczqjT2o6uR2IhUfx7Oi11t
 SHGVxSBkHz1lL/PVJIlI2NtCTuHfxTPAzO+7XDJYkI017xs7WIYnJz9Of+IQrLWENyS9
 LWVqRaqiy+jGvXeOmpQa99Xoe8wK0qekcEgWyk62TXSV6S75tLeGP5zkpNenv8umJU4L
 rIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jvyHS8XiQc1oAzz859zgo3XkDd1Co0kNwC7up5M68+w=;
 b=Awp54PYaWpOKP4NvDnmnStHhmX/bnk83VOqek+SxbEu4TLKCO47HcjsCL4ZiKDN+kd
 +ltPCqGbqaxQWO0jyOAb6P5qnhkSePYYYriQmLsCBavCvrB7/xqDJ/WFOXkQwrBEu4Jj
 Zafc5m0olBUeWta8+s7WXRb6OBf5Oky2cT8PdAnss4boN5GOuzVsur6ZA5Rg3B1QeHPg
 /7mMoloudZbpqnqG5S1OIgCBObzZiFfSQf21uZfC2lpGhxP4SQmaLcMn7jJl/krQR8lF
 BZOcaaBhMQBVluWAB9VLBCqlUShd1IIDcL/tVfLKzBI58Cf6UJePSRAhZJFKXEPHOYj9
 6WVw==
X-Gm-Message-State: AOAM530PSre7qi+nnlhkGxkJrqUuasbIxoFFBH86W4XyLXaZ4QRd/m1P
 9Mp2vRBfOuC7ZCT1hxo7SNu9Gw==
X-Google-Smtp-Source: ABdhPJzM3pePojoBobuolex7+uztZaeYfeUOxi34s4vdEqInkukJV1C7p5vxVqa/UR1IIxgjiE02JQ==
X-Received: by 2002:adf:902a:: with SMTP id h39mr14398191wrh.147.1610734415837; 
 Fri, 15 Jan 2021 10:13:35 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id j2sm16123484wrh.78.2021.01.15.10.13.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 10:13:34 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 13/40] drm/vmwgfx/vmwgfx_ldu: Supply descriptions for 'state'
 function parameter
Date: Fri, 15 Jan 2021 18:12:46 +0000
Message-Id: <20210115181313.3431493-14-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c:55: warning: cannot understand function prototype: 'struct vmw_legacy_display_unit '
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c:218: warning: Function parameter or member 'state' not described in 'vmw_ldu_crtc_atomic_enable'
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c:228: warning: Function parameter or member 'state' not described in 'vmw_ldu_crtc_atomic_disable'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
index 9a9508edbc9ed..acae92a07f4f3 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c
@@ -49,7 +49,7 @@ struct vmw_legacy_display {
 	struct vmw_framebuffer *fb;
 };
 
-/**
+/*
  * Display unit using the legacy register interface.
  */
 struct vmw_legacy_display_unit {
@@ -206,6 +206,7 @@ static void vmw_ldu_crtc_mode_set_nofb(struct drm_crtc *crtc)
  * vmw_ldu_crtc_atomic_enable - Noop
  *
  * @crtc: CRTC associated with the new screen
+ * @state: Unused
  *
  * This is called after a mode set has been completed.  Here's
  * usually a good place to call vmw_ldu_add_active/vmw_ldu_del_active
@@ -221,6 +222,7 @@ static void vmw_ldu_crtc_atomic_enable(struct drm_crtc *crtc,
  * vmw_ldu_crtc_atomic_disable - Turns off CRTC
  *
  * @crtc: CRTC to be turned off
+ * @state: Unused
  */
 static void vmw_ldu_crtc_atomic_disable(struct drm_crtc *crtc,
 					struct drm_atomic_state *state)
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
