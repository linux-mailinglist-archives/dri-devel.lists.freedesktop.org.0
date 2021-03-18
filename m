Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E79CF33FC4A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 01:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53CE96E860;
	Thu, 18 Mar 2021 00:39:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B7A6E860
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 00:39:29 +0000 (UTC)
IronPort-SDR: iu88x5A89rVxHVPOnF+H+uIlHsfZKsB+97FXVu0C1350BoOV8QtjDRcD2ruHzlb3vcrW22GKhB
 mPOfEEEFPqgQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9926"; a="209560482"
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="209560482"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2021 17:39:29 -0700
IronPort-SDR: BfE3Ug96GgZtPWeF0DnvpSDHd7zOFJijzE2oMUrPshS3rJvXdLfExlP247dIugOHn9a1gN+zsX
 Jl/P1JDFnSdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,257,1610438400"; d="scan'208";a="389039160"
Received: from lkp-server02.sh.intel.com (HELO 1c294c63cb86) ([10.239.97.151])
 by orsmga002.jf.intel.com with ESMTP; 17 Mar 2021 17:39:26 -0700
Received: from kbuild by 1c294c63cb86 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1lMghB-0000vt-J0; Thu, 18 Mar 2021 00:39:25 +0000
Date: Thu, 18 Mar 2021 08:38:51 +0800
From: kernel test robot <lkp@intel.com>
To: Parshuram Thombare <pthombar@cadence.com>, robert.foss@linaro.org,
 robh+dt@kernel.org, laurent.pinchart@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [RFC PATCH] drm: bridge: cdns-mhdp8546: cdns_mhdp_hdcp_set_lc() can
 be static
Message-ID: <20210318003851.GA86692@e53ce6e6f9c2>
References: <1615997158-16737-1-git-send-email-pthombar@cadence.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615997158-16737-1-git-send-email-pthombar@cadence.com>
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
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org,
 Parshuram Thombare <pthombar@cadence.com>, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 cdns-mhdp8546-hdcp.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
index c4bcacd23ee32..7757c272c49f6 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
@@ -499,7 +499,7 @@ static void cdns_mhdp_hdcp_prop_work(struct work_struct *work)
 	drm_modeset_unlock(&dev->mode_config.connection_mutex);
 }
 
-int cdns_mhdp_hdcp_set_lc(struct cdns_mhdp_device *mhdp, u8 *val)
+static int cdns_mhdp_hdcp_set_lc(struct cdns_mhdp_device *mhdp, u8 *val)
 {
 	int ret;
 
@@ -512,7 +512,7 @@ int cdns_mhdp_hdcp_set_lc(struct cdns_mhdp_device *mhdp, u8 *val)
 	return ret;
 }
 
-int
+static int
 cdns_mhdp_hdcp_set_public_key_params(struct cdns_mhdp_device *mhdp,
 				     struct cdns_hdcp_tx_public_key_param *val)
 {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
