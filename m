Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD50A9FB02
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 22:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D2E10EA3F;
	Mon, 28 Apr 2025 20:57:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VOl0WWFA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C272310EA38;
 Mon, 28 Apr 2025 20:57:05 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-223fd89d036so66151775ad.1; 
 Mon, 28 Apr 2025 13:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745873825; x=1746478625; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5PtOzJz3dhv1LS9QV7CQZ1khNGE/TmCpgM2HiFcWd9g=;
 b=VOl0WWFASuO2mvx893023yhiTJydyW5vS7C6Utfq3YcSBAK6LzkMLvqqEpMkkeO9rC
 LfZdfFa4+ut/Owiuyd90n/Mr/JF+ulYXdp3qTTDLeIWSrZCl1uY+xw3OKNaENlCdf2xD
 1WzEgfWsNCMvnnv+Kgj+qBfMSP2/5CEeUVcivE1D9Rw6GDKrLFFEzB0IxoGd/OzGnF89
 PNx40QyMQe7kNFPxgdqElSUDuGmA19SxjSVQu+I1fvJcC/tUqUCxilUedpK7lWloARxB
 04uf33GKCa7NK2Fn5V15v/LGELlbTVaBj3X4pkyKf/rP5QSERyTZ+QfYlIJzqUxC1Tdg
 yCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745873825; x=1746478625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5PtOzJz3dhv1LS9QV7CQZ1khNGE/TmCpgM2HiFcWd9g=;
 b=XT3t+LzaXtlgW6quVrEfpjSo/HSjYKC2qx1sP+iLMFH7G4v72dov2AgQOlnVt2EJ+X
 KV3o0BnGrzjgGXmHLLg8QPLf0ER1VJdGWbkTs+dlUQZ4Yo095MlAfOHa67TWOG5afb52
 uEeiLY63dheTChf40fA7P9GUMYKgO13IZ4hwaHObYdhx58TrDagc/31xBpndFJ/Y3KGc
 ZS0vdsyuhK3iNVtfD8tjuAMEh8bgU8+K0tpewd3yGsvu7KBrbV2+/q3G6vJ72rM7YQjF
 9xZkNQ9hdzj6xTC92RQ7tvKQSwTmotWz/QuKLnEZR461oyVyh4KPnWFSuyVGBC9+23fk
 bwqg==
X-Gm-Message-State: AOJu0Yxx2zdYku/3llLKw7blxo7/EDpSi4frPdVuazTtAsWSjC9deJEp
 lFE/P6ZfRLqB17ajV9K0NHTplr6ZZrEJ3G2Nr5l6i7clx2t9B11Ip3OlrQ==
X-Gm-Gg: ASbGnct1xBTTDrs+RBsRSpcMLwBfarJ9rn6amkzciPO7TnV4cfB8SA+zYaeJNaFH5ot
 fVrlbkrOJBGSF8dS49aGakyopvoZTKi54kYNVh8rW6XlkqZpxzg4qywa3tXiWqhBgjx0bIBJ+xF
 v22+jDAJx0Pqy/duMOEq11+ZBsz0Flwhy6C/rW42qLPWJU2FLdMkeBARpeC5b3VT+bv1r2ouQ9u
 oMPkIaK/qtFQ+GIGChi0YGdfYa4SrDunvXVuK2OPh96EE+yVJ7O6FWc6+a6UokOTiGryIfncNgh
 R1SETV8TphNjXYduXdmZcVE4Luac/8cb2+n3eiP8DKl+LG0Pl791U8eK80NCYmOS5In3i8akPj5
 LLYgf5EjW2iwS/iLK4DJ624H8EA==
X-Google-Smtp-Source: AGHT+IFl3SMyTEaho/8MJLgQp7mtfCLrZVXdq0dRk9iHPFdYtDqPrzxxbo4vf4F9sHz9doDAlLKRFw==
X-Received: by 2002:a17:90b:1c07:b0:2ee:b6c5:1def with SMTP id
 98e67ed59e1d1-30a01317a49mr14615445a91.8.1745873824756; 
 Mon, 28 Apr 2025 13:57:04 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-309ef14a3b2sm9502652a91.48.2025.04.28.13.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 13:57:04 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 10/33] drm/msm: Don't close VMAs on purge
Date: Mon, 28 Apr 2025 13:54:17 -0700
Message-ID: <20250428205619.227835-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
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

From: Rob Clark <robdclark@chromium.org>

Previously we'd also tear down the VMA, making the address space
available again.  But with drm_gpuvm conversion, this would require
holding the locks of all VMs the GEM object is mapped in.  Which is
problematic for the shrinker.

Instead just let the VMA hang around until the GEM object is freed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 4c10eca404e0..50b866dcf439 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -763,7 +763,7 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 
 	/* Get rid of any iommu mapping(s): */
-	put_iova_spaces(obj, true);
+	put_iova_spaces(obj, false);
 
 	msm_gem_vunmap(obj);
 
-- 
2.49.0

