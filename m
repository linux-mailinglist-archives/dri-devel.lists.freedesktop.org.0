Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CD168B1FC
	for <lists+dri-devel@lfdr.de>; Sun,  5 Feb 2023 22:44:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD1210E031;
	Sun,  5 Feb 2023 21:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014F310E2A8
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Feb 2023 21:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675633478; x=1707169478;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=Rq8LFqgFGoWnQCFRZ1IyJfutpv0jKwLTyr1DiOi5TvQ=;
 b=VZaX/XeYxRNscNy4y5IMwDXRMygtFlDWs70lw6HpEPLfe+S7ZKrW1eXm
 S7BMnBdjeB1hjYXi3SCIDVuuueQlGAKiDUYVAee/CowfcyzPv2CFpej7w
 3BaaopEqXLfUyPT7fkKSnNEPDmhHg4GNuV9rGF86rfwLpox54WVI65cnj
 qlHh3eT527MK/SMug13/tEBomDE90E8Wlh/sjKPsDhZizlahiaX+2cadV
 V69mQ/5myikeSkxJRA/JxUh6DpuCPJ/lR7bVhht9bWnbmMPZU8vE9sP1o
 9MfPWKmgwrKT6kClBwoOkTKBfaR/WZpeH3k9TYoPFDGaYAnQaL4j/u32+ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="308733367"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; d="scan'208";a="308733367"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2023 13:44:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="774978742"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; d="scan'208";a="774978742"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 05 Feb 2023 13:44:35 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pOmoM-0002Ed-36;
 Sun, 05 Feb 2023 21:44:34 +0000
Date: Mon, 6 Feb 2023 05:43:55 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Riesch <michael.riesch@wolfvision.net>
Subject: [drm-misc:drm-misc-next 8/15]
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2316:8: warning: variable
 'possible_crtcs' is used uninitialized whenever 'if' condition is false
