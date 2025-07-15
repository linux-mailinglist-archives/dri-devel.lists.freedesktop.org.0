Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E42A2B0585B
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 13:04:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8112B10E583;
	Tue, 15 Jul 2025 11:04:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZIIWf51X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F4A210E583
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 11:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752577494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GUTEx4OQ+iPu+/+Q/wKZm/HJQyZUITrMttNxYEYt9Oo=;
 b=ZIIWf51XOI/BPandQEQWFnV7W5hSktspK5vaAHt5xMwYGQ90L8Nzvr44tPcTtyfYDOOO+O
 tVOZLaSsO1iYkABb+MJwfoeQOwhO0JcueUILUAP7DS+sQX3ePdAm+05n1XnoBKD2o4xR7T
 ttVG1wyb4+T3USko+e+70+Pt2Vb+KeM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-bgEiVMXePfqsrSqvOsW5aA-1; Tue, 15 Jul 2025 07:04:53 -0400
X-MC-Unique: bgEiVMXePfqsrSqvOsW5aA-1
X-Mimecast-MFC-AGG-ID: bgEiVMXePfqsrSqvOsW5aA_1752577492
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-455f79a2a16so30554085e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 04:04:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752577492; x=1753182292;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GUTEx4OQ+iPu+/+Q/wKZm/HJQyZUITrMttNxYEYt9Oo=;
 b=r8NBmjfKTi1kqmEDbSxkV0fDMYgMkByqa9xrNWGf8uMrHZHkUk7f9s/BPVZ2vSR4bM
 8URYNe/kXVRIuW53C9UvifFdSvX0KvCgzuhTDavzSFSMF/8dsxPXtsgN0uWP9oqHGs8t
 Slx7NWZlkA+EnqvkYGYx2HkHzdgqAi3RP7WUJ+RX62VWf6ek7CIcICtoJHmg2/9uPZvU
 IKeCpZUDYZLETuqinKzcoMrSNTjEAUjEaBZSKWKCTs8/jWRRKU87bXHtIrcqZQPLyCoX
 SBJaxYVgi9jC01FyBtOo4q6kJvMnUZ0yirSj/2lOnCUZeNAcaZiqvvqH/ZdH4KvKDgEF
 /Iig==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6pdcxHi70N3MGZAM2JeMkKyUHIpItSdU/wJSpoiho1KWpkYQh6EWwvIUffDoDLFv/lsRrsW1IHLE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzjpp9I+RqdNeqG3ki5dQkU6XMRCWLaKtG5K118y9ZbudJ+wg3F
 eKjmmOuG9u776AbV6qgcoszXDyNGTEnOGhuFx812Kh8XKd/0a3bWm0ODbF9D5R7+12ci08kqEdE
 wBUZHArNqni3fbMFbFdHlwKKQIMOEx25ui7mruaLO+hDj+eYlX6J6SPQX+XwcJnyfBGSzwJCDek
 BePQ==
X-Gm-Gg: ASbGncvfOWEy7JoDXPFeU18BM7RuzFBkvuetc/wxRmrQasJn/evLCXijBCNMsRNq8LD
 Lw461cdZgM7vAkYO9TOrwAFN+epBI+J604vwc9XRc5cYR67PgWqQQoWe8W+cMmqiD0Wd6wMk8A/
 3xbNAsZ7J6I5zIV9ijZxvbSEjRBNcQ9UcTRPqtea9c6h/qp6rdSSnBqHomNnttL7ZkA8J5nmhdj
 TDwdIurL6HsXROpOIjbyNy0oInLR6BUdb8CT2UCRhzxRjx7pmJ3USLbWwYsT1J93XKLrnYR6zVV
 YUlMVsIVTS6aos0w4KfeZqcimmSi/uRL
X-Received: by 2002:a05:600c:19c7:b0:455:ed0f:e8d4 with SMTP id
 5b1f17b1804b1-456272e0dcdmr24887595e9.10.1752577491989; 
 Tue, 15 Jul 2025 04:04:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmwDbcGpQzV7o4wqwdcJGo0K3alKOX7KRNvEVVhHGrglQiohTq2M8WgJ8ZVBcysc2DXDnXhg==
X-Received: by 2002:a05:600c:19c7:b0:455:ed0f:e8d4 with SMTP id
 5b1f17b1804b1-456272e0dcdmr24887125e9.10.1752577491479; 
 Tue, 15 Jul 2025 04:04:51 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-456114a417csm80207945e9.25.2025.07.15.04.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 04:04:51 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Javier Martinez Canillas <javierm@redhat.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/5] drm/sitronix/st7571-i2c: Fix encoder callbacks
 function names
Date: Tue, 15 Jul 2025 13:03:50 +0200
Message-ID: <20250715110411.448343-2-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250715110411.448343-1-javierm@redhat.com>
References: <20250715110411.448343-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rD25AV0h4v_koTCWS-9KrLbuYln4Ve66x2t1tBNs5BY_1752577492
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It seems the driver took some inspiration from ssd130x and some of the
functions (encoder callbacks) were not renamed to use a st7571_ prefix.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

(no changes since v1)

 drivers/gpu/drm/sitronix/st7571-i2c.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index eec846892962..634b426e2874 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -550,8 +550,8 @@ static const struct drm_crtc_funcs st7571_crtc_funcs = {
  * Encoder
  */
 
-static void ssd130x_encoder_atomic_enable(struct drm_encoder *encoder,
-					  struct drm_atomic_state *state)
+static void st7571_encoder_atomic_enable(struct drm_encoder *encoder,
+					 struct drm_atomic_state *state)
 {
 	struct drm_device *drm = encoder->dev;
 	struct st7571_device *st7571 = drm_to_st7571(drm);
@@ -565,8 +565,8 @@ static void ssd130x_encoder_atomic_enable(struct drm_encoder *encoder,
 	st7571_send_command_list(st7571, &command, 1);
 }
 
-static void ssd130x_encoder_atomic_disable(struct drm_encoder *encoder,
-					   struct drm_atomic_state *state)
+static void st7571_encoder_atomic_disable(struct drm_encoder *encoder,
+					  struct drm_atomic_state *state)
 {
 	struct drm_device *drm = encoder->dev;
 	struct st7571_device *st7571 = drm_to_st7571(drm);
@@ -581,8 +581,8 @@ static const struct drm_encoder_funcs st7571_encoder_funcs = {
 };
 
 static const struct drm_encoder_helper_funcs st7571_encoder_helper_funcs = {
-	.atomic_enable = ssd130x_encoder_atomic_enable,
-	.atomic_disable = ssd130x_encoder_atomic_disable,
+	.atomic_enable = st7571_encoder_atomic_enable,
+	.atomic_disable = st7571_encoder_atomic_disable,
 };
 
 /*
-- 
2.49.0

