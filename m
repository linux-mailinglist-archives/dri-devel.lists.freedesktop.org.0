Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81DF827FB9
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 08:47:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0593F10E386;
	Tue,  9 Jan 2024 07:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75F910E37A;
 Tue,  9 Jan 2024 07:47:35 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a271a28aeb4so263281466b.2; 
 Mon, 08 Jan 2024 23:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704786454; x=1705391254; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Nz6wgSvtDxdn5W5MMKrsDHjNFgiWM0XnkScPndx0kOc=;
 b=DzESsYvvUmlkuuhW0EWneOPWxCeb+eGPTFU5XP515KH2kVaqZkJ4aOvwEiVJPbLxay
 08/MFAR/gAX/doPGRuxHGk9oq5ewAGjEZiG9lr+xC3dY0ZKCSWejoDt8c7Qq5zcL+VNV
 mdgSbju3CQdjdSek9gGssAHHJtfxwyZ8+0ysgTON/T2UIctG2Bn610DX0TiX7/lUQaWM
 Siro20aA4p3Qw7Eg9RPr/VWaZPYOUkQ5FNHbWDqPcae75TVFlsmqJqdfyYjZETrf6eVK
 AV5CFCLXG/zPh8q1reFy42XisiaaIDCjvFqXUPcLK77Xo/k9K7P3Hal/Ns40yNmjdauR
 T+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704786454; x=1705391254;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nz6wgSvtDxdn5W5MMKrsDHjNFgiWM0XnkScPndx0kOc=;
 b=g44L8NdlmTqdkv1AdOHNdyAn2yXvI+CfCllTNKwnm+qrF/bwuCpjg889Tmz/vF040e
 enyjGvnmjguYmJb446pGo2ANPSbcQY1IrPMvEW82gS3dN4OldC1UGncD+ySE/DsXRIPe
 HhLgaFKNHTV2z6H8GASHbGbWPmYIom98bq8DVP8h4Z1Rk1N+hMUS0cn8jokaSJyYKi3r
 kuqfIoFjQ+AYhbCOCg/KYOEjGuXr/x72SMFjhPSx2KEhJxIelUrxHhUm5igTVkMlZXqv
 hePxcM0jv2iAYMf1Ybc9F18KQ0McM9AMgBmVbEESWN0iUXbN2uyXjqG6QpIjQMwSPrMo
 vClw==
X-Gm-Message-State: AOJu0Yztn9e0eIJvsk/ttMJZuDpQNgHavXG79nVOIC63YTZ0Nj1v8Mlb
 f5GBBKSYkBeX2UNEhElGk9s=
X-Google-Smtp-Source: AGHT+IHKDHFq/OI4MBfBM6tHFW6r2qucBNaQxmte28BUxlQrD+ZX8Aw41NblBywArN0elqz2yvX43g==
X-Received: by 2002:a17:906:f249:b0:a27:a02c:3499 with SMTP id
 gy9-20020a170906f24900b00a27a02c3499mr340106ejb.60.1704786453894; 
 Mon, 08 Jan 2024 23:47:33 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:15f1:d900:3a74:b44a:2376:22bd])
 by smtp.gmail.com with ESMTPSA id
 bm3-20020a170906c04300b00a2a4efe7d3dsm731563ejb.79.2024.01.08.23.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:47:33 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: zack.rusin@broadcom.com, thomas.hellstrom@linux.intel.com,
 lyude@redhat.com, kherbst@redhat.com, jani.nikula@linux.intel.com,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/ttm: return ENOSPC from ttm_bo_mem_space
Date: Tue,  9 Jan 2024 08:47:26 +0100
Message-Id: <20240109074729.3646-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240109074729.3646-1-christian.koenig@amd.com>
References: <20240109074729.3646-1-christian.koenig@amd.com>
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

