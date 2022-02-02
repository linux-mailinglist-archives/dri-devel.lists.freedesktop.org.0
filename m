Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B82DD4A6CC5
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 09:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7562410E6F8;
	Wed,  2 Feb 2022 08:18:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E511110E6F5
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 08:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1643789887; x=1675325887;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7sFp4+V0AEjVgG5Bisjjb/304mwU8lmozdaysw3mPFQ=;
 b=UagJKp2QAVEL/pfP7+lJz+n1a/EcFLetEWSuB9NFJpYNwCaY0BJI4BTK
 J4xOG/u1isgKjF3vs3EbFDEtLwjv0XPclzI9ouYiH0iGEVHoeNfVLjyHv
 I/BfjIcWqthBHJaNGVlTQLPNWMLLEoFxT6Inv3D7dccFPfO4VrJwmSeZr
 MB72d/7yRlAPi9KMtvW1ajpTYHfQL+CaV04OxRqGt7VSxLe+mVnO41DdH
 hXrSc3hrCi5Zzurs2kXUbYZaqT7ZbOFJOFuQvA07SMKWD8g4LWHrwohE4
 PLjv+EOtklGhpi7/kFoBGZAgMWrIyNnrxPRDgDqF5jA7GrJWxhj5gtyc8 A==;
X-IronPort-AV: E=Sophos;i="5.88,336,1635199200"; d="scan'208";a="21844617"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 02 Feb 2022 09:18:04 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 02 Feb 2022 09:18:04 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 02 Feb 2022 09:18:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1643789884; x=1675325884;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7sFp4+V0AEjVgG5Bisjjb/304mwU8lmozdaysw3mPFQ=;
 b=bREovfYQHNFWpcVOJH0ITSwugXIFR4hgLcCbU8dzwN3RRpP1OHDUP1x3
 7K0P1jbx8olRZjxoRzJwmUG0RErQB3TdoGVfg4Z/ozACy1U8Hcur7HrCq
 HMpLdGXDTzCviQDVMgJZzugY1g5PZdgrO3NjaX6+SqNfi6j/DowF8jIPZ
 TlUUoMqm3Svumgl86bNr1SFcdH6fz/7drwGeWD0ob3gZNIu3rAPIW7zfr
 ROoE05Fstf/b/W7S/bo7s/wG80uDLjIzQmzzRSwR03y6F5mwgmN8ab3NF
 n/h4RjmBrNrHlNCKqk2DMm3fqs7a3rGLJ0y3yJ+vhkSPbTr0SQnCbdiKP A==;
X-IronPort-AV: E=Sophos;i="5.88,336,1635199200"; d="scan'208";a="21844616"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 02 Feb 2022 09:18:04 +0100
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2BA4B280065;
 Wed,  2 Feb 2022 09:18:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 0/2] mxsfb fixes
Date: Wed,  2 Feb 2022 09:17:53 +0100
Message-Id: <20220202081755.145716-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This v2 collects both single patches from [1] and [2].

Changes in v2:
* Added Reviewed-by: Marek Vasut <marex@denx.de> to patch 1
* Updated commit message of patch 2 as suggested by Marek

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20220121095644.329256-1-alexander.stein@ew.tq-group.com/
[2] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20220121131238.507567-1-alexander.stein@ew.tq-group.com/

Alexander Stein (2):
  drm: mxsfb: Use dev_err_probe() helper
  drm: mxsfb: Fix NULL pointer dereference

 drivers/gpu/drm/mxsfb/mxsfb_drv.c | 3 +--
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 6 +++++-
 2 files changed, 6 insertions(+), 3 deletions(-)

-- 
2.25.1

