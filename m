Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9087C8B1BB9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 09:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5A71125C1;
	Thu, 25 Apr 2024 07:18:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="5FP4mzrp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D00CF10E595
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 07:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714029520;
 bh=k571Z+1sV7KoMuDcg4n8KshVeFeWKoVnmOx6q6DpUmw=;
 h=From:To:Cc:Subject:Date:From;
 b=5FP4mzrpdlYXZcP2UbgrytTKAplziQk0gM4gUfSGdCuPT0V1MOC/eQkTIh9NC19CF
 zwSaoJCjzsLK3I02gWLjTiIcoEvnas+aOn3oXg0B7G16F3UV8f6TOv0iFDSZgRujN4
 apqZ4EILa8HrHOz+538fDA6PChTeBdVko44R+Kpd4ZETpwcrfmRIFFZA63hF4YPBtc
 5QnFeq1rkHAzTh3In5wXH05TBn5hh+l/fizNwJe2cUf03EA7sm+VRVofxCaIPl/hMB
 /FWGMD6fTVtZozWrBG0xpmRHEfsqVzX0PeZat5JucdhvvLvmaC1PvR86Jv5fZ8/uiJ
 wZU0f2t4cVzdQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4B32937820FA;
 Thu, 25 Apr 2024 07:18:40 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
Subject: [PATCH 0/3] drm/panthor: Collection of tiler heap related fixes
Date: Thu, 25 Apr 2024 09:18:34 +0200
Message-ID: <20240425071837.529039-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.44.0
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

This is a collection of tiler heap fixes for bugs/oddities found while
looking at incremental rendering.

We need to make sure those land before 6.10 is released (we still have
plenty of time), so we don't need to increment the driver version to
reflect the ABI changes.

Regards,

Boris

Antonino Maniscalco (1):
  drm/panthor: Fix tiler OOM handling to allow incremental rendering

Boris Brezillon (2):
  drm/panthor: Make sure the tiler initial/max chunks are consistent
  drm/panthor: Relax the check on the tiler chunk size

 drivers/gpu/drm/panthor/panthor_heap.c  | 5 ++++-
 drivers/gpu/drm/panthor/panthor_sched.c | 8 +++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.44.0

