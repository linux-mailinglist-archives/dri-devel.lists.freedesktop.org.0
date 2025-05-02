Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A587DAA7819
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 19:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2AF410E971;
	Fri,  2 May 2025 17:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WecEz8Jv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21DE10E971;
 Fri,  2 May 2025 17:08:15 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-22e033a3a07so25917455ad.0; 
 Fri, 02 May 2025 10:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746205695; x=1746810495; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5PtOzJz3dhv1LS9QV7CQZ1khNGE/TmCpgM2HiFcWd9g=;
 b=WecEz8Jv7psVkOzsS2j6nnUmWRwOiBRMcClfvtFBfxmLKw+05Tj0ae3bChkGuud4xD
 SkEa9WaB9d7Y8pu31yqCL2rmxQ2I9DDztOKp7li+pa/eOdwYIGT5RN1PFbXv16o3CH9v
 Z56EF2p8fqM8BEVTeb8CAbngKgO+kZVocLF/PAeYiqacmZkVdxNHJdAPhfOcSbnuHpzF
 lSEImbsbhkpGGWFiLWhtz+c1kmSewQvJsyUAXlyRvr8pgr4VI/wfjGqFQ/8bP9V7hIhD
 161AfFHbjDHsvoBEqkXobjwMZbdYlgwdiTsZmCQ4Y5yceHg0uWPP3sNZufuJpb/ubMaM
 ox0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746205695; x=1746810495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5PtOzJz3dhv1LS9QV7CQZ1khNGE/TmCpgM2HiFcWd9g=;
 b=ptWnTOZfziYil3OwDXBmnpdVQAbuSRYzUQuGHTUI5nBvoD43VpL0Z/KKM6D0zte1UZ
 UI0aYT5NhdyL4z5Qkgi1MmMyism0FAAHxHogEKqOdLloVZL8I8ugx8BnBGYVGcTY3HFQ
 12S1OxzXhAfXm2EGA611dgufAOpq3zr4KbqujwbtfnQN7nbfmiBr7QSMQsfcGElZeHA2
 dRm/k0FDLvLW88MCmMSfkXC6PoiYkLqdAciKY1BOLl6t+CRwWx4sQGSTHLfn2lBZbLTk
 E2UmBft3hfIha6amMQImE2bO9MjPlvwHcqi17WbRsyA0fLM6fTYWCww5/yxwjL3DVBe2
 lMVg==
X-Gm-Message-State: AOJu0YxZyjaAQTMxkbdU1T6SSVNrrXYUUFCtQ2Dt67wx5ab7Q3daEpvX
 09ksdznLZkzywy3ODQrxeKnD5HNOsnyLuHcfGgeneuiiOeVR/MwkFG9Bcg==
X-Gm-Gg: ASbGnctLHr3ydy+tkyX9QyEqhsMIZzSrk5es02mTPnQNUjGk2Y/z+ReTWOVd4jX5aIZ
 mf9kvDzQWxckMQB0AMHuvPqjnv4i8tiALf0T8nVxFF5jczHBw1xu7iArUePwvrbnoilsWFfW/35
 mN3ksvAs9NvDrdwUYedCxgsxbL6p22sE0ZYc/PNq0PKKPbeuHw+2YcXE48Da8JOQ0adfBMRfrnl
 1Heh+gspPuSP/FNN/qCLBTS8D8F9ncUDNhpO1hgSF78JN1T3vOGNogqn/gunA3lWvO1mnMxkq6/
 J9BYUO/lQR3YkU7EUmAfHFh3MFJfLtOl5kFC4ftnjZkGanacGpWVppsmbNDTwXBBmzOHp6k/ari
 sJpZsKiK/crhpaP4=
X-Google-Smtp-Source: AGHT+IEV6072yDB1x80AxlO1aLc1UORrnn0sL6jFnqhqEJMjlD4zz10B6ZPHsaG9im4IGER8ZuKyZw==
X-Received: by 2002:a17:90b:2ed0:b0:2fc:a3b7:108e with SMTP id
 98e67ed59e1d1-30a5adf7bc5mr79832a91.4.1746205694820; 
 Fri, 02 May 2025 10:08:14 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4745f93asm3276787a91.3.2025.05.02.10.08.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 10:08:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 10/33] drm/msm: Don't close VMAs on purge
Date: Fri,  2 May 2025 09:56:37 -0700
Message-ID: <20250502165831.44850-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502165831.44850-1-robdclark@gmail.com>
References: <20250502165831.44850-1-robdclark@gmail.com>
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

