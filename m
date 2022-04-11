Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528CB4FBDE0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 15:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F069210F5E3;
	Mon, 11 Apr 2022 13:54:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E59710F5E5;
 Mon, 11 Apr 2022 13:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649685290; x=1681221290;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=PAI8D1RVwPWVexSY/tdFEHEQ1kXMR7+TbquMisb3kw0=;
 b=F57zTD/vyMkESp4aEFml3+pzQlgQgHuRMun5+5iWBiHiAkpWQ6s0BGbm
 EjHPt+Z79O/cD1j8jScgVByuccz4a8njelg9d6sI6y0ZA8E/N/h95LYDW
 L6GuXng5dbljWeoabkMIzbUBNBGqI7Da7xKIvEM25up7VWHOIEC6BBNlh
 920gIAd3XPKk3IJxzFNrgr3DDFmYv8I/GDgtn5Zh1Sd+Kh3rEqoYvyszi
 IB1m3Rj31OiUwo8ugmMX3rpdwA6U3etzl4R3OsvWHV3dBycOGP7GCOiEz
 i79Zut8ft0n7XWjbyX5W7+TOjEh8DjYNQzmV8AEy4CNPxK0Zt7fNfHnUh w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="244004114"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="244004114"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 06:54:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="572171502"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 06:54:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [CI v2 12/12] drm/edid: add EDID block count and
 size helpers
In-Reply-To: <202204112019.U9iIZWqP-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <44265d5a3f64e9d7ad9984fee766f68d0b8bd473.1649670305.git.jani.nikula@intel.com>
 <202204112019.U9iIZWqP-lkp@intel.com>
Date: Mon, 11 Apr 2022 16:54:45 +0300
Message-ID: <878rsbiv2y.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Apr 2022, kernel test robot <lkp@intel.com> wrote:
> Hi Jani,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on drm-tip/drm-tip]
> [also build test WARNING on next-20220411]
> [cannot apply to drm/drm-next drm-intel/for-linux-next v5.18-rc2]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-edid-low-level-EDID-block-read-refactoring-etc/20220411-175027
> base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
> config: i386-randconfig-a001-20220411 (https://download.01.org/0day-ci/archive/20220411/202204112019.U9iIZWqP-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f560f06cdfe8aa47b248d8bdc58f947274b)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/ba74d3cc8cc1b6ba4c34a039e797994ddbc77567
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Jani-Nikula/drm-edid-low-level-EDID-block-read-refactoring-etc/20220411-175027
>         git checkout ba74d3cc8cc1b6ba4c34a039e797994ddbc77567
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
>
>>> drivers/gpu/drm/drm_edid.c:2170:6: warning: logical not is only applied to the left hand side of this comparison [-Wlogical-not-parentheses]
>            if (!edid_extension_block_count(edid) == 0)
>                ^                                 ~~
>    drivers/gpu/drm/drm_edid.c:2170:6: note: add parentheses after the '!' to evaluate the comparison first
>            if (!edid_extension_block_count(edid) == 0)
>                ^
>                 (                                    )
>    drivers/gpu/drm/drm_edid.c:2170:6: note: add parentheses around left hand side expression to silence this warning
>            if (!edid_extension_block_count(edid) == 0)
>                ^
>                (                                )
>    1 warning generated.

Whoops, thanks for the report!

BR,
Jani.

>
>
> vim +2170 drivers/gpu/drm/drm_edid.c
>
>   2112	
>   2113	/**
>   2114	 * drm_do_get_edid - get EDID data using a custom EDID block read function
>   2115	 * @connector: connector we're probing
>   2116	 * @get_edid_block: EDID block read function
>   2117	 * @data: private data passed to the block read function
>   2118	 *
>   2119	 * When the I2C adapter connected to the DDC bus is hidden behind a device that
>   2120	 * exposes a different interface to read EDID blocks this function can be used
>   2121	 * to get EDID data using a custom block read function.
>   2122	 *
>   2123	 * As in the general case the DDC bus is accessible by the kernel at the I2C
>   2124	 * level, drivers must make all reasonable efforts to expose it as an I2C
>   2125	 * adapter and use drm_get_edid() instead of abusing this function.
>   2126	 *
>   2127	 * The EDID may be overridden using debugfs override_edid or firmware EDID
>   2128	 * (drm_load_edid_firmware() and drm.edid_firmware parameter), in this priority
>   2129	 * order. Having either of them bypasses actual EDID reads.
>   2130	 *
>   2131	 * Return: Pointer to valid EDID or NULL if we couldn't find any.
>   2132	 */
>   2133	struct edid *drm_do_get_edid(struct drm_connector *connector,
>   2134				     read_block_fn read_block,
>   2135				     void *context)
>   2136	{
>   2137		enum edid_block_status status;
>   2138		int i, invalid_blocks = 0;
>   2139		struct edid *edid, *new;
>   2140	
>   2141		edid = drm_get_override_edid(connector);
>   2142		if (edid)
>   2143			goto ok;
>   2144	
>   2145		edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
>   2146		if (!edid)
>   2147			return NULL;
>   2148	
>   2149		status = edid_block_read(edid, 0, read_block, context);
>   2150	
>   2151		edid_block_status_print(status, edid, 0);
>   2152	
>   2153		if (status == EDID_BLOCK_READ_FAIL)
>   2154			goto fail;
>   2155	
>   2156		/* FIXME: Clarify what a corrupt EDID actually means. */
>   2157		if (status == EDID_BLOCK_OK || status == EDID_BLOCK_VERSION)
>   2158			connector->edid_corrupt = false;
>   2159		else
>   2160			connector->edid_corrupt = true;
>   2161	
>   2162		if (!edid_block_status_valid(status, edid_block_tag(edid))) {
>   2163			if (status == EDID_BLOCK_ZERO)
>   2164				connector->null_edid_counter++;
>   2165	
>   2166			connector_bad_edid(connector, edid, 1);
>   2167			goto fail;
>   2168		}
>   2169	
>> 2170		if (!edid_extension_block_count(edid) == 0)
>   2171			goto ok;
>   2172	
>   2173		new = krealloc(edid, edid_size(edid), GFP_KERNEL);
>   2174		if (!new)
>   2175			goto fail;
>   2176		edid = new;
>   2177	
>   2178		for (i = 1; i < edid_block_count(edid); i++) {
>   2179			void *block = (void *)edid_block_data(edid, i);
>   2180	
>   2181			status = edid_block_read(block, i, read_block, context);
>   2182	
>   2183			edid_block_status_print(status, block, i);
>   2184	
>   2185			if (!edid_block_status_valid(status, edid_block_tag(block))) {
>   2186				if (status == EDID_BLOCK_READ_FAIL)
>   2187					goto fail;
>   2188				invalid_blocks++;
>   2189			}
>   2190		}
>   2191	
>   2192		if (invalid_blocks) {
>   2193			connector_bad_edid(connector, edid, edid_block_count(edid));
>   2194	
>   2195			edid = edid_filter_invalid_blocks(edid, invalid_blocks);
>   2196		}
>   2197	
>   2198	ok:
>   2199		return edid;
>   2200	
>   2201	fail:
>   2202		kfree(edid);
>   2203		return NULL;
>   2204	}
>   2205	EXPORT_SYMBOL_GPL(drm_do_get_edid);
>   2206	

-- 
Jani Nikula, Intel Open Source Graphics Center
