Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45085A08B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 11:09:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2094310E28A;
	Mon, 19 Feb 2024 10:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 04C5F10E28A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 10:09:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45C331FB;
 Mon, 19 Feb 2024 02:10:07 -0800 (PST)
Received: from a077854.blr.arm.com (a077854.arm.com [10.162.41.80])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B992E3F762;
 Mon, 19 Feb 2024 02:09:24 -0800 (PST)
From: Faiz Abbas <faiz.abbas@arm.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 Faiz Abbas <faiz.abbas@arm.com>
Subject: [PATCH 0/3] Fixes for the komeda driver
Date: Mon, 19 Feb 2024 15:39:12 +0530
Message-Id: <20240219100915.192475-1-faiz.abbas@arm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following patches add fixes to the komeda DPU driver.

Patch 1 fixes an issue where the crtc always expects both pipelines to
always have remote nodes populated.

Patch 2 is a cosmetic fix that ensures komeda does not print verbose
pipeline information unless the entire pipeline is actually up.

Patch 3 adds a 40 bit DMA mask for each pipeline.

Amjad Ouled-Ameur (1):
  drm/arm/komeda: update DMA mask to 40 bits

Faiz Abbas (2):
  drm/arm/komeda: Fix komeda probe failing if there are no links in the
    secondary pipeline
  drm/arm/komeda: Move pipeline prints to after the entire pipeline has
    been enabled

 .../gpu/drm/arm/display/komeda/komeda_crtc.c  | 45 ++++++++++++++-----
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  4 ++
 .../gpu/drm/arm/display/komeda/komeda_kms.h   |  1 +
 .../drm/arm/display/komeda/komeda_pipeline.c  |  4 +-
 4 files changed, 41 insertions(+), 13 deletions(-)

-- 
2.25.1

