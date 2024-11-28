Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103C59DBD3C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 22:13:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817E810ED69;
	Thu, 28 Nov 2024 21:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="De3vQalX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBAE10ED64
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 21:13:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732828374; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Iqt1iX2INO98N3AvbhmT0ROJ2qvAKHwItoX4py5bL+Dxse0P21aOy0Zgpm6XFfFR8A4A12WX6pYpY0zcICWLgeEmaux2bIL11/13UlJ3LohlV5NlHF3Zb19GBX1SQYKr5I5X3Azom2EsyX0Dy/d2uwX9Y+vYQ6HnKj5BgOLqka8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732828374;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=tOVwrrlUZ2MlE+48s7qwMLmhwjK5xM0tNaJsi4iUz2U=; 
 b=OQR9EWPgZ42ZbPvIrFiU0OAvHAzMCQPaf+3EtJ0SWdGfNYioIpjqgCdZcp3gwXSdXRO3gcIqp8idv8Ov3/0xNzWV6D0gqC/PmOkwRi3CvklgHTuAtA0/rDpwX0Dyjby3hlvpNPBQVVBe0B7+KfoQK25iQr+j5Wh9kTDXLKt/Mvs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732828374; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=tOVwrrlUZ2MlE+48s7qwMLmhwjK5xM0tNaJsi4iUz2U=;
 b=De3vQalXNmNn99Xw3ePAZim89tn6R5nYeUD6Md7ZEgC4nYFWhMd3YshLrAOqMPaT
 MrqaEm99mLNXKfESEtPK/fQ1j4bDncQp4zDKpwcz8yTt5171/UdzFG67cnVjXUHcsYW
 JK8PU5VWAkeSAdOSnYucvEYxeNBCICu2AHXta2wQ=
Received: by mx.zohomail.com with SMTPS id 1732828374531886.7951127970854;
 Thu, 28 Nov 2024 13:12:54 -0800 (PST)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] drm/panfrost: Remove unused device property
Date: Thu, 28 Nov 2024 21:06:23 +0000
Message-ID: <20241128211223.1805830-9-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128211223.1805830-1-adrian.larumbe@collabora.com>
References: <20241128211223.1805830-1-adrian.larumbe@collabora.com>
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

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_device.h | 1 -
 drivers/gpu/drm/panfrost/panfrost_mmu.c    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index fc83d5e104a3..b91957f886ea 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -117,7 +117,6 @@ struct panfrost_device {
 	DECLARE_BITMAP(is_suspended, PANFROST_COMP_BIT_MAX);
 
 	spinlock_t as_lock;
-	unsigned long as_in_use_mask;
 	unsigned long as_alloc_mask;
 	unsigned long as_faulty_mask;
 	struct list_head as_lru_list;
diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 5e30888bea0e..95df39b463d8 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -604,7 +604,6 @@ static void panfrost_mmu_release_ctx(struct kref *kref)
 		pm_runtime_put_autosuspend(pfdev->base.dev);
 
 		clear_bit(mmu->as, &pfdev->as_alloc_mask);
-		clear_bit(mmu->as, &pfdev->as_in_use_mask);
 		list_del(&mmu->list);
 	}
 	spin_unlock(&pfdev->as_lock);
-- 
2.47.0

