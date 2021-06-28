Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998D93B565E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 02:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8D36E1F1;
	Mon, 28 Jun 2021 00:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FDB86E1F1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 00:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=vT5MOL85OD3uCD6pHmG/cA0FIka8DTN+aoVuSZv8xvY=; b=KC5xK9pp7yov9VZkLVaVvSpGzP
 tqgXnPO4xkgz8Xsx7O6Cb16vwx6GxBtu0rpa7F6DwV9lE1p74TyV9aDmF+SpLa38FmLHgp3K67SDl
 ykmb82F2M2iwaQtoegDWyH0RdADDBqe8Nl1WyHjA7M18j+jOHsjzYP1VMfAOUwUnKp6BV+qmf3SQP
 TcFsAfMcrI4fyxqOzTICIzywp2N0nwejD7UjU/fFz5FWNGqneAvG7k+cZ4SGZfgQ3d178AL4qcMHr
 L1BIL6Za1bapbvGXiVQVU0/yiQDcV8vg64EUwE/eRrIeQr/yrAxGCc1GG2VBCFKp2Tzz90jf7lYQL
 zZMMCizg==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lxfJd-006MU1-5e; Mon, 28 Jun 2021 00:39:57 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] host1x: bus.c: drop excess kernel-doc entry @key
Date: Sun, 27 Jun 2021 17:39:53 -0700
Message-Id: <20210628003953.5456-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
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
Cc: linux-tegra@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix kernel-doc warning in host1x:

../drivers/gpu/host1x/bus.c:774: warning: Excess function parameter 'key' description in '__host1x_client_register'

Fixes: 0cfe5a6e758f ("gpu: host1x: Split up client initalization and registration")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/host1x/bus.c |    1 -
 1 file changed, 1 deletion(-)

--- linux-next-20210625.orig/drivers/gpu/host1x/bus.c
+++ linux-next-20210625/drivers/gpu/host1x/bus.c
@@ -761,7 +761,6 @@ EXPORT_SYMBOL(host1x_client_exit);
 /**
  * __host1x_client_register() - register a host1x client
  * @client: host1x client
- * @key: lock class key for the client-specific mutex
  *
  * Registers a host1x client with each host1x controller instance. Note that
  * each client will only match their parent host1x controller and will only be
