Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7860B135F08
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2020 18:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202E46E929;
	Thu,  9 Jan 2020 17:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581DF6E924;
 Thu,  9 Jan 2020 17:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jrus5T6YRl+VuSuoinRzHHZYCg8pYROoDWxPVaqqP8w=; b=Y8ZuYZsX/skFauk93PMEirHXag
 Oq5Kxk+zk2TuUbBuOIqoUMgyo0FKexeN8AvrLOXs89032gR3SMUUq4rACVlxHcpPowEZBHDUp6Kxe
 UbKcMd7h7TsEMiFhKMJX3Ak36T3KasoQufB/r+O/1PQv8MNSNnnPVyYE6az83SlwiIyWZCMWAy1m3
 w1hbRKy4XMnbNms0MukbK1b+/BMDkMDUq2flwwyFVLMhRL6m7wYiOyfWt0vmBvHvmW9KcQPW9V9O+
 9OMqbGPr4ED8IBUTGHlolVL7hffp5x8Y3WtHbRnFrr4RLZSg47MkmWOU7I73Gj0fbiII+DpJ6An6G
 F2mkvV7g==;
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1ipbNu-0002VI-1M; Thu, 09 Jan 2020 18:14:14 +0100
Received: from [24.134.37.229] (helo=192-168-0-109.rdsnet.ro)
 by sslproxy02.your-server.de with esmtpsa (TLSv1:ECDHE-RSA-AES256-SHA:256)
 (Exim 4.92) (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1ipbNt-000EJu-Qg; Thu, 09 Jan 2020 18:14:13 +0100
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [RFC PATCH 2/4] drm/i915/gvt: remove unused vblank_done completion
Date: Thu,  9 Jan 2020 19:13:55 +0200
Message-Id: <20200109171357.115936-3-julian.stecklina@cyberus-technology.de>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
References: <4079ce7c26a2d2a3c7e0828ed1ea6008d6e2c805.camel@cyberus-technology.de>
 <20200109171357.115936-1-julian.stecklina@cyberus-technology.de>
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.101.4/25689/Thu Jan  9 10:59:33 2020)
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
Cc: Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 linux-kernel@vger.kernel.org, hang.yuan@intel.com,
 dri-devel@lists.freedesktop.org, zhiyuan.lv@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This variable is used nowhere, so remove it.

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>

Signed-off-by: Julian Stecklina <julian.stecklina@cyberus-technology.de>
---
 drivers/gpu/drm/i915/gvt/gvt.h   | 2 --
 drivers/gpu/drm/i915/gvt/kvmgt.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
index 2604739e5680..8cf292a8d6bd 100644
--- a/drivers/gpu/drm/i915/gvt/gvt.h
+++ b/drivers/gpu/drm/i915/gvt/gvt.h
@@ -203,8 +203,6 @@ struct intel_vgpu {
 	struct mutex dmabuf_lock;
 	struct idr object_idr;
 
-	struct completion vblank_done;
-
 	u32 scan_nonprivbb;
 };
 
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index d725a4fb94b9..9a435bc1a2f0 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -1817,8 +1817,6 @@ static int kvmgt_guest_init(struct mdev_device *mdev)
 	kvmgt_protect_table_init(info);
 	gvt_cache_init(vgpu);
 
-	init_completion(&vgpu->vblank_done);
-
 	info->track_node.track_write = kvmgt_page_track_write;
 	info->track_node.track_flush_slot = kvmgt_page_track_flush_slot;
 	kvm_page_track_register_notifier(kvm, &info->track_node);
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
