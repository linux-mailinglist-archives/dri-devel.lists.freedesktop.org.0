Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9184F7B5E7A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Oct 2023 03:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB9C10E17D;
	Tue,  3 Oct 2023 01:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E2F10E1FA
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Oct 2023 01:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=JZrgAFcocfmJ7wr8txtlkIWUzzd0SjphU1ZT0UcIUj8=; b=Ihpa+wmITsTi43mwt/V3xZUuUq
 VqebiD33iHqOUu2ob/xLb7m1foi6aYUqIBT3TAfJVEUQ/XvXdD6oayeQ7ZTC+s0KM69jArTiwLWC7
 GZsgipBgX4hQ9Yb61MTEu8mbNHd4uwNdOGsXi2cLY4CyzNhBZjGIEYT6ban9no+wrRQboLdXQdex0
 EOKzQlTW0LyTVnNCgRjnzBq3V9Fi5PhNroohu0qpBwjZpOrG3ggfzZz0XMRvKw96u2oIP2NeO0Voi
 HezlkPDY/eNpfdHpxGvyfebR8EaS9ydZnfBjVfj5czZM3lbZfAJDQq1O4MOsD33ANlNpe5VrJBFZq
 0G7Pdj0Q==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qnTyx-00DcHx-1c; Tue, 03 Oct 2023 01:13:51 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/rect: fix kernel-doc typos
Date: Mon,  2 Oct 2023 18:13:49 -0700
Message-ID: <20231003011349.27593-3-rdunlap@infradead.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231003011349.27593-1-rdunlap@infradead.org>
References: <20231003011349.27593-1-rdunlap@infradead.org>
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
 Randy Dunlap <rdunlap@infradead.org>, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Correct typos of "translated".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/drm/drm_rect.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/include/drm/drm_rect.h b/include/drm/drm_rect.h
--- a/include/drm/drm_rect.h
+++ b/include/drm/drm_rect.h
@@ -129,7 +129,7 @@ static inline void drm_rect_adjust_size(
 
 /**
  * drm_rect_translate - translate the rectangle
- * @r: rectangle to be tranlated
+ * @r: rectangle to be translated
  * @dx: horizontal translation
  * @dy: vertical translation
  *
@@ -146,7 +146,7 @@ static inline void drm_rect_translate(st
 
 /**
  * drm_rect_translate_to - translate the rectangle to an absolute position
- * @r: rectangle to be tranlated
+ * @r: rectangle to be translated
  * @x: horizontal position
  * @y: vertical position
  *
