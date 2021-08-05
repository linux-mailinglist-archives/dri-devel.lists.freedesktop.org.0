Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E1D3E1C8A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 21:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97E46EB2F;
	Thu,  5 Aug 2021 19:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B9E6EB2F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 19:21:23 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: list@opendingux.net, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/2] drivers core: Export driver_deferred_probe_check_state()
Date: Thu,  5 Aug 2021 21:21:08 +0200
Message-Id: <20210805192110.90302-2-paul@crapouillou.net>
In-Reply-To: <20210805192110.90302-1-paul@crapouillou.net>
References: <20210805192110.90302-1-paul@crapouillou.net>
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

Export this function as a GPL symbol, so that it can be used from
modules.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/base/dd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index daeb9b5763ae..658f1527a58b 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -296,6 +296,7 @@ int driver_deferred_probe_check_state(struct device *dev)
 
 	return -EPROBE_DEFER;
 }
+EXPORT_SYMBOL_GPL(driver_deferred_probe_check_state);
 
 static void deferred_probe_timeout_work_func(struct work_struct *work)
 {
-- 
2.30.2

