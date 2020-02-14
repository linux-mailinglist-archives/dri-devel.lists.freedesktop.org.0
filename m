Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ECE160CDC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A57C6E546;
	Mon, 17 Feb 2020 08:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3446E877
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 20:48:54 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p17so12150425wma.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 12:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9zl/VqdzmiPXGS2EfIZ6zNuhTKk8iOu4+THisxEUJVg=;
 b=R2uzyv7wdD+UjuGOUJHWfi+Rj8T/w15OgnBnn097gy8xwIH7b5un7irySmGW5jPmJc
 fCIn//Px6DD2mEs3+0GxEMGF8Yy8mYpWsQ2HjL9qTg1hT+2O0qSAN6H49gBIZXh3COw/
 s0bD/pu6f2SGQrhKMqIdlUfpkuMnUugMjQTPHc3iJRDwVUhNiiw0XZKdHH9IVa/3kMaf
 nFjRgsbNy8b69WhwepV5Hll/vS+Rc3e05cvNWY5MwnxsivNKV3bYCCOY/39JqGno46ZM
 ywgLfyUodI35W+uU+NMeJa2kOPfhSU+RfCDAwa6/QsurhhYn/Jv9JgiGjTgQY1bswgGQ
 Ms/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9zl/VqdzmiPXGS2EfIZ6zNuhTKk8iOu4+THisxEUJVg=;
 b=SxPsgZxNEHslND8lfbEfhQZVwiNg7ZdwcA7DrMHRKuqP791gRAIv129fDHlSX+CYSf
 7HJQZTv9LOVhhb+5Iwi2ZdO1BW2Y/Y855Eb1G4zG3Gyjvr43HwbsC8s7AFX1Axl7PJA7
 gNv9zNhTJmKucQBb/5xl2ELpmMHgPGJJr8Lr5ZK9FhhXEDzdGPdtgEWE3hWD0LLF3ASU
 rPgYZvzqNRHE5Pu8cTY+caebT2eZiX50ygycTGRWd+zp4Q+lkGgyoX4ywi8kWv06lIqD
 dNUE24GQSooL+h4rZJHfetIGg+b4Giztq7BDwGYFn3ohtAkYgEZbbee5ZH/C5TxBfl/v
 ESew==
X-Gm-Message-State: APjAAAUFobHT/JChJFfSTCLzpkexwOtAxSy+WU7UFZYB0VZtpFzv1KBB
 1KdAqeAzwINxcktuW0hmGg==
X-Google-Smtp-Source: APXvYqxE4wd3GjldXk/dFA8BrNt8N6M2a/YsR2om9aOlsCst8rFuL+8NlasMBvlW7q3OZWqaoWtwTg==
X-Received: by 2002:a1c:9c4c:: with SMTP id f73mr6208115wme.125.1581713332763; 
 Fri, 14 Feb 2020 12:48:52 -0800 (PST)
Received: from ninjahost.lan (host-2-102-13-223.as13285.net. [2.102.13.223])
 by smtp.googlemail.com with ESMTPSA id y12sm8660782wmj.6.2020.02.14.12.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 12:48:52 -0800 (PST)
From: Jules Irenge <jbi.octave@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 17/30] drm/vkms: Add missing annotation for
 vkms_crtc_atomic_flush()
Date: Fri, 14 Feb 2020 20:47:28 +0000
Message-Id: <20200214204741.94112-18-jbi.octave@gmail.com>
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

Sparse reports a warning at vkms_crtc_atomic_flush()

warning: context imbalance in vkms_crtc_atomic_flush()
	 - unexpected unlock

The root cause is the missing annotation at vkms_crtc_atomic_flush()
Add the missing __releases(&vkms_output->lock) annotation

Signed-off-by: Jules Irenge <jbi.octave@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 7513be6444ae..bc0ac2641220 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -231,6 +231,7 @@ static void vkms_crtc_atomic_begin(struct drm_crtc *crtc,
 
 static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 				   struct drm_crtc_state *old_crtc_state)
+	__releases(&vkms_output->lock)
 {
 	struct vkms_output *vkms_output = drm_crtc_to_vkms_output(crtc);
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
