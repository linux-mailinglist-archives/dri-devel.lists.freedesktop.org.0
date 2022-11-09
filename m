Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 091FA62277F
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 10:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2597A10E13A;
	Wed,  9 Nov 2022 09:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C153D10E12B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 09:50:17 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id kt23so45146417ejc.7
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 01:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2YlHN1nH3duYo4rVIJwXoiPtGWnH1xvxqUpFQTi0sQE=;
 b=KerWE3PGAYde6ZWWKbXGu/arezDh+40mnKhFfwQQNeeJrewBdlMOt5bTJil3zY0uMZ
 2edS4r9NKASWtFdgkf2lEDx5/qcRElnk68yOSgPoiIuMfdPbAG2Wy85zclPGHnYr0Gdk
 mH+dRltXh1TPKRI6WciiR0oVWH17NW3N7alS83n5ihPpWsR14g8C1vku+dQTeMlf4IYL
 WKX+g2luXqoDnzM+Vx2aeeDcRoW+ppIp0bZYyrnkgKEZZlOwm8mO4Dx5C5NLMr81SpNq
 vUJic9rfSdP5w/1l3qqG0OYqM4lLISt5DFduI0QxJZNuvGzUreinMttJKDwDu8egXmSp
 cXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2YlHN1nH3duYo4rVIJwXoiPtGWnH1xvxqUpFQTi0sQE=;
 b=GwBR/u86goHKoe/+tjrBrz0scJNqTbGPfCz0v87VJ/pdlHesUV0rsQgyEpJ2QTlK5O
 A9Jb71bbbq8zxy0p8zgSsZ+WaN9KKqFpuV9jSRP9ejZ9bmF4wwTYFlVyhaeCHOXwZKSw
 KovMeSL70d+uP99m5IcIfqZTv76T7Uw28WDPcRo3OYMRlhVizazX/B+akKCNqxNDmsJ3
 sBGqqI738araFbAliqMWX5LHAmkmiplSoiOBkdoRY1iJm1AnIEC71BRgzXum8768IQBK
 NOG4ZhM0lFHp57vmi3XZ8Zw6iP1rQDMc8FoMinrBxsh6wMgNJV8IsIwE/ReSvjzMAc+f
 /0sw==
X-Gm-Message-State: ACrzQf1cn3iQ5TqNKYI4BVIr2sdWhwXTtOxGIzG6TGZ0Kod9jOQBXurQ
 UbkcEZr0DYN06j1PpLupCDA=
X-Google-Smtp-Source: AMsMyM6hue9dk2unfbic3n5A31AycSl25HLMqFYCsUzDMcha+w9+Kh0GIqXIy7S12AV5QIFo38eYUA==
X-Received: by 2002:a17:907:6e9e:b0:78c:5533:4158 with SMTP id
 sh30-20020a1709076e9e00b0078c55334158mr53190964ejc.417.1667987416194; 
 Wed, 09 Nov 2022 01:50:16 -0800 (PST)
Received: from able.fritz.box (p5b0ea229.dip0.t-ipconnect.de. [91.14.162.41])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a1709062ecc00b00780f24b797dsm5604543eji.108.2022.11.09.01.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Nov 2022 01:50:15 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Alexander.Deucher@amd.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, Shaoyun.Liu@amd.com
Subject: [PATCH 4/5] drm/scheduler: cleanup define
Date: Wed,  9 Nov 2022 10:50:09 +0100
Message-Id: <20221109095010.141189-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221109095010.141189-1-christian.koenig@amd.com>
References: <20221109095010.141189-1-christian.koenig@amd.com>
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
index 156601fd7053..73a2327d6b00 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -501,7 +501,6 @@ void drm_sched_increase_karma(struct drm_sched_job *bad);
 bool drm_sched_dependency_optimized(struct dma_fence* fence,
 				    struct drm_sched_entity *entity);
 void drm_sched_fault(struct drm_gpu_scheduler *sched);
-void drm_sched_job_kickout(struct drm_sched_job *s_job);
 
 void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
 			     struct drm_sched_entity *entity);
-- 
2.34.1

