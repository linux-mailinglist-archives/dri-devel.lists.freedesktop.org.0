Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509C492C45B
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 22:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ADC410E607;
	Tue,  9 Jul 2024 20:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KGZvJtUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF95410E607
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 20:17:19 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4257a390a4eso40131065e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 13:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720556238; x=1721161038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EXHxrC/luHFKOt8/7OLM5HjDIKDd5blPn0cUkiIy97M=;
 b=KGZvJtUNwh3wa2DUuEthuD77KTPMr77NU3SITfsccM1+SJzs9LrwWHSJGaJHnTCltG
 5IpRIIfMqybkYKsTGPqEBJCfUbGp0v5M00lB7CRlVh5wKqeCFuvPcjQLhaaTpYZjrmMb
 4Jm2hvylZPaWfoZEw4itfmK5bPjOmQulIIp7Csw5QCDfP6JjfT/kS1+kSgD1yAgjMhwq
 8kp4qcsH3KGwCYdYouUs5oB92EkfPpQZOtyAfFJuCbBXX9CK88VGLAmPY3jfTnxEPZAe
 IR/VkI71V0F0Hupb2UhC3OjfObk1qzF/sLqkG65eLzZrZJNg59qXeFbRnFpaKc+thaTl
 gjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720556238; x=1721161038;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EXHxrC/luHFKOt8/7OLM5HjDIKDd5blPn0cUkiIy97M=;
 b=rzjGTWo4Oy5B/BM1qg92MzUZ9psBf8cDyEEP0Mjej0hr9lPKjgNU+hH9Vhyj+q+ZpZ
 d+ZcHRIqfPhqdKvHR9OpIsGRWgdtD8SAdxX0W9nvo0B2K0tfO/pwpdSus2SF6nNQ7WfR
 uNneB++PNCRy6dCt4rB4E7qCfO5BNRsfqVz64vI2Ye6+FgekI7zkgySq4YAaMqnV8so3
 lmYIbl2qJxcMeXWqZr0nHSva9ZRpGzLP1s1GktUg5bWpQEhs326Dr67ZXrEZ9VR6fUUo
 J1oT36yQT7y7c30sHu7jbJ5bzS2FwZ9keR4naq057K/RROm9vMgrw5aj3P9Vy5PWivmy
 6cIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/jtwF3bYxcxTKgnQpS97M9t79oBmX+QcbRm3ashy2KVUsPilbvuAjh27r9JehszhV/ej09ECOfcOZQBx9jT8PiYMQclEN5sBSGz2JxdEN
X-Gm-Message-State: AOJu0YxEzWclioLys6SPFy5bqTgdXmWCWiJIhJpFlZ6UHL/p+3JoBGzL
 whYbhrY23WQnBERos9JKFhO6B95oU4HV+n3vm0jslXGNujA/e0f9
X-Google-Smtp-Source: AGHT+IHOb1az36jkAJmIB78p3YoPZuizKhT18QzcHxzqAQfDXBCqRFxIMk/L1NU6CA+UPO2yENzLUg==
X-Received: by 2002:a05:600c:6a17:b0:425:5eec:d261 with SMTP id
 5b1f17b1804b1-426708f1999mr26644295e9.34.1720556237509; 
 Tue, 09 Jul 2024 13:17:17 -0700 (PDT)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4266f737b1bsm54058325e9.32.2024.07.09.13.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 13:17:17 -0700 (PDT)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
To: David Airlie <airlied@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: add myself to DRM/STi maintainers
Date: Tue,  9 Jul 2024 22:14:28 +0200
Message-ID: <20240709201428.132612-1-rgallaispou@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

In lights of recent events and my will to participate in the Linux
kernel development I see this opportunity to add myself, and help Alain
as maintainer for the DRM/STi drivers.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 71b739b40921..0e583aae590a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7477,6 +7477,7 @@ F:	drivers/gpu/drm/rockchip/
 
 DRM DRIVERS FOR STI
 M:	Alain Volmat <alain.volmat@foss.st.com>
+M:	Raphael Gallais-Pou <rgallaispou@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.45.2

