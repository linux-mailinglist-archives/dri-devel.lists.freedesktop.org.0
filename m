Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F39252A97E
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 19:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9D71135DA;
	Tue, 17 May 2022 17:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256A21135D9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 17:42:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alarumbe) with ESMTPSA id B3BD21F449B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652809347;
 bh=dwFV6wwYPQFzN0RG8SUDQfOk06A38CwiUw5FunZmEMA=;
 h=From:To:Cc:Subject:Date:From;
 b=mKyiGd2EO7Xnd2FStwLkHGSDWggRPFbuuZrTGO7pJlnxBpZjH0oh1LWlAAeLpVvdW
 qUKrmcD3favPTtnM3olXyS7wHUgVOEChdZK1EazvZBJZnYQuL5daTN8eO5gjulWrNl
 ++BkfkXYQedLyKljaV///qFwr3ZrhSGJUlau3Xn59d3mSC0RGb2tu0TkU+qs1oHs7A
 zcdJhflPkd1vkGEMFbWsitGKYI+vHQAo+MOeLfD7hBfRLb8vk/SokNlelgSGwmNypQ
 oRBLbF+uH+pC10C75hiblw0IB1BRv0vm8AyIQ5msf+TQ8wCq2aqbtJQiZCkXrcFbKZ
 z1Rhl5ovuZe3A==
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/1] devcoredump support for Panfrost GPU driver
Date: Tue, 17 May 2022 18:42:15 +0100
Message-Id: <20220517174216.381287-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: adrian.larumbe@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds support for devcoredump in the Panfrost driver. Code
structure is heavily inspired by similar functionality in the Etnaviv
driver, but the main goal of the crash dump is feeding it to a userspace
analyser that accesses the BO raw binary data to pass it to the pandecode
library.

Mesa MR under review can be found at:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14034

Adrián Larumbe (1):
  drm/panfrost: Add support for devcoredump

 drivers/gpu/drm/panfrost/Kconfig         |   1 +
 drivers/gpu/drm/panfrost/Makefile        |   3 +-
 drivers/gpu/drm/panfrost/panfrost_dump.c | 198 +++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_dump.h |  12 ++
 drivers/gpu/drm/panfrost/panfrost_job.c  |   3 +
 include/uapi/drm/panfrost_drm.h          |  32 ++++
 6 files changed, 248 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.h

-- 
2.35.1

