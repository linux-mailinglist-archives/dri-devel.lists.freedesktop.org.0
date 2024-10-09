Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9E09977B1
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 23:44:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4EE210E830;
	Wed,  9 Oct 2024 21:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="IP7Vn03r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82F610E818
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 21:44:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1728510238; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RNpVt7PgbXAoEY9ef9PTTEqmkLcTC28ULUs6HOqzh1GF6iHuffhAAYYVswsNmevzhE/qmFBw95n8Kd8bDoM08xhJGbjREdSVyd91kgcz1luFbeKzBJtrETG3t+nu0+KZNTEdLQYanPZm/+nJHpp6JuhKSc4mJq5HYtrUF3teGaE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1728510238;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=YIlrE0fcMEPzbyHoxB6Wnq7KQhP7bhlB1XNHnfKuC+g=; 
 b=WB+vWQfxbmW9Igb53vhVA8xgInqaObyCraR2r/lXoQSKq5ADwjyWws+G8VSfcNf+F4amsOGtPrGq6K7px+sfH/bAsVaSodQG07++oG/+XnXeLJF14VPMZyd2t3rLjfpJtkyFEdw6Bd+VNC07W3wRUE029oGcoemhofYosm5CSvE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1728510238; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=YIlrE0fcMEPzbyHoxB6Wnq7KQhP7bhlB1XNHnfKuC+g=;
 b=IP7Vn03rIc5lYG9cF81FXkBwzSB0pfvi1QCXO5SuW+Bec++6cDN6J7kM+GhzDYI7
 Iz/hPJ9QR0GjxUFpsdYYLdSKJVwB3BYedpLcz/m68p4doOlg9rOTgu9H1DtdMoL2Kum
 /eJd9kWY11iO/T8lVuAp2vPv5acBz/4L6/nLlqQY=
Received: by mx.zohomail.com with SMTPS id 1728510237013233.51078949345924;
 Wed, 9 Oct 2024 14:43:57 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: kernel@collabora.com, Stephen Rothwell <sfr@canb.auug.org.au>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/gpu: Fix Panthor documentation build warnings
Date: Wed,  9 Oct 2024 22:43:30 +0100
Message-ID: <20241009214346.2308917-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
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

Fix Panthor documentation build errors uncovered by the makedocs target
when building with extra warnings enabled.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Fixes: f25044688b04 ("drm/panthor: add sysfs knob for enabling job profiling")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 Documentation/gpu/drivers.rst         | 1 +
 Documentation/gpu/drm-usage-stats.rst | 1 +
 Documentation/gpu/panthor.rst         | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index b899cbc5c2b4..7b1282e2d807 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -22,6 +22,7 @@ GPU Driver Documentation
    afbc
    komeda-kms
    panfrost
+   panthor
 
 .. only::  subproject and html
 
diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
index a80f95ca1b2f..12ca3193bf15 100644
--- a/Documentation/gpu/drm-usage-stats.rst
+++ b/Documentation/gpu/drm-usage-stats.rst
@@ -186,4 +186,5 @@ Driver specific implementations
 
 * :ref:`i915-usage-stats`
 * :ref:`panfrost-usage-stats`
+* :ref:`panthor-usage-stats`
 * :ref:`xe-usage-stats`
diff --git a/Documentation/gpu/panthor.rst b/Documentation/gpu/panthor.rst
index cbf5c4429a2d..3f8979fa2b86 100644
--- a/Documentation/gpu/panthor.rst
+++ b/Documentation/gpu/panthor.rst
@@ -4,7 +4,7 @@
  drm/Panthor CSF driver
 =========================
 
-.. _panfrost-usage-stats:
+.. _panthor-usage-stats:
 
 Panthor DRM client usage stats implementation
 ==============================================
-- 
2.46.2