Message-ID: <202302060541.TvQvZvYv-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   8ee3b0e85f6ccd9e6c527bc50eaba774c3bb18d0
commit: 368419a2d429e2438bef333959732c640310bdc7 [8/15] drm/rockchip: vop2: initialize possible_crtcs properly
config: s390-buildonly-randconfig-r002-20230205 (https://download.01.org/0day-ci/archive/20230206/202302060541.TvQvZvYv-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        git remote add drm-misc git://anongit.freedesktop.org/drm/drm-misc
        git fetch --no-tags drm-misc drm-misc-next
        git checkout 368419a2d429e2438bef333959732c640310bdc7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/drm/rockchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:10:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:10:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:10:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2316:8: warning: variable 'possible_crtcs' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                           if (vp) {
                               ^~
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2330:36: note: uninitialized use occurs here
                   ret = vop2_plane_init(vop2, win, possible_crtcs);
                                                    ^~~~~~~~~~~~~~
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2316:4: note: remove the 'if' if its condition is always true
                           if (vp) {
                           ^~~~~~~~
   drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:2298:21: note: initialize the variable 'possible_crtcs' to silence this warning
                   u32 possible_crtcs;
                                     ^
                                      = 0
   13 warnings generated.


vim +2316 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c

604be85547ce4d Andy Yan       2022-04-22  2247  
604be85547ce4d Andy Yan       2022-04-22  2248  static int vop2_create_crtc(struct vop2 *vop2)
604be85547ce4d Andy Yan       2022-04-22  2249  {
604be85547ce4d Andy Yan       2022-04-22  2250  	const struct vop2_data *vop2_data = vop2->data;
604be85547ce4d Andy Yan       2022-04-22  2251  	struct drm_device *drm = vop2->drm;
604be85547ce4d Andy Yan       2022-04-22  2252  	struct device *dev = vop2->dev;
604be85547ce4d Andy Yan       2022-04-22  2253  	struct drm_plane *plane;
604be85547ce4d Andy Yan       2022-04-22  2254  	struct device_node *port;
604be85547ce4d Andy Yan       2022-04-22  2255  	struct vop2_video_port *vp;
604be85547ce4d Andy Yan       2022-04-22  2256  	int i, nvp, nvps = 0;
604be85547ce4d Andy Yan       2022-04-22  2257  	int ret;
604be85547ce4d Andy Yan       2022-04-22  2258  
604be85547ce4d Andy Yan       2022-04-22  2259  	for (i = 0; i < vop2_data->nr_vps; i++) {
604be85547ce4d Andy Yan       2022-04-22  2260  		const struct vop2_video_port_data *vp_data;
604be85547ce4d Andy Yan       2022-04-22  2261  		struct device_node *np;
604be85547ce4d Andy Yan       2022-04-22  2262  		char dclk_name[9];
604be85547ce4d Andy Yan       2022-04-22  2263  
604be85547ce4d Andy Yan       2022-04-22  2264  		vp_data = &vop2_data->vp[i];
604be85547ce4d Andy Yan       2022-04-22  2265  		vp = &vop2->vps[i];
604be85547ce4d Andy Yan       2022-04-22  2266  		vp->vop2 = vop2;
604be85547ce4d Andy Yan       2022-04-22  2267  		vp->id = vp_data->id;
604be85547ce4d Andy Yan       2022-04-22  2268  		vp->regs = vp_data->regs;
604be85547ce4d Andy Yan       2022-04-22  2269  		vp->data = vp_data;
604be85547ce4d Andy Yan       2022-04-22  2270  
604be85547ce4d Andy Yan       2022-04-22  2271  		snprintf(dclk_name, sizeof(dclk_name), "dclk_vp%d", vp->id);
604be85547ce4d Andy Yan       2022-04-22  2272  		vp->dclk = devm_clk_get(vop2->dev, dclk_name);
604be85547ce4d Andy Yan       2022-04-22  2273  		if (IS_ERR(vp->dclk)) {
604be85547ce4d Andy Yan       2022-04-22  2274  			drm_err(vop2->drm, "failed to get %s\n", dclk_name);
604be85547ce4d Andy Yan       2022-04-22  2275  			return PTR_ERR(vp->dclk);
604be85547ce4d Andy Yan       2022-04-22  2276  		}
604be85547ce4d Andy Yan       2022-04-22  2277  
604be85547ce4d Andy Yan       2022-04-22  2278  		np = of_graph_get_remote_node(dev->of_node, i, -1);
604be85547ce4d Andy Yan       2022-04-22  2279  		if (!np) {
604be85547ce4d Andy Yan       2022-04-22  2280  			drm_dbg(vop2->drm, "%s: No remote for vp%d\n", __func__, i);
604be85547ce4d Andy Yan       2022-04-22  2281  			continue;
604be85547ce4d Andy Yan       2022-04-22  2282  		}
604be85547ce4d Andy Yan       2022-04-22  2283  		of_node_put(np);
604be85547ce4d Andy Yan       2022-04-22  2284  
604be85547ce4d Andy Yan       2022-04-22  2285  		port = of_graph_get_port_by_id(dev->of_node, i);
604be85547ce4d Andy Yan       2022-04-22  2286  		if (!port) {
604be85547ce4d Andy Yan       2022-04-22  2287  			drm_err(vop2->drm, "no port node found for video_port%d\n", i);
604be85547ce4d Andy Yan       2022-04-22  2288  			return -ENOENT;
604be85547ce4d Andy Yan       2022-04-22  2289  		}
604be85547ce4d Andy Yan       2022-04-22  2290  
604be85547ce4d Andy Yan       2022-04-22  2291  		vp->crtc.port = port;
604be85547ce4d Andy Yan       2022-04-22  2292  		nvps++;
604be85547ce4d Andy Yan       2022-04-22  2293  	}
604be85547ce4d Andy Yan       2022-04-22  2294  
604be85547ce4d Andy Yan       2022-04-22  2295  	nvp = 0;
604be85547ce4d Andy Yan       2022-04-22  2296  	for (i = 0; i < vop2->registered_num_wins; i++) {
604be85547ce4d Andy Yan       2022-04-22  2297  		struct vop2_win *win = &vop2->win[i];
604be85547ce4d Andy Yan       2022-04-22  2298  		u32 possible_crtcs;
604be85547ce4d Andy Yan       2022-04-22  2299  
604be85547ce4d Andy Yan       2022-04-22  2300  		if (vop2->data->soc_id == 3566) {
604be85547ce4d Andy Yan       2022-04-22  2301  			/*
604be85547ce4d Andy Yan       2022-04-22  2302  			 * On RK3566 these windows don't have an independent
604be85547ce4d Andy Yan       2022-04-22  2303  			 * framebuffer. They share the framebuffer with smart0,
604be85547ce4d Andy Yan       2022-04-22  2304  			 * esmart0 and cluster0 respectively.
604be85547ce4d Andy Yan       2022-04-22  2305  			 */
604be85547ce4d Andy Yan       2022-04-22  2306  			switch (win->data->phys_id) {
604be85547ce4d Andy Yan       2022-04-22  2307  			case ROCKCHIP_VOP2_SMART1:
604be85547ce4d Andy Yan       2022-04-22  2308  			case ROCKCHIP_VOP2_ESMART1:
604be85547ce4d Andy Yan       2022-04-22  2309  			case ROCKCHIP_VOP2_CLUSTER1:
604be85547ce4d Andy Yan       2022-04-22  2310  				continue;
604be85547ce4d Andy Yan       2022-04-22  2311  			}
604be85547ce4d Andy Yan       2022-04-22  2312  		}
604be85547ce4d Andy Yan       2022-04-22  2313  
604be85547ce4d Andy Yan       2022-04-22  2314  		if (win->type == DRM_PLANE_TYPE_PRIMARY) {
604be85547ce4d Andy Yan       2022-04-22  2315  			vp = find_vp_without_primary(vop2);
604be85547ce4d Andy Yan       2022-04-22 @2316  			if (vp) {
604be85547ce4d Andy Yan       2022-04-22  2317  				possible_crtcs = BIT(nvp);
604be85547ce4d Andy Yan       2022-04-22  2318  				vp->primary_plane = win;
604be85547ce4d Andy Yan       2022-04-22  2319  				nvp++;
604be85547ce4d Andy Yan       2022-04-22  2320  			} else {
604be85547ce4d Andy Yan       2022-04-22  2321  				/* change the unused primary window to overlay window */
604be85547ce4d Andy Yan       2022-04-22  2322  				win->type = DRM_PLANE_TYPE_OVERLAY;
604be85547ce4d Andy Yan       2022-04-22  2323  			}
368419a2d429e2 Michael Riesch 2023-01-24  2324  		} else if (win->type == DRM_PLANE_TYPE_OVERLAY) {
604be85547ce4d Andy Yan       2022-04-22  2325  			possible_crtcs = (1 << nvps) - 1;
368419a2d429e2 Michael Riesch 2023-01-24  2326  		} else {
368419a2d429e2 Michael Riesch 2023-01-24  2327  			possible_crtcs = 0;
368419a2d429e2 Michael Riesch 2023-01-24  2328  		}
604be85547ce4d Andy Yan       2022-04-22  2329  
604be85547ce4d Andy Yan       2022-04-22  2330  		ret = vop2_plane_init(vop2, win, possible_crtcs);
604be85547ce4d Andy Yan       2022-04-22  2331  		if (ret) {
604be85547ce4d Andy Yan       2022-04-22  2332  			drm_err(vop2->drm, "failed to init plane %s: %d\n",
604be85547ce4d Andy Yan       2022-04-22  2333  				win->data->name, ret);
604be85547ce4d Andy Yan       2022-04-22  2334  			return ret;
604be85547ce4d Andy Yan       2022-04-22  2335  		}
604be85547ce4d Andy Yan       2022-04-22  2336  	}
604be85547ce4d Andy Yan       2022-04-22  2337  
604be85547ce4d Andy Yan       2022-04-22  2338  	for (i = 0; i < vop2_data->nr_vps; i++) {
604be85547ce4d Andy Yan       2022-04-22  2339  		vp = &vop2->vps[i];
604be85547ce4d Andy Yan       2022-04-22  2340  
604be85547ce4d Andy Yan       2022-04-22  2341  		if (!vp->crtc.port)
604be85547ce4d Andy Yan       2022-04-22  2342  			continue;
604be85547ce4d Andy Yan       2022-04-22  2343  
604be85547ce4d Andy Yan       2022-04-22  2344  		plane = &vp->primary_plane->base;
604be85547ce4d Andy Yan       2022-04-22  2345  
604be85547ce4d Andy Yan       2022-04-22  2346  		ret = drm_crtc_init_with_planes(drm, &vp->crtc, plane, NULL,
604be85547ce4d Andy Yan       2022-04-22  2347  						&vop2_crtc_funcs,
604be85547ce4d Andy Yan       2022-04-22  2348  						"video_port%d", vp->id);
604be85547ce4d Andy Yan       2022-04-22  2349  		if (ret) {
604be85547ce4d Andy Yan       2022-04-22  2350  			drm_err(vop2->drm, "crtc init for video_port%d failed\n", i);
604be85547ce4d Andy Yan       2022-04-22  2351  			return ret;
604be85547ce4d Andy Yan       2022-04-22  2352  		}
604be85547ce4d Andy Yan       2022-04-22  2353  
604be85547ce4d Andy Yan       2022-04-22  2354  		drm_crtc_helper_add(&vp->crtc, &vop2_crtc_helper_funcs);
604be85547ce4d Andy Yan       2022-04-22  2355  
604be85547ce4d Andy Yan       2022-04-22  2356  		init_completion(&vp->dsp_hold_completion);
604be85547ce4d Andy Yan       2022-04-22  2357  	}
604be85547ce4d Andy Yan       2022-04-22  2358  
604be85547ce4d Andy Yan       2022-04-22  2359  	/*
604be85547ce4d Andy Yan       2022-04-22  2360  	 * On the VOP2 it's very hard to change the number of layers on a VP
604be85547ce4d Andy Yan       2022-04-22  2361  	 * during runtime, so we distribute the layers equally over the used
604be85547ce4d Andy Yan       2022-04-22  2362  	 * VPs
604be85547ce4d Andy Yan       2022-04-22  2363  	 */
604be85547ce4d Andy Yan       2022-04-22  2364  	for (i = 0; i < vop2->data->nr_vps; i++) {
604be85547ce4d Andy Yan       2022-04-22  2365  		struct vop2_video_port *vp = &vop2->vps[i];
604be85547ce4d Andy Yan       2022-04-22  2366  
604be85547ce4d Andy Yan       2022-04-22  2367  		if (vp->crtc.port)
604be85547ce4d Andy Yan       2022-04-22  2368  			vp->nlayers = NR_LAYERS / nvps;
604be85547ce4d Andy Yan       2022-04-22  2369  	}
604be85547ce4d Andy Yan       2022-04-22  2370  
604be85547ce4d Andy Yan       2022-04-22  2371  	return 0;
604be85547ce4d Andy Yan       2022-04-22  2372  }
604be85547ce4d Andy Yan       2022-04-22  2373  

:::::: The code at line 2316 was first introduced by commit
:::::: 604be85547ce4d61b89292d2f9a78c721b778c16 drm/rockchip: Add VOP2 driver

:::::: TO: Andy Yan <andy.yan@rock-chips.com>
:::::: CC: Heiko Stuebner <heiko@sntech.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
