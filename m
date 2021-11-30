Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E94C463859
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 15:57:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F956EA04;
	Tue, 30 Nov 2021 14:57:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 469 seconds by postgrey-1.36 at gabe;
 Tue, 30 Nov 2021 14:57:05 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A3C6EA07
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 14:57:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 724CEB81A2E;
 Tue, 30 Nov 2021 14:49:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F2AC53FD0;
 Tue, 30 Nov 2021 14:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638283752;
 bh=hT3aGfUZtBFN7mjve8TZ4k4c9lSYCLKWOPLX7f4q8tc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=geZ+47HHdWTz21zPbCanXvm4heCBScEJvStN+tjdivUFTLWZU/rj2rKKn5qXR6msT
 mesrYI4vEK83SKu7a/KZBdoHfQJ5XWjNzZIo5M1CzXcUZhnEENpzfAOIZYeAJlGJ9d
 zRZgDyiLA5/9IxKk6juzT5sjnwKlnLHMZPDXCWjp2+l95XSa0lwZFyW0G6AcbEhQ8l
 M3sfOgya70Da4E2K/Gfy+9yVaL36UMgUeaMxWIGkjSLa9n+2t8H/bS3Embo41VnlLu
 svbxB4ixe7Da5iYv0BO/ozcEi0TMpETlRRElpJBXuZFpzGwu9TjVrXwx+j38aXYaDH
 ON75XRjcRoCZg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 49/68] xen: flag xen_drm_front to be not
 essential for system boot
Date: Tue, 30 Nov 2021 09:46:45 -0500
Message-Id: <20211130144707.944580-49-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211130144707.944580-1-sashal@kernel.org>
References: <20211130144707.944580-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Juergen Gross <jgross@suse.com>

[ Upstream commit 1c669938c31b6e2a0d5149c3c6257ca9df6cb100 ]

Similar to the virtual frame buffer (vfb) the pv display driver is not
essential for booting the system. Set the respective flag.

Signed-off-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Link: https://lore.kernel.org/r/20211022064800.14978-3-jgross@suse.com
Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/xen/xen_drm_front.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 9f14d99c763c2..bc7605324db39 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -773,6 +773,7 @@ static struct xenbus_driver xen_driver = {
 	.probe = xen_drv_probe,
 	.remove = xen_drv_remove,
 	.otherend_changed = displback_changed,
+	.not_essential = true,
 };
 
 static int __init xen_drv_init(void)
-- 
2.33.0

