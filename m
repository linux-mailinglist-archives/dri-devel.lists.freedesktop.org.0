Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAAF687EB9B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 16:06:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B811110F90A;
	Mon, 18 Mar 2024 15:06:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="PRAXt+D+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com
 [95.215.58.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27C710F90A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 15:06:54 +0000 (UTC)
Message-ID: <c05fe1c4-569a-4b7d-a53f-938c0b470600@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710774412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pkX+ZZDRxq0hnwohy4/NEYPdtVJTyCK6MVxLwPlhAKI=;
 b=PRAXt+D+9ygCxcSLtqW0JZdUF+ZbKwoCuP2VpeRWiFbzaE58BE6dZXkMbFA8TBwL4mWqHl
 C/KEkQNCVv3s6vT//kUTFU98oxlF4QQNvs8ZPY9GfGFK+W7s6HdaYLSRkD3+2O4sbOZQof
 jkTNslI0N5qHobO4rhRxyCKOjH1TCuY=
Date: Mon, 18 Mar 2024 11:06:51 -0400
MIME-Version: 1.0
Subject: Re: [PATCH 6/6] drm: zynqmp_dp: Add debugfs interface for compliance
 testing
Content-Language: en-US
To: kernel test robot <lkp@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Cc: oe-kbuild-all@lists.linux.dev, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Michal Simek <monstr@monstr.eu>,
 linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>
References: <20240315230916.1759060-7-sean.anderson@linux.dev>
 <202403161837.76okceZN-lkp@intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <202403161837.76okceZN-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
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

On 3/16/24 06:55, kernel test robot wrote:
> Hi Sean,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on v6.8]
> [cannot apply to drm-misc/drm-misc-next linus/master next-20240315]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/drm-zynqmp_dp-Downgrade-log-level-for-aux-retries-message/20240316-071208
> base:   v6.8
> patch link:    https://lore.kernel.org/r/20240315230916.1759060-7-sean.anderson%40linux.dev
> patch subject: [PATCH 6/6] drm: zynqmp_dp: Add debugfs interface for compliance testing
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240316/202403161837.76okceZN-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403161837.76okceZN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202403161837.76okceZN-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    m68k-linux-ld: drivers/gpu/drm/xlnx/zynqmp_dp.o: in function `zynqmp_dp_rate_set':
>>> zynqmp_dp.c:(.text+0x1a7a): undefined reference to `__udivdi3'
> 

Will fix.

--Sean
