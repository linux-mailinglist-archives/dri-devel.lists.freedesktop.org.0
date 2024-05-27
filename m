Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECCF8CF765
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 04:06:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B80810E958;
	Mon, 27 May 2024 02:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="R0I4gFhU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com
 [91.218.175.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C28610E958
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 02:06:30 +0000 (UTC)
X-Envelope-To: lkp@intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1716775587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k7LCmvAxIYOVvpO6R7p76ccCzHXaBGKk9+emyZM3oos=;
 b=R0I4gFhUK6m7i9mSKwrVEjUcuiQ1P348IpC4440HcrJJg7bv6fYwAUySXV/SGhGgW9zlcs
 yRo1ZDvzT9KfhmZN1HyrVdbVP8WmWV6zwxd+Lt9BvZv3HUYlCjZQ1yneLKl0pIaQKGp6zs
 25rFeoQthB26h4E/mFz+m0YD3ZEZe4c=
X-Envelope-To: rfoss@kernel.org
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: llvm@lists.linux.dev
X-Envelope-To: oe-kbuild-all@lists.linux.dev
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-kernel@vger.kernel.org
Message-ID: <db39b18b-b941-44b8-abeb-d06c5cc087d7@linux.dev>
Date: Mon, 27 May 2024 10:06:20 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v6 02/10] drm/bridge: Set firmware node of drm_bridge
 instances automatically
To: kernel test robot <lkp@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240526202115.129049-3-sui.jingfeng@linux.dev>
 <202405270622.VDMbp9FR-lkp@intel.com>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <202405270622.VDMbp9FR-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 5/27/24 07:33, kernel test robot wrote:
> Hi Sui,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on drm-exynos/exynos-drm-next]
> [also build test ERROR on linus/master v6.10-rc1 next-20240523]
> [cannot apply to shawnguo/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/drm-bridge-Allow-using-fwnode-APIs-to-get-the-next-bridge/20240527-042402
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
> patch link:    https://lore.kernel.org/r/20240526202115.129049-3-sui.jingfeng%40linux.dev
> patch subject: [PATCH v6 02/10] drm/bridge: Set firmware node of drm_bridge instances automatically
> config: arm-defconfig (https://download.01.org/0day-ci/archive/20240527/202405270622.VDMbp9FR-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240527/202405270622.VDMbp9FR-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405270622.VDMbp9FR-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/gpu/drm/omapdrm/dss/hdmi5.c:487:49: error: expected identifier
>             drm_bridge_add(&hdmi->bridge, &hdmi->pdev->dev.);
>                                                            ^
>     1 error generated.
> 
> 
> vim +487 drivers/gpu/drm/omapdrm/dss/hdmi5.c
> 
>     480	
>     481	static void hdmi5_bridge_init(struct omap_hdmi *hdmi)
>     482	{
>     483		hdmi->bridge.funcs = &hdmi5_bridge_funcs;
>     484		hdmi->bridge.ops = DRM_BRIDGE_OP_EDID;
>     485		hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>     486	
>   > 487		drm_bridge_add(&hdmi->bridge, &hdmi->pdev->dev.);
>     488	}
>     489	
> 


Sorry, my bad. I have do compile test on ARM64 before posting.
checkpatch.pl report a style problem, then I manually modify this
patch, accidentally add the tail '.' character. Will be fixed
at the next version.

-- 
Best regards
Sui
