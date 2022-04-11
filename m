Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 863514FBBFC
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 14:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B1F10E116;
	Mon, 11 Apr 2022 12:25:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204D310E218;
 Mon, 11 Apr 2022 12:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649679901; x=1681215901;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GpeF4bUkjxGtq5KcRWPaTMiqhnxNUoYNZzMVEdNfiEY=;
 b=V9mY9hz6imX8LTUQ9MnN43a7yA9teeirE22rj6bjhXJEvnOrPSTMRdql
 KOaU2BZIiumtxfsdHOSeCdd6om5TRYwR5uVupe+9oxGfxhvBwrDwSLuIf
 e2jCoNAZLZSobpuqwTVgcIOZ1fX+9VU1820hvtKQdy30h3+GdPNzR2e2D
 9JdFMsDDvAiCaUjVcIKKnueAAJlas8see4DwhW24L85hTRYdxFqX8cWns
 ah/8i0CdBTxxoVdR89UoDrNSfJBvIdYk2NcdmNfvkfev/roXSyTLw8fUH
 77pgWPsEjz6sYVyoIj1c1mzpQOQzGdQtiRyafHuAIRvcg0HVtg/Leb42h Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="261539092"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="261539092"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 05:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="610964880"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
 by fmsmga008.fm.intel.com with ESMTP; 11 Apr 2022 05:24:59 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1ndt6I-0001qA-BM;
 Mon, 11 Apr 2022 12:24:58 +0000
Date: Mon, 11 Apr 2022 20:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [CI v2 12/12] drm/edid: add EDID block count and
 size helpers
Message-ID: <202204112019.U9iIZWqP-lkp@intel.com>
References: <44265d5a3f64e9d7ad9984fee766f68d0b8bd473.1649670305.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44265d5a3f64e9d7ad9984fee766f68d0b8bd473.1649670305.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 llvm@lists.linux.dev, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on next-20220411]
[cannot apply to drm/drm-next drm-intel/for-linux-next v5.18-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-edid-low-level-EDID-block-read-refactoring-etc/20220411-175027
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a001-20220411 (https://download.01.org/0day-ci/archive/20220411/202204112019.U9iIZWqP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ba74d3cc8cc1b6ba4c34a039e797994ddbc77567
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jani-Nikula/drm-edid-low-level-EDID-block-read-refactoring-etc/20220411-175027
        git checkout ba74d3cc8cc1b6ba4c34a039e797994ddbc77567
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_edid.c:2170:6: warning: logical not is only applied to the left hand side of this comparison [-Wlogical-not-parentheses]
           if (!edid_extension_block_count(edid) == 0)
               ^                                 ~~
   drivers/gpu/drm/drm_edid.c:2170:6: note: add parentheses after the '!' to evaluate the comparison first
           if (!edid_extension_block_count(edid) == 0)
               ^
                (                                    )
   drivers/gpu/drm/drm_edid.c:2170:6: note: add parentheses around left hand side expression to silence this warning
           if (!edid_extension_block_count(edid) == 0)
               ^
               (                                )
   1 warning generated.


vim +2170 drivers/gpu/drm/drm_edid.c

  2112	
  2113	/**
  2114	 * drm_do_get_edid - get EDID data using a custom EDID block read function
  2115	 * @connector: connector we're probing
  2116	 * @get_edid_block: EDID block read function
  2117	 * @data: private data passed to the block read function
  2118	 *
  2119	 * When the I2C adapter connected to the DDC bus is hidden behind a device that
  2120	 * exposes a different interface to read EDID blocks this function can be used
  2121	 * to get EDID data using a custom block read function.
  2122	 *
  2123	 * As in the general case the DDC bus is accessible by the kernel at the I2C
  2124	 * level, drivers must make all reasonable efforts to expose it as an I2C
  2125	 * adapter and use drm_get_edid() instead of abusing this function.
  2126	 *
  2127	 * The EDID may be overridden using debugfs override_edid or firmware EDID
  2128	 * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
  2129	 * order. Having either of them bypasses actual EDID reads.
  2130	 *
  2131	 * Return: Pointer to valid EDID or NULL if we couldn't find any.
  2132	 */
  2133	struct edid *drm_do_get_edid(struct drm_connector *connector,
  2134				     read_block_fn read_block,
  2135				     void *context)
  2136	{
  2137		enum edid_block_status status;
  2138		int i, invalid_blocks = 0;
  2139		struct edid *edid, *new;
  2140	
  2141		edid = drm_get_override_edid(connector);
  2142		if (edid)
  2143			goto ok;
  2144	
  2145		edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
  2146		if (!edid)
  2147			return NULL;
  2148	
  2149		status = edid_block_read(edid, 0, read_block, context);
  2150	
  2151		edid_block_status_print(status, edid, 0);
  2152	
  2153		if (status == EDID_BLOCK_READ_FAIL)
  2154			goto fail;
  2155	
  2156		/* FIXME: Clarify what a corrupt EDID actually means. */
  2157		if (status == EDID_BLOCK_OK || status == EDID_BLOCK_VERSION)
  2158			connector->edid_corrupt = false;
  2159		else
  2160			connector->edid_corrupt = true;
  2161	
  2162		if (!edid_block_status_valid(status, edid_block_tag(edid))) {
  2163			if (status == EDID_BLOCK_ZERO)
  2164				connector->null_edid_counter++;
  2165	
  2166			connector_bad_edid(connector, edid, 1);
  2167			goto fail;
  2168		}
  2169	
> 2170		if (!edid_extension_block_count(edid) == 0)
  2171			goto ok;
  2172	
  2173		new = krealloc(edid, edid_size(edid), GFP_KERNEL);
  2174		if (!new)
  2175			goto fail;
  2176		edid = new;
  2177	
  2178		for (i = 1; i < edid_block_count(edid); i++) {
  2179			void *block = (void *)edid_block_data(edid, i);
  2180	
  2181			status = edid_block_read(block, i, read_block, context);
  2182	
  2183			edid_block_status_print(status, block, i);
  2184	
  2185			if (!edid_block_status_valid(status, edid_block_tag(block))) {
  2186				if (status == EDID_BLOCK_READ_FAIL)
  2187					goto fail;
  2188				invalid_blocks++;
  2189			}
  2190		}
  2191	
  2192		if (invalid_blocks) {
  2193			connector_bad_edid(connector, edid, edid_block_count(edid));
  2194	
  2195			edid = edid_filter_invalid_blocks(edid, invalid_blocks);
  2196		}
  2197	
  2198	ok:
  2199		return edid;
  2200	
  2201	fail:
  2202		kfree(edid);
  2203		return NULL;
  2204	}
  2205	EXPORT_SYMBOL_GPL(drm_do_get_edid);
  2206	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
