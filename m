Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A3A8127D0
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 07:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A84F10E18B;
	Thu, 14 Dec 2023 06:15:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0349410E18B
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 06:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702534499; x=1734070499;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5t1LOiuEJntWFHQdvSiRvrUMe36npW7QzBe/Pw7UNS4=;
 b=m8RGP/v/Lh4nfZhG2mgJtqqtkphLniwFGMafymxn1a94ESKbVUMT7KCT
 re+UbKaaiSXDFOhxB0JQZPYBX4k/db5ntUuT8hzY5ob2ss06aZgJ9eCao
 jbISFsS+w3NiDErtULkTJ6zxiXNCf8hbvaBJVNtw8k2r/d1DFrWV6PdX1
 gy0o0FnR5ftzy61ql2wNKkaWlHXbrku1u5N2r1lh2XCbJDADQ7ikYXP5F
 S6291rmFgBT/tLfouTIvrHY+6goSjKd8inrmLnTW6zEgZ7B2cJeNomJ8j
 6dbdvnQ7SAkNrZHc7rFh2rGJW9mQJkEi0GH/n898xXy3yCoci3w1TWKq9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="16622482"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="16622482"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2023 22:14:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="723950203"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="723950203"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
 by orsmga003.jf.intel.com with ESMTP; 13 Dec 2023 22:14:55 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rDezk-000Lfb-1F;
 Thu, 14 Dec 2023 06:14:52 +0000
Date: Thu, 14 Dec 2023 14:14:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: hdmi-codec: drop drm/drm_edid.h include
Message-ID: <202312141302.SBNAHryl-lkp@intel.com>
References: <20231213095023.3928703-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213095023.3928703-1-jani.nikula@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, dri-devel@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on tiwai-sound/for-next tiwai-sound/for-linus drm-tip/drm-tip linus/master v6.7-rc5 next-20231213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/ASoC-hdmi-codec-drop-drm-drm_edid-h-include/20231213-175633
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231213095023.3928703-1-jani.nikula%40intel.com
patch subject: [PATCH v2] ASoC: hdmi-codec: drop drm/drm_edid.h include
config: i386-randconfig-002-20231214 (https://download.01.org/0day-ci/archive/20231214/202312141302.SBNAHryl-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141302.SBNAHryl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141302.SBNAHryl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/lontium-lt9611uxc.c: In function 'lt9611uxc_connector_get_modes':
   drivers/gpu/drm/bridge/lontium-lt9611uxc.c:301:10: error: implicit declaration of function 'drm_add_edid_modes'; did you mean 'drm_bridge_get_modes'? [-Werror=implicit-function-declaration]
     count = drm_add_edid_modes(connector, edid);
             ^~~~~~~~~~~~~~~~~~
             drm_bridge_get_modes
   drivers/gpu/drm/bridge/lontium-lt9611uxc.c: In function 'lt9611uxc_bridge_get_edid':
   drivers/gpu/drm/bridge/lontium-lt9611uxc.c:512:9: error: implicit declaration of function 'drm_do_get_edid'; did you mean 'drm_bridge_get_edid'? [-Werror=implicit-function-declaration]
     return drm_do_get_edid(connector, lt9611uxc_get_edid_block, lt9611uxc);
            ^~~~~~~~~~~~~~~
            drm_bridge_get_edid
>> drivers/gpu/drm/bridge/lontium-lt9611uxc.c:512:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
     return drm_do_get_edid(connector, lt9611uxc_get_edid_block, lt9611uxc);
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +512 drivers/gpu/drm/bridge/lontium-lt9611uxc.c

0cbbd5b1a012cd Dmitry Baryshkov 2020-11-02  496  
0cbbd5b1a012cd Dmitry Baryshkov 2020-11-02  497  static struct edid *lt9611uxc_bridge_get_edid(struct drm_bridge *bridge,
0cbbd5b1a012cd Dmitry Baryshkov 2020-11-02  498  					      struct drm_connector *connector)
0cbbd5b1a012cd Dmitry Baryshkov 2020-11-02  499  {
0cbbd5b1a012cd Dmitry Baryshkov 2020-11-02  500  	struct lt9611uxc *lt9611uxc = bridge_to_lt9611uxc(bridge);
0cbbd5b1a012cd Dmitry Baryshkov 2020-11-02  501  	int ret;
0cbbd5b1a012cd Dmitry Baryshkov 2020-11-02  502  
0cbbd5b1a012cd Dmitry Baryshkov 2020-11-02  503  	ret = lt9611uxc_wait_for_edid(lt9611uxc);
0cbbd5b1a012cd Dmitry Baryshkov 2020-11-02  504  	if (ret < 0) {
0cbbd5b1a012cd Dmitry Baryshkov 2020-11-02  505  		dev_err(lt9611uxc->dev, "wait for EDID failed: %d\n", ret);
1bb7ab402da44e Dmitry Baryshkov 2021-01-22  506  		return NULL;
1bb7ab402da44e Dmitry Baryshkov 2021-01-22  507  	} else if (ret == 0) {
1bb7ab402da44e Dmitry Baryshkov 2021-01-22  508  		dev_err(lt9611uxc->dev, "wait for EDID timeout\n");
1bb7ab402da44e Dmitry Baryshkov 2021-01-22  509  		return NULL;
0cbbd5b1a012cd Dmitry Baryshkov 2020-11-02  510  	}
0cbbd5b1a012cd Dmitry Baryshkov 2020-11-02  511  
0cbbd5b1a012cd Dmitry Baryshkov 2020-11-02 @512  	return drm_do_get_edid(connector, lt9611uxc_get_edid_block, lt9611uxc);
0cbbd5b1a012cd Dmitry Baryshkov 2020-11-02  513  }
0cbbd5b1a012cd Dmitry Baryshkov 2020-11-02  514  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
