Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120E496A4EF
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 18:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A016810E047;
	Tue,  3 Sep 2024 16:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W9uUazat";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C8610E047
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 16:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725382765; x=1756918765;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dPccbiHVTbReszo4effFnD48owgl2gfnw4WAXijn0cY=;
 b=W9uUazatP2jY3Xie+egly6IwiLGg6xF1+LjVhwVubJRIDUMA3ubV5c7T
 IEGPPdpQhVYMHYLwuoDwkUBFk5SLTzlB55K6p6i6GanbENjfhraSVrW2a
 o/1FPTmXwKhkkY9OSNk2B2gK/0jIt+3f+/fyXPRC5O2JYIn5NjJoCuwA4
 sdYcLVpep3z/LHS93MLrrnB+PrVc0DCGqYG1VaPfhL8qlieb9FpTQYd0/
 sfnx1xb7cwJ5YBtBpxY8vFfnHqUzOwdDRIDtseFeRYMrLX0UWmJsDzsQD
 Z0POHcMdELu4YVLfMY9ZXKdgaUyzCfOrSq7eUiPHoG0Z9Y0N0u/Vg7tLc Q==;
X-CSE-ConnectionGUID: QKeC/QWrSM2ocW9QKTwvxw==
X-CSE-MsgGUID: U7JCA3KbTje31ZdI+sTntw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41491607"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="41491607"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 09:59:24 -0700
X-CSE-ConnectionGUID: 7mMokwraQCuMFQeW2tP+aQ==
X-CSE-MsgGUID: 08W5/tC9TZqreBobmS1Yew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208";a="69364471"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 03 Sep 2024 09:59:21 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1slWsA-0006vv-2L;
 Tue, 03 Sep 2024 16:59:18 +0000
Date: Wed, 4 Sep 2024 00:59:12 +0800
From: kernel test robot <lkp@intel.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
 neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 quic_jesszhan@quicinc.com, skhan@linuxfoundation.org, rbmarliere@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: hx83112a: Switch to wrapped mipi_dsi functions
Message-ID: <202409040049.2hf8jrZG-lkp@intel.com>
References: <20240902170153.34512-1-abhishektamboli9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902170153.34512-1-abhishektamboli9@gmail.com>
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

