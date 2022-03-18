Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76344DD1ED
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 01:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E6910E08B;
	Fri, 18 Mar 2022 00:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F2E10E08B
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 00:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647563152; x=1679099152;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=nEXnMwQnkKbPodMBnWXo6Iw1Y9anOg8x3soFFOjo3AQ=;
 b=WfQIvl/uBI4i8wQrid2JnxbR1r4eIzbtkiB6rkCmB2587AtUrlVSgqSQ
 MZyUJlfT/7kTXa12wR3U1OjKg6QDthoMExGq5T3EZQrOJj0yWYyzaQVDk
 tRdVVDVw6uFYU7FKPeHeDuBwBcFrujh7ONfD61+DDjtlRHRzX7utFEiTf
 XjeNwAJRgoBSKYn4dnjM3+EaHIxzbyZzsxtarN9AlEA0kTKiJ6Tw1EWfh
 5cYmJKaGI5Wob3qatXk8Y+KJ+CHhVRLrF8LzNZNhvn4lmIwQ23Ji3/7Fx
 4iLs5udTehA+WBVbS840jNhRs1BwEHVsy0D4C6sxsz4qEzP6B4Fs0P1GR A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="256962442"
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; d="scan'208";a="256962442"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 17:25:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,190,1643702400"; d="scan'208";a="541597730"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 17 Mar 2022 17:25:50 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nV0RB-000EGd-DF; Fri, 18 Mar 2022 00:25:49 +0000
Date: Fri, 18 Mar 2022 08:25:09 +0800
From: kernel test robot <lkp@intel.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/gma500: psb_spank() can be static
Message-ID: <20220318002509.GA147752@da9b3b052118>
References: <20220317092555.17882-1-patrik.r.jakobsson@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220317092555.17882-1-patrik.r.jakobsson@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, kbuild-all@lists.01.org, tzimmermann@suse.de,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drivers/gpu/drm/gma500/psb_drv.c:102:6: warning: symbol 'psb_spank' was not declared. Should it be static?

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 drivers/gpu/drm/gma500/psb_drv.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index eeb681be9c955..e400b284ffd48 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -99,7 +99,7 @@ static const struct drm_ioctl_desc psb_ioctls[] = {
  *
  *	Soft reset the graphics engine and then reload the necessary registers.
  */
-void psb_spank(struct drm_psb_private *dev_priv)
+static void psb_spank(struct drm_psb_private *dev_priv)
 {
 	PSB_WSGX32(_PSB_CS_RESET_BIF_RESET | _PSB_CS_RESET_DPM_RESET |
 		_PSB_CS_RESET_TA_RESET | _PSB_CS_RESET_USE_RESET |
