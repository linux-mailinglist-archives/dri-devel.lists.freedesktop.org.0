Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 788A966D695
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 08:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18BF10E2D2;
	Tue, 17 Jan 2023 07:02:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C84610E2D2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 07:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=5I2Zy0kqRlQJom1yDfokfsGYO/K5DfqUgzErbHGVL+I=; b=4hzrdTBBdegDh/+PkXMyOAELqt
 rNgH4KyJnWTXCKoGktXMZJWwIFjOj2fsHfgiwgEHa0ltW8HZzaf08C9e0YwIO66uFm9nctEsiDF4N
 mDE8fho5yq3+xfVIwKONQR9dEIoZGSHqs/HJhFuqvXfwK/cQHu2S1j0bToVrow3vqcU+++jlhVPat
 UaIsuc9zT2cz5JaycdWeqLWVAOiO9IGOpQAYqObyeHnJqzrQkfn3atweWrbpfjEb2Dn31Ui3WyHEP
 NUww/fDHTEDrlr6brssw8KDKpVsTx2+denBVktnjcsD8Yr32ZG5OdU5E6RxLJI5GNUn7qcVOVQWP2
 idh5Aquw==;
Received: from [2601:1c2:d80:3110::9307] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pHfzF-00D7F5-Ce; Tue, 17 Jan 2023 07:02:25 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/connector: fix a kernel-doc bad line warning
Date: Mon, 16 Jan 2023 23:02:24 -0800
Message-Id: <20230117070224.30751-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Building the kernel documentation causes this warning 7 times.
Fix it by adding a " *" line instead of a blank line.

drivers/gpu/drm/drm_connector.c:1849: warning: bad line: 

Fixes: 7d63cd8526f1 ("drm/connector: Add TV standard property")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/drm_connector.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1846,7 +1846,7 @@ EXPORT_SYMBOL(drm_mode_create_tv_propert
  * drm_mode_create_tv_properties - create TV specific connector properties
  * @dev: DRM device
  * @supported_tv_modes: Bitmask of TV modes supported (See DRM_MODE_TV_MODE_*)
-
+ *
  * Called by a driver's TV initialization routine, this function creates
  * the TV specific connector properties for a given device.
  *
