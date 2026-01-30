Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMXdIMUffGmgKgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 04:04:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D489CB6AFB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 04:04:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880B010E8DD;
	Fri, 30 Jan 2026 03:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T2zhW6RC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C2D10E353
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 03:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769742273; x=1801278273;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bc7u74LVYc9UekDNqOXsly9zkvNuhJqgVW3Ic95fVvM=;
 b=T2zhW6RCBiBF0DkQ6A/hufBZvJpxfYepyBOqsmOSliNgeIHuH0cEFVcl
 WtZIALnxw0A6mP5u1yg6vzWUdeWmVSV42Dq1gmRFqhpCzn1uwDvdpLJIk
 8HGXwJ9GdHyw1TErdDHJgMf7PHgsW8wJnmVhx52iH1IQH6X0lBN+yuDhT
 nHa/2ly3wlJRkyMr8YqABFGtGLXIJ4bLTDotBAem6knHK1gxWOwsTdMON
 H15SH6mdnARqaiVcLZT1Tl+AiQvFxC6hICh7guSSZX87WOgQtjAe6Bs91
 vcKoAvTJLq0zePYPuuQh7RFZXzryx7xgxCfaeD6bEPQDYWukFk8uqO8Ip Q==;
X-CSE-ConnectionGUID: lTIQ/0X2Rxqo0GMf5VmArA==
X-CSE-MsgGUID: V2Xw0BIxQP69TjwJ8BuxYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="88405918"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="88405918"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 19:04:32 -0800
X-CSE-ConnectionGUID: tGDPVXjSRcun43cHIKk5Wg==
X-CSE-MsgGUID: 2pEfEYMdSAmCuRgbkxja8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="207872451"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa006.jf.intel.com with ESMTP; 29 Jan 2026 19:04:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vleo4-00000000c7M-1707;
 Fri, 30 Jan 2026 03:04:24 +0000
Date: Fri, 30 Jan 2026 11:03:38 +0800
From: kernel test robot <lkp@intel.com>
To: Abhash Kumar Jha <a-kumar2@ti.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 devarsht@ti.com, u-kumar1@ti.com, sjakhade@cadence.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, s-jain1@ti.com,
 p-mantena@ti.com, tomi.valkeinen@ideasonboard.com
Subject: Re: [PATCH] drm/bridge: cdns-mhdp8546: Add suspend resume support to
 the bridge driver
Message-ID: <202601301031.VutflAtp-lkp@intel.com>
References: <20260129112016.2448037-1-a-kumar2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260129112016.2448037-1-a-kumar2@ti.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,lists.freedesktop.org,ideasonboard.com,kwiboo.se,gmail.com,ti.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:a-kumar2@ti.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:devarsht@ti.com,m:u-kumar1@ti.com,m:sjakhade@cadence.com,m:oe-kbuild-all@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:s-jain1@ti.com,m:p-mantena@ti.com,m:tomi.valkeinen@ideasonboard.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[ti.com,intel.com,linaro.org,kernel.org,suse.de,gmail.com,ffwll.ch,cadence.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,01.org:url,intel.com:email,intel.com:dkim,intel.com:mid,git-scm.com:url]
X-Rspamd-Queue-Id: D489CB6AFB
X-Rspamd-Action: no action

