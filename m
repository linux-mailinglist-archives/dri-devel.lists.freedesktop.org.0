Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E662205B7
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6455A6E45E;
	Wed, 15 Jul 2020 07:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3825F6E378
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 05:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=9IWnFL149DsEdluoFjPRJBomyc71/NwJFJ211eC5iS0=; b=wRO8II/w3mzO+r5WYhZT7LZzmb
 iv9lqJ9NXhnMFxUMyMMNi95Dc6KAPiCfwGQyO59W1z16OXTnTzEahv4xgdsSWD3GpKaCgy9cb0LZ1
 zllukXgRfRksbF8TNpQZ9BBc41CVGnRJjsPtVg5kM43RfvNJQ7WbKKePGJbi8su2un8z2JCvYGpiq
 QfnRYkZSYe2LXM2ysJ4SpHUTmU1M+pfW1r9KJZhSXokv8o9x50ORTeNw1w9Ut8eRoG2U8l63zfrJ7
 bMWvhwcdJtCKx52ZewNQtX5w69wY0NBHYf8LvbbTgfHxK7CbVoqTejk9kDMSPLR/F3wWQ2e6+8+Pm
 NACCPojQ==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvZtZ-0006Vd-JX; Wed, 15 Jul 2020 05:23:54 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] drm: drm_bridge.h: delete duplicated word in comment
Date: Tue, 14 Jul 2020 22:23:44 -0700
Message-Id: <20200715052349.23319-2-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200715052349.23319-1-rdunlap@infradead.org>
References: <20200715052349.23319-1-rdunlap@infradead.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Jul 2020 06:59:56 +0000
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drop doubled word "should" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 include/drm/drm_bridge.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200714.orig/include/drm/drm_bridge.h
+++ linux-next-20200714/include/drm/drm_bridge.h
@@ -475,7 +475,7 @@ struct drm_bridge_funcs {
 	 * one of them should be provided.
 	 *
 	 * If drivers need to tweak &drm_bridge_state.input_bus_cfg.flags or
-	 * &drm_bridge_state.output_bus_cfg.flags it should should happen in
+	 * &drm_bridge_state.output_bus_cfg.flags it should happen in
 	 * this function. By default the &drm_bridge_state.output_bus_cfg.flags
 	 * field is set to the next bridge
 	 * &drm_bridge_state.input_bus_cfg.flags value or
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
