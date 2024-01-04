Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B85D5824457
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 16:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C709910E427;
	Thu,  4 Jan 2024 15:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D655110E427;
 Thu,  4 Jan 2024 15:02:07 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3368d1c7b23so465526f8f.0; 
 Thu, 04 Jan 2024 07:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704380526; x=1704985326; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Nz6wgSvtDxdn5W5MMKrsDHjNFgiWM0XnkScPndx0kOc=;
 b=iHul9tuP7DI/Ny1zgY0qbct1f+7a7i8lfXsZYTe3K8rj4DETo6E0gzSNbXjC3MCiMj
 3a1fhdVVLfO4ekzN84wQhUKuFRffHmgyN+LawJfY6nwWdAyMqbWLzqAkrWfp+hQAHXhm
 BWG2g2DwxK8Kk+eH77ZuI9MO8yd47/NDoFnvkNYOwGONekg2uIYMPhERN+Ids6nef5el
 VVcxQJ3Poj3/Vbg0jidw2fiwDDcm+IVnBrHk6aNqpY/HksQBh+GtD/2NQrnWcSu/LODY
 Byc2kgKCi+jFNHIZ7W2Eyx1UDy1ytAwQN0ebhKxAiNBLbpcGAX03tSchMmyPqvvssqWU
 BsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704380526; x=1704985326;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nz6wgSvtDxdn5W5MMKrsDHjNFgiWM0XnkScPndx0kOc=;
 b=gLHWOy0ArYk/pb64YYtV7YRCqHyEvzSobQXAjbjvF8Ynvz9P1gzMl8avP6GNcdMnCt
 uTk/Iu2G97YOCwVSosFa+oH1w//MjfRdX8+r2CB8KX4iau/odO9bkDmoNO1EYlbUZZoj
 wJS+OecN3irLRWlvwLTawhF8Euh3y0esNTcq3k2cOW49+jiS4+vU15ZLXGjk5bUg3k+m
 P4Tb80fKiSKvANZIxoBHmuy3EmX34ZBoAfpAHUtAPiVU0vFCgcUaTueLZMGup4SgYfV4
 F0i/vOn6st3gY8SyzvpSOqSVwC8yi+PtoTwZFVTRusQZovnWTxGzgDb0nS912UjJZsr7
 Uuww==
X-Gm-Message-State: AOJu0YzeZa/0aYUvDNwpy/uIyLIOkCmXy4A3egb9QYtRw6ZR5OuhpfqD
 ECCnpANCqobtuWt34kiwfkdH4e3Bpcc=
X-Google-Smtp-Source: AGHT+IG5HiC0x4W+n+qys8FBgYK9JxkdZTlC7eENA/zhPd+9bPgbzVBM0HzLlRg3cdOo8Q82wYtCeA==
X-Received: by 2002:adf:f7c8:0:b0:333:492b:e5e1 with SMTP id
 a8-20020adff7c8000000b00333492be5e1mr410943wrq.22.1704380525958; 
 Thu, 04 Jan 2024 07:02:05 -0800 (PST)
Received: from able.fritz.box ([2a00:e180:157f:4100:7224:7d9c:a8ca:3fe9])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a5d51ce000000b00336765e9babsm33020998wrv.83.2024.01.04.07.02.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jan 2024 07:02:05 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 thomas.hellstrom@linux.intel.com, nouveau@lists.freedesktop.org,
 jani.nikula@linux.intel.com, kherbst@redhat.com, lyude@redhat.com,
 zackr@vmware.com
Subject: [PATCH 1/4] drm/ttm: return ENOSPC from ttm_bo_mem_space
Date: Thu,  4 Jan 2024 16:02:01 +0100
Message-Id: <20240104150204.1466-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
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

