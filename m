Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5904F0CD5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 00:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3B610E048;
	Sun,  3 Apr 2022 22:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4507A10E048
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Apr 2022 22:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=zDRYhWu2tTNgKAXBhJFHtn2OfOGGinXlPakc33ZktO4=; b=V/+VTiTVN8UP17TN0I/0PwqKZD
 LhFwmhDwbX+TSPuMoJdpy/7tbyHWltAQ3zxvdCTWwbkwDtm/r2yV54lsSEHi1G7rlrAPsndWN7dbu
 lSj+Rj7rzq4O3XSifGUGKwXVcQg6m76wSb6Lkmh//RE9gjIi6vJx5FmG8VSmAz0dsVfOP79/Ipiy4
 t3sEH/gAkUL9n363wpwIo74TAev32eazYOxn5pwmSwyU3g5OZcY++FCi/EKN/F6TOwLS/JNq1fmh7
 5i3MwLjbfAUnjsyzNqZERd1MEGeaxkO+PVZUHjIURfTwW7t8HzZaZo60nYz2SjIzRmmlYpqYymBNe
 SNTqCRCw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb96Z-00CVFY-5V; Sun, 03 Apr 2022 22:53:55 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: host1x: fix a kernel-doc warning
Date: Sun,  3 Apr 2022 15:53:54 -0700
Message-Id: <20220403225354.2492-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add @cache description to eliminate a kernel-doc warning.

include/linux/host1x.h:104: warning: Function parameter or member 'cache' not described in 'host1x_client'

Fixes: 1f39b1dfa53c ("drm/tegra: Implement buffer object cache")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thierry Reding <treding@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 include/linux/host1x.h |    1 +
 1 file changed, 1 insertion(+)

--- lnx-518-rc1.orig/include/linux/host1x.h
+++ lnx-518-rc1/include/linux/host1x.h
@@ -81,6 +81,7 @@ struct host1x_client_ops {
  * @parent: pointer to parent structure
  * @usecount: reference count for this structure
  * @lock: mutex for mutually exclusive concurrency
+ * @cache: host1x buffer object cache
  */
 struct host1x_client {
 	struct list_head list;
