Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E74B9C9B9D9
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 14:36:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 919FB10E149;
	Tue,  2 Dec 2025 13:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Xb1tlQH8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606B110E0DC
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 13:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764682566;
 bh=q0agStTMJxJrPbQBdJwPY9gmkGQu/LmlEmVhy6zXyas=;
 h=From:To:Cc:Subject:Date:From;
 b=Xb1tlQH8pgWNylSl8yVQHZ15oxI6PH4MS+pwRK16+P8RO6kN5DggIPRYvcH3YDwdd
 AAx2N5+Yy/msWwkoGUKn59ffvJP7ndeYDPiafHtaAZ0vOjJCFKCmoLFJlTcWriA35+
 3YBbobqZEiz1i0d0kwVGx+FtgDLG5diaO4ZtdsfMT0L65RCtBae4F0IGxwdoEZpTsO
 ZNrOIbuHfAnYUi0NZPqDEegoMNx92ujU/bk/3nR8jcLd4rMap5XLcq/I0mDiUwJrG6
 AHiYEbmBQexbyffYDa8isPlQV9ihoJTcOe2//HUoKeN3f9vljDRh9wk+4v9hJvoJJP
 PXR1M+o8SX+Lg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id AEA1417E1149;
 Tue,  2 Dec 2025 14:36:05 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 kernel@collabora.com
Subject: [PATCH v1 0/3] drm/panthor: Fix regressions introduced recently
Date: Tue,  2 Dec 2025 14:35:35 +0100
Message-ID: <20251202133538.83078-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.1
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

Hello,

This is a set of fixes for regressions noticed while testing the
drm-misc-next branch against mesa-ci.

Regards,

Boris

Boris Brezillon (3):
  drm/panthor: Drop a WARN_ON() in group_free_queue()
  drm/panthor: Make sure caches are flushed/invalidated when an AS is
    recycled
  drm/panthor: Unlock the locked region before disabling an AS

 drivers/gpu/drm/panthor/panthor_mmu.c   | 37 +++++++++++++++++++++----
 drivers/gpu/drm/panthor/panthor_sched.c |  5 ++--
 2 files changed, 33 insertions(+), 9 deletions(-)

-- 
2.51.1

