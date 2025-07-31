Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC23B16CA5
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 09:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708E010E717;
	Thu, 31 Jul 2025 07:23:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bh2IRQk2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E547F10E702;
 Thu, 31 Jul 2025 05:36:53 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-3b7961cf660so385946f8f.1; 
 Wed, 30 Jul 2025 22:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753940212; x=1754545012; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=AMZpWfQTqvxub6EnV2WBq7DOhIOcnfoMYMkFRXtjCnQ=;
 b=bh2IRQk2jCs/AMk9UbOZCQ3577v3gWPclVotnlaL/fyDeHMZegAHAhWDfyV4YnsSAU
 zL+eTjgkKjOpsdxPApR6h4SfRNWOQZ2/VnhD9XOWOeHz5dvQNHCvURDeBfrVGgYqSegG
 Y93O57elqImaO3c2Ag5u+LL9TScNGRm73n5i+0FdfXrKqRBrIjpwM2oU7GjuzKFfReSo
 cvjq3uMSh6Hoe1RabLuO9hF3vPqiLRfHrIc6USMU4EX/GDygyILVDgXnPI2AE3hDAlNs
 3cGlf/0XvLZxeeDc4iX3pH//cODw1RHCAWnbOxciDsjb76tksVT/wSUc+5YIRb+ujwP1
 rBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753940212; x=1754545012;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AMZpWfQTqvxub6EnV2WBq7DOhIOcnfoMYMkFRXtjCnQ=;
 b=wYLXH5TK998ULf7fd/m9KHvUsw9FaW8QUdWzVlgy1YxoHX8HLaoomDgMqcj/0ovB4N
 qu+s/cSr1QsGRjptOma/QMYCP5KyH8txG3BszbzSBEMflsmj2g6VedkFQOBiM93fAig9
 e0/nsp9NFBuixlCoB68/3pwXadgieukzVxkviEIJveaHy+yHNihPBEKG3CbTzNEKk4cI
 8Ozf/Cq7qQ6MByXtRXdxkT1+JzjQtezFlJu+7fbdjrqQN1Xums7o/n58Kl3+J9SIZl+p
 +iS5fbKYdY5uUtwHSrBhB3vpWfwVtOQHursQWmqxdsNNWuRRBs+q/7zOZZaxpRP5IeuY
 x8xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbAanTNSNZfvRJ3jmLAwQxYGuk0ybaWAqF48HTAP4bLp7Vl2/KCk2sYjPX6D9GnWYlQBmW0lQHy3o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEsrvJfzSwAeF+u10I2szvlaXye63bLIOF6x3tfqXRNz7evjiz
 x4bjjmR70b/kLlqLWvuMEvuckPtJTe8bkB8j3L2A6TyVZfI8YCUaYSzc
X-Gm-Gg: ASbGnct5dmXxRFiYeCr739TNjsCiBTCzx0uKIVG+WI0KgFQ3cThnX2nYU3EF/CzoOpz
 Xw5Vw0EoB4s5VC83htgfPGZCTdXLEdfZBHV/Tf4Cm1NPHL1oL6lLzLBwLnKCkKULUNHFVvXQwbA
 brjX0hSMGqraAff0+qp99aQi/0FQMqsCOj9A4I+SuypDazBY7cQVAgxBxKNsVe7rKnMDeaw/djp
 vB0/3TKz+oZrxCCOyW32Hpy7mxdTfh3d6KIwlDY9oyFVXRaWRgqTJwESFVyb7A42EFwyW3OuyvU
 TiR9/Gti4Comeg5PGeO5kvPC0Fo1d2fa0CedWaopkF+LfCvCza2p+oi3lWj5CCuRqrf8U6SeLV4
 EvZ0datceQYjmqM2M47Ab68yDxA7UrfRBFJM6KdBRCyLw1dtcW2YfzpnWCYrUWgoEtTduaoo=
X-Google-Smtp-Source: AGHT+IHdfzXx9K06cb/UnitGjPmvC7D+NZDjqSkxgc5T7oHEjmuUebpFeyLmNYxu/axLoj3DiwsXzg==
X-Received: by 2002:a05:6000:200e:b0:3b4:9721:2b31 with SMTP id
 ffacd0b85a97d-3b794fc2684mr4609111f8f.5.1753940212394; 
 Wed, 30 Jul 2025 22:36:52 -0700 (PDT)
Received: from [192.168.1.205]
 (dynamic-176-005-138-071.176.5.pool.telefonica.de. [176.5.138.71])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac093sm1149137f8f.9.2025.07.30.22.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 22:36:51 -0700 (PDT)
From: Philipp Zabel <philipp.zabel@gmail.com>
Date: Thu, 31 Jul 2025 07:36:39 +0200
Subject: [PATCH RFC 6/6] drm/amdgpu: don't wake up the GPU for syncobj
 feature detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-b4-dont-wake-next-v1-6-e51bdc347fa3@gmail.com>
References: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
In-Reply-To: <20250731-b4-dont-wake-next-v1-0-e51bdc347fa3@gmail.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, 
 Philipp Zabel <philipp.zabel@gmail.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Mailman-Approved-At: Thu, 31 Jul 2025 07:23:44 +0000
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

Don't wake the GPU if the SYNCOBJ_CREATE/DESTROY/WAIT ioctls are used
to detect syncobj features before the GPU is powered up.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/2295
Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 79d31ac6a7b37..b12342e917193 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2981,6 +2981,14 @@ long amdgpu_drm_ioctl(struct file *filp,
 		}
 	}
 
+	if (wake && unlikely(!fpriv->initialized)) {
+		/* Allow syncobj feature detection before GPU wakeup */
+		if (cmd == DRM_IOCTL_SYNCOBJ_CREATE ||
+		    cmd == DRM_IOCTL_SYNCOBJ_DESTROY ||
+		    cmd == DRM_IOCTL_SYNCOBJ_WAIT)
+			wake = false;
+	}
+
 	dev = file_priv->minor->dev;
 	if (wake) {
 		ret = pm_runtime_get_sync(dev->dev);

-- 
2.50.1

