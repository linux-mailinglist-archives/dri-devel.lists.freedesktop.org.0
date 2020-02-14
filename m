Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0B4160D08
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:22:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1366E8B8;
	Mon, 17 Feb 2020 08:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396056E877
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 20:48:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b17so12168865wmb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 12:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=by2xd4xQmUHlU9s/C95WpmrUhX2m+ztyFaDW+ePPigQ=;
 b=UCK3dCriT7/8DChoNsIE9klpclhewfP+byj/lcpxFKeokvg47rKoszURR8QihMXMJT
 fgCML7aTZQfzFOPnXhwwrFzTqnGtNKYiNum5LYoYD2M4LnF+F4vJycMs+yHeoQZnRZQO
 HY2Yz2gH3bPVzbTKeydlGkOC27vzJ9sXRevBxXZEP6oPFREWdzFCIkeKDUiQrX7gEgv+
 Xdua7WuafmFFjVi54WBGRaS9rag1Y8qvLNO/a51GeD0AhCasNFmbTgjC0XW993CMQyRZ
 jbYDuE8GmJj6f/MDc4f5L4P+YGv8uF+5eF2FBHwc2TRmW3MF4SuDkFHbtJ4Il04gWrlV
 7RHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=by2xd4xQmUHlU9s/C95WpmrUhX2m+ztyFaDW+ePPigQ=;
 b=BUEG9R7U52tTKZsV5qSsoJc905x6eQPtD0wxFbRBztd9S4Ll6Ub20hsIrFRBlf1jGT
 DbxmCgbOhZwgiS94j9p0gsiQFYrL28S0E9sf9TLLWgcJgL2FZIGtbCW8pRuWXfU6JC+G
 B/RbjSjI1LlZooyztcnTj2roymy/fWlEu3SQmmjEhD9wiltFpLowpOP6U3Pd3xFB7ZP7
 OA/MzxLVHP8mTjysqXjLwmMmsTH/KIXADyvJdF8fK3GlfkK2S16Zz+LB9GC0gt7lMYE/
 sdcOCoiDet2rYS/BwrWvtKwKKag0OAM4ENt5UbOsKHNHiZws0QA9SHyRt/kXznqRIHq5
 WBgg==
X-Gm-Message-State: APjAAAVCoQ65IwOWg9OVSMv00Xx6w9Xi75keYBJGMfEl7HYczq2cQD24
 YIgMCoKqDyb2YUImPYGJGA==
X-Google-Smtp-Source: APXvYqzwAXoPMm6yxZjN1IBJNGbtvAo3jdUpnfTX/lXQ9UtXXmeGE+mbP3YSkWpi9jHpOybW+N36XQ==
X-Received: by 2002:a1c:9e89:: with SMTP id h131mr6379803wme.161.1581713331767; 
 Fri, 14 Feb 2020 12:48:51 -0800 (PST)
Received: from ninjahost.lan (host-2-102-13-223.as13285.net. [2.102.13.223])
 by smtp.googlemail.com with ESMTPSA id y12sm8660782wmj.6.2020.02.14.12.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 12:48:51 -0800 (PST)
From: Jules Irenge <jbi.octave@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 16/30] drm/vkms: Add missing annotation for
 vkms_crtc_atomic_begin()
Date: Fri, 14 Feb 2020 20:47:27 +0000
Message-Id: <20200214204741.94112-17-jbi.octave@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200214204741.94112-1-jbi.octave@gmail.com>
References: <0/30>
 <20200214204741.94112-1-jbi.octave@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Jules Irenge <jbi.octave@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, boqun.feng@gmail.com,
 "open list:DRM DRIVER FOR VIRTUAL KERNEL MODESETTING VKMS"
 <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sparse reports a warning at vkms_crtc_atomic_begin()

warning: context imbalance in vkms_crtc_atomic_begin()
	 - wrong count at exit

The root cause is the missing annotation at vkms_crtc_atomic_begin()
Add the missing __acquires(&vkms_output->lock) annotation

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 74f703b8d22a..7513be6444ae 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -219,6 +219,7 @@ static void vkms_crtc_atomic_disable(struct drm_crtc *crtc,
 
 static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
 				   struct drm_crtc_state *old_crtc_state)
+	__acquires(&vkms_output->lock)
 {
 	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
