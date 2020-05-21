Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 783D11DC897
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 10:30:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABBA36E917;
	Thu, 21 May 2020 08:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C0D6E915;
 Thu, 21 May 2020 08:30:36 +0000 (UTC)
IronPort-SDR: QjIuQuPpRsrZXNdoDodY5nrdYaj407VuwHfPKhZCxXOL6hSs8HS6o+IZlHpBySLt4b7pDlQbO1
 eJVnTK5G3+sw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2020 01:30:30 -0700
IronPort-SDR: GCA3JlLqCpnDWJqg9EI44GP6FD27GV4TN6LHYrrbLQXYUxfD+K4VycbwLzwLTQtPZqMR++lasG
 BrGQSmEHJ0YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,417,1583222400"; d="scan'208";a="268560572"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga006.jf.intel.com with ESMTP; 21 May 2020 01:30:28 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jbgax-000D7Q-FC; Thu, 21 May 2020 16:30:27 +0800
Date: Thu, 21 May 2020 16:30:19 +0800
From: kbuild test robot <lkp@intel.com>
To: Jonathan Marek <jonathan@marek.ca>
Subject: [RFC PATCH linux-next] drm/msm/a6xx: a6xx_hfi_send_start() can be
 static
Message-ID: <20200521083019.GA66267@f61f8b3f25ca>
References: <202005211627.xf4dxc5b%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202005211627.xf4dxc5b%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 kbuild-all@lists.01.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Fixes: 8167e6fa76c8 ("drm/msm/a6xx: HFI v2 for A640 and A650")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 a6xx_hfi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index f9db69e771214..9921e632f1ca2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -342,7 +342,7 @@ static int a6xx_hfi_send_test(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
-int a6xx_hfi_send_start(struct a6xx_gmu *gmu)
+static int a6xx_hfi_send_start(struct a6xx_gmu *gmu)
 {
 	struct a6xx_hfi_msg_start msg = { 0 };
 
@@ -350,7 +350,7 @@ int a6xx_hfi_send_start(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
-int a6xx_hfi_send_core_fw_start(struct a6xx_gmu *gmu)
+static int a6xx_hfi_send_core_fw_start(struct a6xx_gmu *gmu)
 {
 	struct a6xx_hfi_msg_core_fw_start msg = { 0 };
 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
