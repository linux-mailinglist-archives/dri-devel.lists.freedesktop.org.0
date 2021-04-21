Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BDF3673AE
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 21:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502F16E9F2;
	Wed, 21 Apr 2021 19:47:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B0E66E9F5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 19:47:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id s7so42429555wru.6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 12:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fG85dbebKoSteYYPivVE8kWXsCAyDtNNlGMTLX6zqlw=;
 b=etWKGeAx/x3qUoLi/y3SSHai4Jy9Be89Vz6wWtbp3/JpV22IOnAi8X6tLsDKoLlDMu
 NsR+OkLxq24eSdHklEDCJ8z8dTxzE65YyRJQtpK6oFhyoKgYGAvhv3V/wP8Ko0RCukKh
 kaOWNfiV3834c8INNrPmn920FQGgppAP6SRQGjXVKaHqA0wcsvyyupXwI6DY1HwtI4YM
 VKwTTeFpxsS94g0/JmmNy06vN7NeOt7a0Kq+C+kYLYzDR8DYBDVpZ/xyYW7GUp52UjLy
 dPFYBOQpKAYhfYWPLDWv00t6/kRtpcsIY8vXZgWibmTDn6uz6Xl4nQgthiFIwCPYvtUs
 Mu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fG85dbebKoSteYYPivVE8kWXsCAyDtNNlGMTLX6zqlw=;
 b=KXS/YUXoxwUy/rx58MQKV2jrhYoAs/g6E2uyI/aY0S1msV0uo8A+MGlobQrFz3gzCo
 atOJYW3YQFOObGibZWjNNwfApgUFSuKx8Aa0KEUUhg09cWpLZTzThQFENGfhwCu7Dnt6
 IuuCx9yuqglNclW/FIjCLuNcuybmaghM1PabzcLPZAWWemGhWed5h80bWQAbPpIf9zfn
 mXiqnGAO9gkUZoDpw927uvrtkhCfNQZ9DcFiV01jESTuqW9zvw4lxtSiaLu3onevDuZ2
 lQhtOWik6UgahMZloviZ+Gss+7MTDDxvNrsNqjbYIEv4+fEZOjgSzb37udWtIWEzzHz+
 CTUQ==
X-Gm-Message-State: AOAM530mFVsFjiRMYuaVlj+4Ez01n6t6FCy+nIKfGB+1ZkLIc5AYKTRt
 Rs9qK5OUmnjBr6BRAz8NcfM=
X-Google-Smtp-Source: ABdhPJx8xeSxs2+tkJWE8YUNHn4xmhjUGtPY2imH1F2SiUxoBmdMSB+rtYG4dt8hDV11lteiAjVNsg==
X-Received: by 2002:a5d:640f:: with SMTP id z15mr29104558wru.221.1619034423874; 
 Wed, 21 Apr 2021 12:47:03 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:6d3d:2d8b:5417:831c])
 by smtp.gmail.com with ESMTPSA id
 c6sm13004217wmr.0.2021.04.21.12.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 12:47:02 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 1/5] drm: drm_atomic.c: Adjust end of block comment
Date: Wed, 21 Apr 2021 20:46:54 +0100
Message-Id: <387b6b852a72d6a98133cead5e4d0e3c39dd5094.1618756333.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1618756333.git.martinsdecarvalhobeatriz@gmail.com>
References: <cover.1618756333.git.martinsdecarvalhobeatriz@gmail.com>
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
Cc: melissa.srw@gmail.com, outreachy-kernel@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new line with */ on the last line of a block comment to follow the
Linux kernel coding conventions.
Problem found by checkpatch.

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/gpu/drm/drm_atomic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 46dceb51c90f..e42d9fc5d9ff 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -385,7 +385,8 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
 
 	/* The state->enable vs. state->mode_blob checks can be WARN_ON,
 	 * as this is a kernel-internal detail that userspace should never
-	 * be able to trigger. */
+	 * be able to trigger.
+	 */
 	if (drm_core_check_feature(crtc->dev, DRIVER_ATOMIC) &&
 	    WARN_ON(new_crtc_state->enable && !new_crtc_state->mode_blob)) {
 		DRM_DEBUG_ATOMIC("[CRTC:%d:%s] enabled without mode blob\n",
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
