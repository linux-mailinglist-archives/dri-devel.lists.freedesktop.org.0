Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 000691D9CC7
	for <lists+dri-devel@lfdr.de>; Tue, 19 May 2020 18:33:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B9F6E075;
	Tue, 19 May 2020 16:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376546E364
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 16:33:17 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 566432084C;
 Tue, 19 May 2020 16:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589905997;
 bh=hj4+aDlyCCczCFo/NFqRHPo0CtYhTwWBBDnNyGdYbXw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=P5HkZwJ+EeMn18kHufDBdBOyMA/MgPV1yKej26eCe38e+AJ6JQTn44WNgn3xgSHSp
 p8s/sBv5TIlbmZVW5UPLiuDdFestdaRE4tKazfdyZnwsN6+f7LwWeVZ5kYt8Bk0TNL
 Wks9+uzBU48V2I4avBGuvTvnx8EnmCCEB6/AJ4mA=
From: Sasha Levin <sashal@kernel.org>
To: alexander.deucher@amd.com, chris@chris-wilson.co.uk,
 ville.syrjala@linux.intel.com, Hawking.Zhang@amd.com,
 tvrtko.ursulin@intel.com
Subject: [RFC PATCH 4/4] gpu: dxgkrnl: create a MAINTAINERS entry
Date: Tue, 19 May 2020 12:32:34 -0400
Message-Id: <20200519163234.226513-5-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519163234.226513-1-sashal@kernel.org>
References: <20200519163234.226513-1-sashal@kernel.org>
MIME-Version: 1.0
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
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
 sthemmin@microsoft.com, gregkh@linuxfoundation.org, haiyangz@microsoft.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 spronovo@microsoft.com, wei.liu@kernel.org, linux-fbdev@vger.kernel.org,
 iourit@microsoft.com, kys@microsoft.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e64e5db31497..dccdfadda5df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4997,6 +4997,13 @@ F:	Documentation/filesystems/dnotify.txt
 F:	fs/notify/dnotify/
 F:	include/linux/dnotify.h
 
+DirectX GPU DRIVER
+M:	Sasha Levin <sashal@kernel.org>
+M:	Iouri Tarassov <iourit@microsoft.com>
+L:	linux-hyperv@vger.kernel.org
+S:	Supported
+F:	drivers/gpu/dxgcore/
+
 DISK GEOMETRY AND PARTITION HANDLING
 M:	Andries Brouwer <aeb@cwi.nl>
 S:	Maintained
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
