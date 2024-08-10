Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6C794DC89
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 13:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AC7A10E0BE;
	Sat, 10 Aug 2024 11:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="H4iluBTe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4AF610E027
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 11:07:33 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1fda7fa60a9so24604765ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 04:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723288053; x=1723892853; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7WjGa1PXf2QdLqPrY3XfFGhbeSFb6g3387jwXF6umc8=;
 b=H4iluBTeo/QeOIYGwyczL8HGqlG6WGxHnDIXZb2QxHu5v48idvKmnRfnDNWtENVRyB
 En2lp/q0m7nskECf1Pkr47wnROLZaFV8l4kqfcWL729Kax/eJq/63R9N7uatGU2SzcqG
 sn5Dy9ErXOnBEjnH88Ps/5Fd86V73x5lej4S3cZzPv79LzbfqGIagBv/6HLyk+Dthjh6
 8tpuQRvogDwDzgnOC1ma4W8k7BYCQhDe3K7wV3QTHePIBiqES9gm/q4KZzqWFSphYNL2
 wRhqpr3amQvZTOGeP/Vhpivu1IQ4QJWVDJtfkO1Xr3Qwsoc0ni4bK4/tQviPO+p3nUXD
 jLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723288053; x=1723892853;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7WjGa1PXf2QdLqPrY3XfFGhbeSFb6g3387jwXF6umc8=;
 b=JXlFXp5wcwNai9nnrMB046bQqUviFjC73w6aD7UzxyUVKQxVEi39YqeRjInYc+sf85
 tEkdrToozAoxhjeJvlxc/t6CNFO//1gafIFrBIL5obbqvIoTCS7b0QEsHbRsV40Aa2PA
 3vadbQVCyOfzTeO8+v+MeDmlbhjyUzhV6bckls7LWtwD/lzqSiHJJzcKb4yHNPtlvBBV
 dBaW1RL+9H330I/ugdOIdrx04ced+cQBL8AFf4WR8YArDl19Via/Kiy1gxRT5XnhFf/P
 2hx5AzyprARZN5RYoNf2Ir2dNSizZ/DG0raq2STAwrSBWV618kN3uRl5QlNAjh9oL85F
 zPig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhBa2E6yhDoOmmqoLIo7xI9S137oZOXZPkyIxEvpOzk7Peg9Mp12KxMsJECGIpOgqZNLM7Kf+aWKXgmRdC9yRui+1tD/1nd1pYzdGAE+it
X-Gm-Message-State: AOJu0Yyz9B4zEC5lMcB5UuAHx2T8sczhphcbRJ7NGqgBfIbbxabSOH94
 2smVU/LFOvMGx743EEDxHIRLkohne2quQhekDpDZgishok06bK4r
X-Google-Smtp-Source: AGHT+IHolzyz9S8pd+GOOcW+1R0bING8PpCkunpPTukviWMZPY/lvqyK2Uo385BypufhWs90tL9WEg==
X-Received: by 2002:a17:902:f689:b0:1fc:5879:1d08 with SMTP id
 d9443c01a7336-200ae550755mr57229755ad.32.1723288053298; 
 Sat, 10 Aug 2024 04:07:33 -0700 (PDT)
Received: from ubuntu.worldlink.com.np ([27.34.65.255])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-200bb9038fesm10002735ad.114.2024.08.10.04.07.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Aug 2024 04:07:32 -0700 (PDT)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, matthias.bgg@gmail.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] staging: drivers: gpu: drm: mediatek: Fix warning: Using
 plain integer as NULL pointer in mtk_drm_gem.c
Date: Sat, 10 Aug 2024 11:07:23 +0000
Message-ID: <20240810110724.174338-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 10 Aug 2024 11:37:09 +0000
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

sparse reported following warking:

'''
drivers/gpu/drm/mediatek/mtk_drm_gem.c:290:27: warning: Using plain integer as NULL pointer
'''

This patch changes integer 0 to NULL.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
index f8fd8b98c30e..885ce6ac7bad 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
@@ -287,6 +287,6 @@ void mtk_drm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
 		return;
 
 	vunmap(vaddr);
-	mtk_gem->kvaddr = 0;
+	mtk_gem->kvaddr = NULL;
 	kfree(mtk_gem->pages);
 }
-- 
2.43.0

