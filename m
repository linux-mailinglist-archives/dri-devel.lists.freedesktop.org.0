Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8135D783934
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 07:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0F010E138;
	Tue, 22 Aug 2023 05:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E772F10E138
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 05:27:10 +0000 (UTC)
Received: from workpc.. (109-252-150-127.dynamic.spd-mgts.ru [109.252.150.127])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A138C66071F1;
 Tue, 22 Aug 2023 06:27:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1692682029;
 bh=GZc7OnE1X25837fvDc8typekPC+hVGKVoNYuBk86UiM=;
 h=From:To:Cc:Subject:Date:From;
 b=cRB7hdc1Em+J4DZo3c19REuE+kV773zKIozmX2yPQn0WqkkR1hig+HTRxCnEF+o3h
 K1MAXirBqda/Y9KHA45gmbMFo0Wngp3vIe640oj45ZH3Yu58yKsFrnGC3eW+sezbLS
 lWntrjo+1FjSIDmZxUWsH1ed+6XVv/G+6MEUpsyIupD/hk3TePYH1VsJM6nyc1sHsU
 onbOIwLPFQ6lYcA1arzpAdw7vis2TP0RToY0IA9+AQFC+BJPFTbYYjYvvOUtxURu+7
 R6yugKSphC+7D84/UXUSv+58gq75YwUoM19ohBmEgoJcqmvVa2hsmZj4lhpirVw3X5
 XXYhYHT/iyABw==
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH v2] MAINTAINERS: Add Boris Brezillon as Panfrost driver
 maintainer
Date: Tue, 22 Aug 2023 08:25:55 +0300
Message-ID: <20230822052555.538110-1-dmitry.osipenko@collabora.com>
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

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>
Acked-by: Tomeu Vizoso <tomeu.vizoso@tomeuvizoso.net>
Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---

Changelog:

v2: - Added acks from Boris, Alyssa and Tomeu. Tomeu answered with ack
      to the v1 email, though he answered to me only and not "to all",
      so it's not visible on the ML.

    - Made Boris' entry first as was requested by Rob Herring.

 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cd882b87a3c6..b2fc771e1f2d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1614,10 +1614,9 @@ F:	drivers/gpu/drm/arm/display/include/
 F:	drivers/gpu/drm/arm/display/komeda/
 
 ARM MALI PANFROST DRM DRIVER
+M:	Boris Brezillon <boris.brezillon@collabora.com>
 M:	Rob Herring <robh@kernel.org>
-M:	Tomeu Vizoso <tomeu.vizoso@collabora.com>
 R:	Steven Price <steven.price@arm.com>
-R:	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.41.0

