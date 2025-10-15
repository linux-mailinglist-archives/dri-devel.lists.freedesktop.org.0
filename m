Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BD7BDBDFE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 02:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8601B10E6BC;
	Wed, 15 Oct 2025 00:11:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="GOlClg6i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9118810E6B9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:10:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760487047; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FiqKRchBy/UOwvv35ApcwqAxGt0Ia1z3IdRbEBNBITCy5G2VAw/iMuB8flAbDHcUHtDbBqB9EakYLDKVJB7B9TMfv2J8WlrXOi4bC2quMo3An4DFSTXst8xdeNIQDWk6YXdOmeB/v3WWRIGLrkgPWqrMoEFhfrzKIYO0LqiTDPo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760487047;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=N9xGpiHlxZl3wnv51uuxkUFFWgYoH7QahEAd4MQTmOk=; 
 b=HGctZZ9/Rg7TZWeznqB+XRp//vApYMkR/e1IlZIYl5kG2crV1Ew1fG4ROUhDo6iAfxxPC3shil4WrtthgdbYLmpx+5dxje6HBUpZaVX0cCvGJO3qMZd3b1D9oEQ3zDhrjSbrHTnb2/a8AfUR7AURj4+NF6Qamt/yaxqoy8PSHpA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760487047; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=N9xGpiHlxZl3wnv51uuxkUFFWgYoH7QahEAd4MQTmOk=;
 b=GOlClg6ikI6AyOV44ILPyP6jc/UztQFZtd7ggJ4xBi3bSRM+psCT+Vj0waOl8uxr
 nHfA6d3277Si4a5jAdn0vx3pY22Fvw3MfHaTAXme9I+aDkImFzMqjmUGkG3/aaxRsEV
 RNm5hBNDAfEWJ12NSkbWltQ0oSQ2kGtUq8lQLWX8=
Received: by mx.zohomail.com with SMTPS id 1760487046429914.2439824041805;
 Tue, 14 Oct 2025 17:10:46 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v6 10/12] drm/panfrost: Remove unused device property
Date: Wed, 15 Oct 2025 01:09:16 +0100
Message-ID: <20251015000930.356073-11-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015000930.356073-1-adrian.larumbe@collabora.com>
References: <20251015000930.356073-1-adrian.larumbe@collabora.com>
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

The as_in_use_mask device state variable is no longer in use.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h | 1 -
 drivers/gpu/drm/panfrost/panfrost_mmu.c    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index 45d77cda8b89..e61c4329fd07 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -147,7 +147,6 @@ struct panfrost_device {
 	DECLARE_BITMAP(is_suspended, PANFROST_COMP_BIT_MAX);
 
 	spinlock_t as_lock;
-	unsigned long as_in_use_mask;
 	unsigned long as_alloc_mask;
 	unsigned long as_faulty_mask;
 	struct list_head as_lru_list;
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 099e6797b2b5..867da6fc755b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -713,7 +713,6 @@ static void panfrost_mmu_release_ctx(struct kref *kref)
 		pm_runtime_put_autosuspend(pfdev->base.dev);
 
 		clear_bit(mmu->as, &pfdev->as_alloc_mask);
-		clear_bit(mmu->as, &pfdev->as_in_use_mask);
 		list_del(&mmu->list);
 	}
 	spin_unlock(&pfdev->as_lock);
-- 
2.51.0

