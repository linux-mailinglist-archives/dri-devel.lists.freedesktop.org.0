Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D26541F56
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 01:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E731122B4;
	Tue,  7 Jun 2022 23:11:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5C31122B4
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 23:11:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E43E3B8246D;
 Tue,  7 Jun 2022 23:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45CB1C3411E;
 Tue,  7 Jun 2022 23:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654643476;
 bh=oVYqK/0JGUVxA40hqtkxUoCBbKWyupsiiQCi9jG6aqM=;
 h=From:To:Cc:Subject:Date:From;
 b=TODwYeDxp3rkB9pChXaGC6C2OJWJtQMiJjapUpvVZFHb2Z/f2eOJr+5QFq/iGJnhr
 xDN4F+xgtWDlidfpsbNlobeXiJRHngrRcsmlz48zMKUd9i2IYPbwhCcX8WQb11toj0
 QzoqtyqdCY0f/TI5/eJwGxxV2m5EMjLT/qsnIYd3vCMcZTcPGBFd3WCPbEHNtzH15G
 35jNS/UsCwKt+gJiFOrFEMl/V8Z2rD1z/IYfbjuTBPVtGIdYkRYoOLjyhU1Io07GCx
 jAqJAyjG/6nacyW68E25sNFF8mJ4c3JJsDPpWQT3xGHJVSo/YqDON12im/kvOJXZ2s
 JtDZt0U6ti1Jw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 0/2] video: fbdev: Convert from PCI to generic power management
Date: Tue,  7 Jun 2022 18:11:10 -0500
Message-Id: <20220607231112.354165-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pci@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vaibhav Gupta <vaibhavgupta40@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bjorn Helgaas <bhelgaas@google.com>

PCI-specific power management (pci_driver.suspend and pci_driver.resume) is
deprecated.  If drivers implement power management, they should use the
generic power management framework, not the PCI-specific hooks.

No fbdev drivers actually implement PCI power management, but there are a
cirrusfb has some commented-out references to it and skeletonfb has
examples of it.  Remove these.

Bjorn Helgaas (2):
  video: fbdev: cirrusfb: Remove useless reference to PCI power
    management
  video: fbdev: skeletonfb: Convert to generic power management

 drivers/video/fbdev/cirrusfb.c   |  6 ------
 drivers/video/fbdev/skeletonfb.c | 13 +++++++------
 2 files changed, 7 insertions(+), 12 deletions(-)

-- 
2.25.1