Hi Abhash,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v6.19-rc7 next-20260129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhash-Kumar-Jha/drm-bridge-cdns-mhdp8546-Add-suspend-resume-support-to-the-bridge-driver/20260129-193145
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260129112016.2448037-1-a-kumar2%40ti.com
patch subject: [PATCH] drm/bridge: cdns-mhdp8546: Add suspend resume support to the bridge driver
config: parisc-randconfig-002-20260130 (https://download.01.org/0day-ci/archive/20260130/202601301031.VutflAtp-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301031.VutflAtp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301031.VutflAtp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2447:12: warning: 'cdns_mhdp_suspend' defined but not used [-Wunused-function]
    static int cdns_mhdp_suspend(struct device *dev)
               ^~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:2387:12: warning: 'cdns_mhdp_resume' defined but not used [-Wunused-function]
    static int cdns_mhdp_resume(struct device *dev)
               ^~~~~~~~~~~~~~~~


vim +/cdns_mhdp_suspend +2447 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c

  2386	
> 2387	static int cdns_mhdp_resume(struct device *dev)
  2388	{
  2389		struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
  2390		unsigned long rate;
  2391		int ret;
  2392	
  2393		ret = clk_prepare_enable(mhdp->clk);
  2394		if (ret)
  2395			return ret;
  2396	
  2397		rate = clk_get_rate(mhdp->clk);
  2398		writel(rate % 1000000, mhdp->regs + CDNS_SW_CLK_L);
  2399		writel(rate / 1000000, mhdp->regs + CDNS_SW_CLK_H);
  2400		writel(~0, mhdp->regs + CDNS_APB_INT_MASK);
  2401	
  2402		ret = phy_init(mhdp->phy);
  2403		if (ret) {
  2404			dev_err(mhdp->dev, "Failed to initialize PHY: %d\n", ret);
  2405			goto disable_clk;
  2406		}
  2407		ret = phy_power_on(mhdp->phy);
  2408		if (ret < 0) {
  2409			dev_err(mhdp->dev, "Failed to power on PHY: %d\n", ret);
  2410			goto error;
  2411		}
  2412	
  2413		if (mhdp->powered_off) {
  2414			ret = cdns_mhdp_load_firmware(mhdp);
  2415			if (ret)
  2416				goto phy_off;
  2417	
  2418			ret = wait_event_timeout(mhdp->fw_load_wq,
  2419						mhdp->hw_state == MHDP_HW_READY,
  2420						msecs_to_jiffies(1000));
  2421			if (ret == 0) {
  2422				dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n",
  2423					__func__);
  2424				ret = -ETIMEDOUT;
  2425				goto phy_off;
  2426			}
  2427		} else {
  2428			ret = cdns_mhdp_set_firmware_active(mhdp, true);
  2429			if (ret) {
  2430				dev_err(mhdp->dev, "Failed to activate firmware (%pe)\n", ERR_PTR(ret));
  2431				goto phy_off;
  2432			}
  2433		}
  2434	
  2435		return 0;
  2436	
  2437	phy_off:
  2438		phy_power_off(mhdp->phy);
  2439	error:
  2440		phy_exit(mhdp->phy);
  2441	disable_clk:
  2442		clk_disable_unprepare(mhdp->clk);
  2443	
  2444		return ret;
  2445	}
  2446	
> 2447	static int cdns_mhdp_suspend(struct device *dev)
  2448	{
  2449		struct cdns_mhdp_device *mhdp = dev_get_drvdata(dev);
  2450		unsigned long timeout = msecs_to_jiffies(100);
  2451		int ret = 0;
  2452	
  2453		cancel_work_sync(&mhdp->hpd_work);
  2454		ret = wait_event_timeout(mhdp->fw_load_wq,
  2455					 mhdp->hw_state == MHDP_HW_READY,
  2456					 timeout);
  2457	
  2458		spin_lock(&mhdp->start_lock);
  2459		if (mhdp->hw_state != MHDP_HW_READY) {
  2460			spin_unlock(&mhdp->start_lock);
  2461			return -EINVAL;
  2462		}
  2463		mhdp->hw_state = MHDP_HW_STOPPED;
  2464		spin_unlock(&mhdp->start_lock);
  2465	
  2466		if (ret == 0) {
  2467			dev_err(mhdp->dev, "%s: Timeout waiting for fw loading\n", __func__);
  2468			ret = -ETIMEDOUT;
  2469			goto error;
  2470		} else {
  2471			ret = cdns_mhdp_set_firmware_active(mhdp, false);
  2472			if (ret) {
  2473				dev_err(mhdp->dev, "Failed to stop firmware (%pe)\n", ERR_PTR(ret));
  2474				goto error;
  2475			}
  2476		}
  2477	
  2478		phy_power_off(mhdp->phy);
  2479		phy_exit(mhdp->phy);
  2480		clk_disable_unprepare(mhdp->clk);
  2481	
  2482	error:
  2483		return ret;
  2484	}
  2485	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
