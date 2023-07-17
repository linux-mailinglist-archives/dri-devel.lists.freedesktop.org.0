Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26190755E4E
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB07410E202;
	Mon, 17 Jul 2023 08:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE10110E202
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:17:34 +0000 (UTC)
Received: from workpc.. (109-252-154-2.dynamic.spd-mgts.ru [109.252.154.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 33A456603203;
 Mon, 17 Jul 2023 09:17:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689581852;
 bh=cDQ2vNJdynhbZflqAFsbK6vZklSq9Zi8ClehMpPtBBs=;
 h=From:To:Cc:Subject:Date:From;
 b=gQcSPD210Nl413tX4EN9AKxAjl2Lu3jVl6iygQmOQ+d6udO7PTzMFmqu7SraPlMM4
 vX/IxYjmG1QqY7pZZegi5w3aSJyQgbDXthOZpem7w75Mtt7v5iUThLyQJsp+KFa6W7
 GWaLGifts77smDhMnNTGWKRC9WlWnlrdOEfhUrZe5rmVsQTKXh8/JG0MQoK2NoYJcS
 X9u9ZtbmfTkzOQDMg2J54xV1Sm8KyIaHEH8jQT/nr1WCaxT6SdVz8oWpN8oMUcSxWS
 40UfLI1qbcfVDyEEEaEbY54kV5xj3Z2QxGf/v/sSE0q6Fm/kLwnUX0NxT/U8by3OXv
 AgigAAND7l0sw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v1] MAINTAINERS: Add Boris Brezillon as Panfrost driver
 maintainer
Date: Mon, 17 Jul 2023 11:15:44 +0300
Message-ID: <20230717081544.1068254-1-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.41.0
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Boris Brezillon as Panfrost driver maintainer. Boris is a new lead
developer of the Panfrost Mesa driver and main developer behind the
upcoming Panthor kernel driver that will serve next-gen Mali GPUs.

Remove Tomeu and Alyssa, who left Collabora and stepped down from working
on Panfrost.

Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5d6536fef2fc..08dc75916148 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1615,9 +1615,8 @@ F:	drivers/gpu/drm/arm/display/komeda/
 
 ARM MALI PANFROST DRM DRIVER
 M:	Rob Herring <robh@kernel.org>
-M:	Tomeu Vizoso <tomeu.vizoso@collabora.com>
+M:	Boris Brezillon <boris.brezillon@collabora.com>
 R:	Steven Price <steven.price@arm.com>
-R:	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.41.0

