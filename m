Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5434F9D7B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 21:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B35010F1E6;
	Fri,  8 Apr 2022 19:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1479310F1E6
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 19:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649444890; x=1680980890;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AWYekLkV9Dk0OIItlmpZ6xPEjkw9ZzDl/PwK+X2pq44=;
 b=I1QOHrdEHmqK1sUo2QIZ1jl/Dud1v8RgW7jCzIxlLqAzK6qvibrAmHBy
 DJQJ+Kc1X6/osZbOg67VyDgbECZj1VtSWIMY5khVWw5RSOY3Q8upusOdv
 i7KzcQdTBrtBfOCzjBzMgkfP+NcabXA8Uf5jLFm7IlIk7F0sUzcMPCh0H
 VlflFX6xdgcZS7mK6CVrMOhmYJgqjnUdLfPT8mHZuzUqGXKa9WK6rsLXj
 qxIiEt6AyPWjwh2NWVi3dwAEvfWhxjGfOYbdiQzhg1dktVQEXTfbQUg03
 bAZNIR/9w8439jMsNonnCdB7HHvcQAvngYXCAv+48aFyGmVLEkndMTHgc A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10311"; a="261356564"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="261356564"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2022 12:08:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; d="scan'208";a="659594181"
Received: from lkp-server02.sh.intel.com (HELO 7e80bc2a00a0) ([10.239.97.151])
 by orsmga004.jf.intel.com with ESMTP; 08 Apr 2022 12:08:04 -0700
Received: from kbuild by 7e80bc2a00a0 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nctxj-0000Yk-DD;
 Fri, 08 Apr 2022 19:08:03 +0000
Date: Sat, 9 Apr 2022 03:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Hans Verkuil <hverkuil@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Subject: Re: [PATCH v9, 16/17] media: mediatek: vcodec: support stateless VP9
 decoding
Message-ID: <202204090240.SZpTTylK-lkp@intel.com>
References: <20220408120240.29571-17-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408120240.29571-17-yunfei.dong@mediatek.com>
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 kbuild-all@lists.01.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yunfei,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.18-rc1 next-20220408]
[cannot apply to remoteproc/rproc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunfei-Dong/media-mediatek-vcodec-Add-vdec-enable-disable-hardware-helpers/20220408-210244
base:   git://linuxtv.org/media_tree.git master
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20220409/202204090240.SZpTTylK-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/251c7c77f6690881357df39867a32a03eb7db3b7
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yunfei-Dong/media-mediatek-vcodec-Add-vdec-enable-disable-hardware-helpers/20220408-210244
        git checkout 251c7c77f6690881357df39867a32a03eb7db3b7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/media/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c:12:
   drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c: In function 'vdec_vp9_slice_lat_decode':
>> drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:29:21: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
      29 | #define pr_fmt(fmt) "%s(),%d: " fmt, __func__, __LINE__
         |                     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:29: note: in expansion of macro 'pr_fmt'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:9: note: in expansion of macro '__dynamic_func_call'
     152 |         __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:162:9: note: in expansion of macro '_dynamic_func_call'
     162 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:570:9: note: in expansion of macro 'dynamic_pr_debug'
     570 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:45:9: note: in expansion of macro 'pr_debug'
      45 |         pr_debug("[MTK_VCODEC][%d]: " fmt "\n",                 \
         |         ^~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c:1938:9: note: in expansion of macro 'mtk_vcodec_debug'
    1938 |         mtk_vcodec_debug(instance, "lat dma addr: 0x%lx 0x%lx\n",
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:29:21: warning: format '%lx' expects argument of type 'long unsigned int', but argument 7 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
      29 | #define pr_fmt(fmt) "%s(),%d: " fmt, __func__, __LINE__
         |                     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:29: note: in expansion of macro 'pr_fmt'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:9: note: in expansion of macro '__dynamic_func_call'
     152 |         __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:162:9: note: in expansion of macro '_dynamic_func_call'
     162 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:570:9: note: in expansion of macro 'dynamic_pr_debug'
     570 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:45:9: note: in expansion of macro 'pr_debug'
      45 |         pr_debug("[MTK_VCODEC][%d]: " fmt "\n",                 \
         |         ^~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c:1938:9: note: in expansion of macro 'mtk_vcodec_debug'
    1938 |         mtk_vcodec_debug(instance, "lat dma addr: 0x%lx 0x%lx\n",
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c: In function 'vdec_vp9_slice_core_decode':
>> drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:29:21: warning: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'dma_addr_t' {aka 'unsigned int'} [-Wformat=]
      29 | #define pr_fmt(fmt) "%s(),%d: " fmt, __func__, __LINE__
         |                     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:134:29: note: in expansion of macro 'pr_fmt'
     134 |                 func(&id, ##__VA_ARGS__);               \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:152:9: note: in expansion of macro '__dynamic_func_call'
     152 |         __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:162:9: note: in expansion of macro '_dynamic_func_call'
     162 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:570:9: note: in expansion of macro 'dynamic_pr_debug'
     570 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h:45:9: note: in expansion of macro 'pr_debug'
      45 |         pr_debug("[MTK_VCODEC][%d]: " fmt "\n",                 \
         |         ^~~~~~~~
   drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_req_lat_if.c:2007:9: note: in expansion of macro 'mtk_vcodec_debug'
    2007 |         mtk_vcodec_debug(instance, "core dma_addr_end 0x%lx\n", pfc->vsi.trans.dma_addr_end);
         |         ^~~~~~~~~~~~~~~~


vim +29 drivers/media/platform/mediatek/vcodec/vdec/../mtk_vcodec_util.h

4e855a6efa5470 drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h Tiffany Lin      2016-05-03  27  
71c789760ff9ba drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h Dafna Hirschfeld 2021-11-17  28  #undef pr_fmt
71c789760ff9ba drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h Dafna Hirschfeld 2021-11-17 @29  #define pr_fmt(fmt) "%s(),%d: " fmt, __func__, __LINE__
4e855a6efa5470 drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h Tiffany Lin      2016-05-03  30  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
