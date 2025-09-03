Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D31B47819
	for <lists+dri-devel@lfdr.de>; Sun,  7 Sep 2025 00:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5561810E40F;
	Sat,  6 Sep 2025 22:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lontium.com header.i=@lontium.com header.b="aCPAVQAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Wed, 03 Sep 2025 12:43:41 UTC
Received: from out28-217.mail.aliyun.com (out28-217.mail.aliyun.com
 [115.124.28.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D98910E7F6
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Sep 2025 12:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lontium.com; s=default;
 t=1756903418; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=R1mBpxZzOBmr4OvrwC6DRVSFnViYnXsa+gksnGmLJCM=;
 b=aCPAVQAyJ4hKNXqfNutGKGqoY5OkLKL4eR9SISIQURxVsN/JQZIQKc3I07FKz+7Z2rMTYV2X17FnPfUxf0fBfd8PpvYPE7lVXJPtFio+4HeVOhycxlVuqCOlQkcD2zNHJvR2MFxvFarWmmcZSxyRH4VnSn+qnOU41Vz2d1SIVZ6NMRKt9vn72c6FGbiYr2wppfS6c6TdQAyf9M9xsHoaIPUbMCWnoiKqbKDrmZFtKhY8ig/L9CwcTdpvINTGSeRoTtRkHbg4u/ysqAHjdOWyGzf7nFaFybBCYlqaEnkysQLNvLg42T48GBySJjkY0T+kDMJVu5QTt96gaiqysOzDNw==
Received: from ubuntu.localdomain(mailfrom:syyang@lontium.com
 fp:SMTPD_---.eWhncYY_1756903112 cluster:ay29) by smtp.aliyun-inc.com;
 Wed, 03 Sep 2025 20:38:33 +0800
From: syyang <syyang@lontium.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 yangsunyun1993@gmail.com, syyang <syyang@lontium.com>
Subject: [PATCH v1 0/2] Add LT9611C DRM bridge driver and device tree binding
Date: Wed,  3 Sep 2025 05:38:23 -0700
Message-Id: <20250903123825.1721443-1-syyang@lontium.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 06 Sep 2025 22:49:11 +0000
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

This series adds support for the Lontium LT9611C chip:

- Adds a new device tree binding documentation for the LT9611C bridge.
- Adds a new DRM bridge driver for the LT9611C chip.

syyang (2):
  This patch adds a new device tree binding documentation.
  This patch adds a new DRM bridge driver for the Lontium LT9611C chip.

 .../display/bridge/lontium,lt9611c.yaml       |  123 ++
 drivers/gpu/drm/bridge/Kconfig                |   16 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/lontium-lt9611c.c      | 1496 +++++++++++++++++
 4 files changed, 1636 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt9611c.yaml
 create mode 100644 drivers/gpu/drm/bridge/lontium-lt9611c.c

-- 
2.25.1

