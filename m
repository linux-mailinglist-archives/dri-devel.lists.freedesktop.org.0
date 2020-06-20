Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D4D20213B
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jun 2020 06:16:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311336ED26;
	Sat, 20 Jun 2020 04:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B0B6ED26
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jun 2020 04:16:42 +0000 (UTC)
IronPort-SDR: HNHxnzRMJt0x1eQU+cbP6xoO7Pa4TDPtKU+qelKjrxV0IBLO2fBVr90yJ3vrfWg3auWaaZxkDx
 /CdWywEztw9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9657"; a="130604441"
X-IronPort-AV: E=Sophos;i="5.75,257,1589266800"; d="scan'208";a="130604441"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2020 21:16:41 -0700
IronPort-SDR: +ZbB+HOkXUxi20T35I/EWUD9LHbV50lt/Q96BNYfBQOrw34EDqIsHSTxJV0w59HsNc2iI8mOwn
 /qVWy6UDE64Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,257,1589266800"; d="scan'208";a="352917595"
Received: from lkp-server02.sh.intel.com (HELO 3aa54c81372e) ([10.239.97.151])
 by orsmga001.jf.intel.com with ESMTP; 19 Jun 2020 21:16:38 -0700
Received: from kbuild by 3aa54c81372e with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1jmUvm-00010v-6o; Sat, 20 Jun 2020 04:16:38 +0000
Date: Sat, 20 Jun 2020 12:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: Vinay Simha BN <simhavcs@gmail.com>
Subject: [RFC PATCH] display/drm/bridge: tc358775_parse_dt() can be static
Message-ID: <20200620041627.GA26592@14d5058516e7>
References: <20200618121902.16841-2-simhavcs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618121902.16841-2-simhavcs@gmail.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, kbuild-all@lists.01.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Vinay Simha BN <simhavcs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Signed-off-by: kernel test robot <lkp@intel.com>
---
 tc358775.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 87af3271b63521..88a45e86eae334 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -502,7 +502,7 @@ static int tc_mode_valid(struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
-int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
+static int tc358775_parse_dt(struct device_node *np, struct tc_data *tc)
 {
 	struct device_node *endpoint;
 	struct device_node *parent;
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