Hi Abhishek,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.11-rc6 next-20240903]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abhishek-Tamboli/drm-panel-hx83112a-Switch-to-wrapped-mipi_dsi-functions/20240903-010317
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240902170153.34512-1-abhishektamboli9%40gmail.com
patch subject: [PATCH] drm/panel: hx83112a: Switch to wrapped mipi_dsi functions
config: x86_64-randconfig-005-20240903 (https://download.01.org/0day-ci/archive/20240904/202409040049.2hf8jrZG-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040049.2hf8jrZG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040049.2hf8jrZG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/panel/panel-himax-hx83112a.c:63:2: error: use of undeclared identifier 'dsi'
      63 |         dsi->mode_flags |= MIPI_DSI_MODE_LPM;
         |         ^
   drivers/gpu/drm/panel/panel-himax-hx83112a.c:197:2: error: use of undeclared identifier 'dsi'
     197 |         dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
         |         ^
   2 errors generated.


vim +/dsi +63 drivers/gpu/drm/panel/panel-himax-hx83112a.c

654f26a0f43cfd3 Luca Weiss       2024-02-16   58  
654f26a0f43cfd3 Luca Weiss       2024-02-16   59  static int hx83112a_on(struct hx83112a_panel *ctx)
654f26a0f43cfd3 Luca Weiss       2024-02-16   60  {
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02   61  	struct mipi_dsi_multi_context dsi_ctx = {.dsi = ctx->dsi};
654f26a0f43cfd3 Luca Weiss       2024-02-16   62  
654f26a0f43cfd3 Luca Weiss       2024-02-16  @63  	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
654f26a0f43cfd3 Luca Weiss       2024-02-16   64  
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02   65  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETEXTC, 0x83, 0x11, 0x2a);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02   66  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPOWER1,
654f26a0f43cfd3 Luca Weiss       2024-02-16   67  			       0x08, 0x28, 0x28, 0x83, 0x83, 0x4c, 0x4f, 0x33);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02   68  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDISP,
654f26a0f43cfd3 Luca Weiss       2024-02-16   69  			       0x00, 0x02, 0x00, 0x90, 0x24, 0x00, 0x08, 0x19,
654f26a0f43cfd3 Luca Weiss       2024-02-16   70  			       0xea, 0x11, 0x11, 0x00, 0x11, 0xa3);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02   71  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDRV,
654f26a0f43cfd3 Luca Weiss       2024-02-16   72  			       0x58, 0x68, 0x58, 0x68, 0x0f, 0xef, 0x0b, 0xc0,
654f26a0f43cfd3 Luca Weiss       2024-02-16   73  			       0x0b, 0xc0, 0x0b, 0xc0, 0x00, 0xff, 0x00, 0xff,
654f26a0f43cfd3 Luca Weiss       2024-02-16   74  			       0x00, 0x00, 0x14, 0x15, 0x00, 0x29, 0x11, 0x07,
654f26a0f43cfd3 Luca Weiss       2024-02-16   75  			       0x12, 0x00, 0x29);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02   76  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02   77  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDRV,
654f26a0f43cfd3 Luca Weiss       2024-02-16   78  			       0x00, 0x12, 0x12, 0x11, 0x88, 0x12, 0x12, 0x00,
654f26a0f43cfd3 Luca Weiss       2024-02-16   79  			       0x53);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02   80  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02   81  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x03);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02   82  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT,
654f26a0f43cfd3 Luca Weiss       2024-02-16   83  			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
654f26a0f43cfd3 Luca Weiss       2024-02-16   84  			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
654f26a0f43cfd3 Luca Weiss       2024-02-16   85  			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
654f26a0f43cfd3 Luca Weiss       2024-02-16   86  			       0x84, 0x7c, 0x74, 0x6b, 0x62, 0x5a, 0x51, 0x49,
654f26a0f43cfd3 Luca Weiss       2024-02-16   87  			       0x41, 0x39, 0x31, 0x29, 0x21, 0x19, 0x12, 0x0a,
654f26a0f43cfd3 Luca Weiss       2024-02-16   88  			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
654f26a0f43cfd3 Luca Weiss       2024-02-16   89  			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
654f26a0f43cfd3 Luca Weiss       2024-02-16   90  			       0x40);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02   91  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02   92  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT,
654f26a0f43cfd3 Luca Weiss       2024-02-16   93  			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
654f26a0f43cfd3 Luca Weiss       2024-02-16   94  			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
654f26a0f43cfd3 Luca Weiss       2024-02-16   95  			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
654f26a0f43cfd3 Luca Weiss       2024-02-16   96  			       0x84, 0x7c, 0x74, 0x6b, 0x62, 0x5a, 0x51, 0x49,
654f26a0f43cfd3 Luca Weiss       2024-02-16   97  			       0x41, 0x39, 0x31, 0x29, 0x21, 0x19, 0x12, 0x0a,
654f26a0f43cfd3 Luca Weiss       2024-02-16   98  			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
654f26a0f43cfd3 Luca Weiss       2024-02-16   99  			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
654f26a0f43cfd3 Luca Weiss       2024-02-16  100  			       0x40);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  101  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  102  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT,
654f26a0f43cfd3 Luca Weiss       2024-02-16  103  			       0xff, 0xfe, 0xfb, 0xf8, 0xf4, 0xf1, 0xed, 0xe6,
654f26a0f43cfd3 Luca Weiss       2024-02-16  104  			       0xe2, 0xde, 0xdb, 0xd6, 0xd3, 0xcf, 0xca, 0xc6,
654f26a0f43cfd3 Luca Weiss       2024-02-16  105  			       0xc2, 0xbe, 0xb9, 0xb0, 0xa7, 0x9e, 0x96, 0x8d,
654f26a0f43cfd3 Luca Weiss       2024-02-16  106  			       0x84, 0x7c, 0x74, 0x6b, 0x62, 0x5a, 0x51, 0x49,
654f26a0f43cfd3 Luca Weiss       2024-02-16  107  			       0x41, 0x39, 0x31, 0x29, 0x21, 0x19, 0x12, 0x0a,
654f26a0f43cfd3 Luca Weiss       2024-02-16  108  			       0x06, 0x05, 0x02, 0x01, 0x00, 0x00, 0xc9, 0xb3,
654f26a0f43cfd3 Luca Weiss       2024-02-16  109  			       0x08, 0x0e, 0xf2, 0xe1, 0x59, 0xf4, 0x22, 0xad,
654f26a0f43cfd3 Luca Weiss       2024-02-16  110  			       0x40);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  111  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  112  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETDGCLUT, 0x01);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  113  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTCON,
654f26a0f43cfd3 Luca Weiss       2024-02-16  114  			       0x70, 0x00, 0x04, 0xe0, 0x33, 0x00);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  115  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPANEL, 0x08);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  116  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPOWER2, 0x2b, 0x2b);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  117  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP0,
654f26a0f43cfd3 Luca Weiss       2024-02-16  118  			       0x80, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x08,
654f26a0f43cfd3 Luca Weiss       2024-02-16  119  			       0x08, 0x03, 0x03, 0x22, 0x18, 0x07, 0x07, 0x07,
654f26a0f43cfd3 Luca Weiss       2024-02-16  120  			       0x07, 0x32, 0x10, 0x06, 0x00, 0x06, 0x32, 0x10,
654f26a0f43cfd3 Luca Weiss       2024-02-16  121  			       0x07, 0x00, 0x07, 0x32, 0x19, 0x31, 0x09, 0x31,
654f26a0f43cfd3 Luca Weiss       2024-02-16  122  			       0x00, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x08,
654f26a0f43cfd3 Luca Weiss       2024-02-16  123  			       0x09, 0x30, 0x00, 0x00, 0x00, 0x06, 0x0d, 0x00,
654f26a0f43cfd3 Luca Weiss       2024-02-16  124  			       0x0f);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  125  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  126  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP0,
654f26a0f43cfd3 Luca Weiss       2024-02-16  127  			       0x00, 0x00, 0x19, 0x10, 0x00, 0x0a, 0x00, 0x81);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  128  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  129  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP1,
654f26a0f43cfd3 Luca Weiss       2024-02-16  130  			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
654f26a0f43cfd3 Luca Weiss       2024-02-16  131  			       0xc0, 0xc0, 0x18, 0x18, 0x19, 0x19, 0x18, 0x18,
654f26a0f43cfd3 Luca Weiss       2024-02-16  132  			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x3f, 0x3f,
654f26a0f43cfd3 Luca Weiss       2024-02-16  133  			       0x28, 0x28, 0x24, 0x24, 0x02, 0x03, 0x02, 0x03,
654f26a0f43cfd3 Luca Weiss       2024-02-16  134  			       0x00, 0x01, 0x00, 0x01, 0x31, 0x31, 0x31, 0x31,
654f26a0f43cfd3 Luca Weiss       2024-02-16  135  			       0x30, 0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  136  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP2,
654f26a0f43cfd3 Luca Weiss       2024-02-16  137  			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
654f26a0f43cfd3 Luca Weiss       2024-02-16  138  			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x19, 0x19,
654f26a0f43cfd3 Luca Weiss       2024-02-16  139  			       0x40, 0x40, 0x18, 0x18, 0x18, 0x18, 0x3f, 0x3f,
654f26a0f43cfd3 Luca Weiss       2024-02-16  140  			       0x24, 0x24, 0x28, 0x28, 0x01, 0x00, 0x01, 0x00,
654f26a0f43cfd3 Luca Weiss       2024-02-16  141  			       0x03, 0x02, 0x03, 0x02, 0x31, 0x31, 0x31, 0x31,
654f26a0f43cfd3 Luca Weiss       2024-02-16  142  			       0x30, 0x30, 0x30, 0x30, 0x2f, 0x2f, 0x2f, 0x2f);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  143  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
654f26a0f43cfd3 Luca Weiss       2024-02-16  144  			       0xaa, 0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea,
654f26a0f43cfd3 Luca Weiss       2024-02-16  145  			       0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xea, 0xab, 0xaa,
654f26a0f43cfd3 Luca Weiss       2024-02-16  146  			       0xaa, 0xaa, 0xaa, 0xea, 0xab, 0xaa, 0xaa, 0xaa);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  147  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  148  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
654f26a0f43cfd3 Luca Weiss       2024-02-16  149  			       0xaa, 0x2e, 0x28, 0x00, 0x00, 0x00, 0xaa, 0x2e,
654f26a0f43cfd3 Luca Weiss       2024-02-16  150  			       0x28, 0x00, 0x00, 0x00, 0xaa, 0xee, 0xaa, 0xaa,
654f26a0f43cfd3 Luca Weiss       2024-02-16  151  			       0xaa, 0xaa, 0xaa, 0xee, 0xaa, 0xaa, 0xaa, 0xaa);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  152  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  153  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
654f26a0f43cfd3 Luca Weiss       2024-02-16  154  			       0xaa, 0xff, 0xff, 0xff, 0xff, 0xff, 0xaa, 0xff,
654f26a0f43cfd3 Luca Weiss       2024-02-16  155  			       0xff, 0xff, 0xff, 0xff);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  156  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x03);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  157  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETGIP3,
654f26a0f43cfd3 Luca Weiss       2024-02-16  158  			       0xaa, 0xaa, 0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
654f26a0f43cfd3 Luca Weiss       2024-02-16  159  			       0xea, 0xaa, 0xaa, 0xaa, 0xaa, 0xff, 0xff, 0xff,
654f26a0f43cfd3 Luca Weiss       2024-02-16  160  			       0xff, 0xff, 0xaa, 0xff, 0xff, 0xff, 0xff, 0xff);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  161  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  162  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
654f26a0f43cfd3 Luca Weiss       2024-02-16  163  			       0x0e, 0x0e, 0x1e, 0x65, 0x1c, 0x65, 0x00, 0x50,
654f26a0f43cfd3 Luca Weiss       2024-02-16  164  			       0x20, 0x20, 0x00, 0x00, 0x02, 0x02, 0x02, 0x05,
654f26a0f43cfd3 Luca Weiss       2024-02-16  165  			       0x14, 0x14, 0x32, 0xb9, 0x23, 0xb9, 0x08);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  166  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x01);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  167  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
654f26a0f43cfd3 Luca Weiss       2024-02-16  168  			       0x02, 0x00, 0xa8, 0x01, 0xa8, 0x0d, 0xa4, 0x0e);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  169  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x02);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  170  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETTP1,
654f26a0f43cfd3 Luca Weiss       2024-02-16  171  			       0x00, 0x00, 0x08, 0x00, 0x01, 0x00, 0x00, 0x00,
654f26a0f43cfd3 Luca Weiss       2024-02-16  172  			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
654f26a0f43cfd3 Luca Weiss       2024-02-16  173  			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,
654f26a0f43cfd3 Luca Weiss       2024-02-16  174  			       0x00, 0x00, 0x00, 0x02, 0x00);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  175  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETBANK, 0x00);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  176  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0xc3);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  177  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETCLOCK, 0xd1, 0xd6);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  178  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0x3f);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  179  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0xc6);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  180  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_SETPTBA, 0x37);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  181  	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, HX83112A_UNKNOWN1, 0x3f);
654f26a0f43cfd3 Luca Weiss       2024-02-16  182  
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  183  	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  184  	mipi_dsi_msleep(&dsi_ctx, 150);
654f26a0f43cfd3 Luca Weiss       2024-02-16  185  
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  186  	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  187  	mipi_dsi_msleep(&dsi_ctx, 50);
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  188  
a76c4f29a2e42d1 Abhishek Tamboli 2024-09-02  189  	return dsi_ctx.accum_err;
654f26a0f43cfd3 Luca Weiss       2024-02-16  190  }
654f26a0f43cfd3 Luca Weiss       2024-02-16  191  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
