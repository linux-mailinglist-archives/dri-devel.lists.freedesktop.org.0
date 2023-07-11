Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE16874F07F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 15:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3496910E394;
	Tue, 11 Jul 2023 13:44:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-6.mta0.migadu.com (out-6.mta0.migadu.com [91.218.175.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FDAF10E394
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 13:44:11 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1689083049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=BJjdG6L2gUz3XSLb7iaT/clDAQ8Xpf2Z0wejyVjNYKA=;
 b=K2rdUN/fcLEq8g88AHQm079daO5ptlE0mWmpIkhQAXbzQNz2rDvJsIDItYXY5fwkwo42rd
 EA7FSYO4OhTUz9XKm5Ve98+WfdkwLz674o7PON301Tld15jp0Uza8vNvuNpS2K6apihHgV
 yVUD+YDDU9fSTcK8kPMxF0DEruaJRPg=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Sui@freedesktop.org, Jingfeng@loongson.cn
Subject: [PATCH 0/6] PCI/VGA: Fix typos, comments and copyright
Date: Tue, 11 Jul 2023 21:43:48 +0800
Message-Id: <20230711134354.755966-1-sui.jingfeng@linux.dev>
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
Cc: loongson-kernel@lists.loongnix.cn, linux-pci@vger.kernel.org,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

Various improve.

Sui Jingfeng (6):
  PCI/VGA: Use unsigned type for the io_state variable
  PCI/VGA: Deal with PCI VGA compatible devices only
  PCI/VGA: drop the inline of vga_update_device_decodes() function
  PCI/VGA: Move the new_state assignment out the loop
  PCI/VGA: Tidy up the code and comment format
  PCI/VGA: Replace full MIT license text with SPDX identifier

 drivers/pci/vgaarb.c   | 168 ++++++++++++++++++++++-------------------
 include/linux/vgaarb.h |  27 +------
 2 files changed, 96 insertions(+), 99 deletions(-)

-- 
2.25.1

