Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3D1A65A02
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 18:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41BE910E18A;
	Mon, 17 Mar 2025 17:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="V8vxytKZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8732310E18A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 17:13:32 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso12605145e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 10:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1742231611; x=1742836411;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=lRDTsBjDbCS/Pgq7ZICBGwt1MaN5NlT93wkTd9DN6xA=;
 b=V8vxytKZibtOHpM/4oXVui916lgNckZZ46YFab7s+MCOtZhGboCPVX09LxtS6g7G4Z
 TTzAUaVJYgncIhuCR4p/YMjFeL0ow5kU1GLikP/RcA4fAVEngEf0/eXsEDx9RZjwVbxt
 Ihg+/QKToymUqchPD5Necv5CZAAiKoJ+i/LTngirrOqiscQDfVg5hrHGdCA4ups59Rao
 RDVoHnm0Nje3A4GQ/ruRXYUBRYXRsA52B4s0BDFiaHxKgNyafAH+utGMAjX7PKd+9YxS
 E95yMD5CmGUZvF3k76R4Rt/IaGMjvdUUqDOGC3ryOJTTWv8bHKb0jnr6YI5kMhiPL2sn
 14Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742231611; x=1742836411;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lRDTsBjDbCS/Pgq7ZICBGwt1MaN5NlT93wkTd9DN6xA=;
 b=u8ULtox9cZ028HKlqS7VMW/KxX3BK7bel739A092Ma3gNvb9/WfmIz7VTi7PKxPZh+
 AvUy9K0hxByCw2sTSFuv5NjBL/h267Sp4F8cdP2r2Oq1gIQB/6oQb5buofFSbZo22wtI
 lCglWzmAexq8lhVtRVV+EaO6/53iy5J0DGdlwW21qOq0LEgirZ+1uXwjHefY657Q/o/W
 DvzEWdK6hXg88qELD9ePJjd8vA/783Lbu1UVv+CY7MATDpf1l6B0wYusGoU1sZ1HEg26
 tJkLG3nwpUa4qXJSb6egKMD+kv8ve+MuqczVizwXVb2XSQrw5nTdOWM09HgUYRMdzjNj
 0s7w==
X-Gm-Message-State: AOJu0Yy0iQ+3tR3MBT1eXnC+0up9l8WRAQu+aCUgB1Rygx9IvgW5BQwy
 NOwp0yc7h8mb7AxYxlqWJhl0Pj6lLNkKzO8T++eUOQtzdbt522EZxTu4FXkcOvQ=
X-Gm-Gg: ASbGncs9kacFk16spoKQRFlSRjeq2drSFakfPGP7wuvBGh0Rb2PMYG1Cu7vV2usLOky
 IsWCVVBaYGzwqrBzFksypKMQKJdyslfqDsSp0Bwbj9SJ0WCVm3ZxpeJ7LnKQPsyfPxbzwhMtjjP
 z6BjitjvioIDoq/RlOTLureEMCqoUzbOf4vYFmTInGzvhVKUI69vgpm2jOMUhloXAX+7F8CXY6n
 mNJIi4eLG9AVIQM7fp+PbrIMzEoIYf0PpLIeZ29OJPfRPZdtHqaOI7tI59TGUm3BGcM2vUX8Emq
 Ohu8uH92LTjmyQmOzZhDSON+Qo8uyufTFQ==
X-Google-Smtp-Source: AGHT+IHaQFEGmNJHvYPiwKVLfVH0wjBZjXXR2bM1ay2xIHNWMsAaGkue/Sb8FK6LJoE+P8Wy8OzqnQ==
X-Received: by 2002:a05:600c:3d0e:b0:43c:fe5e:f040 with SMTP id
 5b1f17b1804b1-43d2bb4d786mr47087915e9.23.1742231611236; 
 Mon, 17 Mar 2025 10:13:31 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fdda15dsm112003365e9.3.2025.03.17.10.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 10:13:29 -0700 (PDT)
From: David Turner <david.turner@raspberrypi.com>
Date: Mon, 17 Mar 2025 17:12:22 +0000
Subject: [PATCH v4 1/3] drm/display: Update comment on hdmi hotplug helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-vc4_hotplug-v4-1-2af625629186@raspberrypi.com>
References: <20250317-vc4_hotplug-v4-0-2af625629186@raspberrypi.com>
In-Reply-To: <20250317-vc4_hotplug-v4-0-2af625629186@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 David Turner <david.turner@raspberrypi.com>
X-Mailer: b4 0.14.2
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

Update the comment on drm_atomic_helper_connector_hdmi_hotplug() to
clarify that it must be called for all status updates.

Signed-off-by: David Turner <david.turner@raspberrypi.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index c205f37da1e12b11c384670db83e43613e031340..cac819ac468de020e4e75b3bcb09c31f909bd61e 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -816,7 +816,7 @@ drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector,
  * @status: Connection status
  *
  * This function should be called as a part of the .detect() / .detect_ctx()
- * callbacks, updating the HDMI-specific connector's data.
+ * callbacks for all status changes.
  */
 void drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
 					      enum drm_connector_status status)

-- 
2.34.1

