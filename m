Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D511D774E4A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 00:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97EA10E1F5;
	Tue,  8 Aug 2023 22:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-104.mta1.migadu.com (out-104.mta1.migadu.com
 [IPv6:2001:41d0:203:375::68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEED810E1F5
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 22:34:25 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1691534063;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=tvIka87Hql946ZPpx6hd4vbkpJreYh/GIZnjwvj50oI=;
 b=fD3cQeg6RLS/RoDfc/Exz5Ycoc1KsDCs6Xcrk0c7SCJLaG4c8hqoFnWT1ZDYCXsxyMVNEv
 dt6ewPBVpkbZFj8YlHOjRjl6y8HrF8XzKAEqLa90xZETwhoEW48Jhr9DkTJR73SKlzW6St
 PbC84VaWW/+S7R6e1suM9448Bp4op8M=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 00/11] Fix typos, comments and copyright
Date: Wed,  9 Aug 2023 06:34:01 +0800
Message-Id: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

v1:
	* Various improve.
v2:
	* More fixes, optimizations and improvements.

Sui Jingfeng (11):
  PCI/VGA: Use unsigned type for the io_state variable
  PCI: Add the pci_get_class_masked() helper
  PCI/VGA: Deal with VGA class devices
  PCI/VGA: Drop the inline in the vga_update_device_decodes() function.
  PCI/VGA: Move the new_state assignment out of the loop
  PCI/VGA: Fix two typos in the comments of pci_notify()
  PCI/VGA: vga_client_register() return -ENODEV on failure, not -1
  PCI/VGA: Fix a typo to the comment of vga_default
  PCI/VGA: Fix a typo to the comments in vga_str_to_iostate() function
  PCI/VGA: Tidy up the code and comment format
  PCI/VGA: Replace full MIT license text with SPDX identifier

 drivers/pci/search.c   |  30 ++++++
 drivers/pci/vgaarb.c   | 233 +++++++++++++++++++++++++----------------
 include/linux/pci.h    |   7 ++
 include/linux/vgaarb.h |  27 +----
 4 files changed, 185 insertions(+), 112 deletions(-)


base-commit: 69286072664490a366f3331f9496fe78efaca603
-- 
2.34.1

