Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5119FC7A8
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 03:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EAF10E685;
	Thu, 26 Dec 2024 02:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Lvk7K3qw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF91E10E683
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 02:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=lY+bpoGbSqA5dQMkhBlSwu7qgeb2Y0X+I/8GVHLM1bo=; b=Lvk7K3qwM8PdCJGk
 FQUoE/GZa5+rEjYNTalXgsvQTZVGXA6vuPeDQwjNFV9851mwVM+RniwKx93fYRKDLGErxZkI7W8F7
 q7euGFuEo04xmuQ6PRg1wa7cUn4wFbvg1bS9jr9LFfXNzS77ffAYtS1zMe1tDg5NUTdOBiqZlk7FW
 ITDZ6JzwY5gwhApnB3hkcDl343gxGBVooBvvH1jz0qyd8c0C23gd7Gp2HMNpNm/k1ULypNEQXAWko
 Y/afsMl+rdzgEQeIBUX+oT9bkB3Ww5peoZRZdH4dlHZsp5T/k9iy15sRSGmqilOk9jh3nan8gISJG
 oQP3d/1xgLh7BNUTEA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tQdbN-007F0L-25;
 Thu, 26 Dec 2024 02:27:53 +0000
From: linux@treblig.org
To: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, deller@gmx.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 0/7] gpu: ipu-v3: Remove unused functions
Date: Thu, 26 Dec 2024 02:27:45 +0000
Message-ID: <20241226022752.219399-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Hi,
  This set removes a bunch of functions in ipu-v3 that
have been unused for a long time (since 2012-2017).

  No changes to functions are made, just full deletions.

  Build tested only.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


Dr. David Alan Gilbert (7):
  gpu: ipu-v3: ipu-ic: Remove unused ipu_ic_task_graphics_init
  gpu: ipu-v3: Remove unused ipu_rot_mode_to_degrees
  gpu: ipu-v3: Remove unused ipu_idmac_channel_busy
  gpu: ipu-v3: Remove unused ipu_image_convert_* functions
  gpu: ipu-v3: Remove unused ipu_vdi_unsetup
  gpu: ipu-v3: ipu-csi: Remove unused functions
  gpu: ipu-v3 ipu-cpmem: Remove unused functions

 drivers/gpu/ipu-v3/ipu-common.c        |  38 ---------
 drivers/gpu/ipu-v3/ipu-cpmem.c         |  23 ------
 drivers/gpu/ipu-v3/ipu-csi.c           | 108 -------------------------
 drivers/gpu/ipu-v3/ipu-ic.c            |  73 -----------------
 drivers/gpu/ipu-v3/ipu-image-convert.c |  48 -----------
 drivers/gpu/ipu-v3/ipu-prv.h           |   2 -
 drivers/gpu/ipu-v3/ipu-vdi.c           |  11 ---
 include/video/imx-ipu-image-convert.h  |  32 --------
 include/video/imx-ipu-v3.h             |  14 ----
 9 files changed, 349 deletions(-)

-- 
2.47.1

