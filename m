Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F275C9EF44
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 13:18:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4641610E12F;
	Wed,  3 Dec 2025 12:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Y/8lz74c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FC010E12F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Dec 2025 12:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764764280;
 bh=ExNvE1Psz9Dce0/PSPCwokE67PxXXMte3SWO0u1yfZ0=;
 h=From:To:Cc:Subject:Date:From;
 b=Y/8lz74cZWKWigtHHB17HreFHe2/CnYFe8lvGAiahTwgKhxcRIh2sa6aZvQG47nVt
 22VUnh7z4H+uIuyz//CDYZ7beOFgMjPDhjmaR1TsRrDMl3d3q4dJd3wE9gt3xjdBip
 SRKjfJfDZiw9zgg23NmZBLR9eyL6u1WUL+246TlTUzq8KPWW/eFvLpENvbzaiTlFkx
 qKQjuRBrJ9q5OTbub2nOYdh5YtEJe706T+HXJcMJIRG9lwWgOz40D9yTObLDIOGhwN
 mSvyAdL1S7/B56YhjRb76zJIE25frdTWbP109feIrhmiyoCgUI6ZIgnYQW2pd+tMyE
 uuTvj0rsWygGg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E144817E0330;
 Wed,  3 Dec 2025 13:17:59 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Akash Goel <akash.goel@arm.com>,
 Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com
Subject: [PATCH v3 0/3] drm/panthor: Fix regressions introduced recently
Date: Wed,  3 Dec 2025 13:17:47 +0100
Message-ID: <20251203121750.404340-1-boris.brezillon@collabora.com>
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

 drivers/gpu/drm/panthor/panthor_mmu.c   | 36 ++++++++++++++++++++-----
 drivers/gpu/drm/panthor/panthor_sched.c |  5 ++--
 2 files changed, 32 insertions(+), 9 deletions(-)

-- 
2.51.1

