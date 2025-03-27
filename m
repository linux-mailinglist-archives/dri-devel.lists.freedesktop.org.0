Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0F5A72D34
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 11:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B712410E2C8;
	Thu, 27 Mar 2025 10:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=swemel.ru header.i=@swemel.ru header.b="eonZAO0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A25510E2E4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 10:01:34 +0000 (UTC)
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
 t=1743069686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=7QQj7VDOyudzNy23vCqq1lW73TtfYCugacwtWeM0vd8=;
 b=eonZAO0RA3C+UcFIJ2UdgN3wT5wp1HXtlYR2YCMMVWnHeFIwcNMwUNP8+JU01YOIbz+v01
 w25tep7R1Se354VgGAWI2X9OUZ4bM9Wy2L1rsPDDjxNnCCLbrirRPoweVH57yL36dUjJYj
 U/3EObHkirILazSOVUHr+38DsSPqKdQ=
To: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: [PATCH 0/1] fbdev: atyfb: Fix buffer overflow
Date: Thu, 27 Mar 2025 13:01:23 +0300
Message-ID: <20250327100126.12585-1-arefev@swemel.ru>
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

The fixes I suggested are not the only ones.
There are more options for solving this problem.

1.Find datasheet for the chip, find out the register offset, calculate
   the address using the formula (4*Dword offset), add this value to
   the array lt_lcd_regs[] at index LCD_MISC_CNTL.

2. Delete this code completely, as the chip is very obsolete and 
   not applicable.

Found by Linux Verification Center (linuxtesting.org) with SVACE.  

Denis Arefev (1):
  fbdev: atyfb: Fix buffer overflow

 drivers/video/fbdev/aty/atyfb_base.c | 4 ++++
 1 file changed, 4 insertions(+)

base-commit: 1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95
-- 
2.43.0

