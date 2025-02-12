Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C1A329D4
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 16:23:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE04510E8E7;
	Wed, 12 Feb 2025 15:23:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DD9mph2b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE8B10E8E7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 15:23:53 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ab7e3d0921bso324428666b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 07:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739373831; x=1739978631; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fiMAJYYbGqQGrN9mqZ/PjIuMsY86kljhaikfZKAgMZU=;
 b=DD9mph2b1YTVHRIwnNyNSYIZx9Z3z/+NZcnlXduJXnNWVf60LJDJMEE3ktNKEUn8ve
 u873fA4FmtAynn6399nJl93HE/4f/43RI04T8rNFrNlj5NcKSyFkTxtXhYJQ4m3zhIT0
 bMmWiMla7vdj1ePDDf5i+EV5paSvznvtRazDhJdCSkSdIYLgbvgs3dSV5OegsMZvb+7u
 QGCGTxAF6Q4twcjEKQSPh3TaKZHrbl0gXPq+gHluMD7bsd7MRwl8/JH/xPCMyEMtYBHI
 eQefoZNn05iVnKjr3cFjulZcY7YhHFNq+rMmTgYoZmmfB+X5MP0TFgg5AJZzH/RwXJM+
 KBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739373831; x=1739978631;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fiMAJYYbGqQGrN9mqZ/PjIuMsY86kljhaikfZKAgMZU=;
 b=dieJICCF0NUnruI0HrbY7CLJkaz4RpFWRU7JSkRhf83syE+Q+3jpipO6YzmiTsTPm5
 YTs7O5e2sgZ6lelwIOfpz4505+yIlc9EmY4R9nXFQCRl6zopEzBwi3qSzcQoYTF+U9GH
 IR9lC8ELcr/QBEpZqUciIoQo/ZWskL6HcHulZbxwiFS00Nix++UDupWApGLny5FkNx/Z
 ilTAmitF5PqhLonPPor17a4793aCcl8Id9DtrnrPRoBxw/SdOU60ui9sIWu8+7ImWJ2c
 9yL+hnf4AbomHFfP2aqLu6zJndoBj6cVvjqHt0yS0+Q1GS9ZfTWoUOUBeD9P9OJS8b2t
 7/zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQGfjnuhG00irnoEjBM8JLlTTN134CeRyvB2nN0ipwhT9OoG/9kQjj88bUmEk1WG5yTqynwkfXyGA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdWjYKt7zkxl5egFV5GHKQMZ6iyFJI5y7v1uYJuUzsomeLWIKj
 Ne8jbS5d7rM8uYMYIbPgU8bc6IjPV+9l+FN0ChNLfSomPCJy0x6k/BIqgcieVdM=
X-Gm-Gg: ASbGnctIlK6cHOxQKbIJWW0NjMWrTVHNxpgQQ8o27Z7ApHfdTyp/pKsuxLc32i/xUYa
 0Lll4WpHOwV2m1XAXtXzL5z23nN6wJldd8jJEcHGHzj0GRyAWkbTHnD4OaSVEjl+CdLHMmUYnp+
 1S1BFJ7RZPESoXsFbv/mTHbPQtu9dqLi+eqSAfnFdz41IlleuTeCC7s1Wx0+lItYzjVPbb4JpGI
 6rrUMYl4NEhwMlkqjEJE9cGN1hv+djPCuhXmFrICjdzmdxb11K7Om6q5JnSy47w5RynejvjwJuX
 kfE+dAJUuRvxZUJ4jJ5p
X-Google-Smtp-Source: AGHT+IFd6/CTFsxOYTPNP3SwAZh6B2Q1L2fFN/auo0EoMrFbeVu/aPClhmCGWE7ZbkOLcltvypHlJg==
X-Received: by 2002:a17:907:6e8c:b0:ab6:53fb:9683 with SMTP id
 a640c23a62f3a-ab7f34ad061mr329677866b.54.1739373831457; 
 Wed, 12 Feb 2025 07:23:51 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ab7a98974aasm866825966b.47.2025.02.12.07.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 07:23:51 -0800 (PST)
Date: Wed, 12 Feb 2025 18:23:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm: writeback: Fix use after free in
 drm_writeback_connector_cleanup()
Message-ID: <78abd541-71e9-4b3b-a05d-2c7caf8d5b2f@stanley.mountain>
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

The drm_writeback_cleanup_job() function frees "pos" so call
list_del(&pos->list_entry) first to avoid a use after free.

Fixes: 1914ba2b91ea ("drm: writeback: Create drmm variants for drm_writeback_connector initialization")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_writeback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
index 3628fbef7752..f139b49af4c9 100644
--- a/drivers/gpu/drm/drm_writeback.c
+++ b/drivers/gpu/drm/drm_writeback.c
@@ -360,8 +360,8 @@ static void drm_writeback_connector_cleanup(struct drm_device *dev,
 
 	spin_lock_irqsave(&wb_connector->job_lock, flags);
 	list_for_each_entry_safe(pos, n, &wb_connector->job_queue, list_entry) {
-		drm_writeback_cleanup_job(pos);
 		list_del(&pos->list_entry);
+		drm_writeback_cleanup_job(pos);
 	}
 	spin_unlock_irqrestore(&wb_connector->job_lock, flags);
 }
-- 
2.47.2

