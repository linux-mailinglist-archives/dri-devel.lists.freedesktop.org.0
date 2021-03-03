Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3EA32B837
	for <lists+dri-devel@lfdr.de>; Wed,  3 Mar 2021 14:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2896E926;
	Wed,  3 Mar 2021 13:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14496E906
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Mar 2021 13:44:06 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id l22so5230856wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Mar 2021 05:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tmSWc9lSX8plC+W5s/fzd/gmEeVkpduD+/cr5gvR47U=;
 b=XG9g9GqcUfSvxhKZ3LXb18saIpgWwFds4iItiADLUMMHBM00te+esEhv7OYwz62YS2
 ZVXaG5uHxzk3+7ib+aQ1hfw+dx5mg2ohpnRw6S7Zgo51DC1RG/BJ6VkL6d8IzEwNchUG
 MLXBaQoleIiBHUZanNQJFIJD15MSH0bP+V/kKXMn0FcIuyeK/pscQ1iLvqWs6FopfsK8
 BBPkuMQYZkq+FIvdehyn+ZmXrSCtpep1o7Xk5wX1lAZKkgtmQq8o7m7VERTrLRii1Y83
 czQ5lbvifM4mqqyMn1QNeZOHJL2qfhdIpc9chnfmKHEY0lFgjeTJADscLImG+tswDopd
 IytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tmSWc9lSX8plC+W5s/fzd/gmEeVkpduD+/cr5gvR47U=;
 b=R3kVQUTjXtf/AtpyFmewEVt2Stb7Jm3W3n59qsDvzjXhN0+uxJA+LMM73u+YOoXVpQ
 y1J4Gf+QMqaK4o/Kk2NrNYRCUzW8szdfkUje3trYWkK0OmVyRvxzt+nvZz/lHlx4fnBt
 2iEKINKuNx6ceqGDURs1kzxpNqpFVOVnqAOnefyxsFV+wxgx+Wo9xrCrG22sO3GiZ0AG
 ZdH8uUVobK7NIjKVE2lCnNd0KaJntSLZIW7y5/6/3AgdK0OFHQs5helD6tMXDuFpX0R0
 wS6s9BNsH5KW1dgaR+NSPhGN3Y1waQCHWdscZsFdUqrLmzwO6reoqjvpmGCkljtUhGAy
 su4Q==
X-Gm-Message-State: AOAM5333GTnFJpPUjG3r7+EXM3u+gK/0BrCNn4TI3Ps2U1++sTdlSCw4
 Ccj7a0tsb43rfiSdVTWBHrVoVg==
X-Google-Smtp-Source: ABdhPJwFgTcETayyMMWtzZVDN6UJAXq0mvasuXRA0M8p4u4vBy1m9KLvRyxeigxIOdfyIIWoARHaBw==
X-Received: by 2002:a05:600c:289:: with SMTP id
 9mr9317471wmk.135.1614779045399; 
 Wed, 03 Mar 2021 05:44:05 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:44:04 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 31/53] drm/vmwgfx/vmwgfx_ldu: Supply descriptions for 'state'
 function parameter
Date: Wed,  3 Mar 2021 13:42:57 +0000
Message-Id: <20210303134319.3160762-32-lee.jones@linaro.org>
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

 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c:55: warning: cannot understand function prototype: 'struct vmw_legacy_display_unit '
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c:218: warning: Function parameter or member 'state' not described in 'vmw_ldu_crtc_atomic_enable'
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c:228: warning: Function parameter or member 'state' not described in 'vmw_ldu_crtc_atomic_disable'

Cc: VMware Graphics <linux-graphics-maintainer@vmware.com>
Cc: Roland Scheidegger <sroland@vmware.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Zack Rusin <zackr@vmware.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210115181313.3431493-14-lee.jones@linaro.org
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
