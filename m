Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE50824487
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 16:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C3310E4B1;
	Thu,  4 Jan 2024 15:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA4810E4A1;
 Thu,  4 Jan 2024 15:05:49 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d8909a6feso5784185e9.2; 
 Thu, 04 Jan 2024 07:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704380748; x=1704985548; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Nz6wgSvtDxdn5W5MMKrsDHjNFgiWM0XnkScPndx0kOc=;
 b=eWD7wWV1nIRJ4YcRyfNnRWHTahvuroKMysmXpD6zE7ZAeH4HrFyb+01L6FzzmIwxTk
 Rov8dqLK98HJBkYloRpjufamD0uylcVy4adlyqqciqPjLCHYG7kSvH+cPvAqbdQvQE7O
 vAlfpOE12fgx6tFUpOx/Ze9Y9KGJuA5KjoqUYIimrYL+UALTO0Nw6mMrKi5DZxRFRBuG
 JLixQ5gVUCriQi0XvfTLM+s+K+PJX3tr8jwA1miS7loU2toayP1Bjt2FpWlkSmt0k7m3
 DeL6o21oDNkrNtrESmAyoNvPpSz18x/2yiJbVF7vvn+eUPPHC8P6FZT4lwEN9/G6UwRf
 bRFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704380748; x=1704985548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nz6wgSvtDxdn5W5MMKrsDHjNFgiWM0XnkScPndx0kOc=;
 b=NuPxCuDBoKGzbXTlez9ip519GVYuSlS8dy+mG9nVX+THvClvHxGdqDBvwL0ni8lUNd
 Upsj55gWsh8pTW0spdD6tNLa6q5nWYcUei906KDf8S/rmH9MfA6M2zN4lEKab9zN6m3R
 BvqR1rYfhFdU8HI48dFxAFBAETBRBaA1TPtJJurV3TIO5APnf+SnTa7EGlX88JEaet+t
 usFtPnQZDOlxTufiTIAxD4VhUqCV+AvHWQf7SLzdMRPKN31m9lFI0ESexYowfPHkXJxk
 SxjCg5apmmT8pjsZjYPF6LUM6xXlLsi6Mr4oa9GFagIYqBGr2xfNHXK8kHkVmb8e2PU6
 Z0HQ==
X-Gm-Message-State: AOJu0Yx+LZfFpeWO+B0TBXZxCikI7gFL2VSgbGUfjqTqyoPIVEzOzLqD
 3JfqLce1OHBQ9v6AYaVkC51bMG7CjmtnxA==
X-Google-Smtp-Source: AGHT+IFL7TZBkApBcpJiUDAtFWEZKM/BMZ0ES8NpQ22/+iGsDDAaXmT1iLG/VJfR5HV8BhPRev3M4g==
X-Received: by 2002:a05:600c:2a53:b0:40d:8a0e:c5cc with SMTP id
 x19-20020a05600c2a5300b0040d8a0ec5ccmr301539wme.221.1704380747839; 
 Thu, 04 Jan 2024 07:05:47 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:157f:4100:7224:7d9c:a8ca:3fe9])
 by smtp.gmail.com with ESMTPSA id
 hn33-20020a05600ca3a100b0040d5ae2905asm5845420wmb.30.2024.01.04.07.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 07:05:47 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com, nouveau@lists.freedesktop.org,
 jani.nikula@linux.intel.com, kherbst@redhat.com, lyude@redhat.com,
 zackr@vmware.com
Subject: [PATCH 1/4] drm/ttm: return ENOSPC from ttm_bo_mem_space
Date: Thu,  4 Jan 2024 16:05:42 +0100
Message-Id: <20240104150545.1483-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240104150545.1483-1-christian.koenig@amd.com>
References: <20240104150545.1483-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Only convert it to ENOMEM in ttm_bo_validate.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index edf10618fe2b..8c1eaa74fa21 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -830,7 +830,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
 			goto error;
 	}
 
-	ret = -ENOMEM;
+	ret = -ENOSPC;
 	if (!type_found) {
 		pr_err(TTM_PFX "No compatible memory type found\n");
 		ret = -EINVAL;
@@ -916,6 +916,9 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
 		return -EINVAL;
 
 	ret = ttm_bo_move_buffer(bo, placement, ctx);
+	/* For backward compatibility with userspace */
+	if (ret == -ENOSPC)
+		return -ENOMEM;
 	if (ret)
 		return ret;
 
-- 
2.34.1

