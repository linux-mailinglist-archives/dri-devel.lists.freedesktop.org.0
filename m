Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB855ABC62D
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 19:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FA310E4CA;
	Mon, 19 May 2025 17:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EJGraBvH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E2D10E4A7;
 Mon, 19 May 2025 17:54:51 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id
 98e67ed59e1d1-30e87549254so4601613a91.2; 
 Mon, 19 May 2025 10:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747677291; x=1748282091; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5PtOzJz3dhv1LS9QV7CQZ1khNGE/TmCpgM2HiFcWd9g=;
 b=EJGraBvHfG4wXW05ToexYRQNJFvlK+BetfU3nT59KG1Zo9s10WFz7BWhwUK3LCbYYF
 4Fuy2+I3wNLoeyYEdEHa1biqVZlWm9hIWQ1ZRrkttu7uvzoW8zT9VgU8Pexl77lW+oZf
 mJAkKFassqcWPi2jwvDwdAqVFZ5g8VW2cd8Hz0elSDGrPFJ6rvTGTthTVMElCwX/xIsB
 71gsO76NmwFh2BP1JEm6dVQYodswZlYr6QUzVcgNn0UQDQQ1dnyvjzlTdDw7pPRBbXYK
 ekcsad7wDn741mKlra32EqSWCy2YEnFTCJhVV93tc34r9z94kxamRB3ADhb7js3aNga1
 A40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747677291; x=1748282091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5PtOzJz3dhv1LS9QV7CQZ1khNGE/TmCpgM2HiFcWd9g=;
 b=HLqQ5rnnk4jzQvtTmR2A3Eztiqc8wWnIcLA52WxGckYPa9ugYtBpEM4bB79Tlmnago
 glWuxmGtfpFM8KzEVQfcbF4OuF7Ve7e+NJE39SAIKIlb+yc62yY9S+/fvytZSMNpWakU
 B6oYjVvwandps9ls3s56HeM59MGsq7ovO6RN7qm6Vkc0uZvQ3KOD9TdD6NHrm3UicBWg
 LcxoqLCvoOGbFcHu1CY6kk3m9OnufipXKacSZIaccbG0eAQ3DlcdKc8fNi8Vu6S8e7Ko
 bY8sW0Yy065Hhbe0bIEFCzHGBAlkJGFh+QkgVVqyGP9lG/XupEqaVSXAa4rAKJNDiDYM
 215w==
X-Gm-Message-State: AOJu0Yw3S/fz8d03wn5TkAqEteXZCnMjlCEY3P8/PeT3ur0OlzDXWPei
 ChqD78dZv2aLAhUeRWGTlZv+dlTXHZArSJyK1sIFkNwBNRDX5SgJN5DlO9qRTA==
X-Gm-Gg: ASbGncuX/5NjSnNZKeehf1pG+rBQYb564vq/kUTAeJ3ZPMjWNwu8026eAtSf+Nbln7z
 BXQj4x9FHMCJmg0tVOO+fI15QDw74MWktQXar8XmREcVA+t0UP23W3+hupurBVzPiRlptcdVgnU
 vq2o+17ZLWGbBcCQcyQ2ZJz6KJg2vXhj2+4Wn9a9kpg1mZfhpdKdsV3BDjWCWiqM7nBwvuLY2W1
 bbzYE1TjDUFrggmW5cn8t5lOlYS1rpiIluBnRLERTzg2TfI7UEXKTksGJj/GfzkNXLg0GH/8yrs
 ho+qJbYgVA1rDnxj4rwJPEkYGylv9R4St51bqu/voYpp+qHoHaRW+PC3HGX7R5JEzOzlOz6HbFl
 19isWGY4kn6C0CqfgvihaXoxbtA==
X-Google-Smtp-Source: AGHT+IHpowPNebnU683NUJPLBntMDJlNddUI7cpcwZOKdAqHjpaQb88DRHEFLqSJ3HYORfJyQtdfDQ==
X-Received: by 2002:a17:90b:3905:b0:2ee:5bc9:75c3 with SMTP id
 98e67ed59e1d1-30e7d501dd0mr18086643a91.5.1747677290931; 
 Mon, 19 May 2025 10:54:50 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e833da84csm6741686a91.10.2025.05.19.10.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 10:54:50 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 12/40] drm/msm: Don't close VMAs on purge
Date: Mon, 19 May 2025 10:51:35 -0700
Message-ID: <20250519175348.11924-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519175348.11924-1-robdclark@gmail.com>
References: <20250519175348.11924-1-robdclark@gmail.com>
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

