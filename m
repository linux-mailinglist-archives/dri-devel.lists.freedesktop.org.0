Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B704D60E4E5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF4F10E524;
	Wed, 26 Oct 2022 15:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D39310E524;
 Wed, 26 Oct 2022 15:36:04 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id kt23so16786311ejc.7;
 Wed, 26 Oct 2022 08:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V9/7qDsNBRa5cdoZiqx3KoYVsYmhpnIHqLbLNf8ZYFA=;
 b=BklkyqsluUW/4b9UQMOhTwvvR3IeT47he/LAH7AXLy3vfWp671N85eyVKH3o2TDEHH
 lpW8sd4Wm1Pirzt1+Ll/jJ6cw0933XG3vDIzCQbF09VCZY2HpYNPo9dHhoKnrDO/eQz0
 dDLsLO+UVdEjE9UdRslEWQhKjxXGp+Bql+lh5u/iEfQmYb0hd2rvYX7a0xcK4OTuVeRV
 3G1F9b2G7wfo/vPufEv2kfbslhtu9CLXSx589lzOyBAHNrUoXPYZIOFcg9PU2aUri4h2
 xuChJ9Mp7LKclf/O9Wk4cvMBNHjP041u/+4lh4iCsa8Ggmxme2ei+lrbx3eI9QznYQ83
 yrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V9/7qDsNBRa5cdoZiqx3KoYVsYmhpnIHqLbLNf8ZYFA=;
 b=D3zq5fLKyTXnCnpHqcLgqfAr92g1NfJDEBMa6psUU/4wpX1GRyChodXY24rE0R/aq9
 vV6v1bMnOXoADHO+INWkww2j2vYgHuL/59SaBfDWFujM0tUQwwvypTTahNkDVknlxPko
 ww/Oeat7yAXgK8a1Z9WJ5MA/esIm2Bp9MEwNShxNdFFTg6gw9ciC+rovd9Q/X6l409dU
 d7UPdo+zoXo11QeODrl1qQ4rFL0wgELFu0KOs3yD1yCzuuK72GsSMnxjCMSuEgrB9IxT
 rsLN/cpn2HR5aNWCXIt1nS8a013tp+WSgskF8vP8JREZzt+FBNbDSUZWzcbjGznOMWuB
 IXrA==
X-Gm-Message-State: ACrzQf2bfLKLMFZJR4zxTDkRKGyw9ZLuRJo65bH5Mu3XKyA9Bzc8wpOs
 44RffiblKToqjjSecKK8QAfUuhjfgps=
X-Google-Smtp-Source: AMsMyM6kiWKvIKTdcaUFwKmkFB7iNItwcaMDr+SCh5XADEtznbAtPa/K5lt6m3MKhq0BibzwHaETnw==
X-Received: by 2002:a17:906:ef8c:b0:78d:96b9:a0ad with SMTP id
 ze12-20020a170906ef8c00b0078d96b9a0admr38672106ejb.529.1666798562756; 
 Wed, 26 Oct 2022 08:36:02 -0700 (PDT)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 la3-20020a170907780300b007abafe43c3bsm3066715ejc.86.2022.10.26.08.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 08:36:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: luben.tuikov@amd.com, vprosyak@amd.com, Alexander.Deucher@amd.com,
 daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/scheduler: cleanup define
Date: Wed, 26 Oct 2022 17:35:56 +0200
Message-Id: <20221026153557.63541-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221026153557.63541-1-christian.koenig@amd.com>
References: <20221026153557.63541-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove some not implemented function define

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 include/drm/gpu_scheduler.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index c564be29c5ae..d646ff2fd557 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -492,7 +492,6 @@ void drm_sched_increase_karma(struct drm_sched_job *bad);
 bool drm_sched_dependency_optimized(struct dma_fence* fence,
 				    struct drm_sched_entity *entity);
 void drm_sched_fault(struct drm_gpu_scheduler *sched);
-void drm_sched_job_kickout(struct drm_sched_job *s_job);
 
 void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 			     struct drm_sched_entity *entity);
-- 
2.25.1

