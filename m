Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD96CA74F0
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DB210EABC;
	Fri,  5 Dec 2025 11:09:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yUFwTlui";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8672510EABC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 11:09:31 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso25491015e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 03:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764932970; x=1765537770; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p/C0PagtTMInOFxe3qelV765/5mfYdQN+er9ThsJgfE=;
 b=yUFwTluizKZGbuWLJnvsqvk5pe/0yl9mZRZjClMRobUtHPh5p9Kwk0/zisxV9LxwJB
 fXpoTz4PSFJ06WBcu3QRdlJJevcjDE9fMF2lG4kHPZ4ko5gh6Rt3mchDqfZcmRT6If0s
 DC4Ivc/Xfu8XGvyxlAxTwxatUJGT0brv4Zbh/6IyQEfncCZoFr2tVXPXhOYOvCkjWecp
 D/pyELb/pwptoJ89lK2grIpa+8TQCV9e3lQS0P0z1rB61szUE48CjA3UAEG2SOZnbv+e
 +HRbnxO1MHwIyAoMV8mbdjoTiNRx+s0RIEaSl6TyTBomxa17qhR45nz8aqQFlXa2/9pK
 195Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764932970; x=1765537770;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p/C0PagtTMInOFxe3qelV765/5mfYdQN+er9ThsJgfE=;
 b=K0f12HcjqT9dkGWBABFIS6+o1aG8zrJBHQHjxrSwIzbmZwAWYXkACwR5irUS6+tOl8
 OGho9xZ0LQHnqcBpN73hQEv66KnZwOXprGEz2Nf2VRjWZ3wqGy5mFL5jLJZqodSnARex
 v6gKS6e4ECq0+fyw8Ok7ed77MoGXFGqxcwFYmrk7tvs4QAugY4O4qch0MxIWRW04qg+W
 7eTJnXzYUxNvG1w3taX+lSmuAcsVyYvf3kUSPjzgfHXaeirowxG9WhUhO5IyJpom5M5Y
 C6OUIxVdOymsZLg71AFnnl/OpGzp48HOl27DsOvNCPdJc5NqUbyiCZHqSR7ey24V1zyc
 tDnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV93pTIaVo2M7x1uGVfvIgcO3Dj/y8MQ1I7g44X4SqyKpn9Raa5qdLEt4KRx06qaf6OMQuQAy3c1fo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0DHfM+IGqV/xURbwnzXu3lL1HIsZJ4i+r9f/9hUWvNQFhbur0
 pggUjfvPr5aL8xj7oulAci2ufVO0yaBxTnumnIM+J5e5CAvDeKs00pMMFrSb/sHRnOw=
X-Gm-Gg: ASbGncuklarx9hf3gZwOJDuMFoJsi6n14Czourrakn4IWwgOvJ4q0SiUsZmge2y9CwS
 T725EaOieozkF7IqB27ZVguPS7OcEh+MRe0bf+826Wj8cKb2IR0As+udW0HqeXesr0q1Hmg8YQn
 HXu+PXZftIFs5s/BgiHWafkdDiQuS05/TjUzr4VNO+egY1fGzsu8ivt2+yzGurBNNnaX8vD4W0t
 Yv/ltwzFi6S5zxj7+JJ1+9utmJx3cb99KIZLI+qEz4X2gFKL2JMXik6WeQhgrJ7BpzX23NNXgXr
 FMDCeh3GD4f2xpkTYkYCc+C1BTTo5Gwy0wNv7yMso3p7cH5yivSRSx1FQKdXzLPhUKb8QhDU8JJ
 no9xMvEr9SHlk3Kiv1b1IMLHpJyoeuMJRQIj2G/gs9drMmDWdCXuBUt1VZ//lso4Bp694KmEHMj
 qzTlLIYe3lfMIl1pL4
X-Google-Smtp-Source: AGHT+IHCkU5CgfbT6Uz9t3Nb4ylQ2nrafmcxdx4Hm3Q2PBKnBoGZ/U3wVfqkqFkieDHCTVyrSxNH0A==
X-Received: by 2002:a05:600c:1d0e:b0:46e:59bd:f7d3 with SMTP id
 5b1f17b1804b1-4792af321b8mr94681325e9.20.1764932969765; 
 Fri, 05 Dec 2025 03:09:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-479310b8e70sm78214345e9.5.2025.12.05.03.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 03:09:29 -0800 (PST)
Date: Fri, 5 Dec 2025 14:09:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Simon Ser <contact@emersion.fr>, Alex Hung <alex.hung@amd.com>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Daniel Stone <daniels@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/plane: Fix IS_ERR() vs NULL bug
 drm_plane_create_color_pipeline_property()
Message-ID: <aTK9ZR0sMgqSACow@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The drm_property_create_enum() function returns NULL on error, it never
returns error pointers.  Fix the error checking to match.

Fixes: 2afc3184f3b3 ("drm/plane: Add COLOR PIPELINE property")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index ce76c55913f7..e32c7ea8551c 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1867,9 +1867,9 @@ int drm_plane_create_color_pipeline_property(struct drm_plane *plane,
 	prop = drm_property_create_enum(plane->dev, DRM_MODE_PROP_ATOMIC,
 					"COLOR_PIPELINE",
 					all_pipelines, len);
-	if (IS_ERR(prop)) {
+	if (!prop) {
 		kfree(all_pipelines);
-		return PTR_ERR(prop);
+		return -ENOMEM;
 	}
 
 	drm_object_attach_property(&plane->base, prop, 0);
-- 
2.51.0

