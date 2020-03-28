Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74579196647
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 14:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3E96EAE5;
	Sat, 28 Mar 2020 13:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9736EADF
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 13:20:40 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id e7so10145263lfq.1
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 06:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AW5jj+hlFMCTr5jriPQbvhjeXlemxARSm32MfwE0ip4=;
 b=Uy1tA3YAGCC+8JsVh0+fTh4P1lk/O03uFCDAUbd9OIy0AykWpNHkg3sDcGA9Hk/uj8
 x7KEyVOAP8WiqxYxj5jI7b84M+waVaDz7Q7DwL9v9CmHeL66/Jj/5VGxU+Mu8gQyBiud
 3RE9LQd6pJypAbAjuFhIp2uiRFzndPXiCXoDorq35AKwYd+7sR/xDz66QD1qkvRxudeP
 4nDnfeBKV/a/+xEU293goMlv0Z3p95X2W8nm/MwyAjTw/v345KKluXYt2vOkaCJh738F
 l5aE4rqCTr924XjUPvDJVllwRN0dHER7E/NErZbfGlTBYeTY4ChkSjPAxyXCNQDopQ5J
 n/mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AW5jj+hlFMCTr5jriPQbvhjeXlemxARSm32MfwE0ip4=;
 b=Q78lvwXPvSqvYjEBwcoIBuGsIclLhdK9gdUv21UXNKGvcKVgtB0es9FyhhXeyP8TOe
 bKntCiex85E0GJhVQx1gDn85DkiCAdQ0/47q4qeax9no6oFJkdXaQrFN0uiyss3caUxW
 MgI4lV/SyZQPIUGOKX4jv+LcrFs0UIyelNCUyh31mZbW0wIvdfani3wxKp+wkW9J70Yu
 wxIGCCCV9EydMnx3nKX0rDYTuRu+y8s9IWxpxbpcLpBGmTXgiDc1EN4GTqsURTeOKrB5
 5hPtNHJeHQH4zER2ltykb7JfW0Tm11//5RnlrYfsV1BgBjX6oFfSVcydrxPm+bGdPJ7w
 O3vQ==
X-Gm-Message-State: AGi0PuZOO3DREgSF9TpzgoPlP9XNa3kkL/QKrTA8V/L0uDoai7tVlO0z
 XzbxYLapblmXjT8t5nVMJ9WeVyhsBHA=
X-Google-Smtp-Source: APiQypIYRiPYtR7GazsMwHa2wo53QcTN6HUSaYYyrb+YHloo2ut5x5HfTv4LW3lC2xfPAHmY7UYIgQ==
X-Received: by 2002:ac2:484f:: with SMTP id 15mr2648950lfy.3.1585401638309;
 Sat, 28 Mar 2020 06:20:38 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 j19sm4542916lfg.49.2020.03.28.06.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 06:20:37 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH v1 2/6] drm/fb: fix kernel-doc in drm_framebuffer.h
Date: Sat, 28 Mar 2020 14:20:21 +0100
Message-Id: <20200328132025.19910-3-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200328132025.19910-1-sam@ravnborg.org>
References: <20200328132025.19910-1-sam@ravnborg.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <liviu.dudau@arm.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Nirmoy Das <nirmoy.das@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 David Francis <David.Francis@amd.com>,
 James Qian Wang <james.qian.wang@arm.com>, Jonas Karlman <jonas@kwiboo.se>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix following warnings:
drm_framebuffer.h:342: warning: Function parameter or member 'block_width' not described in 'drm_afbc_framebuffer'
drm_framebuffer.h:342: warning: Function parameter or member 'block_height' not described in 'drm_afbc_framebuffer'

Trivial spelling mistakes.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Fixes: 55f7f72753ab ("drm/core: Add drm_afbc_framebuffer and a corresponding helper")
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Emil Velikov <emil.velikov@collabora.com>
Cc: James Qian Wang <james.qian.wang@arm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 include/drm/drm_framebuffer.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/drm_framebuffer.h b/include/drm/drm_framebuffer.h
index e9f1b0e2968d..b53c0332f040 100644
--- a/include/drm/drm_framebuffer.h
+++ b/include/drm/drm_framebuffer.h
@@ -308,11 +308,11 @@ struct drm_afbc_framebuffer {
 	 */
 	struct drm_framebuffer base;
 	/**
-	 * @block_widht: width of a single afbc block
+	 * @block_width: width of a single afbc block
 	 */
 	u32 block_width;
 	/**
-	 * @block_widht: height of a single afbc block
+	 * @block_height: height of a single afbc block
 	 */
 	u32 block_height;
 	/**
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
