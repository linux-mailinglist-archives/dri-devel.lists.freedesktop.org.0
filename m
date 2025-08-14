Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5D6B26465
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 13:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C199D10E869;
	Thu, 14 Aug 2025 11:35:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="rax3Cdkx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 704B710E0C1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 11:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
 bh=yeZ0QOI7MSkm018DLlLIOpBpxLpIe0Ad2O7gJoYLZVk=; b=rax3CdkxDTNsJWkPrVCDb1v4Hh
 SKbMy9iqy3wjH+tHbDldmOL6N4uKb4qvYQMM2eF5VyKsf/Mrg84Dbl3eP987XtpJ0E49gOo8KWNWr
 oThaUbnA7CJbl5H9X60NVe2vG/LKe4fdNqD3tkExUB6k7JZ69way/P31+ISmbWyKd3OTbW2z2Zosy
 gMJ5jc1wLuWbXdbh4URQzvZmZ14ZZsqHfE3kgr5RVRqPXarJUH3Yu/5GfByjaj3SnMJrP0p2WaNxN
 jmov/P/dNNZJ6jyvS0h0PERmRzcUt8MyaQvnR29Exx14N9zqrkKvszDn2X+X0Xe5BU/lK3rs30z2R
 nk/DGxkg==;
Received: from i53875b38.versanet.de ([83.135.91.56] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1umWEz-0003Km-1F; Thu, 14 Aug 2025 13:35:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: tomeu@tomeuvizoso.net
Cc: ogabbay@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, heiko@sntech.de
Subject: [PATCH 0/2] Rocket Kconfig fixes
Date: Thu, 14 Aug 2025 13:35:17 +0200
Message-ID: <20250814113519.1551855-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
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

More common indentation and depending on the actual accel framework.

Heiko Stuebner (2):
  accel/rocket: Fix indentation of Kconfig entry
  accel/rocket: Depend on DRM_ACCEL not just DRM

 drivers/accel/rocket/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.47.2

