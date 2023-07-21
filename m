Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BA875C7CF
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 15:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A91D10E681;
	Fri, 21 Jul 2023 13:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B00F10E681
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 13:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689946177; x=1721482177;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2rKUwAFKJgzkKjqqHr46OXObcFtk3JdOWi9yJ8rPHuI=;
 b=d7B4ZJlw/20B8TJzUbqWptOmWNzbFrDrimZSkclF4avp2y7opv35RUXq
 b0S9X6JB2RH7Q+WMtM0Giq0RDJTmSVIdLiiV2kRSg3J6cmWdv7h7on7QF
 CoOd6mNDBOvzoZgWDH+Hz63iB3wqXqFzjyYYJNcoSlKd04+yPOYi/aGOI
 ZXzxe4kcg15SmmptGzl35yDM2tU8rbVw86QbjKhgvA+taBDITKu3URj6r
 QZXFoLMvi/1TOEes6P/ZXNS+6jUDRApkJ0kUE/SCvqNX+tluxWCzlpxwY
 fwoH45rgwnztRHqdpWBeHCDrczNeJoZ8i/ehnPb1gt2BwwRxn8YwgF4HC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="433251788"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="433251788"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2023 06:29:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="718818543"
X-IronPort-AV: E=Sophos;i="6.01,220,1684825200"; d="scan'208";a="718818543"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
 by orsmga007.jf.intel.com with ESMTP; 21 Jul 2023 06:29:32 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qMqCJ-0007Kj-0F;
 Fri, 21 Jul 2023 13:29:31 +0000
Date: Fri, 21 Jul 2023 21:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>
Subject: Re: [PATCH] drm/bridge: Add debugfs print for bridge chains
Message-ID: <202307212102.Fxrv1Ayx-lkp@intel.com>
References: <20230721-drm-bridge-chain-debugfs-v1-1-8614ff7e890d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721-drm-bridge-chain-debugfs-v1-1-8614ff7e890d@ideasonboard.com>
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

kernel test robot noticed the following build errors:

[auto build test ERROR on c7a472297169156252a50d76965eb36b081186e2]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-Valkeinen/drm-bridge-Add-debugfs-print-for-bridge-chains/20230721-174615
base:   c7a472297169156252a50d76965eb36b081186e2
patch link:    https://lore.kernel.org/r/20230721-drm-bridge-chain-debugfs-v1-1-8614ff7e890d%40ideasonboard.com
patch subject: [PATCH] drm/bridge: Add debugfs print for bridge chains
config: x86_64-randconfig-r032-20230720 (https://download.01.org/0day-ci/archive/20230721/202307212102.Fxrv1Ayx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230721/202307212102.Fxrv1Ayx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307212102.Fxrv1Ayx-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/drm_bridge.c: In function 'drm_bridge_chains_info':
>> drivers/gpu/drm/drm_bridge.c:1371:35: error: 'struct drm_bridge' has no member named 'of_node'
    1371 |                         if (bridge->of_node)
         |                                   ^~
   drivers/gpu/drm/drm_bridge.c:1372:70: error: 'struct drm_bridge' has no member named 'of_node'
    1372 |                                 drm_printf(&p, ", OF: %pOFfc", bridge->of_node);
         |                                                                      ^~


vim +1371 drivers/gpu/drm/drm_bridge.c

  1349	
  1350	#ifdef CONFIG_DEBUG_FS
  1351	static int drm_bridge_chains_info(struct seq_file *m, void *data)
  1352	{
  1353		struct drm_debugfs_entry *entry = m->private;
  1354		struct drm_device *dev = entry->dev;
  1355		struct drm_printer p = drm_seq_file_printer(m);
  1356		struct drm_mode_config *config = &dev->mode_config;
  1357		struct drm_encoder *encoder;
  1358		unsigned int bridge_idx = 0;
  1359	
  1360		list_for_each_entry(encoder, &config->encoder_list, head) {
  1361			struct drm_bridge *bridge;
  1362	
  1363			drm_printf(&p, "encoder[%u]\n", encoder->base.id);
  1364	
  1365			bridge = drm_bridge_chain_get_first_bridge(encoder);
  1366	
  1367			while (bridge) {
  1368				drm_printf(&p, "\tbridge[%u] type: %u, ops: %#x",
  1369					   bridge_idx, bridge->type, bridge->ops);
  1370	
> 1371				if (bridge->of_node)
  1372					drm_printf(&p, ", OF: %pOFfc", bridge->of_node);
  1373	
  1374				drm_printf(&p, "\n");
  1375	
  1376				bridge_idx++;
  1377				bridge = drm_bridge_get_next_bridge(bridge);
  1378			}
  1379		}
  1380	
  1381		return 0;
  1382	}
  1383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
